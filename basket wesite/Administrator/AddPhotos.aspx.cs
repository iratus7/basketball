using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_AddPhotos : System.Web.UI.Page
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
        if (!IsPostBack)
        {
        //DdlAddPhoto.DataSource = Enumerable.Range(1, 9);    Αν δε ΜΠΟΥΝ ΣΤΟ ΑΣΠΧ ΤΑ LISTITEMS
          
        DdlAddPhoto.DataBind();
       
            AddPhotos.Visible = false;
        }
    }
    protected void DdlAddPhoto_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DdlAddPhoto.SelectedValue != "0")
        {
            AddPhotos.Visible = true;

            string SelectedAlbum = DdlAddPhoto.SelectedValue.ToString();

            string strConnString = ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
            string str;
            SqlCommand com;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();

            for (int i = 1; i <= 20; i++)
            {
                ((Image)FindControlRecursive<Image>(this, (String.Format("Image{0}", Convert.ToString(i))))).ImageUrl = String.Format("~/images/prettyPhoto/{0}/fullscreen/{1}.jpg", SelectedAlbum.ToString(), Convert.ToString(i));

                /*enalaktika
                string image = String.Format("Image{0}", Convert.ToString(i));
                string path = String.Format("~/images/prettyPhoto/{0}/fullscreen/{1}.jpg", SelectedAlbum, Convert.ToString(i));
                Image im = FindControlRecursive<Image>(this, image);            
                im.ImageUrl = path.ToString();*/


                //ta textboxes (titles)
                TextBox Ti = ((TextBox)FindControlRecursive<TextBox>(this, (String.Format("t{0}", i))));
                Ti.Rows = 3;
                Ti.TextMode = TextBoxMode.MultiLine;
                str = String.Format("SELECT TITLE_TEXT FROM PHOTOS_TITLE WHERE ALBUM = {0} AND NO = {1} ", SelectedAlbum.ToString(), i.ToString());
                com = new SqlCommand(str, con);
                SqlDataReader reader = com.ExecuteReader();
                reader.Read();
                Ti.Text = reader["TITLE_TEXT"].ToString();
                reader.Close();

            }
        }             
    }


    protected void ButtonPhoto_Click(object sender, EventArgs e)
    {
        AddPhotos.Visible = true;
        string SelectedAlbum = DdlAddPhoto.SelectedValue.ToString();

            //update titles
        string connectionString = ConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = connection.CreateCommand())
            {
                connection.Open();

                for (int i = 1; i <= 20; i++)
                {
                    //update TITLES...
                    TextBox Ti = ((TextBox)FindControlRecursive<TextBox>(this, (String.Format("t{0}", i))));
                    command.CommandText = String.Format("UPDATE PHOTOS_TITLE SET TITLE_TEXT = '{0}' WHERE ALBUM = {1} AND NO = {2} ", Ti.Text.ToString(), SelectedAlbum.ToString(), i.ToString());
                    command.ExecuteNonQuery();

                    //update photos
                    FileUpload fu = (FileUpload)FindControlRecursive<FileUpload>(this, String.Format("FileUpload{0}", i));

                    if (fu.HasFile)
                    {
                        string aut = String.Format("~/images/prettyPhoto/{0}/fullscreen/{1}.jpg", SelectedAlbum.ToString(), Convert.ToString(i));
                        int filesize = fu.PostedFile.ContentLength;
                        if (filesize < 1048576)
                        {
                            fu.SaveAs(Server.MapPath(aut));
                        }
                        else
                        {
                            /*dont do message*/
                            CustomValidator Cv = (CustomValidator)FindControlRecursive<CustomValidator>(this, String.Format("CustomValidator{0}", i));
                            Cv.IsValid = false;
                            
                        }
                         
                    }
                    else
                    {

                    }
                }                    connection.Close();

            }            

    }
    
    protected void ClearPhotosButton_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= 20; i++)
        {
            FileUpload fu = (FileUpload)FindControlRecursive<FileUpload>(this, String.Format("FileUpload{0}", i));
            fu.Attributes.Clear();
        }

    }

   /* protected void checkfilesize(object source, ServerValidateEventArgs args)
    {
        for (int i = 1; i <= 20; i++)
        {
            FileUpload fu = (FileUpload)FindControlRecursive<FileUpload>(this, String.Format("FileUpload{0}", i));
            string data = args.Value;
            args.IsValid = false;
            double filesize = fu.FileContent.Length;
            if (filesize > 1048576)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }*/
    
}