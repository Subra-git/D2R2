<%@ Control Language="VB" AutoEventWireup="false" Inherits="Profiles.Web.ProfileSectionLinks" CodeBehind="ProfileSectionLinks.ascx.vb" %>

<div class="profile-section-links">
    <nav class="app-subnav">
        <ul class="app-subnav__section">
            <asp:Literal ID="litPrint" runat="server" />
            <asp:Literal ID="litSummaryProfileReport" runat="server" />
            <asp:Literal ID="litSummaryPrioritisationReport" runat="server" />
            <asp:Literal ID="litProfileReports" runat="server" />
            <asp:Literal ID="litReferences" runat="server" />

            <asp:Repeater ID="rptSectionLinks" runat="server" DataSourceID="dsProfileSectionInfoList">
                <ItemTemplate>
                    <li id="liWrapper" runat="server">   
                        <table>
                            <tr>
                                <td><img class="gds-menu-image" id='imgSection<%#Eval("SectionNumber")%>' src='Images/ValidLoading.gif' height="25" width="40" alt='' /></td>
                                <td class="px-2"><asp:LinkButton runat="Server" ID="lnkProfileSection" CssClass="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" CommandName="GoSection" CommandArgument='<%#Eval("Id")%>'><%#Eval("SectionNumber")%>.&nbsp;<%#Eval("FormattedShortName")%></asp:LinkButton></td>

                            </tr>
                        </table>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

        </ul>
    </nav>
</div>

<csla:CslaDataSource ID="dsProfileSectionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileSectionMetadataList">
</csla:CslaDataSource>
<asp:ScriptManagerProxy ID="scpProxy" runat="server">
    <Services>
        <asp:ServiceReference Path="~/WebServices/ProfileValidationService.asmx" />
    </Services>
</asp:ScriptManagerProxy>
<script type="text/javascript" language="javascript">

    var id = '<% = EditProfileVersionInfo.Id.ToString() %>';

    Profiles.Web.ProfileValidationService.ValidateProfileVersion(id, OnValidateProfileSuceeded, OnValidateProfileFailed);

    function OnValidateProfileSuceeded(result, eventArgs) {
        for (var currentSection = 0; currentSection < result.length; currentSection++) {
            var img = document.getElementById('imgSection' + (currentSection + 1).toString());

            if (result.substring(currentSection, currentSection + 1) == "1") {
                img.src = 'Images/green-check.png';
                img.alt = 'This section has no validation errors';
                img.title = img.alt;
            }
            else {
                img.src = 'Images/red-cross.png';
                img.alt = 'This section has validation errors';
                img.title = img.alt;
            }
        }
    }

    function OnValidateProfileFailed(error) {
        var currentSection = 0;
        var img = document.getElementById('imgSection' + (currentSection + 1).toString());
        while (img != undefined) {
            img.src = 'Images/red-cross.png';
            img.alt = 'There was an error when trying to calculate the valid status of the profile version: ' + error._message;
            currentSection++;
            img = document.getElementById('imgSection' + (currentSection + 1).toString());
        }
    }
</script>
