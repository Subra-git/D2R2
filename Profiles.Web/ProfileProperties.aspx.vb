Imports ProfilesLibrary
Imports Profiles.WebControls

Partial Class ProfileProperties
    Inherits System.Web.UI.Page

    Private mEditProfile As Profile

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.Web.UI.WebControls.IButtonControl.set_Text(System.String)")>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Note this page is used for both Create New Profile and Profile Properties pages, depending on querystring value.

        TinyMCEHelper.RegisterSingleLineTinyMCE($"{txtTitle.ClientID}", Me)

        If Not Page.IsPostBack Then
            'Dim profilesMaster As ProfilesTemplate = Brute.Cast(Of ProfilesTemplate)(Page.Master)
            Dim profilesMaster = CType(Page.Master, ProfilesTemplate)

            If Request.QueryString("ProfileId") = String.Empty Then
                btnUpdate.Text = "Create profile"
                ctlAffectedSpeciesSelector.WarningEnabled = False

                If ProfilesLibrary.IsValidGuid(Request.QueryString("CloneProfileVersionId")) Then
                    Dim clonedProfileVersionId As New Guid(Request.QueryString("CloneProfileVersionId"))
                    Dim isScenario As Boolean = (Request.QueryString("Scenario") = "1")


                    If isScenario Then
                        mEditProfile = ProfilesLibrary.Profile.NewScenario(clonedProfileVersionId)
                        profilesMaster.UpdateTitle("Clone new ""what-if"" scenario for " & mEditProfile.Title.ToString())
                        lblClone.Text = "The new scenario will be cloned from: " & mEditProfile.ClonedVersion.ToString()
                        lblTitle.Text = "Scenario title:"
                    Else
                        mEditProfile = ProfilesLibrary.Profile.NewProfile(clonedProfileVersionId)
                        profilesMaster.UpdateTitle("Clone new profile")
                        lblClone.Text = "The new profile will be cloned from: " & mEditProfile.ClonedVersion.ToString()

                    End If
                    pnlClone.Visible = True

                Else
                    profilesMaster.UpdateTitle("Create new profile")
                    mEditProfile = ProfilesLibrary.Profile.NewProfile()

                End If

            Else
                If Not ProfilesLibrary.IsValidGuid(Request.QueryString("ProfileId")) Then
                    Throw New InvalidOperationException("There was an invalid or missing profile id passed to the page.")
                End If
                Dim profileId As Guid = New Guid(Request.QueryString("ProfileId"))
                mEditProfile = ProfilesLibrary.Profile.GetProfile(profileId)
                If Not mEditProfile.IsWhatIfScenario AndAlso mEditProfile.CurrentDraftVersion Is Nothing Then
                    Throw New InvalidOperationException("There are no editable properties for this profile.")
                End If

                If mEditProfile.IsWhatIfScenario Then
                    lblTitle.Text = "Scenario title:"
                Else
                    lblTitle.Enabled = False
                End If
                If mEditProfile.CurrentDraftVersion Is Nothing Then
                    ctlAffectedSpeciesSelector.Visible = False
                End If

                profilesMaster.UpdateTitle("Profile properties for " & mEditProfile.ToString())
                pnlInfo.Visible = False
                btnUpdate.Text = "Update"
                DisplayTopRightLinks()
            End If

            Session("EditProfile") = mEditProfile

            SetAffectedSpeciesInSpeciesSelector()

            If mEditProfile.IsWhatIfScenario Then
                txtTitle.Value = mEditProfile.ScenarioTitle
            Else
                txtTitle.Value = mEditProfile.Title
            End If

        Else
            mEditProfile = DirectCast(Session("EditProfile"), Profile)
        End If

    End Sub

    Private Sub DisplayTopRightLinks()

        lnkManageProfile.Visible = True
        lnkManageProfile.NavigateUrl = "ManageProfile.aspx?ProfileId=" & mEditProfile.Id.ToString()

    End Sub

    <System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId:="System.Web.UI.ITextControl.set_Text(System.String)")>
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        lblError.Text = String.Empty

        If mEditProfile.IsWhatIfScenario Then
            mEditProfile.ScenarioTitle = txtTitle.Value.Trim()
        Else
            mEditProfile.Title = txtTitle.Value.Trim()
        End If

        If mEditProfile.CurrentDraftVersion IsNot Nothing Then
            UpdateAffectedSpecies()
        End If

        Try
            mEditProfile.Save()

            If (btnUpdate.Text = "Create") Then
                Response.Redirect("EditProfileQuestions.aspx?ProfileVersionId=" & mEditProfile.CurrentDraftVersion.Id.ToString())
            Else
                'Clear and redraw the tree to take account of any updates
                SetAffectedSpeciesInSpeciesSelector()
                'Dim profilesMaster As ProfilesTemplate = Brute.Cast(Of ProfilesTemplate)(Page.Master)
                Dim profilesMaster = CType(Page.Master, ProfilesTemplate)
                profilesMaster.UpdateTitle("Profile properties for " & mEditProfile.ToString())
                lblError.Text = "Your changes were successfully saved"
                pnlInfo.Visible = False
            End If

        Catch ex As Csla.DataPortalException
            If (btnUpdate.Text = "Create") Then
                lblError.Text = "Profile creation failed: " + ex.BusinessException.Message
            Else
                lblError.Text = "Profile update failed: " + ex.BusinessException.Message
                mEditProfile = ProfilesLibrary.Profile.GetProfile(mEditProfile.Id)
                Session("EditProfile") = mEditProfile
                If mEditProfile.IsWhatIfScenario Then
                    txtTitle.Value = mEditProfile.ScenarioTitle
                Else
                    txtTitle.Value = mEditProfile.Title
                End If
                SetAffectedSpeciesInSpeciesSelector()
                'Dim profilesMaster As ProfilesTemplate = Brute.Cast(Of ProfilesTemplate)(Page.Master)
                Dim profilesMaster = CType(Page.Master, ProfilesTemplate)
                profilesMaster.UpdateTitle("Profile properties for " & mEditProfile.ToString())
                pnlInfo.Visible = False
            End If
        End Try

    End Sub

    Private Sub UpdateAffectedSpecies()

        RemoveAffectedSpecies(ctlAffectedSpeciesSelector.GetProfiledSpecies(), AffectedSpeciesType.Profiled)
        RemoveAffectedSpecies(ctlAffectedSpeciesSelector.GetOtherAffectedSpecies(), AffectedSpeciesType.Other)
        AddAffectedSpecies(ctlAffectedSpeciesSelector.GetProfiledSpecies(), AffectedSpeciesType.Profiled)
        AddAffectedSpecies(ctlAffectedSpeciesSelector.GetOtherAffectedSpecies(), AffectedSpeciesType.Other)

    End Sub

    Private Sub RemoveAffectedSpecies(ByVal affectedSpecies As List(Of Guid), ByVal speciesType As AffectedSpeciesType)

        Dim profileList As List(Of Guid) = mEditProfile.AffectedSpecies(speciesType)
        For Each existingSpeciesId As Guid In profileList
            If Not affectedSpecies.Contains(existingSpeciesId) Then
                mEditProfile.RemoveAffectedSpecies(existingSpeciesId)
            End If
        Next

    End Sub

    Private Sub AddAffectedSpecies(ByVal affectedSpecies As List(Of Guid), ByVal speciesType As AffectedSpeciesType)

        Dim profileList As List(Of Guid) = mEditProfile.AffectedSpecies(speciesType)
        For Each newSpeciesId As Guid In affectedSpecies
            If Not profileList.Contains(newSpeciesId) Then
                mEditProfile.AddAffectedSpecies(newSpeciesId, speciesType)
            End If
        Next

    End Sub

    Private Sub SetAffectedSpeciesInSpeciesSelector()

        If mEditProfile.CurrentDraftVersion IsNot Nothing Then
            ctlAffectedSpeciesSelector.SetAffectedSpecies(mEditProfile.AffectedSpecies(AffectedSpeciesType.Profiled), mEditProfile.AffectedSpecies(AffectedSpeciesType.Other))
        End If

    End Sub

    Private Sub ProfileProperties_Init(sender As Object, e As EventArgs) Handles Me.Init

        Dim isScenario As Boolean = (Request.QueryString("Scenario") = "1")
        Dim profileVerId As String = Request.QueryString("CloneProfileVersionId")

        If String.IsNullOrEmpty(profileVerId) Then
            Return
        End If

        Dim master = CType(Page.Master, ProfilesTemplate)
        Dim labelCurrent As String

        If isScenario Then
            labelCurrent = "Clone scenario"
        Else
            labelCurrent = "Clone profile"
        End If

        Breadcrumb.UpdateBreadcrumb(master, labelCurrent, 2, "~/Search.aspx", "Search Disease Profiles")

    End Sub

    Public Sub btnReset_Click(sender As Object, e As EventArgs)

        CommonTree.MakeAnnouncement(Me.Page)

        txtTitle.Value = String.Empty
        ctlAffectedSpeciesSelector.ClearSelections()

        Dim clearScript As String = "<script>document.getElementById('divProfileTitle').innerHTML = '';</script>"
        ScriptManager.RegisterStartupScript(MainUpdatePanel, Me.GetType(), "clearProfileTitle", clearScript, False)

        ScriptManager.RegisterStartupScript(MainUpdatePanel, Me.GetType(), "SetFocus", $"window.apha.profiles.setControlFocus('{btnReset.ClientID}');", true)


    End Sub

End Class
