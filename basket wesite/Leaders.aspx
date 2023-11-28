<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Leaders.aspx.cs" Inherits="Leaders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table class="leaderTable">
        <tr>
            <th colspan="2" style="font-family: 'Snap ITC'; font-size: x-large; background-color: #365c81; color: aliceblue"><strong>TOP PLAYERS</strong></th>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewRank" runat="server" DataSourceID="Rank" AutoGenerateColumns="False" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField HeaderText="RANK">
                            <ItemTemplate>
                                <strong><%# Container.DataItemIndex + 1 %>.</strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MVP" SortExpression="PLAYER">
                            <ItemTemplate>
                                <asp:HyperLink ID="PlayerRank" runat="server" NavigateUrl='<%# Eval("ID", "Players.aspx?ID={0}") %>'>
                                    <asp:Image ID="Image_Player" runat="server" Height="70px" Width="70px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' /><br />
                                    <asp:Label runat="server" Text='<%# Eval("PLAYER") %>' ID="Label1"></asp:Label>
                                </asp:HyperLink>
                                <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="INDEX_AVG">
                            <HeaderTemplate><strong>INDEX<br />
                                AVERAGE</strong></HeaderTemplate>
                            <ItemTemplate>
                                <strong>
                                    <asp:Label runat="server" Text='<%# Bind("INDEX_AVG", "{0:0.##}") %>' ID="Label2"></asp:Label></strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:GridView ID="GridViewPoints" runat="server" DataSourceID="Points" AutoGenerateColumns="False" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField HeaderText="RANK">
                            <ItemTemplate>
                                <strong><%# Container.DataItemIndex + 1 %>.</strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TOP SCORER" SortExpression="PLAYER">
                            <ItemTemplate>
                                <asp:HyperLink ID="PlayerPoints" runat="server" NavigateUrl='<%# Eval("ID", "Players.aspx?ID={0}") %>'>
                                    <asp:Image ID="Image_Player" runat="server" Height="70px" Width="70px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' /><br />
                                    <asp:Label runat="server" Text='<%# Eval("PLAYER") %>' ID="Label1"></asp:Label>
                                </asp:HyperLink>
                                <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="POINTS_PER_GAME">
                            <HeaderTemplate><strong>POINTS<br />
                                PER<br />
                                GAME</strong></HeaderTemplate>
                            <ItemTemplate>
                                <strong>
                                    <asp:Label runat="server" Text='<%# Eval("POINTS_PER_GAME", "{0:0.##}") %>' ID="Label3"></asp:Label></strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewRebounds" runat="server" DataSourceID="Rebounds" AutoGenerateColumns="False" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField HeaderText="RANK">
                            <ItemTemplate>
                                <strong><%# Container.DataItemIndex + 1 %>.</strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TOP REBOUNDER" SortExpression="PLAYER">
                            <ItemTemplate>
                                <asp:HyperLink ID="PlayerRebounds" runat="server" NavigateUrl='<%# Eval("ID", "Players.aspx?ID={0}") %>'>
                                    <asp:Image ID="Image_Player" runat="server" Height="70px" Width="70px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' /><br />
                                    <asp:Label runat="server" Text='<%# Eval("PLAYER") %>' ID="Label1"></asp:Label>
                                </asp:HyperLink>
                                <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="TOTAL_REBOUNDS_AVG">
                            <HeaderTemplate><strong>TOTAL<br />
                                REBOUNDS<br />
                                AVERAGE</strong></HeaderTemplate>
                            <ItemTemplate>
                                <strong>
                                    <asp:Label runat="server" Text='<%# Eval("TOTAL_REBOUNDS_AVG", "{0:0.##}") %>' ID="Label2"></asp:Label></strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:GridView ID="GridViewAssists" runat="server" DataSourceID="Asists" AutoGenerateColumns="False" DataKeyNames="ID">
                    <Columns>
                        <asp:TemplateField HeaderText="RANK">
                            <ItemTemplate>
                                <strong><%# Container.DataItemIndex + 1 %>.</strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TOP ASSISTANT" SortExpression="PLAYER">
                            <ItemTemplate>
                                <asp:HyperLink ID="PlayerAssists" runat="server" NavigateUrl='<%# Eval("ID", "Players.aspx?ID={0}") %>'>
                                    <asp:Image ID="Image_Player" runat="server" Height="70px" Width="70px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' /><br />
                                    <asp:Label runat="server" Text='<%# Eval("PLAYER") %>' ID="Label1"></asp:Label>
                                </asp:HyperLink>
                                <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="ASSISTS_AVG">
                            <HeaderTemplate><strong>ASSISTS<br />
                                AVERAGE</strong></HeaderTemplate>
                            <ItemTemplate>
                                <strong>
                                    <asp:Label runat="server" Text='<%# Eval("ASSISTS_AVG", "{0:0.##}") %>' ID="Label2"></asp:Label></strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewMinutes" runat="server" DataSourceID="Minutes" AutoGenerateColumns="False" DataKeyNames="ID" HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText="RANK">
                            <ItemTemplate>
                                <strong><%# Container.DataItemIndex + 1 %>.</strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MOST PLAYED" SortExpression="PLAYER">
                            <ItemTemplate>
                                <asp:HyperLink ID="PlayerMinutes" runat="server" NavigateUrl='<%# Eval("ID", "Players.aspx?ID={0}") %>'>
                                    <asp:Image ID="Image_Player" runat="server" Height="70px" Width="70px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' /><br />
                                    <asp:Label runat="server" Text='<%# Eval("PLAYER") %>' ID="Label1"></asp:Label>
                                </asp:HyperLink>
                                <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_CODE") + ".png" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="MIN PLAYED AVG">
                            <HeaderTemplate><strong>MINUTES<br />
                                PLAYED<br />
                                AVERAGE</strong></HeaderTemplate>

                            <ItemTemplate>
                                <strong>
                                    <asp:Label runat="server" Text='<%# DateTime.Parse(Eval("AVG_MIN_PLAYED").ToString()).ToString("mm:ss") %>' ID="Label2"></asp:Label></strong>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />

    <asp:SqlDataSource ID="Points" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TOP (5) SURNAME + ' ' + FIRSTNAME AS PLAYER, POINTS_PER_GAME, ID, SURNAME, FIRSTNAME, COUNTRY_CODE, IMAGE FROM View_STATISTICS ORDER BY POINTS_PER_GAME DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Rebounds" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TOP (5) SURNAME + ' ' + FIRSTNAME AS PLAYER, 1.00 * (DEFENSIVE_REBOUNDS_SUM + OFFENSIVE_REBOUNDS_SUM) / NULLIF (GAMES_PLAYED, 0) AS TOTAL_REBOUNDS_AVG, ID, SURNAME, FIRSTNAME, COUNTRY_CODE, IMAGE FROM View_STATISTICS ORDER BY TOTAL_REBOUNDS_AVG DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Rank" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TOP (5) SURNAME + ' ' + FIRSTNAME AS PLAYER, INDEX_AVG, ID, SURNAME, FIRSTNAME, COUNTRY_CODE, IMAGE FROM View_INDEX_TOTAL ORDER BY INDEX_AVG DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Asists" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TOP (5) SURNAME + ' ' + FIRSTNAME AS PLAYER, ASSISTS_AVG, ID, SURNAME, FIRSTNAME, COUNTRY_CODE, IMAGE FROM View_STATISTICS ORDER BY ASSISTS_AVG DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Minutes" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TOP (5) SURNAME + ' ' + FIRSTNAME AS PLAYER, ID, SURNAME, FIRSTNAME, COUNTRY_CODE, AVG_MIN_PLAYED AS AVG_SECONDS_PLAYED, CONVERT (TIME, DATEADD(ms, AVG_MIN_PLAYED * 1000, 0)) AS AVG_MIN_PLAYED, IMAGE FROM View_INDEX_TOTAL ORDER BY AVG_SECONDS_PLAYED DESC"></asp:SqlDataSource>

</asp:Content>

