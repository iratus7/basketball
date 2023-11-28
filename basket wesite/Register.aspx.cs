using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;


public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    //{

    //}
    //protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    //{
    //    Response.Redirect("Default.aspx");
    //}
    //protected void _CreatedUser(object sender, EventArgs e)
    //{
    //    string s;
    //    s = WebConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
    //    SqlConnection con = new SqlConnection(s);
    //    string aSQL = "sp_Insertuser";
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand(aSQL, con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@USERNAME", SqlDbType.NVarChar, 20, "USERNAME").Value = CreateUserWizard1.UserName;
    //        cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar, 20, "PASSWORD").Value = CreateUserWizard1.Password;
    //        con.Open();
    //        if (cmd.ExecuteNonQuery() > 0)
    //            CreateUserWizard1.ActiveStepIndex = 1;


    //    }
    //    finally
    //    {
    //        con.Close();
    //    }
    //}

    
    //protected void _createduser(object sender, EventArgs e)
    //{

    //}
}