using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class FirstLetterPlayers : System.Web.UI.Page
{
   /* public static T FindControlRecursive<T>(Control holder, string controlID) where T : Control
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
    }*/
    protected void Page_Load(object sender, EventArgs e)
    {
       /* HyperLink HLink = (HyperLink)FindControlRecursive<HyperLink>(this, "HyperLink1");
        if (HLink != null)
        {
            var urls = HLink.ToolTip.ToString();
            HLink.ImageUrl = urls.ToString();
            
        }
        else { }
        */
        /* var FL = Request.QueryString;

         string strConnString = ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
         string str;
         SqlCommand com;
         SqlConnection con = new SqlConnection(strConnString);
         con.Open();

         //HyperLink aLink = (HyperLink)GridView1.FindControl("HyperLink1") as HyperLink;
         HyperLink HLink = (HyperLink)FindControlRecursive<HyperLink>(this, "HyperLink1");

         if (HLink != null)
         {
             str = String.Format("SELECT IMAGE FROM PLAYERS WHERE (SURNAME LIKE + IMAGE + N'%')" );

             com = new SqlCommand(str, con);
             SqlDataReader reader = com.ExecuteReader();
             reader.Read();
             string trdf = String.Format("<asp:Image ID={0} runat={1} ImageUrl='<%# {2} + Eval({3}) %>' />",String.Format("Image_Player"),String.Format("server"), String.Format("~/images/players/"), String.Format("IMAGE"));
             HLink.ToolTip = trdf.ToString();
             reader.Close();

         }
         else { }*/
    }
}