Imports Profiles.Contracts.DataContracts
Imports System.Data.SqlClient
Imports System.Transactions

Friend Class NewProfileVersionCommand

    Private mProfileVersionId As Guid
    Private mNewProfileVersionId As Guid
    Private mNewIsPublished As Boolean
    Private mNewIsPublic As Boolean

    Friend Sub New(ByVal request As NewProfileVersionRequest)
        mProfileVersionId = request.ProfileVersionId
        mNewIsPublished = request.IsPublished
        mNewIsPublic = request.IsPublic
        Execute()
    End Sub

    Friend ReadOnly Property NewProfileVersionId() As Guid
        Get
            Return mNewProfileVersionId
        End Get
    End Property

    Private mProfileId As Guid
    Private mVersionMajor As Byte
    Private mVersionMinor As Byte
    Private mIsPublished As Boolean
    Private mTitle As String = String.Empty
    Private mScenarioTitle As String = String.Empty
    Private mIsLatestVersion As Boolean
    Private mEffectiveDateFrom As Date
    Private mParentProfileId As Guid
    Private mIsPublic As Boolean

    Private mAffectedSpeciesList As New List(Of AffectedSpeciesInfo)

    Private Sub Execute()

        Using transaction As New TransactionScope

            Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
                connection.Open()

                GetCurrentVersionDetails(connection)
                If Not mIsLatestVersion Then
                    Throw New InvalidOperationException( _
                        String.Format("Version {0}.{1} is not the latest version of this profile. The profile may have been altered by another user.", _
                        mVersionMajor.ToString(), _
                        mVersionMinor.ToString()) _
                        )
                End If
                If mIsPublished AndAlso mNewIsPublished Then
                    Throw New InvalidOperationException("You cannot publish a profile based on an already published version.")
                End If
                If mNewIsPublic AndAlso (Not mNewIsPublished) Then
                    Throw New InvalidOperationException("You cannot make a draft profile public.")
                End If

                Dim hasActiveSpecies As Boolean = False
                For Each species As AffectedSpeciesInfo In mAffectedSpeciesList
                    If species.AffectedSpeciesType = AffectedSpeciesType.Profiled AndAlso _
                        species.IsActive Then
                        hasActiveSpecies = True
                        Exit For
                    End If
                Next

                If Not hasActiveSpecies Then
                    Throw New InvalidOperationException("You cannot create a new version of this profile as it has no active profiled species.")
                End If

                GetProfileDetails(connection)
                SetNewVersionDetails()
                UpdateCurrentVersionEffectiveDate(connection)
                CreateProfileVersion(connection)
                AddAffectedSpecies(connection)

                'if we are publishing a profile
                If mNewIsPublished Then
                    CalculatePrioritisationScore(connection)
                End If

            End Using
            transaction.Complete()
        End Using

    End Sub

    Private Sub GetCurrentVersionDetails(ByVal connection As SqlConnection)

        Using getCommand As SqlCommand = connection.CreateCommand
            getCommand.CommandType = CommandType.StoredProcedure
            getCommand.CommandText = "spgProfileVersionInfoById"
            getCommand.Parameters.AddWithValue("@Id", mProfileVersionId)

            Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)
                While reader.Read()
                    mProfileId = reader.GetGuid(1)
                    mTitle = reader.GetString(2)
                    mVersionMajor = reader.GetByte(3)
                    mVersionMinor = reader.GetByte(4)
                    mIsPublished = Not (reader.GetString(5) = "Draft")
                    mIsLatestVersion = reader.GetBoolean(8)
                    mScenarioTitle = reader.GetString(9)
                    mParentProfileId = reader.GetGuid(10)
                End While
                If reader.NextResult() Then
                    While reader.Read()
                        mAffectedSpeciesList.Add(New AffectedSpeciesInfo(reader.GetGuid(0), _
                                                                CType(System.Enum.Parse(GetType(AffectedSpeciesType), _
                                                                reader.GetString(2), False), AffectedSpeciesType), _
                                                                reader.GetBoolean(3)))
                    End While
                End If
            End Using
        End Using

    End Sub

    Private Sub GetProfileDetails(ByVal connection As SqlConnection)

        Using getCommand As SqlCommand = connection.CreateCommand
            getCommand.CommandType = CommandType.StoredProcedure
            getCommand.CommandText = "spgProfile"
            getCommand.Parameters.AddWithValue("@ProfileId", mProfileId)

            Using reader As New Data.SafeDataReader(getCommand.ExecuteReader)

                'get profile information
                While reader.Read()
                    If IsWhatIfScenario() Then
                        mTitle = reader.GetString(4)
                    Else
                        mTitle = reader.GetString(1)
                    End If
                    mScenarioTitle = reader.GetString(2)
                End While

            End Using

        End Using 'getCommand

    End Sub

    Private Function IsWhatIfScenario() As Boolean
        Return Not mParentProfileId.Equals(Guid.Empty)
    End Function

    Private Sub SetNewVersionDetails()

        'alter the profile version properties to reflect the new version
        mNewProfileVersionId = Guid.NewGuid()
        If mNewIsPublished Then
            mVersionMajor += CByte(1)
            mVersionMinor = 0
        Else
            mVersionMinor += CByte(1)
        End If
        mEffectiveDateFrom = Date.Today
        mIsPublic = mNewIsPublic

    End Sub

    Private Sub UpdateCurrentVersionEffectiveDate(ByVal connection As SqlConnection)

        Using updateEffectiveDateCommand As SqlCommand = connection.CreateCommand
            updateEffectiveDateCommand.CommandType = CommandType.StoredProcedure
            updateEffectiveDateCommand.CommandText = "sppProfileVersionCurrency"
            updateEffectiveDateCommand.Parameters.AddWithValue("@ProfileVersionId", mProfileVersionId)
            If mNewIsPublished Then
                updateEffectiveDateCommand.Parameters.AddWithValue("@State", "Published")
            Else
                updateEffectiveDateCommand.Parameters.AddWithValue("@State", "Draft")
            End If
            updateEffectiveDateCommand.Parameters.AddWithValue("@EffectiveDateTo", mEffectiveDateFrom)
            updateEffectiveDateCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Sub CreateProfileVersion(ByVal connection As SqlConnection)

        Using createProfileVersionCommand As SqlCommand = connection.CreateCommand
            createProfileVersionCommand.CommandType = CommandType.StoredProcedure
            createProfileVersionCommand.CommandText = "spiProfileVersion"
            createProfileVersionCommand.Parameters.AddWithValue("@ProfileVersionId", mNewProfileVersionId)
            createProfileVersionCommand.Parameters.AddWithValue("@ProfileId", mProfileId)
            createProfileVersionCommand.Parameters.AddWithValue("@Title", mTitle)
            If mScenarioTitle.Length > 0 Then
                createProfileVersionCommand.Parameters.AddWithValue("@ScenarioTitle", mScenarioTitle)
            End If
            createProfileVersionCommand.Parameters.AddWithValue("@VersionMajor", mVersionMajor)
            createProfileVersionCommand.Parameters.AddWithValue("@VersionMinor", mVersionMinor)
            If mNewIsPublished Then
                createProfileVersionCommand.Parameters.AddWithValue("@State", "Published")
            Else
                createProfileVersionCommand.Parameters.AddWithValue("@State", "Draft")
            End If
            createProfileVersionCommand.Parameters.AddWithValue("@EffectiveDateFrom", mEffectiveDateFrom)
            createProfileVersionCommand.Parameters.AddWithValue("@CloneProfileVersionId", mProfileVersionId)
            createProfileVersionCommand.Parameters.AddWithValue("@IsPublic", mIsPublic)
            createProfileVersionCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Sub AddAffectedSpecies(ByVal connection As SqlConnection)

        Using insertAffectedSpeciesCommand As SqlCommand = connection.CreateCommand
            insertAffectedSpeciesCommand.CommandType = CommandType.StoredProcedure
            insertAffectedSpeciesCommand.CommandText = "spiProfileVersionSpecies"
            insertAffectedSpeciesCommand.Parameters.AddWithValue("@ProfileVersionId", mNewProfileVersionId)
            insertAffectedSpeciesCommand.Parameters.AddWithValue("@CloneProfileVersionId", mProfileVersionId)
            Dim speciesIdParameter As SqlParameter = insertAffectedSpeciesCommand.Parameters.Add("@SpeciesId", SqlDbType.UniqueIdentifier)
            Dim speciesTypeParameter As SqlParameter = insertAffectedSpeciesCommand.Parameters.Add("@AffectedSpeciesTypeName", SqlDbType.VarChar, 50)
            For Each currentSpecies As AffectedSpeciesInfo In mAffectedSpeciesList
                'Only copy in data if species is active
                If currentSpecies.IsActive Then
                    speciesIdParameter.Value = currentSpecies.SpeciesId
                    speciesTypeParameter.Value = currentSpecies.AffectedSpeciesType.ToString()
                    insertAffectedSpeciesCommand.ExecuteNonQuery()
                End If
            Next
        End Using

        'if the new version does not belong to a "what-if" scenario, copy in the species trade data
        If Not IsWhatIfScenario() Then
            Using updateSpeciesTradeDataCommand As SqlCommand = connection.CreateCommand
                updateSpeciesTradeDataCommand.CommandType = CommandType.StoredProcedure
                updateSpeciesTradeDataCommand.CommandText = "spuProfileVersionSpeciesTradeData"
                updateSpeciesTradeDataCommand.Parameters.AddWithValue("@ProfileVersionId", mNewProfileVersionId)
                Dim updateSpeciesParameter As SqlParameter = updateSpeciesTradeDataCommand.Parameters.Add("@SpeciesId", SqlDbType.UniqueIdentifier)
                For Each currentSpecies As AffectedSpeciesInfo In mAffectedSpeciesList
                    'only copy in trade data if the species is Profiled AND ACTIVE
                    If currentSpecies.AffectedSpeciesType = AffectedSpeciesType.Profiled AndAlso currentSpecies.IsActive Then
                        updateSpeciesParameter.Value = currentSpecies.SpeciesId
                        updateSpeciesTradeDataCommand.ExecuteNonQuery()
                    End If
                Next
            End Using
        End If

    End Sub

    Private Sub CalculatePrioritisationScore(ByVal connection As SqlConnection)

        Using prioritisationCommand As SqlCommand = connection.CreateCommand
            prioritisationCommand.CommandType = CommandType.StoredProcedure
            prioritisationCommand.CommandText = "sppPrioritisationCalculation"
            prioritisationCommand.Parameters.AddWithValue("@ProfileVersionId", mNewProfileVersionId)
            prioritisationCommand.ExecuteNonQuery()
        End Using
        Using calculateCommand As SqlCommand = connection.CreateCommand
            calculateCommand.CommandType = CommandType.StoredProcedure
            calculateCommand.CommandText = "sppPrioritisationScore"
            calculateCommand.ExecuteNonQuery()
        End Using

    End Sub

    Private Class AffectedSpeciesInfo

        Private mAffectedSpeciesId As Guid
        Private mAffectedSpeciesType As AffectedSpeciesType
        Private mAffectedSpeciesIsActive As Boolean

        Public ReadOnly Property SpeciesId() As Guid
            Get
                Return mAffectedSpeciesId
            End Get
        End Property

        Public ReadOnly Property AffectedSpeciesType() As AffectedSpeciesType
            Get
                Return mAffectedSpeciesType
            End Get
        End Property

        Public ReadOnly Property IsActive() As Boolean
            Get
                Return mAffectedSpeciesIsActive
            End Get
        End Property

        Public Sub New(ByVal speciesId As Guid, ByVal speciesType As AffectedSpeciesType, ByVal speciesIsActive As Boolean)
            mAffectedSpeciesId = speciesId
            mAffectedSpeciesType = speciesType
            mAffectedSpeciesIsActive = speciesIsActive
        End Sub

    End Class

    Private Enum AffectedSpeciesType
        Profiled
        Other
    End Enum

End Class


