<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="AllReferees.aspx.cs" Inherits="AllReferees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
      
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Justify" ShowFooter="False" ShowHeader="False" BackColor="#6F4526" BorderColor="#996633" BorderWidth="2px" CellSpacing="5" GridLines="Both" CellPadding="5">
        <AlternatingItemStyle HorizontalAlign="Center" BackColor="RosyBrown"></AlternatingItemStyle>        
        <ItemStyle HorizontalAlign="Center"></ItemStyle>
        <ItemTemplate >
            REFEREE:
            <asp:HyperLink ID="HyperLinkReferee" runat="server" NavigateUrl='<%# Eval("ID", "Referees.aspx?ID={0}") %>'>
               <asp:Label ID="LabelHyperlinkCoach" runat="server" Text='<%# Eval("FULLNAME") %>'></asp:Label></br>
            </asp:HyperLink>                      
        COUNTRY:
            <asp:Label ID="Labelref" runat="server" Text='<%# Eval("COUNTRY") %>'></asp:Label></br>
            <asp:Image ID="ImageCountry" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' /><br />  
        BORN:
            <asp:Label ID="LabelrefBorn" runat="server" Text='<%# Eval("BORN") %>'></asp:Label>
        </ItemTemplate>
        </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT REFEREE.ID, REFEREE.SURENAME, REFEREE.FIRST_NAME, REFEREE.COUNTRY_ID, REFEREE.BORN, REFEREE.SURENAME + ' ' + REFEREE.FIRST_NAME AS FULLNAME, COUNTRY.ID AS IDOCOUNTRY, COUNTRY.COUNTRY_CODE, COUNTRY.NAME AS COUNTRY FROM COUNTRY INNER JOIN REFEREE ON COUNTRY.ID = REFEREE.COUNTRY_ID ORDER BY REFEREE.SURENAME">
    </asp:SqlDataSource>
</asp:Content>

