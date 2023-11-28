using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class LiveScore : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
        con.Open();
        try
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT GAMES.AGONISTIKI AS GAMEDAY, GAMES.ID AS GAME_ID ,GAMES.DATE_TIME AS [DATE],ARENAS.NAME AS ARENA,REF1.SURENAME AS [1st REFEREE], REF2.SURENAME AS [2nd REFEREE], REF3.SURENAME AS [3rd REFEREE], HT.NAME AS [HOME], AT.NAME AS [AWAY] FROM GAMES INNER JOIN TEAMS AS HT ON GAMES.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON GAMES.AWAY_TEAM_ID = AT.ID INNER JOIN ARENAS ON GAMES.ARENA_ID = ARENAS.ID INNER JOIN COACH AS HC ON GAMES.HOME_TEAM_COACH_ID = HC.ID INNER JOIN COACH AS AC ON GAMES.AWAY_TEAM_COACH_ID = AC.ID INNER JOIN REFEREE AS REF1 ON GAMES.REFEREE1_ID = REF1.ID INNER JOIN REFEREE AS REF2 ON GAMES.REFEREE2_ID = REF2.ID INNER JOIN REFEREE AS REF3 ON GAMES.REFEREE3_ID = REF3.ID  WHERE CAST(GAMES.DATE_TIME AS DATE) = CAST(CURRENT_TIMESTAMP AS DATE)", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            string gameday = dt.Rows[0][0].ToString();
            if (gameday != null) { LabelAgonistiki.Text = gameday + "η ΑΓΩΝΙΣΤΙΚΗ"; } else {  }
            dt.Columns.RemoveAt(0);

            dt.Columns.Add(new DataColumn("SCORE", typeof(string)));
            dt.Columns.Add(new DataColumn("SCORESLink", typeof(string)));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string GId = dt.Rows[i][0].ToString(); string NavUrl = "ResultsPerGame.aspx?GAME_ID=" + GId;
               
            if (File.Exists(Server.MapPath(@"livegames\"+GId.ToString() + "HomeXMLStats.xml")))
            {
                XDocument xmlDoc = XDocument.Load(Server.MapPath(@"livegames\" + GId.ToString() + "HomeXMLStats.xml"));
                string Per = xmlDoc.Descendants("GameInfo").Elements().ElementAt(1).Value.ToString();
                string Sc = xmlDoc.Descendants("GameInfo").Elements().ElementAt(2).Value.ToString(); ;
                TimeSpan mmss = TimeSpan.FromSeconds(Convert.ToInt16(xmlDoc.Descendants("GameInfo").Elements().ElementAt(0).Value.ToString()));
                string Ti = mmss.ToString(@"mm\:ss");
                dt.Rows[i][8] = Ti +" - "+ Per+" : " + Sc;
                dt.Rows[i][9] = NavUrl;               
            }
            else {            
                dt.Rows[i][8] = "NOT STARTED YET";
                dt.Rows[i][9] = " ";
            }
            }
            GridViewLiveChoose.DataSource = dt;
            GridViewLiveChoose.DataBind();
            
            DataTable dtTrem = new DataTable();            
            dtTrem.Columns.Add(new DataColumn("TEAMS", typeof(string)));
            dtTrem.Columns.Add(new DataColumn("TIME", typeof(string)));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DateTime dtime = DateTime.Parse(dt.Rows[i][1].ToString());
                TimeSpan span = dtime.Subtract(DateTime.Now);
                if (span.CompareTo(TimeSpan.Zero) > 0)
                {                
                dtTrem.Rows.Add(dt.Rows[i][6].ToString().Substring(0, 3) + " - " + dt.Rows[i][7].ToString().Substring(0, 3), string.Format("  ➱ {0:00}:{1:00}:{2:00}", (int)span.TotalHours, span.Minutes, span.Seconds));
            }else{}}
            GridViewTimeRemain.DataSource = dtTrem;
            GridViewTimeRemain.DataBind();
            GridViewTimeRemain.HeaderRow.Visible = false;
        }
        catch (Exception ex)
        {
            //MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            //Application.ExitThread();
        }
        con.Close();    

        string[] XmlFiles = Directory.GetFiles(Server.MapPath(@"livegames"), "*.xml")
                                     .Select(path => Path.GetFileName(path))
                                     .ToArray();
      List<string> LiveGamelist = new List<string>();
        for(int i=0;i<XmlFiles.Count();i++){
            if (XmlFiles[i].Contains("HomeXMLStats"))
            {
                LiveGamelist.Add(XmlFiles[i].ToString()); 
            }
        }
    }
    protected void GridViewLiveChoose_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string lpo = e.Row.Cells[9].Text.ToString();
            if (e.Row.Cells[9].Text.Equals(" ") )
            {
            }
            else
            {
                var firstCell = e.Row.Cells[8];
                firstCell.Controls.Clear();
                firstCell.Controls.Add(new HyperLink { NavigateUrl = "LiveScorePerGame.aspx?GAME_ID=" + e.Row.Cells[0].Text, Text = firstCell.Text, Target = "_blank" });
            }
        }
        e.Row.Cells[0].Visible = false; e.Row.Cells[9].Visible = false;
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

    }
}