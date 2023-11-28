using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
{
    protected void checkfilesize(object source, ServerValidateEventArgs args)
    {
        if (FormViewReport.CurrentMode == FormViewMode.Insert)
        {
            FileUpload fu2 = (FileUpload)FormViewReport.FindControl("FileUploadReportInsert");
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
        
        else if (FormViewReport.CurrentMode == FormViewMode.Edit)
        {
           FileUpload fu1 = (FileUpload)FormViewReport.FindControl("FileUploadReportEdit");
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
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        /*Label Gid = FormViewReport.FindControl("GAME_IDLabel") as Label;
        var GaId = Gid.Text.ToString();
        this.Session["GAME_ID"] = GaId.ToString();
        */

        if (FormViewReport.CurrentMode == FormViewMode.Insert)
        {
            DropDownList DdlGameIdIns = FormViewReport.FindControl("DropDownListReportIns") as DropDownList;
            string GameIdIns = DdlGameIdIns.SelectedValue.ToString();
            //this.Session["GAME_ID"] = String.IsNullOrWhiteSpace(GameIdIns).ToString();

            FileUpload fuEdit = (FileUpload)FormViewReport.FindControl("FileUploadReportInsert");
            if (fuEdit.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(fuEdit.FileName);
                string extension = ".jpg";
                string aut = string.Format("{0}{1}", GameIdIns, extension);

                int filesize = fuEdit.PostedFile.ContentLength;
                if (filesize > 1048576)
                {
                    /*dont do message*/
                }
                else
                {
                    fuEdit.SaveAs(Server.MapPath("~/images/report/" + aut));
                }
            }
            else
            {

            }
        }
        else if (FormViewReport.CurrentMode == FormViewMode.Edit)
        {            
            Label LGameId = FormViewReport.FindControl("LabelEditGameId") as Label;
            string GameId = LGameId.Text.ToString();

            FileUpload fuEdit = (FileUpload)FormViewReport.FindControl("FileUploadReportEdit");
            if (fuEdit.HasFile)
            {
                string fileExtention = System.IO.Path.GetExtension(fuEdit.FileName);
                string extension = ".jpg";
                string aut = string.Format("{0}{1}", GameId, extension);

                int filesize = fuEdit.PostedFile.ContentLength;
                if (filesize > 1048576)
                {
                    /*dont do message*/                 

                }
                else
                {
                    fuEdit.SaveAs(Server.MapPath("~/images/report/" + aut));
                }

            }
            else
            {

            }
        }
    }
    
    protected void FormViewReport_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["HOME_PLAYER_ID"] = ((DropDownList)((FormView)sender).FindControl("DropDownListRepIns")).SelectedValue;
        e.Values["AWAY_PLAYER_ID"] = ((DropDownList)((FormView)sender).FindControl("DropDownListAwayPlayerInsert")).SelectedValue;
        /*enalaktika auto: SelectedValue='<%# DataBinder.Eval (Container.DataItem, "HOME_PLAYER_ID") %>' mpainei sto <asp:DropDownList ID="DropDownListRepIns" kai sbinw to event iteminserting sto formview-->*/
    }
}


       

   
    
   
   
       
        
