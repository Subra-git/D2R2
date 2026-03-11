Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class GetProfileVersionComparisonReportCommand
    Inherits CommandBase

#Region " Authorization Rules "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Public Shared Function CanGetReport() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem

    End Function

#End Region

#Region " Client-side Code "

    Private mReportData As Byte()
    Private mProfileVersionLeftId As Guid
    Private mProfileVersionRightId As Guid

    Friend ReadOnly Property Result() As Byte()
        Get
            Return mReportData
        End Get
    End Property

    Friend Property ProfileVersionLeftId() As Guid
        Get
            Return mProfileVersionLeftId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionLeftId = value
        End Set
    End Property

    Friend Property ProfileVersionRightId() As Guid
        Get
            Return mProfileVersionRightId
        End Get
        Set(ByVal value As Guid)
            mProfileVersionRightId = value
        End Set
    End Property

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileVersionComparisonReport(ByVal profileVersionLeftId As Guid, ByVal profileVersionRightId As Guid) As Byte()

        If Not CanGetReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get a pdf of the profile version comparison report")
        End If

        Dim cmd As New GetProfileVersionComparisonReportCommand
        cmd.ProfileVersionLeftId = profileVersionLeftId
        cmd.ProfileVersionRightId = profileVersionRightId
        cmd = DataPortal.Execute(Of GetProfileVersionComparisonReportCommand)(cmd)

        Return cmd.Result

    End Function


#End Region

#Region " Server-side Code "

    Protected Overrides Sub DataPortal_Execute()

        Dim db As ServiceContracts.IProfileReportService = DataFactory.GetProfileReportService()
        mReportData = db.GetProfileVersionComparisonReport( _
                                New DataContracts.GetProfileVersionComparisonReportRequest( _
                                mProfileVersionLeftId, mProfileVersionRightId _
                                )).PdfData

    End Sub

#End Region

End Class


