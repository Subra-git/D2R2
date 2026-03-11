<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PrintPrioritisationVariables.aspx.vb" Inherits="PrintPrioritisationVariables" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Print Prioritisation Variables</title>
    <link rel="Stylesheet" type="text/css" href="Css/Print.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="repeatPrioritisationCategory" runat="server" DataSourceID="dsPrioritisationCategory">
        
        <HeaderTemplate>
           <table width="100%" align="left">
                <tr>
                    <th align="left">Category name</th>                               
                </tr>
        </HeaderTemplate>

         <ItemTemplate>
          
            <tr>           
              <td>
                    <%# Eval("Name") %>
              </td>        
            </tr>
            <tr>
              <td>
                <asp:Repeater ID="repeatPrioritisationCriterion" runat="server" DataSourceID="dsPrioritisationCriterion">                               
                       <HeaderTemplate>
                            <table align="left" border="1">
                                <tr>
                                    <th align="left">Criterion</th>
                                    <th align="left">Weight</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>                             
                                <td><%# Eval("CodeAndName") %></td>
                                <td><%# Eval("Weight")%></td>
                             </tr>
                             <tr>                             
                                <td>
                                     <asp:Repeater ID="repeatPrioritisationCriterionValue" runat="server" DataSourceID="dsPrioritisationCriterionValue">
                                        <HeaderTemplate>
                                            <table align="left">
                                                <tr>
                                                    <th align="left">Value</th>
                                                    <th align="left">Score</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>                             
                                                <td><%#Eval("Value")%></td>
                                                <td><%#Eval("Score")%></td>
                                            </tr>
                                         </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate> 
                                    </asp:Repeater>                                                           
                                </td> 
                                <td></td>                            
                             </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>                                    
                    </asp:Repeater>
                 </td>
              </tr>    
                    
          </ItemTemplate>
          
         <FooterTemplate>
            </table>
         </FooterTemplate>
        
        </asp:Repeater>
    
    </div>
        <csla:CslaDataSource ID="dsPrioritisationCategory" runat="server" TypeAssemblyName="ProfilesLibrary"
            TypeName="ProfilesLibrary.PrioritisationCategoryList">
        </csla:CslaDataSource>
        <csla:CslaDataSource ID="dsPrioritisationCriterion" runat="server" TypeAssemblyName="ProfilesLibrary"
            TypeName="ProfilesLibrary.PrioritisationCriterionList">
        </csla:CslaDataSource>
        <csla:CslaDataSource ID="dsPrioritisationCriterionValue" runat="server" TypeAssemblyName="ProfilesLibrary"
            TypeName="ProfilesLibrary.PrioritisationCriterionValueList">
        </csla:CslaDataSource>        
                        
    </form>
</body>
</html>
