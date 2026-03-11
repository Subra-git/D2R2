Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class DateFieldValue
    Inherits FieldValueBase

#Region " Business Methods "

    Private mFieldValue As Nullable(Of Date)

    ''' <summary>
    ''' The value (for a field that is not multi-value)
    ''' </summary>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.InvalidOperationException.#ctor(System.String)")> _
    Public Property FieldValue() As Nullable(Of Date)
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mFieldValue
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Nullable(Of Date))
            CanWriteProperty(True)

            If IsReadOnly Then
                Throw New InvalidOperationException("You cannot set the value of a readonly field")
            End If

            If Not mFieldValue.Equals(value) Then
                mFieldValue = value
                PropertyHasChanged()
            End If

        End Set
    End Property


    Public Overrides ReadOnly Property IsEmpty() As Boolean
        Get
            Return Not (mFieldValue.HasValue AndAlso mFieldValue.Value <> Date.MinValue AndAlso mFieldValue.Value <> Date.MaxValue)
        End Get
    End Property

    ''' <summary>
    ''' Clears this value
    ''' </summary>
    ''' <remarks>
    ''' Used by the Clear Section functionality
    ''' </remarks>
    Protected Overrides Sub DoClear()
        FieldValue = Nothing
        'PropertyHasChanged("FieldValue")
    End Sub

    Public Overrides Sub SetValue(value As Object)
        If TypeOf value IsNot Date Then
            Throw New ArgumentException("Date field value is required.")
        End If

        FieldValue = DirectCast(value, Date)
    End Sub

    Public Overrides Function GetValue() As Object
        Return Me.FieldValue
    End Function

    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

        If Not TypeOf otherFieldValue Is DateFieldValue Then
            Return False
        End If

        Return mFieldValue.Equals(DirectCast(otherFieldValue, DateFieldValue).FieldValue)

    End Function

    Public Overrides Function ToString() As String

        If mFieldValue.HasValue Then
            Return mFieldValue.Value.ToLongDateString()
        Else
            Return String.Empty
        End If

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
    Friend Sub InitializeValue(ByVal fieldValue As Date)

        mFieldValue = fieldValue
        Me.ValidationRules.CheckRules("FieldValue")

    End Sub

    Friend Overrides Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As DataContracts.FieldValueUpdate)

        Dim dtoProfileFieldValueUpdate As DataContracts.ProfileFieldValueUpdate = DirectCast(dtoFieldValueUpdate, DataContracts.ProfileFieldValueUpdate)

        dtoProfileFieldValueUpdate.FieldId = MyBase.Id

        If mFieldValue.HasValue Then
            dtoProfileFieldValueUpdate.DateValue = mFieldValue.Value
            dtoFieldValueUpdate.ParameterName = "@DateValue"
        End If

    End Sub

#End Region

    
End Class

