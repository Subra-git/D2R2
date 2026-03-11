Imports System.Runtime.Serialization

Namespace DataContracts

    <DataContract()> _
    Public Class ProfileSearchProfileAffectedSpecies

        Private mProfileVersionId As Guid
        Private mScenarioId As Guid
        Private mProfileId As Guid
        Private mSpeciesId As Guid
        Private mName As String
        Private mType As String
        Private mIsActive As Boolean

        <DataMember()> _
        Public Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
            Set(ByVal value As Guid)
                mProfileVersionId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ScenarioId() As Guid
            Get
                Return mScenarioId
            End Get
            Set(ByVal value As Guid)
                mScenarioId = value
            End Set
        End Property

        <DataMember()> _
        Public Property ProfileId() As Guid
            Get
                Return mProfileId
            End Get
            Set(ByVal value As Guid)
                mProfileId = value
            End Set
        End Property

        <DataMember()> _
        Public Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
            Set(ByVal value As Guid)
                mSpeciesId = value
            End Set
        End Property

        <DataMember()> _
        Public Property Name() As String
            Get
                Return mName
            End Get
            Set(ByVal value As String)
                mName = value
            End Set
        End Property

        <DataMember()> _
        Public Property Type() As String
            Get
                Return mType
            End Get
            Set(ByVal value As String)
                mType = value
            End Set
        End Property

        <DataMember()> _
        Public Property IsActive() As Boolean
            Get
                Return mIsActive
            End Get
            Set(ByVal value As Boolean)
                mIsActive = value
            End Set
        End Property

        Public Sub New(ByVal profileVersionId As Guid, _
                       ByVal scenarioId As Guid, _
                       ByVal profileId As Guid, _
                       ByVal speciesId As Guid, _
                       ByVal name As String, _
                       ByVal type As String, _
                       ByVal isActive As Boolean _
                       )
            mProfileVersionId = profileVersionId
            mScenarioId = scenarioId
            mProfileId = profileId
            mSpeciesId = speciesId
            mName = name
            mType = type
            mIsActive = isActive
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

End Namespace
