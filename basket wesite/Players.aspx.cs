using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Players : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string PlayerAvg; string LeagueAvg; string agmin; string agmax;
        Chart1.ChartAreas[0].AxisX.TitleFont = new System.Drawing.Font("Snap ITC", 12);
        Chart1.ChartAreas[0].AxisY.TitleFont = new System.Drawing.Font("Snap ITC", 12);
        Chart1.Series[0].BorderWidth = 3;
        Chart1.Series[1].BorderWidth = 3;
        Chart1.Series[2].BorderWidth = 3;
        Chart1.Series[3].BorderWidth = 3;
        Chart1.Series[0].BorderDashStyle = System.Web.UI.DataVisualization.Charting.ChartDashStyle.Dash;
        Chart1.Series[2].BorderDashStyle = System.Web.UI.DataVisualization.Charting.ChartDashStyle.Dot;
        Chart1.Series[3].BorderDashStyle = System.Web.UI.DataVisualization.Charting.ChartDashStyle.DashDotDot;

        Chart1.Width = 430; Chart1.Height = 400;


        string strConnString = ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
        string str; string str1; string str2;
        SqlCommand com; SqlCommand com1; SqlCommand com2;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        var player = Request.QueryString["ID"].ToString();

        str = String.Format("SELECT AVG(CAST(View_STATISTICS_BY_GAME.POINTS AS FLOAT)) AS AVGO FROM View_STATISTICS_BY_GAME INNER JOIN GAMES ON View_STATISTICS_BY_GAME.GAME_ID = GAMES.ID GROUP BY View_STATISTICS_BY_GAME.PLAYER_ID HAVING (View_STATISTICS_BY_GAME.PLAYER_ID = {0})", player.ToString());
        str1 = "SELECT AVG(POINTS) AS AVGLEAGUE FROM View_STATISTICS_BY_GAME";
        str2 = String.Format("SELECT MIN(GAMES.AGONISTIKI) AS AGMIN, MAX(GAMES.AGONISTIKI) AS AGMAX FROM View_STATISTICS_BY_GAME INNER JOIN GAMES ON View_STATISTICS_BY_GAME.GAME_ID = GAMES.ID WHERE (View_STATISTICS_BY_GAME.PLAYER_ID = {0})", player.ToString());
                

        com = new SqlCommand(str, con);
        SqlDataReader reader = com.ExecuteReader();
        reader.Read();
        if (reader.HasRows)
        {
            PlayerAvg = reader["AVGO"].ToString();
        }
        else { PlayerAvg = null; }
        reader.Close();

        com1 = new SqlCommand(str1, con);
        SqlDataReader reader1 = com1.ExecuteReader();
        reader1.Read();
        if (reader1.HasRows)
        {
            LeagueAvg = reader1["AVGLEAGUE"].ToString();
        }
        else { LeagueAvg = null; }
        reader1.Close();

        com2 = new SqlCommand(str2, con);
        SqlDataReader reader2 = com2.ExecuteReader();
        reader2.Read();
        if (reader2.HasRows)
        {
            agmin = reader2["AGMIN"].ToString();
            agmax = reader2["AGMAX"].ToString();
        }
        else { agmin = null; agmax = null; }
        reader2.Close();
                               

        con.Close();
        if (PlayerAvg != null)
        {

            Chart1.Series[2].Points.AddXY(Convert.ToInt32(agmin), Convert.ToDouble(PlayerAvg));
            Chart1.Series[2].Points.AddXY(Convert.ToInt32(agmax), Convert.ToDouble(PlayerAvg));

            Chart1.Series[3].Points.AddXY(Convert.ToInt32(agmin), Convert.ToDouble(LeagueAvg));
            Chart1.Series[3].Points.AddXY(Convert.ToInt32(agmax), Convert.ToDouble(LeagueAvg));
        }
        else {

            if (agmin != "")
            {

                Chart1.Series[2].Points.AddXY(Convert.ToInt32(agmin), 0);
                Chart1.Series[2].Points.AddXY(Convert.ToInt32(agmax), 0);

                Chart1.Series[3].Points.AddXY(Convert.ToInt32(agmin), Convert.ToDouble(LeagueAvg));
                Chart1.Series[3].Points.AddXY(Convert.ToInt32(agmax), Convert.ToDouble(LeagueAvg));
            }
            else {
                System.Web.UI.DataVisualization.Charting.TextAnnotation annotation =
                new System.Web.UI.DataVisualization.Charting.TextAnnotation();
                annotation.Text = "Ο ΠΑΙΧΤΗΣ ΔΕΝ ΕΧΕΙ ΠΑΙΞΕΙ ΣΤΟ ΠΡΟΤΑΘΛΗΜΑ";
                annotation.X = 5;
                annotation.Y = 5;
                annotation.Font = new System.Drawing.Font("Arial", 12);
                annotation.ForeColor = System.Drawing.Color.Red;
                Chart1.Annotations.Add(annotation);
            }
        }
        /* for (int i = 0; i < Convert.ToInt32(CountLoop); i++)
         {
             Chart1.Series[2].Points.AddXY(i,PlayerAvg);

             //var pol = Chart1.Series[2].XValueMember.ToString();
         }*/

    }

    /*protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < e.Row.Cells.Count; i++)
        {
            var p = Convert.ToString(e.Row.Cells[i].Text);
            e.Row.Cells[i].Text = String.Format("{0:f1}", p);
        }                 
        }
        //var p = Convert.ToInt32(e.Row.Cells.[2].Text);
        //string formattedString = string.Format("{0:f1}", p);
        //e.Row.Cells.Text = formattedString;
    //}*/
}

// DataTable GetData()
//  {
//   DataTable dt = new DataTable();
//   using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString))
//  {
//      con.Open();
//      using (SqlCommand cmd = new SqlCommand("SELECT PLAYERS.ID, PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.POSITION, PLAYERS.TEAM_ID, PLAYERS.COUNTRY_ID, PLAYERS.HEIGHT, PLAYERS.BORN, PLAYERS.IMAGE, TEAMS.ID AS IDOTEAM, TEAMS.NAME AS TEAM, COUNTRY.ID AS IDOCOUNTRY, COUNTRY.NAME AS COUNTRY FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN COUNTRY ON PLAYERS.COUNTRY_ID = COUNTRY.ID ORDER BY TEAM_ID", con))
//     {

//           SqlDataAdapter adpt = new SqlDataAdapter(cmd);
//           adpt.Fill(dt);
//       }

//    }
//    return dt;
//  }



