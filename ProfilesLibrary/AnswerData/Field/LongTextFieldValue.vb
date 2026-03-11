Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class LongTextFieldValue
    Inherits FieldValueBase

#Region " Business Methods "

    Private mFieldValue As String = String.Empty

    ''' <summary>
    ''' The value (for a field that is not multi-value)
    ''' </summary>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.InvalidOperationException.#ctor(System.String)")> _
    Public Overridable Property FieldValue() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mFieldValue
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mFieldValue <> value Then
                mFieldValue = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Overrides ReadOnly Property IsEmpty() As Boolean
        Get
            Return (mFieldValue.Length = 0)
        End Get
    End Property

    ''' <summary>
    ''' Clears this value
    ''' </summary>
    ''' <remarks>
    ''' Used by the Clear Section functionality
    ''' </remarks>
    Protected Overrides Sub DoClear()
        FieldValue = String.Empty
        '  PropertyHasChanged("FieldValue")
    End Sub

    Public Overrides Sub SetValue(value As Object)
        If TypeOf value IsNot String Then
            Throw New ArgumentException("String field value is required.")
        End If

        FieldValue = DirectCast(value, String)
    End Sub

    Public Overrides Function GetValue() As Object
        Return Me.FieldValue
    End Function

    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

        If Not TypeOf otherFieldValue Is LongTextFieldValue Then
            Return False
        End If

        Return mFieldValue.Equals(DirectCast(otherFieldValue, LongTextFieldValue).FieldValue)

    End Function

    Public Overrides Function ToString() As String

        Return mFieldValue

    End Function

#End Region

#Region " Factory Methods "

    Friend Sub New(ByVal field As FieldMetadataWrapper, ByVal speciesId As Guid)
        MarkAsChild()
        Fetch(field, speciesId)
    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Used by the constructors of other business objects to initialize the value of this field with data from the database
    ''' </summary>
    ''' <param name="fieldValue">the value to initialize to</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub InitializeValue(ByVal fieldValue As String)

        mFieldValue = fieldValue
        Me.ValidationRules.CheckRules("FieldValue")

    End Sub

    Friend Overrides Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As Profiles.Contracts.DataContracts.FieldValueUpdate)

        dtoFieldValueUpdate.FieldId = MyBase.Id

        If Not mFieldValue.Equals(Guid.Empty) Then
            dtoFieldValueUpdate.TextValue = mFieldValue
            dtoFieldValueUpdate.ParameterName = "@TextValue"
        End If

    End Sub

#End Region

End Class


