using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddGame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (FormView1.CurrentMode == FormViewMode.Insert)
        {
            DropDownList HomeTeamId = FormView1.FindControl("DropDownListHomeIns") as DropDownList;
            string team = HomeTeamId.SelectedValue.ToString();
            if (team == "0") {/*do nothing*/ }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
                conn.Open();
                string queryHome = "SELECT dbo.COACH.ID, dbo.COACH.SURENAME FROM dbo.COACH WHERE (dbo.COACH.TEAM_ID =" + team + ")";
                SqlCommand cmd = new SqlCommand(queryHome, conn);
                var HOME_TEAM_COACH_ID = cmd.ExecuteScalar().ToString();
                HiddenField HomeCoachIdLabelins = FormView1.FindControl("HomeCoachLabel") as HiddenField;
                HomeCoachIdLabelins.Value = Convert.ToString(HOME_TEAM_COACH_ID);
                conn.Close();
                /*-------------------------*/
                DropDownList AwayTeamId = FormView1.FindControl("DropDownListAwayIns") as DropDownList;
                string teamA = string.Format("{0}", AwayTeamId.Text);
                SqlConnection connA = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
                connA.Open();
                string queryAway = "SELECT dbo.COACH.ID, dbo.COACH.SURENAME FROM dbo.COACH WHERE (dbo.COACH.TEAM_ID =" + teamA + ")";
                SqlCommand cmdA = new SqlCommand(queryAway, connA);
                var Away_Coach_Id = cmdA.ExecuteScalar().ToString();
                HiddenField AwayCoachIdLabelins = FormView1.FindControl("AwayCoachLabel") as HiddenField;
                AwayCoachIdLabelins.Value = Convert.ToString(Away_Coach_Id);
                connA.Close();

            }
            
        
        }
        else if (FormView1.CurrentMode == FormViewMode.Edit)
        {
            DropDownList HomeTeamId = FormView1.FindControl("DropDownListHometeam") as DropDownList;
            //TextBox txtdate = FormView1.FindControl("TextBoxDatetime") as TextBox;
            string team = string.Format("{0}", HomeTeamId.Text);
            if (team == "0") { /*do nothing*/ }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
                conn.Open();
                string queryHome = "SELECT dbo.COACH.ID, dbo.COACH.SURENAME FROM dbo.COACH INNER JOIN dbo.GAMES ON dbo.COACH.TEAM_ID = dbo.GAMES.HOME_TEAM_ID WHERE (dbo.GAMES.HOME_TEAM_ID =" + team + ")";
                SqlCommand cmd = new SqlCommand(queryHome, conn);

                // HiddenField HomeHiddenField = FormView1.FindControl("HomeHiddenField") as HiddenField;
                //HomeHiddenField.Value = cmd.ExecuteScalar().ToString();
                var HOME_TEAM_COACH_ID = cmd.ExecuteScalar().ToString();

                HiddenField HomeCoachIdLabel = FormView1.FindControl("HomeCLabel") as HiddenField;
                HomeCoachIdLabel.Value = Convert.ToString(HOME_TEAM_COACH_ID);
                //testLabel.Text = cmd.ExecuteScalar().ToString();
                conn.Close();
                /*-------------------------*/
                DropDownList AwayTeamId = FormView1.FindControl("DropDownListAwayteam") as DropDownList;
                //TextBox txtdate = FormView1.FindControl("TextBoxDatetime") as TextBox;
                string teamA = string.Format("{0}", AwayTeamId.Text);
                SqlConnection connA = new SqlConnection(ConfigurationManager.ConnectionStrings["BasketballCstr"].ToString());
                connA.Open();
                string queryAway = "SELECT dbo.COACH.ID, dbo.COACH.SURENAME FROM dbo.COACH INNER JOIN dbo.GAMES ON dbo.COACH.TEAM_ID = dbo.GAMES.AWAY_TEAM_ID WHERE (dbo.GAMES.AWAY_TEAM_ID =" + teamA + ")";
                SqlCommand cmdA = new SqlCommand(queryAway, connA);

                // HiddenField HomeHiddenField = FormView1.FindControl("HomeHiddenField") as HiddenField;
                //HomeHiddenField.Value = cmd.ExecuteScalar().ToString();
                var Away_Coach_Id = cmdA.ExecuteScalar().ToString();

                HiddenField AwayCoachIdLabel = FormView1.FindControl("AwayCLabel") as HiddenField;
                AwayCoachIdLabel.Value = Convert.ToString(Away_Coach_Id);
                //testLabel.Text = cmd.ExecuteScalar().ToString();
                connA.Close();
            }
        }
    }
   
    /*
    protected void myFormView_PreRender(object sender, EventArgs e)
    {
        if (FormView1.CurrentMode == FormViewMode.Edit)
        {
            TextBox txtdate = FormView1.FindControl("TextBoxDatetime") as TextBox;
            DropDownList txthour = FormView1.FindControl("hourddl") as DropDownList;
            DropDownList txtminutes = FormView1.FindControl("MinutesDdl") as DropDownList;
            DropDownList txtpmam = FormView1.FindControl("AMPMddl") as DropDownList;
            string time = string.Format("{0}-{1}{2}", txthour.Text, txtminutes.Text, txtpmam.Text);

            testLabel.Text = time;
        }
    }
    ----------------------------------------------------
    
    /*protected void FormView1_EditCommand(object sendre, FormViewModeEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            TextBox txthour = (TextBox)FormView1.ItemUpdating.FindControl("hourddl");
            TextBox txtminutes = (TextBox)FormView1.EditItem.FindControl("MinutesDdl");
            TextBox txtpmam = (TextBox)FormView1.EditItem.FindControl("AMPMddl");
            string time = string.Format("{0}-{1}{2}", txthour.Text, txtminutes.Text, txtpmam.Text);



        }
        else if (e.CommandName == "Insert")
        {
            TextBox txtSurName = (TextBox)ListView1.InsertItem.FindControl("SURENAMETextBox");
            TextBox txtFirstName = (TextBox)ListView1.InsertItem.FindControl("FIRST_NAMETextBox");
            FileUpload fu2 = (FileUpload)ListView1.InsertItem.FindControl("FileUpload2");
            if (fu2.HasFile)
            {
                string aut = String.Format("{0}-{1}.jpg", txtFirstName.Text, txtSurName.Text);
                fu2.SaveAs(Server.MapPath("~/images/coaches/" + aut));


            }
            else
            {

            }
        }
    }*/


    /*protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
       
    }*/
}