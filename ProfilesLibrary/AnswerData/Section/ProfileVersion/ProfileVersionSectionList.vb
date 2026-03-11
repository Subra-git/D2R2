Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileVersionSectionList
    Inherits SectionListBase

    Private mProfileVersionId As Guid
    Private mProfiledSpeciesList As List(Of ProfiledSpecies)

#Region " Business Methods "

    Public ReadOnly Property ProfiledSpeciesList() As List(Of ProfiledSpecies)
        Get
            Return mProfiledSpeciesList
        End Get
    End Property

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetProfileVersionSectionList(ByVal profileVersionId As Guid) As Boolean

        Dim currentProfileVersionInfo As ProfileVersionInfo = ProfileVersionInfo.GetProfileVersionInfo(profileVersionId)

        'If the profile version is published
        If Not currentProfileVersionInfo.Status = ProfileVersionStatus.Draft Then
            'the profile version section information is available to everyone if public; all authenticated users if not public
            Return currentProfileVersionInfo.IsPublic OrElse Csla.ApplicationContext.User.Identity.IsAuthenticated
        End If

        'If the profile version is draft, you must be a profile editor, policy profile user, or a contributor or a reviewer to get
        'the profile version section information
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        Return (identity.IsProfileContributorOrReviewer(currentProfileVersionInfo.ProfileId) OrElse _
                identity.IsProfileEditor OrElse identity.IsPolicyProfileUser)

    End Function

    Public Shared Function CanEditProfileVersionSectionList(ByVal profileVersionId As Guid) As Boolean

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
        Return (identity.IsProfileEditor OrElse identity.IsProfileContributor(currentProfileVersionInfo.ProfileId))

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileVersionSectionList(ByVal profileVersionId As Guid) As ProfileVersionSectionList

        If Not ProfileVersionSectionList.CanGetProfileVersionSectionList(profileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to access the profile section data for this profile version")
        End If

        Dim sectionList As ProfileVersionSectionList = DataPortal.Fetch(Of ProfileVersionSectionList)(New Criteria(profileVersionId))
        For Each section As SectionBase In sectionList
            section.AddEventHandlers()
        Next
        Return sectionList

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Overrides Function Save() As SectionListBase

        If Not CanEditProfileVersionSectionList(mProfileVersionId) Then
            Throw New System.Security.SecurityException("You do not have permission to save changes to the sections of this profile version")
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

        ''' <summary>
        ''' Unique identifier for the profile version.
        ''' </summary>
        ''' <returns>profile version identifier</returns>
        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property ProfileVersionId() As Guid
            Get
                Return mProfileVersionId
            End Get
        End Property

        ''' <summary>
        ''' Constructor for the criteria object
        ''' </summary>
        ''' <param name="profileVersionId">profile version identifier</param>
        Public Sub New(ByVal profileVersionId As Guid)
            mProfileVersionId = profileVersionId
        End Sub
    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False

        Dim db As ServiceContracts.IProfileVersionDataService = DataFactory.GetProfileVersionDataService
        Dim dtoProfileAnswerData As DataContracts.ProfileAnswerData = db.GetProfileVersionAnswerData(New DataContracts.GetProfilesAnswerDataRequest(criteria.ProfileVersionId))

        Dim sectionMetadataList As SectionMetadataListWrapper = SectionMetadataListWrapper.GetProfileSectionMetadataListWrapper()

        'Populate Section Answer Data and Section Metadata
        For Each dtoProfileVersionSection As DataContracts.ProfileVersionSection In dtoProfileAnswerData.ProfileVersionSectionList
            Dim sectionMetadata As SectionMetadataWrapper = sectionMetadataList.GetById(dtoProfileVersionSection.SectionId)
            Dim section As ProfileVersionSection = ProfileVersionSection.GetProfileVersionSection(dtoProfileVersionSection, sectionMetadata)
            Me.Add(section)
            mSectionDictionary.Add(section.SectionId, section)
        Next

        'ProfiledSpeciesList
        mProfiledSpeciesList = New List(Of ProfiledSpecies)
        For Each dtoProfiledSpecies As DataContracts.ProfiledSpecies In dtoProfileAnswerData.ProfiledSpeciesList
            Dim species As New ProfiledSpecies(dtoProfiledSpecies)
            mProfiledSpeciesList.Add(species)
        Next

        'Initialize Non Metadata (ParentId, IsReadOnly, ProfiledSpeciesList, QuestionNames)
        Dim index As Integer = 0
        For Each dtoProfileVersionSection As DataContracts.ProfileVersionSection In dtoProfileAnswerData.ProfileVersionSectionList
            Dim section As SectionBase = mSectionDictionary(dtoProfileVersionSection.SectionId)
            Dim sectionMetadata As SectionMetadataWrapper = sectionMetadataList.GetById(dtoProfileVersionSection.SectionId)
            section.InitializeNonMetadata(sectionMetadata, dtoProfileAnswerData.ProfiledSpeciesList, dtoProfileAnswerData.ProfileVersionSectionList(index).QuestionNameList, criteria.ProfileVersionId)
            index = index + 1
        Next

        'Question Metadata Wrapper
        For Each sectionMetadata As SectionMetadataWrapper In sectionMetadataList
            'Dim section As SectionBase = mSectionDictionary(sectionMetadata.Id)
            Dim section As SectionBase
            If mSectionDictionary.ContainsKey(sectionMetadata.Id) Then
                section = mSectionDictionary(sectionMetadata.Id)
                For Each questionMetadata As QuestionMetadataWrapper In sectionMetadata.QuestionMetadataList
                    section.FetchQuestion(questionMetadata)
                Next
            End If
        Next

        'InitializeFieldValueLists
        For Each section As ProfileVersionSection In Me
            section.InitializeFieldValueLists()
        Next

        For Each dtoProfiledSpecies As DataContracts.ProfiledSpecies In dtoProfileAnswerData.ProfiledSpeciesList
            For Each section As ProfileVersionSection In Me
                section.FetchSpecies(dtoProfiledSpecies)
            Next
        Next

        'Question Rows
        For Each dtoProfileVersionSection As DataContracts.ProfileVersionSection In dtoProfileAnswerData.ProfileVersionSectionList
            For Each dtoQuestionRow As DataContracts.QuestionRow In dtoProfileVersionSection.QuestionRowList
                DirectCast(mSectionDictionary(dtoProfileVersionSection.SectionId).Questions.GetById(dtoQuestionRow.ProfileQuestionId), RepeatingQuestion).FetchRow(dtoQuestionRow)
            Next
        Next

        'Field Values
        For Each dtoProfileVersionSection As DataContracts.ProfileVersionSection In dtoProfileAnswerData.ProfileVersionSectionList
            For Each dtoFieldValue As DataContracts.ProfileFieldValue In dtoProfileVersionSection.FieldValueList
                mSectionDictionary(dtoProfileVersionSection.SectionId).Questions.GetById(dtoFieldValue.QuestionId).FetchValue(dtoFieldValue)
            Next
        Next

        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

