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
using System.Collections;
using System.Collections.Specialized;

namespace BasketballApp
{
    public partial class Roster : Form
    {
        BasketballService.ServicebasketballClient basketballWcf = new BasketballService.ServicebasketballClient();

        private string GameC;
        public string GetGameC
        {
            get { return GameC; }
            set { GameC = value; }
        }
        public string HTeam;
        public string ATeam;
        public string HTeamId;
        public string ATeamId;
            //public DataTable dt = new DataTable();            
        
        //GameChoose GameChoose = new GameChoose();          
        public Roster()
        {           
            //string Game = GameChoose.Game;            
            InitializeComponent();            
        }
        private sealed class ListItem : IComparable<ListItem>
        {
            public int Id;
            public string Name;

            public int CompareTo(ListItem other)
            {
                return other == null ? 1 : Id.CompareTo(other.Id);
            }

            public override string ToString()
            {
                //return Id + " - " + Name;
                return Name;
            }
        }
        private void Roster_Load(object sender, EventArgs e)
        {
            //metavlites apo proigoumeni forma
            string po = GameC.ToString();
            string ht = HTeam.ToString();
            string at = ATeam.ToString();

            //open connection
            //SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
            //con.Open();
            //    // bind hometeam listbox
            //SqlDataAdapter sda = new SqlDataAdapter("SELECT PLAYERS.ID, PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, CAST(PLAYERS.NO AS VARCHAR) + ' - ' + PLAYERS.SURNAME + ', ' + PLAYERS.FIRSTNAME AS PLAYER FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID WHERE (TEAMS.NAME ='" + ht + "')ORDER BY PLAYERS.NO", con);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            DataTable dt = basketballWcf.GetHomeRoster(Convert.ToInt16(po));
//ArrayList list = new ArrayList();
            object[] items = new object[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                items[i] = new ListItem { Id = (int)dt.Rows[i]["ID"], Name = dt.Rows[i]["PLAYER"].ToString() };

                //list.Add(i);
            }
                listBox1.Items.AddRange(items);
            
            //listBox1.DataSource = dt;
            //listBox1.DisplayMember = "PLAYER";
            //listBox1.ValueMember = "ID";
                   
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{

            //    listBox1.Items.Add(dt.Rows[i]["PLAYER"].ToString());
            //}

            // bind awayteam listbox
                //SqlDataAdapter sdaa = new SqlDataAdapter("SELECT PLAYERS.ID, PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, CAST(PLAYERS.NO AS VARCHAR) + ' - ' + PLAYERS.SURNAME + ', ' + PLAYERS.FIRSTNAME AS PLAYER FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID WHERE (TEAMS.NAME ='" + at + "')ORDER BY PLAYERS.NO", con);
                //DataTable dta = new DataTable();
                //sdaa.Fill(dta);
                //ArrayList list = new ArrayList();
                DataTable dta = basketballWcf.GetAwayRoster(Convert.ToInt16(po));
                object[] itemsA = new object[dta.Rows.Count];
                for (int i = 0; i < dta.Rows.Count; i++)
                {
                    itemsA[i] = new ListItem { Id = (int)dta.Rows[i]["ID"], Name = dta.Rows[i]["PLAYER"].ToString() };

                    //list.Add(i);
                }
                listBox3.Items.AddRange(itemsA);

            
            //SqlDataAdapter sdaa = new SqlDataAdapter("SELECT PLAYERS.ID, PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, CAST(PLAYERS.NO AS VARCHAR) + ' - ' + PLAYERS.SURNAME + ', ' + PLAYERS.FIRSTNAME AS PLAYER FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID WHERE (TEAMS.NAME ='" + at + "')ORDER BY PLAYERS.NO", con);
            //DataTable dta = new DataTable();
            //sdaa.Fill(dta);

            //for (int i = 0; i < dta.Rows.Count; i++)
            //{

            //    listBox3.Items.Add(dta.Rows[i]["PLAYER"].ToString());
            //}
            label5.Text = ht;
            label6.Text = at;            
            //close connection
            //con.Close();
        }
        private void moveItems(ListBox from, ListBox to)
        {
            if (from.SelectedItems.Count == 0||from.SelectedItems.Count > 12||to.Items.Count > 11)
            {                
                    MessageBox.Show("Παρακαλώ Επιλέξτε Μέχρι 12 Παίκτες");
                    return;  
            }
            object[] tmp = new object[from.SelectedItems.Count];
            from.SelectedItems.CopyTo(tmp, 0);            
            to.Items.AddRange(tmp);            
            from.BeginUpdate();
            foreach (var item in tmp)
                from.Items.Remove(item);
            from.EndUpdate();
        }        
        //ΜΕΤΑΦΟΡΑ ΔΕΞΙΑ ΓΗΠΕΔΟΥΧΟΣ
        private void button1_Click(object sender, EventArgs e)
        {
            if (listBox2.Items.Count <12)
            {
            moveItems(listBox1, listBox2);
            }//ADD();
        }
        //public void ADD()
        //{      
            //DictionaryEntry de = (DictionaryEntry)listBox1.SelectedItem;

            //string htKey = de.Key.ToString();

            
            //listBox2.DisplayMember = dictionarylist2.Keys.ToString(); 
            //listBox2.ValueMember = dictionarylist2.Values.ToString();
            //listBox2.DataSource = new BindingSource(dictionarylist2.Values, null);

            //listBox2.DisplayMember = dictionary.Keys.ToString();
            //listBox2.ValueMember = dictionary.Values.ToString();
            //listBox2.DataSource = (from Values in dictionary.Values select Values).ToList();

            //listBox2.DisplayMember = dictionary.Keys.ToString();
            //listBox2.ValueMember = dictionary.Values.ToString();
            //listBox2.DataSource = (from Values in dictionary.Values select Values).ToList();
            //int c = listBox1.Items.Count - 1;
            //if (listBox2.Items.Count < 12)
            //{
            //    for (int i = c; i >= 0; i--)
            //    {
            //        if (listBox1.GetSelected(i))
            //        {
            //            listBox2.Items.Add(listBox1.Items[i]);
            //            listBox1.Items.RemoveAt(i);
            //        }
            //    }
            //}
        //}

        //ΜΕΤΑΦΟΡΑ ΔΕΞΙΑ ΦΙΛΟΞΕΝΟΥΜΕΝΟΣ
        private void button4_Click(object sender, EventArgs e)
        {
            if (listBox4.Items.Count < 12)
            {
                moveItems(listBox3, listBox4);
            }
        }
        //private void ADDAway()
        //{
        //    int c = listBox3.Items.Count - 1;
        //    if (listBox4.Items.Count < 12)
        //    {
        //        for (int i = c; i >= 0; i--)
        //        {
        //            if (listBox3.GetSelected(i))
        //            {

        //                listBox4.Items.Add(listBox3.Items[i]);
        //                listBox3.Items.RemoveAt(i);
        //            }
        //        }
        //    }
        //    else { }
        //}

        //ΕΠΙΣΤΡΟΦΗ ΑΡΙΣΤΕΡΑ ΓΗΠΕΔΟΥΧΟΣ
        private void button2_Click(object sender, EventArgs e)
        {
            moveItems(listBox2,listBox1 );
        }
        //private void REMOVE()
        //{
        //    int c = listBox2.Items.Count - 1;

        //    for (int i = c; i >= 0; i--)
        //    {
        //        if (listBox2.GetSelected(i))
        //        {
        //            listBox1.Items.Add(listBox2.Items[i]);
        //            listBox2.Items.RemoveAt(i);
        //        }
        //    }
        //}
        //ΕΠΙΣΤΡΟΦΗ ΑΡΙΣΤΕΡΑ ΦΙΛΟΞΕΝΟΥΜΕΝΟΣ
        private void button3_Click(object sender, EventArgs e)
        {
            moveItems(listBox4, listBox3);
        }
        //private void REMOVEAway()
        //{
        //    int c = listBox4.Items.Count - 1;

        //    for (int i = c; i >= 0; i--)
        //    {
        //        if (listBox4.GetSelected(i))
        //        {
        //            listBox3.Items.Add(listBox4.Items[i]);
        //            listBox4.Items.RemoveAt(i);
        //        }
        //    }
        //}

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            GameChoose gc = new GameChoose();
            gc.Show();
        }
        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
             moveItems(listBox1, listBox2);
        }
        private void listBox3_DoubleClick(object sender, EventArgs e)
        {
             moveItems(listBox3, listBox4);
        }
        private void listBox2_DoubleClick(object sender, EventArgs e)
        {
             moveItems(listBox2, listBox1);
        }
        private void listBox4_DoubleClick(object sender, EventArgs e)
        {
            moveItems(listBox4, listBox3);
        }
        private void button8_Click(object sender, EventArgs e)
        {           
            listBox1.Items.Clear();
            listBox2.Items.Clear();
            listBox3.Items.Clear();
            listBox4.Items.Clear();

            //metavlites apo proigoumeni forma
            string po = GameC.ToString();
            string ht = HTeam.ToString();
            string at = ATeam;

            DataTable dt = basketballWcf.GetHomeRoster(Convert.ToInt16(po));
            object[] items = new object[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                items[i] = new ListItem { Id = (int)dt.Rows[i]["ID"], Name = dt.Rows[i]["PLAYER"].ToString() };

            }
            listBox1.Items.AddRange(items);

            // bind awayteam listbox
            DataTable dta = basketballWcf.GetAwayRoster(Convert.ToInt16(po));
            object[] itemsA = new object[dta.Rows.Count];
            for (int i = 0; i < dta.Rows.Count; i++)
            {
                itemsA[i] = new ListItem { Id = (int)dta.Rows[i]["ID"], Name = dta.Rows[i]["PLAYER"].ToString() };

            }
            listBox3.Items.AddRange(itemsA);
            
            label5.Text = ht;
            label6.Text = at;            
        }
        public void button7_Click(object sender, EventArgs e)
        {
            //if (listBox2.Items.Count > 4)
            //{
            //    if (listBox4.Items.Count > 4)
            //    {                   

            //        Game game = new Game();
                    
            //        int c = listBox2.Items.Count - 1;
                    
            //            for (int i = c; i >= 0; i--)
            //            {
            //                game.listBoxHome.Items.Add(listBox2.Items[i]);
                            
            //            }
                    
            //            int ca = listBox4.Items.Count - 1;

            //            for (int i = ca; i >= 0; i--)
            //            {
            //                game.listBoxAway.Items.Add(listBox4.Items[i]);

            //            }

                    
            //        this.Hide();
                    
            //        game.Show();
                   
            //    }
            //}
            //else
            //{
            //    //do nothing
            //}

            if (listBox2.Items.Count > 4 && listBox2.Items.Count < 13 && listBox4.Items.Count > 4 && listBox4.Items.Count < 13)
            {
                Game game = new Game(); 
                BindingList<KeyValuePair<int, string>> uList = new BindingList<KeyValuePair<int, string>>();
                BindingList<KeyValuePair<int, string>> aList = new BindingList<KeyValuePair<int, string>>();
     
                    foreach (ListItem item in listBox2.Items)
                    {
                        uList.Add(new KeyValuePair<int, string>(item.Id, item.Name));
                        
                        //dictionaryHome.Add(item.Id, item.Name); 
                        //game.listBoxHome.DataSource = new BindingSource(dictionaryHome, null);
                        //game.listBoxHome.DisplayMember = "Value";
                        //game.listBoxHome.ValueMember = "Key"; 
                       

                        //game.listBoxHome.DisplayMember = dictionaryHome.Values.ToString();
                        //game.listBoxHome.ValueMember = dictionaryHome.Keys.ToString();
                        //game.listBoxHome.DataSource = (from Values in dictionaryHome.Values select Values).ToList();
                                               
                        //int itemId = item.Id;
                    }
                    game.GetHomelist = uList;
                    //game.listBoxHome.DataSource = uList;
                    //game.listBoxHome.DisplayMember = "Value";
                    //game.listBoxHome.ValueMember = "Key";

                    foreach (ListItem item in listBox4.Items)
                    {
                        aList.Add(new KeyValuePair<int, string>(item.Id, item.Name));
                    }
                    game.GetAwaylist = aList;                    
                                    
                    this.Hide();                    
                    game.label1.Text = HTeam.ToString();
                    game.label2.Text = ATeam.ToString();
                    game.HTeamName = HTeam.ToString();
                    game.ATeamName = ATeam.ToString();
                    game.GetGameId = Convert.ToInt32(GameC);
                    game.HomeTeamId = Convert.ToInt32(HTeamId);
                    game.AwayTeamId = Convert.ToInt32(ATeamId);
                    game.Show();                
            }
            else
            {
                MessageBox.Show("Πρέπει να Επιλέξετε 5 έως 12 Παίκτες");
                return;
            }            
//            foreach (ListItem item in listBox2.Items)
//{
//    int itemId = item.Id;
    
//}
        }

        private void Roster_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Είστε σίγουρος οτι θέλετε να βγείτε απο την εφαρμογή?", "ΈΞΟΔΟΣ", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                e.Cancel = true;
            }   
        }

        //private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        //{
            
            //int c = listBox1.Items.Count - 1;
            //if (listBox2.Items.Count < 12)
            //{
            //    for (int i = c; i >= 0; i--)
            //    {
            //        if (listBox1.GetSelected(i))
            //        {

            //            dictionarylist2.Add(dt.Rows[i]["ID"].ToString(), dt.Rows[i]["PLAYER"].ToString());
            //            dictionarylist1.Remove(dt.Rows[i]["ID"].ToString());
            //            //listBox1.Items.RemoveAt(i);
            //        }
            //    }
            //}
            //else { }
                        
        //}
    }
}
