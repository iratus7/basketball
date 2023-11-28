<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΑΓΩΝΙΣΤΙΚΗ</h2><!--DataTextField="AGONISTIKI" DataValueField="AGONISTIKI" DataSourceID="SqlDataSource2" -->
    <asp:DropDownList ID="Results_Ddl" runat="server" AutoPostBack="True" DataTextField="AGONISTIKI" DataValueField="AGONISTIKI" DataSourceID="SqlDataSource2" CssClass="styled-select">        
    </asp:DropDownList><br />
    <br />
    <!--
     <asp:GridView ID="GridView4" runat="server">
        </asp:GridView>-->

    <asp:GridView ID="GridViewScore" runat="server" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataSourceID="SqlDataSourceScore" DataKeyNames="GAME_ID" CssClass="grid-results" >
        <Columns>            
            <asp:BoundField DataField="GAME_ID" HeaderText="GAME_ID" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="GAME_ID"></asp:BoundField>
            <asp:BoundField DataField="AGONISTIKI" HeaderText="AGONISTIKI" Visible="false" SortExpression="AGONISTIKI"></asp:BoundField>
            <asp:BoundField DataField="DATE_TIME" HeaderText="DATE_TIME" SortExpression="DATE_TIME"></asp:BoundField>            
            <asp:TemplateField HeaderText="1st REFEREE" SortExpression="REFEREE1">                
                <ItemTemplate><asp:HyperLink ID="HyperLinkRef1" runat="server" NavigateUrl='<%# Eval("REFEREE1_ID", "Referees.aspx?ID={0}") %>'>
                        <asp:Label ID="LabelHyperlinkRef1" runat="server" Text='<%# Eval("REFEREE1") %>'></asp:Label></asp:HyperLink>
                     </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="2nd REFEREE" SortExpression="REFEREE2">                
                <ItemTemplate>
            <asp:HyperLink ID="HyperLinkRef2" runat="server" NavigateUrl='<%# Eval("REFEREE2_ID", "Referees.aspx?ID={0}") %>'>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("REFEREE2") %>'></asp:Label></asp:HyperLink>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="3rd REFEREE" SortExpression="REFEREE3">                
                <ItemTemplate>
            <asp:HyperLink ID="HyperLinkRef3" runat="server" NavigateUrl='<%# Eval("REFEREE3_ID", "Referees.aspx?ID={0}") %>'>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("REFEREE3") %>'></asp:Label></asp:HyperLink>
                    </ItemTemplate>
            </asp:TemplateField>            
             <asp:TemplateField HeaderText="ARENA" SortExpression="ARENA">                
                <ItemTemplate>
            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ARENA") %>'></asp:Label><asp:Image ID="IMAGEArena" runat="server" Height="50px" Width="50px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/arenas/" + Eval("IMAGE") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TEAMS" SortExpression="TEAMS">                
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkTeamH" runat="server" NavigateUrl='<%# Eval("HOME_TEAM_ID", "Teams.aspx?ID={0}") %>'>
                        <asp:Label ID="LabelHyperlinkTeamH" runat="server" Text='<%# Eval("HOME_TEAM") %>'></asp:Label></asp:HyperLink> - 
<asp:HyperLink ID="HyperLinkTeamA" runat="server" NavigateUrl='<%# Eval("AWAY_TEAM_ID", "Teams.aspx?ID={0}") %>'>
                        <asp:Label ID="LabelHyperlinkTeamA" runat="server" Text='<%# Eval("AWAY_TEAM") %>'></asp:Label>                    
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SCORE" SortExpression="SCORE">                
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkStatsByGame" runat="server" NavigateUrl='<%# Eval("GAME_ID", "ResultsPerGame.aspx?GAME_ID={0}") %>'>
                   
                        <%--<asp:Repeater ID="RepeaterSc" runat="server" DataSourceID="SqlDataSourcesSc">
                                        <ItemTemplate>--%>
                        
                        
                         <asp:Label runat="server" Text='<%# string.Format("{0:0.##}",Eval("H_POINTS_TOTAL")) %>' ID="Label3" ></asp:Label>-<asp:Label runat="server" Text='<%# string.Format("{0:0.##}",Eval("A_POINTS_TOTAL")) %>' ID="Label5"></asp:Label>
             
                        <%--</ItemTemplate></asp:Repeater>--%>
                        
                        
                        
                        
                         </asp:HyperLink> 
                                            


                                        </ItemTemplate>
            </asp:TemplateField>
           

        </Columns>
    </asp:GridView>



    
  
    <!--DE XREIAZONTAI ARXI
    <table class="teamcss" style="display:inline" CellPadding="0" cellspacing="0"><tr><td>

    <asp:GridView ID="GridView1" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID"  >
        <Columns>            
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="AGONISTIKI" HeaderText="AGONISTIKI" SortExpression="AGONISTIKI"></asp:BoundField>
            <asp:BoundField DataField="DATE_TIME" HeaderText="DATE_TIME" SortExpression="DATE_TIME"></asp:BoundField>            
            <asp:TemplateField HeaderText="1st REFEREE" SortExpression="REFEREE1">                
                <ItemTemplate><asp:HyperLink ID="HyperLinkRef1" runat="server" NavigateUrl='<%# Eval("REFEREE1_ID", "Referees.aspx?ID={0}") %>'>
                        <asp:Label ID="LabelHyperlinkRef1" runat="server" Text='<%# Eval("REFEREE1") %>'></asp:Label></asp:HyperLink>
                     </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="2nd REFEREE" SortExpression="REFEREE2">                
                <ItemTemplate>
            <asp:HyperLink ID="HyperLinkRef2" runat="server" NavigateUrl='<%# Eval("REFEREE2_ID", "Referees.aspx?ID={0}") %>'>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("REFEREE2") %>'></asp:Label></asp:HyperLink>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="3rd REFEREE" SortExpression="REFEREE3">                
                <ItemTemplate>
            <asp:HyperLink ID="HyperLinkRef3" runat="server" NavigateUrl='<%# Eval("REFEREE3_ID", "Referees.aspx?ID={0}") %>'>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("REFEREE3") %>'></asp:Label></asp:HyperLink>
                    </ItemTemplate>
            </asp:TemplateField>            
             <asp:TemplateField HeaderText="ARENA" SortExpression="ARENA">                
                <ItemTemplate>
            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ARENA") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TEAMS" SortExpression="TEAMS">                
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkTeamH" runat="server" NavigateUrl='<%# Eval("HOME_TEAM_ID", "Teams.aspx?ID={0}") %>'>
                        <asp:Label ID="LabelHyperlinkTeamH" runat="server" Text='<%# Eval("HOME_TEAM") %>'></asp:Label></asp:HyperLink> - 
<asp:HyperLink ID="HyperLinkTeamA" runat="server" NavigateUrl='<%# Eval("AWAY_TEAM_ID", "Teams.aspx?ID={0}") %>'>
                        <asp:Label ID="LabelHyperlinkTeamA" runat="server" Text='<%# Eval("AWAY_TEAM") %>'></asp:Label>                    
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField> 
        </Columns>
    </asp:GridView>
        </td><td>
            <asp:GridView ID="GridView2" runat="server" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceH" CssClass="grid-results">
                <Columns>
                    <asp:BoundField DataField="H_POINTS_TOTAL" HeaderText="H_POINTS_TOTAL" ReadOnly="True" SortExpression="H_POINTS_TOTAL"></asp:BoundField>
                </Columns>
            </asp:GridView>
              </td><td>
                <asp:GridView ID="GridView3" runat="server" OnRowCreated="gvHover_RowCreated" DataSourceID="SqlDataSourceA" AutoGenerateColumns="False" DataKeyNames="ID" CssClass="grid-results">
                    <Columns>
                        <asp:BoundField DataField="A_POINTS_TOTAL" HeaderText="A" ReadOnly="True" SortExpression="A_POINTS_TOTAL"></asp:BoundField>
                    </Columns>
                </asp:GridView>             

                 </td></tr></table>



    <!--DE XREIAZONTAI ARXI
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT G.ID, G.AGONISTIKI, G.DATE_TIME, ARENAS.IMAGE, ARENAS.NAME AS ARENA, HT.NAME AS HOME_TEAM, AT.NAME AS AWAY_TEAM, R1.SURENAME AS REFEREE1, R2.SURENAME AS REFEREE2, R3.SURENAME AS REFEREE3, G.HOME_TEAM_ID, G.AWAY_TEAM_ID, G.REFEREE1_ID, G.REFEREE2_ID, G.REFEREE3_ID, G.ARENA_ID FROM GAMES AS G INNER JOIN REFEREE AS R1 ON G.REFEREE1_ID = R1.ID INNER JOIN REFEREE AS R2 ON G.REFEREE2_ID = R2.ID INNER JOIN REFEREE AS R3 ON G.REFEREE3_ID = R3.ID INNER JOIN TEAMS AS HT ON G.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON G.AWAY_TEAM_ID = AT.ID INNER JOIN ARENAS ON G.ARENA_ID = ARENAS.ID WHERE (G.AGONISTIKI = @AGONISTIKI) ORDER BY G.ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="Results_Ddl" PropertyName="SelectedValue" Name="AGONISTIKI"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceH" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(ISNULL(HS.FREE_THROW_MADE, 0) * 1.00) + SUM(ISNULL(HS.[2POINTS_MADE], 0) * 2.00) + SUM(ISNULL(HS.[3POINT_MADE], 0) * 3.00) AS H_POINTS_TOTAL, View_RES.ID FROM View_RES INNER JOIN [STATISTICS] AS HS ON HS.TEAM_ID = View_RES.HOME_TEAM_ID AND HS.GAME_ID = View_RES.ID GROUP BY View_RES.AGONISTIKI, View_RES.ID HAVING (View_RES.AGONISTIKI = @AGONISTIKI)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Results_Ddl" PropertyName="SelectedValue" Name="AGONISTIKI"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceA" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(ISNULL(AST.FREE_THROW_MADE, 0) * 1.00) + SUM(ISNULL(AST.[2POINTS_MADE], 0) * 2.00) + SUM(ISNULL(AST.[3POINT_MADE], 0) * 3.00) AS A_POINTS_TOTAL, View_RES.ID FROM View_RES INNER JOIN [STATISTICS] AS AST ON AST.TEAM_ID = View_RES.AWAY_TEAM_ID AND AST.GAME_ID = View_RES.ID GROUP BY View_RES.AGONISTIKI, View_RES.ID HAVING (View_RES.AGONISTIKI = @AGONISTIKI)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Results_Ddl" PropertyName="SelectedValue" Name="AGONISTIKI"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceGetGames" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT DISTINCT SUM(ISNULL(HS.FREE_THROW_MADE, 0) * 1.00) + SUM(ISNULL(HS.[2POINTS_MADE], 0) * 2.00) + SUM(ISNULL(HS.[3POINT_MADE], 0) * 3.00) AS H_POINTS_TOTAL, SUM(ISNULL(AST.FREE_THROW_MADE, 0) * 1.00) + SUM(ISNULL(AST.[2POINTS_MADE], 0) * 2.00) + SUM(ISNULL(AST.[3POINT_MADE], 0) * 3.00) AS A_POINTS_TOTAL, View_RES.AGONISTIKI, View_RES.ID, View_RES.HOME_TEAM, View_RES.AWAY_TEAM, View_RES.HOME_TEAM_ID, View_RES.AWAY_TEAM_ID FROM View_RES INNER JOIN [STATISTICS] AS HS ON HS.TEAM_ID = View_RES.HOME_TEAM_ID AND HS.GAME_ID = View_RES.ID INNER JOIN [STATISTICS] AS AST ON AST.TEAM_ID = View_RES.AWAY_TEAM_ID AND AST.GAME_ID = View_RES.ID GROUP BY View_RES.AGONISTIKI, View_RES.ID, View_RES.HOME_TEAM, View_RES.AWAY_TEAM, View_RES.HOME_TEAM_ID, View_RES.AWAY_TEAM_ID HAVING (View_RES.AGONISTIKI = @AGONISTIKI)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Results_Ddl" PropertyName="SelectedValue" Name="AGONISTIKI"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource><!--DE XREIAZONTAI TELOS-->


     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT DISTINCT AGONISTIKI FROM GAMES">
        </asp:SqlDataSource><!--IS FOR DROPDOWNLIST:    Results_Ddl-->

    <asp:SqlDataSource ID="SqlDataSourceScore" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT View_GAME_RESULT.ID AS GAME_ID, View_GAME_RESULT.AGONISTIKI, ISNULL(View_SCORE_HOME.H_POINTS_TOTAL,0) AS H_POINTS_TOTAL, ISNULL(View_SCORE_AWAY.A_POINTS_TOTAL,0) AS A_POINTS_TOTAL, View_GAME_RESULT.DATE_TIME, View_GAME_RESULT.IMAGE, View_GAME_RESULT.ARENA, View_GAME_RESULT.HOME_TEAM, View_GAME_RESULT.AWAY_TEAM, View_GAME_RESULT.REFEREE1, View_GAME_RESULT.REFEREE2, View_GAME_RESULT.REFEREE3, View_GAME_RESULT.HOME_TEAM_ID, View_GAME_RESULT.AWAY_TEAM_ID, View_GAME_RESULT.REFEREE1_ID, View_GAME_RESULT.REFEREE2_ID, View_GAME_RESULT.REFEREE3_ID FROM View_SCORE_HOME RIGHT OUTER JOIN View_GAME_RESULT LEFT OUTER JOIN View_SCORE_AWAY ON View_GAME_RESULT.ID = View_SCORE_AWAY.ID ON View_SCORE_HOME.ID = View_GAME_RESULT.ID WHERE (View_GAME_RESULT.AGONISTIKI = @AGONISTIKI)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Results_Ddl" PropertyName="SelectedValue" DefaultValue="1" Name="AGONISTIKI"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource><!--USES VIEWS: GAMES_RESULTS , SCORE_HOME,  SCORE_AWAY-->
    
    <%--<asp:SqlDataSource ID="SqlDataSourcesSc" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT View_GAME_RESULT.ID AS GAME_ID, View_SCORE_HOME.H_POINTS_TOTAL, View_SCORE_AWAY.A_POINTS_TOTAL FROM View_GAME_RESULT INNER JOIN View_SCORE_HOME ON View_GAME_RESULT.ID = View_SCORE_HOME.ID INNER JOIN View_SCORE_AWAY ON View_GAME_RESULT.ID = View_SCORE_AWAY.ID WHERE (View_GAME_RESULT.AGONISTIKI = @AGONISTIKI)">
        <SelectParameters>
            <asp:Parameter Name="AGONISTIKI"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource><!--USES VIEWS: GAMES_RESULTS , SCORE_HOME,  SCORE_AWAY-->--%>

</asp:Content>

