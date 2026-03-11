Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ListFieldValue
    Inherits FieldValueBase

#Region " Business Methods "

    Private mFieldValue As Guid

    ''' <summary>
    ''' The value (for a field that is not multi-value)
    ''' </summary>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.InvalidOperationException.#ctor(System.String)")> _
    Public Property FieldValue() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mFieldValue
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
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

    Public Overrides Function ContainsGuid(ByVal fieldValue As Guid) As Boolean

        Return fieldValue.Equals(mFieldValue)

    End Function

    Public Overrides ReadOnly Property IsEmpty() As Boolean
        Get
            Return mFieldValue.Equals(Guid.Empty)
        End Get
    End Property

    ''' <summary>
    ''' Clears this value
    ''' </summary>
    ''' <remarks>
    ''' Used by the Clear Section functionality
    ''' </remarks>
    Protected Overrides Sub DoClear()
        FieldValue = Guid.Empty
        '    PropertyHasChanged("FieldValue")
    End Sub

    Public Overrides Sub SetValue(value As Object)
        If TypeOf value IsNot Guid Then
            Throw New ArgumentException("GUID field value is required.")
        End If

        FieldValue = DirectCast(value, Guid)
    End Sub

    Public Overrides Function GetValue() As Object
        Return Me.FieldValue
    End Function

    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

        If Not TypeOf otherFieldValue Is ListFieldValue Then
            Return False
        End If

        Return mFieldValue.Equals(DirectCast(otherFieldValue, ListFieldValue).FieldValue)

    End Function

    Public Overrides Function ToString() As String

        Dim output As String = String.Empty

        If ReferenceTableIsMaintainable Then
            Dim referenceList As ReferenceValueInfoList = ReferenceValueInfoList.GetList(ReferenceTableId)
            For Each referenceItem As ReferenceValueInfo In referenceList
                If referenceItem.Id.Equals(mFieldValue) Then
                    output = referenceItem.Value
                    If Not referenceItem.IsActive Then
                        output &= " (inactive)"
                    End If
                    Exit For
                End If
            Next
        Else
            Dim lookup As LookupList = LookupList.GetList(ReferenceTableId)
            For Each lookupItem As LookupList.NameValuePair In lookup
                If lookupItem.Key.Equals(mFieldValue) Then
                    output = lookupItem.Value
                    Exit For
                End If
            Next
        End If

        Return output

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
    Friend Sub InitializeValue(ByVal fieldValue As Guid)

        mFieldValue = fieldValue
        Me.ValidationRules.CheckRules("FieldValue")

    End Sub

    Friend Overrides Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As Profiles.Contracts.DataContracts.FieldValueUpdate)

        dtoFieldValueUpdate.FieldId = MyBase.Id

        dtoFieldValueUpdate.ListValue = mFieldValue
        dtoFieldValueUpdate.ParameterName = "@ListValue"

    End Sub

#End Region

    
End Class


