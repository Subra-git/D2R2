Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfiledSpeciesData
    Inherits ReadOnlyBase(Of ProfiledSpeciesData)

    Private mId As Guid
    Private mName As String

#Region " Business Methods "

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

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfiledSpeciesData(ByVal dtoProfiledSpeciesData As DataContracts.ProfiledSpeciesData) As ProfiledSpeciesData
        Return New ProfiledSpeciesData(dtoProfiledSpeciesData)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoProfiledSpeciesData As DataContracts.ProfiledSpeciesData)
        Fetch(dtoProfiledSpeciesData)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoProfiledSpeciesData As DataContracts.ProfiledSpeciesData)
        mId = dtoProfiledSpeciesData.Id
        mName = dtoProfiledSpeciesData.Name
    End Sub

#End Region



End Class
