Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileQuestionMetadataList
    Inherits QuestionMetadataListBase

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean

        Return True

    End Function

#End Region

#Region " Factory Method "

    Public Shared Function GetProfileQuestionMetadataList(ByVal dtoQuestionMetadataList As List(Of DataContracts.QuestionMetadata)) As ProfileQuestionMetadataList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to get a list of profile question metadata")
        End If

        Return New ProfileQuestionMetadataList(dtoQuestionMetadataList)
    End Function

    Private Sub New()
        '
    End Sub

    Private Sub New(ByVal dtoQuestionMetadataList As List(Of DataContracts.QuestionMetadata))
        Fetch(dtoQuestionMetadataList)
    End Sub

#End Region

#Region "Profile Guidance Report"
    Private Shared Function CanGetProfileGuidanceReport() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

    Public Shared Function GetProfileGuidanceReport(ByVal reportType As ProfileGuidanceReportType) As Byte()

        If Not CanGetProfileGuidanceReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get the profile guidance report")
        End If

        Return GetProfileGuidanceReportCommand.GetProfileGuidanceReport(reportType)

    End Function
#End Region
#Region " Data Access "

    Private Sub Fetch(ByVal dtoQuestionMetadataList As List(Of DataContracts.QuestionMetadata))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoProfileQuestionMetadata As DataContracts.ProfileQuestionMetadata In dtoQuestionMetadataList
            Dim currentProfileQuestionMetadata As ProfileQuestionMetadata = ProfileQuestionMetadata.GetProfileQuestionMetadata(dtoProfileQuestionMetadata)
            mQuestionInfoList.Add(currentProfileQuestionMetadata.Id, currentProfileQuestionMetadata)
            Me.Add(currentProfileQuestionMetadata)
        Next

        RaiseListChangedEvents = True
        IsReadOnly = True

    End Sub

#End Region

End Class


