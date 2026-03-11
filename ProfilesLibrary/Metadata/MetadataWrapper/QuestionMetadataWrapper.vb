Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class QuestionMetadataWrapper
    Inherits ReadOnlyBase(Of QuestionMetadataWrapper)

#Region " Business Methods "

    Private mQuestionMetadata As QuestionMetadataBase
    Private mFieldMetadataListWrapper As FieldMetadataListWrapper
    Private mIsReadOnly As Boolean
    Private mParentId As Guid
    Private mName As String
    Private mNonTechnicalName As String

    Public ReadOnly Property Id() As Guid
        Get
            Return mQuestionMetadata.Id
        End Get
    End Property

    Public ReadOnly Property QuestionNumber() As Integer
        Get
            Return mQuestionMetadata.QuestionNumber
        End Get
    End Property

    Public ReadOnly Property FieldMetadataList() As FieldMetadataListWrapper
        Get
            Return mFieldMetadataListWrapper
        End Get
    End Property

    Public ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return mQuestionMetadata.IsPerSpecies
        End Get
    End Property

    Public ReadOnly Property IsRepeating() As Boolean
        Get
            Return mQuestionMetadata.IsRepeating
        End Get
    End Property

    Public ReadOnly Property IrrelevanceFieldId() As Guid
        Get
            Return mQuestionMetadata.IrrelevanceFieldId
        End Get
    End Property

    Public ReadOnly Property IrrelevanceValueId() As Guid
        Get
            Return mQuestionMetadata.IrrelevanceValueId
        End Get
    End Property

    Public ReadOnly Property IrrelevanceFlag() As Boolean
        Get
            Return mQuestionMetadata.IrrelevanceFlag
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property
    Public ReadOnly Property NonTechnicalName() As String
        Get
            Return mNonTechnicalName
        End Get
    End Property
    Public ReadOnly Property ShortName() As String
        Get
            Return mQuestionMetadata.ShortName
        End Get
    End Property

    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mIsReadOnly
        End Get
    End Property

    Public ReadOnly Property ParentId() As Guid
        Get
            Return mParentId
        End Get
    End Property

    Public ReadOnly Property IsProfileVersionQuestion() As Boolean
        Get
            If TypeOf (mQuestionMetadata) Is ProfileQuestionMetadata Then
                Return True
            Else
                Return False
            End If
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mQuestionMetadata.Id
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetQuestionMetadataWrapper(ByVal questionMetadata As QuestionMetadataBase) As QuestionMetadataWrapper
        Return New QuestionMetadataWrapper(questionMetadata)
    End Function

    Private Sub New(ByVal questionMetadata As QuestionMetadataBase)
        mQuestionMetadata = questionMetadata
        mFieldMetadataListWrapper = FieldMetadataListWrapper.GetFieldMetadataListWrapper(questionMetadata.FieldMetadataList)

        Dim speciesQuestion As SpeciesQuestionMetadata = TryCast(questionMetadata, SpeciesQuestionMetadata)

        If speciesQuestion IsNot Nothing Then
            mName = speciesQuestion.Name
            mNonTechnicalName = speciesQuestion.NonTechnicalName
        End If

    End Sub

    Private Sub New()
        ' requires use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Friend Sub InitializeNonMetadata(ByVal isReadOnly As Boolean, ByVal parentId As Guid, ByVal profileVersionId As Guid, ByVal profiledSpeciesList As List(Of DataContracts.ProfiledSpecies), ByVal dtoQuestionName As DataContracts.QuestionName)
        mIsReadOnly = isReadOnly
        mParentId = parentId

        If dtoQuestionName IsNot Nothing Then
            mName = dtoQuestionName.Name
            mNonTechnicalName = dtoQuestionName.NonTechnicalName
        End If

        For Each fieldWrapper As FieldMetadataWrapper In mFieldMetadataListWrapper
            fieldWrapper.InitializeNonMetadata(isReadOnly, parentId, profileVersionId, profiledSpeciesList)
        Next

    End Sub

#End Region

End Class
