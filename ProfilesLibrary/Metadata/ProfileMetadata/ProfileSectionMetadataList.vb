Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileSectionMetadataList
    Inherits SectionMetadataListBase

    Private Shared mProfileSectionMetadataList As ProfileSectionMetadataList

#Region " Factory Methods "

    Public Shared Function CanGetProfileSectionMetadataList() As Boolean
        Return True
    End Function

    Public Shared Function GetProfileSectionMetadataList() As ProfileSectionMetadataList

        If Not CanGetProfileSectionMetadataList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the Profile Section Metadata")
        End If

        If mProfileSectionMetadataList Is Nothing Then
            mProfileSectionMetadataList = DataPortal.Fetch(Of ProfileSectionMetadataList)(Nothing)
        End If

        Return mProfileSectionMetadataList

    End Function
#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim profileSectionList As List(Of DataContracts.ProfileSectionMetadata) = DataFactory.GetProfileMetadata()

        For Each dtoProfileSection As DataContracts.ProfileSectionMetadata In profileSectionList

            Dim currentProfileSection As SectionMetadataBase
            currentProfileSection = ProfileSectionMetadata.GetProfileSectionMetadata(dtoProfileSection)
            Me.Add(currentProfileSection)
            mSectionList.Add(currentProfileSection.Id, currentProfileSection)

        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class
