<%@ Page Language="VB" AutoEventWireup="false" Inherits="Profiles.Web.ProfileQuestionHelp" Codebehind="ProfileQuestionHelp.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>User Guidance</title>
    <link rel="Stylesheet" type="text/css" href="Css/CorpGreen.css" />
    <link rel="Stylesheet" type="text/css" href="Css/Layout.css" />
    <link rel="Stylesheet" type="text/css" href="Css/Profiles.css" />
    <link rel="stylesheet" type="text/css" href="Css/IntraHP.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <div style="FONT-SIZE: 90%;BORDER:0;" id="title"><asp:Label ID="lblQuestionName" runat="server"></asp:Label></div>
            <div style="FONT-SIZE: 90%;PADDING-LEFT: 12px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; "><asp:Label ID="lblHelpText" runat="server" ></asp:Label></div>
            
    </div>
    </form>
</body>
</html>
