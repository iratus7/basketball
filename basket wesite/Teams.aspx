<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Teams.aspx.cs" Inherits="Teams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="GridContent">

        <div class="GridTeam">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="grid-viewPlayers" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" RowStyle-Wrap="True">
                <Columns>
                    <asp:TemplateField HeaderText="NO" SortExpression="NO">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("NO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="SURNAME" HeaderText="SURNAME" />
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
                    <asp:TemplateField HeaderText="NATIONALITY" SortExpression="NATIONALITY">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("NATIONALITY") %>'></asp:Label><asp:Image ID="ImageCountry" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_IMAGE") + ".png" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PLAYER_IMAGE" SortExpression="IMAGE">
                        <ItemTemplate>
                            <asp:Image ID="ImagePlayer" runat="server" Height="50px" Width="50px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("PLAYER_IMAGE") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="GridTeamDetails">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CssClass="cssdetailsview" HeaderStyle-CssClass="header"
                FieldHeaderStyle-CssClass="fieldheader"
                ItemStyle-CssClass="item"
                AlternatingRowStyle-CssClass="altrow" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:TemplateField HeaderText="TEAM" SortExpression="TEAM">
                        <ItemTemplate>
                            <asp:Image ID="LogoTeam" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' /></br>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TEAM") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COACH" SortExpression="COACH">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLinkCoach" runat="server" NavigateUrl='<%# Eval("IDOCOACH", "Coaches.aspx?ID={0}") %>'>
                                <asp:Image ID="ImageHyperlinkCoach" runat="server" Height="160px" Width="128px" ImageUrl='<%# "~/images/coaches/" + Eval("COACH_IMAGE") %>' Text='<%# Eval("COACH") %>' /><br />
                                <asp:Label ID="LabelHyperlinkCoach" runat="server" Text='<%# Eval("COACH") %>'></asp:Label>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ARENA" SortExpression="ARENA">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ARENA") %>'></asp:Label><asp:Image ID="IMAGEArena" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/arenas/" + Eval("ARENA_IMAGE") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>

        <aside>
            <h3>ΤΕΛΕΥΤΑΙΑ ΝΕΑ</h3>

            <asp:FormView ID="FormViewNews" runat="server" DataKeyNames="ID" DataSourceID="news">
                <ItemTemplate>
                    <h4>
                        <asp:Label Text='<%# Eval("TITLE") %>' runat="server" ID="TITLELabel" /></h4>
                    <h5>
                        <asp:Label Text='<%# Eval("DATE_TIME","{0:f}") %>' runat="server" ID="DATE_TIMELabel" /></h5>
                    <p>
                        <asp:Label Text='<%# Eval("NEWS") %>' runat="server" ID="NEWSLabel" />
                    </p>
                </ItemTemplate>
            </asp:FormView>
            <hr width="75%" size="10" noshade="NOSHADE"></hr><br />

            <asp:DetailsView ID="DetailsViewTopP" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="IDOPLAYER" DataSourceID="SqlDataSourceTeamBestPlayer" CssClass="cssdetailsview" HeaderStyle-CssClass="header"
                FieldHeaderStyle-CssClass="fieldheader"
                ItemStyle-CssClass="item"
                AlternatingRowStyle-CssClass="altrow">
                <Fields>                    
                    <asp:TemplateField HeaderText="MVP" SortExpression="IMAGE">
                        <ItemTemplate>
                            <asp:HyperLink ID="PlayerMvp" runat="server" NavigateUrl='<%# Eval("IDOPLAYER", "Players.aspx?ID={0}") %>'>
                            <asp:Image ID="ImagePlayer" runat="server" Height="80px" Width="80px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' />
                        <asp:Label runat="server" Text='<%# Eval("SURNAME") + " " + Eval("FIRSTNAME") %>' ID="Label1"></asp:Label></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="INDEX_AVG" HeaderText="INDEX" ReadOnly="True" SortExpression="INDEX_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
                    <asp:BoundField DataField="POINTS_PER_GAME" HeaderText="POINTS" ReadOnly="True" SortExpression="POINTS_PER_GAME" DataFormatString="{0:0.##}"></asp:BoundField>
                    <asp:BoundField DataField="TOTAL_REBOUNDS" HeaderText="REBOUNDS" ReadOnly="True" SortExpression="TOTAL_REBOUNDS" DataFormatString="{0:0.##}"></asp:BoundField>
                    <asp:BoundField DataField="ASSISTS_AVG" HeaderText="ASSISTS" ReadOnly="True" SortExpression="ASSISTS_AVG" DataFormatString="{0:0.##}"></asp:BoundField>
                    <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GAMES PLAYED" ReadOnly="True" SortExpression="GAMES_PLAYED"></asp:BoundField>

                </Fields>
            </asp:DetailsView>
            <hr width="75%" size="10" noshade="NOSHADE"></hr>
            <asp:SqlDataSource ID="SqlDataSourceTeamBestPlayer" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT View_STATISTICS.POINTS_PER_GAME, View_STATISTICS.OFFENSIVE_REBOUNDS_AVG + View_STATISTICS.DEFENSIVE_REBOUNDS_AVG AS TOTAL_REBOUNDS, View_STATISTICS.OFFENSIVE_REBOUNDS_AVG, View_STATISTICS.DEFENSIVE_REBOUNDS_AVG, View_STATISTICS.ASSISTS_AVG, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.IMAGE, PLAYERS.ID AS IDOPLAYER, View_STATISTICS.GAMES_PLAYED, View_STATISTICS.INDEX_TOTAL / View_STATISTICS.GAMES_PLAYED AS INDEX_AVG FROM View_STATISTICS INNER JOIN PLAYERS ON PLAYERS.ID = View_STATISTICS.ID WHERE (PLAYERS.TEAM_ID = @ID) ORDER BY INDEX_AVG DESC, View_STATISTICS.POINTS_PER_GAME DESC, View_STATISTICS.DEFENSIVE_REBOUNDS_AVG DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>



        </aside>



    </div>

    <!--   <asp:HyperLinkField DataNavigateUrlFields="IDOCOACH" DataNavigateUrlFormatString="Coaches.aspx?ID={0}" DataTextField="COACH" HeaderText="COACH" SortExpression="COACH" /> -->


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.POSITION, PLAYERS.HEIGHT, PLAYERS.BORN, COUNTRY.NAME AS NATIONALITY, COACH.SURENAME + ' ' + COACH.FIRST_NAME AS COACH, ARENAS.NAME AS ARENA, COACH.FIRST_NAME AS COACH_FIRST_NAME, ARENAS.IMAGE AS ARENA_IMAGE, TEAMS.LOGO, COACH.IMAGE AS COACH_IMAGE, PLAYERS.IMAGE AS PLAYER_IMAGE, COUNTRY.COUNTRY_CODE AS COUNTRY_IMAGE, PLAYERS.ID, TEAMS.ID AS TEAM_ID, COACH.ID AS IDOCOACH, TEAMS.NAME AS TEAM FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN COACH ON TEAMS.ID = COACH.TEAM_ID INNER JOIN ARENAS ON TEAMS.ARENA_ID = ARENAS.ID INNER JOIN COUNTRY ON PLAYERS.COUNTRY_ID = COUNTRY.ID WHERE (TEAMS.ID = @ID) ORDER BY PLAYERS.NO">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="news" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT ID, TEAM_ID, TITLE, NEWS, DATE_TIME FROM TEAM_NEWS WHERE (TEAM_ID = @ID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="ID" Name="ID"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>

