<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Teamefficiency.aspx.cs" Inherits="Teamefficiency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h2>ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΟΜΑΔΑ</h2> <br />
   <div style="margin-left:5px"> <div class="effContainer">
        <asp:LinkButton ID="LinkButtonBarcelona" runat="server" Width="65" Height="65" CssClass='dege0' OnClick="Button1_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkCska" runat="server" Width="64" Height="65" CssClass='dege330' OnClick="Button2_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonMacabi" runat="server" Width="65" Height="65" CssClass='dege30' OnClick="LinkButtonMacabi_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonMinessotaTimberwolves" runat="server" Width="69" Height="65" CssClass='dege60' OnClick="LinkButtonMinessotaTimberwolves_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonOlympiakos" runat="server" Width="64" Height="65" CssClass='dege90' OnClick="LinkButtonOlympiakos_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonPanathinaikos" runat="server" Width="65" Height="65" CssClass='dege120' OnClick="LinkButtonPanathinaikos_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonPaok" runat="server" Width="65" Height="65" CssClass='dege150' OnClick="LinkButtonPaok_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonPartizan" runat="server" Width="65" Height="65" CssClass='dege180' OnClick="LinkButtonPartizan_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonRealMadrid" runat="server" Width="65" Height="65" CssClass='dege210' OnClick="LinkButtonRealMadrid_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonSanAntonioSpurs" runat="server" Width="65" Height="65" CssClass='dege240' OnClick="LinkButtonSanAntonioSpurs_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonZalgirisKaunas" runat="server" Width="64" Height="65" CssClass='dege270' OnClick="LinkButtonZalgirisKaunas_Click"></asp:LinkButton>
        <asp:LinkButton ID="LinkButtonAris" runat="server" Width="65" Height="65" CssClass='dege300' OnClick="LinkButtonAris_Click"></asp:LinkButton>        
    </div>
    <%--<asp:GridView ID="GridViewEff" runat="server"></asp:GridView>--%>
    <br /><br />
    <asp:Chart ID="Chartsta" runat="server" CssClass="ChartTeam" Width="600PX" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="TOTAL REBOUNDS PER GAME" IsValueShownAsLabel="true" ChartType="FastLine"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption" ><AxisY LineWidth="3"></AxisY></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="REBOUNDS EFFICIENCY" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>
            </asp:Chart>

    <asp:Chart ID="ChartTU" runat="server" Width="600PX" CssClass="ChartTeam" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="TURNOVERS PER GAME" IsValueShownAsLabel="true" ChartType="FastLine"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption" ><AxisY LineWidth="3"></AxisY></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="TURNOVER EFFICIENCY" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>
            </asp:Chart>

    <asp:Chart ID="ChartAS" runat="server" Width="600PX" CssClass="ChartTeam" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="ASSISTS PER GAME" IsValueShownAsLabel="true" ChartType="FastLine"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption" ><AxisY LineWidth="3"></AxisY></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="ASSISTS EFFICIENCY" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>
            </asp:Chart>

     <asp:Chart ID="ChartPPG" runat="server" Width="600PX" CssClass="ChartTeam" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="POINTS PER GAME" IsValueShownAsLabel="true" ChartType="FastLine"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption" ><AxisY LineWidth="3"></AxisY></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="POINTS EFFICIENCY" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>
            </asp:Chart>
    </div>
</asp:Content>

