<%@ Control Language="VB" AutoEventWireup="false" Inherits="Profiles.Web.LongTaskUI" Codebehind="LongTaskUI.ascx.vb" %>

        <asp:Timer ID="tmrLongTask" runat="server" Enabled="False" Interval="1000" OnTick="tmrLongTask_Tick"></asp:Timer>
        
        <asp:Panel ID="pnlProgress" runat="server" Height="150px" Width="250px" style="text-align:center;display:none;">
            <asp:Panel ID="pnlProgressHeader" runat="server" CssClass="collapsePanelHeader"><asp:Label ID="lblProgressMessage" runat="server" Text=""></asp:Label></asp:Panel>  
            <div class="collapsePanel" style="height:100px">
           <br /> 
                <asp:Image ID="imgProgress" runat="server" Height="55px" ImageUrl="Images/Progress2.gif" ToolTip="In progress..." Visible="True" Enabled="False" Width="54px" ImageAlign="Middle" />
            </div>
        </asp:Panel>
        
        <act:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="imgProgress" PopupControlID="pnlProgress" 
            BackgroundCssClass="modalBackground" 
            OkControlID="imgProgress"
            CancelControlID="imgProgress" 
             />
 