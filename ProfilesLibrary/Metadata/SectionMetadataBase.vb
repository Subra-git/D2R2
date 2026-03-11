Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public MustInherit Class SectionMetadataBase
    Inherits ReadOnlyBase(Of SectionMetadataBase)

#Region " Business Methods "

    Protected mId As Guid
    Protected mName As String = String.Empty
    Protected mShortName As String = String.Empty
    Protected mSectionNumber As Integer
    Protected mNote As String = String.Empty
    Protected mQuestionMetadataList As QuestionMetadataListBase

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property

    Public ReadOnly Property ShortName() As String
        Get
            Return mShortName
        End Get
    End Property

    Public ReadOnly Property FormattedShortName() As String
        Get
            Return mShortName.Substring(0, 1) & mShortName.Substring(1).ToLower().Replace(" and ", " & ")
        End Get
    End Property

    Public ReadOnly Property FormattedNumberredShortName() As String
        Get
            Return SectionNumber & ": " & mShortName.Substring(0, 1) & mShortName.Substring(1).ToLower().Replace(" and ", " & ")
        End Get
    End Property

    Public ReadOnly Property SectionNumber() As Integer
        Get
            Return mSectionNumber
        End Get
    End Property

    Public ReadOnly Property Note() As String
        Get
            Return mNote
        End Get
    End Property

    Public ReadOnly Property QuestionMetadataList() As QuestionMetadataListBase
        Get
            Return mQuestionMetadataList
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String
        Return mName
    End Function
#End Region

End Class
