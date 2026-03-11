Imports Csla

<Serializable()> _
Public MustInherit Class SectionListBase
    Inherits BusinessListBase(Of SectionListBase, SectionBase)

    Protected mSectionDictionary As New Dictionary(Of Guid, SectionBase)

    Public Function GetById(ByVal sectionId As Guid) As SectionBase

        If mSectionDictionary.ContainsKey(sectionId) Then
            Return mSectionDictionary(sectionId)
        End If

        Return Nothing

    End Function

    Public Overridable Function Validate() As List(Of InvalidReason)

        Dim invalidReasonList As New List(Of InvalidReason)

        For Each section As SectionBase In mSectionDictionary.Values
            invalidReasonList.AddRange(section.Validate())
        Next

        Return invalidReasonList
    End Function

End Class
