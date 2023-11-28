using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Aris : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //   string firstVariable = string.Empty;
        // try
        //{

        //  using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString))
        //{
        //  using (SqlCommand command = new SqlCommand("SELECT PLAYERS.ID FROM PLAYERS", connection))
        //{
        //  connection.Open();
        //using (SqlDataReader reader = command.ExecuteReader())
        //  {
        //    while (reader.Read())
        //  {
        //    firstVariable = reader[0].ToString();
        //   }
        //    }
        //   }
        //  }
        //   }
        // catch (Exception ex)
        //   {
        //     //error handling...
        //  }
        // }
    }
}