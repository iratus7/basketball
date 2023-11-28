<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Players.aspx.cs" Inherits="Players" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="GridContent">
        <div class="GridTeam">
    <asp:DetailsView ID="DetailsViewPlayers" runat="server" DataSourceID="SqlDataSource1" AutoGenerateRows="False" CssClass="cssdetailsview" HeaderStyle-CssClass="header"
        FieldHeaderStyle-CssClass="fieldheader"
        ItemStyle-CssClass="item"
        AlternatingRowStyle-CssClass="altrow">
        <Fields>
            <asp:TemplateField SortExpression="IMAGE" ShowHeader="False">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("IMAGE_TEAM") %>' />
                    <asp:Image ID="Image_Player" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' />
                    <!--<tr >
                        <td colspan="2">
                            <asp:Image ID="LogoTeam" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("IMAGE_TEAM") %>' /><asp:Image ID="ImagePlayer" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' />
                        </td>
                    </tr>-->

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NO" SortExpression="NO">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("NO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SURNAME" SortExpression="SURNAME">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SURNAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FIRSTNAME" SortExpression="FIRSTNAME">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("FIRSTNAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="POSITION" SortExpression="POSITION">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("POSITION") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="HEIGHT" SortExpression="HEIGHT">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("HEIGHT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BORN" SortExpression="BORN">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("BORN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="COUNTRY" SortExpression="IMAGE_COUNTRY">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("COUNTRY") %>'></asp:Label>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("IMAGE_COUNTRY") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="IDOTEAM" DataNavigateUrlFormatString="Teams.aspx?ID={0}" DataTextField="TEAM" HeaderText="TEAM" />
        </Fields>
    </asp:DetailsView>
            </div>
        <div class="GridTeamDetails">            
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceChart" CssClass="ChartPlayer" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartBack.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="Series1" XValueMember="AGONISTIKI" ToolTip="INDEX RATING" Color="Red" LabelForeColor="WhiteSmoke" IsVisibleInLegend="true" LegendText="INDEX RATING" YValueMembers="INDEX_TOTAL" ChartType="Line" IsValueShownAsLabel="true" MarkerBorderColor="#000099" MarkerColor="#CCFFFF" MarkerSize="6" MarkerStyle="Star5"></asp:Series>
                    <asp:Series Name="Series2" XValueMember="AGONISTIKI" ToolTip="SCORING POINTS" Color="LawnGreen" YValueMembers="POINTS" LabelForeColor="WhiteSmoke" LegendText="SCORING POINTS" ChartType="Line" IsValueShownAsLabel="true" MarkerBorderColor="#000099" MarkerColor="#CCFFFF" MarkerSize="6" MarkerStyle="Star5"></asp:Series>
                
                <asp:Series Name="Series3" ChartType="Line" Color="DarkBlue" LabelForeColor="WhiteSmoke" ToolTip="PLAYER AVERAGE" IsValueShownAsLabel="true"  MarkerBorderColor="#000099" MarkerColor="Yellow" MarkerSize="6" LegendText="PLAYER AVERAGE" MarkerStyle="Star5" LabelFormat="0.#"></asp:Series>
                <asp:Series Name="Series4" ChartType="Line" Color="Purple" LabelForeColor="WhiteSmoke" IsValueShownAsLabel="true" ToolTip="LEAGUE AVERAGE"  MarkerBorderColor="#000099" MarkerColor="Yellow" MarkerSize="6" LegendText="LEAGUE AVERAGE" MarkerStyle="Star5"></asp:Series>

                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="#6081c5"><AxisX Title="ΑΓΩΝΙΣΤΙΚΗ" TitleForeColor="DarkBlue" LineColor="Navy" LineDashStyle="DashDotDot" LineWidth="3" TextOrientation="Horizontal" TitleAlignment="Center"></AxisX>
                    <AxisY TextOrientation="Stacked" Title="ΑΠΟΔΟΣΗ" TitleForeColor="DarkBlue" LineColor="Navy" LineDashStyle="DashDotDot" LineWidth="3" TitleAlignment="Center"></AxisY></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="ΑΞΙΟΛΟΓΗΣΗ" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>
            </asp:Chart>
            </div>
        </div>
<table border="2" cellpadding="0" cellspacing="0" style="vertical-align:bottom">
       
            <tr>

                <td>
    <asp:GridView ID="GridView1" runat="server" Width="400px" AutoGenerateColumns="False" DataKeyNames="PLAYER_ID" DataSourceID="SqlDataSource2" EmptyDataText="Δεν Υπάρχουν Δεδομένα Γι'αυτά Τα Πεδία Αναζήτησης..." CellPadding="4" ForeColor="#333333" GridLines="None" RowStyle-HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>            
           <asp:TemplateField>
               <ItemTemplate>
                   <asp:Label ID="StatsLabelTotal" runat="server" Text="Average"></asp:Label>
                              </ItemTemplate>
               <alternatingitemtemplate>
                   <asp:Label ID="StatsLabelAverage" runat="server" Text="Total"></asp:Label>
                   </alternatingitemtemplate>
           </asp:TemplateField>
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED" />
            <asp:TemplateField HeaderText="M" SortExpression="MIN_PLAYED">                
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# DateTime.Parse(Eval("MIN_PLAYED").ToString()).ToString("mm:ss") %>' ID="Labelmin"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="P" SortExpression="POINTS">                
                <ItemTemplate>                  
                     <asp:Label runat="server" Text='<%# Eval("POINTS","{0:0.##}") %>' ID="Label4"></asp:Label>                     
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FT" SortExpression="FREE_THROW_MADE">                
                <ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Eval("FREE_THROW_MADE", "{0:0.##}") + "/" + Eval("FREE_THROW_ATTEMPT", "{0:0.##}") %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="2P" SortExpression="2POINTS_MADE">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("2POINTS_MADE", "{0:0.##}") + "/" + Eval("2POINTS_ATTEMPT", "{0:0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="3P" SortExpression="3POINT_MADE">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("3POINT_MADE", "{0:0.##}") + "/" + Eval("3POINT_ATTEMPT", "{0:0.##}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DEFENSIVE_REBOUNDS"  DataFormatString="{0:0.##}" HeaderText="DR" SortExpression="DEFENSIVE_REBOUNDS" />
            <asp:BoundField DataField="OFFENSIVE_REBOUNDS"  DataFormatString="{0:0.##}" HeaderText="OR" SortExpression="OFFENSIVE_REBOUNDS" />
            <asp:BoundField DataField="ASSISTS" DataFormatString="{0:0.##}" HeaderText="AS" SortExpression="ASSISTS" />
            <asp:BoundField DataField="FOULS_MADE" DataFormatString="{0:0.##}" HeaderText="FM" SortExpression="FOULS_MADE" />
            <asp:BoundField DataField="FOULS_ON" DataFormatString="{0:0.##}" HeaderText="FO" SortExpression="FOULS_ON" />
            <asp:BoundField DataField="TURNOVERS" DataFormatString="{0:0.##}" HeaderText="TUR" SortExpression="TURNOVERS" />
            <asp:BoundField DataField="STEALS" DataFormatString="{0:0.##}" HeaderText="ST" SortExpression="STEALS" />
            <asp:BoundField DataField="BLOCKS_MADE" DataFormatString="{0:0.##}" HeaderText="BLM" SortExpression="BLOCKS_MADE" />
            <asp:BoundField DataField="BLOCKS_SUFFERED" DataFormatString="{0:0.##}" HeaderText="BLS" SortExpression="BLOCKS_SUFFERED" />
            <asp:BoundField DataField="UNSPORTSMAN_FOUL" DataFormatString="{0:0.##}" HeaderText="UNF" SortExpression="UNSPORTSMAN_FOUL" />
            <asp:BoundField DataField="INDEX_TOTAL" DataFormatString="{0:0.##}" HeaderText="IND" SortExpression="INDEX_TOTAL" />

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
                      </td>
                </tr>
                   <tr> 
                     <td rowspan="4" style="color:#053387;"><strong>GP:</strong> Games Played, <strong>M:</strong> Minutes Played, <strong>P:</strong> Points, <strong>FT:</strong> Free Throws, <strong>2P:</strong> Two Points<br />
                     <strong>3P:</strong> Three Points, <strong>DB</strong> Defensive Rebounds, <strong>OF:</strong> Offensive Rebounds, <strong>FM:</strong> Fouls Made<br />
                     <strong>FO:</strong> Fouls ON, <strong>TUR:</strong> Turnovers, <strong>ST:</strong> Steals, <strong>BLM:</strong> Blocks Made<br />
                     <strong>BLS:</strong> Blocks Suffered, <strong>UNF:</strong> Unsportsman Foul, <strong>AS:</strong>Assists, <strong>IND:</strong>Inex Rating</td>
                </tr>  
       </table>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT DISTINCT POINTS_PER_GAME.PLAYER_ID, POINTS_PER_GAME.POINTS, POINTS_PER_GAME.GAMES_PLAYED, POINTS_PER_GAME.FREE_THROW_MADE, POINTS_PER_GAME.FREE_THROW_ATTEMPT, POINTS_PER_GAME.[2POINTS_MADE], POINTS_PER_GAME.[2POINTS_ATTEMPT], POINTS_PER_GAME.[3POINT_MADE], POINTS_PER_GAME.[3POINT_ATTEMPT], POINTS_PER_GAME.DEFENSIVE_REBOUNDS, POINTS_PER_GAME.OFFENSIVE_REBOUNDS, POINTS_PER_GAME.ASSISTS, POINTS_PER_GAME.FOULS_MADE, POINTS_PER_GAME.FOULS_ON, POINTS_PER_GAME.TURNOVERS, POINTS_PER_GAME.STEALS, POINTS_PER_GAME.BLOCKS_MADE, POINTS_PER_GAME.BLOCKS_SUFFERED, POINTS_PER_GAME.UNSPORTSMAN_FOUL, POINTS_PER_GAME.INDEX_TOTAL, POINTS_PER_GAME.MINUTES_PLAYED AS SECONDS_PLAYED, CONVERT (TIME, DATEADD(ms, POINTS_PER_GAME.MINUTES_PLAYED * 1000, 0)) AS MIN_PLAYED FROM PLAYERS INNER JOIN [STATISTICS] ON PLAYERS.ID = [STATISTICS].PLAYER_ID CROSS JOIN POINTS_PER_GAME WHERE (POINTS_PER_GAME.PLAYER_ID = @ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT PLAYERS.ID, PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.POSITION, PLAYERS.TEAM_ID, PLAYERS.COUNTRY_ID, PLAYERS.HEIGHT, PLAYERS.BORN, PLAYERS.IMAGE, COUNTRY.NAME AS COUNTRY, COUNTRY.COUNTRY_CODE AS IMAGE_COUNTRY, COUNTRY.ID AS ID0COUNTRY, TEAMS.ID AS IDOTEAM, TEAMS.NAME AS TEAM, TEAMS.LOGO AS IMAGE_TEAM FROM PLAYERS INNER JOIN COUNTRY ON PLAYERS.COUNTRY_ID = COUNTRY.ID INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID WHERE (PLAYERS.ID = @ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceChart" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT View_STATISTICS_BY_GAME.INDEX_TOTAL, GAMES.AGONISTIKI, GAMES.DATE_TIME, View_STATISTICS_BY_GAME.POINTS FROM View_STATISTICS_BY_GAME INNER JOIN GAMES ON View_STATISTICS_BY_GAME.GAME_ID = GAMES.ID WHERE (View_STATISTICS_BY_GAME.PLAYER_ID = @ID) ORDER BY GAMES.AGONISTIKI">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

