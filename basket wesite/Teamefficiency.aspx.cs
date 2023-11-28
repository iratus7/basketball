using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teamefficiency : System.Web.UI.Page
{
    public int t;
    protected void Page_Load(object sender, EventArgs e)
    {
        Chartsta.Visible = false;
        ChartTU.Visible = false;
        ChartAS.Visible = false;
        ChartPPG.Visible = false;
    }
    private void show_charts()
    {
        SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
        con.Open();
        try
        {
            SqlDataAdapter sda = new SqlDataAdapter(string.Format("SELECT (SUM([STATISTICS].DEFENSIVE_REBOUNDS)+SUM([STATISTICS].OFFENSIVE_REBOUNDS)) AS [RBT], GAMES.HOME_TEAM_ID + GAMES.AWAY_TEAM_ID - {0} AS OPPONENT, (SELECT NAME FROM TEAMS WHERE (ID = GAMES.HOME_TEAM_ID + GAMES.AWAY_TEAM_ID - {0})) AS OPPONENT_NAME,SUM([STATISTICS].TURNOVERS) AS [TUR],SUM([STATISTICS].ASSISTS) AS [ASS] ,SUM([STATISTICS].FREE_THROW_MADE) +SUM([STATISTICS].[2POINTS_MADE])*2+SUM([STATISTICS].[3POINT_MADE])*3 AS [PPG] FROM [STATISTICS] INNER JOIN GAMES ON [STATISTICS].GAME_ID = GAMES.ID WHERE ([STATISTICS].TEAM_ID = {0}) GROUP BY [STATISTICS].GAME_ID, GAMES.HOME_TEAM_ID, GAMES.AWAY_TEAM_ID, GAMES.AGONISTIKI ORDER BY GAMES.AGONISTIKI", t), con);
            DataTable dt = new DataTable();
            sda.Fill(dt);            

            //GridViewEff.DataSource = dt;
            //GridViewEff.DataBind();

            //List<int> stat = new List<int>();
            for (int i = 0; i < dt.Rows.Count; i++)
                {
                   Chartsta.Series[0].Points.AddXY(Convert.ToString(dt.Rows[i][2]), Convert.ToInt32(dt.Rows[i][0]));
                   ChartTU.Series[0].Points.AddXY(Convert.ToString(dt.Rows[i][2]), Convert.ToInt32(dt.Rows[i][3]));
                   ChartAS.Series[0].Points.AddXY(Convert.ToString(dt.Rows[i][2]), Convert.ToInt32(dt.Rows[i][4]));
                   ChartPPG.Series[0].Points.AddXY(Convert.ToString(dt.Rows[i][2]), Convert.ToInt32(dt.Rows[i][5]));
                }
            //REBOUNDS
            Chartsta.Series[0].Color = Color.Blue;
            Chartsta.Series[0].BorderWidth = 5;           
            Chartsta.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);

            //TURNOVERS
            ChartTU.Series[0].Color = Color.OrangeRed;
            ChartTU.Series[0].BorderWidth = 5;
            ChartTU.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);

            //ASSISTS
            ChartAS.Series[0].Color = Color.Chocolate;
            ChartAS.Series[0].BorderWidth = 5;
            ChartAS.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);

            //POINTS PER GAME
            ChartPPG.Series[0].Color = Color.Red;
            ChartPPG.Series[0].BorderWidth = 5;
            ChartPPG.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);

            Chartsta.Visible = true;
            ChartTU.Visible = true;
            ChartAS.Visible = true;
            ChartPPG.Visible = true;
        }
        catch (Exception ex)
        {
            //MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            //Application.ExitThread();
        }
        con.Close();

       
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        t =2;
        show_charts();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        t = 3;
        show_charts();
    }
    protected void LinkButtonMacabi_Click(object sender, EventArgs e)
    {
        t = 4;
        show_charts();
    }
    protected void LinkButtonMinessotaTimberwolves_Click(object sender, EventArgs e)
    {
        t = 5;
        show_charts();
    }
    protected void LinkButtonOlympiakos_Click(object sender, EventArgs e)
    {
        t = 6;
        show_charts();
    }
    protected void LinkButtonPanathinaikos_Click(object sender, EventArgs e)
    {
        t = 7;
        show_charts();
    }
    protected void LinkButtonPaok_Click(object sender, EventArgs e)
    {
        t = 8;
        show_charts();
    }
    protected void LinkButtonPartizan_Click(object sender, EventArgs e)
    {
        t = 9;
        show_charts();
    }
    protected void LinkButtonRealMadrid_Click(object sender, EventArgs e)
    {
        t = 10;
        show_charts();
    }
    protected void LinkButtonSanAntonioSpurs_Click(object sender, EventArgs e)
    {
        t = 11;
        show_charts();
    }
    protected void LinkButtonZalgirisKaunas_Click(object sender, EventArgs e)
    {
        t = 12;
        show_charts();
    }
    protected void LinkButtonAris_Click(object sender, EventArgs e)
    {
        t = 1;
        show_charts();
    }
}