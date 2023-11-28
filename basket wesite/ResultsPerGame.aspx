<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="ResultsPerGame.aspx.cs" Inherits="ResultsPerGame" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/AjaxTabs.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Game Statistics</h2>                            


    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div style="width: 80%; margin: 0 auto;">
        
        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="Tab" >
            <ajaxToolkit:TabPanel ID="TabPanel4" HeaderText="PREVIEW" runat="server" >
        <contenttemplate>                   
            <asp:FormView ID="FormViewPreviewHome" runat="server" DataSourceID="SqlDataSourcePreviewH" DataKeyNames="ID">
                <ItemTemplate>
                    <section>
                        <article>
                            <table class="PreviewTable">
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("COACH_ID", "Coaches.aspx?ID={0}") %>'>
                                        <asp:Image ID="ImageCoach" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/coaches/" + Eval("IMAGE") %>' /><br />
                                        <asp:Label Text='<%# Eval("SURENAME") + " " + Eval("FIRST_NAME") %>' runat="server" ID="Label17" /></asp:HyperLink></td><td><strong>HOME HEAD COACH:</strong><br /> <asp:Label Text='<%# Eval("HOME_COACH_COMMENT") %>' runat="server" ID="HOME_COACH_COMMENTLabel" /></td>
                                    <asp:Repeater ID="RepeaterPr" runat="server" DataSourceID="SqlDataSourcePreviewA">
                                        <ItemTemplate>
                                            <td>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("COACH_ID", "Coaches.aspx?ID={0}") %>'>
                                                <asp:Image ID="Image1" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/coaches/" + Eval("IMAGE") %>' /><br />
                                                <asp:Label Text='<%# Eval("SURENAME") + " " + Eval("FIRST_NAME") %>' runat="server" ID="Label18" /></asp:HyperLink></td><td><strong>HEAD COACH:</strong><br /> <asp:Label Text='<%# Eval("AWAY_COACH_COMMENT") %>' runat="server" ID="Label19" /></td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="PlayerComHome" runat="server" NavigateUrl='<%# Eval("PLAYER_ID", "Players.aspx?ID={0}") %>'>                                        
                                        <asp:Image ID="Image_Player" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("PLAYER_IMAGE") %>' /><br />
                                        <asp:Label Text='<%# Eval("SURNAME") + " " + Eval("FIRSTNAME") %>' runat="server" ID="Label18" /></asp:HyperLink></td><td><strong>HOME PLAYER COMMENT:</strong><br /> <asp:Label Text='<%# Eval("HOME_PLAYER_COMMENT") %>' runat="server" ID="HOME_PLAYER_COMMENTLabel" />
                                    </td>
                                    
                                    <asp:Repeater ID="RepeaterPra" runat="server" DataSourceID="SqlDataSourcePreviewA">
                                        <ItemTemplate>
                                            <td>
                                            <asp:HyperLink ID="PlayerComAway" runat="server" NavigateUrl='<%# Eval("PLAYER_ID", "Players.aspx?ID={0}") %>'>                                             
                                            <asp:Image ID="Image_Player" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("PLAYER_IMAGE") %>' /><br />
                                            <asp:Label Text='<%# Eval("SURNAME") + " " + Eval("FIRSTNAME") %>' runat="server" ID="Label20" />
                                                </asp:HyperLink></td><td><strong>AWAY PLAYER COMMENT:</strong><br /> <asp:Label Text='<%# Eval("AWAY_PLAYER_COMMENT") %>' runat="server" ID="AWAY_PLAYER_COMMENTLabel" /></td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                            </table>
                        </article>
                    </section>
                </ItemTemplate>
            </asp:FormView>
                    <asp:FormView ID="FormViewPreview_stats" runat="server" DataSourceID="SqlDataSourceAVGh">
                      <ItemTemplate><section><article>
                           <table style="text-align:center">
                               <tr>
    <td><asp:Image ID="LogoH" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' /><br /><asp:Label Text='<%# Eval("TEAM") %>' runat="server" ID="Label15" /></td>
    <td><strong>AVERAGE<br />STATS</strong></td><td><asp:Repeater ID="RepeaterATEAM" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Image ID="LogoA" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' /><br /><asp:Label ID="Label16" runat="server" Text='<%# Eval("TEAM")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("P", "{0:0.#}") %>' runat="server" ID="PLabel" /></td>
    <td>POINTS</td><td><asp:Repeater ID="RepeaterP" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("P", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("FTM") + "/" + Eval("FTA") + " " + Eval("FTP", "{0:P1}")%>' runat="server" ID="Label4" /></td>
    <td>FREE THROWS</td><td><asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("FTM") + "/" + Eval("[FTA]")+ " " + Eval("[FTP]", "{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("[2PM]") + "/" + Eval("[2PA]") + " " + Eval("[2PP]", "{0:P1}") %>' runat="server" ID="Label5" /></td>
    <td>2POINTS</td><td><asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("[2PM]") + "/" + Eval("[2PA]")+ " " + Eval("[2PP]", "{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("[3PM]") + "/" + Eval("[3PA]") + " " + Eval("[3PP]", "{0:P1}") %>' runat="server" ID="Label6" /></td>
    <td>3POINTS</td><td><asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("[3PM]") + "/" + Eval("[3PA]")+ " " + Eval("[3PP]", "{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("R", "{0:0.#}") %>' runat="server" ID="Label7" /></td>
    <td>REBOUNDS</td><td><asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("R", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("DR", "{0:0.#}") %>' runat="server" ID="Label8" /></td>
    <td>OFFENSIVE R.</td><td><asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("DR", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("ORB", "{0:0.#}") %>' runat="server" ID="Label9" /></td>
    <td>DEFENSIVE R.</td><td><asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("ORB", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("A", "{0:0.#}") %>' runat="server" ID="Label10" /></td>
    <td>ASSISTS</td><td><asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("A", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("ST", "{0:0.#}") %>' runat="server" ID="Label11" /></td>
    <td>STEALS</td><td><asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("ST", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("T", "{0:0.#}") %>' runat="server" ID="Label12" /></td>
    <td>TURNOVERS</td><td><asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("T", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("BL", "{0:0.#}") %>' runat="server" ID="Label13" /></td>
    <td>BLOCKS</td><td><asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("BL", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr><tr>
    <td><asp:Label Text='<%# Eval("IND", "{0:0.#}") %>' runat="server" ID="Label14" /></td>
    <td>INDEX RATING</td><td><asp:Repeater ID="Repeater12" runat="server" DataSourceID="SqlDataSourceAVGa"><ItemTemplate><asp:Label ID="Label16" runat="server" Text='<%# Eval("IND", "{0:0.#}")%>'></asp:Label></ItemTemplate></asp:Repeater></td></tr></table></article></section></ItemTemplate></asp:FormView><asp:SqlDataSource ID="SqlDataSourcePreviewH" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT REPORT.HOME_COACH_COMMENT, REPORT.HOME_PLAYER_COMMENT, COACH.SURENAME, COACH.FIRST_NAME, GAMES.ID, COACH.IMAGE, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.IMAGE AS PLAYER_IMAGE, PLAYERS.ID AS PLAYER_ID, COACH.ID AS COACH_ID FROM REPORT INNER JOIN GAMES ON REPORT.GAME_ID = GAMES.ID INNER JOIN COACH ON GAMES.HOME_TEAM_COACH_ID = COACH.ID INNER JOIN PLAYERS ON REPORT.HOME_PLAYER_ID = PLAYERS.ID WHERE (GAMES.ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourcePreviewA" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT REPORT.AWAY_COACH_COMMENT, REPORT.AWAY_PLAYER_COMMENT, COACH.SURENAME, COACH.FIRST_NAME, GAMES.ID, COACH.IMAGE, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.IMAGE AS PLAYER_IMAGE, PLAYERS.ID AS PLAYER_ID, COACH.ID AS COACH_ID FROM REPORT INNER JOIN GAMES ON REPORT.GAME_ID = GAMES.ID INNER JOIN COACH ON GAMES.AWAY_TEAM_COACH_ID = COACH.ID INNER JOIN PLAYERS ON REPORT.AWAY_PLAYER_ID = PLAYERS.ID WHERE (GAMES.ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAVGh" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(VS.POINTS_TOTAL) / GP.GAMES_PLAYED AS P, SUM(VS.FREE_THROW_MADE_TOTAL) AS FTM, SUM(VS.FREE_THROW_ATTEMPT_TOTAL) AS FTA, SUM(CAST(VS.FREE_THROW_MADE_TOTAL AS DECIMAL)) / SUM(NULLIF (VS.FREE_THROW_ATTEMPT_TOTAL, 0)) AS FTP, SUM(VS.[2POINTS_MADE_SUM]) AS [2PM], SUM(VS.[2POINTS_ATTEMPT_SUM]) AS [2PA], SUM(CAST(VS.[2POINTS_MADE_SUM] AS DECIMAL)) / SUM(NULLIF (VS.[2POINTS_ATTEMPT_SUM], 0)) AS [2PP], SUM(VS.[3POINT_MADE_SUM]) AS [3PM], SUM(VS.[3POINT_ATTEMPT_SUM]) AS [3PA], SUM(CAST(VS.[3POINT_MADE_SUM] AS DECIMAL)) / SUM(NULLIF (VS.[3POINT_ATTEMPT_SUM], 0)) AS [3PP], SUM(CAST(VS.DEFENSIVE_REBOUNDS_SUM AS DECIMAL) + CAST(VS.OFFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS R, SUM(CAST(VS.DEFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS DR, SUM(CAST(VS.OFFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS ORB, SUM(CAST(VS.ASSISTS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS A, SUM(CAST(VS.STEALS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS ST, SUM(CAST(VS.BLOCKS_MADE_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS BL, SUM(CAST(VS.TURNOVERS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS T, SUM(CAST(VS.INDEX_TOTAL AS DECIMAL)) / GP.GAMES_PLAYED AS IND, GP.GAMES_PLAYED, VS.TEAM, VS.LOGO FROM View_STATISTICS AS VS INNER JOIN GAMES AS G ON VS.TEAM_ID = G.HOME_TEAM_ID INNER JOIN GAMES_PLAYED_BY_TEAM_ID AS GP ON G.HOME_TEAM_ID = GP.TEAM_ID GROUP BY VS.TEAM, VS.TEAM_ID, G.ID, VS.LOGO, GP.GAMES_PLAYED HAVING (G.ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAVGa" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(VS.POINTS_TOTAL) / GP.GAMES_PLAYED AS P, SUM(VS.FREE_THROW_MADE_TOTAL) AS FTM, SUM(VS.FREE_THROW_ATTEMPT_TOTAL) AS FTA, SUM(CAST(VS.FREE_THROW_MADE_TOTAL AS DECIMAL)) / SUM(NULLIF (VS.FREE_THROW_ATTEMPT_TOTAL, 0)) AS FTP, SUM(VS.[2POINTS_MADE_SUM]) AS [2PM], SUM(VS.[2POINTS_ATTEMPT_SUM]) AS [2PA], SUM(CAST(VS.[2POINTS_MADE_SUM] AS DECIMAL)) / SUM(NULLIF (VS.[2POINTS_ATTEMPT_SUM], 0)) AS [2PP], SUM(VS.[3POINT_MADE_SUM]) AS [3PM], SUM(VS.[3POINT_ATTEMPT_SUM]) AS [3PA], SUM(CAST(VS.[3POINT_MADE_SUM] AS DECIMAL)) / SUM(NULLIF (VS.[3POINT_ATTEMPT_SUM], 0)) AS [3PP], SUM(CAST(VS.DEFENSIVE_REBOUNDS_SUM AS DECIMAL) + CAST(VS.OFFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS R, SUM(CAST(VS.DEFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS DR, SUM(CAST(VS.OFFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS ORB, SUM(CAST(VS.ASSISTS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS A, SUM(CAST(VS.STEALS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS ST, SUM(CAST(VS.BLOCKS_MADE_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS BL, SUM(CAST(VS.TURNOVERS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS T, SUM(CAST(VS.INDEX_TOTAL AS DECIMAL)) / GP.GAMES_PLAYED AS IND, GP.GAMES_PLAYED, VS.TEAM, VS.LOGO FROM View_STATISTICS AS VS INNER JOIN GAMES AS G ON VS.TEAM_ID = G.AWAY_TEAM_ID INNER JOIN GAMES_PLAYED_BY_TEAM_ID AS GP ON G.AWAY_TEAM_ID = GP.TEAM_ID GROUP BY VS.TEAM, VS.TEAM_ID, G.ID, VS.LOGO, GP.GAMES_PLAYED HAVING (G.ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </contenttemplate>
            </ajaxToolkit:TabPanel>

            <ajaxToolkit:TabPanel ID="TabPanel1" HeaderText="BOXSCORE" runat="server">
                <ContentTemplate>

                    <table cellpadding="0" cellspacing="0">
                                      
                        <tr>
                            <td>
                                <asp:FormView ID="FormViewHome" runat="server" DataSourceID="SqlDataSourceHomeTeam">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td style="text-align: left">
                                                    <h3>HOME: <asp:Label ID="HomeTeamLabel" runat="server" Text='<%# Eval("HOME_TEAM") %>' /></h3>
                                                </td>
                                                <td>
                                                    <asp:Image ID="LogoTeam" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' />
                                                </td>
                                                <td>
                                                    <h3>HEAD COACH:<asp:Label ID="HomeCoachLabel" runat="server" Text='<%# Eval("HOME_COACH") %>' /></h3>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:GridView ID="GridViewHomeTeamStats" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="true" FooterStyle-BorderStyle="Groove" FooterStyle-BackColor="SteelBlue" HeaderStyle-BorderColor="Black" FooterStyle-BorderColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSourceHomeTeam" ShowFooter="True" OnRowDataBound="GridViewHomeTeamStats_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="PLAYER_NO" HeaderText="NO" SortExpression="PLAYER_NO" FooterText="#"></asp:BoundField>
                                        <asp:HyperLinkField DataNavigateUrlFields="PLAYER_ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" FooterText="HOME TOTAL" />
                                        <asp:TemplateField HeaderText="M" SortExpression="MINUTES_PLAYED">                                            
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# DateTime.Parse(Eval("MINUTES_PLAYED").ToString()).ToString("mm:ss") %>' ID="Label4"></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="RepeaterMp" runat="server" DataSourceID="SqlDataSourceHomePercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelMp" runat="server" Text='<%# ((Convert.ToInt16(Eval("MP"))*60)+ Convert.ToInt16(Eval("SP")))/60+":"+((Convert.ToInt16(Eval("MP"))*60)+ Convert.ToInt16(Eval("SP")))%60 %>'></asp:Label><br /></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:BoundField DataField="POINTS" HeaderText="P" ReadOnly="True" SortExpression="POINTS"></asp:BoundField>
                                        <asp:TemplateField HeaderText="FT" SortExpression="FREE_THROW_MADE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FREE_THROW_MADE") + "/" + Eval("FREE_THROW_ATTEMPT") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="Repeater1p" runat="server" DataSourceID="SqlDataSourceHomePercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1P" runat="server" Text='<%# Eval("FREE_THROW_MADE_SUM") + "/" + Eval("FREE_THROW_ATTEMPT_SUM") %>'></asp:Label><br /><asp:Label ID="FtPer" runat="server" Text='<%# Eval("[FT_PERCENTAGE]","{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:TemplateField HeaderText="2P" SortExpression="2POINTS_MADE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("2POINTS_MADE") + "/" + Eval("2POINTS_ATTEMPT") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="Repeater2p" runat="server" DataSourceID="SqlDataSourceHomePercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2P" runat="server" Text='<%# Eval("2POINTS_MADE_SUM") + "/" + Eval("2POINTS_ATTEMPT_SUM") %>'></asp:Label><br /><asp:Label ID="TowpPer" runat="server" Text='<%# Eval("[2P_PERCENTAGE]","{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:TemplateField HeaderText="3P" SortExpression="3POINT_MADE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("3POINT_MADE") + "/" + Eval("3POINT_ATTEMPT") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="Repeater3p" runat="server" DataSourceID="SqlDataSourceHomePercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3P" runat="server" Text='<%# Eval("3POINT_MADE_SUM") + "/" + Eval("3POINT_ATTEMPT_SUM") %>'></asp:Label><br /><asp:Label ID="ThreepPer" runat="server" Text='<%# Eval("[3P_PERCENTAGE]","{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:BoundField DataField="DEFENSIVE_REBOUNDS" HeaderText="DR" ReadOnly="True" SortExpression="DEFENSIVE_REBOUNDS"></asp:BoundField>
                                        <asp:BoundField DataField="OFFENSIVE_REBOUNDS" HeaderText="OR" ReadOnly="True" SortExpression="OFFENSIVE_REBOUNDS"></asp:BoundField>
                                        <asp:BoundField DataField="TOTAL_REBOUNDS" HeaderText="TR" ReadOnly="True" SortExpression="TOTAL_REBOUNDS"></asp:BoundField>
                                        <asp:BoundField DataField="ASSISTS" HeaderText="AS" ReadOnly="True" SortExpression="ASSISTS"></asp:BoundField>
                                        <asp:BoundField DataField="FOULS_MADE" HeaderText="FM" ReadOnly="True" SortExpression="FOULS_MADE"></asp:BoundField>
                                        <asp:BoundField DataField="FOULS_ON" HeaderText="FO" ReadOnly="True" SortExpression="FOULS_ON"></asp:BoundField>
                                        <asp:BoundField DataField="TURNOVERS" HeaderText="TUR" ReadOnly="True" SortExpression="TURNOVERS"></asp:BoundField>
                                        <asp:BoundField DataField="STEALS" HeaderText="ST" ReadOnly="True" SortExpression="STEALS"></asp:BoundField>
                                        <asp:BoundField DataField="BLOCKS_MADE" HeaderText="BLM" ReadOnly="True" SortExpression="BLOCKS_MADE"></asp:BoundField>
                                        <asp:BoundField DataField="BLOCKS_SUFFERED" HeaderText="BLS" ReadOnly="True" SortExpression="BLOCKS_SUFFERED"></asp:BoundField>
                                        <asp:BoundField DataField="UNSPORTSMAN_FOUL" HeaderText="UNF" ReadOnly="True" SortExpression="UNSPORTSMAN_FOUL"></asp:BoundField>
                                        <asp:BoundField DataField="INDEX_TOTAL" HeaderText="IND" ReadOnly="True" SortExpression="INDEX_TOTAL" DataFormatString="{0:0.##}"></asp:BoundField>
                                        
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>

                        <tr><td>
                            <asp:GridView ID="GridViewHomeStats" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSourceHomeTeamStats" ShowFooter="false">
                                    <Columns>
                                      <asp:BoundField DataField="TIMEOUT" HeaderText="TIMEOUTS" ReadOnly="True" SortExpression="TIMEOUTS" DataFormatString="{0:0.##}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="FASTBREAKS" SortExpression="FASTBREAKS">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("FASTBREAK_MADE") + "/" + Eval("FASTBREAK_ATTEMPT")  %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr></table><table>
                       
                                                    <tr><td><asp:GridView ID="GridView1" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black"></asp:GridView>
                        </td></tr>  
                         <br /><tr><td><asp:GridView ID="GridViewQScores" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black"></asp:GridView>
                        </td></tr>                                                                                                                                                                                                                               </table><table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:FormView ID="FormViewAway" runat="server" DataSourceID="SqlDataSourceAwayTeam">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td style="text-align: left">
                                                    <h3>AWAY: <asp:Label ID="AwayTeamLabel" runat="server" Text='<%# Eval("AWAY_TEAM") %>' /></h3>
                                                </td>
                                                <td>
                                                    <asp:Image ID="LogoTeam" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' />
                                                </td>
                                                <td>
                                                    <h3>HEAD COACH: <asp:Label ID="AwayCoachLabel" runat="server" Text='<%# Eval("AWAY_COACH") %>' /></h3>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridViewAwayTeamStats" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" FooterStyle-HorizontalAlign="Center" FooterStyle-Font-Bold="true" FooterStyle-BorderStyle="Groove" FooterStyle-BackColor="SteelBlue" HeaderStyle-BorderColor="Black" FooterStyle-BorderColor="Black" AutoGenerateColumns="False" ShowFooter="True" DataSourceID="SqlDataSourceAwayTeam" OnRowDataBound="GridViewAwayTeamStats_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="PLAYER_NO" HeaderText="NO" SortExpression="PLAYER_NO" FooterText="#"></asp:BoundField>
                                        <asp:HyperLinkField DataNavigateUrlFields="PLAYER_ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="PLAYER" HeaderText="PLAYER" FooterText="AWAY TOTAL" />
                                        <asp:TemplateField HeaderText="M" SortExpression="MINUTES_PLAYED">                                            
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# DateTime.Parse(Eval("MINUTES_PLAYED").ToString()).ToString("mm:ss") %>' ID="Label4"></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="RepeaterMpA" runat="server" DataSourceID="SqlDataSourceAwayPercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelMpA" runat="server" Text='<%# ((Convert.ToInt16(Eval("MP"))*60)+ Convert.ToInt16(Eval("SP")))/60+":"+((Convert.ToInt16(Eval("MP"))*60)+ Convert.ToInt16(Eval("SP")))%60 %>'></asp:Label><br /></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:BoundField DataField="POINTS" HeaderText="P" ReadOnly="True" SortExpression="POINTS"></asp:BoundField>
                                        <asp:TemplateField HeaderText="FT" SortExpression="FREE_THROW_MADE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FREE_THROW_MADE") + "/" + Eval("FREE_THROW_ATTEMPT") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="Repeater1p" runat="server" DataSourceID="SqlDataSourceAwayPercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1P" runat="server" Text='<%# Eval("FREE_THROW_MADE_SUM") + "/" + Eval("FREE_THROW_ATTEMPT_SUM") %>'></asp:Label><br /><asp:Label ID="FtPer" runat="server" Text='<%# Eval("[FT_PERCENTAGE]","{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:TemplateField HeaderText="2P" SortExpression="2POINTS_MADE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("2POINTS_MADE") + "/" + Eval("2POINTS_ATTEMPT") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="Repeater2p" runat="server" DataSourceID="SqlDataSourceAwayPercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2P" runat="server" Text='<%# Eval("2POINTS_MADE_SUM") + "/" + Eval("2POINTS_ATTEMPT_SUM") %>'></asp:Label><br /><asp:Label ID="TowpPer" runat="server" Text='<%# Eval("[2P_PERCENTAGE]","{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:TemplateField HeaderText="3P" SortExpression="3POINT_MADE">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("3POINT_MADE") + "/" + Eval("3POINT_ATTEMPT") %>'></asp:Label></ItemTemplate><FooterTemplate>
                                                <asp:Repeater ID="Repeater3p" runat="server" DataSourceID="SqlDataSourceAwayPercentage">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3P" runat="server" Text='<%# Eval("3POINT_MADE_SUM") + "/" + Eval("3POINT_ATTEMPT_SUM") %>'></asp:Label><br /><asp:Label ID="ThreepPer" runat="server" Text='<%# Eval("[3P_PERCENTAGE]","{0:P1}")%>'></asp:Label></ItemTemplate></asp:Repeater></FooterTemplate></asp:TemplateField><asp:BoundField DataField="DEFENSIVE_REBOUNDS" HeaderText="DR" ReadOnly="True" SortExpression="DEFENSIVE_REBOUNDS"></asp:BoundField>
                                        <asp:BoundField DataField="OFFENSIVE_REBOUNDS" HeaderText="OR" ReadOnly="True" SortExpression="OFFENSIVE_REBOUNDS"></asp:BoundField>
                                        <asp:BoundField DataField="TOTAL_REBOUNDS" HeaderText="TR" ReadOnly="True" SortExpression="TOTAL_REBOUNDS"></asp:BoundField>
                                        <asp:BoundField DataField="ASSISTS" HeaderText="AS" ReadOnly="True" SortExpression="ASSISTS"></asp:BoundField>
                                        <asp:BoundField DataField="FOULS_MADE" HeaderText="FM" ReadOnly="True" SortExpression="FOULS_MADE"></asp:BoundField>
                                        <asp:BoundField DataField="FOULS_ON" HeaderText="FO" ReadOnly="True" SortExpression="FOULS_ON"></asp:BoundField>
                                        <asp:BoundField DataField="TURNOVERS" HeaderText="TUR" ReadOnly="True" SortExpression="TURNOVERS"></asp:BoundField>
                                        <asp:BoundField DataField="STEALS" HeaderText="ST" ReadOnly="True" SortExpression="STEALS"></asp:BoundField>
                                        <asp:BoundField DataField="BLOCKS_MADE" HeaderText="BLM" ReadOnly="True" SortExpression="BLOCKS_MADE"></asp:BoundField>
                                        <asp:BoundField DataField="BLOCKS_SUFFERED" HeaderText="BLS" ReadOnly="True" SortExpression="BLOCKS_SUFFERED"></asp:BoundField>
                                        <asp:BoundField DataField="UNSPORTSMAN_FOUL" HeaderText="UNF" ReadOnly="True" SortExpression="UNSPORTSMAN_FOUL"></asp:BoundField>
                                        <asp:BoundField DataField="INDEX_TOTAL" HeaderText="IND" ReadOnly="True" SortExpression="INDEX_TOTAL" DataFormatString="{0:0.##}"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>

                            </td>
                        </tr>

                        <tr><td>
                            <asp:GridView ID="GridViewAwayStats" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAwayTeamStats" ShowFooter="false">
                                    <Columns>
                                      <asp:BoundField DataField="TIMEOUT" HeaderText="TIMEOUTS" ReadOnly="True" SortExpression="TIMEOUTS" DataFormatString="{0:0.##}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="FASTBREAKS" SortExpression="FASTBREAKS">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("FASTBREAK_MADE") + "/" + Eval("FASTBREAK_ATTEMPT")  %>'></asp:Label></ItemTemplate></asp:TemplateField></Columns></asp:GridView></td></tr>

                        <tr>
                            <td rowspan="4"><br /><font color="black"><strong>M:</strong> Minutes Played, <strong>P:</strong> Points, <strong>FT:</strong> Free Throws, <strong>2P:</strong> Two Points, <strong>3P:</strong> Three Points</br>
                     <strong>DB</strong> Defensive Rebounds, <strong>OF:</strong> Offensive Rebounds,<strong>TR:</strong> Total Rebounds, <strong>FM:</strong> Fouls Made, <strong>FO:</strong> Fouls ON</br>
                     <strong>TUR:</strong> Turnovers, <strong>ST:</strong> Steals, <strong>BLM:</strong> BLOCKS MADE, <strong>BLS:</strong> BLOCKS SUFFERED</br>
                     <strong>UNF:</strong> UNSPORTSMAN FOUL, <strong>AS:</strong>ASSIST, <strong>IND:</strong>INDEX RATING</font></td></tr>
                                                                                                                                                                                                                                                                </table><asp:SqlDataSource ID="SqlDataSourceHomeTeam" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT View_STATISTICS_BY_GAME.GAME_ID, PLAYERS.SURNAME + ' ' + PLAYERS.FIRSTNAME AS PLAYER, View_STATISTICS_BY_GAME.PLAYER_ID, View_STATISTICS_BY_GAME.TEAM_ID, View_STATISTICS_BY_GAME.PLAYER_NO, View_STATISTICS_BY_GAME.POINTS, View_STATISTICS_BY_GAME.FREE_THROW_MADE, View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT, View_STATISTICS_BY_GAME.[2POINTS_MADE], View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT], View_STATISTICS_BY_GAME.[3POINT_MADE], View_STATISTICS_BY_GAME.[3POINT_ATTEMPT], View_STATISTICS_BY_GAME.DEFENSIVE_REBOUNDS, View_STATISTICS_BY_GAME.OFFENSIVE_REBOUNDS, View_STATISTICS_BY_GAME.TOTAL_REBOUNDS, View_STATISTICS_BY_GAME.ASSISTS, View_STATISTICS_BY_GAME.FOULS_MADE, View_STATISTICS_BY_GAME.FOULS_ON, View_STATISTICS_BY_GAME.TURNOVERS, View_STATISTICS_BY_GAME.STEALS, View_STATISTICS_BY_GAME.BLOCKS_MADE, View_STATISTICS_BY_GAME.BLOCKS_SUFFERED, View_STATISTICS_BY_GAME.UNSPORTSMAN_FOUL, View_STATISTICS_BY_GAME.INDEX_TOTAL, TEAMS.NAME AS HOME_TEAM, COACH.SURENAME + ' ' + COACH.FIRST_NAME AS HOME_COACH, TEAMS.LOGO, View_STATISTICS_BY_GAME.MINUTES_PLAYED FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN View_STATISTICS_BY_GAME ON PLAYERS.ID = View_STATISTICS_BY_GAME.PLAYER_ID INNER JOIN GAMES ON View_STATISTICS_BY_GAME.TEAM_ID = GAMES.HOME_TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID INNER JOIN COACH ON GAMES.HOME_TEAM_COACH_ID = COACH.ID WHERE (View_STATISTICS_BY_GAME.GAME_ID = @GAME_ID) ORDER BY View_STATISTICS_BY_GAME.PLAYER_NO">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSourceAwayTeam" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT View_STATISTICS_BY_GAME.GAME_ID, PLAYERS.SURNAME + ' ' + PLAYERS.FIRSTNAME AS PLAYER, View_STATISTICS_BY_GAME.PLAYER_ID, View_STATISTICS_BY_GAME.TEAM_ID, View_STATISTICS_BY_GAME.PLAYER_NO, View_STATISTICS_BY_GAME.POINTS, View_STATISTICS_BY_GAME.FREE_THROW_MADE, View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT, View_STATISTICS_BY_GAME.[2POINTS_MADE], View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT], View_STATISTICS_BY_GAME.[3POINT_MADE], View_STATISTICS_BY_GAME.[3POINT_ATTEMPT], View_STATISTICS_BY_GAME.DEFENSIVE_REBOUNDS, View_STATISTICS_BY_GAME.OFFENSIVE_REBOUNDS, View_STATISTICS_BY_GAME.TOTAL_REBOUNDS, View_STATISTICS_BY_GAME.ASSISTS, View_STATISTICS_BY_GAME.FOULS_MADE, View_STATISTICS_BY_GAME.FOULS_ON, View_STATISTICS_BY_GAME.TURNOVERS, View_STATISTICS_BY_GAME.STEALS, View_STATISTICS_BY_GAME.BLOCKS_MADE, View_STATISTICS_BY_GAME.BLOCKS_SUFFERED, View_STATISTICS_BY_GAME.UNSPORTSMAN_FOUL, View_STATISTICS_BY_GAME.INDEX_TOTAL, TEAMS.NAME AS AWAY_TEAM, COACH.SURENAME + ' ' + COACH.FIRST_NAME AS AWAY_COACH, TEAMS.LOGO, View_STATISTICS_BY_GAME.MINUTES_PLAYED FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN View_STATISTICS_BY_GAME ON PLAYERS.ID = View_STATISTICS_BY_GAME.PLAYER_ID INNER JOIN GAMES ON View_STATISTICS_BY_GAME.TEAM_ID = GAMES.AWAY_TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID INNER JOIN COACH ON GAMES.AWAY_TEAM_COACH_ID = COACH.ID WHERE (View_STATISTICS_BY_GAME.GAME_ID = @GAME_ID) ORDER BY View_STATISTICS_BY_GAME.PLAYER_NO">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceHomePercentage" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(CAST(View_STATISTICS_BY_GAME.FREE_THROW_MADE AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT, 0)) AS FT_PERCENTAGE, SUM(CAST(View_STATISTICS_BY_GAME.[2POINTS_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT], 0)) AS [2P_PERCENTAGE], SUM(CAST(View_STATISTICS_BY_GAME.[3POINT_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[3POINT_ATTEMPT], 0)) AS [3P_PERCENTAGE], SUM(View_STATISTICS_BY_GAME.FREE_THROW_MADE) AS FREE_THROW_MADE_SUM, SUM(View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT) AS FREE_THROW_ATTEMPT_SUM, SUM(View_STATISTICS_BY_GAME.[2POINTS_MADE]) AS [2POINTS_MADE_SUM], SUM(View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT]) AS [2POINTS_ATTEMPT_SUM], SUM(View_STATISTICS_BY_GAME.[3POINT_MADE]) AS [3POINT_MADE_SUM], SUM(View_STATISTICS_BY_GAME.[3POINT_ATTEMPT]) AS [3POINT_ATTEMPT_SUM], SUM(DATEPART(MINUTE, View_STATISTICS_BY_GAME.MINUTES_PLAYED)) AS MP, SUM(DATEPART(SECOND, View_STATISTICS_BY_GAME.MINUTES_PLAYED)) AS SP FROM GAMES INNER JOIN View_STATISTICS_BY_GAME ON GAMES.HOME_TEAM_ID = View_STATISTICS_BY_GAME.TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID WHERE (View_STATISTICS_BY_GAME.GAME_ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceAwayPercentage" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(CAST(View_STATISTICS_BY_GAME.FREE_THROW_MADE AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT, 0)) AS FT_PERCENTAGE, SUM(CAST(View_STATISTICS_BY_GAME.[2POINTS_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT], 0)) AS [2P_PERCENTAGE], SUM(CAST(View_STATISTICS_BY_GAME.[3POINT_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[3POINT_ATTEMPT], 0)) AS [3P_PERCENTAGE], SUM(View_STATISTICS_BY_GAME.FREE_THROW_MADE) AS FREE_THROW_MADE_SUM, SUM(View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT) AS FREE_THROW_ATTEMPT_SUM, SUM(View_STATISTICS_BY_GAME.[2POINTS_MADE]) AS [2POINTS_MADE_SUM], SUM(View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT]) AS [2POINTS_ATTEMPT_SUM], SUM(View_STATISTICS_BY_GAME.[3POINT_MADE]) AS [3POINT_MADE_SUM], SUM(View_STATISTICS_BY_GAME.[3POINT_ATTEMPT]) AS [3POINT_ATTEMPT_SUM], SUM(DATEPART(MINUTE, View_STATISTICS_BY_GAME.MINUTES_PLAYED)) AS MP, SUM(DATEPART(SECOND, View_STATISTICS_BY_GAME.MINUTES_PLAYED)) AS SP FROM GAMES INNER JOIN View_STATISTICS_BY_GAME ON GAMES.AWAY_TEAM_ID = View_STATISTICS_BY_GAME.TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID WHERE (View_STATISTICS_BY_GAME.GAME_ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSourceHomeTeamStats" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TEAM_STATS.FASTBREAK_MADE, TEAM_STATS.FASTBREAK_MISSED,TEAM_STATS.FASTBREAK_MADE + TEAM_STATS.FASTBREAK_MISSED AS FASTBREAK_ATTEMPT, TEAM_STATS.TIMEOUT FROM TEAM_STATS INNER JOIN GAMES ON TEAM_STATS.GAME_ID = GAMES.ID AND TEAM_STATS.TEAM_ID = GAMES.HOME_TEAM_ID WHERE (TEAM_STATS.GAME_ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceAwayTeamStats" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TEAM_STATS.FASTBREAK_MADE, TEAM_STATS.FASTBREAK_MISSED,TEAM_STATS.FASTBREAK_MADE + TEAM_STATS.FASTBREAK_MISSED AS FASTBREAK_ATTEMPT, TEAM_STATS.TIMEOUT FROM TEAM_STATS INNER JOIN GAMES ON TEAM_STATS.GAME_ID = GAMES.ID AND TEAM_STATS.TEAM_ID = GAMES.AWAY_TEAM_ID WHERE (TEAM_STATS.GAME_ID = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                </ContentTemplate>

            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2" HeaderText="REPORT" runat="server">
                <ContentTemplate>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceReport">
                        <ItemTemplate>
                            <section>
                                <article>
                                    <h3>
                                        <asp:Label Text='<%# Bind("REPORT_TITLE") %>' runat="server" ID="REPORT_TITLELabel" /></h3>
                                    <br />
                                    <asp:Image ID="ReportImage" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/report/" + Eval("IMAGE") %>' />
                                    <p>

                                        <asp:Label Text='<%# Bind("REPORT_TEXT") %>' runat="server" ID="REPORT_TEXTLabel" />
                                    </p>
                                </article>
                                <article>
                                    <h3>FIRST QUARTER:</h3><p>
                                        <asp:Label Text='<%# Bind("FIRST_QUARTER") %>' runat="server" ID="FIRST_QUARTERLabel" />
                                    </p>
                                </article>
                                <article>
                                    <h3>SECOND QUARTER:</h3><p>
                                        <asp:Label Text='<%# Bind("SECOND_QUARTER") %>' runat="server" ID="SECOND_QUARTERLabel" />
                                    </p>
                                </article>
                                <article>
                                    <h3>THIRD QUARTER:</h3><p>
                                        <asp:Label Text='<%# Bind("THIRD_QUARTER") %>' runat="server" ID="THIRD_QUARTERLabel" />
                                    </p>
                                </article>
                                <article>
                                    <h3>FORTH QUARTER:</h3><p>
                                        <asp:Label Text='<%# Bind("FORTH_QUARTER") %>' runat="server" ID="FORTH_QUARTERLabel" />
                                    </p>
                                </article>
                            </section>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceReport" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT * FROM [REPORT] WHERE ([GAME_ID] = @GAME_ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel3" HeaderText="PLAY BY PLAY" runat="server">
                <ContentTemplate>
                    <table style="position:relative;margin: 0 auto;"><tr><td>
                    <asp:ListBox ID="ListBoxPBP" runat="server" CssClass="PBPListBox"></asp:ListBox>
                  </td></tr></table> 

                </ContentTemplate></ajaxToolkit:TabPanel>

            <ajaxToolkit:TabPanel ID="TabPanel5" HeaderText="SHOOTING COURT" runat="server">
                <ContentTemplate>
                    
                      <section><article>
                           <table style="text-align:center"><asp:Repeater ID="RepeaterHC" runat="server" DataSourceID="SqlDataSourceSCourt"><ItemTemplate>
                        <tr><td><asp:Image ID="CourtHome" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("HLOGO") %>' /><br />
                            HOME : <asp:Label Text='<%# Eval("HNAME") %>' runat="server" ID="LabelHC" /></td>                           
                        <td><asp:Image ID="ImageHCourt" runat="server" ImageUrl="~/images/courtspot.jpg" /></td><td><asp:Image ID="Image2" runat="server" ImageUrl="~/images/courtZout.jpg" /></td></tr>
                        <tr><td><asp:Image ID="CourtAway" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("ALOGO") %>' /><br />
                            AWAY : <asp:Label Text='<%# Eval("ANAME") %>' runat="server" ID="LabelAC" /></td>
                        <td><asp:Image ID="ImageACourt" runat="server" ImageUrl="~/images/courtspotA.jpg" /></td><td><asp:Image ID="Image3" runat="server" ImageUrl="~/images/courtZoutA.jpg" /></td>
                               </tr>
                            </ItemTemplate></asp:Repeater>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceSCourt" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT HT.NAME AS HNAME, HT.LOGO AS HLOGO, AT.NAME AS ANAME, AT.LOGO AS ALOGO FROM GAMES INNER JOIN TEAMS AS HT ON GAMES.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON GAMES.AWAY_TEAM_ID = AT.ID WHERE (GAMES.ID = @GAME_ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        
                    </table>
                        <p><strong style="color:red"> ΚΟΚΚΙΝΟΙ ΚΥΚΛΟΙ : ΑΣΤΟΧΑ SHOOT</strong>
                    <br /><strong style="color:green">ΠΡΑΣΙΝΟΙ ΚΥΚΛΟΙ : ΕΥΣΤΟΧΑ SHOOT</strong></p>
                           </article></section>                          
                    
                </ContentTemplate></ajaxToolkit:TabPanel>

        </ajaxToolkit:TabContainer>        
    </div>
</asp:Content>