Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesSection
    Inherits SectionBase

    Private mSpeciesList As SpeciesSectionList

#Region " Authorisation rules "

    Protected Overrides Function CanGetSection() As Boolean
        Return SpeciesSectionList.CanGetSpeciesSectionList()
    End Function

    Protected Overrides Function CanEditSection() As Boolean
        Return SpeciesSectionList.CanEditSpeciesSectionList(mSpeciesList)
    End Function

#End Region

#Region " Factory Methods "

    ''' <summary>
    ''' Factory method to be called from within the business layer to obtain a SpeciesSection as a child object
    ''' </summary>
    ''' <param name="reader">Datareader containing recordset required to instantiate the SpeciesSection</param>
    ''' <returns>A SpeciesSection object</returns>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetSpeciesSection(ByVal dtoSpeciesSection As DataContracts.SpeciesSection, ByVal sectionMetadata As SectionMetadataWrapper, ByVal parentList As SpeciesSectionList) As SpeciesSection

        Return New SpeciesSection(dtoSpeciesSection, sectionMetadata, parentList)

    End Function

    ''' <summary>
    ''' Private constructor to prevent the Section from being created except via factory methods
    ''' </summary>
    Private Sub New()
        ' require use of factory methods
    End Sub

    ''' <summary>
    ''' Constructor called from factory methods to create a Section object
    ''' </summary>
    ''' <param name="reader">Datareader containing recordset required to instantiate the Section</param>
    Private Sub New(ByVal dtoSpeciesSection As DataContracts.SpeciesSection, ByVal sectionMetadata As SectionMetadataWrapper, ByVal parentList As SpeciesSectionList)
        Fetch(dtoSpeciesSection, sectionMetadata, parentList)
    End Sub

#End Region

#Region " Data Access "

    ''' <summary>
    ''' Method called from the constructor for child objects to initialize the Section object
    ''' </summary>
    ''' <param name="reader">Datareader containing recordset required to instantiate the Section</param>
    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Private Sub Fetch(ByVal dtoSpeciesSection As DataContracts.SpeciesSection, ByVal sectionMetadata As SectionMetadataWrapper, ByVal parentList As SpeciesSectionList)

        mSpeciesList = parentList

        mParentId = parentList.SpeciesId

        DoFetch(dtoSpeciesSection, sectionMetadata)

    End Sub

    Private Sub DoFetch(ByVal dtoSpeciesSection As DataContracts.SpeciesSection, ByVal sectionMetadata As SectionMetadataWrapper)
        MarkAsChild()

        mSectionId = dtoSpeciesSection.SectionId
        mSectionName = sectionMetadata.Name
        mSectionShortName = sectionMetadata.ShortName
        mSectionNumber = sectionMetadata.SectionNumber

        MarkOld()
    End Sub

    Friend Sub GetUpdate(ByVal changeset As DataContracts.AnswerDataChangeSet)

        Me.Questions.GetUpdate(changeset)

    End Sub

#End Region

End Class
