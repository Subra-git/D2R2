Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesSectionMetadataList
    Inherits SectionMetadataListBase

    Private Shared mSpeciesSectionMetadataList As SpeciesSectionMetadataList

#Region " Factory Methods "

    Public Shared Function CanGetSpeciesSectionMetadataList() As Boolean
        Return True
    End Function

    Public Shared Function GetSpeciesSectionMetadataList() As SpeciesSectionMetadataList

        If Not CanGetSpeciesSectionMetadataList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Species Section Metadata")
        End If

        If mSpeciesSectionMetadataList Is Nothing Then
            mSpeciesSectionMetadataList = DataPortal.Fetch(Of SpeciesSectionMetadataList)(Nothing)
        End If

        Return mSpeciesSectionMetadataList

    End Function

#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim dtoSpeciesSectionList As List(Of DataContracts.SpeciesSectionMetadata) = DataFactory.GetSpeciesMetadata()

        For Each dtoSpeciesSection As DataContracts.SpeciesSectionMetadata In dtoSpeciesSectionList

            Dim currentSpeciesSection As SectionMetadataBase
            currentSpeciesSection = SpeciesSectionMetadata.GetSpeciesSectionMetadata(dtoSpeciesSection)
            Me.Add(currentSpeciesSection)
            mSectionList.Add(currentSpeciesSection.Id, currentSpeciesSection)

        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
