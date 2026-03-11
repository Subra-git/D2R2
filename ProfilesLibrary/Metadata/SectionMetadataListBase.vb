Imports Csla


<Serializable()> _
Public MustInherit Class SectionMetadataListBase
    Inherits ReadOnlyListBase(Of SectionMetadataListBase, SectionMetadataBase)

    Protected mSectionList As New Dictionary(Of Guid, SectionMetadataBase)

    Public Function GetById(ByVal sectionId As Guid) As SectionMetadataBase

        If mSectionList.ContainsKey(sectionId) Then
            Return mSectionList(sectionId)
        End If

        Return Nothing

    End Function

End Class


