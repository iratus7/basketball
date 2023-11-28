<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Coaches.aspx.cs" Inherits="Coaches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>COACHES</h2> <br />
    <asp:DetailsView ID="DetailsViewPlayers"  runat="server"  DataSourceID="SqlDataSource1" AutoGenerateRows="False" CssClass="cssdetailsview" HeaderStyle-CssClass="header"
              FieldHeaderStyle-CssClass="fieldheader"
              ItemStyle-CssClass="item"
              AlternatingRowStyle-CssClass="altrow" DataKeyNames="ID,ID0COUNTRY,IDOTEAM">
<AlternatingRowStyle CssClass="altrow"></AlternatingRowStyle>

<FieldHeaderStyle CssClass="fieldheader"></FieldHeaderStyle>
        <Fields>           
            <asp:TemplateField HeaderText="IMAGE" SortExpression="IMAGE" ShowHeader="False">                
                <ItemTemplate>
                    <asp:Image ID="ImageCoach" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/coaches/" + Eval("IMAGE") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SURNAME" SortExpression="SURENAME">                 
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SURENAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FIRST NAME" SortExpression="FIRST_NAME">               
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FIRST_NAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BORN" SortExpression="BORN">                
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("BORN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="COUNTRY" SortExpression="COUNTRY">               
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("COUNTRY") %>'></asp:Label>
                    <asp:Image ID="ImageCountry" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("IMAGE_COUNTRY") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>                                 
            <asp:TemplateField HeaderText="TEAM" SortExpression="TEAM">                
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkTeam" runat="server" NavigateUrl='<%# Eval("IDOTEAM", "Teams.aspx?ID={0}") %>'>
                        <asp:Image ID="ImageHyperlinkTeam" runat="server"  Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("IMAGE_TEAM") %>' Text='<%# Eval("TEAM") %>' /><br />
                        <asp:Label ID="LabelHyperlinkTeam" runat="server" Text='<%# Eval("TEAM") %>'></asp:Label>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>        
            </Fields>
<HeaderStyle CssClass="header"></HeaderStyle>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT COACH.ID, COACH.SURENAME, COACH.FIRST_NAME, COACH.BORN, COACH.TEAM_ID, COACH.COUNTRY_ID, COACH.IMAGE, COUNTRY.NAME AS COUNTRY, COUNTRY.COUNTRY_CODE AS IMAGE_COUNTRY, COUNTRY.ID AS ID0COUNTRY, TEAMS.ID AS IDOTEAM, TEAMS.NAME AS TEAM, TEAMS.LOGO AS IMAGE_TEAM FROM COUNTRY INNER JOIN COACH ON COUNTRY.ID = COACH.COUNTRY_ID INNER JOIN TEAMS ON COACH.TEAM_ID = TEAMS.ID WHERE (COACH.ID = @ID)">
    <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

