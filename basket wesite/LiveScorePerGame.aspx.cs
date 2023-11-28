using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class LiveScorePerGame : System.Web.UI.Page
{
    //public  List<int> EventsPerPeriodCounter = new List<int>();
    public class Coordinates
    {
        public int SType { get; set; }
        public int X { get; set; }
        public int Y { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int GameId = Convert.ToInt16(Request.QueryString["GAME_ID"]);

        XDocument xmlDoc = XDocument.Load(Server.MapPath(@"livegames\" + GameId.ToString() + "HomeXMLStats.xml"));
        XDocument xmlDocA = XDocument.Load(Server.MapPath(@"livegames\" + GameId.ToString() + "AwayXMLStats.xml"));
        //HOME
        string HTeamName = "", HTeamId = null, HFastbreaks = null, HTimeouts = null;
        var StatsTeam = from Team in xmlDoc.Descendants("HomeTeam")
                        select new
                        {
                            TId = Team.Element("HomeTeamId").Value,
                            TName = Team.Element("HomeTeamName").Value,
                            FB = Team.Element("FastbreaksMade").Value + "/" + Convert.ToString(Convert.ToInt16(Team.Element("FastbreaksMade").Value) + Convert.ToInt16(Team.Element("FastbreaksMissed").Value)),
                            TIMEOUT = Team.Element("TimeOut").Value
                        };
        foreach (var Team in StatsTeam)
        {
            HTeamName = Team.TName;
            HTeamId = Team.TId;
            HFastbreaks = Team.FB;
            HTimeouts = Team.TIMEOUT;
        }
        //AWAY
        string ATeamName = "", ATeamId = null, AFastbreaks = null, ATimeouts = null;
        var StatsTeamA = from TeamA in xmlDocA.Descendants("AwayTeam")
                         select new
                         {
                             TId = TeamA.Element("AwayTeamId").Value,
                             TName = TeamA.Element("AwayTeamName").Value,
                             FB = TeamA.Element("FastbreaksMade").Value + "/" + Convert.ToString(Convert.ToInt16(TeamA.Element("FastbreaksMade").Value) + Convert.ToInt16(TeamA.Element("FastbreaksMissed").Value)),
                             TIMEOUT = TeamA.Element("TimeOut").Value
                         };
        foreach (var TeamA in StatsTeamA)
        {
            ATeamName = TeamA.TName;
            ATeamId = TeamA.TId;
            AFastbreaks = TeamA.FB;
            ATimeouts = TeamA.TIMEOUT;
        }

        //quarter scores
        int cQ = xmlDoc.Descendants("HomeTeam").Elements().Count();
        DataTable dtq = new DataTable();
        dtq.Columns.Add(new DataColumn("TEAM", typeof(string)));
        string[] Qs = new string[] { "1st Q", "2nd Q", "3rd Q", "4th Q", "1st O", "2nd O", "3rd O", "4th OI", "5th O", "6th O", "7th O", "8th O", "9th O", "10th O" };
        for (int i = 5; i < cQ; i++)
        {
            dtq.Columns.Add(Qs[i - 5].ToString().Replace(" ", string.Empty), typeof(int));
        }
        if (cQ > 5)
        {
            dtq.Rows.Add(HTeamName, Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(5).Value.ToString()));
            dtq.Rows.Add(ATeamName, Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(5).Value.ToString()));
            dtq.Rows.Add(HTeamName, Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(5).Value.ToString()));
            dtq.Rows.Add(ATeamName, Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(5).Value.ToString()));
        }
        for (int i = 6; i < cQ; i++)
        {

            dtq.Rows[0][i - 4] = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(i).Value.ToString());
            dtq.Rows[1][i - 4] = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(i).Value.ToString());

            dtq.Rows[2][i - 4] = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(i).Value.ToString()) - Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(i - 1).Value.ToString());
            dtq.Rows[3][i - 4] = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(i).Value.ToString()) - Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(i - 1).Value.ToString());

        }
        GridViewQScore.DataSource = dtq; GridViewQScore.DataBind();

        //box Home
        var StatsEvents = from Player in xmlDoc.Descendants("Player")
                          select new
                          {
                              No = Player.Element("PlayerNo").Value,
                              Name = Player.Element("PlayerName").Value,
                              MP = Player.Element("MinutesPlayed").Value,
                              P = Convert.ToInt16(Player.Element("FTMade").Value) + 2 * Convert.ToInt16(Player.Element("TwoPMade").Value) + 3 * Convert.ToInt16(Player.Element("ThreePMade").Value),
                              FT = Player.Element("FTMade").Value + "/" + Convert.ToString(Convert.ToInt16(Player.Element("FTMade").Value) + Convert.ToInt16(Player.Element("FTMissed").Value)),
                              TwoP = Player.Element("TwoPMade").Value + "/" + Convert.ToString(Convert.ToInt16(Player.Element("TwoPMade").Value) + Convert.ToInt16(Player.Element("TwoPMissed").Value)),
                              ThreeP = Player.Element("ThreePMade").Value + "/" + Convert.ToString(Convert.ToInt16(Player.Element("ThreePMade").Value) + Convert.ToInt16(Player.Element("ThreePMissed").Value)),
                              DR = Player.Element("DefRebound").Value,
                              OR = Player.Element("OffRebound").Value,
                              AS = Player.Element("Assist").Value,
                              TO = Player.Element("Turnover").Value,
                              ST = Player.Element("Steal").Value,
                              BL = Player.Element("Block").Value,
                              BA = Player.Element("BlockAgainst").Value,
                              F = Player.Element("Foul").Value,
                              FO = Player.Element("FoulOn").Value,
                              UF = Player.Element("UnsportsmanFoul").Value,

                              INR = (Convert.ToInt16(Player.Element("FTMade").Value) + 2 * Convert.ToInt16(Player.Element("TwoPMade").Value) + 3 * Convert.ToInt16(Player.Element("ThreePMade").Value)) + (Convert.ToInt16(Player.Element("DefRebound").Value) + Convert.ToInt16(Player.Element("OffRebound").Value)) + Convert.ToInt16(Player.Element("Assist").Value) + Convert.ToInt16(Player.Element("Steal").Value) + Convert.ToInt16(Player.Element("Block").Value) + Convert.ToInt16(Player.Element("FoulOn").Value) - ((Convert.ToInt16(Player.Element("FTMissed").Value) + 2 * Convert.ToInt16(Player.Element("TwoPMissed").Value) + 3 * Convert.ToInt16(Player.Element("ThreePMissed").Value)) + Convert.ToInt16(Player.Element("Turnover").Value) + Convert.ToInt16(Player.Element("Foul").Value)),

                              FTM = Player.Element("FTMade").Value,
                              FTMI = Player.Element("FTMissed").Value,
                              TM = Player.Element("TwoPMade").Value,
                              TMI = Player.Element("TwoPMissed").Value,
                              THM = Player.Element("ThreePMade").Value,
                              THMI = Player.Element("ThreePMissed").Value

                          };

        DataTable dtp = new DataTable();
        dtp.Columns.Add(new DataColumn("No", typeof(string)));
        dtp.Columns.Add(new DataColumn("Name", typeof(string)));
        dtp.Columns.Add(new DataColumn("MP", typeof(string)));
        dtp.Columns.Add(new DataColumn("P", typeof(int)));
        dtp.Columns.Add(new DataColumn("FT", typeof(string)));
        dtp.Columns.Add(new DataColumn("2P", typeof(string)));
        dtp.Columns.Add(new DataColumn("3P", typeof(string)));
        dtp.Columns.Add(new DataColumn("DR", typeof(int)));
        dtp.Columns.Add(new DataColumn("OR", typeof(int)));
        dtp.Columns.Add(new DataColumn("AS", typeof(int)));
        dtp.Columns.Add(new DataColumn("TO", typeof(int)));
        dtp.Columns.Add(new DataColumn("ST", typeof(int)));
        dtp.Columns.Add(new DataColumn("BL", typeof(int)));
        dtp.Columns.Add(new DataColumn("BA", typeof(int)));
        dtp.Columns.Add(new DataColumn("FM", typeof(int)));
        dtp.Columns.Add(new DataColumn("FO", typeof(int)));
        dtp.Columns.Add(new DataColumn("UF", typeof(int)));
        dtp.Columns.Add(new DataColumn("IND", typeof(int)));
        int FTAM = 0; int FTAMI = 0; int TM = 0; int TMI = 0; int THM = 0; int THMI = 0;
        foreach (var Player in StatsEvents)
        {
            dtp.Rows.Add(Player.No, Player.Name, Player.MP, Player.P, Player.FT, Player.TwoP, Player.ThreeP, Player.DR, Player.OR, Player.AS, Player.TO, Player.ST, Player.BL, Player.BA, Player.F, Player.FO, Player.UF, Player.INR);
            FTAM += Convert.ToInt32(Player.FTM); FTAMI += Convert.ToInt32(Player.FTMI);
            TM += Convert.ToInt32(Player.TM); TMI += Convert.ToInt32(Player.TMI);
            THM += Convert.ToInt32(Player.THM); THMI += Convert.ToInt32(Player.THMI);
        }

        int AM = 0; int AP = 0; int ADR = 0; int AOR = 0; int AS = 0; int AT = 0; ; int AST = 0; int AB = 0; int ABA = 0; int AF = 0; int AFO = 0; int AUF = 0; int IND = 0;
        for (int i = 0; i < dtp.Rows.Count; i++)
        {
            AM += Convert.ToInt32(dtp.Rows[i][2]);
            AP += Convert.ToInt32(dtp.Rows[i][3]);
            ADR += Convert.ToInt32(dtp.Rows[i][7]);
            AOR += Convert.ToInt32(dtp.Rows[i][8]);
            AS += Convert.ToInt32(dtp.Rows[i][9]);
            AT += Convert.ToInt32(dtp.Rows[i][10]);
            AST += Convert.ToInt32(dtp.Rows[i][11]);
            AB += Convert.ToInt32(dtp.Rows[i][12]);
            ABA += Convert.ToInt32(dtp.Rows[i][13]);
            AF += Convert.ToInt32(dtp.Rows[i][14]);
            AFO += Convert.ToInt32(dtp.Rows[i][15]);
            AUF += Convert.ToInt32(dtp.Rows[i][16]);
            IND += Convert.ToInt32(dtp.Rows[i][17]);
        }
        dtp.Rows.Add("#", "TOTAL", ((AM / 60) + ":" + (AM % 60)).ToString(), AP, FTAM + "/" + (FTAM + FTAMI), TM + "/" + (TM + TMI), THM + "/" + (THM + THMI), ADR, AOR, AS, AT, AST, AB, ABA, AF, AFO, AUF, IND);

        for (int i = 0; i < dtp.Rows.Count - 1; i++)
        {
            TimeSpan minss = TimeSpan.FromSeconds(Convert.ToInt16(dtp.Rows[i][2].ToString()));
            dtp.Rows[i][2] = minss.ToString(@"mm\:ss");
        }
        GridViewBoxHome.DataSource = dtp;
        GridViewBoxHome.DataBind();
        //box gridview footer style
        GridViewBoxHome.Rows[GridViewBoxHome.Rows.Count - 1].Attributes.Add("style", "color:black;background-color:#f1a861;font-size:large;Font-Weight:Bold;");

        DataTable dtTH = new DataTable();
        dtTH.Columns.Add(new DataColumn("FASTBREAK", typeof(string)));
        dtTH.Columns.Add(new DataColumn("TIMEOUT", typeof(string)));
        dtTH.Columns.Add(new DataColumn("FREE THROWS", typeof(string)));
        dtTH.Columns.Add(new DataColumn("2 POINTS", typeof(string)));
        dtTH.Columns.Add(new DataColumn("3 POINTS", typeof(string)));

        dtTH.Rows.Add(HFastbreaks, HTimeouts, string.Format("{0} ⤵ {1:P1}", FTAM + "/" + (FTAM + FTAMI), Convert.ToDouble(FTAM) / (FTAM + FTAMI)), string.Format("{0} ⤵ {1:P1}", TM + "/" + (TM + TMI), Convert.ToDouble(TM) / (TM + TMI)), string.Format("{0} ⤵ {1:P1}", THM + "/" + (THM + THMI), Convert.ToDouble(THM) / (THM + THMI)));
        GridViewTeamH.DataSource = dtTH;
        GridViewTeamH.DataBind();
        GridViewTeamH.Rows[0].Attributes.Add("style", "font-size:large;Font-Weight:Bold;");

        //box Away
        var StatsEventsA = from PlayerA in xmlDocA.Descendants("Player")
                           select new
                           {
                               No = PlayerA.Element("PlayerNo").Value,
                               Name = PlayerA.Element("PlayerName").Value,
                               MP = PlayerA.Element("MinutesPlayed").Value,
                               P = Convert.ToInt16(PlayerA.Element("FTMade").Value) + 2 * Convert.ToInt16(PlayerA.Element("TwoPMade").Value) + 3 * Convert.ToInt16(PlayerA.Element("ThreePMade").Value),
                               FT = PlayerA.Element("FTMade").Value + "/" + Convert.ToString(Convert.ToInt16(PlayerA.Element("FTMade").Value) + Convert.ToInt16(PlayerA.Element("FTMissed").Value)),
                               TwoP = PlayerA.Element("TwoPMade").Value + "/" + Convert.ToString(Convert.ToInt16(PlayerA.Element("TwoPMade").Value) + Convert.ToInt16(PlayerA.Element("TwoPMissed").Value)),
                               ThreeP = PlayerA.Element("ThreePMade").Value + "/" + Convert.ToString(Convert.ToInt16(PlayerA.Element("ThreePMade").Value) + Convert.ToInt16(PlayerA.Element("ThreePMissed").Value)),
                               DR = PlayerA.Element("DefRebound").Value,
                               OR = PlayerA.Element("OffRebound").Value,
                               AS = PlayerA.Element("Assist").Value,
                               TO = PlayerA.Element("Turnover").Value,
                               ST = PlayerA.Element("Steal").Value,
                               BL = PlayerA.Element("Block").Value,
                               BA = PlayerA.Element("BlockAgainst").Value,
                               F = PlayerA.Element("Foul").Value,
                               FO = PlayerA.Element("FoulOn").Value,
                               UF = PlayerA.Element("UnsportsmanFoul").Value,

                               INR = (Convert.ToInt16(PlayerA.Element("FTMade").Value) + 2 * Convert.ToInt16(PlayerA.Element("TwoPMade").Value) + 3 * Convert.ToInt16(PlayerA.Element("ThreePMade").Value)) + (Convert.ToInt16(PlayerA.Element("DefRebound").Value) + Convert.ToInt16(PlayerA.Element("OffRebound").Value)) + Convert.ToInt16(PlayerA.Element("Assist").Value) + Convert.ToInt16(PlayerA.Element("Steal").Value) + Convert.ToInt16(PlayerA.Element("Block").Value) + Convert.ToInt16(PlayerA.Element("FoulOn").Value) - ((Convert.ToInt16(PlayerA.Element("FTMissed").Value) + 2 * Convert.ToInt16(PlayerA.Element("TwoPMissed").Value) + 3 * Convert.ToInt16(PlayerA.Element("ThreePMissed").Value)) + Convert.ToInt16(PlayerA.Element("Turnover").Value) + Convert.ToInt16(PlayerA.Element("Foul").Value)),

                               FTM = PlayerA.Element("FTMade").Value,
                               FTMI = PlayerA.Element("FTMissed").Value,
                               TM = PlayerA.Element("TwoPMade").Value,
                               TMI = PlayerA.Element("TwoPMissed").Value,
                               THM = PlayerA.Element("ThreePMade").Value,
                               THMI = PlayerA.Element("ThreePMissed").Value
                           };

        DataTable dtpa = new DataTable();
        dtpa.Columns.Add(new DataColumn("No", typeof(string)));
        dtpa.Columns.Add(new DataColumn("Name", typeof(string)));
        dtpa.Columns.Add(new DataColumn("MP", typeof(string)));
        dtpa.Columns.Add(new DataColumn("P", typeof(int)));
        dtpa.Columns.Add(new DataColumn("FT", typeof(string)));
        dtpa.Columns.Add(new DataColumn("2P", typeof(string)));
        dtpa.Columns.Add(new DataColumn("3P", typeof(string)));
        dtpa.Columns.Add(new DataColumn("DR", typeof(int)));
        dtpa.Columns.Add(new DataColumn("OR", typeof(int)));
        dtpa.Columns.Add(new DataColumn("AS", typeof(int)));
        dtpa.Columns.Add(new DataColumn("TO", typeof(int)));
        dtpa.Columns.Add(new DataColumn("ST", typeof(int)));
        dtpa.Columns.Add(new DataColumn("BL", typeof(int)));
        dtpa.Columns.Add(new DataColumn("BA", typeof(int)));
        dtpa.Columns.Add(new DataColumn("FM", typeof(int)));
        dtpa.Columns.Add(new DataColumn("FO", typeof(int)));
        dtpa.Columns.Add(new DataColumn("UF", typeof(int)));
        dtpa.Columns.Add(new DataColumn("IND", typeof(int)));
        int FTAMA = 0; int FTAMIA = 0; int TMA = 0; int TMIA = 0; int THMA = 0; int THMIA = 0;

        foreach (var PlayerA in StatsEventsA)
        {
            dtpa.Rows.Add(PlayerA.No, PlayerA.Name, PlayerA.MP, PlayerA.P, PlayerA.FT, PlayerA.TwoP, PlayerA.ThreeP, PlayerA.DR, PlayerA.OR, PlayerA.AS, PlayerA.TO, PlayerA.ST, PlayerA.BL, PlayerA.BA, PlayerA.F, PlayerA.FO, PlayerA.UF, PlayerA.INR);

            FTAMA += Convert.ToInt32(PlayerA.FTM); FTAMIA += Convert.ToInt32(PlayerA.FTMI);
            TMA += Convert.ToInt32(PlayerA.TM); TMIA += Convert.ToInt32(PlayerA.TMI);
            THMA += Convert.ToInt32(PlayerA.THM); THMIA += Convert.ToInt32(PlayerA.THMI);
        }

        int AMA = 0; int APA = 0; int ADRA = 0; int AORA = 0; int ASA = 0; int ATA = 0; ; int ASTA = 0; int ABAW = 0; int ABAA = 0; int AFA = 0; int AFOA = 0; int AUFA = 0; int INDA = 0;
        for (int i = 0; i < dtpa.Rows.Count; i++)
        {
            AMA += Convert.ToInt32(dtpa.Rows[i][2]);
            APA += Convert.ToInt32(dtpa.Rows[i][3]);
            ADRA += Convert.ToInt32(dtpa.Rows[i][7]);
            AORA += Convert.ToInt32(dtpa.Rows[i][8]);
            ASA += Convert.ToInt32(dtpa.Rows[i][9]);
            ATA += Convert.ToInt32(dtpa.Rows[i][10]);
            ASTA += Convert.ToInt32(dtpa.Rows[i][11]);
            ABAW += Convert.ToInt32(dtpa.Rows[i][12]);
            ABAA += Convert.ToInt32(dtpa.Rows[i][13]);
            AFA += Convert.ToInt32(dtpa.Rows[i][14]);
            AFOA += Convert.ToInt32(dtpa.Rows[i][15]);
            AUFA += Convert.ToInt32(dtpa.Rows[i][16]);
            INDA += Convert.ToInt32(dtpa.Rows[i][17]);
        }
        dtpa.Rows.Add("#", "TOTAL", ((AMA / 60) + ":" + (AMA % 60)).ToString(), APA, FTAMA + "/" + (FTAMA + FTAMIA), TMA + "/" + (TMA + TMIA), THMA + "/" + (THMA + THMIA), ADRA, AORA, ASA, ATA, ASTA, ABAW, ABAA, AFA, AFOA, AUFA, INDA);
        for (int i = 0; i < dtpa.Rows.Count - 1; i++)
        {
            TimeSpan mnss = TimeSpan.FromSeconds(Convert.ToInt16(dtpa.Rows[i][2].ToString()));
            dtpa.Rows[i][2] = mnss.ToString(@"mm\:ss");
        }
        GridViewBoxAway.DataSource = dtpa;
        GridViewBoxAway.DataBind();
        //box gridview footer style
        GridViewBoxAway.Rows[GridViewBoxAway.Rows.Count - 1].Attributes.Add("style", "color:black;background-color:#f1a861;font-size:large;Font-Weight:Bold;");

        DataTable dtTA = new DataTable();
        dtTA.Columns.Add(new DataColumn("FASTBREAK", typeof(string)));
        dtTA.Columns.Add(new DataColumn("TIMEOUT", typeof(string)));
        dtTA.Columns.Add(new DataColumn("FREE THROWS", typeof(string)));
        dtTA.Columns.Add(new DataColumn("2 POINTS", typeof(string)));
        dtTA.Columns.Add(new DataColumn("3 POINTS", typeof(string)));
        dtTA.Rows.Add(AFastbreaks, ATimeouts, string.Format("{0} ⤵ {1:P1}", FTAMA + "/" + (FTAMA + FTAMIA), Convert.ToDouble(FTAMA) / (FTAMA + FTAMIA)), string.Format("{0} ⤵ {1:P1}", TMA + "/" + (TMA + TMIA), Convert.ToDouble(TMA) / (TMA + TMIA)), string.Format("{0} ⤵ {1:P1}", THMA + "/" + (THMA + THMIA), Convert.ToDouble(THMA) / (THMA + THMIA)));
        GridViewTeamA.DataSource = dtTA;
        GridViewTeamA.DataBind();
        GridViewTeamA.Rows[0].Attributes.Add("style", "font-size:large;Font-Weight:Bold;");

       ////////////images d place
        DrawImages();
        //chart compare
        int[] Hteam = new int[6];
        Hteam[0] = Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][7].ToString()) + Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][8].ToString());
        Hteam[1] = Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][9].ToString());
        Hteam[2] = Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][10].ToString());
        Hteam[3] = Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][11].ToString());
        Hteam[4] = Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][14].ToString());
        Hteam[5] = Convert.ToInt16(dtp.Rows[dtp.Rows.Count - 1][12].ToString());
        int[] Ateam = new int[6];
        Ateam[0] = Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][7].ToString()) + Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][8].ToString());
        Ateam[1] = Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][9].ToString());
        Ateam[2] = Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][10].ToString());
        Ateam[3] = Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][11].ToString());
        Ateam[4] = Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][14].ToString());
        Ateam[5] = Convert.ToInt16(dtpa.Rows[dtpa.Rows.Count - 1][12].ToString());

        //int[] Tteams = new int[5];
        //for (int i = 0; i < 5; i++) { Tteams[i] = Hteam[i] + Ateam[i]; }

        Chart100P.Series[0].Points.DataBindY(Hteam);
        Chart100P.Series[1].Points.DataBindY(Ateam); Chart100P.Series[0].Color = Color.OrangeRed;

        Chart100P.Series[0].Points[0].AxisLabel = "REBOUNDS";
        Chart100P.Series[0].Points[1].AxisLabel = "ASSISTS";
        Chart100P.Series[0].Points[2].AxisLabel = "TURNOVERS";
        Chart100P.Series[0].Points[3].AxisLabel = "STEALS";
        Chart100P.Series[0].Points[4].AxisLabel = "FOULS";
        Chart100P.Series[0].Points[5].AxisLabel = "BLOCKS";
        Chart100P.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);

        ChartCompare.Series[0].Points.DataBindY(Hteam);
        ChartCompare.Series[1].Points.DataBindY(Ateam); ChartCompare.Series[0].Color = Color.OrangeRed;

        ChartCompare.Series[0].Points[0].AxisLabel = "REBOUNDS";
        ChartCompare.Series[0].Points[1].AxisLabel = "ASSISTS";
        ChartCompare.Series[0].Points[2].AxisLabel = "TURNOVERS";
        ChartCompare.Series[0].Points[3].AxisLabel = "STEALS";
        ChartCompare.Series[0].Points[4].AxisLabel = "FOULS";
        ChartCompare.Series[0].Points[5].AxisLabel = "BLOCKS";
        ChartCompare.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);


        //play by play listbox start
        string PBPText = xmlDoc.Descendants("Event").Elements().ElementAt(0).Value.ToString();

        string[] Evlist = PBPText.TrimEnd(' ').Split(new[] { '*' }, StringSplitOptions.RemoveEmptyEntries);
        int cE = Evlist.Length; // = event elements

        //chartdiakimansi
        string[] Perlist = new string[] { "I PERIOD", "II PERIOD", "III PERIOD", "IV PERIOD", "I OVERTIME", "II OVERTIME", "III OVERTIME", "IV OVERTIME", "V OVERTIME", "VI OVERTIME", "VII OVERTIME", "VIII OVERTIME", "IX OVERTIME", "X OVERTIME", "FINAL SCORE" };
        int Cp = xmlDoc.Descendants("HomeTeam").Elements().Count() - 6;
        //int Cp = Array.FindIndex(Perlist, row => row.ToString() == CPeriod);
        int Cpi = 0;
        List<List<string>> Plists = new List<List<string>>();
        for (int p = 0; p < Cp + 1; p++)
        {
            List<string> Per = new List<string>();
            for (int i = 0 + Cpi; i < Evlist.Count(); i++)//problem ???????????? for (int i = 0 + Cpi; i < Evlist.Count()-1 ; i++)
            {

                if (Evlist[i].Contains("Free Throw Made") || Evlist[i].Contains("Made 2P") || Evlist[i].Contains("Made 3P"))
                {
                    Per.Add(Evlist[i]);
                }
                else if (Evlist[i].Contains(Perlist[p + 1]))
                {
                    Cpi = i; //EventsPerPeriodCounter.Add(Cpi);                   
                    break;
                }
                else { }
            } Plists.Add(Per);
        }
        //EventsPerPeriodCounter.Add(Evlist.Count()); 
        List<int> HTime = new List<int>();
        List<int> ATime = new List<int>();
        List<int> HScore = new List<int>();
        List<int> AScore = new List<int>();
        int HSco = 0, ASco = 0, TPlus = 0;
        for (int i = 0; i < Plists.Count; i++)
        {
            for (int j = 0; j < Plists[i].Count(); j++)
            {
                if (Plists[i][j].Substring(0, 9).Contains(HTeamName.Substring(0, 3)))
                {
                    if (Plists[i][j].Contains("Free Throw Made"))
                    {
                        HSco++;
                        double Sec = TimeSpan.Parse(string.Format("00:{0}", Plists[i][j].ToString().Substring(0, 5))).TotalSeconds;
                        HTime.Add(600 - Convert.ToInt16(Sec) + TPlus);
                        HScore.Add(HSco);
                    }
                    else if (Plists[i][j].Contains("Made 2P"))
                    {
                        HSco += 2;
                        double Sec = TimeSpan.Parse(string.Format("00:{0}", Plists[i][j].ToString().Substring(0, 5))).TotalSeconds;
                        HTime.Add(600 - Convert.ToInt16(Sec) + TPlus);
                        HScore.Add(HSco);
                    }
                    else if (Plists[i][j].Contains("Made 3P"))
                    {
                        HSco += 3;
                        double Sec = TimeSpan.Parse(string.Format("00:{0}", Plists[i][j].ToString().Substring(0, 5))).TotalSeconds;
                        HTime.Add(600 - Convert.ToInt16(Sec) + TPlus);
                        HScore.Add(HSco);
                    }
                    else { }
                }
                else if (Plists[i][j].Substring(0, 9).Contains(ATeamName.Substring(0, 3)))
                {
                    if (Plists[i][j].Contains("Free Throw Made"))
                    {
                        ASco++;
                        double Sec = TimeSpan.Parse(string.Format("00:{0}", Plists[i][j].ToString().Substring(0, 5))).TotalSeconds;
                        ATime.Add(600 - Convert.ToInt16(Sec) + TPlus);
                        AScore.Add(ASco);
                    }
                    else if (Plists[i][j].Contains("Made 2P"))
                    {
                        ASco += 2;
                        double Sec = TimeSpan.Parse(string.Format("00:{0}", Plists[i][j].ToString().Substring(0, 5))).TotalSeconds;
                        ATime.Add(600 - Convert.ToInt16(Sec) + TPlus);
                        AScore.Add(ASco);
                    }
                    else if (Plists[i][j].Contains("Made 3P"))
                    {
                        ASco += 3;
                        double Sec = TimeSpan.Parse(string.Format("00:{0}", Plists[i][j].ToString().Substring(0, 5))).TotalSeconds;
                        ATime.Add(600 - Convert.ToInt16(Sec) + TPlus);
                        AScore.Add(ASco);
                    }
                    else { }
                }
                else { }
            } if (i < 4) TPlus += 600; else { TPlus += 300; }
        }
        ChartScore.Series[0].Points.DataBindXY(HTime, HScore);
        ChartScore.Series[1].Points.DataBindXY(ATime, AScore);
        ChartScore.Width = 550; ChartScore.Series[0].BorderWidth = 4; ChartScore.Series[1].BorderWidth = 4; ChartScore.Series[0].Color = Color.OrangeRed;
        int aX = 0, bX = 1180;
        for (int i = 0; i < Plists.Count; i++)
        {
            ChartScore.ChartAreas[0].AxisX.CustomLabels.Add(aX, bX, Qs[i]); aX += 600; bX += 600;
        } ChartScore.ChartAreas[0].AxisX.TitleFont = new Font("Arial", 12, FontStyle.Bold); ChartScore.ChartAreas[0].AxisY.TitleFont = new Font("Arial", 12, FontStyle.Bold);

        //PLAY BY PLAY LISTBO FILL
        DataTable dtpbp = new DataTable();
        dtpbp.Columns.Add(new DataColumn("PlayByPlay", typeof(string)));
        HScore.Insert(0, 0); AScore.Insert(0, 0);
        int HSi = 0, ASi = 0; List<int> scoreDif = new List<int>();
        foreach (string Event in Evlist)
        {
            if (Event.Contains("Free Throw Made") || Event.Contains("Made 2P") || Event.Contains("Made 3P"))
            {
                if (Event.Substring(0, 9).Contains(HTeamName.Substring(0, 3)))
                {
                    HSi++;
                    dtpbp.Rows.Add(string.Format("{0}➱ [{1} - {2}]", Event, HScore[HSi], AScore[ASi]));
                    scoreDif.Add(HScore[HSi] - AScore[ASi]);
                }
                else
                {
                    ASi++;
                    dtpbp.Rows.Add(string.Format("{0}➱ [{1} - {2}]", Event, HScore[HSi], AScore[ASi]));
                    scoreDif.Add(HScore[HSi] - AScore[ASi]);
                }
            }
            else
            {
                dtpbp.Rows.Add(Event.ToString());
            }
        }
        if (scoreDif.Count > 0)
        {
            int HomeMaxDif; int AwayMaxDif;
            if (scoreDif.Max() > 0)
            {
                HomeMaxDif = scoreDif.Max();
            }
            else { HomeMaxDif = 0; }
            if (scoreDif.Min() < 0)
            {
                AwayMaxDif = -1 * scoreDif.Min();
            }
            else { AwayMaxDif = 0; }
            LabelSdifH.Text = "ΜΕΓΙΣΤΗ ΔΙΑΦΟΡΑ ΓΗΠΕΔΟΥΧΟΥ : +" + HomeMaxDif;
            LabelSdifA.Text = "ΜΕΓΙΣΤΗ ΔΙΑΦΟΡΑ ΦΙΛΟΞΕΝΟΥΜΕΝΟΥ : +" + AwayMaxDif;
        }
        ListBoxPBP.DataSource = dtpbp;
        ListBoxPBP.DataTextField = "PlayByPlay";
        ListBoxPBP.DataBind();
        ListBoxPBP.Height = 550;
        for (int i = 0; i < ListBoxPBP.Items.Count; i++)
        {
            if (ListBoxPBP.Items[i].Text.Contains("➱")) { ListBoxPBP.Items[i].Attributes.Add("style", "Font-Weight:Bold;color:DarkBlue;background-color:#a0cfe1"); }
            else if (Perlist.Any(ListBoxPBP.Items[i].Text.Contains)) { ListBoxPBP.Items[i].Attributes.Add("style", "color:DarkBlue;background-color:aliceblue;font-size:x-large;font-family:'Snap ITC'"); } else { }
        }
        ListBoxPBP.SelectedIndex = ListBoxPBP.Items.Count - 1;

        //LEADERS HOME
        dtp.Rows.RemoveAt(dtp.Rows.Count - 1);
        dtp.DefaultView.Sort = "P desc";
        DataTable dttemp = dtp.DefaultView.ToTable();

        DataTable dtL = new DataTable();
        dtL.Columns.Add(new DataColumn("HOME", typeof(string)));
        if (Convert.ToInt16(dttemp.Rows[0][3].ToString()) > 0)
        {
            dtL.Rows.Add("POINTS");
            for (int i = 0; i < 3; i++)
            {
                if (Convert.ToInt16(dttemp.Rows[i][3].ToString()) > 0)
                {
                    dtL.Rows.Add(string.Format("{0}➱{1}", dttemp.Rows[i][3], dttemp.Rows[i][1]));
                }
                else { break; }
            }
        }

        dtp.DefaultView.Sort = "DR desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][7].ToString()) > 0)
        {
            dtL.Rows.Add("DEFFENSIVE REBOUNDS");
            for (int i = 0; i < 3; i++)
            {
                if (Convert.ToInt16(dttemp.Rows[0][7].ToString()) > 0)
                {
                    dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[i][7].ToString()), dttemp.Rows[i][1]));
                }
                else { break; }
            }
        }
        dtp.DefaultView.Sort = "OR desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][8].ToString()) > 0)
        {
            dtL.Rows.Add("OFFENSIVE REBOUNDS");
            for (int i = 0; i < 3; i++)
            {
                if (Convert.ToInt16(dttemp.Rows[0][8].ToString()) > 0)
                {
                    dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[i][8].ToString()), dttemp.Rows[i][1]));
                }
                else { break; }
            }
        }

        dtp.DefaultView.Sort = "AS desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][9].ToString()) > 0)
        {
            dtL.Rows.Add("ASSISTS");
            dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][9].ToString()), dttemp.Rows[0][1]));
        }
        dtp.DefaultView.Sort = "TO desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][10].ToString()) > 0)
        {
            dtL.Rows.Add("TURNOVERS");
            dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][10].ToString()), dttemp.Rows[0][1]));
        }
        dtp.DefaultView.Sort = "ST desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][11].ToString()) > 0)
        {
            dtL.Rows.Add("STEALS");
            dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][11].ToString()), dttemp.Rows[0][1]));
        }
        dtp.DefaultView.Sort = "BL desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][12].ToString()) > 0)
        {
            dtL.Rows.Add("BLOCKS");
            dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][12].ToString()), dttemp.Rows[0][1]));
        }
        dtp.DefaultView.Sort = "IND desc";
        dttemp = dtp.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][17].ToString()) > 0)
        {
            dtL.Rows.Add("INDEX RATING");
            dtL.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][17].ToString()), dttemp.Rows[0][1]));
        }
        GridViewLeaders.DataSource = dtL;
        GridViewLeaders.DataBind();


        //LEADERS AWAY
        dtpa.Rows.RemoveAt(dtpa.Rows.Count - 1);
        dtpa.DefaultView.Sort = "P desc";
        dttemp = dtpa.DefaultView.ToTable();
        DataTable dtLa = new DataTable();

        dtLa.Columns.Add(new DataColumn("AWAY", typeof(string)));
        if (Convert.ToInt16(dttemp.Rows[0][3].ToString()) > 0)
        {
            dtLa.Rows.Add("POINTS");
            for (int i = 0; i < 3; i++)
            {
                if (Convert.ToInt16(dttemp.Rows[i][3].ToString()) > 0)
                {
                    dtLa.Rows.Add(string.Format("{0}➱{1}", dttemp.Rows[i][3], dttemp.Rows[i][1]));
                }
                else { break; }
            }
        }

        dtpa.DefaultView.Sort = "DR desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][7].ToString()) > 0)
        {
            dtLa.Rows.Add("DEFFENSIVE REBOUNDS");
            for (int i = 0; i < 3; i++)
            {
                if (Convert.ToInt16(dttemp.Rows[0][7].ToString()) > 0)
                {
                    dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[i][7].ToString()), dttemp.Rows[i][1]));
                }
                else { break; }
            }
        }
        dtpa.DefaultView.Sort = "OR desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][8].ToString()) > 0)
        {
            dtLa.Rows.Add("OFFENSIVE REBOUNDS");
            for (int i = 0; i < 3; i++)
            {
                if (Convert.ToInt16(dttemp.Rows[0][8].ToString()) > 0)
                {
                    dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[i][8].ToString()), dttemp.Rows[i][1]));
                }
                else { break; }
            }
        }

        dtpa.DefaultView.Sort = "AS desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][9].ToString()) > 0)
        {
            dtLa.Rows.Add("ASSISTS");
            dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][9].ToString()), dttemp.Rows[0][1]));
        }
        dtpa.DefaultView.Sort = "TO desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][10].ToString()) > 0)
        {
            dtLa.Rows.Add("TURNOVERS");
            dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][10].ToString()), dttemp.Rows[0][1]));
        }
        dtpa.DefaultView.Sort = "ST desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][11].ToString()) > 0)
        {
            dtLa.Rows.Add("STEALS");
            dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][11].ToString()), dttemp.Rows[0][1]));
        }
        dtpa.DefaultView.Sort = "BL desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][12].ToString()) > 0)
        {
            dtLa.Rows.Add("BLOCKS");
            dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][12].ToString()), dttemp.Rows[0][1]));
        }
        dtpa.DefaultView.Sort = "IND desc";
        dttemp = dtpa.DefaultView.ToTable();
        if (Convert.ToInt16(dttemp.Rows[0][17].ToString()) > 0)
        {
            dtLa.Rows.Add("INDEX RATING");
            dtLa.Rows.Add(string.Format("{0}➱{1}", Convert.ToInt16(dttemp.Rows[0][17].ToString()), dttemp.Rows[0][1]));
        }
        GridViewLeadersA.DataSource = dtLa;
        GridViewLeadersA.DataBind();

        //for (int i = 0; i < Cp; i++) {


        //    for (int j = 1; j < EventsPerPeriodCounter[i]; j++)
        //    {
        //        ListBoxPBP.Items[j].
        //    }
        //}



        //    if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "move")
        //    {
        //        int idx = ListBoxPBP.SelectedIndex;
        //        //ListItem item = ListBoxPBP.SelectedItem;
        //        //ListBox1.Items.Remove(item);
        //        //ListBox2.SelectedIndex = -1;
        //        //ListBox2.Items.Add(item);
        //    }
        //ListBoxPBP.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(ListBoxPBP, "move"));
    }
    protected void gvHover_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Add CSS class on header row.
        if (e.Row.RowType == DataControlRowType.Header)
            e.Row.CssClass = "header";

        //Add CSS class on normal row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Normal)
            e.Row.CssClass = "normal";

        //Add CSS class on alternate row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Alternate)
            e.Row.CssClass = "alternate";
    }
    //protected void ListBoxPBP_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    //ListBoxPBP.SelectedIndex = -1;
    //    if (ListBoxPBP.SelectedItem != null)
    //        ListBoxPBP.SelectedItem.Attributes.Add("style", "background-color:black");
    //}
    private void DrawImages()
    {
        //epanalipsi metablitwn
        int GameId = Convert.ToInt16(Request.QueryString["GAME_ID"]);
        XDocument xmlDoc = XDocument.Load(Server.MapPath(@"livegames\" + GameId.ToString() + "HomeXMLStats.xml"));
        XDocument xmlDocA = XDocument.Load(Server.MapPath(@"livegames\" + GameId.ToString() + "AwayXMLStats.xml"));
        string HTeamName = xmlDoc.Descendants("HomeTeam").Elements().ElementAt(1).Value.ToString();
        string ATeamName = xmlDocA.Descendants("AwayTeam").Elements().ElementAt(1).Value.ToString();

        //epanalipsi metablitwn///////
        
        //SHOOTING COURT
        if (xmlDoc.Descendants("CoordinatesHome").Elements().Count() > 0)
        {
            string XYTextH = xmlDoc.Descendants("CoordinatesHome").Elements().ElementAt(0).Value.ToString();
            string XYTextA = xmlDocA.Descendants("CoordinatesAway").Elements().ElementAt(0).Value.ToString();

            string[] XYHomelist = XYTextH.TrimEnd(' ').Split(new[] { '*' }, StringSplitOptions.RemoveEmptyEntries);
            string[] XYAwaylist = XYTextA.TrimEnd(' ').Split(new[] { '*' }, StringSplitOptions.RemoveEmptyEntries);

            //home xy
            List<Coordinates> coordinatesH = new List<Coordinates>();
            for (int i = 0; i < XYHomelist.Count(); i++)
            {
                string[] HCooTemp = XYHomelist[i].ToString().TrimEnd(' ').Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                coordinatesH.Add(new Coordinates()
                {
                    SType = Convert.ToInt16(HCooTemp[0]),
                    X = Convert.ToInt16(HCooTemp[1]),
                    Y = Convert.ToInt16(HCooTemp[2])
                });
            }
            //away xy
            List<Coordinates> coordinatesA = new List<Coordinates>();
            for (int i = 0; i < XYAwaylist.Count(); i++)
            {
                string[] ACooTemp = XYAwaylist[i].ToString().TrimEnd(' ').Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                coordinatesA.Add(new Coordinates()
                {
                    SType = Convert.ToInt16(ACooTemp[0]),
                    X = Convert.ToInt16(ACooTemp[1]),
                    Y = Convert.ToInt16(ACooTemp[2])
                });
            }
            //home sum
            int M31 = 0, M32 = 0, M33 = 0, M24 = 0, M25 = 0, M26 = 0, M27 = 0;
            int Mi31 = 0, Mi32 = 0, Mi33 = 0, Mi24 = 0, Mi25 = 0, Mi26 = 0, Mi27 = 0;
            for (int i = 0; i < coordinatesH.Count; i++)
            {
                if (coordinatesH[i].SType == 4)
                {
                    if (coordinatesH[i].X <= 67) { Mi31++; }
                    else if (coordinatesH[i].X >= 204) { Mi33++; }
                    else { Mi32++; }
                }
                else if (coordinatesH[i].SType == 5)
                {
                    if (coordinatesH[i].X <= 67) { M31++; }
                    else if (coordinatesH[i].X >= 204) { M33++; }
                    else { M32++; }
                }
                else if (coordinatesH[i].SType == 2)
                {
                    if (coordinatesH[i].X <= 100) { Mi24++; }
                    else if (coordinatesH[i].X >= 170) { Mi26++; }
                    else//70<X<110
                    {
                        if (coordinatesH[i].Y <= 91) { Mi25++; }
                        else { Mi27++; }//y>50
                    }
                }
                else
                {
                    if (coordinatesH[i].X <= 100) { M24++; }
                    else if (coordinatesH[i].X >= 170) { M26++; }
                    else//70<X<110
                    {
                        if (coordinatesH[i].Y <= 91) { M25++; }
                        else { M27++; }//y>50
                    }
                }
            }

            //away sum
            int M31a = 0, M32a = 0, M33a = 0, M24a = 0, M25a = 0, M26a = 0, M27a = 0;
            int Mi31a = 0, Mi32a = 0, Mi33a = 0, Mi24a = 0, Mi25a = 0, Mi26a = 0, Mi27a = 0;
            for (int i = 0; i < coordinatesA.Count; i++)
            {
                if (coordinatesA[i].SType == 4)
                {
                    if (coordinatesA[i].X <= 67) { Mi31a++; }
                    else if (coordinatesA[i].X >= 204) { Mi33a++; }
                    else { Mi32a++; }
                }
                else if (coordinatesA[i].SType == 5)
                {
                    if (coordinatesA[i].X <= 67) { M31a++; }
                    else if (coordinatesA[i].X >= 204) { M33a++; }
                    else { M32a++; }
                }
                else if (coordinatesA[i].SType == 2)
                {
                    if (coordinatesA[i].X <= 100) { Mi24a++; }
                    else if (coordinatesA[i].X >= 170) { Mi26a++; }
                    else//70<X<110
                    {
                        if (coordinatesA[i].Y <= 91) { Mi25a++; }
                        else { Mi27a++; }//y>50
                    }
                }
                else
                {
                    if (coordinatesA[i].X <= 100) { M24a++; }
                    else if (coordinatesA[i].X >= 170) { M26a++; }
                    else//70<X<110
                    {
                        if (coordinatesA[i].Y <= 91) { M25a++; }
                        else { M27a++; }//y>50
                    }
                }
            }

            //home final strings to draw
            //3p
            string H31 = M31 + "/" + (M31 + Mi31);
            string H32 = M32 + "/" + (M32 + Mi32);
            string H33 = M33 + "/" + (M33 + Mi33);
            //2p
            string H24 = M24 + "/" + (M24 + Mi24);
            string H25 = M25 + "/" + (M25 + Mi25);
            string H26 = M26 + "/" + (M26 + Mi26);
            string H27 = M27 + "/" + (M27 + Mi27);

            //away final strings to draw
            //3p
            string H31a = M31a + "/" + (M31a + Mi31a);
            string H32a = M32a + "/" + (M32a + Mi32a);
            string H33a = M33a + "/" + (M33a + Mi33a);
            //2p
            string H24a = M24a + "/" + (M24a + Mi24a);
            string H25a = M25a + "/" + (M25a + Mi25a);
            string H26a = M26a + "/" + (M26a + Mi26a);
            string H27a = M27a + "/" + (M27a + Mi27a);

            //draw Shoot Zones home
            Bitmap bitMapImage = new
            System.Drawing.Bitmap(Server.MapPath(@"images\courtZ.jpg"));
            Graphics graphicImage = Graphics.FromImage(bitMapImage);
            //3p
            graphicImage.DrawString(H31.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(8, 120));

            graphicImage.DrawString(H32.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(115, 150));

            graphicImage.DrawString(H33.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(210, 120));

            //2p
            graphicImage.DrawString(H24.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.WindowText, new Point(40, 30));

            graphicImage.DrawString(H25.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(106, 40));

            graphicImage.DrawString(H26.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.WindowText, new Point(180, 30));

            graphicImage.DrawString(H27.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(106, 105));

            bitMapImage.Save(Server.MapPath(@"images\courtZout.jpg"), ImageFormat.Jpeg);
            graphicImage.Dispose();
            bitMapImage.Dispose();

            //draw Shoot spotes home
            Bitmap bitMapIm = new
            System.Drawing.Bitmap(Server.MapPath(@"images\court.jpg"));
            Graphics graphicIm = Graphics.FromImage(bitMapIm);

            Pen penGreen = new Pen(Color.Green, 3);
            Pen penRed = new Pen(Color.Red, 3);

            for (int i = 0; i < coordinatesH.Count; i++)
            {
                if (coordinatesH[i].SType == 3 || coordinatesH[i].SType == 5)
                {
                    graphicIm.DrawEllipse(penGreen, coordinatesH[i].X, coordinatesH[i].Y, 7, 7);
                }
                else { graphicIm.DrawEllipse(penRed, coordinatesH[i].X, coordinatesH[i].Y, 7, 7); }
            }
            bitMapIm.Save(Server.MapPath(@"images\courtspot.jpg"), ImageFormat.Jpeg);
            graphicIm.Dispose();
            bitMapIm.Dispose();

            ////////////////////////
            //draw Shoot Zones away
            Bitmap bitMapImageA = new
            System.Drawing.Bitmap(Server.MapPath(@"images\courtZ.jpg"));
            Graphics graphicImageA = Graphics.FromImage(bitMapImageA);
            //3p
            graphicImageA.DrawString(H31a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(8, 120));

            graphicImageA.DrawString(H32a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(115, 150));

            graphicImageA.DrawString(H33a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(210, 120));

            //2p
            graphicImageA.DrawString(H24a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.WindowText, new Point(40, 30));

            graphicImageA.DrawString(H25a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(106, 40));

            graphicImageA.DrawString(H26a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.WindowText, new Point(180, 30));

            graphicImageA.DrawString(H27a.ToString(),
            new Font("Arial", 14, FontStyle.Bold),
            SystemBrushes.ControlLight, new Point(106, 105));

            bitMapImageA.Save(Server.MapPath(@"images\courtZoutA.jpg"), ImageFormat.Jpeg);
            graphicImageA.Dispose();
            bitMapImageA.Dispose();

            //draw Shoot spotes away
            Bitmap bitMapImA = new
            System.Drawing.Bitmap(Server.MapPath(@"images\court.jpg"));
            Graphics graphicImA = Graphics.FromImage(bitMapImA);

            for (int i = 0; i < coordinatesA.Count; i++)
            {
                if (coordinatesA[i].SType == 3 || coordinatesA[i].SType == 5)
                {
                    graphicImA.DrawEllipse(penGreen, coordinatesA[i].X, coordinatesA[i].Y, 7, 7);
                }
                else
                {
                    graphicImA.DrawString("X", new Font("Arial", 10, FontStyle.Bold), Brushes.Red, coordinatesA[i].X, coordinatesA[i].Y);
                }
            }
            bitMapImA.Save(Server.MapPath(@"images\courtspotA.jpg"), ImageFormat.Jpeg);
            graphicImA.Dispose();
            bitMapImA.Dispose();

            //draw scoretable
            string CTime = TimeSpan.FromSeconds(Convert.ToInt16(xmlDoc.Descendants("GameInfo").Elements().ElementAt(0).Value.ToString())).ToString(@"mm\:ss");
            string CPeriod = xmlDoc.Descendants("GameInfo").Elements().ElementAt(1).Value.ToString();
            string CScore = xmlDoc.Descendants("GameInfo").Elements().ElementAt(2).Value.ToString();
            string[] Scorelist = CScore.TrimEnd(' ').Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries);

            Bitmap bitMapImageS = new
            System.Drawing.Bitmap(Server.MapPath(@"images\livescoretableIn.jpg"));
            Graphics graphicImageS = Graphics.FromImage(bitMapImageS);

            graphicImageS.DrawString(CTime.ToString(),
            new Font("Erbos Draco 1st Open NBP", 21, FontStyle.Bold),
            Brushes.Yellow, new Point(90, 12));

            graphicImageS.DrawString(CPeriod.ToString(),
            new Font("Erbos Draco 1st Open NBP", 9, FontStyle.Bold),
            Brushes.LightGreen, new Point(88, 85));

            graphicImageS.DrawString(Scorelist[0].ToString(),
            new Font("Erbos Draco 1st Open NBP", 20, FontStyle.Bold),
            Brushes.Red, new Point(8, 74));

            graphicImageS.DrawString(Scorelist[1].ToString(),
            new Font("Erbos Draco 1st Open NBP", 20, FontStyle.Bold),
            Brushes.Red, new Point(227, 74));

            graphicImageS.DrawString(HTeamName.Substring(0, 3).ToString(),
            new Font("Erbos Draco 1st Open NBP", 18, FontStyle.Bold),
            Brushes.DarkOrange, new Point(13, 14));

            graphicImageS.DrawString(ATeamName.Substring(0, 3).ToString(),
            new Font("Erbos Draco 1st Open NBP", 18, FontStyle.Bold),
            Brushes.DarkOrange, new Point(230, 14));

            bitMapImageS.Save(Server.MapPath(@"images\livescoretableOut.jpg"), ImageFormat.Jpeg);
            graphicImageS.Dispose();
            bitMapImageS.Dispose(); 

        }
        else
        {
            Bitmap bitMapImage = new
            System.Drawing.Bitmap(Server.MapPath(@"images\courtZ.jpg"));
            Graphics graphicImage = Graphics.FromImage(bitMapImage);

            Bitmap bitMapImageS = new
            System.Drawing.Bitmap(Server.MapPath(@"images\livescoretableIn.jpg"));
            Graphics graphicImageS = Graphics.FromImage(bitMapImageS);

            Bitmap bitMapIm = new
            System.Drawing.Bitmap(Server.MapPath(@"images\court.jpg"));
            Graphics graphicIm = Graphics.FromImage(bitMapIm);
            bitMapImage.Save(Server.MapPath(@"images\courtZout.jpg"), ImageFormat.Jpeg);

            bitMapImage.Save(Server.MapPath(@"images\courtZoutA.jpg"), ImageFormat.Jpeg);
            graphicImage.Dispose();
            bitMapImage.Dispose();

            bitMapImageS.Save(Server.MapPath(@"images\livescoretableOut.jpg"), ImageFormat.Jpeg);
            graphicImageS.Dispose();
            bitMapImageS.Dispose();

            bitMapIm.Save(Server.MapPath(@"images\courtspot.jpg"), ImageFormat.Jpeg);

            bitMapIm.Save(Server.MapPath(@"images\courtspotA.jpg"), ImageFormat.Jpeg);
            graphicIm.Dispose();
            bitMapIm.Dispose();
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {   //DrawImages();
        //Response.Redirect(Request.RawUrl);
        imageScoretable.ImageUrl = "images/livescoretableOut.jpg" + "?time=" + DateTime.Now.ToString();
        ImageHCourt.ImageUrl = "images/courtspot.jpg" + "?time=" + DateTime.Now.ToString();
        Image2.ImageUrl = "images/courtZout.jpg" + "?time=" + DateTime.Now.ToString();
        ImageACourt.ImageUrl = "images/courtspotA.jpg" + "?time=" + DateTime.Now.ToString();
        Image3.ImageUrl = "images/courtZoutA.jpg" + "?time=" + DateTime.Now.ToString();        
    }
    protected void GridViewLeaders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[0].Text.Equals("POINTS") || e.Row.Cells[0].Text.Equals("DEFFENSIVE REBOUNDS") || e.Row.Cells[0].Text.Equals("OFFENSIVE REBOUNDS") || e.Row.Cells[0].Text.Equals("ASSISTS") || e.Row.Cells[0].Text.Equals("TURNOVERS") || e.Row.Cells[0].Text.Equals("STEALS") || e.Row.Cells[0].Text.Equals("BLOCKS") || e.Row.Cells[0].Text.Equals("INDEX RATING"))
                e.Row.Attributes.Add("style", "font-size:large;Font-Weight:Bold;");
        }

    }
}
