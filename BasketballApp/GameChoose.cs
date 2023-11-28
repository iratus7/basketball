using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace BasketballApp
{
    public partial class GameChoose : Form
    {
        BasketballService.ServicebasketballClient basketballWcf = new BasketballService.ServicebasketballClient();

        public Roster Roster;

        public GameChoose()
        {
            InitializeComponent();
            DataTable dt = basketballWcf.GetTodayMatches();
            //SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
            //con.Open();
            //try
            //{
            //    SqlDataAdapter sda = new SqlDataAdapter("SELECT GAMES.ID AS GAME,GAMES.DATE_TIME AS [DATE], GAMES.AGONISTIKI AS AGONISTIKI, HT.NAME AS [HOME TEAM], AT.NAME AS [AWAY TEAM], REF1.SURENAME AS [1st REFEREE], REF2.SURENAME AS [2nd REFEREE], REF3.SURENAME AS [3rd REFEREE], ARENAS.NAME AS ARENA, HC.SURENAME AS [HOME COACH], AC.SURENAME AS [AWAY COACH],GAMES.HOME_TEAM_ID,GAMES.AWAY_TEAM_ID FROM GAMES INNER JOIN TEAMS AS HT ON GAMES.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON GAMES.AWAY_TEAM_ID = AT.ID INNER JOIN ARENAS ON GAMES.ARENA_ID = ARENAS.ID INNER JOIN COACH AS HC ON GAMES.HOME_TEAM_COACH_ID = HC.ID INNER JOIN COACH AS AC ON GAMES.AWAY_TEAM_COACH_ID = AC.ID INNER JOIN REFEREE AS REF1 ON GAMES.REFEREE1_ID = REF1.ID INNER JOIN REFEREE AS REF2 ON GAMES.REFEREE2_ID = REF2.ID INNER JOIN REFEREE AS REF3 ON GAMES.REFEREE3_ID = REF3.ID  WHERE CAST(GAMES.DATE_TIME AS DATE) = CAST(CURRENT_TIMESTAMP AS DATE)", con);
            //    DataTable dt = new DataTable();
            //    sda.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListViewItem item = new ListViewItem(dt.Rows[i]["GAME"].ToString());
                item.SubItems.Add(dt.Rows[i]["DATE"].ToString());
                item.SubItems.Add(dt.Rows[i]["AGONISTIKI"].ToString());
                item.SubItems.Add(dt.Rows[i]["HOME TEAM"].ToString());
                item.SubItems.Add(dt.Rows[i]["AWAY TEAM"].ToString());
                item.SubItems.Add(dt.Rows[i]["1st REFEREE"].ToString());
                item.SubItems.Add(dt.Rows[i]["2nd REFEREE"].ToString());
                item.SubItems.Add(dt.Rows[i]["3rd REFEREE"].ToString());
                item.SubItems.Add(dt.Rows[i]["ARENA"].ToString());
                item.SubItems.Add(dt.Rows[i]["HOME COACH"].ToString());
                item.SubItems.Add(dt.Rows[i]["AWAY COACH"].ToString());
                item.SubItems.Add(dt.Rows[i]["HOME_TEAM_ID"].ToString());
                item.SubItems.Add(dt.Rows[i]["AWAY_TEAM_ID"].ToString());

                listView1.Items.Add(item);
            }
            //}
            //catch (Exception ex){
            //    MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    Application.ExitThread();
            //}
            //con.Close();            
        }
        private void button1_Click(object sender, EventArgs e)
        {
            listView1.Items.Clear();
            DataTable dt = basketballWcf.GetTodayMatches();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListViewItem item = new ListViewItem(dt.Rows[i]["GAME"].ToString());
                item.SubItems.Add(dt.Rows[i]["DATE"].ToString());
                item.SubItems.Add(dt.Rows[i]["AGONISTIKI"].ToString());
                item.SubItems.Add(dt.Rows[i]["HOME TEAM"].ToString());
                item.SubItems.Add(dt.Rows[i]["AWAY TEAM"].ToString());
                item.SubItems.Add(dt.Rows[i]["1st REFEREE"].ToString());
                item.SubItems.Add(dt.Rows[i]["2nd REFEREE"].ToString());
                item.SubItems.Add(dt.Rows[i]["3rd REFEREE"].ToString());
                item.SubItems.Add(dt.Rows[i]["ARENA"].ToString());
                item.SubItems.Add(dt.Rows[i]["HOME COACH"].ToString());
                item.SubItems.Add(dt.Rows[i]["AWAY COACH"].ToString());
                item.SubItems.Add(dt.Rows[i]["HOME_TEAM_ID"].ToString());
                item.SubItems.Add(dt.Rows[i]["AWAY_TEAM_ID"].ToString());

                listView1.Items.Add(item);
            }
            //SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
            //con.Open();
            //try
            //{
            //    SqlDataAdapter sda = new SqlDataAdapter("SELECT GAMES.ID AS GAME,GAMES.DATE_TIME AS [DATE], GAMES.AGONISTIKI AS AGONISTIKI, HT.NAME AS [HOME TEAM], AT.NAME AS [AWAY TEAM], REF1.SURENAME AS [1st REFEREE], REF2.SURENAME AS [2nd REFEREE], REF3.SURENAME AS [3rd REFEREE], ARENAS.NAME AS ARENA, HC.SURENAME AS [HOME COACH], AC.SURENAME AS [AWAY COACH],GAMES.HOME_TEAM_ID,GAMES.AWAY_TEAM_ID FROM GAMES INNER JOIN TEAMS AS HT ON GAMES.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON GAMES.AWAY_TEAM_ID = AT.ID INNER JOIN ARENAS ON GAMES.ARENA_ID = ARENAS.ID INNER JOIN COACH AS HC ON GAMES.HOME_TEAM_COACH_ID = HC.ID INNER JOIN COACH AS AC ON GAMES.AWAY_TEAM_COACH_ID = AC.ID INNER JOIN REFEREE AS REF1 ON GAMES.REFEREE1_ID = REF1.ID INNER JOIN REFEREE AS REF2 ON GAMES.REFEREE2_ID = REF2.ID INNER JOIN REFEREE AS REF3 ON GAMES.REFEREE3_ID = REF3.ID  WHERE CAST(GAMES.DATE_TIME AS DATE) = CAST(CURRENT_TIMESTAMP AS DATE)", con);
            //    DataTable dt = new DataTable();
            //    sda.Fill(dt);

            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        ListViewItem item = new ListViewItem(dt.Rows[i]["GAME"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["DATE"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["AGONISTIKI"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["HOME TEAM"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["AWAY TEAM"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["1st REFEREE"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["2nd REFEREE"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["3rd REFEREE"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["ARENA"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["HOME COACH"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["AWAY COACH"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["HOME_TEAM_ID"].ToString());
            //        item.SubItems.Add(dt.Rows[i]["AWAY_TEAM_ID"].ToString());

            //        listView1.Items.Add(item);
            //    }
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    Application.ExitThread();
            //}
            //con.Close();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void button3_Click(object sender, EventArgs e)
        {   
            if (listView1.SelectedItems.Count > 0)
            {                
                this.Hide();                
                Roster = new Roster();
                //Roster.Game1 = Game;
                //Roster.label1.Text = listView1.SelectedItems[0].Text;                
                Roster.GetGameC = listView1.SelectedItems[0].Text;
                Roster.HTeam = listView1.SelectedItems[0].SubItems[3].Text;
                Roster.ATeam = listView1.SelectedItems[0].SubItems[4].Text;
                Roster.HTeamId = listView1.SelectedItems[0].SubItems[11].Text;
                Roster.ATeamId = listView1.SelectedItems[0].SubItems[12].Text;
                Roster.Show();
            }
            else {
                //do nothing
            }
        }
        private void GameChoose_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Είστε σίγουρος οτι θέλετε να βγείτε απο την εφαρμογή?", "ΈΞΟΔΟΣ", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                e.Cancel = true;
            }   
        } 
    }
}
