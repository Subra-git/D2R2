Imports Csla

<Serializable()> _
Public Class ProfileVersionDataFieldValue
    Inherits FieldValueBase

#Region " Business Methods "

    Private mFieldValue As String

    ''' <summary>
    ''' The value (for a field that is not multi-value)
    ''' </summary>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.InvalidOperationException.#ctor(System.String)")> _
    Public ReadOnly Property FieldValue() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mFieldValue
        End Get
    End Property

    Public Overrides ReadOnly Property IsEmpty() As Boolean
        Get
            Return False
        End Get
    End Property

    ''' <summary>
    ''' Clears this value
    ''' </summary>
    ''' <remarks>
    ''' Used by the Clear Section functionality
    ''' </remarks>
    Protected Overrides Sub DoClear()
        'do nothing; this field value is read only
    End Sub

    Public Overrides Sub SetValue(value As Object)
        'do nothing; this field value is read only
        Throw New NotImplementedException("Cannot set value of a read only field.")
    End Sub

    Public Overrides Function GetValue() As Object
        Return Me.FieldValue
    End Function

    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

        If Not TypeOf otherFieldValue Is ProfileVersionDataFieldValue Then
            Return False
        End If

        Return mFieldValue.Equals(DirectCast(otherFieldValue, ProfileVersionDataFieldValue).FieldValue)

    End Function

    Public Overrides Function ToString() As String

        If Not mFieldValue Is Nothing Then
            Return mFieldValue.ToString()
        Else
            Return String.Empty
        End If

    End Function

#End Region

#Region " Factory Methods "

    Friend Sub New(ByVal field As FieldMetadataWrapper, ByVal speciesId As Guid)
        MarkAsChild()
        Fetch(field, speciesId)
        Dim profileInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(field.ProfileVersionId)
        mFieldValue = CallByName(profileInfo, ShortName.Replace(" ", String.Empty), CallType.Get, Nothing).ToString
    End Sub

#End Region

#Region " Data Access "

    Friend Overrides Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As Profiles.Contracts.DataContracts.FieldValueUpdate)

        'do nothing, this field is read only

    End Sub

#End Region

End Class


