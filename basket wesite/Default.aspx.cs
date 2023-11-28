using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public static T FindControlRecursive<T>(Control holder, string controlID) where T : Control
    {
        Control foundControl = null;
        foreach (Control ctrl in holder.Controls)
        {
            if (ctrl.GetType().Equals(typeof(T)) &&
              (string.IsNullOrEmpty(controlID) || (!string.IsNullOrEmpty(controlID) && ctrl.ID.Equals(controlID))))
            {
                foundControl = ctrl;
            }
            else if (ctrl.Controls.Count > 0)
            {
                foundControl = FindControlRecursive<T>(ctrl, controlID);
            }
            if (foundControl != null)
                break;
        }
        return (T)foundControl;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string strConnString = ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
        string str; 
        SqlCommand com;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        for (int i = 1; i < 6; i++)
        {
            Label OneWord = ((Label)FindControlRecursive<Label>(this, (String.Format("ONE_WORDLabel{0}", i))));
            Label Title = ((Label)FindControlRecursive<Label>(this, (String.Format("TITLELabel{0}", i))));
            Label Text = ((Label)FindControlRecursive<Label>(this, (String.Format("TextLabel{0}", i))));
            HtmlAnchor Link = ((HtmlAnchor)FindControlRecursive<HtmlAnchor>(this, (String.Format("Link{0}", i))));

            str = String.Format("SELECT TITLE, TEXT, ONE_WORD, LINK FROM LATEST_NEWS WHERE (ID = {0})", i.ToString());
            //str1 = "SELECT AVG(POINTS) AS AVGLEAGUE FROM View_STATISTICS_BY_GAME";
            //str2 = String.Format("SELECT MIN(GAMES.AGONISTIKI) AS AGMIN, MAX(GAMES.AGONISTIKI) AS AGMAX FROM View_STATISTICS_BY_GAME INNER JOIN GAMES ON View_STATISTICS_BY_GAME.GAME_ID = GAMES.ID WHERE (View_STATISTICS_BY_GAME.PLAYER_ID = {0})", player.ToString());

            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();

            OneWord.Text = reader["ONE_WORD"].ToString();
            Title.Text = reader["TITLE"].ToString();
            Text.Text = reader["TEXT"].ToString();
            Link.HRef = reader["LINK"].ToString();
            reader.Close();
        }
    }
}