﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTeam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {         
    }
    protected void checkfilesizeIns(object source, ServerValidateEventArgs args)
    {
        FileUpload fu2 = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");

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
        FileUpload fu1 = (FileUpload)ListView1.EditItem.FindControl("FileUpload2");

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
 protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            TextBox txtTeamName = (TextBox)ListView1.EditItem.FindControl("NAMETextBox");            
            FileUpload fu2 = (FileUpload)ListView1.EditItem.FindControl("FileUpload2");
            if (fu2.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(fu2.FileName);
                string extension = ".png";
                string aut = string.Format("{0}{1}", txtTeamName.Text, extension);

                
                    int filesize = fu2.PostedFile.ContentLength;
                    if (filesize > 1048576)
                    {
                        /*dont do message*/
                    }
                    else
                    {
                        fu2.SaveAs(Server.MapPath("~/images/teams/" + aut));
                    }
            }
            else
            {
            }
        }
        else if (e.CommandName == "Insert")
        {
            TextBox txtTeamName = (TextBox)ListView1.InsertItem.FindControl("NAMETextBox");
            FileUpload fu1 = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
            if (fu1.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(fu1.FileName);
                string aut = String.Format("{0}.png", txtTeamName.Text);

                    int filesize = fu1.PostedFile.ContentLength;
                    if (filesize > 1048576)
                    {
                        /*dont do message*/
                    }
                    else
                    {
                        fu1.SaveAs(Server.MapPath("~/images/teams/" + aut));
                    } 
            }
            else
            {
            }
        }
     }           
   
}
