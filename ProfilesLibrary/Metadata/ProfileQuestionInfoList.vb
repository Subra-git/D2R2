Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileQuestionInfoList
    Inherits ReadOnlyListBase(Of ProfileQuestionInfoList, ProfileQuestionInfo)

    Private mProfileQuestionInfoList As New Dictionary(Of Guid, ProfileQuestionInfo)

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        Return True
    End Function

#End Region

#Region " Factory Methods "

    Public Function GetQuestionInfoById(ByVal questionId As Guid) As ProfileQuestionInfo
        If mProfileQuestionInfoList.ContainsKey(questionId) Then
            Return mProfileQuestionInfoList(questionId)
        Else
            Return Nothing
        End If
    End Function


    Public Shared Function GetList(ByVal profileSectionId As Guid) As ProfileQuestionInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of profile questions.")
        End If

        Return DataPortal.Fetch(Of ProfileQuestionInfoList)(New Criteria(profileSectionId))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mProfileSectionId As Guid

        Public ReadOnly Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
        End Property

        Public Sub New(ByVal profileSectionId As Guid)

            mProfileSectionId = profileSectionId

        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IProfileQuestionService = DataFactory.GetProfileQuestionService
        Dim dtoQuestionInfoList As List(Of DataContracts.ProfileQuestionInfo) = _
            db.GetProfileQuestionInfoList(New DataContracts.GetProfileQuestionInfoListRequest(criteria.ProfileSectionId))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoQuestionInfo As DataContracts.ProfileQuestionInfo In dtoQuestionInfoList
            Dim currentProfileQuestionInfo As ProfileQuestionInfo = ProfileQuestionInfo.GetProfileQuestionInfo(dtoQuestionInfo)
            mProfileQuestionInfoList.Add(currentProfileQuestionInfo.Id, currentProfileQuestionInfo)
            Me.Add(currentProfileQuestionInfo)
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class


