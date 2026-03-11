Imports Csla

<Serializable()> _
Public Class SectionInfoList
    Inherits ReadOnlyListBase(Of SectionInfoList, SectionInfo)

#Region " Factory Methods "

    Friend Shared Function NewSectionInfoList() As SectionInfoList

        Return New SectionInfoList

    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Friend Function AddSectionInfo(ByVal sectionInfo As SectionInfo) As SectionInfo

        RaiseListChangedEvents = False
        IsReadOnly = False
        Add(SectionInfo)
        IsReadOnly = True
        RaiseListChangedEvents = True

        Return sectionInfo

    End Function

#End Region

End Class


