<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ProfileSectionLinks.ascx.vb" Inherits="ProfileSectionLinks" %>
    <ul>
        <li>
            <asp:LinkButton runat="Server" ID="lnkHome" CommandName="GoSection" CommandArgument='Home'>D2R2 home</asp:LinkButton>&nbsp;
        </li>
        <li>
            <asp:LinkButton runat="server" ID="lnkSearch" CommandName="GoSection" CommandArgument='Search'>Profiles search</asp:LinkButton>&nbsp;
        </li>
        <asp:Literal ID="litPrint" runat="server" />
        <asp:Literal ID="litSummaryProfileReport" runat ="server" />
        <asp:Literal ID="litSummaryPrioritisationReport" runat="server" />
        <asp:Literal ID="litProfileReports" runat="server" />
        <asp:Literal ID="litReferences" runat="server" />
        <asp:Repeater ID="rptSectionLinks" runat="server" DataSourceID="dsProfileSectionInfoList">
            <ItemTemplate>
                <li>
                    <img id='imgSection<%#Eval("SectionNumber")%>' src='Images/ValidLoading.gif' alt='' />
                    <asp:LinkButton runat="Server" ID="lnkProfileSection" CommandName="GoSection" CommandArgument='<%#Eval("Id")%>'><%#Eval("SectionNumber")%>&nbsp;<%#Eval("FormattedShortName")%></asp:LinkButton>
                </li> 
            </ItemTemplate> 
        </asp:Repeater>
      
    </ul>
    <br />
   <csla:CslaDataSource ID="dsProfileSectionInfoList" runat="server" TypeAssemblyName="ProfilesLibrary" TypeName="ProfilesLibrary.ProfileSectionMetadataList">
   </csla:CslaDataSource> 
    <asp:ScriptManagerProxy ID="scpProxy" runat="server">
    <Services>
        <asp:ServiceReference
           path="~/WebServices/ProfileValidationService.asmx" />
      </Services>
    </asp:ScriptManagerProxy>
    <script type="text/javascript" language="javascript">
        
        var id = '<% = EditProfileVersionInfo.Id.ToString() %>';
        
        Profiles.WebServices.ProfileValidationService.ValidateProfileVersion(id, OnValidateProfileSuceeded, OnValidateProfileFailed);
        
        function OnValidateProfileSuceeded(result, eventArgs)
        {
            for (var currentSection = 0; currentSection < result.length; currentSection++)
            {
                var img = document.getElementById('imgSection' + (currentSection + 1).toString());
                
                if (result.substring(currentSection, currentSection + 1) == "1")
                {
                    img.src = 'Images/Valid.gif';
                    img.alt = 'This section has no validation errors';
                }
                else
                {
                    img.src = 'Images/Invalid.gif';
                    img.alt = 'This section has validation errors';
                }
            }
        }

        function OnValidateProfileFailed(error)
        {
            var currentSection = 0;
            var img = document.getElementById('imgSection' + (currentSection + 1).toString());
            while (img != undefined)
            {
                img.src = 'Images/Invalid.gif';
                img.alt = 'There was an error when trying to calculate the valid status of the profile version: ' + error._message;
                currentSection++;
                img = document.getElementById('imgSection' + (currentSection + 1).toString());
            }
        }
    </script>