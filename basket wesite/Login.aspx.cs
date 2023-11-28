using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void LoginAddmin_Authenticate(object sender, AuthenticateEventArgs e)
    //{
    //    string username = LoginAddmin.UserName;
    //    string pwd = LoginAddmin.Password;
    //    string s;
    //    s = WebConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
    //    SqlConnection con = new SqlConnection(s);
    //    con.Open();
    //    string sqlUserName;
    //    sqlUserName = "SELECT USERNAME, PASSWORD FROM ADDMIN_USERS WHERE USERNAME ='" + username + "' AND PASSWORD ='" + pwd + "'";
    //    SqlCommand cmd = new SqlCommand(sqlUserName, con);
    //    string CurrentName;
    //    CurrentName = (string)cmd.ExecuteScalar();
    //    if (CurrentName != null)
    //    {
    //        Session["UserAuthentication"] = username;
    //        Session.Timeout = 1;
    //        Response.Redirect("Administrator/Default.aspx");
    //    }
    //    else
    //    {
    //        Session["UserAuthentication"] = "";
    //    }
    //}
    
}