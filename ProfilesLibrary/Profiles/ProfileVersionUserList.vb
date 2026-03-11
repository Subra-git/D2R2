Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class ProfileVersionUserList
    Inherits BusinessListBase(Of ProfileVersionUserList, ProfileVersionUser)

    Private mProfileVersionId As Guid

    Friend ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public Function GetById(ByVal userId As Guid) As ProfileVersionUser
        For Each currentUser As ProfileVersionUser In Me
            If currentUser.Id.Equals(userId) Then
                Return currentUser
            End If
        Next
        Return Nothing
    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetProfileVersionUserList(ByVal profileVersionId As Guid) As Boolean

        'The profile version must be draft
        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        End If

        'Must be a profile editor or a contributor or a reviewer to get a list of profile version users
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return (identity.IsProfileContributorOrReviewer(currentProfileVersionInfo.ProfileId) OrElse identity.IsProfileEditor)

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileVersionUserList(ByVal profileVersionId As Guid) As ProfileVersionUserList

        'Here is where we need to check if the user is allowed to get the review comment list
        If Not CanGetProfileVersionUserList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to view the user information for this profile version.")
        End If

        Return DataPortal.Fetch(Of ProfileVersionUserList)(New Criteria(profileVersionId))

    End Function

    Private Sub New()
        ' require use of factory methods
        Me.AllowNew = False
        Me.AllowRemove = False
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mProfileVersionId As Guid

        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        Public Sub New(ByVal profileVersionId As Guid)
            mProfileVersionId = profileVersionId
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        mProfileVersionId = criteria.ProfileVersionId

        RaiseListChangedEvents = False

        Using connection As New SqlConnection(GlobalSettings.ProfilesDatabase)
            connection.Open()

            Using getCommand As SqlCommand = connection.CreateCommand
                getCommand.CommandType = CommandType.StoredProcedure
                getCommand.CommandText = "spgProfileVersionUser"
                getCommand.Parameters.AddWithValue("@ProfileVersionId", mProfileVersionId)
                Using reader As New SafeDataReader(getCommand.ExecuteReader)
                    While reader.Read()
                        Add(ProfileVersionUser.GetProfileVersionUser(reader))
                    End While
                End Using
            End Using
        End Using

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        RaiseListChangedEvents = False

        For Each item As ProfileVersionUser In Me
            If item.IsDirty Then
                item.InsertUpdate(Me)
            End If
        Next
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class



