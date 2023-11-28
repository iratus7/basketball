<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="AllCoaches.aspx.cs" Inherits="AllCoaches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
      
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" RepeatColumns="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Justify" ShowFooter="False" ShowHeader="False" BackColor="#6F4526" BorderColor="#996633" BorderWidth="2px" CellSpacing="5" GridLines="Both" CellPadding="5">
        <AlternatingItemStyle HorizontalAlign="Center" BackColor="RosyBrown"></AlternatingItemStyle>
        
        <ItemStyle HorizontalAlign="Center"></ItemStyle>
        <ItemTemplate >
            <asp:HyperLink ID="HyperLinkCoach" runat="server" NavigateUrl='<%# Eval("ID", "Coaches.aspx?ID={0}") %>'>
               <asp:Label ID="LabelHyperlinkCoach" runat="server" Text='<%# Eval("FULLNAME") %>'></asp:Label></br>
               <asp:Image ID="ImageHyperlinkCoach" runat="server" Height="160px" Width="128px" ImageUrl='<%# "~/images/coaches/" + Eval("IMAGE") %>' Text='<%# Eval("SURENAME") %>' />
            </asp:HyperLink>
            <asp:Image ID="ImageCountry" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("IMAGE_COUNTRY") + ".png" %>' /><br />
            <asp:HyperLink ID="HyperLinkTeam" runat="server" NavigateUrl='<%# Eval("IDOTEAM", "Teams.aspx?ID={0}") %>'>
                <asp:Image ID="ImageHyperlinkTeam" runat="server" Height="60px" Width="60px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("IMAGE_TEAM") %>' Text='<%# Eval("TEAM") %>' /><br />
                <asp:Label ID="LabelHyperlinkTeam" runat="server" Text='<%# Eval("TEAM") %>'></asp:Label>
            </asp:HyperLink>
        </ItemTemplate>

        
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT COACH.ID, COACH.SURENAME,COACH.SURENAME + ' ' + COACH.FIRST_NAME AS FULLNAME, COACH.FIRST_NAME, COACH.BORN, COACH.TEAM_ID, COACH.COUNTRY_ID, COACH.IMAGE, COUNTRY.NAME AS COUNTRY, COUNTRY.COUNTRY_CODE AS IMAGE_COUNTRY, COUNTRY.ID AS ID0COUNTRY, TEAMS.ID AS IDOTEAM, TEAMS.NAME AS TEAM, TEAMS.LOGO AS IMAGE_TEAM FROM COUNTRY INNER JOIN COACH ON COUNTRY.ID = COACH.COUNTRY_ID INNER JOIN TEAMS ON COACH.TEAM_ID = TEAMS.ID ORDER BY COACH.SURENAME">
    
    </asp:SqlDataSource>
</asp:Content>

