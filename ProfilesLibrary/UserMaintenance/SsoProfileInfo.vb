Imports Csla
Imports Profiles.Contracts

<Serializable()> _
Public Class SsoProfileInfo

    Private mId As Guid
    Private mTitle As String

#Region " Business Methods "

    Public ReadOnly Property Id() As Guid
        Get
            Return mId
        End Get
    End Property

    Public ReadOnly Property Title() As String
        Get
            If mTitle.Count > 80 Then
                Return mTitle.Substring(0, 80) & "..."
            Else
                Return mTitle
            End If
        End Get
    End Property

    Public ReadOnly Property TitlePlainText() As String
        Get
            Dim plainTextTitle As String = mTitle.StripHtmlTags()
            plainTextTitle = plainTextTitle.Replace("&nbsp;", "")
            If plainTextTitle.Count > 80 Then
                Return plainTextTitle.Substring(0, 80) & "..."
            Else
                Return plainTextTitle
            End If
        End Get
    End Property

#End Region

#Region " Factory Methods "

    Friend Shared Function GetSsoProfileInfo(ByVal dtoSsoProfile As DataContracts.SsoProfile) As SsoProfileInfo
        Return New SsoProfileInfo(dtoSsoProfile)
    End Function

    Private Sub New()
        'requires use of factory
    End Sub

    Private Sub New(ByVal dtoSsoProfile As DataContracts.SsoProfile)
        Fetch(dtoSsoProfile)        
    End Sub

#End Region

#Region " Data Access "

    Private Sub Fetch(ByVal dtoSsoProfile As DataContracts.SsoProfile)

        mId = dtoSsoProfile.Id
        mTitle = dtoSsoProfile.Title

    End Sub

#End Region


End Class
