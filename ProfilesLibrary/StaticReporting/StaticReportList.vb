Imports Profiles.Contracts
Imports Csla

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> <Serializable()> _
Public Class StaticReportList
    Inherits BusinessListBase(Of StaticReportList, StaticReport)

    Private mStaticReportDictionary As New Dictionary(Of Guid, StaticReport)

#Region " Authorization Rules "

    Public Shared Function CanGetPublicList() As Boolean

        Return True
    End Function

    Public Shared Function CanGetList() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetCurrentPublicStaticReportList() As StaticReportList

        If Not CanGetPublicList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of current public static reports")
        End If

        Return DataPortal.Fetch(Of StaticReportList)(New Criteria(False, True))

    End Function

    Public Shared Function GetCurrentStaticReportList(ByVal isUserManual As Boolean) As StaticReportList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a list of current static reports")
        End If

        Return DataPortal.Fetch(Of StaticReportList)(New Criteria(isUserManual))

    End Function

    Public Shared Function GetStaticReportPublicHistoryList(ByVal staticReportId As Guid) As StaticReportList

        If Not CanGetPublicList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a public history for a static report")
        End If

        Return DataPortal.Fetch(Of StaticReportList)(New Criteria(staticReportId, True))

    End Function

    Public Shared Function GetStaticReportHistoryList(ByVal staticReportId As Guid) As StaticReportList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view a complete history for a static report")
        End If

        Return DataPortal.Fetch(Of StaticReportList)(New Criteria(staticReportId))

    End Function

	Public Function GetById(ByVal staticReportVersionId As Guid) As StaticReport
		If mStaticReportDictionary.ContainsKey(staticReportVersionId) Then
			Return mStaticReportDictionary(staticReportVersionId)
		End If
		Return Nothing
	End Function

	Public Function GetByTitle(ByVal title As String) As StaticReport
		Return mStaticReportDictionary _
							.Select(Function(x) x.Value) _
							.SingleOrDefault(Function(x) x.Title = title)
	End Function

#End Region

#Region " Data Access "

	<Serializable()> _
    Private Class Criteria
        Private mStaticReportId As Guid
        Private mIsUserManual As Boolean
        Private mPublicOnly As Boolean

        Public ReadOnly Property StaticReportId() As Guid
            Get
                Return mStaticReportId
            End Get
        End Property

        Public ReadOnly Property IsUserManual() As Boolean
            Get
                Return mIsUserManual
            End Get
        End Property

        Public ReadOnly Property PublicOnly() As Boolean
            Get
                Return mPublicOnly
            End Get
        End Property

        Public Sub New(ByVal staticReportId As Guid)
            mStaticReportId = staticReportId
        End Sub

        Public Sub New(ByVal staticReportId As Guid, ByVal publicOnly As Boolean)
            mStaticReportId = staticReportId
            mPublicOnly = publicOnly
        End Sub

        Public Sub New(ByVal isUserManual As Boolean)
            mStaticReportId = Guid.Empty
            mIsUserManual = isUserManual
        End Sub

        Public Sub New(ByVal isUserManual As Boolean, ByVal publicOnly As Boolean)
            mStaticReportId = Guid.Empty
            mIsUserManual = isUserManual
            mPublicOnly = publicOnly
        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IStaticReportService = DataFactory.GetStaticReportService()
        Dim staticReportVersions As List(Of DataContracts.StaticReportVersion)

        If criteria.StaticReportId.Equals(Guid.Empty) Then
            If criteria.PublicOnly Then
                staticReportVersions = db.GetCurrentPublicStaticReports(New DataContracts.GetCurrentPublicStaticReportsRequest())
            Else
                staticReportVersions = db.GetCurrentStaticReports(New DataContracts.GetCurrentStaticReportsRequest(criteria.IsUserManual))
            End If
        Else
            If criteria.PublicOnly Then
                staticReportVersions = db.GetStaticReportPublicHistory(New DataContracts.GetStaticReportPublicHistoryRequest(criteria.StaticReportId))
            Else
                staticReportVersions = db.GetStaticReportHistory(New DataContracts.GetStaticReportHistoryRequest(criteria.StaticReportId))
            End If
        End If

        For Each staticReportVersion As DataContracts.StaticReportVersion In staticReportVersions
            Dim report As StaticReport = StaticReport.GetStaticReport(staticReportVersion)
            Add(report)
            mStaticReportDictionary.Add(report.Id, report)
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        'reports can only be deleted not edited
        RaiseListChangedEvents = False

        For Each item As StaticReport In DeletedList
            item.DeleteSelf()
        Next
        DeletedList.Clear()

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
