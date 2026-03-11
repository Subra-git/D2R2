Imports System.Configuration
Imports System.Net.Mail
Imports System.Text
Imports ProfilesReviewEmailLibrary

Public Module ReviewEmail

    Public Sub SendReviewEmails(ByVal emailSubjectLine As String, _
                                ByVal emailFromAddress As String, _
                            ByVal emailFromDisplayName As String, _
                            ByVal smtpServer As String, _
                            ByVal smtpPort As String, _
                            ByVal externalWebsiteURL As String, _
                            ByVal internalWebsiteURL As String)

        Dim emailUserInfoList As EmailUserInfoList
        emailUserInfoList = emailUserInfoList.GetEmailInfoList()

        If emailUserInfoList IsNot Nothing And emailUserInfoList.Count > 0 Then
            For Each emailUserInfo As EmailUserInfo In emailUserInfoList
                SendMessage(emailSubjectLine, _
                            emailUserInfo, _
                            emailFromAddress, _
                            emailFromDisplayName, _
                            smtpServer, _
                            smtpPort, _
                            externalWebsiteURL, _
                            internalWebsiteURL)
            Next
        End If

    End Sub

    Private Sub SendMessage(ByVal emailSubjectLine As String, _
                            ByVal emailUserInfo As EmailUserInfo, _
                            ByVal emailFromAddress As String, _
                            ByVal emailFromDisplayName As String, _
                            ByVal smtpServer As String, _
                            ByVal smtpPort As String, _
                            ByVal externalWebsiteURL As String, _
                            ByVal internalWebsiteURL As String)

        Dim msg As New MailMessage()

        msg.Sender = New MailAddress(emailFromAddress, emailFromDisplayName)
        msg.From = New MailAddress(emailFromAddress, emailFromDisplayName)
        msg.To.Add(New MailAddress(emailUserInfo.Email, emailUserInfo.UserName))
        msg.Priority = MailPriority.Normal
        msg.Subject = emailSubjectLine
        msg.Body = BuildMessageBody(emailUserInfo.FullName, _
                                    emailUserInfo.ProfileInfoList, _
                                    externalWebsiteURL, _
                                    internalWebsiteURL)
        msg.IsBodyHtml = True

        SendMail(msg, smtpServer, smtpPort)

    End Sub

    Private Function SendMail(ByVal msg As MailMessage, _
                              ByVal smptServerName As String, _
                              ByVal smptPort As String) As Boolean

        Try
            Dim smtpClient As New SmtpClient(smptServerName, smptPort)
            smtpClient.Send(msg)
            Return True
        Catch ex As Exception
            'TODO: write error to log.
            'Diagnostics.EventLog.WriteEntry(My.Settings.AppName, ex.Message.ToString, EventLogEntryType.Error)
            Return False
        End Try

        Return True
    End Function

    Private Function BuildMessageBody(ByVal name As String, _
                                      ByVal profileInfoList As ProfileInfoList, _
                                      ByVal externalWebsiteURL As String, _
                                      ByVal internalWebsiteURL As String) As String

        Dim emailBodyBuilder As New StringBuilder

        emailBodyBuilder.Append("Dear " & name & ", ")
        emailBodyBuilder.Append("<br/><br/>")
        emailBodyBuilder.Append("Please find the list of approaching, overdue and completed author, VA and policy reviews below. ")
        emailBodyBuilder.Append("After completing an author, VA or policy review please update the relevant review status for the profile section in the system. ")
        emailBodyBuilder.Append("This can be achieved by locating the profile on the search page, clicking the browse link and then selecting the revision dates tab. ")
        emailBodyBuilder.Append("Set the status to complete by using the drop down list. ")
        emailBodyBuilder.Append("<br/><br/>")

        If profileInfoList IsNot Nothing And profileInfoList.Count > 0 Then

            For Each profile As ProfileInfo In profileInfoList

                If String.IsNullOrEmpty(profile.ScenarioTitle) Then
                    emailBodyBuilder.Append("<strong><u>" & profile.ProfileTitle & " - v" & profile.FullVersion & " (Draft)" & "</u></strong>")
                Else
                    emailBodyBuilder.Append("<strong><u>" & profile.ProfileTitle & " (" & profile.ScenarioTitle & ") " & "- v" & profile.FullVersion & " (Draft)" & "</u></strong>")
                End If

                emailBodyBuilder.Append("<br/><br/>")
                emailBodyBuilder.Append("<table border=1 cellpadding=0 cellspacing=0>")

                emailBodyBuilder.Append("<tr>")
                emailBodyBuilder.Append(BuildCell(String.Empty))
                emailBodyBuilder.Append(BuildCell("Section name", True, "#000000", "verdana", 1, "center"))
                emailBodyBuilder.Append(BuildCell("VA review", True, "#000000", "verdana", 2, "center"))
                emailBodyBuilder.Append(BuildCell("Policy review", True, "#000000", "verdana", 2, "center"))
                emailBodyBuilder.Append(BuildCell("Author review", True, "#000000", "verdana", 2, "center"))
                emailBodyBuilder.Append("</tr>")

                Dim currentDate As New DateTime
                currentDate = DateTime.Now()

                For Each section As SectionInfo In profile.SectionInfoList
                   
                    emailBodyBuilder.Append("<tr>")
                    emailBodyBuilder.Append(BuildCell(section.SectionNumber.ToString()))
                    emailBodyBuilder.Append(BuildCell(section.SectionName))

                    BuildDateCells(section.VAReviewDate, section.VAReviewStatus, currentDate, emailBodyBuilder)

                    BuildDateCells(section.PolicyReviewDate, section.PolicyReviewStatus, currentDate, emailBodyBuilder)

                    BuildDateCells(section.AuthorReviewDate, section.AuthorReviewStatus, currentDate, emailBodyBuilder)

                    emailBodyBuilder.Append("</tr>")

                Next

                emailBodyBuilder.Append("</table>")
                emailBodyBuilder.Append("<br />")

            Next

        End If

        emailBodyBuilder.Append("<br/><br/>")
        emailBodyBuilder.Append("The D2R2 system can be accessed via the internet using the following link: ")
        emailBodyBuilder.Append(externalWebsiteURL)
        emailBodyBuilder.Append("<br/><br/>")
        emailBodyBuilder.Append("Internal users can access the D2R2 system using the following link: ")
        emailBodyBuilder.Append(internalWebsiteURL)
        emailBodyBuilder.Append("<br/><br/>")
        emailBodyBuilder.Append("If you have a problem accessing the D2R2 application (or aren't sure why you've received this email) please contact us by emailing the D2R2 mail box: D2R2@defra.gsi.gov.uk")
        emailBodyBuilder.Append("<br/><br/>")
        Return emailBodyBuilder.ToString()

    End Function

    Private Sub BuildDateCells(ByVal dateTime As DateTime, ByVal reviewStatus As String, ByVal currentDate As DateTime, ByVal emailBodyBuilder As StringBuilder)

        Dim twoWeeksDate As New DateTime
        twoWeeksDate = currentDate.AddDays(14)

        If dateTime < currentDate Or dateTime < twoWeeksDate Then
            emailBodyBuilder.Append(BuildCell(dateTime.ToString("dd/MM/yyyy")))
            If reviewStatus.Equals("Complete") Then
                emailBodyBuilder.Append(BuildCell(" (Completed) ", True, "#009900"))
            Else
                If dateTime < currentDate Then
                    emailBodyBuilder.Append(BuildCell(" (Overdue) ", True, "#FF0000"))
                Else
                    emailBodyBuilder.Append(BuildCell(" (Due soon) ", True, "#FF6103"))
                End If
            End If
        Else
            emailBodyBuilder.Append(BuildEmptyCells())
        End If

    End Sub

    Private Function BuildEmptyCells()
        Return BuildCell(String.Empty, False, "#000000", "verdana", 2, "left")
    End Function

    Private Function BuildCell(ByVal text As String)
        Return BuildCell(text, False, "#000000", "verdana", 1, "left")
    End Function

    Private Function BuildCell(ByVal text As String, ByVal isBold As Boolean)
        Return BuildCell(text, isBold, "#000000", "verdana", 1, "left")
    End Function

    Private Function BuildCell(ByVal text As String, ByVal isBold As Boolean, ByVal colour As String)
        Return BuildCell(text, isBold, colour, "verdana", 1, "left")
    End Function

    Private Function BuildCell(ByVal text As String, _
                               ByVal isBold As Boolean, _
                               ByVal colour As String, _
                               ByVal font As String, _
                               ByVal colSpan As Integer, _
                               ByVal align As String) As String

        Dim sb As New StringBuilder
        sb.Append("<td align=" & align & " colspan=" & colSpan.ToString() & ">")

        If isBold Then
            sb.Append("<strong>")
        End If

        sb.Append("<font size=2 face=" & font & " color=" & colour & ">")
        sb.Append(text)
        sb.Append("</font>")

        If isBold Then
            sb.Append("</strong>")
        End If
        sb.Append("</td>")
        Return sb.ToString()

    End Function

End Module
