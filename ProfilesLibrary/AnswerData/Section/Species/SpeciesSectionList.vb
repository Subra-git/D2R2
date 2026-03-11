Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesSectionList
    Inherits SectionListBase

    Private mSpeciesId As Guid
    Private mSpeciesName As String
    Private mLastUpdated(7) As Byte
    Private mIsReadOnly As Boolean

#Region " Business methods "

    Public ReadOnly Property LastUpdated() As Byte()
        Get
            Return mLastUpdated
        End Get
    End Property

    Public ReadOnly Property SpeciesName() As String
        Get
            Return mSpeciesName
        End Get
    End Property

    Public ReadOnly Property SpeciesId() As Guid
        Get
            Return mSpeciesId
        End Get
    End Property

    Public ReadOnly Property IsReadOnly() As Boolean
        Get
            Return mIsReadOnly
        End Get
    End Property

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetSpeciesSectionList() As Boolean
        Return True 'all users can get species data, even if anonymous
    End Function

    Public Shared Function CanEditSpeciesSectionList(ByVal speciesList As SpeciesSectionList) As Boolean

        If Not Csla.ApplicationContext.User.Identity.IsAuthenticated Then
            Return False
        End If

        'Must be a profile editor to edit
        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)

        If identity.IsUserManagementSystem Then
            Return False
        End If

        If identity.IsProfileEditor Then
            Return Not speciesList.IsReadOnly
        End If

        Return False

    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetSpeciesSectionList(ByVal speciesId As Guid) As SpeciesSectionList

        Return GetSpeciesSectionList(speciesId, False)

    End Function

    Public Shared Function GetReadOnlySpeciesSectionList(ByVal speciesId As Guid) As SpeciesSectionList

        Return GetSpeciesSectionList(speciesId, True)

    End Function

    Private Shared Function GetSpeciesSectionList(ByVal speciesId As Guid, ByVal isReadOnly As Boolean) As SpeciesSectionList

        If Not SpeciesSectionList.CanGetSpeciesSectionList() Then
            Throw New System.Security.SecurityException("You do not have permission to access the species data for this species")
        End If

        Dim sectionList As SpeciesSectionList = DataPortal.Fetch(Of SpeciesSectionList)(New Criteria(speciesId, isReadOnly))
        Return sectionList

    End Function


    Private Sub New()
        ' require use of factory methods
    End Sub

    Public Overrides Function Save() As SectionListBase

        If Not CanEditSpeciesSectionList(Me) Then
            Throw New System.Security.SecurityException("You do not have permission to save changes to species data")
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
        Private mSpeciesId As Guid
        Private mIsReadOnly As Boolean = False

        ''' <summary>
        ''' Unique identifier for the species.
        ''' </summary>
        ''' <returns>species identifier</returns>
        <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
        Public ReadOnly Property SpeciesId() As Guid
            Get
                Return mSpeciesId
            End Get
        End Property
        Public ReadOnly Property IsReadOnly() As Boolean
            Get
                Return mIsReadOnly
            End Get
        End Property
        Public Sub New(ByVal speciesId As Guid, ByVal isReadOnly As Boolean)
            mSpeciesId = speciesId
            mIsReadOnly = isReadOnly
        End Sub

    End Class

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Criteria)

        RaiseListChangedEvents = False

        mSpeciesId = criteria.SpeciesId
        mIsReadOnly = criteria.IsReadOnly

        Dim db As ServiceContracts.ISpeciesDataService = DataFactory.GetSpeciesDataService()
        Dim dtoAnswerData As DataContracts.SpeciesAnswerData = db.GetSpeciesAnswerData(New DataContracts.GetSpeciesAnswerDataRequest(criteria.SpeciesId))

        Dim sectionMetadataList As SectionMetadataListWrapper
        sectionMetadataList = SectionMetadataListWrapper.GetSpeciesSectionMetadataListWrapper()

        mSpeciesName = dtoAnswerData.SpeciesName
        mLastUpdated = dtoAnswerData.LastUpdated

        'Populate Section Answer Data and Section Metadata
        For Each dtoSpeciesSection As DataContracts.SpeciesSection In dtoAnswerData.SpeciesSectionList
            Dim sectionMetadata As SectionMetadataWrapper = sectionMetadataList.GetById(dtoSpeciesSection.SectionId)
            Dim section As SpeciesSection = SpeciesSection.GetSpeciesSection(dtoSpeciesSection, sectionMetadata, Me)
            Me.Add(section)
            mSectionDictionary.Add(section.SectionId, section)
        Next

        For Each sectionMetadata As SectionMetadataWrapper In sectionMetadataList
            Dim section As SectionBase = mSectionDictionary(sectionMetadata.Id)

            'question metadata
            For Each questionMetadata As QuestionMetadataWrapper In sectionMetadata.QuestionMetadataList
                section.FetchQuestion(questionMetadata)
            Next
        Next

        For Each sectionMetadata As SectionMetadataWrapper In sectionMetadataList
            Dim section As SectionBase = mSectionDictionary(sectionMetadata.Id)
            section.InitializeNonMetadata(sectionMetadata, Nothing, Nothing, Guid.Empty)
        Next

        For Each section As SectionBase In Me
            section.InitializeFieldValueLists()
        Next

        'Field Values
        For Each dtoSpeciesSection As DataContracts.SpeciesSection In dtoAnswerData.SpeciesSectionList
            For Each dtoFieldValue As DataContracts.SpeciesFieldValue In dtoSpeciesSection.FieldValueList
                mSectionDictionary(dtoSpeciesSection.SectionId).Questions.GetById(dtoFieldValue.QuestionId).FetchValue(dtoFieldValue)
            Next
        Next

        RaiseListChangedEvents = True

    End Sub

    Protected Overrides Sub DataPortal_Update()

        Dim identity As ProfilesIdentity = DirectCast(Csla.ApplicationContext.User.Identity, ProfilesIdentity)
        Dim db As ServiceContracts.ISpeciesDataService = DataFactory.GetSpeciesDataService()
        Dim changeset As New DataContracts.SpeciesAnswerDataChangeSet()

        changeset.SpeciesId = mSpeciesId
        changeset.LastUpdated = mLastUpdated

        For Each section As SpeciesSection In Me
            section.GetUpdate(changeset)
        Next

        Dim result As DataContracts.SpeciesAnswerDataChangeResult = db.UpdateSpeciesAnswerData(changeset)
        mLastUpdated = result.LastUpdated

        For Each section As SpeciesSection In Me
            section.Update()
        Next

    End Sub

#End Region

End Class
