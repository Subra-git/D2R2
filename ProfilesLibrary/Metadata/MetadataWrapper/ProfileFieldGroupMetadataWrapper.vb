Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileFieldGroupMetadataWrapper
    Inherits FieldMetadataWrapper

    Private mProfiledSpeciesList As New List(Of ProfiledSpecies)
    Private mProfileFieldGroupMetadata As ProfileFieldGroupMetadata
    Private mFieldMetadataListWrapper As FieldMetadataListWrapper

#Region " Business Methods "

    Public ReadOnly Property FieldList() As FieldMetadataListWrapper
        Get
            Return mFieldMetadataListWrapper
        End Get
    End Property

    Public ReadOnly Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
        Get
            Return mProfiledSpeciesList
        End Get
    End Property

    Friend Overrides Sub InitializeNonMetadata(ByVal isReadOnly As Boolean, ByVal parentId As Guid, ByVal profileVersionId As Guid, ByVal dtoProfiledSpeciesList As List(Of DataContracts.ProfiledSpecies))

        MyBase.InitializeNonMetadata(isReadOnly, parentId, profileVersionId, dtoProfiledSpeciesList)

        Dim profiledSpeciesList As New List(Of ProfiledSpecies)

        For Each currentProfiledSpecies As DataContracts.ProfiledSpecies In dtoProfiledSpeciesList
            Dim newProfiledSpecies As New ProfiledSpecies(currentProfiledSpecies.Id, currentProfiledSpecies.Name, currentProfiledSpecies.IsActive)
            profiledSpeciesList.Add(newProfiledSpecies)
        Next

        mProfiledSpeciesList = profiledSpeciesList

        For Each fieldWrapper As FieldMetadataWrapper In mFieldMetadataListWrapper
            fieldWrapper.InitializeNonMetadata(isReadOnly, parentId, profileVersionId, Nothing)
        Next

    End Sub

    Protected Overrides Function GetIdValue() As Object
        Return mProfileFieldGroupMetadata.Id
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileFieldGroupMetadataWrapper(ByVal fieldGroupMetadata As ProfileFieldGroupMetadata) As ProfileFieldGroupMetadataWrapper
        Return New ProfileFieldGroupMetadataWrapper(fieldGroupMetadata)
    End Function

    Private Sub New(ByVal fieldGroupMetadata As ProfileFieldGroupMetadata)

        MyBase.Fetch(DirectCast(fieldGroupMetadata, FieldMetadataBase))

        mProfileFieldGroupMetadata = fieldGroupMetadata
        mFieldMetadataListWrapper = FieldMetadataListWrapper.GetFieldMetadataListWrapper(mProfileFieldGroupMetadata.FieldList)
    End Sub

    Private Sub New()
        ' requires use of factory methods
    End Sub

#End Region

End Class
