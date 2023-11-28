using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Photos : System.Web.UI.Page
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

        var Album = Request.QueryString;
        for (int i = 1; i <= 20; i++)
        {
            //((HtmlAnchor)FindControl("image1")).HRef = String.Format("images/prettyPhoto/{0}/fullscreen/1.jpg", Album);
            HtmlAnchor aLink = (HtmlAnchor)FindControlRecursive<HtmlAnchor>(this, String.Format("a{0}", i));
            aLink.HRef = String.Format("images/prettyPhoto/{0}/fullscreen/{1}.jpg", Album.ToString(), i.ToString());
            Image Img = ((Image)FindControlRecursive<Image>(this, (String.Format("i{0}", i))));
            Img.ImageUrl = String.Format("images/prettyPhoto/{0}/fullscreen/{1}.jpg", Album.ToString(), i.ToString());
            //enalaktika se mia grammi ((Image)FindControlRecursive<Image>(this, (String.Format("i{0}", i)))).ImageUrl = String.Format("images/prettyPhoto/{0}/fullscreen/{1}.jpg", Album.ToString(), i.ToString());
            Img.Width = 100;
            Img.Height = 100;

            //TITLES...
            Label Ti = ((Label)FindControlRecursive<Label>(this, (String.Format("t{0}", i))));
            str = String.Format("SELECT TITLE_TEXT FROM PHOTOS_TITLE WHERE ALBUM = {0} AND NO = {1} ", Album.ToString(), i.ToString());
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Ti.Text = reader["TITLE_TEXT"].ToString();
            reader.Close();


            //Image i1 = (Image)FindControlRecursive<Image>(this, String.Format("i1"));        
            //  i1.ImageUrl = String.Format("images/prettyPhoto/{0}/fullscreen/1.jpg", Album.ToString());

        }
        
        con.Close();
    }
}