using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPlayers : System.Web.UI.Page
{

    protected void checkfilesizeIns(object source, ServerValidateEventArgs args)
    {
            FileUpload fu2 = (FileUpload)ListView1.InsertItem.FindControl("FileUpload2");

            string data = args.Value;
            args.IsValid = false;
            double filesize = fu2.FileContent.Length;
            if (filesize > 1048576)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
    }
        
        /**/
    protected void checkfilesizeEdit(object source, ServerValidateEventArgs args)
    {   
            FileUpload fu1 = (FileUpload)ListView1.EditItem.FindControl("FileUpload1");

            string data = args.Value;
            args.IsValid = false;
            double filesize = fu1.FileContent.Length;
            if (filesize > 1048576)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        

    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            TextBox txtSurName = (TextBox)ListView1.EditItem.FindControl("SURNAMETextBox");
            TextBox txtFirstName = (TextBox)ListView1.EditItem.FindControl("FIRSTNAMETextBox");
            FileUpload fu1 = (FileUpload)ListView1.EditItem.FindControl("FileUpload1");
            if (fu1.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(fu1.FileName);
                string extension = ".jpg";
                string aut = string.Format("{0}-{1}{2}", txtFirstName.Text, txtSurName.Text, extension);

                if (fileExtention.ToLower() != ".jpg")
                {
                    /*dont do message*/
                }
                else
                {
                    int filesize = fu1.PostedFile.ContentLength;
                    if (filesize > 1048576)
                    {
                        /*dont do message*/
                    }
                    else
                    {

                        fu1.SaveAs(Server.MapPath("~/images/players/" + aut));
                    }
                }
            }
            else
            {

            }

        }
        else if (e.CommandName == "Insert")
        {
            TextBox txtSurName = (TextBox)ListView1.InsertItem.FindControl("SURENAMETextBox");
            TextBox txtFirstName = (TextBox)ListView1.InsertItem.FindControl("FIRSTNAMETextBox");
            FileUpload fu2 = (FileUpload)ListView1.InsertItem.FindControl("FileUpload2");
            if (fu2.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(fu2.FileName);
                string aut = String.Format("{0}-{1}.jpg", txtFirstName.Text, txtSurName.Text);

                if (fileExtention.ToLower() != ".jpg")
                {
                    /*dont do message*/
                }
                else
                {
                    int filesize = fu2.PostedFile.ContentLength;
                    if (filesize > 1048576)
                    {
                        /*dont do message*/
                    }
                    else
                    {

                        fu2.SaveAs(Server.MapPath("~/images/players/" + aut));
                    }
                }

            }
            else
            {

            }
        }
    }
        
}