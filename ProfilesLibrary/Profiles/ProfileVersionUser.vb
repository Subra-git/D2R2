Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class ProfileVersionUser
    Inherits BusinessBase(Of ProfileVersionUser)

#Region " Business Methods "

    Private mId As Guid
    Private mUsername As String
    Private mUserFullName As String
    Private mContributionDate As SmartDate
    Private mProfileVersionId As Guid
    Private mLastUpdated(7) As Byte

    Public ReadOnly Property Id() As Guid
        Get
            CanReadProperty(True)
            Return mId
        End Get
    End Property

    Public Property ContributionDate() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mContributionDate.Text
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mContributionDate.Text <> value Then
                mContributionDate.Text = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property UserName() As String
        Get
            Return mUserName
        End Get
    End Property

    Public ReadOnly Property UserFullName() As String
        Get
            Return mUserFullName
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Authorization Rules "

    Public Function CanEditProfileVersionUser() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(mProfileVersionId)

        'The profile version must be draft
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        End If

        'The profile version must be current
        If Not currentProfileVersionInfo.IsCurrent Then
            Return False
        End If

        'Can only edit your own information
        If Not (identity.UserId = mId) Then
            Return False
        End If

        'Must be a profile editor or a contributor to edit
        Return (identity.IsProfileEditor OrElse identity.IsProfileContributor(currentProfileVersionInfo.ProfileId))

    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileVersionUser(ByVal reader As SafeDataReader) As ProfileVersionUser
        Return New ProfileVersionUser(reader)
    End Function

    Private Sub New(ByVal reader As SafeDataReader)
        MarkAsChild()
        Fetch(reader)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal reader As SafeDataReader)
        mId = reader.GetGuid(0)
        mUsername = reader.GetString(1)
        mUserFullName = reader.GetString(2)
        mProfileVersionId = reader.GetGuid(3)
        mContributionDate = reader.GetSmartDate(4)
        mContributionDate.FormatString = "d MMMM yyyy"
        reader.GetBytes("LastUpdated", 0, mLastUpdated, 0, 8)
        MarkOld()
    End Sub

    Friend Sub InsertUpdate(ByVal parent As ProfileVersionUserList)

        If Not CanEditProfileVersionUser() Then
            Throw New System.Security.SecurityException("You are not allowed to edit this profile version user.")
        End If

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using updateCommand As SqlCommand = connection.CreateCommand
                updateCommand.CommandType = CommandType.StoredProcedure
                updateCommand.CommandText = "spiProfileVersionUser"
                updateCommand.Parameters.AddWithValue("@UserId", mId)
                updateCommand.Parameters.AddWithValue("@ProfileVersionId", mProfileVersionId)
                If mContributionDate.IsEmpty Then
                    updateCommand.Parameters.AddWithValue("@ContributionDate", DBNull.Value)
                Else
                    updateCommand.Parameters.AddWithValue("@ContributionDate", mContributionDate.Date)
                End If
                updateCommand.Parameters.AddWithValue("@LastUpdated", mLastUpdated)
                Dim output As New SqlParameter("@NewLastUpdated", SqlDbType.Timestamp)
                output.Direction = ParameterDirection.Output
                updateCommand.Parameters.Add(output)
                updateCommand.ExecuteNonQuery()
                mLastUpdated = CType(updateCommand.Parameters("@NewLastUpdated").Value, Byte())
            End Using
        End Using
        MarkOld()
    End Sub

#End Region

End Class



