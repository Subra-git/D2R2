<%@ Control Language="VB" AutoEventWireup="false" CodeFile="NavigationLinks.ascx.vb"
    Inherits="NavigationLinks" %>
<ul>
    <li>
        <asp:HyperLink runat="server" ID="lnkExit">Veterinary surveillance home</asp:HyperLink></li>
    <asp:Literal runat="server" ID="litProfileHome"><li><a href="Home.aspx">D2R2 home</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litProfileSearch"><li><a href="Search.aspx">Search profiles</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litStaticReports"><li><a href="StaticReports.aspx">View reports</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litCreateProfile"><li><a href="ProfileProperties.aspx">Create new profile</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litCompareProfileVersions"><li><a href="CompareProfileVersions.aspx">Compare profile versions</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litDiseaseRanking"><li><a href="DiseaseRanking.aspx">Disease ranking</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litMaintainGlobalUsers"><li><a href="MaintainGlobalUsers.aspx">Maintain global users</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litMaintainExternalUsers"><li><a href="MaintainExternalUsers.aspx">Maintain external users</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litMaintainReferenceData"><li><a href="MaintainReferenceData.aspx">Maintain reference data</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litViewSpeciesData"><li><a href="ViewSpeciesData.aspx">View species data</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litMaintainSpeciesData"><li><a href="MaintainSpeciesData.aspx">Maintain species data</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litCrossCuttingIssueScores"><li><a href="MaintainCrossCuttingIssueScores.aspx">Maintain cross-cutting issue scores</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litPrioritisationVariables"><li><a href="MaintainPrioritisationVariables.aspx">Maintain prioritisation variables</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litUserGuidance"><li><a href="EditUserGuidance.aspx">Edit questions & guidance</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litReviewTiming"><li><a href="DiseaseReviews.aspx" >Review Timings</a></li></asp:Literal>
    <asp:Literal runat="server" ID="litUserManuals"><li><a href="StaticReports.aspx?UserManual=1" style="font-size:120%">Need help?</a></li></asp:Literal>
    <br />
</ul>
