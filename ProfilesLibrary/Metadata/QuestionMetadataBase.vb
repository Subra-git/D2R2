Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public MustInherit Class QuestionMetadataBase
    Inherits ReadOnlyBase(Of QuestionMetadataBase)

#Region " Business Methods "

    Protected mId As Guid
    Protected mQuestionNumber As Integer
    Protected mFieldMetadataList As FieldMetadataListBase
    Protected mShortName As String

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property QuestionNumber() As Integer
        Get
            Return mQuestionNumber
        End Get
    End Property

    Public ReadOnly Property FieldMetadataList() As FieldMetadataListBase
        Get
            Return mFieldMetadataList
        End Get
    End Property

    Public Overridable ReadOnly Property IsPerSpecies() As Boolean
        Get
            Return False
        End Get
    End Property

    Public Overridable ReadOnly Property IsRepeating() As Boolean
        Get
            Return False
        End Get
    End Property

    Public Overridable ReadOnly Property IrrelevanceFieldId() As Guid
        Get
            Return Guid.Empty
        End Get
    End Property

    Public Overridable ReadOnly Property IrrelevanceValueId() As Guid
        Get
            Return Guid.Empty
        End Get
    End Property

    Public Overridable ReadOnly Property IrrelevanceFlag() As Boolean
        Get
            Return False
        End Get
    End Property

    Public MustOverride ReadOnly Property ShortName() As String

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

#End Region

#Region " Data Access "

    Protected Overridable Sub Fetch(ByVal dtoQuestionMetadata As DataContracts.QuestionMetadata)
        mId = dtoQuestionMetadata.Id
        mQuestionNumber = dtoQuestionMetadata.QuestionNumber
    End Sub

#End Region


End Class

