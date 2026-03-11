Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ReferenceDataAuditTrailInfoList
    Inherits ReadOnlyListBase(Of ReferenceDataAuditTrailInfoList, ReferenceDataAuditTrailInfo)

    Public Function GetById(ByVal auditInfoId As Guid) As ReferenceDataAuditTrailInfo
        For Each currentAuditInfo As ReferenceDataAuditTrailInfo In Me
            If currentAuditInfo.Id.Equals(auditInfoId) Then
                Return currentAuditInfo
            End If
        Next
        Return Nothing
    End Function

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetReferenceTableAuditInfoList(ByVal referenceTableId As Guid) As ReferenceDataAuditTrailInfoList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to view reference table audit lists.")
        End If

        Return DataPortal.Fetch(Of ReferenceDataAuditTrailInfoList)(New Criteria(referenceTableId))
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class Criteria

        Private mReferenceTableId As Guid
        Public ReadOnly Property ReferenceTableId() As Guid
            Get
                Return mReferenceTableId
            End Get
        End Property

        Public Sub New(ByVal referenceTableId As Guid)
            mReferenceTableId = referenceTableId
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IReferenceValueService = DataFactory.GetReferenceValueService
        Dim entries As List(Of DataContracts.ReferenceTableAuditTrailEntry) = db.GetReferenceTableAuditTrail( _
            New DataContracts.GetReferenceTableAuditTrailRequest(criteria.ReferenceTableId) _
        )

        For Each entry As DataContracts.ReferenceTableAuditTrailEntry In entries
            Add(ReferenceDataAuditTrailInfo.GetReferenceDataAuditTrailInfo(entry))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
