Imports Csla

<Serializable()> _
Public Class SectionMetadataListWrapper
    Inherits ReadOnlyListBase(Of SectionMetadataListWrapper, SectionMetadataWrapper)

    Private mSectionMetadataListBase As SectionMetadataListBase
    Private mSectionMetadataDictionary As Dictionary(Of Guid, SectionMetadataWrapper)

#Region " Factory Methods "

    Public Function GetById(ByVal id As Guid) As SectionMetadataWrapper

        If mSectionMetadataDictionary.ContainsKey(id) Then
            Return mSectionMetadataDictionary(id)
        Else
            Return Nothing
        End If

    End Function

    Public Shared Function CanGetSectionMetadataList() As Boolean
        Return True
    End Function

    Private Shared Function GetSectionMetadataListWrapper(ByVal sectionMetadataList As SectionMetadataListBase) As SectionMetadataListWrapper

        Return New SectionMetadataListWrapper(sectionMetadataList)

    End Function

    Public Shared Function GetProfileSectionMetadataListWrapper() As SectionMetadataListWrapper

        If Not CanGetSectionMetadataList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Section Metadata List Wrapper")
        End If

        Dim currentProfileSectionMetadataList As ProfileSectionMetadataList = ProfileSectionMetadataList.GetProfileSectionMetadataList()

        Return GetSectionMetadataListWrapper(currentProfileSectionMetadataList)

    End Function

    Public Shared Function GetSpeciesSectionMetadataListWrapper() As SectionMetadataListWrapper

        If Not CanGetSectionMetadataList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Section Metadata List Wrapper")
        End If

        Dim currentSpeciesSectionMetadataList As SpeciesSectionMetadataList = SpeciesSectionMetadataList.GetSpeciesSectionMetadataList()

        Return GetSectionMetadataListWrapper(currentSpeciesSectionMetadataList)

    End Function

    Private Sub New(ByVal sectionMetadataList As SectionMetadataListBase)

        IsReadOnly = False
        RaiseListChangedEvents = False

        mSectionMetadataDictionary = New Dictionary(Of Guid, SectionMetadataWrapper)

        mSectionMetadataListBase = sectionMetadataList
        For Each sectionMetadata As SectionMetadataBase In mSectionMetadataListBase

            Dim currentSectionMetadataWrapper As SectionMetadataWrapper
            currentSectionMetadataWrapper = SectionMetadataWrapper.GetSectionMetadataWrapper(sectionMetadata)

            mSectionMetadataDictionary.Add(currentSectionMetadataWrapper.Id, currentSectionMetadataWrapper)
            Me.Add(currentSectionMetadataWrapper)
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

    Private Sub New()
        ' requires use of factory methods
    End Sub

#End Region

End Class
