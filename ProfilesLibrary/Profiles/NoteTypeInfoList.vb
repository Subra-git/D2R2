Imports Csla
Imports Profiles.Contracts

Public Enum NoteType
    ScientificPaperReference
    LegislativeReference
    SourceOfFurtherInformation
End Enum

<System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Naming", "CA1710:IdentifiersShouldHaveCorrectSuffix")> _
<Serializable()> _
Public Class NoteTypeInfoList
    Inherits ReadOnlyListBase(Of NoteTypeInfoList, NoteTypeInfo)

#Region " Business Methods "

    Private Shared mNoteTypeInfoList As NoteTypeInfoList = Nothing

    Public Function GetById(ByVal noteId As Guid) As NoteTypeInfo

        For Each typeInfo As NoteTypeInfo In Me
            If typeInfo.Id = noteId Then
                Return typeInfo
            End If
        Next

        Return Nothing

    End Function

    Public Shared Function GetNoteTypeInfoByNoteType(ByVal type As NoteType) As NoteTypeInfo

        For Each typeInfo As NoteTypeInfo In GetNoteTypeInfoList()
            If typeInfo.Name.Replace(" ", "").ToLower = type.ToString().ToLower Then
                Return typeInfo
            End If
        Next

        Return Nothing
    End Function

#End Region

#Region " Authorization Rules "

    Public Shared Function CanGetNoteTypeInfoList() As Boolean

        Return True 'all users can get a list of note types, even if anonymous
    End Function

#End Region

#Region " Factory Methods "

    Public Shared Function GetNoteTypeInfoList() As NoteTypeInfoList

        If Not CanGetNoteTypeInfoList() Then
            Throw New System.Security.SecurityException("You do not have permission to get the note type info list.")
        End If

        If mNoteTypeInfoList Is Nothing Then
            mNoteTypeInfoList = DataPortal.Fetch(Of NoteTypeInfoList)(Nothing)
        End If

        Return mNoteTypeInfoList

    End Function

#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch(ByVal criteria As Object)

        RaiseListChangedEvents = False
        IsReadOnly = False

        Dim db As ServiceContracts.IProfileNoteService = DataFactory.GetProfileNoteService()
        Dim noteTypes As List(Of DataContracts.ProfileNoteType) = db.GetNoteTypes()

        For Each noteType As DataContracts.ProfileNoteType In noteTypes
            Add(NoteTypeInfo.GetNoteTypeInfo(noteType))
        Next

        IsReadOnly = True
        RaiseListChangedEvents = True

    End Sub

#End Region

End Class

