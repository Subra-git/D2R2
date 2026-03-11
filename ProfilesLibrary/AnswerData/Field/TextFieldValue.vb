Imports Csla

<Serializable()> _
Public Class TextFieldValue
    Inherits LongTextFieldValue

    Public Overrides Property FieldValue() As String
        Get
            Return MyBase.FieldValue
        End Get
        Set(ByVal value As String)
            If value.Length > 255 Then
                Throw New InvalidOperationException("Field value exceeds maximum length")
            End If
            MyBase.FieldValue = value
        End Set
    End Property

    Friend Sub New(ByVal field As FieldMetadataWrapper, ByVal speciesId As Guid)
        MyBase.New(field, speciesId)
    End Sub

End Class
