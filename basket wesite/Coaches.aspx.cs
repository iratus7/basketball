using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Coaches : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // if (!IsPostBack)
        //{
          //  GridView1.DataSource = GetData();
           // GridView1.DataBind();
        //}

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
    

}
