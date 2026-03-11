Imports ProfilesLibrary
Imports System.ComponentModel

Public Class SectionPagination
    Inherits System.Web.UI.UserControl

    Private mTargetUrl As String = "#"

    Public Event NavigateNext As CancelEventHandler
    Public Event NavigatePrevious As CancelEventHandler

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Overridable Sub OnNavigateNext(ByVal e As CancelEventArgs)
        RaiseEvent NavigateNext(Me, e)
    End Sub

    Protected Overridable Sub OnNavigatePrevious(ByVal e As CancelEventArgs)
        RaiseEvent NavigatePrevious(Me, e)
    End Sub

    Public Property TargetUrl As String
        Get
            Return mTargetUrl
        End Get
        Set(value As String)
            mTargetUrl = value
        End Set
    End Property

    Public Sub SetupPaginationLinks(CurrentSectionList As SectionListBase, CurrentSectionId As Guid)
        Dim previousSection As SectionBase = Nothing
        Dim currentSection As SectionBase = Nothing
        Dim nextSection As SectionBase = Nothing

        For i As Integer = 0 To CurrentSectionList.Count - 1
            currentSection = CurrentSectionList(i)

            If currentSection.SectionId = CurrentSectionId Then
                If i = 0 And CurrentSectionList.Count > 1 Then
                    nextSection = CurrentSectionList(i + 1)
                ElseIf i = CurrentSectionList.Count - 1 And i > 0 Then
                    previousSection = CurrentSectionList(i - 1)
                Else
                    previousSection = CurrentSectionList(i - 1)
                    nextSection = CurrentSectionList(i + 1)
                End If
            End If
        Next

        If previousSection IsNot Nothing Then
            lnkPreviousSection.Visible = True
            BuildPaginationLink(previousSection, lnkPreviousSection, lblPreviousSection)
        Else
            lnkPreviousSection.Visible = False
        End If

        If nextSection IsNot Nothing Then
            lnkNextSection.Visible = True
            BuildPaginationLink(nextSection, lnkNextSection, lblNextSection)
        Else
            lnkNextSection.Visible = False
        End If

    End Sub

    Private Sub BuildPaginationLink(aSection As SectionBase, aLink As HtmlAnchor, aLabel As HtmlGenericControl)
        With aSection
            aLink.Visible = True
            aLink.HRef = String.Format(TargetUrl, .SectionId)
            aLink.Title = .SectionNumber & "." & "&nbsp;" & .FormattedSectionShortName
            aLabel.InnerHtml = .SectionNumber & "." & "&nbsp;" & .FormattedSectionShortName
        End With
    End Sub

    Private Sub lnkNextSection_ServerClick(sender As Object, e As EventArgs) Handles lnkNextSection.ServerClick

        Dim args As New CancelEventArgs(False)
        OnNavigateNext(args)

        If Not args.Cancel Then
            Response.Redirect(lnkNextSection.HRef)
        End If

    End Sub

    Private Sub lnkPreviousSection_ServerClick(sender As Object, e As EventArgs) Handles lnkPreviousSection.ServerClick

        Dim args As New CancelEventArgs(False)
        OnNavigatePrevious(args)

        If Not args.Cancel Then
            Response.Redirect(lnkPreviousSection.HRef)
        End If

    End Sub

End Class