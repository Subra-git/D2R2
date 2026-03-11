Imports Profiles.Contracts

<Serializable()> _
Public Class ProfiledSpecies

    Private mId As Guid
    Private mName As String
    Private mIsActive As Boolean

    Public Sub New(ByVal id As Guid, ByVal name As String, ByVal isActive As Boolean)
        mId = id
        mName = name
        mIsActive = isActive
    End Sub

    Public Sub New(ByVal dtoProfiledSpecies As DataContracts.ProfiledSpecies)
        mId = dtoProfiledSpecies.Id
        mName = dtoProfiledSpecies.Name
        mIsActive = dtoProfiledSpecies.IsActive
    End Sub

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property IsActive() As Boolean
        Get
            Return mIsActive
        End Get
    End Property

End Class
