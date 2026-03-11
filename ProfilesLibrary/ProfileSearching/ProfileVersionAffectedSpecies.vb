Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionAffectedSpecies
    Inherits ReadOnlyBase(Of ProfileVersionAffectedSpecies)


#Region " Business Methods "
    Private mId As Guid
    Private mProfileId As Guid
    Private mScenarioId As Guid
    Private mProfileVersionId As Guid
    Private mSpeciesId As Guid
    Private mType As String
    Private mName As String
    Private mIsActive As Boolean

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property ScenarioId() As Guid
        Get
            Return mScenarioId
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property Type() As String
        Get
            Return mType
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

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mName
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileVersionAffectedSpecies(ByVal profileVersionAffectedSpecies As DataContracts.ProfileSearchProfileAffectedSpecies) As ProfileVersionAffectedSpecies
        Return New ProfileVersionAffectedSpecies(profileVersionAffectedSpecies)
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal profileVersionAffectedSpecies As DataContracts.ProfileSearchProfileAffectedSpecies)
        Fetch(profileVersionAffectedSpecies)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal profileVersionAffectedSpecies As DataContracts.ProfileSearchProfileAffectedSpecies)
        mId = Guid.NewGuid()
        mProfileId = profileVersionAffectedSpecies.ProfileId
        mScenarioId = profileVersionAffectedSpecies.ScenarioId
        mProfileVersionId = profileVersionAffectedSpecies.ProfileVersionId
        mSpeciesId = profileVersionAffectedSpecies.SpeciesId
        mType = profileVersionAffectedSpecies.Type
        mName = profileVersionAffectedSpecies.Name
        mIsActive = profileVersionAffectedSpecies.IsActive
    End Sub

#End Region

End Class
