Imports Csla
Imports Profiles.Contracts

Public Class ProfileUserRole
    Inherits ReadOnlyBase(Of ProfileUserRole)

#Region " Business Methods "

    Private mId As Guid
    Private mRoleName As String = String.Empty
    Private mIsContributor As Boolean

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property RoleName() As String
        Get
            Return mRoleName
        End Get
    End Property

    Public ReadOnly Property IsContributor() As Boolean
        Get
            Return mIsContributor
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileUserRole(ByVal result As DataContracts.ProfileUserRole) As ProfileUserRole
        Return New ProfileUserRole(result)
    End Function

    Private Sub New()
        'requires use of factory methods
    End Sub

    Private Sub New(ByVal result As DataContracts.ProfileUserRole)
        Fetch(result)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal result As DataContracts.ProfileUserRole)
        mId = result.Id
        mRoleName = result.RoleName
        mIsContributor = result.IsContributor
    End Sub

#End Region


End Class
