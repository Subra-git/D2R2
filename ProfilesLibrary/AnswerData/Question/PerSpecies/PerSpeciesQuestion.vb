Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class PerSpeciesQuestion
    Inherits QuestionBase

#Region " Business Methods "

    Private mSpeciesList As QuestionSpeciesList
    Private mProfiledSpeciesList As New List(Of ProfiledSpecies)

    Public ReadOnly Property SpeciesList() As QuestionSpeciesList
        Get
            Return mSpeciesList
        End Get
    End Property

    Public ReadOnly Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
        Get
            Return mProfiledSpeciesList
        End Get
    End Property

    ''' <summary>
    ''' Removes all the data from this question.
    ''' </summary>
    ''' <remarks>Called from Section to implement the Clear Section functionality.</remarks>
    Public Overrides Sub Clear()

        For Each species As QuestionSpecies In mSpeciesList
            species.Clear()
        Next

    End Sub

    Public Overrides Function Validate() As List(Of InvalidReason)

        Dim questionInvalidReasons As New List(Of InvalidReason)

        For Each species As QuestionSpecies In mSpeciesList
            questionInvalidReasons.AddRange(species.Validate())
        Next

        For Each reason As InvalidReason In questionInvalidReasons
            reason.QuestionNumber = mQuestionMetadata.QuestionNumber
            reason.QuestionShortName = mQuestionMetadata.ShortName
            reason.QuestionFullName = mQuestionMetadata.Name
        Next

        Return questionInvalidReasons

    End Function

    Public Overrides Function ValuesEqual(ByVal otherQuestion As QuestionBase) As Boolean

        If Not TypeOf otherQuestion Is PerSpeciesQuestion Then
            Return False
        End If

        Return mSpeciesList.ValuesEqual(DirectCast(otherQuestion, PerSpeciesQuestion).SpeciesList)

    End Function

    Public Overrides ReadOnly Property IsValid() As Boolean
        Get
            Return MyBase.IsValid AndAlso mSpeciesList.IsValid
        End Get
    End Property

    Public Overrides ReadOnly Property IsDirty() As Boolean
        Get
            Return MyBase.IsDirty OrElse mSpeciesList.IsDirty
        End Get
    End Property

#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to create a new PerSpeciesQuestion object, with metadata from the passed in datareader
    ''' </summary>
    ''' <param name="reader">datareader containing metadata for the question</param>
    ''' <returns>PerSpeciesQuestion representing the question within a profile section</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetPerSpeciesQuestion(ByVal questionMetadata As QuestionMetadataWrapper) As PerSpeciesQuestion
        Return New PerSpeciesQuestion(questionMetadata)
    End Function

    ''' <summary>
    ''' Private constructor to prevent direct instantiation
    ''' </summary>
    Private Sub New()
        MarkAsChild()
    End Sub

    ''' <summary>
    ''' Constructor called from the factory method to create a new ProfileVersionQuestion object, with metadata
    ''' from the passed in datareader
    ''' </summary>
    ''' <param name="reader">datareader containing metadata for the question</param>
    Private Sub New(ByVal questionMetadata As QuestionMetadataWrapper)
        MarkAsChild()
        Fetch(questionMetadata)
        mSpeciesList = QuestionSpeciesList.NewQuestionSpeciesList()
        mProfiledSpeciesList = New List(Of ProfiledSpecies)
    End Sub

#End Region

#Region " Data access "

    ''' <summary>
    ''' Initialize a QuestionSpecies object within this question
    ''' </summary>
    ''' <param name="id">Unique identifier for the species</param>
    ''' <param name="name">Name of the species</param>
    ''' <param name="isActive">Species status</param>
    '<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Sub FetchSpecies(ByVal profiledSpecies As DataContracts.ProfiledSpecies)
        Dim currentProfiledSpecies As New ProfiledSpecies(profiledSpecies.Id, profiledSpecies.Name, profiledSpecies.IsActive)
        mProfiledSpeciesList.Add(currentProfiledSpecies)
        mSpeciesList.FetchSpecies(currentProfiledSpecies, mQuestionMetadata.FieldMetadataList)
    End Sub

    Protected Overrides Function GetFieldValueListForFetch(ByVal dtoFieldValue As DataContracts.FieldValue) As FieldValueList
        Return mSpeciesList.GetById(DirectCast(dtoFieldValue, DataContracts.ProfileFieldValue).SpeciesId).FieldValues
    End Function

    Protected Overrides Sub DoUpdate()
        mSpeciesList.Update()
    End Sub

    Protected Overrides Sub DoGetUpdate(ByVal changeset As Profiles.Contracts.DataContracts.AnswerDataChangeSet)

        Me.SpeciesList.GetUpdate(Me, changeset)

    End Sub

#End Region


End Class

