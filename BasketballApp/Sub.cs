using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BasketballApp
{
    public partial class Sub : Form
    {
        private string PeriodStr;
        public string GetPeriodStr
        {
            get { return PeriodStr; }
            set { PeriodStr = value; }
        }
        private int GivePeriodCode(string PeriodStr)
        {
            if (PeriodStr == "I PERIOD")
            { return 1; }
            else if (PeriodStr == "II PERIOD")
            { return 2; }
            else if (PeriodStr == "III PERIOD")
            { return 3; }
            else if (PeriodStr == "IV PERIOD")
            { return 4; }
            else if (PeriodStr == "I OVERTIME")
            { return 5; }
            else if (PeriodStr == "II OVERTIME")
            { return 6; }
            else if (PeriodStr == "III OVERTIME")
            { return 7; }
            else if (PeriodStr == "IV OVERTIME")
            { return 8; }
            else if (PeriodStr == "V OVERTIME")
            { return 9; }
            else if (PeriodStr == "VI OVERTIME")
            { return 10; }
            else if (PeriodStr == "VII OVERTIME")
            { return 11; }
            else if (PeriodStr == "VIII OVERTIME")
            { return 12; }
            else if (PeriodStr == "IX OVERTIME")
            { return 13; }
            else if (PeriodStr == "X OVERTIME")
            { return 14; }
            else { return 0; }          
        }
        private KeyValuePair<int, int> Time;
        public KeyValuePair<int, int> GetTime
        {
            get { return Time; }
            set { Time = value; }
        }
        private KeyValuePair<int, string> Hometeam;
        public KeyValuePair<int, string> GetHometeam
        {
            get { return Hometeam; }
            set { Hometeam = value; }
        }  
        public List<Game.Events> events = new List<Game.Events>();
        public List<Game.Events> GetEvents
        {
            get { return events; }
            set { events = value; }
        } 
        private BindingList<KeyValuePair<int, string>> Homelist;
        public BindingList<KeyValuePair<int, string>> GetHomelist
        {
            get { return Homelist; }
            set { Homelist = value; }            
        }       
        public Sub()
        {            
            InitializeComponent();  
        }
        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            CheckedListBox items = (CheckedListBox)sender;
            if (items.CheckedItems.Count > 4)
            {
                e.NewValue = CheckState.Unchecked;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();           
        }
        public int Compare(KeyValuePair<int,string> a, KeyValuePair<int,string> b)
        {
            //var regex = new Regex("^(d+)");

            //// run the regex on both strings
            //var xRegexResult = regex.Match(a.Value.Substring(0, 2));
            //var yRegexResult = regex.Match(b.Value.Substring(0, 2));

            //// check if they are both numbers
            //if (xRegexResult.Success && yRegexResult.Success)
            //{
            //    return int.Parse(xRegexResult.Groups[1].Value).CompareTo(int.Parse(yRegexResult.Groups[1].Value));
            //}

            //// otherwise return as string comparison
            int ag = Convert.ToInt16(a.Value.Substring(0, 2));
            int bg = Convert.ToInt16(b.Value.Substring(0, 2));
            return ag.CompareTo(bg);
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (checkedListBox1.CheckedItems.Count == 5)
            {
                BindingList<int> indexes = new BindingList<int>();
                foreach (int indexChecked in checkedListBox1.CheckedIndices)
                {
                    indexes.Add(indexChecked);
                }
                Game game = new Game();
                //game.listBoxHome.BeginUpdate();
                
                foreach (int PlayingInd in indexes)
                {
                    Homelist.Insert(0, Homelist[PlayingInd]);
                    Homelist.RemoveAt(PlayingInd + 1);
                    //game.listBoxHome.Items.Insert(0, game.listBoxHome.Items[PlayingInd]);
                    //game.listBoxHome.Items.RemoveAt(PlayingInd);
                }

                //xorismos se 2 listes kai sorting sti kathemia ksexorista
                List<KeyValuePair<int, string>> Playinglist = new List<KeyValuePair<int, string>>();
                for (int i = 0; i < 5; i ++)
                {
                    Playinglist.Add(Homelist[i]);
                }
                Playinglist.Sort(Compare);
                
                List<KeyValuePair<int, string>> Benchlist = new List<KeyValuePair<int, string>>();
                for (int i = 5; i < Homelist.Count(); i++)
                {
                    Benchlist.Add(Homelist[i]);
                }
                Benchlist.Sort(Compare);

                //enosi twn 2 list
                var unionedList = new List<KeyValuePair<int, string>>();
                unionedList.AddRange(Playinglist.Union(Benchlist));
                //katharismos homelist kai gemisma me swsti seira 
                Homelist.Clear();
                for (int i = 0; i < unionedList.Count(); i++)
                {
                    Homelist.Insert(i, unionedList[i]);
                }
                game.GetHomelist = Homelist;

                List<int> Change = new List<int>();
                List<string> ChangeStr = new List<string>();
                for (int i = 0; i < Playinglist.Count(); i++)
                {
                    Change.Add(Playinglist[i].Key);
                    ChangeStr.Add(Playinglist[i].Value.Substring(0, 3));
                }
                string PlayingStr = string.Join("-", ChangeStr);
                events.Add(new Game.Events()
                {
                    Time = string.Format("{0}:{1}", Time.Key.ToString("00"), Time.Value.ToString("00")),
                    PlayerId = 0,
                    TeamId = Hometeam.Key,
                    Event = 22,
                    DisplayPbp = string.Format("{0}:{1}-{2}-Change : {3}", Time.Key.ToString("00"), Time.Value.ToString("00"), Hometeam.Value.Substring(0, 3), PlayingStr),
                    X = 0,
                    Y = 0,
                    Change = Change,
                    PeriodCode = GivePeriodCode(PeriodStr)
                });
                game.GetEvents = events; 
                //game.listBoxHome.DataSource = Homelist;
                //game.listBoxHome.DisplayMember = "Value";
                //game.listBoxHome.ValueMember = "Key";
                //game.listBoxHome.EndUpdate();
                this.Close();                
            }
            else { MessageBox.Show("Παρακαλώ Επιλέξτε 5 Παίκτες"); }
        
        }       
        private void Sub_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 5; i++)

                checkedListBox1.SetItemChecked(i, true);
        }        
    }
}
