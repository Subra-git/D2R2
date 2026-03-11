Imports Csla
Imports Profiles.Contracts

Public Enum AffectedSpeciesType
    Profiled
    Other
End Enum

<Serializable()> _
Public Class AffectedSpecies
    Inherits BusinessBase(Of AffectedSpecies)

#Region " Business Methods "

    Private mSpeciesId As Guid
    Private mProfileVersionId As Guid
    Private mCloneProfileVersionId As Guid
    Private mName As String
    Private mType As AffectedSpeciesType
    Private mIsActive As Boolean

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property Type() As AffectedSpeciesType
        Get
            Return mType
        End Get
    End Property

    Public ReadOnly Property IsActive() As Boolean
        Get
            Return mIsActive
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mSpeciesId
    End Function

    Public Overrides Function ToString() As String
        If mIsActive Then
            Return mName
        Else
            Return mName & " (inactive)"
        End If
    End Function

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()
        '
    End Sub

#End Region

#Region " Authorization Rules "

    Protected Overrides Sub AddAuthorizationRules()
       '
    End Sub

#End Region

#Region " Factory Methods "

    Friend Shared Function NewAffectedSpecies(ByVal speciesId As Guid, ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid, ByVal type As AffectedSpeciesType) As AffectedSpecies
        Return DataPortal.Create(Of AffectedSpecies)(New AddCriteria(speciesId, profileVersionId, cloneProfileVersionId, type))
    End Function

    Friend Shared Function GetAffectedSpecies(ByVal species As DataContracts.AffectedSpecies, ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid) As AffectedSpecies
        Return New AffectedSpecies(species, profileVersionId, cloneProfileVersionId)
    End Function

    Private Sub New()
        MarkAsChild()
    End Sub

    Private Sub New(ByVal species As DataContracts.AffectedSpecies, ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid)
        MarkAsChild()
        Fetch(species, profileVersionId, cloneProfileVersionId)
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class AddCriteria

        Private mSpeciesId As Guid
        Private mProfileVersionId As Guid
        Private mCloneProfileVersionId As Guid
        Private mType As AffectedSpeciesType

        Public ReadOnly Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
        End Property

        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        Public ReadOnly Property CloneProfileVersionId() As Guid
            Get
                Return mCloneProfileVersionId
            End Get
        End Property

        Public ReadOnly Property Type() As AffectedSpeciesType
            Get
                Return mType
            End Get
        End Property

        Public Sub New(ByVal speciesId As Guid, ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid, ByVal type As AffectedSpeciesType)
            mSpeciesId = speciesId
            mProfileVersionId = profileVersionId
            mCloneProfileVersionId = cloneProfileVersionId
            mType = type
        End Sub

    End Class

    Private Overloads Sub DataPortal_Create(ByVal criteria As AddCriteria)

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        Dim result As DataContracts.AffectedSpecies = db.GetAffectedSpecies(New DataContracts.GetAffectedSpeciesRequest(criteria.SpeciesId))

        mSpeciesId = criteria.SpeciesId
        mProfileVersionId = criteria.ProfileVersionId
        mCloneProfileVersionId = criteria.CloneProfileVersionId
        mName = result.Name
        mType = criteria.Type
        mIsActive = result.IsActive

    End Sub

    Private Sub Fetch(ByVal species As DataContracts.AffectedSpecies, ByVal profileVersionId As Guid, ByVal cloneProfileVersionId As Guid)

        mSpeciesId = species.SpeciesId
        mProfileVersionId = profileVersionId
        mCloneProfileVersionId = cloneProfileVersionId
        mName = species.Name
        If species.Type = "Profiled" Then
            mType = AffectedSpeciesType.Profiled
        Else
            mType = AffectedSpeciesType.Other
        End If
        mIsActive = species.IsActive

        If cloneProfileVersionId.Equals(Guid.Empty) Then
            MarkOld()
        End If

    End Sub

    Friend Function GetInsert() As DataContracts.AffectedSpeciesInsert

        Return New DataContracts.AffectedSpeciesInsert With { _
            .SpeciesId = mSpeciesId, _
            .ProfileVersionId = mProfileVersionId, _
            .CloneProfileVersionId = mCloneProfileVersionId, _
            .Type = mType.ToString() _
        }

    End Function

    Friend Function GetDelete() As DataContracts.AffectedSpeciesDelete

        Return New DataContracts.AffectedSpeciesDelete With { _
            .ProfileVersionId = mProfileVersionId, _
            .SpeciesId = mSpeciesId _
        }

    End Function

    Friend Sub Insert()
        MarkOld()
    End Sub

    Friend Sub DeleteSelf()
        MarkNew()
    End Sub

#End Region

End Class

