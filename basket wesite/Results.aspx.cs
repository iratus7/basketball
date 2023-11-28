using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Results : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        /* //Establishing the MySQL Connection
         SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
         Results_Ddl.SelectedIndex = 0;  //first item

         var AGONISTIKI = Results_Ddl.SelectedValue;
         string query, query2;
         SqlCommand SqlCommand, SqlCommand2;
         SqlDataReader reader, reader2;

         SqlDataAdapter adapter = new SqlDataAdapter();
         SqlDataAdapter adapter2 = new SqlDataAdapter();
         //Open the connection to db
         conn.Open();

         //Generating the query to fetch the contact details
         query = "SELECT SUM(ISNULL(AST.FREE_THROW_MADE, 0) * 1.00) + SUM(ISNULL(AST.[2POINTS_MADE], 0) * 2.00) + SUM(ISNULL(AST.[3POINT_MADE], 0) * 3.00) AS A_POINTS_TOTAL, View_RES.ID FROM View_RES INNER JOIN [STATISTICS] AS AST ON AST.TEAM_ID = View_RES.AWAY_TEAM_ID AND AST.GAME_ID = View_RES.ID GROUP BY View_RES.AGONISTIKI, View_RES.ID HAVING (View_RES.AGONISTIKI ="+ AGONISTIKI +")";
         query2 = "SELECT SUM(ISNULL(HS.FREE_THROW_MADE, 0) * 1.00) + SUM(ISNULL(HS.[2POINTS_MADE], 0) * 2.00) + SUM(ISNULL(HS.[3POINT_MADE], 0) * 3.00) AS H_POINTS_TOTAL, View_RES.ID FROM View_RES INNER JOIN [STATISTICS] AS HS ON HS.TEAM_ID = View_RES.HOME_TEAM_ID AND HS.GAME_ID = View_RES.ID GROUP BY View_RES.AGONISTIKI, View_RES.ID HAVING (View_RES.AGONISTIKI = @AGONISTIKI)";
         SqlCommand = new SqlCommand(query, conn);
         adapter.SelectCommand = new SqlCommand(query, conn);
         SqlCommand2 = new SqlCommand(query2, conn);
         adapter.SelectCommand = new SqlCommand(query2, conn);
         //execute the query
         reader = SqlCommand.ExecuteReader();
         //reader2 = SqlCommand2.ExecuteReader();
         //Assign the results 
         GridView4.DataSource = reader;
         //GridView4.DataSource = reader2;
         //Bind the data
         GridView4.DataBind();
         conn.Close();
         //------------------------------------------------------------*/
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
}