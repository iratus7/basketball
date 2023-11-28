using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ResultsPerGame : System.Web.UI.Page
{
    public class Coordinates
        {
             public int SType { get; set; }
             public int X { get; set; }
             public int Y { get; set; }            
        }
    //protected void Page_PreRender(object sender, System.EventArgs e)
    //{
    //    System.Web.UI.WebControls.Image img = Master.FindControl("dvLoading") as System.Web.UI.WebControls.Image;
    //    img.Visible = true;
    //}
    protected void Page_Load(object sender, EventArgs e)
    {     
        int GameId = Convert.ToInt16(Request.QueryString["GAME_ID"]);
        SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
        con.Open();
        
        //QSCORES
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader = null;
        string sql = string.Format("SELECT [GAME_ID],[QSCORES_HOME],[QSCORES_AWAY],[HOME_TEAM],[AWAY_TEAM] FROM [QSCORES] WHERE [GAME_ID] ={0}", GameId);
        cmd.CommandText = sql;
        cmd.Connection = con;
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            string HtS = null;
            string AtS = null;
            string Hteam = null;
            string Ateam = null;
            while (reader.Read())
            {
                HtS = reader["QSCORES_HOME"].ToString();
                AtS = reader["QSCORES_AWAY"].ToString();
                Hteam = reader["HOME_TEAM"].ToString();
                Ateam = reader["AWAY_TEAM"].ToString();
            }
            //int cP = HtS.TrimEnd(' ').Count(x => x.Equals(' ')); //spaces count = 3

            string[] HSlist = HtS.TrimEnd(' ').Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            string[] ASlist = AtS.TrimEnd(' ').Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            int cP = HSlist.Length; // = 4 elements
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("TEAM", typeof(string)));
            string[] Plitems = new string[] { "I PERIOD", "II PERIOD", "III PERIOD", "IV PERIOD", "I OVERTIME", "II OVERTIME", "III OVERTIME", "IV OVERTIME", "V OVERTIME", "VI OVERTIME", "VII OVERTIME", "VIII OVERTIME", "IX OVERTIME", "X OVERTIME" };

            dt.Columns.Add(new DataColumn(Plitems[0].ToString(), typeof(string)));
            dt.Rows.Add(Hteam, HSlist[0]);
            dt.Rows.Add(Ateam, ASlist[0]);
            dt.Rows.Add(Hteam, HSlist[0]);
            dt.Rows.Add(Ateam, ASlist[0]);
            for (int i = 1; i < cP; i++)
            {
                dt.Columns.Add(new DataColumn(Plitems[i].ToString(), typeof(string)));

                dt.Rows[0][i + 1] = HSlist[i].ToString();
                dt.Rows[1][i + 1] = ASlist[i].ToString();

                dt.Rows[2][i + 1] = Convert.ToInt16(HSlist[i]) - Convert.ToInt16(HSlist[i - 1]);
                dt.Rows[3][i + 1] = Convert.ToInt16(ASlist[i]) - Convert.ToInt16(ASlist[i - 1]);

            }
            
            GridViewQScores.DataSource = dt;
            GridViewQScores.DataBind();
        }reader.Close();
        //PLAYYPAY
        SqlCommand cmdPBP = new SqlCommand();
        SqlDataReader readerPBP = null;
        string sqlPBP = string.Format("SELECT [GAME_ID],[PBP] FROM [PLAY_BY_PLAY] WHERE [GAME_ID] ={0}", GameId);
        cmdPBP.CommandText = sqlPBP;
        cmdPBP.Connection = con;
        readerPBP = cmdPBP.ExecuteReader();
        if (readerPBP.HasRows)
        {
            string PBPText = null;
            while (readerPBP.Read())
            {
                PBPText = readerPBP["PBP"].ToString();
            }
            string[] Evlist = PBPText.TrimEnd(' ').Split(new[] { '*' }, StringSplitOptions.RemoveEmptyEntries);
            int cE = Evlist.Length; // = event elements
            DataTable dtpbp = new DataTable();
            dtpbp.Columns.Add(new DataColumn("PlayByPlay", typeof(string)));
            foreach (string Event in Evlist)
            {
                dtpbp.Rows.Add(Event.ToString());
            }
            

            ListBoxPBP.DataSource = dtpbp;
            ListBoxPBP.DataTextField = "PlayByPlay";
            ListBoxPBP.DataBind();
            ListBoxPBP.Height = 550;
        }readerPBP.Close();

        //SHOOTING COURT
        SqlCommand cmdSCourt = new SqlCommand();
        SqlDataReader readerSCourt = null;
        string sqlSCourt = string.Format("SELECT [GAME_ID], [XYTEXT_HOME] ,[XYTEXT_AWAY] FROM [COORDINATES] WHERE [GAME_ID] ={0}", GameId);
        cmdSCourt.CommandText = sqlSCourt;
        cmdSCourt.Connection = con;
        readerSCourt = cmdSCourt.ExecuteReader();

        if (readerSCourt.HasRows)
        {
            string XYTextH = null;
            string XYTextA = null;
            while (readerSCourt.Read())
            {
                XYTextH = readerSCourt["XYTEXT_HOME"].ToString();
                XYTextA = readerSCourt["XYTEXT_AWAY"].ToString();
            }
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

            //Pen blackPen = new Pen(Color.Black, 3);

            //int x1 = 100;
            //int y1 = 100;
            //int x2 = 500;
            //int y2 = 100;
            //// Draw line to screen.

            //    graphicImage.DrawLine(blackPen, x1, y1, x2, y2);
            //    Pen penc = new Pen(Color.Blue, 3);
            //    graphicImage.DrawEllipse(penc, 10, 10, 20, 20);

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
                    //graphicImA.DrawEllipse(penRed, coordinatesA[i].X, coordinatesA[i].Y, 7, 7);

                }
            }
            bitMapImA.Save(Server.MapPath(@"images\courtspotA.jpg"), ImageFormat.Jpeg);
            graphicImA.Dispose();
            bitMapImA.Dispose();
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
        }readerSCourt.Close();
        con.Close();
    }  
    
    /*HOME TEAM*/
    private int TotalPointsHome = (int)0;//mono gia tous pontous
    int[] TotalStats = new int[12] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    protected void GridViewHomeTeamStats_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        /*mono gia tous pontous Home arxi*/
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TotalPointsHome += Convert.ToInt32(e.Row.Cells[3].Text);
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
            e.Row.Cells[3].Text = String.Format("{0:0.##}", TotalPointsHome);
        /*mono gia tous pontous Home telos*/


        for (int i = 7; i <= 18; i++)
        {
            // check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
            // if row type is DataRow, add ...                
            {
                TotalStats[i - 7] += Convert.ToInt32(e.Row.Cells[i].Text);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[i].Text = String.Format("{0:0.##}", TotalStats[i - 7]);
        }
        /*FOOTER PERCENTAGE
        string GAME_ID = HttpContext.Current.Request.QueryString["GAME_ID"];
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
        conn.Open();
        string query = "SELECT SUM(CAST(View_STATISTICS_BY_GAME.FREE_THROW_MADE AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT, 0)) AS FT_PERCENTAGE, SUM(CAST(View_STATISTICS_BY_GAME.[2POINTS_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT], 0)) AS [2P_PERCENTAGE], SUM(CAST(View_STATISTICS_BY_GAME.[3POINT_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[3POINT_ATTEMPT], 0)) AS [3P_PERCENTAGE] FROM GAMES INNER JOIN View_STATISTICS_BY_GAME ON GAMES.HOME_TEAM_ID = View_STATISTICS_BY_GAME.TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID WHERE (View_STATISTICS_BY_GAME.GAME_ID =" + GAME_ID + ")";
        SqlCommand cmd = new SqlCommand(query, conn);
        if (e.Row.RowType == DataControlRowType.Footer)
        {            
            e.Row.Cells[4].Text = String.Format("{0:P1}",Convert.ToDouble(cmd.ExecuteScalar()) );

            conn.Close();
        }*/
    }




    /*AWAY TEAM*/
    private int TotalPointsAway = (int)0;//mono gia tous pontous
    int[] TotalStatsAway = new int[12] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    protected void GridViewAwayTeamStats_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        /*mono gia tous pontous Away arxi*/
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TotalPointsAway += Convert.ToInt32(e.Row.Cells[3].Text);
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
            e.Row.Cells[3].Text = String.Format("{0:0.##}", TotalPointsAway);
        /*mono gia tous pontous Away telos*/

        for (int i = 7; i <= 18; i++)
        {
            // check row type
            if (e.Row.RowType == DataControlRowType.DataRow)
            // if row type is DataRow, add ...                
            {
                TotalStatsAway[i - 7] += Convert.ToInt32(e.Row.Cells[i].Text);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
                // If row type is footer, show calculated total value
                e.Row.Cells[i].Text = String.Format("{0:0.##}", TotalStatsAway[i - 7]);            
        }

        /*FOOTER PERCENTAGE
        string GAME_ID = HttpContext.Current.Request.QueryString["GAME_ID"];
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
        conn.Open();
        string query = "SELECT SUM(CAST(View_STATISTICS_BY_GAME.FREE_THROW_MADE AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.FREE_THROW_ATTEMPT, 0)) AS FT_PERCENTAGE, SUM(CAST(View_STATISTICS_BY_GAME.[2POINTS_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[2POINTS_ATTEMPT], 0)) AS [2P_PERCENTAGE], SUM(CAST(View_STATISTICS_BY_GAME.[3POINT_MADE] AS DECIMAL)) / SUM(NULLIF (View_STATISTICS_BY_GAME.[3POINT_ATTEMPT], 0)) AS [3P_PERCENTAGE] FROM GAMES INNER JOIN View_STATISTICS_BY_GAME ON GAMES.AWAY_TEAM_ID = View_STATISTICS_BY_GAME.TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID WHERE (View_STATISTICS_BY_GAME.GAME_ID =" + GAME_ID + ")";
        SqlCommand cmd = new SqlCommand(query, conn);
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[4].Text = String.Format("{0:P1}", Convert.ToDouble(cmd.ExecuteScalar()));
            conn.Close();
        }*/


        /*STYLE*/
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




    /*databinding se label
     * 
     * protected void HomeTeam_DataBinding(object sender, EventArgs e)
    {
        string GAME_ID = HttpContext.Current.Request.QueryString["GAME_ID"]; 
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
        conn.Open();
        string query = "SELECT DISTINCT TEAMS.NAME AS HOME_TEAM FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN View_STATISTICS_BY_GAME ON PLAYERS.ID = View_STATISTICS_BY_GAME.PLAYER_ID INNER JOIN GAMES ON View_STATISTICS_BY_GAME.TEAM_ID = GAMES.HOME_TEAM_ID AND GAMES.ID = View_STATISTICS_BY_GAME.GAME_ID WHERE (View_STATISTICS_BY_GAME.GAME_ID = " + GAME_ID + ")" ;
        SqlCommand cmd = new SqlCommand(query, conn);
        Hteam.Text = cmd.ExecuteScalar().ToString();
        conn.Close();
        //Hteam.Text = DataBinder.Eval(ds.Tables[" View_STATISTICS_BY_GAME"].DefaultView[0], "HOME_TEAM", "{0:c}"); 
    }         
     * 
     * <!-- databinding se label <asp:Label runat="server" ID="Hteam" OnLoad="HomeTeam_DataBinding"></asp:Label>-->
*/

}
        
    
    
    /* 7 18
    decimal total = 0M;
    protected void GridViewHomeTeamStats_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        double total = 0;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            for (int i = 10; i <= 15; i++)
            {
                string sNum = e.Row.Cells[i].Text;//just changed the index of cells based on your requirements 
                double sum;
                if (double.TryParse(sNum, out sum))
                {
                    total += sum;
                }

                GridViewHomeTeamStats.FooterRow.Cells[i].Text = total.ToString();





            }
        }

    }*/
