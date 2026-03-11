Imports Csla

<Serializable()> _
Public Class FieldMetadataListWrapper
    Inherits ReadOnlyListBase(Of FieldMetadataListWrapper, FieldMetadataWrapper)

#Region " Business Methods "

    ''' <summary>
    ''' Indicates if the fields in this list are all readonly
    ''' </summary>
    ''' <returns>True if all the fields are readonly; False otherwise</returns>
    Public ReadOnly Property FieldListIsReadOnly() As Boolean
        Get
            For Each currentField As FieldMetadataWrapper In Me
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
            For Each field As FieldMetadataWrapper In Me
                If TypeOf (field) Is ProfileFieldGroupMetadataWrapper Then
                    hasGroup = True
                    Exit For
                End If
            Next
            Return hasGroup
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetFieldMetadataListWrapper(ByVal fieldMetadataList As FieldMetadataListBase) As FieldMetadataListWrapper
        Return New FieldMetadataListWrapper(fieldMetadataList)
    End Function

    Private Sub New(ByVal fieldMetadataList As FieldMetadataListBase)

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each fieldMetadata As FieldMetadataBase In fieldMetadataList
            Dim currentFieldMetadataWrapper As FieldMetadataWrapper

            Dim currentProfileFieldGroupMetadata As ProfileFieldGroupMetadata
            currentProfileFieldGroupMetadata = TryCast(fieldMetadata, ProfileFieldGroupMetadata)

            If currentProfileFieldGroupMetadata IsNot Nothing Then
                currentFieldMetadataWrapper = ProfileFieldGroupMetadataWrapper.GetProfileFieldGroupMetadataWrapper(currentProfileFieldGroupMetadata)
            Else
                currentFieldMetadataWrapper = FieldMetadataWrapper.GetFieldMetadataWrapper(fieldMetadata)
            End If

            Me.Add(currentFieldMetadataWrapper)
        Next

        RaiseListChangedEvents = True
        IsReadOnly = True

    End Sub

    Private Sub New()
        ' requires use of factory methods
    End Sub

#End Region

End Class
