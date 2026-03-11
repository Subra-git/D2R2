Imports ProfilesLibrary

Partial Class EditProfileTitle
    Inherits System.Web.UI.Page

    Private Property CurrentProfile() As Profile
        Get
            If Not Session("CurrentProfile") Is Nothing Then
                Return DirectCast(Session("CurrentProfile"), Profile)
            Else
                Return Nothing
            End If
        End Get
        Set(ByVal value As Profile)
            Session("CurrentProfile") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not ProfilesLibrary.Profile.CanEditProfile() Then
                Throw New System.Security.SecurityException("You do not have permission to edit a profile title.")
            End If

            If Not IsValidGuid(Request.QueryString("ProfileId")) Then
                Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
            End If

            Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
            LoadForm(profileId)

        End If

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim profileId As Guid = CurrentProfile.Id
        CurrentProfile.Title = txtProfileTitle.Text.Trim()

        CurrentProfile.ApplyEdit()
        Try
            CurrentProfile.Save()
            lblError.Text = "The profile title was successfully updated"
        Catch ex As Csla.DataPortalException
            lblError.Text = "Profile save failed: " + ex.BusinessException.Message
        End Try

        LoadForm(profileId)

    End Sub

    Private Sub LoadForm(ByVal profileId As Guid)

        CurrentProfile = ProfilesLibrary.Profile.GetProfile(profileId)
        If CurrentProfile.IsWhatIfScenario Then
            Throw New InvalidOperationException("You cannot edit the profile title of a ""what-if"" scenario.")
        End If

        txtProfileTitle.Text = CurrentProfile.Title

    End Sub

End Class
