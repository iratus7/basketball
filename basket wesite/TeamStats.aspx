<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="TeamStats.aspx.cs" Inherits="TeamStats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h2>TEAM STATISTICS</h2><br /> <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAVGT" AllowSorting="True" RowStyle-HorizontalAlign="Center" CssClass="grid-viewPlayers" SortedAscendingCellStyle-BackColor="Snow" SortedDescendingCellStyle-BackColor="Snow" OnRowCreated="gvHover_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="RANK">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1 %>.
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:TemplateField>
            <asp:TemplateField HeaderText="LOGO" >
                <ItemTemplate>
                    <asp:Image ID="ImageLOGOView" runat="server" Width="50px" Height="50px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' />
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="P" HeaderText="P" ReadOnly="True" SortExpression="P" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="FTM" HeaderText="FTM" ReadOnly="True" SortExpression="FTM"></asp:BoundField>
            <asp:BoundField DataField="FTA" HeaderText="FTA" ReadOnly="True" SortExpression="FTA"></asp:BoundField>
            <asp:BoundField DataField="FTP" HeaderText="FTP" ReadOnly="True" SortExpression="FTP" DataFormatString="{0:P1}"></asp:BoundField>
            <asp:BoundField DataField="2PM" HeaderText="2PM" ReadOnly="True" SortExpression="2PM"></asp:BoundField>
            <asp:BoundField DataField="2PA" HeaderText="2PA" ReadOnly="True" SortExpression="2PA"></asp:BoundField>
            <asp:BoundField DataField="2PP" HeaderText="2PP" ReadOnly="True" SortExpression="2PP" DataFormatString="{0:P1}"></asp:BoundField>
            <asp:BoundField DataField="3PM" HeaderText="3PM" ReadOnly="True" SortExpression="3PM"></asp:BoundField>
            <asp:BoundField DataField="3PA" HeaderText="3PA" ReadOnly="True" SortExpression="3PA"></asp:BoundField>
            <asp:BoundField DataField="3PP" HeaderText="3PP" ReadOnly="True" SortExpression="3PP" DataFormatString="{0:P1}"></asp:BoundField>
            <asp:BoundField DataField="R" HeaderText="R" ReadOnly="True" SortExpression="R" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="DR" HeaderText="DR" ReadOnly="True" SortExpression="DR" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="ORB" HeaderText="ORB" ReadOnly="True" SortExpression="ORB" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="A" HeaderText="A" ReadOnly="True" SortExpression="A" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="ST" HeaderText="ST" ReadOnly="True" SortExpression="ST" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="BL" HeaderText="BL" ReadOnly="True" SortExpression="BL" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="T" HeaderText="T" ReadOnly="True" SortExpression="T" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="IND" HeaderText="IND" ReadOnly="True" SortExpression="IND" DataFormatString="{0:0.##}"></asp:BoundField>
            <asp:BoundField DataField="GAMES_PLAYED" HeaderText="GP" SortExpression="GAMES_PLAYED"></asp:BoundField>
            <asp:BoundField DataField="TEAM" HeaderText="TEAM" SortExpression="TEAM"></asp:BoundField>            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceAVGT" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT SUM(VS.POINTS_TOTAL) / GP.GAMES_PLAYED AS P, SUM(VS.FREE_THROW_MADE_TOTAL) AS FTM, SUM(VS.FREE_THROW_ATTEMPT_TOTAL) AS FTA, SUM(CAST(VS.FREE_THROW_MADE_TOTAL AS DECIMAL)) / SUM(NULLIF (VS.FREE_THROW_ATTEMPT_TOTAL, 0)) AS FTP, SUM(VS.[2POINTS_MADE_SUM]) AS [2PM], SUM(VS.[2POINTS_ATTEMPT_SUM]) AS [2PA], SUM(CAST(VS.[2POINTS_MADE_SUM] AS DECIMAL)) / SUM(NULLIF (VS.[2POINTS_ATTEMPT_SUM], 0)) AS [2PP], SUM(VS.[3POINT_MADE_SUM]) AS [3PM], SUM(VS.[3POINT_ATTEMPT_SUM]) AS [3PA], SUM(CAST(VS.[3POINT_MADE_SUM] AS DECIMAL)) / SUM(NULLIF (VS.[3POINT_ATTEMPT_SUM], 0)) AS [3PP], SUM(CAST(VS.DEFENSIVE_REBOUNDS_SUM AS DECIMAL) + CAST(VS.OFFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS R, SUM(CAST(VS.DEFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS DR, SUM(CAST(VS.OFFENSIVE_REBOUNDS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS ORB, SUM(CAST(VS.ASSISTS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS A, SUM(CAST(VS.STEALS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS ST, SUM(CAST(VS.BLOCKS_MADE_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS BL, SUM(CAST(VS.TURNOVERS_SUM AS DECIMAL)) / GP.GAMES_PLAYED AS T, SUM(CAST(VS.INDEX_TOTAL AS DECIMAL)) / GP.GAMES_PLAYED AS IND, GP.GAMES_PLAYED, VS.TEAM, VS.LOGO FROM View_STATISTICS AS VS INNER JOIN GAMES_PLAYED_BY_TEAM_ID AS GP ON VS.TEAM_ID = GP.TEAM_ID GROUP BY VS.TEAM, VS.TEAM_ID, VS.LOGO, GP.GAMES_PLAYED">
                    </asp:SqlDataSource><br />
</asp:Content>

