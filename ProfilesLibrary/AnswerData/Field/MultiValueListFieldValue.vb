Imports Csla

<Serializable()> _
Public Class MultiValueListFieldValue
    Inherits FieldValueBase

#Region " Business Methods "

    Private mFieldValues As New Dictionary(Of Guid, Guid)

    ''' <summary>
    ''' The values (for a field that is multi-value)
    ''' </summary>
    Public ReadOnly Property FieldValues() As List(Of Guid)
        Get
            CanReadProperty(True)
            Return New List(Of Guid)(mFieldValues.Values)
        End Get
    End Property

    Public Overrides ReadOnly Property IsEmpty() As Boolean
        Get
            Return (mFieldValues.Count = 0)
        End Get
    End Property

    ''' <summary>
    ''' Tests to see if a particular value is included in a list of multi-values
    ''' </summary>
    ''' <param name="fieldValue">the value to test</param>
    ''' <returns>True if the value is included in the multi-value list; False otherwise.</returns>
    Public Function ContainsValue(ByVal fieldValue As Guid) As Boolean

        Return mFieldValues.ContainsKey(fieldValue)

    End Function

    Public Overrides Function ContainsGuid(ByVal fieldValue As Guid) As Boolean

        Return ContainsValue(fieldValue)

    End Function

    ''' <summary>
    ''' Adds a value to a multi-value field.
    ''' </summary>
    ''' <param name="fieldValue">the value to add</param>
    Public Sub AddFieldValue(ByVal fieldValue As Guid)

        CanWriteProperty("FieldValues", True)
        If Not mFieldValues.ContainsKey(fieldValue) Then
            mFieldValues.Add(fieldValue, fieldValue)
            PropertyHasChanged("FieldValues")
        End If

    End Sub

    ''' <summary>
    ''' Removes a value from a multi-value field.
    ''' </summary>
    ''' <param name="fieldValue">the value to remove</param>
    Public Sub RemoveFieldValue(ByVal fieldValue As Guid)

        CanWriteProperty("FieldValues", True)
        If mFieldValues.ContainsKey(fieldValue) Then
            mFieldValues.Remove(fieldValue)
            PropertyHasChanged("FieldValues")
        End If

    End Sub

    ''' <summary>
    ''' Removes all the values from a multi-value field.
    ''' </summary>
    Public Sub ClearFieldValues()

        CanWriteProperty("FieldValues", True)
        If mFieldValues.Count > 0 Then
            mFieldValues.Clear()
            PropertyHasChanged("FieldValues")
        End If

    End Sub

    ''' <summary>
    ''' Clears this value
    ''' </summary>
    ''' <remarks>
    ''' Used by the Clear Section functionality
    ''' </remarks>
    Protected Overrides Sub DoClear()
        ClearFieldValues()
    End Sub

    Public Overrides Sub SetValue(value As Object)
        Throw New NotImplementedException("Cannot set value of a multi value list field.")
    End Sub

    Public Overrides Function GetValue() As Object
        Throw New NotImplementedException("Cannot get value of a multi value list field.")
    End Function

    ''' <summary>
    ''' Used by the constructors of other business objects to add values that have been read from the database to a multi-value field
    ''' </summary>
    ''' <param name="fieldValue">value to add</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub AddInitialValue(ByVal fieldValue As Guid)
        If Not mFieldValues.ContainsKey(fieldValue) Then
            mFieldValues.Add(fieldValue, fieldValue)
        End If
    End Sub

    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

        If Not TypeOf otherFieldValue Is MultiValueListFieldValue Then
            Return False
        End If

        Dim otherField As MultiValueListFieldValue = DirectCast(otherFieldValue, MultiValueListFieldValue)
        If mFieldValues.Keys.Count <> otherField.mFieldValues.Keys.Count Then
            Return False
        Else
            For Each currentValue As Guid In mFieldValues.Keys
                If Not otherField.ContainsValue(currentValue) Then
                    Return False
                End If
            Next

            Return True
        End If

    End Function

    Public Overrides Function ToString() As String

        Dim output As String = String.Empty

        Dim isFirst As Boolean = True
        If ReferenceTableIsMaintainable Then
            Dim referenceList As ReferenceValueInfoList = ReferenceValueInfoList.GetList(ReferenceTableId)
            For Each referenceItem As ReferenceValueInfo In referenceList
                If FieldValues.Contains(referenceItem.Id) Then
                    If Not isFirst Then
                        output &= ", "
                    End If
                    output &= referenceItem.Value
                    If Not referenceItem.IsActive Then
                        output &= " (inactive)"
                    End If
                    isFirst = False
                End If
            Next
        Else
            Dim lookup As LookupList = LookupList.GetList(ReferenceTableId)
            For Each lookupItem As LookupList.NameValuePair In lookup
                If FieldValues.Contains(lookupItem.Key) Then
                    If Not isFirst Then
                        output &= ", "
                    End If
                    output &= lookupItem.Value
                    isFirst = False
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

    Friend Overrides Sub GetUpdate(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet, ByVal dtoFieldValueUpdate As Profiles.Contracts.DataContracts.FieldValueUpdate)

        dtoFieldValueUpdate.FieldId = MyBase.Id

        For Each item As Guid In mFieldValues.Keys
            dtoFieldValueUpdate.MultiValueList.Add(item)
        Next

        dtoFieldValueUpdate.ParameterName = "@MultiValue"

    End Sub

#End Region

End Class

