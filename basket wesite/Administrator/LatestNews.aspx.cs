using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestNews : System.Web.UI.Page
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


         
    }
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        if (FormView1.CurrentMode == FormViewMode.ReadOnly)
        {

            Image ImageLatestNews = (Image)FormView1.FindControl("Image1") as Image;

            //Image ImageLatestNews = (Image)FindControlRecursive<Image>(this, "Image1");
            Label LbIm = (Label)FormView1.FindControl("IDLabel") as Label;

            //Label LbIm = (Label)FindControlRecursive<Label>(this, "IDLabel");
            ImageLatestNews.ImageUrl = String.Format("~/images/imagesSlide/{0}.jpg", LbIm.Text.ToString());
        }
        else if (FormView1.CurrentMode == FormViewMode.Edit)
        {
            Image ImageLatestN = (Image)FormView1.FindControl("ImageEdit") as Image;

            //Image ImageLatestNews = (Image)FindControlRecursive<Image>(this, "Image1");
            Label LbI = (Label)FormView1.FindControl("IDLabel1") as Label;

            //Label LbIm = (Label)FindControlRecursive<Label>(this, "IDLabel");
            ImageLatestN.ImageUrl = String.Format("~/images/imagesSlide/{0}.jpg", LbI.Text.ToString());
        }
    }
    
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {

        if (FormView1.CurrentMode == FormViewMode.Edit)
        {

            //update photos
            FileUpload fu = (FileUpload)FindControlRecursive<FileUpload>(this, "FileUploadSlider");
            Label Lb = (Label)FindControlRecursive<Label>(this, "IDLabel1");

            if (fu.HasFile)
            {
                string aut = String.Format("~/images/imagesSlide/{0}.jpg", Lb.Text.ToString());
                int filesize = fu.PostedFile.ContentLength;
                if (filesize < 1048576)
                {
                    fu.SaveAs(Server.MapPath(aut));
                }
                else
                {
                    /*dont do message*/
                    CustomValidator Cv = (CustomValidator)FormView1.FindControl("CustomValidator") as CustomValidator;

                    //CustomValidator Cv = (CustomValidator)FindControlRecursive<CustomValidator>(this, "CustomValidator");
                    Cv.IsValid = false;

                }

            }
            else
            {

            }

        }
    }
}