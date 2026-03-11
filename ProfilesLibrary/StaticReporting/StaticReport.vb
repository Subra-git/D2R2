Imports Profiles.Contracts
Imports Csla

<Serializable()> _
Public Class StaticReport
    Inherits BusinessBase(Of StaticReport)

#Region " Business Methods "

    Private mId As Guid
    Private mStaticReportId As Guid
    Private mTitle As String
    Private mVersionMajor As Byte
    Private mEffectiveDateFrom As SmartDate
    Private mEffectiveDateTo As SmartDate
    Private mIsUserManual As Boolean
    Private mIsPublic As Boolean
    Private mFileSize As Integer

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property StaticReportId() As Guid
        Get
            Return mStaticReportId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mTitle
        End Get
    End Property

    Public ReadOnly Property Version() As String
        Get
            Return mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture) & ".0"
        End Get
    End Property

    Public ReadOnly Property VersionMajor() As Byte
        Get
            Return mVersionMajor
        End Get
    End Property

    Public ReadOnly Property VersionSortValue() As Integer
        Get
            Return mVersionMajor * 256
        End Get
    End Property

    Public ReadOnly Property IsCurrent() As Boolean
        Get
            Return mEffectiveDateTo.IsEmpty
        End Get
    End Property

    Public ReadOnly Property EffectiveDates() As String
        Get
            Return mEffectiveDateFrom.ToString() & " - " & mEffectiveDateTo.ToString()
        End Get
    End Property

    Public ReadOnly Property EffectiveDateFrom() As Date
        Get
            Return mEffectiveDateFrom.Date
        End Get
    End Property

    Public ReadOnly Property EffectiveDateTo() As Date
        Get
            Return mEffectiveDateTo.Date
        End Get
    End Property

    Public ReadOnly Property IsUserManual() As Boolean
        Get
            Return mIsUserManual
        End Get
    End Property

    Public ReadOnly Property IsPublic() As Boolean
        Get
            Return mIsPublic
        End Get
    End Property

    Public ReadOnly Property FileSize() As Integer
        Get
            Return mFileSize
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String

        Return mTitle & " - v" & mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture)

    End Function

    Public ReadOnly Property CanDelete() As Boolean
        Get
            If Not IsCurrent Then
                Return False
            End If
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Return identity.IsProfileEditor
        End Get
    End Property

    Public ReadOnly Property CanMakePublic() As Boolean
        Get
            If mIsPublic Then
                Return False
            End If
            If mIsUserManual Then
                Return False
            End If
            Return SetStaticReportPublicAccessCommand.CanSetPublicAccess
        End Get
    End Property
#End Region

#Region " Factory Methods "

    Friend Shared Function GetStaticReport(ByVal staticReportVersion As DataContracts.StaticReportVersion) As StaticReport
        Return New StaticReport(staticReportVersion)
    End Function

    Private Sub New(ByVal staticReportVersion As DataContracts.StaticReportVersion)
        MarkAsChild()
        Fetch(staticReportVersion)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal staticReportVersion As DataContracts.StaticReportVersion)

        mId = staticReportVersion.Id
        mStaticReportId = staticReportVersion.StaticReportId
        mTitle = staticReportVersion.Title
        mVersionMajor = staticReportVersion.VersionMajor
        mEffectiveDateFrom = New SmartDate(staticReportVersion.EffectiveDateFrom)
        If staticReportVersion.IsCurrent Then
            mEffectiveDateTo = New SmartDate(True)
        Else
            mEffectiveDateTo = New SmartDate(staticReportVersion.EffectiveDateTo)
        End If
        mIsUserManual = staticReportVersion.IsUserManual
        mIsPublic = staticReportVersion.IsPublic
        mFileSize = staticReportVersion.FileSize

        MarkOld()

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.Security.SecurityException.#ctor(System.String)")> _
    Friend Sub DeleteSelf()

        If Not CanDelete Then
            Throw New System.Security.SecurityException("You do not have permission to delete reports.")
        End If

        Dim db As ServiceContracts.IStaticReportService = DataFactory.GetStaticReportService()
        db.DeleteStaticReportVersion(New DataContracts.DeleteStaticReportVersionRequest(mId))

        MarkNew()

    End Sub

#End Region

End Class
