Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class ProfileFieldMetadataList
    Inherits FieldMetadataListBase

    Dim mProfileFieldList As New Dictionary(Of Guid, ProfileFieldMetadata)

#Region " Business Methods "

    Public Function GetProfileFieldMetadataById(ByVal questionId As Guid) As ProfileFieldMetadata
        If mProfileFieldList.ContainsKey(questionId) Then
            Return mProfileFieldList(questionId)
        Else
            Return Nothing
        End If
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetList() As Boolean

        Return True
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetProfileFieldMetadataList(ByVal dtoFieldMetadataList As List(Of DataContracts.FieldMetadata)) As ProfileFieldMetadataList

        If Not CanGetList() Then
            Throw New System.Security.SecurityException("You do not have permission to get a list of profile field metadata")
        End If

        Return New ProfileFieldMetadataList(dtoFieldMetadataList)
    End Function

    Private Sub New()
        'requires use of factory methods
    End Sub

    Private Sub New(ByVal dtoFieldMetadataList As List(Of DataContracts.FieldMetadata))
        Fetch(dtoFieldMetadataList)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoFieldMetadataList As List(Of DataContracts.FieldMetadata))

        RaiseListChangedEvents = False
        IsReadOnly = False

        For Each dtoProfileFieldMetadata As DataContracts.ProfileFieldMetadata In dtoFieldMetadataList

            Dim currentFieldMetadata As ProfileFieldMetadata = ProfileFieldMetadata.GetProfileFieldMetadata(dtoProfileFieldMetadata)
            Me.Add(currentFieldMetadata)
            mProfileFieldList.Add(currentFieldMetadata.Id, currentFieldMetadata)

        Next

        RaiseListChangedEvents = True
        IsReadOnly = True

    End Sub

#End Region

End Class


