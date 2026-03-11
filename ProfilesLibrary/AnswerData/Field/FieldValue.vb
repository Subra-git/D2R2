'Imports Csla
'Imports Csla.Data
'Imports System.Data.SqlClient

'''' <summary>
'''' This editable object represents a field value in the surveillance profile. If the field belongs to a question that repeats or is per-species,
'''' then there will be more than one FieldValue object for that field, for a given profile version section.
'''' </summary>
'<Serializable()> _
'Public Class FieldValue
'    Inherits FieldValueBase

'#Region " Business Methods "

'    'Where the field is multivalue, the values are held in the mFieldValues dictionary.
'    'Where it is not, the value is held in mFieldValue.
'    Private mFieldValue As Object
'    Private mFieldValues As New Generic.Dictionary(Of Guid, Guid)

'    ''' <summary>
'    ''' The value (for a field that is not multi-value)
'    ''' </summary>
'    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.InvalidOperationException.#ctor(System.String)")> _
'    Public Property FieldValue() As Object
'        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
'        Get
'            If mDataType = DataFieldType.MultiValueListType Then
'                Throw New InvalidOperationException("You cannot access the field value of a field that is multi-value.")
'            End If
'            CanReadProperty(True)            
'            Return mFieldValue
'        End Get
'        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
'        Set(ByVal value As Object)
'            If mDataType = DataFieldType.MultiValueListType Then
'                Throw New InvalidOperationException("You cannot access the field value of a field that is multi-value.")
'            End If
'            If mDataType = DataFieldType.ProfileVersionDataType Then
'                Throw New InvalidOperationException("You cannot update the field value of a Profile Version Data field.")
'            End If
'            CanWriteProperty(True)

'            If mIsReadOnly Then
'                Throw New InvalidOperationException("You cannot set the value of a readonly field")
'            End If

'            'convert empty strings to nulls
'            If TypeOf value Is String AndAlso value.ToString().Length = 0 Then
'                value = Nothing
'            End If

'            If GlobalCommon.IsFieldValueChangeValid(mFieldValue, value, mDataType) Then
'                mFieldValue = value
'                PropertyHasChanged()
'            End If

'        End Set
'    End Property

'    ''' <summary>
'    ''' The values (for a field that is multi-value)
'    ''' </summary>
'    Public ReadOnly Property FieldValues() As List(Of Guid)
'        Get
'            If mDataType <> DataFieldType.MultiValueListType Then
'                Throw New InvalidOperationException("You cannot access the field values of a field that is not multi-value.")
'            End If
'            CanReadProperty(True)
'            Return New List(Of Guid)(mFieldValues.Values)
'        End Get
'    End Property

'    ''' <summary>
'    ''' Tests to see if a particular value is included in a list of multi-values
'    ''' </summary>
'    ''' <param name="fieldValue">the value to test</param>
'    ''' <returns>True if the value is included in the multi-value list; False otherwise.</returns>
'    Public Function ContainsValue(ByVal fieldValue As Guid) As Boolean

'        If mDataType <> DataFieldType.MultiValueListType Then
'            Throw New InvalidOperationException("You cannot access the field values of a field that is not multi-value.")
'        End If
'        Return mFieldValues.ContainsKey(fieldValue)

'    End Function

'    Public Function ContainsGuid(ByVal fieldValue As Guid) As Boolean

'        If mDataType = DataFieldType.MultiValueListType Then
'            Return mFieldValues.ContainsKey(fieldValue)
'        End If

'        If mDataType = DataFieldType.ListType AndAlso mFieldValue IsNot Nothing Then
'            Return fieldValue.Equals(DirectCast(mFieldValue, Guid))
'        End If

'        Return False

'    End Function

'    ''' <summary>
'    ''' Adds a value to a multi-value field.
'    ''' </summary>
'    ''' <param name="fieldValue">the value to add</param>
'    Public Sub AddFieldValue(ByVal fieldValue As Guid)

'        If mDataType <> DataFieldType.MultiValueListType Then
'            Throw New InvalidOperationException("You cannot access the field values of a field that is not multi-value.")
'        End If
'        CanWriteProperty("FieldValues", True)
'        If Not mFieldValues.ContainsKey(fieldValue) Then
'            mFieldValues.Add(fieldValue, fieldValue)
'            PropertyHasChanged("FieldValues")
'        End If

'    End Sub

'    ''' <summary>
'    ''' Removes a value from a multi-value field.
'    ''' </summary>
'    ''' <param name="fieldValue">the value to remove</param>
'    Public Sub RemoveFieldValue(ByVal fieldValue As Guid)

'        If mDataType <> DataFieldType.MultiValueListType Then
'            Throw New InvalidOperationException("You cannot access the field values of a field that is not multi-value.")
'        End If
'        CanWriteProperty("FieldValues", True)
'        If mFieldValues.ContainsKey(fieldValue) Then
'            mFieldValues.Remove(fieldValue)
'            PropertyHasChanged("FieldValues")
'        End If

'    End Sub

'    ''' <summary>
'    ''' Removes all the values from a multi-value field.
'    ''' </summary>
'    Public Sub ClearFieldValues()

'        If mDataType <> DataFieldType.MultiValueListType Then
'            Throw New InvalidOperationException("You cannot access the field values of a field that is not multi-value.")
'        End If
'        CanWriteProperty("FieldValues", True)
'        If mFieldValues.Count > 0 Then
'            mFieldValues.Clear()
'            PropertyHasChanged("FieldValues")
'        End If

'    End Sub

'    ''' <summary>
'    ''' Clears this value
'    ''' </summary>
'    ''' <remarks>
'    ''' Used by the Clear Section functionality
'    ''' </remarks>
'    Protected Overrides Sub DoClear()
'        If mDataType = DataFieldType.MultiValueListType Then
'            ClearFieldValues()
'        Else
'            FieldValue = Nothing
'        End If
'    End Sub

'    ''' <summary>
'    ''' Used by the constructors of other business objects to add values that have been read from the database to a multi-value field
'    ''' </summary>
'    ''' <param name="fieldValue">value to add</param>
'    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
'    Friend Sub AddInitialValue(ByVal fieldValue As Guid)
'        If Not mFieldValues.ContainsKey(fieldValue) Then
'            mFieldValues.Add(fieldValue, fieldValue)
'        End If
'    End Sub

'    Public Overrides Function ValuesEqual(ByVal otherFieldValue As FieldValueBase) As Boolean

'        If mDataType <> otherFieldValue.DataType Then
'            Return False
'        End If

'        If mDataType = DataFieldType.MultiValueListType Then
'            If mFieldValues.Keys.Count <> DirectCast(otherFieldValue, FieldValue).mFieldValues.Keys.Count Then
'                Return False
'            Else
'                For Each currentValue As Guid In mFieldValues.Keys
'                    If Not DirectCast(otherFieldValue, FieldValue).ContainsValue(currentValue) Then
'                        Return False
'                    End If
'                Next

'                Return True
'            End If
'        End If

'        Return Not GlobalCommon.IsFieldValueChangeValid(mFieldValue, DirectCast(otherFieldValue, FieldValue).FieldValue, mDataType)

'    End Function

'    Public Overrides Function ToString() As String

'        Dim output As String = String.Empty

'        Select Case mDataType
'            Case DataFieldType.ListType
'                If mReferenceTableIsMaintainable Then
'                    Dim referenceList As ReferenceValueInfoList = ReferenceValueInfoList.GetList(mReferenceTableId)
'                    For Each referenceItem As ReferenceValueInfo In referenceList
'                        If referenceItem.Id.Equals(mFieldValue) Then
'                            output = referenceItem.Value
'                            If Not referenceItem.IsActive Then
'                                output &= " (inactive)"
'                            End If
'                            Exit For
'                        End If
'                    Next
'                Else
'                    Dim lookup As LookupList = LookupList.GetList(mReferenceTableId)
'                    For Each lookupItem As LookupList.NameValuePair In lookup
'                        If lookupItem.Key.Equals(mFieldValue) Then
'                            output = lookupItem.Value
'                            Exit For
'                        End If
'                    Next
'                End If

'            Case DataFieldType.BooleanType
'                If Not mFieldValue Is Nothing Then
'                    If mFieldValue.Equals(True) Then
'                        output = "Yes"
'                    End If
'                    If mFieldValue.Equals(False) Then
'                        output = "No"
'                    End If
'                End If

'            Case DataFieldType.MultiValueListType
'                Dim isFirst As Boolean = True
'                If mReferenceTableIsMaintainable Then
'                    Dim referenceList As ReferenceValueInfoList = ReferenceValueInfoList.GetList(mReferenceTableId)
'                    For Each referenceItem As ReferenceValueInfo In referenceList
'                        If FieldValues.Contains(referenceItem.Id) Then
'                            If Not isFirst Then
'                                output &= ", "
'                            End If
'                            output &= referenceItem.Value
'                            If Not referenceItem.IsActive Then
'                                output &= " (inactive)"
'                            End If
'                            isFirst = False
'                        End If
'                    Next
'                Else
'                    Dim lookup As LookupList = LookupList.GetList(mReferenceTableId)
'                    For Each lookupItem As LookupList.NameValuePair In lookup
'                        If FieldValues.Contains(lookupItem.Key) Then
'                            If Not isFirst Then
'                                output &= ", "
'                            End If
'                            output &= lookupItem.Value
'                            isFirst = False
'                        End If
'                    Next
'                End If

'            Case DataFieldType.DecimalType
'                If Not mFieldValue Is Nothing Then
'                    output = System.Convert.ToDecimal(mFieldValue).ToString("0.00")
'                End If

'            Case DataFieldType.DateType
'                If Not mFieldValue Is Nothing Then
'                    output = DirectCast(mFieldValue, Date).ToLongDateString()
'                End If

'            Case Else
'                If Not mFieldValue Is Nothing Then
'                    output = mFieldValue.ToString()
'                End If
'        End Select

'        Return output

'    End Function

'#End Region

'#Region " Factory Methods "

'    Friend Sub New(ByVal field As FieldMetadata, ByVal speciesId As Guid)
'        MarkAsChild()
'        Fetch(field, speciesId)
'        If mDataType = DataFieldType.ProfileVersionDataType Then
'            Dim profileInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(field.ParentId)
'            mFieldValue = CallByName(profileInfo, mShortName.Replace(" ", String.Empty), CallType.Get, Nothing)
'        End If
'    End Sub

'#End Region

'#Region " Data Access "

'    ''' <summary>
'    ''' Used by the constructors of other business objects to initialize the value of this field with data from the database
'    ''' </summary>
'    ''' <param name="fieldValue">the value to initialize to</param>
'    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
'    Friend Sub InitializeValue(ByVal fieldValue As Object)

'        mFieldValue = fieldValue
'        Me.ValidationRules.CheckRules("FieldValue")

'    End Sub

'    Friend Overrides Sub Update(ByVal question As QuestionBase, ByVal row As QuestionRow, ByVal species As QuestionSpecies, ByVal connection As SqlConnection)

'        Dim parameterName As String = String.Empty

'        If mDataType <> DataFieldType.MultiValueListType Then
'            Using updateFieldValueCommand As SqlCommand = connection.CreateCommand()
'                updateFieldValueCommand.CommandType = CommandType.StoredProcedure
'                If question.IsProfileVersionQuestion Then
'                    updateFieldValueCommand.CommandText = "spuProfileVersionFieldValue"
'                    updateFieldValueCommand.Parameters.AddWithValue("@ProfileVersionId", question.ParentId)
'                    updateFieldValueCommand.Parameters.AddWithValue("@ProfileFieldId", mId)
'                Else
'                    updateFieldValueCommand.CommandText = "spuSpeciesFieldValue"
'                    updateFieldValueCommand.Parameters.AddWithValue("@SpeciesId", question.ParentId)
'                    updateFieldValueCommand.Parameters.AddWithValue("@SpeciesFieldId", mId)
'                End If

'                If species IsNot Nothing Then
'                    updateFieldValueCommand.Parameters.AddWithValue("@SpeciesId", species.Id)
'                End If
'                If row IsNot Nothing Then
'                    updateFieldValueCommand.Parameters.AddWithValue("@ProfileVersionQuestionRowId", row.Id)
'                End If
'                Select Case mDataType
'                    Case DataFieldType.BooleanType
'                        parameterName = "@BooleanValue"
'                    Case DataFieldType.ListType
'                        parameterName = "@ListValue"
'                    Case DataFieldType.DecimalType
'                        parameterName = "@DecimalValue"
'                    Case DataFieldType.DateType
'                        parameterName = "@DateValue"
'                    Case DataFieldType.LongTextType, DataFieldType.TextType
'                        parameterName = "@TextValue"
'                End Select
'                updateFieldValueCommand.Parameters.AddWithValue(parameterName, mFieldValue)
'                updateFieldValueCommand.ExecuteNonQuery()
'            End Using

'        Else

'            'first, remove all multi-values from the database
'            Using deleteMultiValueCommand As SqlCommand = connection.CreateCommand
'                deleteMultiValueCommand.CommandType = CommandType.StoredProcedure
'                deleteMultiValueCommand.CommandText = "spdProfileVersionFieldMultiValue"
'                deleteMultiValueCommand.Parameters.AddWithValue("@ProfileVersionId", question.ParentId)
'                deleteMultiValueCommand.Parameters.AddWithValue("@ProfileFieldId", mId)
'                If species IsNot Nothing Then
'                    deleteMultiValueCommand.Parameters.AddWithValue("@SpeciesId", species.Id)
'                End If
'                If row IsNot Nothing Then
'                    deleteMultiValueCommand.Parameters.AddWithValue("@ProfileVersionQuestionRowId", row.Id)
'                End If
'                deleteMultiValueCommand.ExecuteNonQuery()
'            End Using

'            'then add back in any multi-values that are in this object
'            Using insertMultiValueCommand As SqlCommand = connection.CreateCommand

'                insertMultiValueCommand.CommandType = CommandType.StoredProcedure
'                insertMultiValueCommand.CommandText = "spiProfileVersionFieldMultiValue"
'                insertMultiValueCommand.Parameters.AddWithValue("@ProfileVersionId", question.ParentId)
'                insertMultiValueCommand.Parameters.AddWithValue("@ProfileFieldId", mId)
'                If species IsNot Nothing Then
'                    insertMultiValueCommand.Parameters.AddWithValue("@SpeciesId", species.Id)
'                End If
'                If row IsNot Nothing Then
'                    insertMultiValueCommand.Parameters.AddWithValue("@ProfileVersionQuestionRowId", row.Id)
'                End If
'                Dim valueParameter As New SqlParameter("@ListValue", SqlDbType.UniqueIdentifier)
'                insertMultiValueCommand.Parameters.Add(valueParameter)

'                'execute the stored procedure once for each value in the multi-value, inserting that value into the database
'                For Each item As Guid In mFieldValues.Keys
'                    valueParameter.Value = item
'                    insertMultiValueCommand.ExecuteNonQuery()
'                Next

'            End Using

'        End If

'        MarkOld()

'    End Sub

'#End Region

'End Class

