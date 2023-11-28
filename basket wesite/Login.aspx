<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
           <link rel="stylesheet" href="css/styleSlider.css" type="text/css" media="screen"/>
  
    
     
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:Login ID="LoginAddminBasket" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" CreateUserText="Δημιουργία Νέου Χρήστη" CreateUserUrl="~/Register.aspx" >
        <InstructionTextStyle Font-Italic="True" ForeColor="Black"></InstructionTextStyle>

        <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98"></LoginButtonStyle>

        <TextBoxStyle Font-Size="0.8em"></TextBoxStyle>

        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White"></TitleTextStyle>
    </asp:Login> 
</asp:Content>

