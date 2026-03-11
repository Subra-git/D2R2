Imports Profiles.Contracts
Imports Csla

<Serializable()> _
Public Class SetStaticReportPublicAccessCommand
    Inherits CommandBase

#Region " Authorization Rules "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Public Shared Function CanSetPublicAccess() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor() AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side code "

    Private mStaticReportVersionId As Guid

    Friend ReadOnly Property StaticReportVersionId() As Guid
        Get
            Return mStaticReportVersionId
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Sub SetStaticReportPublicAccess(ByVal staticReportVersionId As Guid)
        If Not CanSetPublicAccess() Then
            Throw New System.Security.SecurityException("You do not have permission to change the public status of a static report.")
        End If
        Dim cmd As New SetStaticReportPublicAccessCommand
        cmd.mStaticReportVersionId = staticReportVersionId
        cmd = DataPortal.Execute(Of SetStaticReportPublicAccessCommand)(cmd)
    End Sub

#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()
        Dim db As ServiceContracts.IStaticReportService = DataFactory.GetStaticReportService()
        db.SetStaticReportPublicAccess(New DataContracts.SetStaticReportPublicAccessRequest(mStaticReportVersionId))
    End Sub

#End Region

End Class
