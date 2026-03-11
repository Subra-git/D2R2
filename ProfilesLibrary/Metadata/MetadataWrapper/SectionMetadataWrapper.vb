Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SectionMetadataWrapper
    Inherits ReadOnlyBase(Of SectionMetadataWrapper)

    Private mSectionMetadataBase As SectionMetadataBase
    Private mQuestionMetadataListWrapper As QuestionMetadataListWrapper
    Private mIsReadOnly As Boolean

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mSectionMetadataBase.Id
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mSectionMetadataBase.Name
        End Get
    End Property

    Public ReadOnly Property ShortName() As String
        Get
            Return mSectionMetadataBase.ShortName
        End Get
    End Property

    Public ReadOnly Property FormattedShortName() As String
        Get
            Return mSectionMetadataBase.ShortName.Substring(0, 1) & mSectionMetadataBase.ShortName.Substring(1).ToLower().Replace(" and ", " & ")
        End Get
    End Property

    Public ReadOnly Property SectionNumber() As Integer
        Get
            Return mSectionMetadataBase.SectionNumber
        End Get
    End Property

    Public ReadOnly Property QuestionMetadataList() As QuestionMetadataListWrapper
        Get
            Return mQuestionMetadataListWrapper
        End Get
    End Property

    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mIsReadOnly
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mSectionMetadataBase.Id
    End Function

    Public Overrides Function ToString() As String
        Return mSectionMetadataBase.Name
    End Function

#End Region

#Region " Factory Methods "

    Public Sub InitializeNonMetadata(ByVal isReadOnly As Boolean, ByVal parentId As Guid, ByVal profileVersionId As Guid, ByVal profiledSpeciesList As List(Of DataContracts.ProfiledSpecies), ByVal dtoQuestionNames As List(Of DataContracts.QuestionName))
        mIsReadOnly = isReadOnly

        'this must also loop through all child classes. 
        Dim index As Integer = 0
        For Each questionWrapper As QuestionMetadataWrapper In mQuestionMetadataListWrapper

            If dtoQuestionNames IsNot Nothing Then
                questionWrapper.InitializeNonMetadata(isReadOnly, parentId, profileVersionId, profiledSpeciesList, dtoQuestionNames(index))
            Else
                questionWrapper.InitializeNonMetadata(isReadOnly, parentId, profileVersionId, profiledSpeciesList, Nothing)
            End If


            index = index + 1
        Next

    End Sub

    Friend Shared Function GetSectionMetadataWrapper(ByVal sectionMetadata As SectionMetadataBase) As SectionMetadataWrapper
        Return New SectionMetadataWrapper(sectionMetadata)
    End Function

    Private Sub New(ByVal sectionMetadata As SectionMetadataBase)
        mSectionMetadataBase = sectionMetadata
        mQuestionMetadataListWrapper = QuestionMetadataListWrapper.GetQuestionMetadataListWrapper(sectionMetadata.QuestionMetadataList)
    End Sub

    Private Sub New()
        'requires use of factory methods
    End Sub

#End Region


End Class
