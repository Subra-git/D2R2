<%@ Application Language="VB" %>
<%@ Import Namespace="StructureMap.Configuration" %>



<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup        
        StructureMap.StructureMapConfiguration.AddRegistry(New WebsiteRegistry())
    End Sub

    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        
        ' Code that runs when an unhandled error occurs
        Dim errorPageUrl As String = CommonUI.HandleError()
        Server.ClearError()
        Response.Clear()
        Server.Transfer(errorPageUrl)
              
    End Sub

    Sub Application_PreRequestHandlerExecute(ByVal sender As Object, ByVal e As EventArgs)
                                           
        If Context.Session IsNot Nothing Then
            If Session.IsNewSession Then
                Dim cookieHeader As String = Request.Headers("Cookie")
                If cookieHeader IsNot Nothing AndAlso cookieHeader.IndexOf("ASP.NET_SessionId") >= 0 Then
                    
                    'Support request - the spell check box was freezing if you clicked
                    'spell check after the session had timed out. Code here prevents 
                    'redirect if the spell check button has been pressed. 
                    Dim query As String = String.Empty
                    If HttpContext.Current.Request.QueryString("DialogName") IsNot Nothing Then
                        query = HttpContext.Current.Request.QueryString("DialogName").ToString()
                    End If
                    If Not query.Equals("SpellCheckDialog") Then
                        Response.Redirect("~/SessionTimeout.aspx")
                    End If
                End If
            End If
        End If
       
    End Sub
    
    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>