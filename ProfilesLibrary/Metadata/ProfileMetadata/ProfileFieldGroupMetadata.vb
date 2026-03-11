Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileFieldGroupMetadata
    Inherits ProfileFieldMetadata

    Private mProfileFieldMetaDataList As ProfileFieldMetadataList

#Region " Business Methods "

    Public ReadOnly Property FieldList() As ProfileFieldMetadataList
        Get
            Return mProfileFieldMetaDataList
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetProfileFieldGroupMetadata(ByVal dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata) As ProfileFieldGroupMetadata
        Return New ProfileFieldGroupMetadata(dtoProfileFieldMetadata)
    End Function

    Private Sub New(ByVal dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata)
        Fetch(dtoProfileFieldMetadata)
    End Sub

    Private Sub New()
        ' requires use of factory methods. 
    End Sub

#End Region

#Region " Data Access "

    Protected Overloads Sub Fetch(ByVal dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata)
        MyBase.Fetch(dtoProfileFieldMetadata)
        Dim dtoGroupMetadata As DataContracts.ProfileFieldGroupMetadata = DirectCast(dtoProfileFieldMetadata, DataContracts.ProfileFieldGroupMetadata)
        mProfileFieldMetaDataList = ProfileFieldMetadataList.GetProfileFieldMetadataList(dtoGroupMetadata.FieldMetadataList)
    End Sub

#End Region

End Class
