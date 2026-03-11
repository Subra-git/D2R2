Imports Csla
Imports System.Collections.Generic
Imports Profiles.Contracts

Public Enum ProfileVersionStatus
    Draft
    Published
End Enum

<Serializable()>
Public Class ProfileVersionInfo
    Inherits ReadOnlyBase(Of ProfileVersionInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mProfileId As Guid
    Private mParentProfileId As Guid
    Private mTitle As String = String.Empty
    Private mScenarioTitle As String = String.Empty
    Private mProfiledSpecies As String = String.Empty
    Private mProfiledSpeciesCount As Integer
    Private mOtherAffectedSpecies As String = String.Empty
    Private mOtherAffectedSpeciesCount As Integer
    Private mVersionMajor As Byte
    Private mVersionMinor As Byte
    Private mStatus As ProfileVersionStatus
    Private mEffectiveDateFrom As SmartDate
    Private mEffectiveDateTo As SmartDate
    Private mIsLatestVersion As Boolean
    Private mIsPublic As Boolean
    Private mHasRelevantPublicScenarios As Boolean
    Private mProfileStatusId As Guid
    Private mProfileStatusName As String

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property ProfileId() As Guid
        Get
            Return mProfileId
        End Get
    End Property

    Public ReadOnly Property ParentProfileId() As Guid
        Get
            Return mParentProfileId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            Return mTitle
        End Get
    End Property

    Public ReadOnly Property ScenarioTitle() As String
        Get
            Return mScenarioTitle
        End Get
    End Property

    Public ReadOnly Property FullTitle() As String
        Get
            If mScenarioTitle.Length > 0 Then
                Return mTitle & " (" & mScenarioTitle & ")"
            Else
                Return mTitle
            End If
        End Get
    End Property

    Public ReadOnly Property FullTitlePlainText() As String
        Get
            Return FullTitle.StripHtmlTags()
        End Get
    End Property

    Public ReadOnly Property ProfiledSpecies() As String
        Get
            Return mProfiledSpecies
        End Get
    End Property

    Public ReadOnly Property ProfiledSpeciesCount() As Integer
        Get
            Return mProfiledSpeciesCount
        End Get
    End Property

    Public ReadOnly Property OtherAffectedSpecies() As String
        Get
            Return mOtherAffectedSpecies
        End Get
    End Property

    Public ReadOnly Property OtherAffectedSpeciesCount() As Integer
        Get
            Return mOtherAffectedSpeciesCount
        End Get
    End Property

    Public ReadOnly Property Version() As String
        Get
            Return mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture) & "." & mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture)
        End Get
    End Property

    Public ReadOnly Property VersionMajor() As Byte
        Get
            Return mVersionMajor
        End Get
    End Property

    Public ReadOnly Property VersionMinor() As Byte
        Get
            Return mVersionMinor
        End Get
    End Property

    Public ReadOnly Property VersionSortValue() As Integer
        Get
            Return (mVersionMajor * 256) + mVersionMinor
        End Get
    End Property

    Public ReadOnly Property Status() As ProfileVersionStatus
        Get
            Return mStatus
        End Get
    End Property

    Public ReadOnly Property ProfileStatusId() As Guid
        Get
            Return mProfileStatusId
        End Get
    End Property

    Public ReadOnly Property ProfileStatusName() As String
        Get
            Return mProfileStatusName
        End Get
    End Property

    Public ReadOnly Property IsWhatIfScenario() As Boolean
        Get
            Return Not (mParentProfileId.Equals(Guid.Empty))
        End Get
    End Property

    Public ReadOnly Property IsCurrent() As Boolean
        Get
            Return mEffectiveDateTo.IsEmpty
        End Get
    End Property

    Public ReadOnly Property IsLatestVersion() As Boolean
        Get
            Return mIsLatestVersion
        End Get
    End Property

    Public ReadOnly Property IsPublic() As Boolean
        Get
            Return mIsPublic
        End Get
    End Property

    Public ReadOnly Property EffectiveDates() As String
        Get
            If IsCurrent Then
                Return "Valid from " & mEffectiveDateFrom.ToString()
            Else
                Return String.Format("Valid from {0} to {1}", mEffectiveDateFrom.ToString(), mEffectiveDateTo.ToString())
            End If
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

    Public ReadOnly Property HasRelevantPublicScenarios() As Boolean
        Get
            Return mHasRelevantPublicScenarios
        End Get
    End Property

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String

        Dim result As String
        If Me.IsCurrent AndAlso
            Me.Status = ProfileVersionStatus.Draft AndAlso
            Not String.IsNullOrEmpty(mProfileStatusName) Then

            result = String.Format("{0} - v{1}.{2} ({3}) {4} ({5})",
           Me.FullTitle,
           mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture),
           mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture),
           mStatus.ToString(),
           Me.EffectiveDates,
           mProfileStatusName)
        Else
            result = String.Format("{0} - v{1}.{2} ({3}) {4}",
             Me.FullTitle,
             mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture),
             mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture),
             mStatus.ToString(),
             Me.EffectiveDates)
        End If

        Return result

    End Function

    Public Function VersionToString() As String

        Dim result As String
        If Me.IsCurrent AndAlso
            Me.Status = ProfileVersionStatus.Draft AndAlso
            Not String.IsNullOrEmpty(mProfileStatusName) Then

            result = String.Format("Version {0}.{1} ({2}) {3} ({4})",
           mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture),
           mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture),
           mStatus.ToString(),
           Me.EffectiveDates,
           mProfileStatusName)
        Else
            result = String.Format("Version {0}.{1} ({2}) {3}",
            mVersionMajor.ToString(System.Globalization.CultureInfo.InvariantCulture),
             mVersionMinor.ToString(System.Globalization.CultureInfo.InvariantCulture),
             mStatus.ToString(),
             Me.EffectiveDates)
        End If

        Return result

    End Function

#End Region

#Region " Print "

    Public Function CanGetPrintVersion() As Boolean

        If mStatus = ProfileVersionStatus.Published Then
            Return False
        Else
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Return (identity.IsProfileContributorOrReviewer(mProfileId) _
                    OrElse identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)
        End If

    End Function

    Public Function CanGetSummaryPrioritisationReport() As Boolean

        Return CanGetSummaryReport()

    End Function

    Public Function CanGetSummaryProfileReport() As Boolean

        Return CanGetSummaryReport()

    End Function

    Private Function CanGetSummaryReport() As Boolean

        If mStatus = ProfileVersionStatus.Published Then
            Return False
        End If

        If Not Me.IsCurrent Then
            Return False
        End If

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return (identity.IsProfileContributorOrReviewer(mProfileId) _
            OrElse identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)

    End Function

    Public Function GetPrintVersion() As Byte()

        If Not CanGetPrintVersion() Then
            Throw New System.Security.SecurityException("You do not have permission to get a print version of this profile version")
        End If

        Return GetProfilePrintVersionCommand.GetPrintVersion(Me.Id, Guid.Empty)

    End Function

    Public Function GetPrintVersion(ByVal profileSectionId As Guid) As Byte()

        If Not CanGetPrintVersion() Then
            Throw New System.Security.SecurityException("You do not have permission to get a print version of this profile version")
        End If

        Return GetProfilePrintVersionCommand.GetPrintVersion(Me.Id, profileSectionId)

    End Function

	Public Function GetSummaryPrioritisationReport() As Byte()

		If Not CanGetSummaryPrioritisationReport() Then
			Throw New System.Security.SecurityException("You do not have permission to get the summary prioritisation report of this profile version")
		End If

		Return GetSummaryPrioritisationReportCommand.GetSummaryPrioritisationReport(Me.Id)

	End Function

	Public Function GetProfileVersionBespokeReport(profileVersionId As Guid,
												   profileVersionSelectedSections As List(Of String),
												   profileVersionSelectedQuestions As List(Of String),
												   profileVersionSelectedGuidance As List(Of String),
												   templateTitle As String) As Byte()

		If Not GetProfileVersionBespokeReportCommand.CanGetReport() Then
			Throw New System.Security.SecurityException("You do not have permission to get bespoke reports")
		End If

		Return GetProfileVersionBespokeReportCommand.GetProfileVersionBespokeReport(profileVersionId,
																					profileVersionSelectedSections,
																					profileVersionSelectedQuestions,
																					profileVersionSelectedGuidance,
																					templateTitle)

	End Function

	Public Function GetSummaryProfileReport() As Byte()

        If Not CanGetSummaryProfileReport() Then
            Throw New System.Security.SecurityException("You do not have permission to get the summary profile report of this profile version")
        End If

        Return GetSummaryProfileReportCommand.GetSummaryProfileReport(Me.Id)

    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")>
    Friend Shared Function GetProfileVersionInfo(ByVal profileVersion As DataContracts.ProfileSearchProfileVersionInfo) As ProfileVersionInfo
        Return New ProfileVersionInfo(profileVersion)
    End Function

    Public Shared Function GetProfileVersionInfo(ByVal profileVersionId As Guid) As ProfileVersionInfo

        If System.Web.HttpContext.Current IsNot Nothing Then

            Dim cache As Dictionary(Of Guid, ProfileVersionInfo)

            If System.Web.HttpContext.Current.Items("ProfileVersionInfoCache") Is Nothing Then
                cache = New Dictionary(Of Guid, ProfileVersionInfo)
                System.Web.HttpContext.Current.Items("ProfileVersionInfoCache") = cache
            Else
                cache = DirectCast(System.Web.HttpContext.Current.Items("ProfileVersionInfoCache"), Dictionary(Of Guid, ProfileVersionInfo))
            End If

            If Not cache.ContainsKey(profileVersionId) Then
                cache(profileVersionId) = DataPortal.Fetch(Of ProfileVersionInfo)(New Criteria(profileVersionId))
            End If
            Return cache(profileVersionId)

        Else

            Return DataPortal.Fetch(Of ProfileVersionInfo)(New Criteria(profileVersionId))

        End If

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")>
    Private Sub New(ByVal profileVersion As DataContracts.ProfileSearchProfileVersionInfo)
        Fetch(profileVersion)
    End Sub

#End Region

#Region " Data Access "

    <Serializable()>
    Private Class Criteria
        Private mId As Guid
        Public ReadOnly Property Id() As Guid
            Get
                Return mId
            End Get
        End Property
        Public Sub New(ByVal id As Guid)
            mId = id
        End Sub

        Public Sub New()
            '
        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IProfileSearchService = DataFactory.GetProfileSearchService()
        Dim profileVersion As DataContracts.ProfileSearchProfileVersionInfo =
            db.GetProfileVersion(New DataContracts.GetProfileVersionRequest(criteria.Id))

        mId = profileVersion.Id
        mProfileId = profileVersion.ProfileId
        mParentProfileId = profileVersion.ParentProfileId
        mTitle = profileVersion.Title
        mScenarioTitle = profileVersion.ScenarioTitle
        mProfiledSpecies = profileVersion.ProfiledSpecies
        mProfiledSpeciesCount = profileVersion.ProfiledSpeciesCount
        mOtherAffectedSpecies = profileVersion.OtherAffectedSpecies.StripPTags.StripBreakTags
        mOtherAffectedSpeciesCount = profileVersion.OtherAffectedSpeciesCount
        mVersionMajor = profileVersion.VersionMajor
        mVersionMinor = profileVersion.VersionMinor
        If profileVersion.IsPublished Then
            mStatus = ProfileVersionStatus.Published
        Else
            mStatus = ProfileVersionStatus.Draft
        End If
        mEffectiveDateFrom = New Csla.SmartDate(profileVersion.EffectiveDateFrom)
        mEffectiveDateTo = New Csla.SmartDate(profileVersion.EffectiveDateTo)
        mIsLatestVersion = profileVersion.IsLatestVersion
        mIsPublic = profileVersion.IsPublic
        mHasRelevantPublicScenarios = profileVersion.HasRelevantPublicScenarios
        mProfileStatusId = profileVersion.ProfileStatusId
        mProfileStatusName = profileVersion.ProfileStatusName
    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")>
    Private Sub Fetch(ByVal profileVersion As DataContracts.ProfileSearchProfileVersionInfo)

        mId = profileVersion.Id
        mProfileId = profileVersion.ProfileId
        mParentProfileId = profileVersion.ParentProfileId
        mTitle = profileVersion.Title
        mScenarioTitle = profileVersion.ScenarioTitle
        mProfiledSpecies = profileVersion.ProfiledSpecies
        mProfiledSpeciesCount = profileVersion.ProfiledSpeciesCount
        mOtherAffectedSpecies = profileVersion.OtherAffectedSpecies
        mOtherAffectedSpeciesCount = profileVersion.OtherAffectedSpeciesCount
        mVersionMajor = profileVersion.VersionMajor
        mVersionMinor = profileVersion.VersionMinor
        If profileVersion.IsPublished Then
            mStatus = ProfileVersionStatus.Published
        Else
            mStatus = ProfileVersionStatus.Draft
        End If
        mEffectiveDateFrom = New Csla.SmartDate(profileVersion.EffectiveDateFrom)
        mEffectiveDateTo = New Csla.SmartDate(profileVersion.EffectiveDateTo)
        mIsLatestVersion = profileVersion.IsLatestVersion
        mIsPublic = profileVersion.IsPublic
        mHasRelevantPublicScenarios = profileVersion.HasRelevantPublicScenarios
        mProfileStatusId = profileVersion.ProfileStatusId

    End Sub


#End Region

End Class

