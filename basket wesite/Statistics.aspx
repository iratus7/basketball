<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Statistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΣΤΑΤΙΣΤΙΚΗ ΚΑΤΗΓΟΡΙΑ</h2>
    <asp:DropDownList ID="Stats_Ddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Stats_Ddl_IndexChanged" CssClass="styled-select">
        <asp:ListItem>POINTS</asp:ListItem>
        <asp:ListItem>INDEX RATING</asp:ListItem>
        <asp:ListItem>MINUTES PLAYED</asp:ListItem>
        <asp:ListItem>FREE THROWS</asp:ListItem>
        <asp:ListItem>2POINTS</asp:ListItem>
        <asp:ListItem>3POINTS</asp:ListItem>
        <asp:ListItem>REBOUNDS</asp:ListItem>
        <asp:ListItem>ASSISTS</asp:ListItem>
        <asp:ListItem>STEALS</asp:ListItem>
        <asp:ListItem>TURNOVERS</asp:ListItem>
        <asp:ListItem>FOULS</asp:ListItem>
        <asp:ListItem>BLOCKS</asp:ListItem>


    </asp:DropDownList><br />
    <br />

    <!--
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:BoundField DataField="SURNAME" HeaderText="SURNAME" SortExpression="SURNAME"></asp:BoundField>
            <asp:BoundField DataField="FIRSTNAME" HeaderText="FIRSTNAME" SortExpression="FIRSTNAME"></asp:BoundField>
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GAMES_PLAYED" SortExpression="GAMES_PLAYED" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="POINTS_PER_GAME" HeaderText="P" ReadOnly="True" SortExpression="POINTS_PER_GAME" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_MADE_AVG" HeaderText="FTM" SortExpression="FREE_THROW_MADE_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_ATTEMPT_AVG" HeaderText="FTA" ReadOnly="True" SortExpression="FREE_THROW_ATTEMPT_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_MADE_AVG" HeaderText="2PM" SortExpression="2POINTS_MADE_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_ATTEMPT_AVG" HeaderText="2PA" ReadOnly="True" SortExpression="2POINTS_ATTEMPT_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_MADE_AVG" HeaderText="3PM" SortExpression="3POINT_MADE_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_ATTEMPT_AVG" HeaderText="3PA" ReadOnly="True" SortExpression="3POINT_ATTEMPT_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="ASSISTS_AVG" HeaderText="AS" SortExpression="ASSISTS_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="DEFENSIVE_REBOUNDS_AVG" HeaderText="DR" SortExpression="DEFENSIVE_REBOUNDS_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="OFFENSIVE_REBOUNDS_AVG" HeaderText="OR" SortExpression="OFFENSIVE_REBOUNDS_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="FOULS_MADE_AVG" HeaderText="FM" SortExpression="FOULS_MADE_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="FOULS_ON_AVG" HeaderText="FO" SortExpression="FOULS_ON_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="TURNOVERS_AVG" HeaderText="TUR" SortExpression="TURNOVERS_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="STEALS_AVG" HeaderText="ST" SortExpression="STEALS_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="BLOCKS_MADE_AVG" HeaderText="BLM" SortExpression="BLOCKS_MADE_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="BLOCKS_SUFFERED_AVG" HeaderText="BLS" SortExpression="BLOCKS_SUFFERED_AVG" DataFormatString="{0:F}"></asp:BoundField>
            <asp:BoundField DataField="UNSPORTSMAN_FOUL_AVG" HeaderText="UNF" SortExpression="UNSPORTSMAN_FOUL_AVG" DataFormatString="{0:F}"></asp:BoundField>

            <asp:BoundField DataField="POINTS_TOTAL" HeaderText="P" ReadOnly="True" SortExpression="POINTS_TOTAL" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_MADE_TOTAL" HeaderText="FTM" SortExpression="FREE_THROW_MADE_TOTAL" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_ATTEMPT_TOTAL" HeaderText="FTA" ReadOnly="True" SortExpression="FREE_THROW_ATTEMPT_TOTAL" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_MADE_SUM" HeaderText="2PM" SortExpression="2POINTS_MADE_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_ATTEMPT_SUM" HeaderText="2PA" ReadOnly="True" SortExpression="2POINTS_ATTEMPT_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_MADE_SUM" HeaderText="3PM" SortExpression="3POINT_MADE_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_ATTEMPT_SUM" HeaderText="3PA" ReadOnly="True" SortExpression="3POINT_ATTEMPT_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="DEFENSIVE_REBOUNDS_SUM" HeaderText="DR" SortExpression="DEFENSIVE_REBOUNDS_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="OFFENSIVE_REBOUNDS_SUM" HeaderText="OR" SortExpression="OFFENSIVE_REBOUNDS_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="ASSISTS_SUM" HeaderText="AS" SortExpression="ASSISTS_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="FOULS_MADE_SUM" HeaderText="FM" SortExpression="FOULS_MADE_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="FOULS_ON_SUM" HeaderText="FO" SortExpression="FOULS_ON_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="TURNOVERS_SUM" HeaderText="TUR" SortExpression="TURNOVERS_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="STEALS_SUM" HeaderText="ST" SortExpression="STEALS_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="BLOCKS_MADE_SUM" HeaderText="BLM" SortExpression="BLOCKS_MADE_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="BLOCKS_SUFFERED_SUM" HeaderText="BLS" SortExpression="BLOCKS_SUFFERED_SUM" DataFormatString="{0:N0}"></asp:BoundField>
            <asp:BoundField DataField="UNSPORTSMAN_FOUL_SUM" HeaderText="UNF" SortExpression="UNSPORTSMAN_FOUL_SUM" DataFormatString="{0:N0}"></asp:BoundField>


            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME"></asp:BoundField>
            <asp:BoundField DataField="TEAM" HeaderText="TEAM" SortExpression="TEAM"></asp:BoundField>
            <asp:BoundField DataField="COUNTRY_CODE" HeaderText="COUNTRY_CODE" SortExpression="COUNTRY_CODE"></asp:BoundField>
            <asp:BoundField DataField="LOGO" HeaderText="LOGO" SortExpression="LOGO"></asp:BoundField>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="TEAM_ID" HeaderText="TEAM_ID" SortExpression="TEAM_ID"></asp:BoundField>
            <asp:BoundField DataField="COUNTRY_ID" HeaderText="COUNTRY_ID" SortExpression="COUNTRY_ID"></asp:BoundField>

            <asp:BoundField DataField="IDOCOUNRY" HeaderText="IDOCOUNRY" ReadOnly="True" SortExpression="IDOCOUNRY"></asp:BoundField>
            <asp:BoundField DataField="IDOTEAM" HeaderText="IDOTEAM" ReadOnly="True" SortExpression="IDOTEAM"></asp:BoundField>
        </Columns>
    </asp:GridView>
    -->

    <asp:GridView ID="GridViewPoints" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="true" AllowSorting="True">
        <Columns> 
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="POINTS_PER_GAME" HeaderText="POINTS_PER_GAME" SortExpression="POINTS_PER_GAME" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="POINTS_TOTAL" HeaderText="POINTS_TOTAL" SortExpression="POINTS_TOTAL" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridViewIndex" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="INDEX_AVG" HeaderText="INDEX_AVG" SortExpression="INDEX_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="INDEX_TOTAL" HeaderText="INDEX_TOTAL" SortExpression="INDEX_TOTAL" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>           
        </Columns>
    </asp:GridView>
    <asp:Label runat="server" ID="IndexLabel" Visible="false" Font-Italic="True" ForeColor="#000066">* INDEX RATING : (Points + Rebounds + Assists + Steals + Blocks + Fouls Drawn) - (Missed Field Goals + Missed Free Throws + Turnovers + Shots Rejected + Fouls Committed).</asp:Label>


    <asp:GridView ID="GridViewMinutes" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:TemplateField HeaderText="MINUTES AVG" SortExpression="AVG_MIN_PLAYED">                
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# DateTime.Parse(Eval("AVG_MIN_PLAYED").ToString()).ToString("mm:ss") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MINUTES TOTAL" SortExpression="TOT_MIN_PLAYED">               
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# DateTime.Parse(Eval("TOT_MIN_PLAYED").ToString()).ToString("mm:ss") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>           
        </Columns>
    </asp:GridView>
    

    <asp:GridView ID="GridViewFreeThrow" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_MADE_AVG" HeaderText="FT_MADE_AVG" SortExpression="FREE_THROW_MADE_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_ATTEMPT_AVG" HeaderText="FT_ATTEMPT_AVG" SortExpression="FREE_THROW_ATTEMPT_AVG" DataFormatString="{0:0.##}"></asp:BoundField>


            <asp:BoundField DataField="FREE_THROW_MADE_TOTAL" HeaderText="FT_MADE_TOT" SortExpression="FREE_THROW_MADE_TOTAL" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="FREE_THROW_ATTEMPT_TOTAL" HeaderText="FT_ATTEMPT_TOT" SortExpression="FREE_THROW_ATTEMPT_TOTAL" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:BoundField DataField="FT" HeaderText="FT%" SortExpression="FT" DataFormatString="{0:P1}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridView2points" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_MADE_AVG" HeaderText="2P_MADE_AVG" SortExpression="2POINTS_MADE_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_ATTEMPT_AVG" HeaderText="2P_ATTEMPT_AVG" SortExpression="2POINTS_ATTEMPT_AVG" DataFormatString="{0:0.##}"></asp:BoundField>


            <asp:BoundField DataField="2POINTS_MADE_SUM" HeaderText="2P_MADE_TOT" SortExpression="2POINTS_MADE_SUM" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="2POINTS_ATTEMPT_SUM" HeaderText="2P_ATTEMPT_TOT" SortExpression="2POINTS_ATTEMPT_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:BoundField DataField="2P" HeaderText="2P%" SortExpression="2P" DataFormatString="{0:P1}" ></asp:BoundField>
          
             

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridView3points" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_MADE_AVG" HeaderText="3P_MADE_AVG" SortExpression="3POINT_MADE_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_ATTEMPT_AVG" HeaderText="3P_ATTEMPT_AVG" SortExpression="3POINT_ATTEMPT_AVG" DataFormatString="{0:0.##}"></asp:BoundField>


            <asp:BoundField DataField="3POINT_MADE_SUM" HeaderText="3P_MADE_TOT" SortExpression="3POINT_MADE_SUM" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="3POINT_ATTEMPT_SUM" HeaderText="3P_ATTEMPT_TOT" SortExpression="3POINT_ATTEMPT_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:BoundField DataField="3P" HeaderText="3P%" SortExpression="3P" DataFormatString="{0:P1}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY">
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridViewRebounds" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="TOTAL_REBOUNDS" HeaderText="TOTAL" SortExpression="TOTAL_REBOUNDS" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="TOTAL_REBOUNDS_AVG" HeaderText="TOTAL_AVG" SortExpression="TOTAL_REBOUNDS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>


            <asp:BoundField DataField="DEFENSIVE_REBOUNDS_AVG" HeaderText="DEF_AVG" SortExpression="DEFENSIVE_REBOUNDS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="OFFENSIVE_REBOUNDS_AVG" HeaderText="OFF_AVG" SortExpression="OFFENSIVE_REBOUNDS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:BoundField DataField="DEFENSIVE_REBOUNDS_SUM" HeaderText="DEF_TOTAL" SortExpression="DEFENSIVE_REBOUNDS_SUM" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="OFFENSIVE_REBOUNDS_SUM" HeaderText="OFF_TOTAL" SortExpression="OFFENSIVE_REBOUNDS_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <asp:GridView ID="GridViewAssists" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="ASSISTS_AVG" HeaderText="ASSISTS_AVG" SortExpression="DEFENSIVE_REBOUNDS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="ASSISTS_SUM" HeaderText="ASSISTS_TOTAL" SortExpression="DEFENSIVE_REBOUNDS_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridViewSteals" runat="server"  RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="STEALS_AVG" HeaderText="STEALS_AVG" SortExpression="STEALS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="STEALS_SUM" HeaderText="STEALS_TOTAL" SortExpression="STEALS_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY">
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridViewTurnovers" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>

            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="TURNOVERS_AVG" HeaderText="TURNOVERS_AVG" SortExpression="TURNOVERS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="TURNOVERS_SUM" HeaderText="TURNOVERS_TOTAL" SortExpression="TURNOVERS_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:GridView ID="GridViewFouls" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>

            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            
            <asp:BoundField DataField="FOULS_MADE_AVG" HeaderText="MADE_AVG" SortExpression="FOULS_MADE_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="FOULS_ON_AVG" HeaderText="ON_AVG" SortExpression="FOULS_ON_AVG" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:BoundField DataField="FOULS_MADE_SUM" HeaderText="MADE_TOTAL" SortExpression="FOULS_MADE_SUM" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="FOULS_ON_SUM" HeaderText="ON_TOTAL" SortExpression="FOULS_ON_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY" >
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

     <asp:GridView ID="GridViewBlocks" runat="server" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID,IDOCOUNRY,IDOTEAM" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Visible="false">
        <Columns>

            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField> 

            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" />
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" DataFormatString="{0:0.##}"></asp:BoundField>
            
            <asp:BoundField DataField="BLOCKS_MADE_AVG" HeaderText="MADE_AVG" SortExpression="BLOCKS_MADE_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="BLOCKS_SUFFERED_AVG" HeaderText="SUFFERED_AVG" SortExpression="BLOCKS_SUFFERED_AVG" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:BoundField DataField="BLOCKS_MADE_SUM" HeaderText="MADE_TOTAL" SortExpression="BLOCKS_MADE_SUM" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="BLOCKS_SUFFERED_SUM" HeaderText="SUFFERED_TOTAL" SortExpression="BLOCKS_SUFFERED_SUM" DataFormatString="{0:0.##}"></asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
            <asp:TemplateField HeaderText="COUNTRY">
                <ItemTemplate>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SURNAME + ' ' + FIRSTNAME AS PLAYER, ISNULL(DEFENSIVE_REBOUNDS_SUM, 0) + ISNULL(OFFENSIVE_REBOUNDS_SUM, 0) AS TOTAL_REBOUNDS, CAST(FREE_THROW_MADE_TOTAL AS DECIMAL) / NULLIF (FREE_THROW_ATTEMPT_TOTAL, 0) AS FT,CAST([2POINTS_MADE_SUM] AS DECIMAL) / NULLIF([2POINTS_ATTEMPT_SUM], 0) AS [2P], CAST([3POINT_MADE_SUM] AS DECIMAL) / NULLIF ([3POINT_ATTEMPT_SUM], 0) AS [3P], 1.00 * (DEFENSIVE_REBOUNDS_SUM + OFFENSIVE_REBOUNDS_SUM) / NULLIF (GAMES_PLAYED, 0) AS TOTAL_REBOUNDS_AVG, POINTS_PER_GAME, POINTS_TOTAL, GAMES_PLAYED, FREE_THROW_MADE_AVG, FREE_THROW_MADE_TOTAL, FREE_THROW_ATTEMPT_AVG, FREE_THROW_ATTEMPT_TOTAL, [2POINTS_MADE_SUM], [2POINTS_ATTEMPT_SUM], [2POINTS_MADE_AVG], [2POINTS_ATTEMPT_AVG], [3POINT_MADE_SUM], [3POINT_ATTEMPT_SUM], [3POINT_MADE_AVG], [3POINT_ATTEMPT_AVG], DEFENSIVE_REBOUNDS_SUM, DEFENSIVE_REBOUNDS_AVG, ASSISTS_SUM, ASSISTS_AVG, OFFENSIVE_REBOUNDS_SUM, OFFENSIVE_REBOUNDS_AVG, FOULS_MADE_SUM, FOULS_MADE_AVG, FOULS_ON_SUM, FOULS_ON_AVG, TURNOVERS_SUM, TURNOVERS_AVG, STEALS_SUM, STEALS_AVG, BLOCKS_MADE_SUM, BLOCKS_MADE_AVG, BLOCKS_SUFFERED_SUM, BLOCKS_SUFFERED_AVG, UNSPORTSMAN_FOUL_SUM, UNSPORTSMAN_FOUL_AVG, ID, SURNAME, FIRSTNAME, TEAM_ID, COUNTRY_ID, COUNTRY_CODE, NAME, TEAM, LOGO, IDOCOUNRY, IDOTEAM FROM View_STATISTICS"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SURNAME + ' ' + FIRSTNAME AS PLAYER, INDEX_TOTAL, GAMES_PLAYED, INDEX_AVG, ID, SURNAME, FIRSTNAME, TEAM_ID, COUNTRY_ID, COUNTRY_CODE, NAME, TEAM, LOGO, IDOCOUNRY, IDOTEAM, TOTAL_MIN_PLAYED AS TOTAL_SECONDS_PLAYED, AVG_MIN_PLAYED AS AVG_SECONDS_PLAYED, CONVERT (TIME, DATEADD(ms, TOTAL_MIN_PLAYED * 1000, 0)) AS TOT_MIN_PLAYED, CONVERT (TIME, DATEADD(ms, AVG_MIN_PLAYED * 1000, 0)) AS AVG_MIN_PLAYED FROM View_INDEX_TOTAL"></asp:SqlDataSource>

</asp:Content>

