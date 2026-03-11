Imports ProfilesLibrary

Public Module CommonUI

    Public Function GetLookupList(ByVal tableId As Guid) As LookupList

        Dim cachedLookupList As Object = HttpContext.Current.Cache("LookupList|" & tableId.ToString())
        If cachedLookupList Is Nothing OrElse (Not TypeOf (cachedLookupList) Is LookupList) Then
            cachedLookupList = LookupList.GetList(tableId)
            HttpContext.Current.Cache("LookupList|" & tableId.ToString()) = cachedLookupList
        End If

        Return DirectCast(cachedLookupList, LookupList)

    End Function

    Public Function GetReferenceTableInfoList() As ReferenceTableInfoList

        Dim referenceTableList As Object = HttpContext.Current.Cache("ReferenceTableInfoList")
        If referenceTableList Is Nothing OrElse (Not TypeOf (referenceTableList) Is ReferenceTableInfoList) Then
            referenceTableList = ReferenceTableInfoList.GetReferenceTableInfoList()
            HttpContext.Current.Cache("ReferenceTableInfoList") = referenceTableList
        End If

        Return DirectCast(referenceTableList, ReferenceTableInfoList)

    End Function

    Public Function GetDiseaseReferenceTableInfoList() As DiseaseFilterValues

        Dim referenceDiseaseTableList As Object = HttpContext.Current.Cache("ReferenceTableInfoList")
        If referenceDiseaseTableList Is Nothing OrElse (Not TypeOf (referenceDiseaseTableList) Is DiseaseFilterValues) Then
            referenceDiseaseTableList = DiseaseFilterValues.GetDiseaseReferenceTableInfoList()
            HttpContext.Current.Cache("DiseaseReferenceTableInfoList") = referenceDiseaseTableList
        End If

        Return DirectCast(referenceDiseaseTableList, DiseaseFilterValues)

    End Function

    Public Function GetProfileUserRoleList() As ProfileUserRoleList

        Dim userRoleList As Object = HttpContext.Current.Cache("ProfileUserRoleList")
        If userRoleList Is Nothing OrElse (Not TypeOf (userRoleList) Is ProfileUserRoleList) Then
            userRoleList = ProfileUserRoleList.GetProfileUserRoleList()
            HttpContext.Current.Cache("ProfileUserRoleList") = userRoleList
        End If

        Return DirectCast(userRoleList, ProfileUserRoleList)

    End Function

    Public Function IsValidGuid(ByVal guid As String) As Boolean
        'This function works out whether a Guid is in a valid format

        Try
            Dim newGuid As New Guid(guid)
            Return True
        Catch fex As FormatException
            Return False
        Catch oex As OverflowException
            Return False
        Catch nex As ArgumentNullException
            Return False
        End Try

        Return False

    End Function

    Public Function HandleError() As String

        Dim errorPageUrl As String = "~/ApplicationError.aspx"

        Dim current As HttpContext = HttpContext.Current

        Try
            'Try to log detail of error 
            Dim handledError As Exception = current.Server.GetLastError().GetBaseException()
            current.Session("lastException") = handledError
            current.Session("lastUrl") = current.Request.Url.ToString()

            Dim errorLog As ProfilesLibrary.ErrorLogEntry = ProfilesLibrary.ErrorLogEntry.NewErrorLogEntry(handledError)
            errorLog.Request = current.Request.Url.ToString()
            errorLog.Save()

        Catch ex As Exception

            current.Session("lastException") = ex
            errorPageUrl &= "?errorlogged=false"

        End Try

        Return errorPageUrl

    End Function

    Public Sub SetControlFocus(ByVal focusControl As Control)

        Dim scriptOutput As New StringBuilder


        scriptOutput.Append("Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);").AppendLine()

        scriptOutput.Append("function EndRequestHandler(sender, args) {").AppendLine()
        scriptOutput.Append("   var el = document.getElementById('" & focusControl.ClientID & "')").AppendLine()
        scriptOutput.Append("   if (el != null) {").AppendLine()
        scriptOutput.Append("      el.scrollIntoView();").AppendLine()
        scriptOutput.Append("   }").AppendLine()
        scriptOutput.Append("   Sys.WebForms.PageRequestManager.getInstance().remove_endRequest(EndRequestHandler);").AppendLine()
        scriptOutput.Append("} ").AppendLine()

        ScriptManager.RegisterStartupScript(focusControl.Page, focusControl.GetType(), "ControlFocusScript", scriptOutput.ToString(), True)

    End Sub

    Public Sub SetPageExpireImmediately(ByVal response As HttpResponse)

        'set the page to expire immediately, so that if the user presses the back button a new request
        'will be sent to the server
        response.ExpiresAbsolute = Now().AddMinutes(-1)
        response.Expires = 0
        response.Cache.SetNoStore()
        response.AppendHeader("Pragma", "no-cache")
        response.CacheControl = "no-cache"

    End Sub

End Module
