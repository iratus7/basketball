<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiveScorePerGame.aspx.cs" Inherits="LiveScorePerGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LIVE STATS</title>
    <link href="css/LiveScorePergame.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">

<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManagerLiveStats" runat="server">
    </ajaxToolkit:ToolkitScriptManager>

          <br /><div class="ContainerLiveGames"><table style="text-align:center">
       <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceSCourt"><ItemTemplate> <tr><td><asp:Image ID="HLOGO" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("HLOGO") %>' /><br />
                       <strong> HOME :</strong>    <asp:Label Text='<%# Eval("HNAME") %>' runat="server" ID="LabelH" /></td>                           
                        
          <td><asp:Image ID="ALOGO" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("ALOGO") %>' /><br />
              <strong> AWAY :</strong>             <asp:Label Text='<%# Eval("ANAME") %>' runat="server" ID="LabelA" /></td>                        
                               </tr>  </ItemTemplate></asp:Repeater>
        <tr><td><div class="ContainerScoresRadius">
       
              <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><div class="ContainerScoresQ"><asp:GridView ID="GridViewQScore" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-resultsQ" HeaderStyle-BorderColor="Black"></asp:GridView></div></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers>
</asp:UpdatePanel>   

                </div>
    </td><td> <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><asp:Image ID="imageScoretable" ImageUrl="~/images/livescoretableOut.jpg" runat="server" CssClass="scoretableim" />
   </ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers>
</asp:UpdatePanel>   


         </td></tr></table>  
    
        <ajaxToolkit:TabContainer ID="TabContainerLiveStats" runat="server" ActiveTabIndex="0" CssClass="Tab" UseVerticalStripPlacement="False">
            <ajaxToolkit:TabPanel ID="TabPanel1" HeaderText="BOXSCORE" runat="server" >
        <contenttemplate> 
    <br /><table><tr><td> <h4 style="color:#78C1DD"><div class="ContainerTabTextRadius">➥      BOXSCORE</div></h4></td><td><br /><div class="ContainerScoresRadius"><strong>MP:</strong> Minutes Played, <strong>P:</strong> Points, <strong>FT:</strong> Free Throws, <strong>2P:</strong> Two Points, <strong>3P:</strong> Three Points</br>
                     <strong>DR</strong> Defensive Rebounds, <strong>OR:</strong> Offensive Rebounds,<strong>FM:</strong> Fouls Made, <strong>FO:</strong> Fouls ON</br>
                     <strong>TO:</strong> Turnovers, <strong>ST:</strong> Steals, <strong>BL:</strong> BLOCKS MADE, <strong>BA:</strong> BLOCKS SUFFERED</br>
                     <strong>UF:</strong> UNSPORTSMAN FOUL, <strong>AS:</strong>ASSIST, <strong>IND:</strong>INDEX RATING</div></td></tr></table><br />
         <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="BTab" UseVerticalStripPlacement="False">
            <ajaxToolkit:TabPanel ID="TabPanelBoxHome" HeaderText="HOME" runat="server" >
        <contenttemplate> 
                  <br />  <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><div class="ContainerStatsBox"><asp:GridView ID="GridViewBoxHome" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black" ></asp:GridView> </div> <br />
            <div class="ContainerStatsBoxT"><asp:GridView ID="GridViewTeamH" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black"></asp:GridView> </div> </ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel> 



             </ContentTemplate></ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabPanelBoxAway" HeaderText="AWAY" runat="server" >
        <contenttemplate>  
                  <br /><asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><div class="ContainerStatsBox"><asp:GridView ID="GridViewBoxAway" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black"></asp:GridView></div><br />
           <div class="ContainerStatsBoxT"><asp:GridView ID="GridViewTeamA" runat="server" OnRowCreated="gvHover_RowCreated" CssClass="grid-results" HeaderStyle-BorderColor="Black"></asp:GridView></div>
       </ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel>   


        </ContentTemplate></ajaxToolkit:TabPanel>
             </ajaxToolkit:TabContainer>


            </ContentTemplate></ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanel2" HeaderText="PLAY BY PLAY" runat="server" >
        <contenttemplate> 
    <br /><h4 style="color:#78C1DD"><div class="ContainerTabTextRadius">➥      PLAY BY PLAY</div></h4><br />
           <div class="ContainerScoresPBP"><asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><asp:ListBox ID="ListBoxPBP" runat="server" Font-Size="Larger" BackColor="#C1DCE5" ></asp:ListBox> </ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel> </div>

            </ContentTemplate></ajaxToolkit:TabPanel>

            <ajaxToolkit:TabPanel ID="TabPanel3" HeaderText="SHOOTING COURT" runat="server" >
        <contenttemplate> 
 <br /><h4 style="color:#78C1DD"><div class="ContainerTabTextRadius">➥      ΑΠΕΙΚΟΝΙΣΗ ΕΠΙΘΕΣΕΩΝ</div></h4><br />
         <table style="text-align:center"><asp:Repeater ID="RepeaterHC" runat="server" DataSourceID="SqlDataSourceSCourt"><ItemTemplate>
                        <tr><td><asp:Image ID="CourtHome" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("HLOGO") %>' /><br />
                            HOME : <asp:Label Text='<%# Eval("HNAME") %>' runat="server" ID="LabelHC" /></td>                           
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate>
                            
            <div class="ContainerScoresRadius"><asp:Image ID="ImageHCourt" runat="server" ImageUrl="~/images/courtspot.jpg" /> </div></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel>
       
       </td><td>  <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate> <div class="ContainerScoresRadius"><asp:Image ID="Image2" runat="server" ImageUrl="~/images/courtZout.jpg" /> </div></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel>

                                
                                                                                                                </td></tr>
                        <tr><td><asp:Image ID="CourtAway" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("ALOGO") %>' /><br />
                            AWAY : <asp:Label Text='<%# Eval("ANAME") %>' runat="server" ID="LabelAC" /></td>
                        <td>
                            
                              <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate> <div class="ContainerScoresRadius"><asp:Image ID="ImageACourt" runat="server" ImageUrl="~/images/courtspotA.jpg" /></div> </ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel></td><td>
       
         <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate> <div class="ContainerScoresRadius"><asp:Image ID="Image3" runat="server" ImageUrl="~/images/courtZoutA.jpg" /></div> </ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel></td>
                               </tr>
                            </ItemTemplate></asp:Repeater>
                            
                        
                    </table>
                        <p><strong style="color:red"> ΚΟΚΚΙΝΟΙ ΚΥΚΛΟΙ : ΑΣΤΟΧΑ SHOOT</strong>
                    <br /><strong style="color:green">ΠΡΑΣΙΝΟΙ ΚΥΚΛΟΙ : ΕΥΣΤΟΧΑ SHOOT</strong></p>

            </ContentTemplate></ajaxToolkit:TabPanel>
           
             <ajaxToolkit:TabPanel ID="TabPanel4" HeaderText="CHART COMPARE" runat="server" >
        <contenttemplate><br /><h4 style="color:#78C1DD"><div class="ContainerTabTextRadius">➥      ΣΤΑΤΙΣΤΙΚΑ ΓΡΑΦΗΜΑΤΑ</div></h4><br />
            <table>
                <tr><td colspan ="2">
                 <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate>
                    <asp:Chart ID="ChartScore" runat="server" CssClass="ContainerRadius" BackColor="193, 220, 229" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="96, 129, 197" BackHatchStyle="DottedDiamond">
                    <Series>
                        <asp:Series Name="HOME" ChartType="Line" YValuesPerPoint="6"></asp:Series>
                        <asp:Series Name="AWAY" ChartType="Line" YValuesPerPoint="6"></asp:Series>                                      
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption"><AxisX Title="ΧΡΟΝΟΣ" TitleForeColor="DarkBlue" LineColor="Navy" LineDashStyle="DashDotDot" LineWidth="3" TextOrientation="Horizontal" TitleAlignment="Center"></AxisX>
                    <AxisY TextOrientation="Stacked" Title="ΠΟΝΤΟΙ" TitleForeColor="DarkBlue" LineColor="Navy" LineDashStyle="DashDotDot" LineWidth="3" TitleAlignment="Center"></AxisY></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="ΔΙΑΚΥΜΑΝΣΗ ΑΓΩΝΑ" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>

            </asp:Chart></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel>

                                      </td></tr><tr><td colspan ="2">
                <div class="ContainerScoresRadius"> <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><asp:Label ID="LabelSdifH" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="LabelSdifA" runat="server" Text=""></asp:Label></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel></div>
                    </td></tr><tr><td>
                                           <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><asp:Chart ID="ChartCompare" runat="server" CssClass="ContainerRadius" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="HOME" IsValueShownAsLabel="true" ChartType="Bar"></asp:Series>
                    <asp:Series Name="AWAY" IsValueShownAsLabel="true" ChartType="Bar"></asp:Series>                                      
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption"></asp:ChartArea>
                </ChartAreas>
                 <Legends><asp:Legend Title="ΣΥΓΚΡΙΣΗ" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>
            </asp:Chart></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel></td><td><asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><asp:Chart ID="Chart100P" runat="server" CssClass="ContainerRadius" BackColor="#c1dce5" BackImageWrapMode="Unscaled" BackImage="~/images/chartLivescore.png" BackImageAlignment="BottomRight" BackImageTransparentColor="#6081c5"  BackHatchStyle="DottedDiamond">
                <Series>
                    <asp:Series Name="HOME" IsValueShownAsLabel="true" ChartType="StackedBar100"></asp:Series>
                    <asp:Series Name="AWAY" IsValueShownAsLabel="true" ChartType="StackedBar100"></asp:Series>                                      
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BackColor="GradientActiveCaption"></asp:ChartArea>
                </ChartAreas>
                <Legends><asp:Legend Title="ΠΟΣΟΣΤΙΑΊΑ ΣΥΓΚΡΙΣΗ" TitleAlignment="Near" BackColor="#e2f5fc" Alignment="Near" TitleSeparator="ThickGradientLine" Docking="Bottom"></asp:Legend></Legends>

            </asp:Chart></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel></td></tr></table>
            


        </contenttemplate></ajaxToolkit:TabPanel>

            <ajaxToolkit:TabPanel ID="TabPanel5" HeaderText="LEADERS" runat="server" >
        <contenttemplate> 
    <br /><h4 style="color:#78C1DD"><div class="ContainerTabTextRadius">➥      LEADERS</div></h4><br />
           <div class="ContainerleadersRadius"><asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate><table><tr><td style="vertical-align: Top">
       <asp:GridView ID="GridViewLeaders" runat="server" OnRowDataBound="GridViewLeaders_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
           <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>
           <RowStyle ForeColor="#000066"></RowStyle>          
       </asp:GridView></td><td style="vertical-align: Top"><asp:GridView ID="GridViewLeadersA" runat="server" OnRowDataBound="GridViewLeaders_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
           <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>
           <RowStyle ForeColor="#000066"></RowStyle> 
                                                           </asp:GridView></td></tr></table></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers></asp:UpdatePanel> </div>
            </ContentTemplate></ajaxToolkit:TabPanel>

        </ajaxToolkit:TabContainer><asp:SqlDataSource runat="server" ID="SqlDataSourceSCourt" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT HT.NAME AS HNAME, HT.LOGO AS HLOGO, AT.NAME AS ANAME, AT.LOGO AS ALOGO FROM GAMES INNER JOIN TEAMS AS HT ON GAMES.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON GAMES.AWAY_TEAM_ID = AT.ID WHERE (GAMES.ID = @GAME_ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="GAME_ID" Name="GAME_ID"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
    </div><br />
         <asp:Timer ID="Timer1" runat="server" Interval="20000" OnTick="Timer1_Tick" ></asp:Timer>
         
    </form>
</body>
</html>
