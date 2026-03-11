Imports Csla
Imports Csla.Data
Imports System.Data.SqlClient

''' <summary>
''' A read only collection class to hold a list of ProfileVersionField objects. Each ProfileVersionQuestion has a list of the fields
''' belonging to that question.
''' </summary>
''' <remarks></remarks>
<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class FieldMetadataList
    Inherits ReadOnlyListBase(Of FieldMetadataList, FieldMetadata)

    Private mFieldMetadataDictionary As New Dictionary(Of Guid, FieldMetadata)

    ''' <summary>
    ''' Indicates if the fields in this list are all readonly
    ''' </summary>
    ''' <returns>True if all the fields are readonly; False otherwise</returns>
    Public ReadOnly Property FieldListIsReadOnly() As Boolean
        Get
            For Each currentField As FieldMetadata In Me
                If Not currentField.IsReadOnly Then
                    Return False
                End If
            Next
            Return True
        End Get
    End Property

    Public ReadOnly Property HasFieldGroup() As Boolean
        Get
            Dim hasGroup As Boolean = False
            For Each field As FieldMetadata In Me
                If TypeOf (field) Is FieldGroupMetadata Then
                    hasGroup = True
                    Exit For
                End If
            Next
            Return hasGroup
        End Get
    End Property

    Public Function GetById(ByVal fieldMetadataId As Guid) As FieldMetadata
        If mFieldMetadataDictionary.ContainsKey(fieldMetadataId) Then
            Return mFieldMetadataDictionary(fieldMetadataId)
        Else
            Return Nothing
        End If
    End Function

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to create a new field list. Field lists are created empty by the constructor of the ProfileVersionQuestion
    ''' object, and then populated via the ProfileVersionQuestionList object, which indirectly calls the FetchField method of the
    ''' FieldList for each field in the list.
    ''' </summary>
    ''' <returns>An empty ProfileVersionFieldList object.</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function NewProfileVersionFieldList() As FieldMetadataList

        Return New FieldMetadataList()

    End Function

    ''' <summary>
    ''' Private constructor to force creation via the factory method.
    ''' </summary>
    Private Sub New()
        'require use of factory methods
    End Sub

    ''' <summary>
    ''' Method called from the ProfileVersionQuestionList passing in a recordset from which the field information can be read.
    ''' </summary>
    ''' <param name="reader">the datareader containing the recordset of field data.</param>
    ''' <param name="isReadOnly">a flag indicating whether the readonly status of the field should be overridden by global readonly 
    ''' requirements</param>
    ''' <param name="profileVersionId">reference to the profile version to which this profile field belongs</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub FetchField(ByVal reader As SafeDataReader, ByVal isReadOnly As Boolean, ByVal parentId As Guid)

        Fetch(reader, isReadOnly, parentId)

    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Adds the field from the recordset into the field list.
    ''' </summary>
    ''' <param name="reader">the datareader containing the recordset of field data.</param>
    ''' <param name="isReadOnly">a flag indicating whether the readonly status of the field should be overridden by global readonly 
    ''' requirements</param>
    ''' <param name="profileVersionId">reference to the profile version to which this profile field belongs</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal reader As SafeDataReader, ByVal isReadOnly As Boolean, ByVal parentId As Guid)

        RaiseListChangedEvents = False
        Me.IsReadOnly = False
        Dim currentFieldMetadata As FieldMetadata = FieldMetadata.GetFieldMetaData(reader, isReadOnly, parentId)
        Add(currentFieldMetadata)
        mFieldMetadataDictionary.Add(currentFieldMetadata.Id, currentFieldMetadata)
        Me.IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

