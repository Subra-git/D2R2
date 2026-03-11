Imports Csla
Imports Profiles.Contracts
Imports System.Text

''' <summary>
''' A class inherited from EventArgs to enable the RelevanceChanged event to indicate which question's relevant / irrelevant
''' status changed.
''' </summary>
Public Class RelevanceChangedEventArgs
    Inherits EventArgs

    Private mQuestion As QuestionBase
    Private mSpeciesId As Guid

    ''' <summary>
    ''' The question whose relevance status changed.
    ''' </summary>
    ''' <returns>A ProfileVersionQuestion object</returns>
    Public ReadOnly Property Question() As QuestionBase
        Get
            Return mQuestion
        End Get
    End Property

    ''' <summary>
    ''' The species Id for the species within the question whose relevance status has changed
    ''' </summary>    
    ''' <remarks></remarks>
    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public Sub New(ByVal question As QuestionBase)
        mQuestion = question
    End Sub

    Public Sub New(ByVal question As QuestionBase, ByVal speciesId As Guid)
        mQuestion = question
        mSpeciesId = speciesId
    End Sub
End Class

<Serializable()>
Public MustInherit Class SectionBase
    Inherits BusinessBase(Of SectionBase)

#Region " Business Methods "

    Protected mParentId As Guid
    Protected mSectionId As Guid
    Protected mSectionName As String
    Protected mSectionShortName As String
    Protected mSectionNumber As Integer

    Private mIsReadOnly As Nullable(Of Boolean) = Nothing
    Private mQuestionList As QuestionList = QuestionList.NewQuestionList()

    Private Shared mAllQuestionsDictionary As Dictionary(Of Guid, QuestionBase)

    ''' <summary>
    ''' Unique identifier for the object to which this section belongs.
    ''' </summary>
    ''' <returns>identifier</returns>
    Public ReadOnly Property ParentId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mParentId
        End Get
    End Property

    ''' <summary>
    ''' Unique identifier for the section that this object represents within the parent object.
    ''' </summary>
    ''' <returns>profile section identifier</returns>
    Public ReadOnly Property SectionId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mSectionId
        End Get
    End Property

    ''' <summary>
    ''' Section metadata: the full name of the section
    ''' </summary>
    ''' <returns>Section name</returns>
    Public ReadOnly Property SectionName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mSectionName
        End Get
    End Property

    ''' <summary>
    ''' Section metadata: the short name of the section
    ''' </summary>
    ''' <returns>Section short name</returns>
    Public ReadOnly Property SectionShortName() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mSectionShortName
        End Get
    End Property

    Public ReadOnly Property FormattedSectionShortName() As String
        Get
            Return mSectionShortName.Substring(0, 1) & mSectionShortName.Substring(1).ToLower().Replace(" and ", " & ")
        End Get
    End Property

    ''' <summary>
    ''' Section metadata: the number of the section within the profile
    ''' </summary>
    ''' <returns>Section number</returns>
    Public ReadOnly Property SectionNumber() As Integer
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)>
        Get
            CanReadProperty(True)
            Return mSectionNumber
        End Get
    End Property

    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            If Not mIsReadOnly.HasValue Then
                mIsReadOnly = Not CanEditSection()
            End If
            Return mIsReadOnly.Value
        End Get
    End Property

    ''' <summary>
    ''' A list of the questions belonging to this section.
    ''' </summary>
    ''' <returns>QuestionList object containing QuestionBase objects for each question in the section</returns>
    Public ReadOnly Property Questions() As QuestionList
        Get
            Return mQuestionList
        End Get
    End Property

    ''' <summary>
    ''' A shared dictionary of all questions in this profile
    ''' This was added as part of CR-083 to make it possible to have an answer to a question in one section
    ''' effect the visibility of a question in another section.
    ''' </summary>
    Public Shared ReadOnly Property AllQuestionsDictionary() As Dictionary(Of Guid, QuestionBase)
        Get
            If mAllQuestionsDictionary Is Nothing Then
                mAllQuestionsDictionary = New Dictionary(Of Guid, QuestionBase)
            End If

            Return mAllQuestionsDictionary
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mParentId.ToString() & " - " & mSectionId.ToString()
    End Function

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mQuestionList.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mQuestionList.IsDirty
        End Get
    End Property

    ''' <summary>
    ''' Checks to see if the values in the object equal that of the object passed in.
    ''' </summary>
    Public Function ValuesEqual(ByVal otherSection As SectionBase) As Boolean

        Return mQuestionList.ValuesEqual(otherSection.Questions)

    End Function

    ''' <summary>
    ''' Perfom validation of all questions in this section
    ''' </summary>
    ''' <returns>list of items that have failed validation</returns>    
    Public Function Validate() As List(Of InvalidReason)

        If Not CanGetSection() Then
            Throw New System.Security.SecurityException("You do not have permission to validate a section of a profile")
        End If

        Dim invalidReasonList As New List(Of InvalidReason)
        ValidateSectionData(invalidReasonList)

        For Each question As QuestionBase In mQuestionList
            invalidReasonList.AddRange(question.Validate())
        Next

        For Each reason As InvalidReason In invalidReasonList
            reason.SectionNumber = SectionNumber
        Next

        Return invalidReasonList

    End Function

    Protected Overridable Sub ValidateSectionData(ByVal invalidReasonList As List(Of InvalidReason))
        'by default, do nothing
    End Sub

#End Region

#Region "Relevance Handling"

    ''' <summary>
    ''' event to be raised when the relevance status of a question within this section has changed
    ''' </summary>
    Public Event RelevanceChanged As EventHandler(Of RelevanceChangedEventArgs)

    ''' <summary>
    ''' Method to allow the RelevanceChanged event to be raised in a way that can be overriden in classes that inherit from this
    ''' class
    ''' </summary>
    ''' <param name="e">the event arguments for the event to be raised</param>
    Protected Overridable Sub OnRelevanceChanged(ByVal e As RelevanceChangedEventArgs)
        RaiseEvent RelevanceChanged(Me, e)
    End Sub

    ''' <summary>
    ''' This method is called from the constructors after the chains of child objects have been initialized. It loops through each
    ''' FieldValue within the section, and if that field affects the relevance of other questions within the section, 
    '''       (This was updated as part of CR-083 to allow answers questions in one section to effect the
    '''        relevance of questions in another section.  Now it loops through each FieldValue in the whole profile)
    ''' it attaches an event handler to the FieldValue so that the Section object can be informed of changes to the value that might
    ''' affect the relevance of other questions. In addition, it also performs initial calculations of the relevance of each of the 
    ''' questions in the section.
    ''' </summary>
    Friend Sub AddEventHandlers()

        makeAllQuestionsDictionary()

        'loop through each question
        For Each question As QuestionBase In AllQuestionsDictionary.Values
            If TypeOf question Is PerSpeciesQuestion Then
                'if the question is per-species, then loop through each species
                For Each species As QuestionSpecies In DirectCast(question, PerSpeciesQuestion).SpeciesList
                    'loop through each fieldvalue and add an event handler if required
                    For Each field As FieldValueBase In species.FieldValues
                        If field.AffectsRelevance Or field.AffectsVisibility Then
                            AddHandler field.PropertyChanged, AddressOf fieldValue_PropertyChanged
                            If field.AffectsRelevance Then CalculateRelevance(field)
                            If field.AffectsVisibility Then CalculateVisibility(field)
                        End If
                        If field.SourceOfDataReplication Then
                            AddHandler field.PropertyChanged, AddressOf fieldValue_PropertyChanged
                        End If
                    Next
                Next
            ElseIf TypeOf question Is StandardQuestion Then
                'loop through each fieldvalue and add an event handler if required
                For Each field As FieldValueBase In DirectCast(question, StandardQuestion).FieldValues
                    If field.AffectsRelevance Or field.AffectsVisibility Then
                        AddHandler field.PropertyChanged, AddressOf fieldValue_PropertyChanged
                        If field.AffectsRelevance Then CalculateRelevance(field)
                        If field.AffectsVisibility Then CalculateVisibility(field)
                    End If
                    If field.SourceOfDataReplication Then
                        AddHandler field.PropertyChanged, AddressOf fieldValue_PropertyChanged
                    End If
                Next
            End If
        Next
    End Sub


    Private Sub makeAllQuestionsDictionary()

        For Each sectionQuestion As QuestionBase In mQuestionList
            If sectionQuestion IsNot Nothing Then
                If Not AllQuestionsDictionary.ContainsKey(sectionQuestion.Id) Then
                    AllQuestionsDictionary.Add(sectionQuestion.Id, sectionQuestion)
                Else
                    AllQuestionsDictionary.Remove(sectionQuestion.Id)
                    AllQuestionsDictionary.Add(sectionQuestion.Id, sectionQuestion)
                End If
            End If
        Next

    End Sub

    ''' <summary>
    ''' This is the event handler method for the event handlers attached to the PropertyChanged event in the AddEventHandlers method.
    ''' Whenever a value changes for a FieldValue object within this section whose value affects the relevance of other questions within
    ''' the section, this method is called. It recalculates the relevance status for questions that may have been affected by the change.
    ''' </summary>
    ''' <param name="sender">the sender object for this event - in this case, a FieldValue object</param>
    ''' <param name="e">the event arguments for this event</param>
    Private Sub fieldValue_PropertyChanged(ByVal sender As Object, ByVal e As System.ComponentModel.PropertyChangedEventArgs)

        Dim field As FieldValueBase = DirectCast(sender, FieldValueBase)
        If field.AffectsRelevance Then CalculateRelevance(field)
        If field.AffectsVisibility Then CalculateVisibility(field)

    End Sub

    ''' <summary>
    ''' Recalculates the relevance of each question in the section, based on the value of the FieldValue object passed in.
    ''' </summary>
    ''' <param name="field">The FieldValue whose value may affect the relevance of questions within the section.</param>
    Private Sub CalculateRelevance(ByVal field As FieldValueBase)

        For Each question As QuestionBase In mQuestionList
            CalculateRelevance(field, question)
        Next

    End Sub

    Public Sub ReplicateData()
        Dim sourceFields As IEnumerable(Of FieldValueBase)

        sourceFields = GetSourceFields()
        For Each sourceField As FieldValueBase In sourceFields
            For Each question As QuestionBase In mQuestionList

                If TypeOf question Is PerSpeciesQuestion Then
                    Dim speciesQuestion As PerSpeciesQuestion = DirectCast(question, PerSpeciesQuestion)
                    If (speciesQuestion.SpeciesList.GetById(sourceField.SpeciesId)) Is Nothing Then
                        Dim speciesListValues As List(Of QuestionSpecies) = speciesQuestion.SpeciesList.ToList()

                        For Each value As QuestionSpecies In speciesListValues
                            UpdateFieldValues(sourceField, value.FieldValues)
                        Next
                    End If
                ElseIf TypeOf question Is StandardQuestion Then
                    UpdateFieldValues(sourceField, DirectCast(question, StandardQuestion).FieldValues)
                End If

            Next
        Next

    End Sub


    Private Function GetSourceFields() As IEnumerable(Of FieldValueBase)
        Dim sourceFieldsList As IEnumerable(Of FieldValueBase) = New List(Of FieldValueBase)
        Dim sourceFields As IEnumerable(Of FieldValueBase) = New List(Of FieldValueBase)

        For Each question As QuestionBase In mQuestionList
            If TypeOf question Is PerSpeciesQuestion Then
                Dim speciesQuestion As PerSpeciesQuestion = DirectCast(question, PerSpeciesQuestion)
                Dim speciesListValues As List(Of QuestionSpecies) = speciesQuestion.SpeciesList.ToList()
                sourceFields = speciesListValues.SelectMany(Function(v)
                                                                Return v.FieldValues
                                                            End Function).Where(Function(field)
                                                                                    Return field.SourceOfDataReplication
                                                                                End Function)
            ElseIf TypeOf question Is StandardQuestion Then
                sourceFields = DirectCast(question, StandardQuestion).FieldValues.Where(Function(f)
                                                                                            Return f.SourceOfDataReplication
                                                                                        End Function)
            End If
            sourceFieldsList = sourceFieldsList.Union(sourceFields)
        Next

        Return sourceFieldsList

    End Function

    Private Sub UpdateFieldValues(sourceField As FieldValueBase, fieldValues As FieldValueList)
        For Each targetField As FieldValueBase In fieldValues
            If sourceField.TargetFieldList.Contains(targetField.Id) And Not targetField.IsReadOnly Then
                If targetField.DataType.Equals(DataFieldType.LongTextType) And
                    Not targetField.IsReadOnly Then
                    '' Business logic dictates that only update the target field if it has no text already
                    If String.IsNullOrEmpty(targetField.GetValue.ToString) Then
                        targetField.SetValue(sourceField.GetValue)
                        'Dim updatableField As FieldMetadataWrapper = question.FieldList.FirstOrDefault(Function(f) f.Id = targetField.Id)
                    End If
                ElseIf Not targetField.DataType.Equals(DataFieldType.FieldGroup) And
                    Not targetField.DataType.Equals(DataFieldType.MultiValueListType) And
                    Not targetField.IsReadOnly Then
                    targetField.SetValue(sourceField.GetValue)
                End If
            End If
        Next
    End Sub

    Private Sub CalculateVisibility(ByVal field As FieldValueBase)

        If field.AffectsVisibility Then
            For Each question As QuestionBase In mQuestionList
                For Each fieldForSettingVisibility As FieldMetadataWrapper In question.FieldList
                    If fieldForSettingVisibility.RelevanceFieldId.Equals(field.Id) Then
                        Dim fieldValue As Guid = DirectCast(field, ListFieldValue).FieldValue

                        If Not fieldForSettingVisibility.RelevanceValueId.Equals(fieldValue) Then
                            fieldForSettingVisibility.IsVisible = False
                        Else
                            fieldForSettingVisibility.IsVisible = True
                        End If
                    End If
                Next
            Next
        End If

    End Sub

    ''' <summary>
    ''' Recalculates the relevance of a particular question in the section, based on the value of the FieldValue object passed in.
    ''' </summary>
    ''' <param name="field">The FieldValue whose value may affect the relevance of questions within the section.</param>
    ''' <param name="question">The ProfileVersionQuestion whose relevance is to be calculated.</param>
    ''' <remarks></remarks>
    Private Sub CalculateRelevance(ByVal field As FieldValueBase, ByVal question As QuestionBase)

        Dim isRelevant As Boolean
        Dim oldRelevance As Boolean

        If field.IsPerSpecies AndAlso TypeOf question Is PerSpeciesQuestion Then
            Dim questionSpecies As QuestionSpecies
            questionSpecies = DirectCast(question, PerSpeciesQuestion).SpeciesList.GetById(field.SpeciesId)
            If questionSpecies Is Nothing Then
                oldRelevance = question.IsRelevant
            Else
                oldRelevance = questionSpecies.IsRelevant
            End If
        Else
            oldRelevance = question.IsRelevant
        End If

        'if the irrelevance field of the question matches the FieldValue, then the relevance status may have changed
        If question.IrrelevanceFieldId.Equals(field.Id) Then
            'if the FieldValue is empty, dependent questions are automatically considered irrelevant
            If field.IsEmpty Then
                isRelevant = False
            Else
                'calculate the relevance depending on whether the field is a List or a Boolean: if a List, match the IrrelevanceValueId
                If Not question.IrrelevanceValueId.Equals(Guid.Empty) Then     'list
                    Dim newValue As Guid = DirectCast(field, ListFieldValue).FieldValue

                    ' additional complication - if we have a list and the irrelevance flag is set to 1
                    ' then the IrrelevanceValueId tells you that the field is relevant for this selection
                    If question.IrrelevanceFlag Then
                        isRelevant = newValue.Equals(question.IrrelevanceValueId)
                    Else
                        ' if the flag is not set, then the field is irrelevant.
                        isRelevant = Not (newValue.Equals(question.IrrelevanceValueId))
                    End If

                    'otherwise, match the IrrelevanceFlag
                Else ' boolean
                    Dim newValue As Boolean = DirectCast(field, BooleanFieldValue).FieldValue.Value
                    isRelevant = Not (newValue = question.IrrelevanceFlag)
                End If
            End If

            If TypeOf question Is PerSpeciesQuestion Then
                Dim speciesQuestion As PerSpeciesQuestion = DirectCast(question, PerSpeciesQuestion)

                If field.IsPerSpecies Then
                    'This code has been added to assist in debugging bug SFW13361 - D2R2 Error Messages. Please leave in until the bug is resolved - NR 2014/11/18
                    If (speciesQuestion.SpeciesList.GetById(field.SpeciesId)) Is Nothing Then
                        Dim speciesListValues As List(Of QuestionSpecies) = speciesQuestion.SpeciesList.ToList()
                        Dim sb As New StringBuilder()
                        For Each value As QuestionSpecies In speciesListValues
                            sb.Append(value.Id)
                            sb.Append(",")
                        Next
                        Throw New Exception(String.Format("A relevancy was attempted to be calculated for species with id '{0}' but the species list only contained the following values '{1}'. Please contact a system administrator.", field.SpeciesId.ToString(), sb.ToString()))
                    End If

                    oldRelevance = speciesQuestion.SpeciesList.GetById(field.SpeciesId).IsRelevant

                    'if affected field is per species then set relevant for affected field species only
                    speciesQuestion.SpeciesList.GetById(field.SpeciesId).IsRelevant = isRelevant

                    'if the relevance status of this a species in this question has changed, raise a RelevanceChanged event
                    If isRelevant <> oldRelevance Then
                        OnRelevanceChanged(New RelevanceChangedEventArgs(question, field.SpeciesId))
                    End If
                Else
                    'if affected field is not per species then in questions that contain multiple species,
                    'all must be affected
                    oldRelevance = question.IsRelevant

                    For Each species As QuestionSpecies In speciesQuestion.SpeciesList
                        species.IsRelevant = isRelevant
                    Next
                    question.IsRelevant = isRelevant

                    'if the relevance status of this question has changed, raise a RelevanceChanged event
                    If isRelevant <> oldRelevance Then
                        OnRelevanceChanged(New RelevanceChangedEventArgs(question))
                    End If
                End If
            Else
                oldRelevance = question.IsRelevant

                'set relevance at question level
                question.IsRelevant = isRelevant

                'if the relevance status of this question has changed, raise a RelevanceChanged event
                If isRelevant <> oldRelevance Then
                    OnRelevanceChanged(New RelevanceChangedEventArgs(question))
                End If
            End If

        End If

    End Sub

#End Region

#Region " Authorisation rules "

    Protected MustOverride Function CanGetSection() As Boolean

    Protected MustOverride Function CanEditSection() As Boolean

#End Region

#Region " Data Access "

    Friend Sub FetchQuestion(ByVal questionMetadata As QuestionMetadataWrapper)
        mQuestionList.FetchQuestion(questionMetadata)
    End Sub

    Friend Sub InitializeNonMetadata(ByVal sectionMetadata As SectionMetadataWrapper, ByVal dtoProfiledSpecies As List(Of DataContracts.ProfiledSpecies), ByVal dtoQuestionNames As List(Of DataContracts.QuestionName), ByVal profileVersionId As Guid)
        sectionMetadata.InitializeNonMetadata(IsReadOnly, mParentId, profileVersionId, dtoProfiledSpecies, dtoQuestionNames)
    End Sub

    Friend Sub InitializeFieldValueLists()
        mQuestionList.InitializeFieldValueLists()
    End Sub

    Friend Sub Update()
        DoUpdate()
    End Sub

    Protected Overridable Sub DoUpdate()
        mQuestionList.Update()
    End Sub

#End Region

End Class

