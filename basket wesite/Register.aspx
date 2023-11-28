<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ContinueDestinationPageUrl="~/Login.aspx" ForeColor="Black" CreateUserButtonText="Δημιουργία Νέου Χρήστη">
        <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" ForeColor="#284E98"></ContinueButtonStyle>

        <CreateUserButtonStyle BackColor="White" BorderColor="#507CD1" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" ForeColor="#284E98"></CreateUserButtonStyle>

        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></TitleTextStyle>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
        <HeaderStyle HorizontalAlign="Center" BackColor="#284E98" BorderColor="#EFF3FB" BorderWidth="2px" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White"></HeaderStyle>

        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" ForeColor="#284E98"></NavigationButtonStyle>

        <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White"></SideBarButtonStyle>

        <SideBarStyle VerticalAlign="Top" BackColor="#507CD1" Font-Size="0.9em"></SideBarStyle>

        <StepStyle Font-Size="0.8em"></StepStyle>
    </asp:CreateUserWizard>

</asp:Content>

