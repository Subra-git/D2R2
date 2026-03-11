Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class NoteTypeInfo
    Inherits ReadOnlyBase(Of NoteTypeInfo)

#Region " Business Methods "

    Private mId As Guid
    Private mName As String
    Private mPluralName As String

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property
    Public ReadOnly Property Name() As String
        Get
            Return mName
        End Get
    End Property
    Public ReadOnly Property PluralName() As String
        Get
            Return mPluralName
        End Get
    End Property
    
    Protected Overrides Function GetIdValue() As Object
        Return mId.ToString
    End Function

#End Region

#Region " Factory Methods "

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")> _
    Friend Shared Function GetNoteTypeInfo(ByVal noteType As DataContracts.ProfileNoteType) As NoteTypeInfo

        Return New NoteTypeInfo(noteType)

    End Function

    ''' <summary>
    ''' Private constructor to disallow direct creation of this object
    ''' </summary>
    Private Sub New()
        ' require use of factory methods
    End Sub

    Private Sub New(ByVal noteType As DataContracts.ProfileNoteType)
        Fetch(noteType)
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal noteType As DataContracts.ProfileNoteType)
        mId = noteType.Id
        mName = noteType.Name
        mPluralName = noteType.PluralName
    End Sub

#End Region

End Class

