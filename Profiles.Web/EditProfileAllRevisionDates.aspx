<%@ Page Language="VB" MasterPageFile="~/NestedProfileQuestions.master" AutoEventWireup="false" Inherits="Profiles.Web.EditProfileAllRevisionDates"
    Title="View/edit profile" Codebehind="EditProfileAllRevisionDates.aspx.vb" %>

<%@ Register Src="ProfileSectionLinks.ascx" TagName="SectionLinks" TagPrefix="sec" %>
<%@ Register TagPrefix="pwc" Namespace="Profiles.WebControls.ProfilesWeb.Controls" Assembly="Profiles.WebControls" %>
<%@ Register Src="~/SectionPagination.ascx" TagPrefix="pag" TagName="SectionPagination" %>
<%@ Register Src="SavePrompt.ascx" TagName="SavePrompt" TagPrefix="uc" %>

<asp:Content ID="NestedProfileContent" ContentPlaceHolderID="NestedProfileContent" runat="Server">
     <uc:SavePrompt ID="savePrompt" runat="server" />
	<script type="text/javascript">
        // Set the given dropdowns to the given index.
        function syncDropdownValues(dropdownArray, index) {
            for (var i = 0; i < dropdownArray.length; i++) {
                document.getElementById(dropdownArray[i]).selectedIndex = index;
            }
        }

        // Set the given text fields to the given text value.
        function syncTextFieldValues(textFieldArray, textValue) {
            for (var i = 0; i < textFieldArray.length; i++) {
                document.getElementById(textFieldArray[i]).value = textValue;
            }
        }

        // Set all Author Review statuses.
        function onAuthorReviewStatusAllChanged() {
            syncDropdownValues(["<%= ddlAuthorReviewStatusAnimalWelfare.ClientID %>",
								"<%= ddlAuthorReviewStatusApproachControl.ClientID %>",
								"<%= ddlAuthorReviewStatusAreasOfUncertainty.ClientID %>",
								"<%= ddlAuthorReviewStatusCharacteristicsAgent.ClientID %>",
								"<%= ddlAuthorReviewStatusEpidemiology.ClientID %>",
								"<%= ddlAuthorReviewStatusGeographicDistributionLevelsDisease.ClientID %>",
								"<%= ddlAuthorReviewStatusHumanHealth.ClientID %>",
								"<%= ddlAuthorReviewStatusInternationalTrade.ClientID %>",
								"<%= ddlAuthorReviewStatusLaboratories.ClientID %>",
								"<%= ddlAuthorReviewStatusLegislationMandates.ClientID %>",
								"<%= ddlAuthorReviewStatusOpportunity.ClientID %>",
								"<%= ddlAuthorReviewStatusPublicAndStakeholderPerception.ClientID %>",
								"<%= ddlAuthorReviewStatusRiskAssessment.ClientID %>",
								"<%= ddlAuthorReviewStatusSummary.ClientID %>",
								"<%= ddlAuthorReviewStatusSurveillance.ClientID %>",
								"<%= ddlAuthorReviewStatusWiderSociety.ClientID %>"],
                document.getElementById("<%= ddlAuthorReviewStatusAll.ClientID%>").selectedIndex);
        }

        // Set all Next Author Review dates.
        function onNextAuthorReviewAllChanged() {
            syncTextFieldValues(["<%= txtNextAuthorReviewAnimalWelfare.ClientID %>",
								"<%= txtNextAuthorReviewApproachControl.ClientID %>",
								"<%= txtNextAuthorReviewAreasOfUncertainty.ClientID %>",
								"<%= txtNextAuthorReviewCharacteristicsAgent.ClientID %>",
								"<%= txtNextAuthorReviewEpidemiology.ClientID %>",
								"<%= txtNextAuthorReviewGeographicDistributionLevelsDisease.ClientID %>",
								"<%= txtNextAuthorReviewHumanHealth.ClientID %>",
								"<%= txtNextAuthorReviewInternationalTrade.ClientID %>",
								"<%= txtNextAuthorReviewLaboratories.ClientID %>",
								"<%= txtNextAuthorReviewLegislationMandates.ClientID %>",
								"<%= txtNextAuthorReviewOpportunity.ClientID %>",
								"<%= txtNextAuthorReviewPublicAndStakeholderPerception.ClientID %>",
								"<%= txtNextAuthorReviewRiskAssessment.ClientID %>",
								"<%= txtNextAuthorReviewSummary.ClientID %>",
								"<%= txtNextAuthorReviewSurveillance.ClientID %>",
								"<%= txtNextAuthorReviewWiderSociety.ClientID %>"],
                document.getElementById("<%= txtNextAuthorReviewAll.ClientID%>").value);
        }

        // Set all VA Review statuses.
        function onVAReviewStatusAllChanged() {
            syncDropdownValues(["<%= ddlVAReviewStatusAnimalWelfare.ClientID %>",
								"<%= ddlVAReviewStatusApproachControl.ClientID %>",
								"<%= ddlVAReviewStatusAreasOfUncertainty.ClientID %>",
								"<%= ddlVAReviewStatusCharacteristicsAgent.ClientID %>",
								"<%= ddlVAReviewStatusEpidemiology.ClientID %>",
								"<%= ddlVAReviewStatusGeographicDistributionLevelsDisease.ClientID %>",
								"<%= ddlVAReviewStatusHumanHealth.ClientID %>",
								"<%= ddlVAReviewStatusInternationalTrade.ClientID %>",
								"<%= ddlVAReviewStatusLaboratories.ClientID %>",
								"<%= ddlVAReviewStatusLegislationMandates.ClientID %>",
								"<%= ddlVAReviewStatusOpportunity.ClientID %>",
								"<%= ddlVAReviewStatusPublicAndStakeholderPerception.ClientID %>",
								"<%= ddlVAReviewStatusRiskAssessment.ClientID %>",
								"<%= ddlVAReviewStatusSummary.ClientID %>",
								"<%= ddlVAReviewStatusSurveillance.ClientID %>",
								"<%= ddlVAReviewStatusWiderSociety.ClientID %>"],
                document.getElementById("<%= ddlVAReviewStatusAll.ClientID%>").selectedIndex);
		}

		// Set all VA Review dates.
		function onNextVAReviewAllChanged() {
            syncTextFieldValues(["<%= txtNextVAReviewAnimalWelfare.ClientID %>",
								"<%= txtNextVAReviewApproachControl.ClientID %>",
								"<%= txtNextVAReviewAreasOfUncertainty.ClientID %>",
								"<%= txtNextVAReviewCharacteristicsAgent.ClientID %>",
								"<%= txtNextVAReviewEpidemiology.ClientID %>",
								"<%= txtNextVAReviewGeographicDistributionLevelsDisease.ClientID %>",
								"<%= txtNextVAReviewHumanHealth.ClientID %>",
								"<%= txtNextVAReviewInternationalTrade.ClientID %>",
								"<%= txtNextVAReviewLaboratories.ClientID %>",
								"<%= txtNextVAReviewLegislationMandates.ClientID %>",
								"<%= txtNextVAReviewOpportunity.ClientID %>",
								"<%= txtNextVAReviewPublicAndStakeholderPerception.ClientID %>",
								"<%= txtNextVAReviewRiskAssessment.ClientID %>",
								"<%= txtNextVAReviewSummary.ClientID %>",
								"<%= txtNextVAReviewSurveillance.ClientID %>",
								"<%= txtNextVAReviewWiderSociety.ClientID %>"],
								document.getElementById("<%= txtNextVAReviewAll.ClientID%>").value);
		}

		// Set all Policy Review statuses.
		function onPolicyReviewStatusAllChanged() {
            syncDropdownValues(["<%= ddlPolicyReviewStatusAnimalWelfare.ClientID %>",
								"<%= ddlPolicyReviewStatusApproachControl.ClientID %>",
								"<%= ddlPolicyReviewStatusAreasOfUncertainty.ClientID %>",
								"<%= ddlPolicyReviewStatusCharacteristicsAgent.ClientID %>",
								"<%= ddlPolicyReviewStatusEpidemiology.ClientID %>",
								"<%= ddlPolicyReviewStatusGeographicDistributionLevelsDisease.ClientID %>",
								"<%= ddlPolicyReviewStatusHumanHealth.ClientID %>",
								"<%= ddlPolicyReviewStatusInternationalTrade.ClientID %>",
								"<%= ddlPolicyReviewStatusLaboratories.ClientID %>",
								"<%= ddlPolicyReviewStatusLegislationMandates.ClientID %>",
								"<%= ddlPolicyReviewStatusOpportunity.ClientID %>",
								"<%= ddlPolicyReviewStatusPublicAndStakeholderPerception.ClientID %>",
								"<%= ddlPolicyReviewStatusRiskAssessment.ClientID %>",
								"<%= ddlPolicyReviewStatusSummary.ClientID %>",
								"<%= ddlPolicyReviewStatusSurveillance.ClientID %>",
								"<%= ddlPolicyReviewStatusWiderSociety.ClientID %>"],
								document.getElementById("<%= ddlPolicyReviewStatusAll.ClientID%>").selectedIndex);
		}

		// Set all Policy Review dates.
		function onNextPolicyReviewAllChanged() {
            syncTextFieldValues(["<%= txtNextPolicyReviewAnimalWelfare.ClientID %>",
								"<%= txtNextPolicyReviewApproachControl.ClientID %>",
								"<%= txtNextPolicyReviewAreasOfUncertainty.ClientID %>",
								"<%= txtNextPolicyReviewCharacteristicsAgent.ClientID %>",
								"<%= txtNextPolicyReviewEpidemiology.ClientID %>",
								"<%= txtNextPolicyReviewGeographicDistributionLevelsDisease.ClientID %>",
								"<%= txtNextPolicyReviewHumanHealth.ClientID %>",
								"<%= txtNextPolicyReviewInternationalTrade.ClientID %>",
								"<%= txtNextPolicyReviewLaboratories.ClientID %>",
								"<%= txtNextPolicyReviewLegislationMandates.ClientID %>",
								"<%= txtNextPolicyReviewOpportunity.ClientID %>",
								"<%= txtNextPolicyReviewPublicAndStakeholderPerception.ClientID %>",
								"<%= txtNextPolicyReviewRiskAssessment.ClientID %>",
								"<%= txtNextPolicyReviewSummary.ClientID %>",
								"<%= txtNextPolicyReviewSurveillance.ClientID %>",
								"<%= txtNextPolicyReviewWiderSociety.ClientID %>"],
                document.getElementById("<%= txtNextPolicyReviewAll.ClientID%>").value);
        }
    </script>
    <table style="width: 100%">
        <tr>
            <td>
                <div align="right">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="govuk-button"/>&nbsp;</div>
            </td>
        </tr>
    </table>
    &nbsp;
    <pwc:TabStrip ID="tabStrip" runat="server">
        <pwc:TabItem IsActive="false" Text="SectionName" />
        <pwc:TabItem IsActive="false" Text="References" />
        <pwc:TabItem IsActive="false" Text="Further information" />
        <pwc:TabItem IsActive="false" Text="Review comments" />
        <pwc:TabItem IsActive="true" Text="All Revision dates" />
        <pwc:TabItem IsActive="false" Text="Contributions" />
    </pwc:TabStrip>
    <div class="TabBody">
        <!-- revision dates-->
        <asp:Panel ID="panRevDates" runat="server" Visible="true">
            <div class="collapsePanel">
                <asp:ValidationSummary ID="valSummaryRevisionDates" DisplayMode="BulletList" runat="server"
                    HeaderText="The following errors have occurred:" CssClass="ErrorLabel" />
                <asp:Label ID="lblErrorDesc" runat="server" CssClass="ErrorLabel" EnableViewState="false"></asp:Label>
                <table>
                    <tr>
                        <td colspan="2" style="text-align: left">
                            <pwc:InvalidReasonList ID="ctlInvalidReasonList" runat="server" />
                        </td>
                    </tr>
                </table>
				<div runat="server" id="SetAllSections">
					<h3 class="govuk-heading-s">Set For All Sections:</h3>				
					<table>
						<tr>
							<td>
								<asp:Label ID="lblAuthorReviewStatusAll" runat="server" Text="Author review status:"></asp:Label>
							</td>
							<td>
								<asp:DropDownList ID="ddlAuthorReviewStatusAll" runat="server" DataSourceID="dsRevisionStatus"
									DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true"
									OnChange="onAuthorReviewStatusAllChanged()">
									<asp:ListItem Text="Please select..." Value=""></asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<asp:Label ID="lblNextAuthorReviewAll" runat="server" Text="Next author review:"></asp:Label>
							</td>
							<td>
								<asp:TextBox ID="txtNextAuthorReviewAll" runat="server" OnChange="onNextAuthorReviewAllChanged()"></asp:TextBox>&nbsp;
								<asp:Image ID="ImgCalNextAuthorReviewAll" ImageUrl="~/Images/Calendar.gif" runat="server" />
								<act:CalendarExtender runat="server" ID="CalNextAuthorReviewAll" CssClass="ProfilesCalendar"
									TargetControlID="txtNextAuthorReviewAll" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
								</act:CalendarExtender>
							</td>
							<td>
								<pwc:DateValidator ID="allDateValidator1" ControlToValidate="txtNextAuthorReviewAll"
									runat="server" ErrorMessage="Next author review date must be a valid date"
									ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label ID="lblVAReviewStatusAll" runat="server" Text="VA review status:"></asp:Label>
							</td>
							<td>
								<asp:DropDownList ID="ddlVAReviewStatusAll" runat="server" DataSourceID="dsRevisionStatus"
									DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True"
									onchange="onVAReviewStatusAllChanged()">
									<asp:ListItem Text="Please select..." Value=""></asp:ListItem>
								</asp:DropDownList>                            
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<asp:Label ID="lblNextVAReviewAll" runat="server" Text="Next VA review:"></asp:Label>
							</td>
							<td>
								<asp:TextBox ID="txtNextVAReviewAll" runat="server" OnChange="onNextVAReviewAllChanged()"></asp:TextBox>&nbsp;
								<asp:Image ID="ImgCalNextVAReviewAll" ImageUrl="~/Images/Calendar.gif" runat="server" />
								<act:CalendarExtender runat="server" ID="CalNextVAReviewAll" CssClass="ProfilesCalendar"
									TargetControlID="txtNextVAReviewAll" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
								</act:CalendarExtender>
							</td>
							<td>
								<pwc:DateValidator ID="valNextVAReviewAll" ControlToValidate="txtNextVAReviewAll"
									runat="server" ErrorMessage="Next VA review date must be a valid date"
									ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<asp:Label ID="lblPolicyReviewStatusAll" runat="server" Text="Policy review status:"></asp:Label>
							</td>
							<td>
								<asp:DropDownList ID="ddlPolicyReviewStatusAll" runat="server" DataSourceID="dsRevisionStatus"
									DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True"
									onchange="onPolicyReviewStatusAllChanged()">
									<asp:ListItem Text="Please select..." Value=""></asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<asp:Label ID="lblNextPolicyReviewAll" runat="server" Text="Next policy review:"></asp:Label>
							</td>
							<td>
								<asp:TextBox ID="txtNextPolicyReviewAll" runat="server" OnChange="onNextPolicyReviewAllChanged()"></asp:TextBox>&nbsp;
								<asp:Image ID="ImgCalNextPolReviewAll" ImageUrl="~/Images/Calendar.gif" runat="server" />
								<act:CalendarExtender runat="server" ID="CalNextPolicyReviewAll" CssClass="ProfilesCalendar"
									TargetControlID="txtNextPolicyReviewAll" Format="d MMMM yyyy" PopupButtonID="allImgCalNextPolReview">
								</act:CalendarExtender>
							</td>
							<td>
								<pwc:DateValidator ID="valNextPolicyReviewAll" ControlToValidate="txtNextPolicyReviewAll"
									runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
									Display="Dynamic">*</pwc:DateValidator>                        
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<br />
					<hr />
				</div>
                <br />
                <h3 class="govuk-heading-s">1. Summary</h3>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblAuthorReviewFreqSummary" runat="server" Text="Author review frequency:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlAuthorReviewFreqSummary" runat="server" DataSourceID="dsRevisionDates"
                                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemAuthorReviewFreqSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblNextAuthorReviewSummary" runat="server" Text="Next author review:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemNextAuthorReviewSummary" runat="server" Width="130px" Style="display: block;
                                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
                            <asp:TextBox ID="txtNextAuthorReviewSummary" runat="server"></asp:TextBox>&nbsp;
                            <asp:Image ID="ImgCalNextAuthorReviewSummary" ImageUrl="~/Images/Calendar.gif" runat="server" />
                            <act:CalendarExtender runat="server" ID="CalNextAuthorReviewSummary" CssClass="ProfilesCalendar"
                                TargetControlID="txtNextAuthorReviewSummary" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
                            </act:CalendarExtender>
                        </td>
                        <td>
                            <pwc:DateValidator ID="valNextAuthorReviewSummary" ControlToValidate="txtNextAuthorReviewSummary"
                                runat="server" ErrorMessage="Next author review date must be a valid date"
                                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVAReviewFreqSummary" runat="server" Text="VA review frequency:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlVAReviewFreqSummary" runat="server" DataSourceID="dsRevisionDates"
                                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemVAReviewFreqSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblNextVAReviewSummary" runat="server" Text="Next VA review:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemNextVAReviewSummary" runat="server" Width="130px" Style="display: block;
                                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
                            <asp:TextBox ID="txtNextVAReviewSummary" runat="server"></asp:TextBox>&nbsp;
                            <asp:Image ID="ImgCalNextVAReviewSummary" ImageUrl="~/Images/Calendar.gif" runat="server" />
                            <act:CalendarExtender runat="server" ID="CalNextVAReviewSummary" CssClass="ProfilesCalendar"
                                TargetControlID="txtNextVAReviewSummary" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
                            </act:CalendarExtender>
                        </td>
                        <td>
                            <pwc:DateValidator ID="valNextVAReviewSummary" ControlToValidate="txtNextVAReviewSummary"
                                runat="server" ErrorMessage="Next VA review date must be a valid date"
                                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPolicyReviewFreqSummary" runat="server" Text="Policy review frequency:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPolicyReviewFreqSummary" runat="server" DataSourceID="dsRevisionDates"
                                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemPolicyReviewFreqSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblNextPolicyReviewSummary" runat="server" Text="Next policy review:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemNextPolicyReviewSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                            <asp:TextBox ID="txtNextPolicyReviewSummary" runat="server"></asp:TextBox>&nbsp;
                            <asp:Image ID="ImgCalNextPolReviewSummary" ImageUrl="~/Images/Calendar.gif" runat="server" />
                            <act:CalendarExtender runat="server" ID="CalNextPolicyReviewSummary" CssClass="ProfilesCalendar"
                                TargetControlID="txtNextPolicyReviewSummary" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
                            </act:CalendarExtender>
                        </td>
                        <td>
                            <pwc:DateValidator ID="valNextPolicyReviewSummary" ControlToValidate="txtNextPolicyReviewSummary"
                                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
                                Display="Dynamic">*</pwc:DateValidator>                        
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAuthorReviewStatusSummary" runat="server" Text="Author review status:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlAuthorReviewStatusSummary" runat="server" DataSourceID="dsRevisionStatus"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemAuthorReviewStatusSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVAReviewStatusSummary" runat="server" Text="VA review status:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlVAReviewStatusSummary" runat="server" DataSourceID="dsRevisionStatus"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>                            
                            <asp:Label ID="lblItemVAReviewStatusSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPolicyReviewStatusSummary" runat="server" Text="Policy review status:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPolicyReviewStatusSummary" runat="server" DataSourceID="dsRevisionStatus"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
                                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblItemPolicyReviewStatusSummary" runat="server" Width="130px" Style="border-style: solid;
                                border-width: 1px; background-color: White"></asp:Label>                            
                        </td>
                    </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">2. Geographic distribution & levels of disease</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqGeographicDistributionLevelsDisease" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqGeographicDistributionLevelsDisease" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewGeographicDistributionLevelsDisease" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewGeographicDistributionLevelsDisease" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewGeographicDistributionLevelsDisease" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewGeographicDistributionLevelsDisease" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewGeographicDistributionLevelsDisease" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewGeographicDistributionLevelsDisease" ControlToValidate="txtNextAuthorReviewGeographicDistributionLevelsDisease"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqGeographicDistributionLevelsDisease" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqGeographicDistributionLevelsDisease" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewGeographicDistributionLevelsDisease" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewGeographicDistributionLevelsDisease" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewGeographicDistributionLevelsDisease" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewGeographicDistributionLevelsDisease" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewGeographicDistributionLevelsDisease" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewGeographicDistributionLevelsDisease" ControlToValidate="txtNextVAReviewGeographicDistributionLevelsDisease"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqGeographicDistributionLevelsDisease" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqGeographicDistributionLevelsDisease" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewGeographicDistributionLevelsDisease" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewGeographicDistributionLevelsDisease" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewGeographicDistributionLevelsDisease" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewGeographicDistributionLevelsDisease" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewGeographicDistributionLevelsDisease" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewGeographicDistributionLevelsDisease" ControlToValidate="txtNextPolicyReviewGeographicDistributionLevelsDisease"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusGeographicDistributionLevelsDisease" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusGeographicDistributionLevelsDisease" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusGeographicDistributionLevelsDisease" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusGeographicDistributionLevelsDisease" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusGeographicDistributionLevelsDisease" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusGeographicDistributionLevelsDisease" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusGeographicDistributionLevelsDisease" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">3. Epidemiology</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqEpidemiology" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqEpidemiology" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewEpidemiology" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewEpidemiology" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewEpidemiology" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewEpidemiology" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewEpidemiology" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewEpidemiology" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewEpidemiology" ControlToValidate="txtNextAuthorReviewEpidemiology"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqEpidemiology" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqEpidemiology" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewEpidemiology" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewEpidemiology" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewEpidemiology" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewEpidemiology" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewEpidemiology" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewEpidemiology" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewEpidemiology" ControlToValidate="txtNextVAReviewEpidemiology"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqEpidemiology" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqEpidemiology" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewEpidemiology" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewEpidemiology" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewEpidemiology" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewEpidemiology" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewEpidemiology" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewEpidemiology" ControlToValidate="txtNextPolicyReviewEpidemiology"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusEpidemiology" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusEpidemiology" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusEpidemiology" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusEpidemiology" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusEpidemiology" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusEpidemiology" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusEpidemiology" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">4. Characteristics of the agent</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqCharacteristicsAgent" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqCharacteristicsAgent" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewCharacteristicsAgent" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewCharacteristicsAgent" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewCharacteristicsAgent" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewCharacteristicsAgent" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewCharacteristicsAgent" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewCharacteristicsAgent" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewCharacteristicsAgent" ControlToValidate="txtNextAuthorReviewCharacteristicsAgent"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqCharacteristicsAgent" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqCharacteristicsAgent" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewCharacteristicsAgent" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewCharacteristicsAgent" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewCharacteristicsAgent" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewCharacteristicsAgent" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewCharacteristicsAgent" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewCharacteristicsAgent" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewCharacteristicsAgent" ControlToValidate="txtNextVAReviewCharacteristicsAgent"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqCharacteristicsAgent" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqCharacteristicsAgent" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewCharacteristicsAgent" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewCharacteristicsAgent" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewCharacteristicsAgent" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewCharacteristicsAgent" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewCharacteristicsAgent" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewCharacteristicsAgent" ControlToValidate="txtNextPolicyReviewCharacteristicsAgent"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusCharacteristicsAgent" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusCharacteristicsAgent" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusCharacteristicsAgent" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusCharacteristicsAgent" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusCharacteristicsAgent" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusCharacteristicsAgent" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusCharacteristicsAgent" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">5. Animal Welfare</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqAnimalWelfare" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqAnimalWelfare" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewAnimalWelfare" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewAnimalWelfare" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewAnimalWelfare" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewAnimalWelfare" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewAnimalWelfare" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewAnimalWelfare" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewAnimalWelfare" ControlToValidate="txtNextAuthorReviewAnimalWelfare"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqAnimalWelfare" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqAnimalWelfare" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewAnimalWelfare" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewAnimalWelfare" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewAnimalWelfare" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewAnimalWelfare" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewAnimalWelfare" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewAnimalWelfare" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewAnimalWelfare" ControlToValidate="txtNextVAReviewAnimalWelfare"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqAnimalWelfare" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqAnimalWelfare" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewAnimalWelfare" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewAnimalWelfare" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewAnimalWelfare" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewAnimalWelfare" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewAnimalWelfare" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewAnimalWelfare" ControlToValidate="txtNextPolicyReviewAnimalWelfare"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusAnimalWelfare" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusAnimalWelfare" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusAnimalWelfare" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusAnimalWelfare" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusAnimalWelfare" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusAnimalWelfare" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusAnimalWelfare" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">6. Human Health</h3>
                <table>
                    <tr>
                        <td>
	                        <asp:Label ID="lblAuthorReviewFreqHumanHealth" runat="server" Text="Author review frequency:"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlAuthorReviewFreqHumanHealth" runat="server" DataSourceID="dsRevisionDates"
		                        DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
		                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
	                        </asp:DropDownList>
	                        <asp:Label ID="lblItemAuthorReviewFreqHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
	                        &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
	                        <asp:Label ID="lblNextAuthorReviewHumanHealth" runat="server" Text="Next author review:"></asp:Label>
                        </td>
                        <td>
	                        <asp:Label ID="lblItemNextAuthorReviewHumanHealth" runat="server" Width="130px" Style="display: block;
		                        border-style: solid; border-width: 1px; background-color: White"></asp:Label>
	                        <asp:TextBox ID="txtNextAuthorReviewHumanHealth" runat="server"></asp:TextBox>&nbsp;
	                        <asp:Image ID="ImgCalNextAuthorReviewHumanHealth" ImageUrl="~/Images/Calendar.gif" runat="server" />
	                        <act:CalendarExtender runat="server" ID="CalNextAuthorReviewHumanHealth" CssClass="ProfilesCalendar"
		                        TargetControlID="txtNextAuthorReviewHumanHealth" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
	                        </act:CalendarExtender>
                        </td>
                        <td>
	                        <pwc:DateValidator ID="valNextAuthorReviewHumanHealth" ControlToValidate="txtNextAuthorReviewHumanHealth"
		                        runat="server" ErrorMessage="Next author review date must be a valid date"
		                        ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
                        </td>
                        <td>
	                        &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
	                        <asp:Label ID="lblVAReviewFreqHumanHealth" runat="server" Text="VA review frequency:"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlVAReviewFreqHumanHealth" runat="server" DataSourceID="dsRevisionDates"
		                        DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
		                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
	                        </asp:DropDownList>
	                        <asp:Label ID="lblItemVAReviewFreqHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
	                        &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
	                        <asp:Label ID="lblNextVAReviewHumanHealth" runat="server" Text="Next VA review:"></asp:Label>
                        </td>
                        <td>
	                        <asp:Label ID="lblItemNextVAReviewHumanHealth" runat="server" Width="130px" Style="display: block;
		                        border-style: solid; border-width: 1px; background-color: White"></asp:Label>
	                        <asp:TextBox ID="txtNextVAReviewHumanHealth" runat="server"></asp:TextBox>&nbsp;
	                        <asp:Image ID="ImgCalNextVAReviewHumanHealth" ImageUrl="~/Images/Calendar.gif" runat="server" />
	                        <act:CalendarExtender runat="server" ID="CalNextVAReviewHumanHealth" CssClass="ProfilesCalendar"
		                        TargetControlID="txtNextVAReviewHumanHealth" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
	                        </act:CalendarExtender>
                        </td>
                        <td>
	                        <pwc:DateValidator ID="valNextVAReviewHumanHealth" ControlToValidate="txtNextVAReviewHumanHealth"
		                        runat="server" ErrorMessage="Next VA review date must be a valid date"
		                        ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
                        </td>
                        <td>
	                        &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
	                        <asp:Label ID="lblPolicyReviewFreqHumanHealth" runat="server" Text="Policy review frequency:"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlPolicyReviewFreqHumanHealth" runat="server" DataSourceID="dsRevisionDates"
		                        DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
		                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
	                        </asp:DropDownList>
	                        <asp:Label ID="lblItemPolicyReviewFreqHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>
                        </td>
                        <td>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
	                        <asp:Label ID="lblNextPolicyReviewHumanHealth" runat="server" Text="Next policy review:"></asp:Label>
                        </td>
                        <td>
	                        <asp:Label ID="lblItemNextPolicyReviewHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>
	                        <asp:TextBox ID="txtNextPolicyReviewHumanHealth" runat="server"></asp:TextBox>&nbsp;
	                        <asp:Image ID="ImgCalNextPolReviewHumanHealth" ImageUrl="~/Images/Calendar.gif" runat="server" />
	                        <act:CalendarExtender runat="server" ID="CalNextPolicyReviewHumanHealth" CssClass="ProfilesCalendar"
		                        TargetControlID="txtNextPolicyReviewHumanHealth" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
	                        </act:CalendarExtender>
                        </td>
                        <td>
	                        <pwc:DateValidator ID="valNextPolicyReviewHumanHealth" ControlToValidate="txtNextPolicyReviewHumanHealth"
		                        runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
		                        Display="Dynamic">*</pwc:DateValidator>                        
                        </td>
                        <td>
	                        &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
	                        <asp:Label ID="lblAuthorReviewStatusHumanHealth" runat="server" Text="Author review status:"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlAuthorReviewStatusHumanHealth" runat="server" DataSourceID="dsRevisionStatus"
		                        DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
		                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
	                        </asp:DropDownList>
	                        <asp:Label ID="lblItemAuthorReviewStatusHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
	                        <asp:Label ID="lblVAReviewStatusHumanHealth" runat="server" Text="VA review status:"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlVAReviewStatusHumanHealth" runat="server" DataSourceID="dsRevisionStatus"
		                        DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
		                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
	                        </asp:DropDownList>                            
	                        <asp:Label ID="lblItemVAReviewStatusHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>                       
                        </td>
                    </tr>
                    <tr>
                        <td>
	                        <asp:Label ID="lblPolicyReviewStatusHumanHealth" runat="server" Text="Policy review status:"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlPolicyReviewStatusHumanHealth" runat="server" DataSourceID="dsRevisionStatus"
		                        DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
		                        <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
	                        </asp:DropDownList>
	                        <asp:Label ID="lblItemPolicyReviewStatusHumanHealth" runat="server" Width="130px" Style="border-style: solid;
		                        border-width: 1px; background-color: White"></asp:Label>                            
                        </td>
                    </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">7. WiderSociety</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqWiderSociety" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqWiderSociety" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewWiderSociety" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewWiderSociety" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewWiderSociety" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewWiderSociety" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewWiderSociety" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewWiderSociety" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewWiderSociety" ControlToValidate="txtNextAuthorReviewWiderSociety"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqWiderSociety" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqWiderSociety" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewWiderSociety" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewWiderSociety" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewWiderSociety" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewWiderSociety" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewWiderSociety" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewWiderSociety" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewWiderSociety" ControlToValidate="txtNextVAReviewWiderSociety"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqWiderSociety" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqWiderSociety" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewWiderSociety" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewWiderSociety" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewWiderSociety" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewWiderSociety" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewWiderSociety" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewWiderSociety" ControlToValidate="txtNextPolicyReviewWiderSociety"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusWiderSociety" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusWiderSociety" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusWiderSociety" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusWiderSociety" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusWiderSociety" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusWiderSociety" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusWiderSociety" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">8. Legislation & Mandates</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqLegislationMandates" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqLegislationMandates" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewLegislationMandates" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewLegislationMandates" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewLegislationMandates" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewLegislationMandates" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewLegislationMandates" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewLegislationMandates" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewLegislationMandates" ControlToValidate="txtNextAuthorReviewLegislationMandates"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqLegislationMandates" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqLegislationMandates" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewLegislationMandates" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewLegislationMandates" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewLegislationMandates" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewLegislationMandates" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewLegislationMandates" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewLegislationMandates" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewLegislationMandates" ControlToValidate="txtNextVAReviewLegislationMandates"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqLegislationMandates" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqLegislationMandates" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewLegislationMandates" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewLegislationMandates" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewLegislationMandates" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewLegislationMandates" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewLegislationMandates" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewLegislationMandates" ControlToValidate="txtNextPolicyReviewLegislationMandates"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusLegislationMandates" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusLegislationMandates" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusLegislationMandates" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusLegislationMandates" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusLegislationMandates" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusLegislationMandates" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusLegislationMandates" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">9. Approach to Control</h3>
                <table>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblAuthorReviewFreqApproachControl" runat="server" Text="Author review frequency:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:DropDownList ID="ddlAuthorReviewFreqApproachControl" runat="server" DataSourceID="dsRevisionDates"
			                    DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
			                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
		                    </asp:DropDownList>
		                    <asp:Label ID="lblItemAuthorReviewFreqApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>
	                    </td>
	                    <td>
		                    &nbsp;&nbsp;&nbsp;
	                    </td>
	                    <td>
		                    <asp:Label ID="lblNextAuthorReviewApproachControl" runat="server" Text="Next author review:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:Label ID="lblItemNextAuthorReviewApproachControl" runat="server" Width="130px" Style="display: block;
			                    border-style: solid; border-width: 1px; background-color: White"></asp:Label>
		                    <asp:TextBox ID="txtNextAuthorReviewApproachControl" runat="server"></asp:TextBox>&nbsp;
		                    <asp:Image ID="ImgCalNextAuthorReviewApproachControl" ImageUrl="~/Images/Calendar.gif" runat="server" />
		                    <act:CalendarExtender runat="server" ID="CalNextAuthorReviewApproachControl" CssClass="ProfilesCalendar"
			                    TargetControlID="txtNextAuthorReviewApproachControl" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
		                    </act:CalendarExtender>
	                    </td>
	                    <td>
		                    <pwc:DateValidator ID="valNextAuthorReviewApproachControl" ControlToValidate="txtNextAuthorReviewApproachControl"
			                    runat="server" ErrorMessage="Next author review date must be a valid date"
			                    ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
	                    </td>
	                    <td>
		                    &nbsp;
	                    </td>
                    </tr>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblVAReviewFreqApproachControl" runat="server" Text="VA review frequency:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:DropDownList ID="ddlVAReviewFreqApproachControl" runat="server" DataSourceID="dsRevisionDates"
			                    DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
			                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
		                    </asp:DropDownList>
		                    <asp:Label ID="lblItemVAReviewFreqApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>
	                    </td>
	                    <td>
		                    &nbsp;&nbsp;&nbsp;
	                    </td>
	                    <td>
		                    <asp:Label ID="lblNextVAReviewApproachControl" runat="server" Text="Next VA review:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:Label ID="lblItemNextVAReviewApproachControl" runat="server" Width="130px" Style="display: block;
			                    border-style: solid; border-width: 1px; background-color: White"></asp:Label>
		                    <asp:TextBox ID="txtNextVAReviewApproachControl" runat="server"></asp:TextBox>&nbsp;
		                    <asp:Image ID="ImgCalNextVAReviewApproachControl" ImageUrl="~/Images/Calendar.gif" runat="server" />
		                    <act:CalendarExtender runat="server" ID="CalNextVAReviewApproachControl" CssClass="ProfilesCalendar"
			                    TargetControlID="txtNextVAReviewApproachControl" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
		                    </act:CalendarExtender>
	                    </td>
	                    <td>
		                    <pwc:DateValidator ID="valNextVAReviewApproachControl" ControlToValidate="txtNextVAReviewApproachControl"
			                    runat="server" ErrorMessage="Next VA review date must be a valid date"
			                    ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
	                    </td>
	                    <td>
		                    &nbsp;
	                    </td>
                    </tr>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblPolicyReviewFreqApproachControl" runat="server" Text="Policy review frequency:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:DropDownList ID="ddlPolicyReviewFreqApproachControl" runat="server" DataSourceID="dsRevisionDates"
			                    DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
			                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
		                    </asp:DropDownList>
		                    <asp:Label ID="lblItemPolicyReviewFreqApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>
	                    </td>
	                    <td>
		                    &nbsp;&nbsp;&nbsp;&nbsp;
	                    </td>
	                    <td>
		                    <asp:Label ID="lblNextPolicyReviewApproachControl" runat="server" Text="Next policy review:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:Label ID="lblItemNextPolicyReviewApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>
		                    <asp:TextBox ID="txtNextPolicyReviewApproachControl" runat="server"></asp:TextBox>&nbsp;
		                    <asp:Image ID="ImgCalNextPolReviewApproachControl" ImageUrl="~/Images/Calendar.gif" runat="server" />
		                    <act:CalendarExtender runat="server" ID="CalNextPolicyReviewApproachControl" CssClass="ProfilesCalendar"
			                    TargetControlID="txtNextPolicyReviewApproachControl" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
		                    </act:CalendarExtender>
	                    </td>
	                    <td>
		                    <pwc:DateValidator ID="valNextPolicyReviewApproachControl" ControlToValidate="txtNextPolicyReviewApproachControl"
			                    runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
			                    Display="Dynamic">*</pwc:DateValidator>                        
	                    </td>
	                    <td>
		                    &nbsp;
	                    </td>
                    </tr>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblAuthorReviewStatusApproachControl" runat="server" Text="Author review status:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:DropDownList ID="ddlAuthorReviewStatusApproachControl" runat="server" DataSourceID="dsRevisionStatus"
			                    DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
			                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
		                    </asp:DropDownList>
		                    <asp:Label ID="lblItemAuthorReviewStatusApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>
	                    </td>
                    </tr>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblVAReviewStatusApproachControl" runat="server" Text="VA review status:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:DropDownList ID="ddlVAReviewStatusApproachControl" runat="server" DataSourceID="dsRevisionStatus"
			                    DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
			                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
		                    </asp:DropDownList>                            
		                    <asp:Label ID="lblItemVAReviewStatusApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>                       
	                    </td>
                    </tr>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblPolicyReviewStatusApproachControl" runat="server" Text="Policy review status:"></asp:Label>
	                    </td>
	                    <td>
		                    <asp:DropDownList ID="ddlPolicyReviewStatusApproachControl" runat="server" DataSourceID="dsRevisionStatus"
			                    DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
			                    <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
		                    </asp:DropDownList>
		                    <asp:Label ID="lblItemPolicyReviewStatusApproachControl" runat="server" Width="130px" Style="border-style: solid;
			                    border-width: 1px; background-color: White"></asp:Label>                            
	                    </td>
                    </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">10. Risk Assessment</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqRiskAssessment" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqRiskAssessment" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewRiskAssessment" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewRiskAssessment" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewRiskAssessment" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewRiskAssessment" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewRiskAssessment" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewRiskAssessment" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewRiskAssessment" ControlToValidate="txtNextAuthorReviewRiskAssessment"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqRiskAssessment" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqRiskAssessment" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewRiskAssessment" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewRiskAssessment" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewRiskAssessment" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewRiskAssessment" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewRiskAssessment" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewRiskAssessment" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewRiskAssessment" ControlToValidate="txtNextVAReviewRiskAssessment"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqRiskAssessment" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqRiskAssessment" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewRiskAssessment" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewRiskAssessment" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewRiskAssessment" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewRiskAssessment" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewRiskAssessment" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewRiskAssessment" ControlToValidate="txtNextPolicyReviewRiskAssessment"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusRiskAssessment" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusRiskAssessment" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusRiskAssessment" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusRiskAssessment" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusRiskAssessment" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusRiskAssessment" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusRiskAssessment" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">11. Laboratories</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqLaboratories" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqLaboratories" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewLaboratories" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewLaboratories" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewLaboratories" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewLaboratories" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewLaboratories" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewLaboratories" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewLaboratories" ControlToValidate="txtNextAuthorReviewLaboratories"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqLaboratories" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqLaboratories" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewLaboratories" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewLaboratories" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewLaboratories" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewLaboratories" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewLaboratories" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewLaboratories" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewLaboratories" ControlToValidate="txtNextVAReviewLaboratories"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqLaboratories" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqLaboratories" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewLaboratories" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewLaboratories" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewLaboratories" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewLaboratories" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewLaboratories" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewLaboratories" ControlToValidate="txtNextPolicyReviewLaboratories"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusLaboratories" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusLaboratories" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusLaboratories" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusLaboratories" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusLaboratories" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusLaboratories" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusLaboratories" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">12. Surveillance</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqSurveillance" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqSurveillance" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewSurveillance" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewSurveillance" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewSurveillance" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewSurveillance" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewSurveillance" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewSurveillance" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewSurveillance" ControlToValidate="txtNextAuthorReviewSurveillance"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqSurveillance" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqSurveillance" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewSurveillance" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewSurveillance" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewSurveillance" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewSurveillance" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewSurveillance" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewSurveillance" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewSurveillance" ControlToValidate="txtNextVAReviewSurveillance"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqSurveillance" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqSurveillance" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewSurveillance" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewSurveillance" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewSurveillance" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewSurveillance" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewSurveillance" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewSurveillance" ControlToValidate="txtNextPolicyReviewSurveillance"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusSurveillance" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusSurveillance" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusSurveillance" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusSurveillance" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusSurveillance" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusSurveillance" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusSurveillance" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">13. International Trade</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqInternationalTrade" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqInternationalTrade" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewInternationalTrade" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewInternationalTrade" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewInternationalTrade" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewInternationalTrade" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewInternationalTrade" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewInternationalTrade" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewInternationalTrade" ControlToValidate="txtNextAuthorReviewInternationalTrade"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqInternationalTrade" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqInternationalTrade" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewInternationalTrade" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewInternationalTrade" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewInternationalTrade" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewInternationalTrade" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewInternationalTrade" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewInternationalTrade" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewInternationalTrade" ControlToValidate="txtNextVAReviewInternationalTrade"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqInternationalTrade" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqInternationalTrade" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewInternationalTrade" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewInternationalTrade" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewInternationalTrade" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewInternationalTrade" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewInternationalTrade" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewInternationalTrade" ControlToValidate="txtNextPolicyReviewInternationalTrade"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusInternationalTrade" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusInternationalTrade" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusInternationalTrade" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusInternationalTrade" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusInternationalTrade" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusInternationalTrade" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusInternationalTrade" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">14. Opportunity to add value</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqOpportunity" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqOpportunity" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewOpportunity" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewOpportunity" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewOpportunity" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewOpportunity" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewOpportunity" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewOpportunity" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewOpportunity" ControlToValidate="txtNextAuthorReviewOpportunity"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqOpportunity" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqOpportunity" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewOpportunity" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewOpportunity" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewOpportunity" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewOpportunity" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewOpportunity" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewOpportunity" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewOpportunity" ControlToValidate="txtNextVAReviewOpportunity"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqOpportunity" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqOpportunity" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewOpportunity" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewOpportunity" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewOpportunity" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewOpportunity" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewOpportunity" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewOpportunity" ControlToValidate="txtNextPolicyReviewOpportunity"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusOpportunity" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusOpportunity" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusOpportunity" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusOpportunity" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusOpportunity" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusOpportunity" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusOpportunity" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">15. Public and Stakeholder Perception</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqPublicAndStakeholderPerception" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqPublicAndStakeholderPerception" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewPublicAndStakeholderPerception" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewPublicAndStakeholderPerception" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewPublicAndStakeholderPerception" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewPublicAndStakeholderPerception" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewPublicAndStakeholderPerception" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewPublicAndStakeholderPerception" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewPublicAndStakeholderPerception" ControlToValidate="txtNextAuthorReviewPublicAndStakeholderPerception"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqPublicAndStakeholderPerception" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqPublicAndStakeholderPerception" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewPublicAndStakeholderPerception" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewPublicAndStakeholderPerception" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewPublicAndStakeholderPerception" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewPublicAndStakeholderPerception" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewPublicAndStakeholderPerception" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewPublicAndStakeholderPerception" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewPublicAndStakeholderPerception" ControlToValidate="txtNextVAReviewPublicAndStakeholderPerception"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqPublicAndStakeholderPerception" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqPublicAndStakeholderPerception" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewPublicAndStakeholderPerception" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewPublicAndStakeholderPerception" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewPublicAndStakeholderPerception" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewPublicAndStakeholderPerception" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewPublicAndStakeholderPerception" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewPublicAndStakeholderPerception" ControlToValidate="txtNextPolicyReviewPublicAndStakeholderPerception"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusPublicAndStakeholderPerception" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusPublicAndStakeholderPerception" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusPublicAndStakeholderPerception" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusPublicAndStakeholderPerception" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusPublicAndStakeholderPerception" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusPublicAndStakeholderPerception" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusPublicAndStakeholderPerception" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <br />
                <h3 class="govuk-heading-s">16. Areas of Uncertainty</h3>
                <table>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewFreqAreasOfUncertainty" runat="server" Text="Author review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewFreqAreasOfUncertainty" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewFreqAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextAuthorReviewAreasOfUncertainty" runat="server" Text="Next author review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextAuthorReviewAreasOfUncertainty" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextAuthorReviewAreasOfUncertainty" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextAuthorReviewAreasOfUncertainty" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextAuthorReviewAreasOfUncertainty" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextAuthorReviewAreasOfUncertainty" Format="d MMMM yyyy" PopupButtonID="ImgCalNextAuthorReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextAuthorReviewAreasOfUncertainty" ControlToValidate="txtNextAuthorReviewAreasOfUncertainty"
				                runat="server" ErrorMessage="Next author review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewFreqAreasOfUncertainty" runat="server" Text="VA review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewFreqAreasOfUncertainty" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemVAReviewFreqAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextVAReviewAreasOfUncertainty" runat="server" Text="Next VA review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextVAReviewAreasOfUncertainty" runat="server" Width="130px" Style="display: block;
				                border-style: solid; border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextVAReviewAreasOfUncertainty" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextVAReviewAreasOfUncertainty" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextVAReviewAreasOfUncertainty" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextVAReviewAreasOfUncertainty" Format="d MMMM yyyy" PopupButtonID="ImgCalNextVAReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextVAReviewAreasOfUncertainty" ControlToValidate="txtNextVAReviewAreasOfUncertainty"
				                runat="server" ErrorMessage="Next VA review date must be a valid date"
				                ToolTip="Please enter a valid date" Display="Dynamic">*</pwc:DateValidator>                         
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewFreqAreasOfUncertainty" runat="server" Text="Policy review frequency:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewFreqAreasOfUncertainty" runat="server" DataSourceID="dsRevisionDates"
				                DataTextField="Value" DataValueField="Key" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewFreqAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
		                <td>
			                &nbsp;&nbsp;&nbsp;&nbsp;
		                </td>
		                <td>
			                <asp:Label ID="lblNextPolicyReviewAreasOfUncertainty" runat="server" Text="Next policy review:"></asp:Label>
		                </td>
		                <td>
			                <asp:Label ID="lblItemNextPolicyReviewAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
			                <asp:TextBox ID="txtNextPolicyReviewAreasOfUncertainty" runat="server"></asp:TextBox>&nbsp;
			                <asp:Image ID="ImgCalNextPolReviewAreasOfUncertainty" ImageUrl="~/Images/Calendar.gif" runat="server" />
			                <act:CalendarExtender runat="server" ID="CalNextPolicyReviewAreasOfUncertainty" CssClass="ProfilesCalendar"
				                TargetControlID="txtNextPolicyReviewAreasOfUncertainty" Format="d MMMM yyyy" PopupButtonID="ImgCalNextPolReview">
			                </act:CalendarExtender>
		                </td>
		                <td>
			                <pwc:DateValidator ID="valNextPolicyReviewAreasOfUncertainty" ControlToValidate="txtNextPolicyReviewAreasOfUncertainty"
				                runat="server" ErrorMessage="Next policy review date must be a valid date" ToolTip="Please enter a valid date"
				                Display="Dynamic">*</pwc:DateValidator>                        
		                </td>
		                <td>
			                &nbsp;
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblAuthorReviewStatusAreasOfUncertainty" runat="server" Text="Author review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlAuthorReviewStatusAreasOfUncertainty" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemAuthorReviewStatusAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblVAReviewStatusAreasOfUncertainty" runat="server" Text="VA review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlVAReviewStatusAreasOfUncertainty" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>                            
			                <asp:Label ID="lblItemVAReviewStatusAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                       
		                </td>
	                </tr>
	                <tr>
		                <td>
			                <asp:Label ID="lblPolicyReviewStatusAreasOfUncertainty" runat="server" Text="Policy review status:"></asp:Label>
		                </td>
		                <td>
			                <asp:DropDownList ID="ddlPolicyReviewStatusAreasOfUncertainty" runat="server" DataSourceID="dsRevisionStatus"
				                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
				                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
			                </asp:DropDownList>
			                <asp:Label ID="lblItemPolicyReviewStatusAreasOfUncertainty" runat="server" Width="130px" Style="border-style: solid;
				                border-width: 1px; background-color: White"></asp:Label>                            
		                </td>
	                </tr>
                </table>
                <table style="width: 100%">
                    <tr>
                        <td>                            
                            <div align="right">   
                                <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="govuk-button"/>&nbsp;                                
                            </div> 
                        </td>
                    </tr>
                </table>
                <csla:CslaDataSource ID="dsRevisionDates" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SectionReviewFrequencyList">
                </csla:CslaDataSource>
                <csla:CslaDataSource ID="dsRevisionStatus" runat="server" TypeAssemblyName="ProfilesLibrary"
                    TypeName="ProfilesLibrary.SectionReviewStatusTypeList">
                </csla:CslaDataSource>
            </div>
        </asp:Panel>
        <div align="right">
            <asp:LinkButton
                ID="lnkPublishPublic"
                CssClass="govuk-link me-3"
                runat="server"
                OnClientClick="apha.confirmPrompt('Are you sure you want to publish this profile and make it public (this cannot be undone)?', this); return false;">
                Publish (public)
            </asp:LinkButton>

            <asp:LinkButton 
                ID="lnkPublish" 
                CssClass="govuk-link" 
                runat="server"  
                OnClientClick="apha.confirmPrompt('Are you sure you want to publish this profile but not make it public?', this); return false;">
                Publish (Defranet only)
            </asp:LinkButton>
        </div>
    </div>
    <div class="SectionPaginationAdjuster">
        <pag:SectionPagination runat="server" ID="SectionPagination" />
    </div>
</asp:Content>
