using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }
    protected void Stats_Ddl_IndexChanged(object sender, EventArgs e)
    {
        GridViewMinutes.Visible = false;
        GridViewIndex.Visible = false;
        GridView3points.Visible = false;
        GridView2points.Visible = false;
        GridViewFreeThrow.Visible = false;
        GridViewBlocks.Visible = false;
        GridViewFouls.Visible = false;
        GridViewSteals.Visible = false;
        GridViewAssists.Visible = false;
        GridViewRebounds.Visible = false;
        GridViewPoints.Visible = false;
        GridViewTurnovers.Visible = false;
        IndexLabel.Visible = false;
        if (Stats_Ddl.SelectedItem.Text == "POINTS")
        {
            GridViewPoints.Visible = true;
        }
        else
        {
            if (Stats_Ddl.SelectedItem.Text == "REBOUNDS")
                GridViewRebounds.Visible = true;

        
        else
        {
            if (Stats_Ddl.SelectedItem.Text == "ASSISTS")
                GridViewAssists.Visible = true;


            else
            {
                if (Stats_Ddl.SelectedItem.Text == "STEALS")
                    GridViewSteals.Visible = true;
               


                    else
                    {
                        if (Stats_Ddl.SelectedItem.Text == "TURNOVERS")
                            GridViewTurnovers.Visible = true;
                        else
                        {
                            if (Stats_Ddl.SelectedItem.Text == "FOULS")
                                GridViewFouls.Visible = true;
                            else
                            {
                                if (Stats_Ddl.SelectedItem.Text == "BLOCKS")
                                    GridViewBlocks.Visible = true;

                                else
                                {
                                    if (Stats_Ddl.SelectedItem.Text == "FREE THROWS")
                                        GridViewFreeThrow.Visible = true;
                                    else
                                    {
                                        if (Stats_Ddl.SelectedItem.Text == "2POINTS")
                                            GridView2points.Visible = true;
                                        else
                                        {
                                            if (Stats_Ddl.SelectedItem.Text == "3POINTS")
                                                GridView3points.Visible = true;
                                            else
                                            {
                                                if (Stats_Ddl.SelectedItem.Text == "INDEX RATING")
                                                {
                                                    GridViewIndex.Visible = true;
                                                    IndexLabel.Visible = true;
                                                }
                                                else
                                                {
                                                    if (Stats_Ddl.SelectedItem.Text == "MINUTES PLAYED")
                                                        GridViewMinutes.Visible = true;
                                                }
                                            }
                                        }

                                    }
                                }
                            }
                       
                    }
                }
            }
        }
        }

    }

    protected void gvHover_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //Add CSS class on header row.
        if (e.Row.RowType == DataControlRowType.Header)
            e.Row.CssClass = "header";

        //Add CSS class on normal row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Normal)
            e.Row.CssClass = "normal";

        //Add CSS class on alternate row.
        if (e.Row.RowType == DataControlRowType.DataRow &&
                  e.Row.RowState == DataControlRowState.Alternate)
            e.Row.CssClass = "alternate";
        
        
        
        
    }
       
    
   ///*sorting arrows*/
   // protected void GridViewSteals_RowDataBound(object sender, GridViewRowEventArgs e)
   // {
   //     string imgAsc = @" <img src='images/BackToTop.png' border='0' title='Ascending' />";
   //     string imgDes = @" <img src='images/BackToTop.png' border='0' title='Descendng' />";
   //     if (e.Row.RowType == DataControlRowType.Header)
   //     {
   //         foreach (TableCell cell in e.Row.Cells)
   //         {
   //             LinkButton lnkbtn = (LinkButton)cell.Controls[0];
   //             if (lnkbtn.Text == GridViewSteals.SortExpression)
   //             {
   //                 if (GridViewSteals.SortDirection == SortDirection.Ascending)
   //                 {
   //                     lnkbtn.Text += imgAsc;
   //                 }
   //                 else
   //                     lnkbtn.Text += imgDes;
   //             }
   //         }
   //     }
   // }
}
   
