Imports Csla
Imports Csla.Data

<Serializable()> _
Public Class SectionInfo
    Inherits ReadOnlyBase(Of SectionInfo)

    Private mSectionId As Guid
    Private mSectionNumber As Integer
    Private mSectionName As String = String.Empty
    Private mVAReviewStatus As String
    Private mPolicyReviewStatus As String
    Private mAuthorReviewStatus As String
    Private mVAReviewDate As Csla.SmartDate
    Private mPolicyReviewDate As Csla.SmartDate
    Private mAuthorReviewDate As Csla.SmartDate
    Private mVAReviewCompletedDate As Csla.SmartDate
    Private mPolicyReviewCompletedDate As Csla.SmartDate
    Private mAuthorReviewCompletedDate As Csla.SmartDate

#Region " Business Methods "

    Public ReadOnly Property SectionId() As Guid
        Get
            Return mSectionId
        End Get
    End Property

    Public ReadOnly Property SectionNumber() As Integer
        Get
            Return mSectionNumber
        End Get
    End Property

    Public ReadOnly Property SectionName() As String
        Get
            Return mSectionName
        End Get
    End Property

    Public ReadOnly Property VAReviewStatus() As String
        Get
            Return mVAReviewStatus
        End Get
    End Property

    Public ReadOnly Property PolicyReviewStatus() As String
        Get
            Return mPolicyReviewStatus
        End Get
    End Property

    Public ReadOnly Property AuthorReviewStatus() As String
        Get
            Return mAuthorReviewStatus
        End Get
    End Property

    Public ReadOnly Property VAReviewDate() As String
        Get
            Return mVAReviewDate.ToString()
        End Get
    End Property

    Public ReadOnly Property PolicyReviewDate() As String
        Get
            Return mPolicyReviewDate.ToString()
        End Get
    End Property

    Public ReadOnly Property AuthorReviewDate() As String
        Get
            Return mAuthorReviewDate.ToString()
        End Get
    End Property

    Public ReadOnly Property VAReviewCompletedDate() As Csla.SmartDate
        Get
            Return mVAReviewCompletedDate
        End Get
    End Property

    Public ReadOnly Property PolicyReviewCompletedDate() As Csla.SmartDate
        Get
            Return mPolicyReviewCompletedDate
        End Get
    End Property

    Public ReadOnly Property AuthorReviewCompletedDate() As Csla.SmartDate
        Get
            Return mAuthorReviewCompletedDate
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mSectionId.ToString()
    End Function

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSectionInfo(ByVal reader As SafeDataReader) As SectionInfo

        Return New SectionInfo(reader)

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal reader As SafeDataReader)

        Fetch(reader)

    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal reader As SafeDataReader)
        mSectionId = reader.GetGuid(2)
        mSectionName = reader.GetString(3)
        mSectionNumber = reader.GetInt32(4)
        mVAReviewStatus = reader.GetString(5)
        mPolicyReviewStatus = reader.GetString(6)
        mAuthorReviewStatus = reader.GetString(7)
        mVAReviewDate = reader.GetSmartDate(8)
        mPolicyReviewDate = reader.GetSmartDate(9)
        mAuthorReviewDate = reader.GetSmartDate(10)
        mVAReviewCompletedDate = reader.GetSmartDate(11)
        mPolicyReviewCompletedDate = reader.GetSmartDate(12)
        mAuthorReviewCompletedDate = reader.GetSmartDate(13)
    End Sub

#End Region

End Class
