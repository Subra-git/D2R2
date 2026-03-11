Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SpeciesQuestionMetadataList
    Inherits QuestionMetadataListBase

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean
        Return True
    End Function

#End Region

#Region " Factory Method "

    Public Shared Function GetSpeciesQuestionMetadataList(ByVal dtoQuestionMetadataList As List(Of DataContracts.QuestionMetadata)) As SpeciesQuestionMetadataList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to get a list of species question metadata")
        End If

        Return New SpeciesQuestionMetadataList(dtoQuestionMetadataList)
    End Function

    Private Sub New()
        ' requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoQuestionMetadataList As List(Of DataContracts.QuestionMetadata))
        Fetch(dtoQuestionMetadataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoQuestionMetadataList As List(Of DataContracts.QuestionMetadata))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoSpeciesQuestionMetadata As DataContracts.SpeciesQuestionMetadata In dtoQuestionMetadataList
            Dim currentSpeciesQuestionMetadata As SpeciesQuestionMetadata = SpeciesQuestionMetadata.GetSpeciesQuestionMetadata(dtoSpeciesQuestionMetadata)
            mQuestionInfoList.Add(currentSpeciesQuestionMetadata.Id, currentSpeciesQuestionMetadata)
            Me.Add(currentSpeciesQuestionMetadata)
        Next

        RaiseListChangedEvents = True
        IsReadOnly = True

    End Sub


#End Region

End Class


