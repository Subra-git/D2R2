Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

<Serializable()> _
Public Class FieldGroupMetadata
    Inherits FieldMetadata

    Private mFieldMetaDataList As FieldMetadataList
    Private mProfiledSpeciesList As New List(Of ProfiledSpecies)

    Public ReadOnly Property FieldList() As FieldMetadataList
        Get
            Return mFieldMetaDataList
        End Get
    End Property

    Public ReadOnly Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
        Get
            Return mProfiledSpeciesList
        End Get
    End Property

    Friend Sub FetchField(ByVal reader As SafeDataReader, ByVal profiledSpeciesList As List(Of ProfiledSpecies), ByVal isReadOnly As Boolean)

        mFieldMetaDataList.FetchField(reader, isReadOnly, Guid.Empty)
        mProfiledSpeciesList = profiledSpeciesList

    End Sub

#Region " Factory Methods "

    Friend Sub New(ByVal reader As SafeDataReader, ByVal isReadOnly As Boolean, ByVal parentId As Guid)
        MyBase.Fetch(reader, isReadOnly, parentId)
        mFieldMetaDataList = FieldMetadataList.NewProfileVersionFieldList()        
    End Sub

#End Region

End Class
