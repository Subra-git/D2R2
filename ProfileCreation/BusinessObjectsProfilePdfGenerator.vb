Imports BusinessObjects.DSWS.Session
Imports BusinessObjects.DSWS.ReportEngine
Imports BusinessObjects.DSWS
Imports BusinessObjects.DSWS.BICatalog
Imports System.Configuration.ConfigurationManager

Public Class BusinessObjectsProfilePdfGenerator
    Inherits ProfilePdfGenerator

    Private mBusinessObjectsUrl As String
    Private mBusinessObjectsUserName As String
    Private mBusinessObjectsPassword As String
    Private mReportName As String

    Sub New()
        MyBase.New()
        mBusinessObjectsUrl = AppSettings("BusinessObjectsConnectionUrl")
        mBusinessObjectsUserName = AppSettings("BusinessObjectsUserName")
        mBusinessObjectsPassword = AppSettings("BusinessObjectsPassword")
    End Sub

    ''' <summary>
    ''' Run Business Objects profile report and return PDF data
    ''' </summary>
    ''' <param name="profileVersionId"></param>
    ''' <returns>Report data</returns>    
    Public Overrides Function GetProfilePdf(ByVal profileVersionId As Guid, ByVal reportName As String) As Byte()

        Dim boConString As String       'Connection string
        Dim boConnection As Connection  'Connection object
        Dim boCredential As EnterpriseCredential    'Logon credentials object (Enterprise authentication)
        Dim boSession As BusinessObjects.DSWS.Session.Session   'Session object
        Dim boSessionInfo As SessionInfo    'SessionInfo object
        Dim docUID As String = Nothing      'Document ID
        Dim profileData As Byte() = Nothing

        'Create the connection the Business Objects Web Service
        boConString = mBusinessObjectsUrl
        boConnection = New Connection(boConString)
        boCredential = New EnterpriseCredential
        boCredential.Login = mBusinessObjectsUserName
        boCredential.Password = mBusinessObjectsPassword
        boSession = New BusinessObjects.DSWS.Session.Session(boConnection)

        Try
            'Create a session using the connection and credentials

            boSessionInfo = boSession.Login(boCredential)

            'Create an instance of the BICatalog
            'The BICatalog is used to navigate folders and object
            'in the Business Objects repository, and is needed to obtain
            'the document UID
            Dim strBOBICatURL As String() = boSession.GetAssociatedServicesURL("BICatalog")
            Dim boCatalog As BICatalog = BICatalog.GetInstance(boSession, strBOBICatURL(0))
            Dim docList As Document() = boCatalog.GetDocumentList(0, -1, Nothing, Nothing, Nothing, InstanceRetrievalType.ALL)

            For i As Integer = 0 To docList.Length - 1
                If docList(i).Name.ToLower = reportName.ToLower Then
                    docUID = docList(i).UID
                    Exit For
                End If
            Next

            If docUID Is Nothing Then
                Throw New InvalidOperationException(String.Format("The report name {0} was not found in the Business Objects catalogue", reportName))
            End If

            'Create an instance of the ReportEngine 
            Dim strBORepEngURL As String() = boSession.GetAssociatedServicesURL("ReportEngine")
            Dim boRepEng As ReportEngine = ReportEngine.GetInstance(boSession, strBORepEngURL(0))

            ''****Set parameters ****

            Dim fillInfo As RetrieveMustFillInfo = New RetrieveMustFillInfo()
            Dim promptInfo As RetrievePromptsInfo = New RetrievePromptsInfo()
            Dim boPromptInfo As PromptInfo() = New PromptInfo(1) {}
            fillInfo.RetrievePromptsInfo = promptInfo
            Dim actions As Action() = New Action(1) {}
            actions(0) = New Refresh()

            'Retrieve the report data into the data viewer
            Dim docInfo As DocumentInformation = boRepEng.GetDocumentInformation(docUID, fillInfo, actions, Nothing, Nothing)

            boPromptInfo = docInfo.PromptInfo

            Dim boPrompts As FillPrompts = New FillPrompts()
            Dim fillPromptList As FillPrompt() = New FillPrompt(1) {} '1 parameter

            'parameter 1
            fillPromptList(0) = New FillPrompt()
            fillPromptList(0).ID = boPromptInfo(0).ID
            Dim dpvId As DiscretePromptValue() = New DiscretePromptValue(1) {} 'single value parameter 
            dpvId(0) = New DiscretePromptValue()
            dpvId(0).Value = profileVersionId.ToString 'set parameter value
            fillPromptList(0).Values = dpvId 'update prompt list with parameter 1

            boPrompts.FillPromptList = fillPromptList
            actions(0) = boPrompts

            Dim newDocInfo As DocumentInformation

            'Setup the PDF view support
            Dim pdfViewSupport As ViewSupport = New ViewSupport()
            pdfViewSupport.OutputFormat = OutputFormatType.PDF
            pdfViewSupport.ViewType = ViewType.BINARY
            pdfViewSupport.ViewMode = ViewModeType.DOCUMENT

            'Set up the data viewer to use the PDF view support
            Dim retBinView As RetrieveBinaryView = New RetrieveBinaryView()
            retBinView.ViewSupport = pdfViewSupport
            Dim retBOData As New RetrieveData()
            retBOData.RetrieveView = retBinView

            newDocInfo = boRepEng.GetDocumentInformation(docInfo.DocumentReference, fillInfo, actions, Nothing, retBOData)

            ''**** End Set parameters ****

            'Copy the report data into a byte array
            Dim myBinView As BinaryView = New BinaryView()
            myBinView = newDocInfo.View
            profileData = myBinView.Content

        Catch dex As DSWSException
            Throw New ApplicationException(String.Format("Message: {0} Cause: {1}", dex.Message, dex.CauseMessage))
        Finally
            boSession.Logout()
        End Try

        Return profileData


    End Function

End Class
