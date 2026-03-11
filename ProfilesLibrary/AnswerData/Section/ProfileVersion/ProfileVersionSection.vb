Imports Csla
Imports Profiles.Contracts

''' <summary>
''' This object represents a section within the surveillance profile, for a particular profile version.
''' </summary>
<Serializable()> _
Public Class ProfileVersionSection
    Inherits SectionBase

#Region " Business Methods "

    Private mVAReviewFrequency As Guid
    Private mPolicyReviewFrequency As Guid
    Private mAuthorReviewFrequency As Guid
    Private mNextVAReview As SmartDate
    Private mNextPolicyReview As SmartDate
    Private mNextAuthorReview As SmartDate
    Private mProfiledSpeciesList As List(Of ProfiledSpecies)
    Private mLastUpdated(7) As Byte
    Private mHasPolicyReviewFrequency As Boolean
    Private mHasVAReviewFrequency As Boolean
    Private mHasAuthorReviewFrequency As Boolean
    Private mProfileVersionId As Guid
    Private mPolicyReviewStatusId As Guid
    Private mVAReviewStatusId As Guid
    Private mAuthorReviewStatusId As Guid
    Private mHasPolicyReviewStatusId As Boolean
    Private mHasVAReviewStatusId As Boolean
    Private mHasAuthorReviewStatusId As Boolean
    Private mVAReviewCompleted As SmartDate
    Private mPolicyReviewCompleted As SmartDate
    Private mAuthorReviewCompleted As SmartDate

    Public ReadOnly Property LastUpdated() As Byte()
        Get
            Return mLastUpdated
        End Get
    End Property

    Public ReadOnly Property ProfileVersionId() As Guid
        Get
            Return mProfileVersionId
        End Get
    End Property

    Public ReadOnly Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
        Get
            Return mProfiledSpeciesList
        End Get
    End Property

    ''' <summary>
    ''' Frequency of the VA review for this section of the profile.
    ''' </summary>
    ''' <returns>Unique identifier constrained to one of the values from SectionReviewFrequencyList.</returns>
    Public Property VAReviewFrequency() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mVAReviewFrequency
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mVAReviewFrequency <> value Then
                mVAReviewFrequency = value
                If value = Guid.Empty Then
                    mHasVAReviewFrequency = False
                Else
                    mHasVAReviewFrequency = True
                End If
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Frequency of the policy review for this section of the profile.
    ''' </summary>
    ''' <returns>Unique identifier constrained to one of the values from SectionReviewFrequencyList.</returns>
    Public Property PolicyReviewFrequency() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mPolicyReviewFrequency
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mPolicyReviewFrequency <> value Then
                mPolicyReviewFrequency = value
                If value = Guid.Empty Then
                    mHasPolicyReviewFrequency = False
                Else
                    mHasPolicyReviewFrequency = True
                End If
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Frequency of the author review for this section of the profile.
    ''' </summary>
    ''' <returns>Unique identifier constrained to one of the values from SectionReviewFrequencyList.</returns>
    Public Property AuthorReviewFrequency() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mAuthorReviewFrequency
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mAuthorReviewFrequency <> value Then
                mAuthorReviewFrequency = value
                If value = Guid.Empty Then
                    mHasAuthorReviewFrequency = False
                Else
                    mHasAuthorReviewFrequency = True
                End If
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Boolean flag to indicate whether there is a VA review frequency. Contributors/reviewers aren't permitted to read the VAReviewFrequency guid.
    ''' This presents a problem to the validation logic when using the WCF data access layer. Hence this flag has been introduced.
    ''' </summary>
    ''' <returns>Boolean flag</returns>
    Public ReadOnly Property HasVAReviewFrequency() As Boolean
        Get
            Return mHasVAReviewFrequency
        End Get
    End Property

    ''' <summary>
    ''' Boolean flag to indicate whether there is a policy review frequency. Contributors/reviewers aren't permitted to read the PolicyReviewFrequency guid.
    ''' This presents a problem to the validation logic when using the WCF data access layer. Hence this flag has been introduced.
    ''' </summary>
    ''' <returns>Boolean flag</returns>
    Public ReadOnly Property HasPolicyReviewFrequency() As Boolean
        Get
            Return mHasPolicyReviewFrequency
        End Get
    End Property

    ''' <summary>
    ''' Boolean flag to indicate whether there is an author review frequency. Contributors/reviewers aren't permitted to read the AuthorReviewFrequency guid.
    ''' This presents a problem to the validation logic when using the WCF data access layer. Hence this flag has been introduced.
    ''' </summary>
    ''' <returns>Boolean flag</returns>
    Public ReadOnly Property HasAuthorReviewFrequency() As Boolean
        Get
            Return mHasAuthorReviewFrequency
        End Get
    End Property

    ''' <summary>
    ''' VAReviewStatusId.
    ''' </summary>
    ''' <returns>Unique identifier constrained to one of the values from ReviewStatus.</returns>
    Public Property VAReviewStatusId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mVAReviewStatusId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mVAReviewStatusId <> value Then
                mVAReviewStatusId = value
                If value = Guid.Empty Then
                    mHasVAReviewStatusId = False
                    mVAReviewCompleted = Nothing
                    PropertyHasChanged("VAReviewCompleted")
                Else
                    mHasVAReviewStatusId = True
                    ' update the completed date if the status has changed to complete.
                    If value = ReviewStatusTypeList.GetReviewStatusTypeList().GetByName("Complete").Id Then
                        mVAReviewCompleted = Csla.SmartDate.Parse(Date.Now().ToString())
                        PropertyHasChanged("VAReviewCompleted")
                    Else
                        If Not mVAReviewCompleted.IsEmpty Then
                            mVAReviewCompleted = Nothing
                            PropertyHasChanged("VAReviewCompleted")
                        End If
                    End If
                End If
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' PolicyReviewStatusId
    ''' </summary>
    ''' <returns>Unique identifier constrained to one of the values from ReviewStatus.</returns>
    Public Property PolicyReviewStatusId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mPolicyReviewStatusId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mPolicyReviewStatusId <> value Then
                mPolicyReviewStatusId = value
                If value = Guid.Empty Then
                    mHasPolicyReviewStatusId = False
                    mPolicyReviewCompleted = Nothing
                    PropertyHasChanged("PolicyReviewCompleted")
                Else
                    mHasPolicyReviewStatusId = True
                    ' update the completed date if the status has changed to complete.
                    If value = ReviewStatusTypeList.GetReviewStatusTypeList().GetByName("Complete").Id Then
                        mPolicyReviewCompleted = Csla.SmartDate.Parse(Date.Now().ToString())
                        PropertyHasChanged("PolicyReviewCompleted")
                    Else
                        If Not mPolicyReviewCompleted.IsEmpty Then
                            mPolicyReviewCompleted = Nothing
                            PropertyHasChanged("PolicyReviewCompleted")
                        End If
                    End If
                End If
                PropertyHasChanged()
            End If
        End Set
    End Property


    ''' <summary>
    ''' AuthorReviewStatusId
    ''' </summary>
    ''' <returns>Unique identifier constrained to one of the values from ReviewStatus.</returns>
    Public Property AuthorReviewStatusId() As Guid
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mAuthorReviewStatusId
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As Guid)
            CanWriteProperty(True)
            If mAuthorReviewStatusId <> value Then
                mAuthorReviewStatusId = value
                If value = Guid.Empty Then
                    mHasAuthorReviewStatusId = False
                    mAuthorReviewCompleted = Nothing
                    PropertyHasChanged("AuthorReviewCompleted")
                Else
                    mHasAuthorReviewStatusId = True
                    ' update the completed date if the status has changed to complete.
                    If value = ReviewStatusTypeList.GetReviewStatusTypeList().GetByName("Complete").Id Then
                        mAuthorReviewCompleted = Csla.SmartDate.Parse(Date.Now().ToString())
                        PropertyHasChanged("AuthorReviewCompleted")
                    Else
                        If Not mAuthorReviewCompleted.IsEmpty Then
                            mAuthorReviewCompleted = Nothing
                            PropertyHasChanged("AuthorReviewCompleted")
                        End If
                    End If
                End If
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Boolean flag to indicate whether there is a VA review status id.  
    ''' </summary>
    ''' <returns>Boolean flag</returns>
    Public ReadOnly Property HasVAReviewStatusId() As Boolean
        Get
            Return mHasVAReviewStatusId
        End Get
    End Property

    ''' <summary>
    ''' Boolean flag to indicate whether there is a policy review status id
    ''' </summary>
    ''' <returns>Boolean flag</returns>
    Public ReadOnly Property HasPolicyReviewStatusId() As Boolean
        Get
            Return mHasPolicyReviewStatusId
        End Get
    End Property

    ''' <summary>
    ''' Boolean flag to indicate whether there is an author review status id
    ''' </summary>
    ''' <returns>Boolean flag</returns>
    Public ReadOnly Property HasAuthorReviewStatusId() As Boolean
        Get
            Return mHasAuthorReviewStatusId
        End Get
    End Property

    ''' <summary>
    ''' Date of the next VA review for this section of the profile.
    ''' </summary>
    ''' <returns>Date of next VA review</returns>
    Public Property NextVAReview() As SmartDate
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mNextVAReview
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As SmartDate)
            CanWriteProperty(True)
            If mNextVAReview <> value Then
                mNextVAReview = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Date of the next policy review for this section of the profile.
    ''' </summary>
    ''' <returns>Date of next policy review</returns>
    Public Property NextPolicyReview() As SmartDate
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mNextPolicyReview
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As SmartDate)
            CanWriteProperty(True)
            If mNextPolicyReview <> value Then
                mNextPolicyReview = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Date of the next author review for this section of the profile.
    ''' </summary>
    ''' <returns>Date of next author review</returns>
    Public Property NextAuthorReview() As SmartDate
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mNextAuthorReview
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As SmartDate)
            CanWriteProperty(True)
            If mNextAuthorReview <> value Then
                mNextAuthorReview = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    ''' <summary>
    ''' Date the VA review for this section was set to 'Complete'.
    ''' </summary>
    ''' <returns>Date of VA review completion</returns>
    Public ReadOnly Property VAReviewCompleted() As SmartDate
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mVAReviewCompleted
        End Get
    End Property

    ''' <summary>
    ''' Date the policy review for this section was set to 'Complete'.
    ''' </summary>
    ''' <returns>Date of next policy completion</returns>
    Public ReadOnly Property PolicyReviewCompleted() As SmartDate
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mPolicyReviewCompleted
        End Get        
    End Property

    ''' <summary>
    ''' Date the author review for this section was set to 'Complete'.
    ''' </summary>
    ''' <returns>Date of next author completion</returns>
    Public ReadOnly Property AuthorReviewCompleted() As SmartDate
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            Return mAuthorReviewCompleted
        End Get
    End Property


    ''' <summary>
    ''' Clears the data from this section of the profile.
    ''' </summary>
    Public Sub Clear()

        If Not ProfileVersionSection.CanClearProfileVersionSection(mProfileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to clear a section of a profile")
        End If

        VAReviewFrequency = Guid.Empty
        PolicyReviewFrequency = Guid.Empty
        AuthorReviewFrequency = Guid.Empty
        NextVAReview = Csla.SmartDate.Parse(String.Empty)
        NextPolicyReview = Csla.SmartDate.Parse(String.Empty)
        NextAuthorReview = Csla.SmartDate.Parse(String.Empty)
        VAReviewStatusId = Guid.Empty
        PolicyReviewStatusId = Guid.Empty
        AuthorReviewStatusId = Guid.Empty
     
        For Each question As QuestionBase In Questions
            question.Clear()
        Next

    End Sub

	Protected Overrides Sub ValidateSectionData(ByVal invalidReasonList As List(Of InvalidReason))

		If Not HasPolicyReviewFrequency Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Policy review frequency", SectionNumber))
		End If

		If Not HasVAReviewFrequency Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, VA review frequency", SectionNumber))
		End If

		If Not HasAuthorReviewFrequency Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Author review frequency", SectionNumber))
		End If

		If Not HasPolicyReviewStatusId Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Policy review status", SectionNumber))
		End If

		If Not HasVAReviewStatusId Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, VA review status", SectionNumber))
		End If

		If Not HasAuthorReviewStatusId Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Author review status", SectionNumber))
		End If

		Dim statusList As ReviewStatusTypeList = ReviewStatusTypeList.GetReviewStatusTypeList()
		Dim completeStatus As ReviewStatusType = statusList.GetByName("Complete")

		' VA review status must be complete
		If mVAReviewStatusId <> completeStatus.Id Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Custom, "Revision dates, VA review must be complete", SectionNumber))
		End If

		' policy review status must be complete
		If mPolicyReviewStatusId <> completeStatus.Id Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Custom, "Revision dates, Policy review must be complete", SectionNumber))
		End If

		' author review status must be complete
		If mAuthorReviewStatusId <> completeStatus.Id Then
			invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Custom, "Revision dates, Author review must be complete", SectionNumber))
		End If

	End Sub

#End Region

#Region " Authorization Rules "

	''' <summary>
	''' Method to indicate if the user has permission to read the data from this profile version section
	''' </summary>
	''' <param name="profileVersionId">The profile version to which the profile version section belongs</param>
	''' <returns>True if the user has permission to read the data from this profile version section; False otherwise.</returns>
	Public Shared Function CanGetProfileVersionSection(ByVal profileVersionId As Guid) As Boolean

		Return ProfileVersionSectionList.CanGetProfileVersionSectionList(profileVersionId)

	End Function

	''' <summary>
	''' Method to indicate if the user has permission to edit the data in this profile version section
	''' </summary>
	''' <param name="profileVersionId">The profile version to which the profile version section belongs</param>
	''' <returns>True if the user has permission to edit the data in this profile version section; False otherwise.</returns>
	Public Shared Function CanEditProfileVersionSection(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid) As Boolean

		If Not Csla.ApplicationContext.User.Identity.IsAuthenticated Then
			Return False
		End If

		Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
		Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		'The profile version must be current
		If Not currentProfileVersionInfo.IsCurrent Then
			Return False
		End If

		'The profile version must be draft
		If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
			Return False
		End If

		If identity.IsUserManagementSystem Then
			Return False
		End If

		'Must be a profile editor or a contributor to edit
		Return identity.IsProfileEditor OrElse identity.IsProfileSectionContributor(currentProfileVersionInfo.ProfileId, profileSectionId)

	End Function

	''' <summary>
	''' Indicates if the user has permission to Edit the Revision Dates in this section
	''' </summary>
	''' <param name="profileVersionId">The profile version to which the profile version section belongs</param>
	''' <returns>True if Editing the Revision Dates is allowed; False otherwise.</returns>
	Public Shared Function CanEditNextReviewDates(ByVal profileVersionId As Guid) As Boolean

		Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
		Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		'The profile version must be current
		If Not currentProfileVersionInfo.IsCurrent Then
			Return False
		End If

		'The profile version must be draft
		If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
			Return False
		End If

		If identity.IsUserManagementSystem Then
			Return False
		End If

		Return identity.IsProfileEditor

	End Function

	''' <summary>
	''' Indicates if the user has permission to view the Next Review Dates in this section
	''' Based on user permissions and the Status
	''' </summary>
	''' <returns>
	''' True if viewing the Next Review Dates is allowed; False otherwise. 
	''' If Status is not equal to Draft then returns False
	''' </returns>
	Public Shared Function CanGetNextReviewDates(ByVal profileVersionId As Guid) As Boolean
		Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		'The profile version must be draft
		If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
			Return False
		End If

		Return CanUserGetNextReviewDates(currentProfileVersionInfo)
	End Function

	''' <summary>
	''' Indicates if the user has permission to view the Revision Dates in this section
	''' </summary>
	''' <returns>True if viewing the Revision Dates is allowed; False otherwise.</returns>
	Public Shared Function CanUserGetNextReviewDates(ByVal profileVersionId As Guid) As Boolean
		Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		Return CanUserGetNextReviewDates(currentProfileVersionInfo)
	End Function

	''' <summary>
	''' Indicates if the user has permission to view the Revision Dates in this section
	''' </summary>
	''' <returns>True if viewing the Revision Dates is allowed; False otherwise.</returns>
	Public Shared Function CanUserGetNextReviewDates(ByVal profileVersionInfo As ProfileVersionInfo) As Boolean

		Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

		If identity.IsUserManagementSystem Then
			Return False
		End If

		If (identity.IsProfileContributorOrReviewer(profileVersionInfo.ProfileId)) OrElse identity.IsProfileEditor Then
			Return True
		End If

		Return False

	End Function

	''' <summary>
	''' Indicates if the user has permission to view any of the revision information in this section
	''' </summary>
	''' <returns>True if viewing the revision information is allowed; False otherwise.</returns>
	Public Shared Function CanGetRevisionInformation(ByVal profileVersionId As Guid) As Boolean

		Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

		Return CanGetRevisionInformation(currentProfileVersionInfo)

	End Function

	''' <summary>
	''' Indicates if the user has permission to view any of the revision information in this section
	''' </summary>
	''' <returns>True if viewing the revision information is allowed; False otherwise.</returns>
	Public Shared Function CanUserGetRevisionInformation(ByVal profileVersionId As Guid) As Boolean

		Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)
		Return CanUserGetRevisionInformation(currentProfileVersionInfo)

	End Function

	''' <summary>
	''' Indicates if the user has permission to view any of the revision information in this section
	''' Based on user permissions and the Status
	''' </summary>
	''' <returns>
	''' True if viewing the revision information is allowed; False otherwise.
	''' If Status is not equal to Draft then returns False
	''' </returns>
	Public Shared Function CanGetRevisionInformation(ByVal profileVersion As ProfileVersionInfo) As Boolean

		'The profile version must be draft
		If Not profileVersion.Status = ProfileVersionStatus.Draft Then
			Return False
		End If

		Return CanUserGetRevisionInformation(profileVersion.Id)

	End Function

	Public Shared Function CanUserGetRevisionInformation(ByVal profileVersion As ProfileVersionInfo) As Boolean
		Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

		If identity.IsUserManagementSystem Then
			Return False
		End If

		Return (identity.IsProfileContributorOrReviewer(profileVersion.ProfileId) OrElse
				identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)
	End Function

	Public Overrides Function CanReadProperty(ByVal propertyName As String) As Boolean

		If propertyName = "VAReviewFrequency" _
			OrElse propertyName = "PolicyReviewFrequency" _
			OrElse propertyName = "AuthorReviewFrequency" _
			OrElse propertyName = "VAReviewStatusId" _
			OrElse propertyName = "PolicyReviewStatusId" _
			OrElse propertyName = "AuthorReviewStatusId" Then

			Return CanUserGetRevisionInformation(mProfileVersionId)

		ElseIf propertyName = "NextVAReview" _
			OrElse propertyName = "NextPolicyReview" _
			OrElse propertyName = "NextAuthorReview" Then

			Return CanUserGetNextReviewDates(mProfileVersionId)
		Else
			Return True
		End If

	End Function

	Public Overrides Function CanWriteProperty(ByVal propertyName As String) As Boolean

		If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
			Return False
		End If

		If propertyName = "NextVAReview" OrElse propertyName = "NextPolicyReview" OrElse propertyName = "NextAuthorReview" Then
			Return CanEditNextReviewDates(mProfileVersionId)
		End If

		Return Not IsReadOnly

	End Function

	''' <summary>
	''' Indicates if the user has permission to clear the data from this section
	''' </summary>
	''' <returns>True if clearing the section is allowed; False otherwise.</returns>
	Public Shared Function CanClearProfileVersionSection(ByVal profileVersionId As Guid) As Boolean

        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        'The profile version must be current
        If Not currentProfileVersionInfo.IsCurrent Then
            Return False
        End If

        'The profile version must be draft
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            Return False
        End If

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        'The user must be a Profile Editor
        Return identity.IsProfileEditor

    End Function

    Protected Overrides Function CanGetSection() As Boolean

        Return CanGetProfileVersionSection(mProfileVersionId)

    End Function

    Protected Overrides Function CanEditSection() As Boolean

        Return CanEditProfileVersionSection(mProfileVersionId, mSectionId)

    End Function

#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to be called from client code when obtaining a ProfileVersionSection as a root object
    ''' </summary>
    ''' <param name="profileVersionId">the profile version for which to retrieve the object</param>
    ''' <param name="profileSectionId">the profile section for which to retrieve the object</param>
    ''' <returns>A ProfileVersionSection object</returns>
    Public Shared Function GetProfileVersionSection(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid) As ProfileVersionSection

        If Not ProfileVersionSection.CanGetProfileVersionSection(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to access the profile data for this profile version section")
        End If

        Dim section As ProfileVersionSection = DataPortal.Fetch(Of ProfileVersionSection)(New Criteria(profileVersionId, profileSectionId))
        section.AddEventHandlers()
        Return section

    End Function

    ''' <summary>
    ''' Factory method to be called from within the business layer to obtain a ProfileVersionSection as a child object
    ''' </summary>
    ''' <param name="reader">DataContracts.ProfileVersionSection containing records required to instantiate the ProfileVersionSection</param>
    ''' <returns>A ProfileVersionSection object</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetProfileVersionSection(ByVal dtoProfileVersionSection As DataContracts.ProfileVersionSection, ByVal sectionMetadata As SectionMetadataWrapper) As ProfileVersionSection

        Dim section As New ProfileVersionSection(dtoProfileVersionSection, sectionMetadata)
        section.AddEventHandlers()
        Return section

    End Function

    ''' <summary>
    ''' Private constructor to prevent the ProfileVersionSection from being created except via factory methods
    ''' </summary>
    Private Sub New()
        ' require use of factory methods
    End Sub

    ''' <summary>
    ''' Constructor called from factory methods to create a ProfileVersionSection object
    ''' </summary>
    ''' <param name="reader">DataContracts.ProfileVersionSection containing records required to instantiate the ProfileVersionSection</param>
    Private Sub New(ByVal dtoProfileVersionSection As DataContracts.ProfileVersionSection, ByVal sectionMetadata As SectionMetadataWrapper)
        Fetch(dtoProfileVersionSection, sectionMetadata)
    End Sub

    ''' <summary>
    ''' Saves the data in this profile version section
    ''' </summary>
    ''' <returns>The resulting profile version section</returns>
    Public Overrides Function Save() As SectionBase

        If IsReadOnly Then
            Throw New System.Security.SecurityException("You do not have permission to save changes to the profile version section")
        End If

        Return MyBase.Save()

    End Function

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Criteria object used to pass criteria for constructing the object via the CSLA DataPortal
    ''' </summary>
    <Serializable()> _
    Private Class Criteria
        Private mProfileVersionId As Guid
        Private mProfileSectionId As Guid

        ''' <summary>
        ''' Unique identifier for the profile version to which this ProfileVersionSection object belongs.
        ''' </summary>
        ''' <returns>profile version identifier</returns>
        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        ''' <summary>
        ''' Unique identifier for the profile section that this ProfileVersionSection object represents within the profile version.
        ''' </summary>
        ''' <returns>profile section identifier</returns>
        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property ProfileSectionId() As Guid
            Get
                Return mProfileSectionId
            End Get
        End Property

        ''' <summary>
        ''' Constructor for the criteria object/
        ''' </summary>
        ''' <param name="profileVersionId">profile version identifier</param>
        ''' <param name="profileSectionId">profile section identifier</param>
        Public Sub New(ByVal profileVersionId As Guid, ByVal profileSectionId As Guid)
            mProfileVersionId = profileVersionId
            mProfileSectionId = profileSectionId
        End Sub
    End Class

    ''' <summary>
    ''' Method to initialize the ProfileVersionSection from the values in the database
    ''' </summary>
    ''' <param name="criteria">profile version and section wrapped in a Criteria object</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        Dim db As ServiceContracts.IProfileVersionDataService = DataFactory.GetProfileVersionDataService
        Dim dtoAnswerData As DataContracts.ProfileAnswerDataSingleSection = _
            db.GetProfileVersionAnswerDataSingleSection(New DataContracts.GetProfilesAnswerDataSingleSectionRequest(criteria.ProfileVersionId, criteria.ProfileSectionId))

        Dim sectionMetadataList As SectionMetadataListWrapper = SectionMetadataListWrapper.GetProfileSectionMetadataListWrapper()
        Dim currentSectionMetadata As SectionMetadataWrapper = sectionMetadataList.GetById(dtoAnswerData.ProfileVersionSection.SectionId)

        'Section Metadata and Section Answer data
        DoFetch(dtoAnswerData.ProfileVersionSection, currentSectionMetadata)

        'ProfiledSpeciesList
        mProfiledSpeciesList = New List(Of ProfiledSpecies)
        For Each dtoProfiledSpecies As DataContracts.ProfiledSpecies In dtoAnswerData.ProfiledSpeciesList
            Dim species As New ProfiledSpecies(dtoProfiledSpecies)
            mProfiledSpeciesList.Add(species)
        Next

        'Initialize Non Metadata: ProfiledSpeciesList, IsReadOnly, ParentId, QuestionNames
        InitializeNonMetadata(currentSectionMetadata, dtoAnswerData.ProfiledSpeciesList, dtoAnswerData.ProfileVersionSection.QuestionNameList, dtoAnswerData.ProfileVersionSection.ProfileVersionId)

        'Question Metadata
        Dim currentMetadataListWrapper As SectionMetadataListWrapper = SectionMetadataListWrapper.GetProfileSectionMetadataListWrapper()
        For Each questionMetadata As QuestionMetadataWrapper In currentSectionMetadata.QuestionMetadataList
            FetchQuestion(questionMetadata)
        Next

        'Field Metadata
        InitializeFieldValueLists()

        For Each profiledSpecies As DataContracts.ProfiledSpecies In dtoAnswerData.ProfiledSpeciesList
            FetchSpecies(profiledSpecies)
        Next

        'Question Rows
        For Each dtoQuestionRow As DataContracts.QuestionRow In dtoAnswerData.ProfileVersionSection.QuestionRowList
            DirectCast(Me.Questions.GetById(dtoQuestionRow.ProfileQuestionId), RepeatingQuestion).FetchRow(dtoQuestionRow)
        Next

        'Field Values
        For Each dtoFieldValue As DataContracts.ProfileFieldValue In dtoAnswerData.ProfileVersionSection.FieldValueList
            Me.Questions.GetById(dtoFieldValue.QuestionId).FetchValue(dtoFieldValue)
        Next

    End Sub

    ''' <summary>
    ''' Method called from the constructor for child objects to initialize the ProfileVersionSection object
    ''' </summary>
    ''' <param name="reader">Datareader containing recordset required to instantiate the ProfileVersionSection</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal dtoProfileVersionSection As DataContracts.ProfileVersionSection, ByVal sectionMetadata As SectionMetadataWrapper)
        MarkAsChild()
        DoFetch(dtoProfileVersionSection, sectionMetadata)
        MarkOld()
    End Sub

    ''' <summary>
    ''' Loads initial values into the ProfileVersionSection object from the database
    ''' </summary>
    ''' <param name="reader">Datareader containing recordset required to instantiate the ProfileVersionSection</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub DoFetch(ByVal dtoProfileVersionSection As DataContracts.ProfileVersionSection, ByVal sectionMetadata As SectionMetadataWrapper)

        mSectionId = sectionMetadata.Id
        mSectionName = sectionMetadata.Name
        mSectionShortName = sectionMetadata.ShortName
        mSectionNumber = sectionMetadata.SectionNumber

        mParentId = dtoProfileVersionSection.ParentId
        mProfileVersionId = dtoProfileVersionSection.ProfileVersionId
        mLastUpdated = dtoProfileVersionSection.LastUpdated
        mVAReviewFrequency = dtoProfileVersionSection.RevisionDates.VAReviewFrequency
        mPolicyReviewFrequency = dtoProfileVersionSection.RevisionDates.PolicyReviewFrequency
        mAuthorReviewFrequency = dtoProfileVersionSection.RevisionDates.AuthorReviewFrequency
        mNextVAReview = New Csla.SmartDate(dtoProfileVersionSection.RevisionDates.NextVAReview)
        mNextPolicyReview = New Csla.SmartDate(dtoProfileVersionSection.RevisionDates.NextPolicyReview)
        mNextAuthorReview = New Csla.SmartDate(dtoProfileVersionSection.RevisionDates.NextAuthorReview)
        mHasPolicyReviewFrequency = dtoProfileVersionSection.RevisionDates.HasPolicyReviewFrequency
        mHasVAReviewFrequency = dtoProfileVersionSection.RevisionDates.HasVAReviewFrequency
        mHasAuthorReviewFrequency = dtoProfileVersionSection.RevisionDates.HasAuthorReviewFrequency
        mVAReviewStatusId = dtoProfileVersionSection.RevisionDates.VAReviewStatusId
        mPolicyReviewStatusId = dtoProfileVersionSection.RevisionDates.PolicyReviewStatusId
        mAuthorReviewStatusId = dtoProfileVersionSection.RevisionDates.AuthorReviewStatusId
        mHasVAReviewStatusId = dtoProfileVersionSection.RevisionDates.HasVAReviewStatusId
        mHasPolicyReviewStatusId = dtoProfileVersionSection.RevisionDates.HasPolicyReviewStatusId
        mHasAuthorReviewStatusId = dtoProfileVersionSection.RevisionDates.HasAuthorReviewStatusId
        mVAReviewCompleted = New Csla.SmartDate(dtoProfileVersionSection.RevisionDates.VAReviewCompleted)
        mPolicyReviewCompleted = New Csla.SmartDate(dtoProfileVersionSection.RevisionDates.PolicyReviewCompleted)
        mAuthorReviewCompleted = New Csla.SmartDate(dtoProfileVersionSection.RevisionDates.AuthorReviewCompleted)

    End Sub

    Friend Sub FetchSpecies(ByVal profiledSpecies As DataContracts.ProfiledSpecies)

        Questions.FetchSpecies(profiledSpecies)

    End Sub

    ''' <summary>
    ''' Save changes to the ProfileVersionSection object back to the database. Calls a stored procedure to save the properties
    ''' of the ProfileVersionSection object, then delegates to the question list to save its own contents
    ''' </summary>
    Protected Overrides Sub DataPortal_Update()

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim db As ServiceContracts.IProfileVersionDataService = DataFactory.GetProfileVersionDataService()
        Dim changeset As New DataContracts.ProfileAnswerDataChangeSet(identity.UserId, mProfileVersionId, mSectionId)

        changeset.NextPolicyReview = mNextPolicyReview.Date
        changeset.NextVAReview = mNextVAReview.Date
        changeset.NextAuthorReview = mNextAuthorReview.Date
        changeset.PolicyReviewFrequency = mPolicyReviewFrequency
        changeset.VAReviewFrequency = mVAReviewFrequency
        changeset.AuthorReviewFrequency = mAuthorReviewFrequency
        changeset.LastUpdated = mLastUpdated
        changeset.PolicyReviewStatusId = mPolicyReviewStatusId
        changeset.VAReviewStatusId = mVAReviewStatusId
        changeset.AuthorReviewStatusId = mAuthorReviewStatusId
        changeset.VAReviewCompleted = mVAReviewCompleted.Date
        changeset.PolicyReviewCompleted = mPolicyReviewCompleted.Date
        changeset.AuthorReviewCompleted = mAuthorReviewCompleted.Date

        Me.Questions.GetUpdate(changeset)

        Dim result As DataContracts.ProfileAnswerDataChangeResult = db.UpdateProfileVersionAnswerData(changeset)

        mLastUpdated = result.LastUpdated

        'updates the id of the question rows that have been added.
        Dim insertIndex As Integer = 0
        For Each libQuestionBase As QuestionBase In Me.Questions

            Dim repeatingQuestion As RepeatingQuestion = TryCast(libQuestionBase, RepeatingQuestion)

            If repeatingQuestion IsNot Nothing Then

                For Each row As QuestionRow In repeatingQuestion.RowList

                    If row.IsNew Then
                        row.Insert(result.QuestionRowIdInsertList(insertIndex))
                        insertIndex = insertIndex + 1
                    End If

                Next
            End If
        Next

        Me.Questions.Update()

    End Sub

#End Region

End Class
