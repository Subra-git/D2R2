Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class Profile
    Inherits BusinessBase(Of Profile)

#Region " Business Methods "

    Private mId As Guid
    Private mTitle As String = String.Empty
    Private mScenarioTitle As String = String.Empty
    Private mParentId As Guid = Guid.Empty
    Private mParentTitle As String = String.Empty
    Private mCurrentDraftProfileVersionId As Guid = Guid.Empty
    Private mCurrentPublishedProfileVersionId As Guid = Guid.Empty
    Private mCloneProfileVersionId As Guid = Guid.Empty
    Private mCurrentPublicVersionId As Guid = Guid.Empty
    Private mHasPublicScenarios As Boolean
    Private mLastUpdated(7) As Byte
    Private mProfileStatusId As Guid

    Private mAffectedSpeciesList As AffectedSpeciesList = AffectedSpeciesList.NewAffectedSpeciesList()

    Private mCurrentDraftInfo As ProfileVersionInfo
    Private mCurrentPublishedInfo As ProfileVersionInfo
    Private mCurrentPublicInfo As ProfileVersionInfo
    Private mClonedInfo As ProfileVersionInfo
    Private mParentProfile As Profile

    Private mInvalidReasonList As List(Of InvalidReason)

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public Property Title() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            If IsWhatIfScenario Then
                Return mParentTitle
            Else
                Return mTitle
            End If
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mTitle <> value Then
                mTitle = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public Property ScenarioTitle() As String
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Get
            CanReadProperty(True)
            If IsWhatIfScenario Then
                Return mScenarioTitle
            Else
                Return "Current situation"
            End If
        End Get
        <System.Runtime.CompilerServices.MethodImpl(Runtime.CompilerServices.MethodImplOptions.NoInlining)> _
        Set(ByVal value As String)
            CanWriteProperty(True)
            If mScenarioTitle <> value Then
                mScenarioTitle = value
                PropertyHasChanged()
            End If
        End Set
    End Property

    Public ReadOnly Property ParentId() As Guid
        Get
            Return mParentId
        End Get
    End Property

    Public ReadOnly Property ProfileStatusId() As Guid
        Get
            Return mProfileStatusId
        End Get
    End Property

    Public ReadOnly Property IsWhatIfScenario() As Boolean
        Get
            Return Not mParentId.Equals(Guid.Empty)
        End Get
    End Property

    Public ReadOnly Property HasCurrentDraftVersion() As Boolean
        Get
            Return Not mCurrentDraftProfileVersionId.Equals(Guid.Empty)
        End Get
    End Property

    Public ReadOnly Property HasCurrentPublishedVersion() As Boolean
        Get
            Return Not mCurrentPublishedProfileVersionId.Equals(Guid.Empty)
        End Get
    End Property

    Public ReadOnly Property HasPublicVersion() As Boolean
        Get
            Return Not mCurrentPublicVersionId.Equals(Guid.Empty)
        End Get
    End Property

    Public ReadOnly Property HasPublicScenarios() As Boolean
        Get
            Return mHasPublicScenarios
        End Get
    End Property

    Public ReadOnly Property CurrentDraftVersion() As ProfileVersionInfo
        Get
            If mCurrentDraftProfileVersionId.Equals(Guid.Empty) Then
                Return Nothing
            End If
            If mCurrentDraftInfo Is Nothing Then
                mCurrentDraftInfo = ProfileVersionInfo.GetProfileVersionInfo(mCurrentDraftProfileVersionId)
            End If
            Return mCurrentDraftInfo
        End Get
    End Property

    Public ReadOnly Property CurrentPublishedVersion() As ProfileVersionInfo
        Get
            If mCurrentPublishedProfileVersionId.Equals(Guid.Empty) Then
                Return Nothing
            End If
            If mCurrentPublishedInfo Is Nothing Then
                mCurrentPublishedInfo = ProfileVersionInfo.GetProfileVersionInfo(mCurrentPublishedProfileVersionId)
            End If
            Return mCurrentPublishedInfo
        End Get
    End Property

    Public ReadOnly Property CurrentPublicVersion() As ProfileVersionInfo
        Get
            If mCurrentPublicVersionId.Equals(Guid.Empty) Then
                Return Nothing
            End If
            If mCurrentPublicInfo Is Nothing Then
                mCurrentPublicInfo = ProfileVersionInfo.GetProfileVersionInfo(mCurrentPublicVersionId)
            End If
            Return mCurrentPublicInfo
        End Get
    End Property

    Public ReadOnly Property LatestVersion() As ProfileVersionInfo
        Get
            If CurrentDraftVersion IsNot Nothing Then
                Return CurrentDraftVersion
            End If
            Return CurrentPublishedVersion
        End Get
    End Property

    Public ReadOnly Property ClonedVersion() As ProfileVersionInfo
        Get
            If mCloneProfileVersionId.Equals(Guid.Empty) Then
                Return Nothing
            End If
            If mClonedInfo Is Nothing Then
                mClonedInfo = ProfileVersionInfo.GetProfileVersionInfo(mCloneProfileVersionId)
            End If
            Return mClonedInfo
        End Get
    End Property

    Public ReadOnly Property ParentProfile() As Profile
        Get
            If Not IsWhatIfScenario Then
                Return Nothing
            End If
            If mParentProfile Is Nothing Then
                mParentProfile = Profile.GetProfile(mParentId)
            End If
            Return mParentProfile
        End Get
    End Property

    Public ReadOnly Property AffectedSpecies() As List(Of Guid)
        Get

            If Not HasCurrentDraftVersion Then
                Return Nothing
            End If

            Dim list As New List(Of Guid)
            For Each species As AffectedSpecies In mAffectedSpeciesList
                list.Add(species.SpeciesId)
            Next

            Return list

        End Get
    End Property

    Public ReadOnly Property AffectedSpecies(ByVal type As AffectedSpeciesType) As List(Of Guid)
        Get

            If Not HasCurrentDraftVersion Then
                Return Nothing
            End If

            Dim list As New List(Of Guid)
            For Each species As AffectedSpecies In mAffectedSpeciesList
                If species.Type = type Then
                    list.Add(species.SpeciesId)
                End If
            Next

            Return list

        End Get
    End Property

    Public Sub AddAffectedSpecies(ByVal speciesId As Guid, ByVal type As AffectedSpeciesType)

        If Not HasCurrentDraftVersion Then
            Throw New InvalidOperationException("You cannot add an affected species to a profile that does not have a current draft version.")
        End If

        mAffectedSpeciesList.Add(speciesId, mCurrentDraftProfileVersionId, mCloneProfileVersionId, type)
        PropertyHasChanged("AffectedSpecies")

    End Sub

    Public Sub RemoveAffectedSpecies(ByVal speciesId As Guid)

        If Not HasCurrentDraftVersion Then
            Throw New InvalidOperationException("You cannot remove an affected species from a profile that does not have a current draft version.")
        End If

        mAffectedSpeciesList.Remove(speciesId)
        PropertyHasChanged("AffectedSpecies")

    End Sub

    Public Function ContainsAffectedSpecies(ByVal speciesId As Guid) As Boolean

        Return mAffectedSpeciesList.Contains(speciesId)

    End Function

    Protected Overrides Function GetIdValue() As Object
        Return mId
    End Function

    Public Overrides Function ToString() As String

        If IsWhatIfScenario Then
            Return String.Format("{0} ({1})", mParentTitle, mScenarioTitle)
        Else
            Return mTitle
        End If

    End Function

#End Region

#Region " New Draft Version "

    Public Function CanCreateNewDraft() As Boolean

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor

    End Function

    Public Function CreateNewDraft() As Guid

        If Not CanCreateNewDraft() Then
            Throw New System.Security.SecurityException("You do not have permission to create a new draft version of this profile.")
        End If

        mCurrentDraftProfileVersionId = NewProfileVersionCommand.NewProfileVersion(LatestVersion.Id)
        mCurrentDraftInfo = Nothing
        Return mCurrentDraftProfileVersionId

    End Function

#End Region

#Region " New Published Version "

    Public ReadOnly Property ProfileIsValid() As Boolean
        Get
            If mCurrentDraftProfileVersionId.Equals(Guid.Empty) Then
                Return True
            End If
            If mInvalidReasonList Is Nothing Then
                mInvalidReasonList = GetInvalidReasons()
            End If
            Return (mInvalidReasonList.Count = 0)
        End Get
    End Property

    Public Function Validate() As InvalidReason()

        If mCurrentDraftProfileVersionId.Equals(Guid.Empty) Then
            Throw New InvalidOperationException("You cannot validate a profile that does not have a current draft version.")
        End If
        If mInvalidReasonList Is Nothing Then
            mInvalidReasonList = GetInvalidReasons()
        End If
        Return mInvalidReasonList.ToArray()

    End Function

    Public Function CanPublish() As Boolean

        If mCurrentDraftProfileVersionId.Equals(Guid.Empty) Then
            Return False
        End If

        If IsWhatIfScenario AndAlso ParentProfile.CurrentPublishedVersion Is Nothing Then
            Return False
        Else
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Return identity.IsProfileEditor
        End If

    End Function

    Public Function CanPublishPublic() As Boolean

        If IsWhatIfScenario AndAlso ParentProfile.CurrentPublishedVersion IsNot Nothing Then
            If CanPublish() Then
                If ParentProfile.CurrentPublishedVersion.IsPublic Then
                    Return True
                Else
                    Return False
                End If
            Else
                Return False
            End If
        Else
            Return CanPublish()
        End If

    End Function

    Public Function Publish(ByVal makePublic As Boolean) As Guid

        If mCurrentDraftProfileVersionId.Equals(Guid.Empty) Then
            Throw New InvalidOperationException("You cannot publish this profile because it does not have a current draft version.")
        End If

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        If Not identity.IsProfileEditor Then
            Throw New System.Security.SecurityException("You do not have permission to publish this profile.")
        End If

        If IsWhatIfScenario AndAlso ParentProfile.CurrentPublishedVersion Is Nothing Then
            Throw New InvalidOperationException("You cannot publish this scenario because the profile to which it belongs is not published.")
        End If

        If Not ProfileIsValid Then
            Throw New InvalidOperationException("You cannot publish this profile because the current version is invalid.")
        End If

        If IsWhatIfScenario AndAlso makePublic AndAlso Not ParentProfile.HasPublicVersion Then
            Throw New InvalidOperationException("You cannot make this scenario public because there is no public version of this profile.")
        End If

        mCurrentPublishedProfileVersionId = NewProfileVersionCommand.NewProfileVersion(mCurrentDraftProfileVersionId, ProfileVersionStatus.Published, makePublic)
        mCurrentPublishedInfo = Nothing

        mCurrentDraftProfileVersionId = Guid.Empty
        mCurrentDraftInfo = Nothing

        Return mCurrentPublishedProfileVersionId

    End Function

    Private Function GetInvalidReasons() As List(Of InvalidReason)

        Dim sectionList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()
        Dim invalidReasonList As List(Of InvalidReason) = New List(Of InvalidReason)()

        For Each section As ProfileSectionMetadata In sectionList
            Dim profileSection As ProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(mCurrentDraftProfileVersionId, section.Id)
            Dim sectionInvalidReasonList As List(Of InvalidReason) = New List(Of InvalidReason)()

            'profile revision details mandatory    
            If profileSection.NextPolicyReview.IsEmpty Then
                invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Next policy review", profileSection.SectionNumber))
            End If

            If profileSection.NextVAReview.IsEmpty Then
                invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Next VA review", profileSection.SectionNumber))
            End If

            If profileSection.NextAuthorReview.IsEmpty Then
                invalidReasonList.Add(New InvalidReason(InvalidReason.ReasonType.Mandatory, "Revision dates, Next author review", profileSection.SectionNumber))
            End If

            'validate each question in section
            sectionInvalidReasonList = profileSection.Validate()

            For Each sectionReason As InvalidReason In sectionInvalidReasonList
                sectionReason.SectionNumber = profileSection.SectionNumber
            Next

            invalidReasonList.AddRange(sectionInvalidReasonList)

        Next

        Return invalidReasonList

    End Function

#End Region

#Region " Delete "

    Public Function CanDeleteLatestDraft() As Boolean

        If mCurrentDraftProfileVersionId.Equals(Guid.Empty) Then
            Return False
        Else
            Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
            Return identity.IsProfileEditor
        End If

    End Function

    Public Sub DeleteLatestDraft()

        If Not CanDeleteLatestDraft() Then
            Throw New System.Security.SecurityException("You cannot delete the latest profile version belonging to this profile.")
        End If

        mCurrentDraftProfileVersionId = DeleteProfileVersionCommand.DeleteProfileVersion(mCurrentDraftProfileVersionId)
        mCurrentDraftInfo = Nothing

    End Sub

#End Region

#Region " Validation Rules "

    Protected Overrides Sub AddBusinessRules()

        'profile title rules
        ValidationRules.AddRule(AddressOf TitleRequired, "Title")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("Title", 255))

        'scenario title rules
        ValidationRules.AddRule(AddressOf ScenarioTitleRequired, "ScenarioTitle")
        ValidationRules.AddRule(AddressOf Validation.CommonRules.StringMaxLength, New Validation.CommonRules.MaxLengthRuleArgs("ScenarioTitle", 255))

        'affected species rules
        ValidationRules.AddRule(AddressOf AtLeastOneProfiledSpeciesRequired, "AffectedSpecies")

    End Sub

    Private Shared Function TitleRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim thisProfile As Profile = DirectCast(target, Profile)

        If thisProfile.mTitle.Length = 0 AndAlso (Not thisProfile.IsWhatIfScenario) Then
            e.Description = "A current situation profile must have a profile title"
            Return False
        End If

        If thisProfile.mTitle.Length > 0 AndAlso thisProfile.IsWhatIfScenario Then
            e.Description = "A what-if scenario must not have a profile title"
            Return False
        End If

        Return True

    End Function

    Private Shared Function ScenarioTitleRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim thisProfile As Profile = DirectCast(target, Profile)

        If thisProfile.mScenarioTitle.Length = 0 AndAlso thisProfile.IsWhatIfScenario Then
            e.Description = "A what-if scenario must have a scenario title"
            Return False
        End If

        If thisProfile.mScenarioTitle.Length > 0 AndAlso (Not thisProfile.IsWhatIfScenario) Then
            e.Description = "A current situation profile must not have a scenario title"
            Return False
        End If

        Return True

    End Function

    Private Shared Function AtLeastOneProfiledSpeciesRequired(ByVal target As Object, ByVal e As Validation.RuleArgs) As Boolean

        Dim thisProfile As Profile = DirectCast(target, Profile)

        If thisProfile.HasCurrentDraftVersion AndAlso thisProfile.mAffectedSpeciesList.CountOfType(AffectedSpeciesType.Profiled) = 0 Then
            e.Description = "A profile must have at least one profiled species"
            Return False
        End If

        Return True

    End Function

#End Region

#Region " Authorization Rules "

    Public Overrides Function CanWriteProperty(ByVal propertyName As String) As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        'cannot edit the profile title if the profile is a what-if scenario
        If propertyName = "Title" AndAlso IsWhatIfScenario Then
            Return False
        End If

        'cannot edit the profile title if the profile is a current situation profile
        If propertyName = "ScenarioTitle" AndAlso (Not IsWhatIfScenario) Then
            Return False
        End If

        Return MyBase.CanWriteProperty(propertyName)

    End Function

    Public Shared Function CanCreateProfile() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanCreateScenario() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

    Public Shared Function CanGetProfile() As Boolean

        If DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity).IsUserManagementSystem Then
            Return False
        End If

        Return Csla.ApplicationContext.User.Identity.IsAuthenticated
    End Function

    Public Shared Function CanEditProfile() As Boolean
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Return identity.IsProfileEditor AndAlso Not identity.IsUserManagementSystem
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function NewProfile() As Profile

        If Not CanCreateProfile() Then
            Throw New System.Security.SecurityException("You do not have permission to create a new profile.")
        End If

        Return DataPortal.Create(Of Profile)()

    End Function

    Public Shared Function NewProfile(ByVal cloneProfileVersionId As Guid) As Profile

        If Not CanCreateProfile() Then
            Throw New System.Security.SecurityException("You do not have permission to create a new profile.")
        End If

        Dim createdProfile As Profile = DataPortal.Create(Of Profile)(New NewCriteria(cloneProfileVersionId))
        If createdProfile.ClonedVersion.IsWhatIfScenario Then
            Throw New System.InvalidOperationException("You cannot clone a new ""current situation"" profile from a profile version belonging to a what-if scenario.")
        End If
        Return createdProfile

    End Function

    Public Shared Function NewScenario(ByVal cloneProfileVersionId As Guid) As Profile

        If Not CanCreateScenario() Then
            Throw New System.Security.SecurityException("You do not have permission to create a new ""what-if"" scenario.")
        End If

        Return DataPortal.Create(Of Profile)(New NewCriteria(cloneProfileVersionId, True))

    End Function

    Public Shared Function GetProfile(ByVal id As Guid) As Profile

        If Not CanGetProfile() Then
            Throw New System.Security.SecurityException("You do not have permission to view profile data.")
        End If

        Return DataPortal.Fetch(Of Profile)(New GetCriteria(id))

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Overrides Function Save() As Profile

        If Not CanEditProfile() Then
            Throw New System.Security.SecurityException("You do not have permission to edit profile data.")
        End If

        ValidationRules.CheckRules()

        Dim result As Profile = MyBase.Save()

        'only clear these objects if the save is successful
        mCurrentDraftInfo = Nothing
        mCurrentPublishedInfo = Nothing
        mClonedInfo = Nothing

        Return result

    End Function

#End Region

#Region " Data Access "

    <Serializable()> _
    Private Class NewCriteria

        Private mCloneProfileVersionId As Guid
        Private mIsWhatIfScenario As Boolean

        Public ReadOnly Property CloneProfileVersionId() As Guid
            Get
                Return mCloneProfileVersionId
            End Get
        End Property

        Public ReadOnly Property IsWhatIfScenario() As Boolean
            Get
                Return mIsWhatIfScenario
            End Get
        End Property

        Public Sub New(ByVal cloneProfileVersionId As Guid)
            mCloneProfileVersionId = cloneProfileVersionId
        End Sub

        Public Sub New(ByVal cloneProfileVersionId As Guid, ByVal isWhatIfScenario As Boolean)
            mCloneProfileVersionId = cloneProfileVersionId
            mIsWhatIfScenario = isWhatIfScenario
        End Sub

    End Class

    <Serializable()> _
    Private Class GetCriteria

        Private mId As Guid

        Public ReadOnly Property Id() As Guid
            Get
                Return mId
            End Get
        End Property

        Public Sub New(ByVal id As Guid)
            mId = id
        End Sub

    End Class

    <RunLocal()> _
    Protected Overrides Sub DataPortal_Create()
        mId = Guid.NewGuid()
        mCurrentDraftProfileVersionId = Guid.NewGuid()
    End Sub

    Private Overloads Sub DataPortal_Create(ByVal criteria As NewCriteria)

        mId = Guid.NewGuid()
        mCurrentDraftProfileVersionId = Guid.NewGuid()
        mCloneProfileVersionId = criteria.CloneProfileVersionId

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        Dim result As DataContracts.NewProfileDefaults = db.GetNewProfileDefaults( _
            New DataContracts.GetNewProfileDefaultsRequest(criteria.CloneProfileVersionId, criteria.IsWhatIfScenario) _
        )

        With result
            mScenarioTitle = .ScenarioTitle
            mParentId = .ParentId
            mParentTitle = .ParentTitle
            mTitle = .Title
            mProfileStatusId = .ProfileStatusId
        End With

        mAffectedSpeciesList = AffectedSpeciesList.GetAffectedSpeciesList(result.AffectedSpeciesList, mCurrentDraftProfileVersionId, mCloneProfileVersionId)

    End Sub

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As GetCriteria)

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        Dim result As DataContracts.ProfileAttributes = db.GetProfileAttributes(New DataContracts.GetProfileAttributesRequest(criteria.Id))

        With result
            mId = .Id
            mTitle = .Title
            mScenarioTitle = .ScenarioTitle
            mParentId = .ParentId
            mParentTitle = .ParentTitle
            mProfileStatusId = .ProfileStatusId
            mCurrentDraftProfileVersionId = .CurrentDraftProfileVersionId
            mCurrentPublishedProfileVersionId = .CurrentPublishedProfileVersionId
            mCurrentPublicVersionId = .CurrentPublicVersionId
            mHasPublicScenarios = .HasPublicScenarios
            mLastUpdated = .LastUpdated
        End With

        mAffectedSpeciesList = AffectedSpeciesList.GetAffectedSpeciesList(result.AffectedSpeciesList, mCurrentDraftProfileVersionId)

    End Sub

    Protected Overrides Sub DataPortal_Insert()

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        Dim request As New DataContracts.CreateProfileRequest With { _
            .Id = mId, _
            .ParentId = mParentId, _
            .ParentTitle = mParentTitle, _
            .Title = mTitle, _
            .ProfileStatusId = mProfileStatusId, _
            .ScenarioTitle = mScenarioTitle, _
            .CurrentDraftProfileVersionId = mCurrentDraftProfileVersionId, _
            .CloneProfileVersionId = mCloneProfileVersionId _
        }
        request.AffectedSpeciesInsertList = mAffectedSpeciesList.GetInsertList()

        Dim response As DataContracts.CreateProfileResponse = db.CreateProfile(request)

        mId = response.NewProfileId
        mLastUpdated = response.NewLastUpdated
        mAffectedSpeciesList.Update()

        mCloneProfileVersionId = Guid.Empty
        mClonedInfo = Nothing

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim db As ServiceContracts.IProfileManagementService = DataFactory.GetProfileManagementService()
        Dim request As New DataContracts.UpdateProfileAttributesRequest With { _
            .Id = mId, _
            .Title = mTitle, _
            .ScenarioTitle = mScenarioTitle, _
            .LastUpdated = mLastUpdated, _
            .AffectedSpeciesInsertList = mAffectedSpeciesList.GetInsertList(), _
            .AffectedSpeciesDeleteList = mAffectedSpeciesList.GetDeleteList() _
        }
        
        Dim response As DataContracts.UpdateProfileAttributesResponse = db.UpdateProfileAttributes(request)

        mLastUpdated = response.NewLastUpdated
        mAffectedSpeciesList.Update()

    End Sub

#End Region

#Region " Contributions Report "

    Public Shared Function CanGetContributionsReport() As Boolean

        Return GetContributionsReportCommand.CanGetReport()

    End Function

    Public Function GetContributionsReport() As Byte()

        Return GetContributionsReportCommand.GetContributionsReport(Me.Id)

    End Function

#End Region

End Class

