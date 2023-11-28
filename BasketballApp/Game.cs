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
using System.Drawing.Drawing2D;
using System.Collections.Specialized;
using System.Xml.Linq;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace BasketballApp
{
    public partial class Game : Form
    {
        BasketballService.ServicebasketballClient basketballWcf = new BasketballService.ServicebasketballClient();
        public int HomeTeamId;
        public int AwayTeamId;
        public string HTeamName;
        public string ATeamName;
        private int GameId;
        public int GetGameId
        {
            get { return GameId; }
            set { GameId = value; }
        }
        public List<Events> GetEvents
        {
            get { return events; }
            set { events = value; }
        } 
        BindingList<KeyValuePair<int, string>> Homelist = new BindingList<KeyValuePair<int, string>>();
        BindingList<KeyValuePair<int, string>> Awaylist = new BindingList<KeyValuePair<int, string>>();
        //private BindingList<KeyValuePair<int, string>> Homelist;
        public BindingList<KeyValuePair<int, string>> GetHomelist
        {
            get { return Homelist; }
            set { Homelist = value; }
        }
        public BindingList<KeyValuePair<int, string>> GetAwaylist
        {
            get { return Awaylist; }
            set { Awaylist = value; }
        }
        class Clists
        {
             public List<Changes> Changes { get; set; } 
        }
        class Changes
        {
            public int Ts { get; set; }
            public List<int> ChangebT { get; set; }
        }
        public class Events
        {
            public string Time { get; set; }
            public int PlayerId { get; set; }
            public int TeamId { get; set; }
            public int Event { get; set; }
            public string DisplayPbp { get; set; }
            public int X { get; set; }
            public int Y { get; set; }
            public List<int> Change { get; set; }
            public int PeriodCode { get; set; }
        }
        public List<Events> events = new List<Events>();
        private int SetPerCode(string PeriodStr)
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
        public List<string> period = new List<string>();
        public Game()
        {
            InitializeComponent();            

            label3.Text = "Shooting Court";
            string[] Pitems = new string[] { "I PERIOD", "II PERIOD", "III PERIOD", "IV PERIOD", "I OVERTIME", "II OVERTIME", "III OVERTIME", "IV OVERTIME", "V OVERTIME", "VI OVERTIME", "VII OVERTIME", "VIII OVERTIME", "IX OVERTIME", "X OVERTIME" };
            period.AddRange(Pitems);
            Periodlabel.Text = period[0].ToString();
            int Hs = 0; int As = 0;
            labelHScore.Text = Hs.ToString();
            labelAScore.Text = As.ToString();
            events.Add(new Events()
            {
                Time = string.Format("{0}:{1}", mins, secs),
                PlayerId = 0,
                TeamId = 9999,
                Event = 1,
                DisplayPbp = "I PERIOD",
                X = 0,
                Y = 0,
                Change = null,
                PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                //Dob = new DateTime(1984, 5, 26)
            });
            listBoxEvents.BeginUpdate();
            AddEvent();
            listBoxEvents.EndUpdate();

            GraphicsPath gp = new GraphicsPath();
            gp.AddEllipse(29, -185, 215, 325); //x,y the upper left corner of the rect containing the ellipse  40, -95, 207, 240          
            
           pictureBox1.MouseClick += (s, es) =>
            { 
                if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
                { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
                else
                {
                    var PlayerTeamID = getPlayerAndTeamID();
                    var PlayerTeamName = getPlayerAndTeamName();

                    if (gp.IsVisible(es.X, es.Y))
                    {
                        //is inside
                        if (es.Button == MouseButtons.Right)
                        {
                            events.Add(new Events()
                            {
                                Time = string.Format("{0}:{1}", mins, secs),
                                PlayerId = PlayerTeamID.Key,
                                TeamId = PlayerTeamID.Value,
                                Event = 2,
                                DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Missed 2P", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                                X = es.X,
                                Y = es.Y,
                                Change = null,
                                PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                            });
                            //MessageBox.Show(String.Format("Right Clicked2 at X: {0} Y: {1}", e.X, e.Y));
                        }
                        else if (es.Button == MouseButtons.Left)
                        {
                            events.Add(new Events()
                            {
                                Time = string.Format("{0}:{1}", mins, secs),
                                PlayerId = PlayerTeamID.Key,
                                TeamId = PlayerTeamID.Value,
                                Event = 3,
                                DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Made 2P", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                                X = es.X,
                                Y = es.Y,
                                Change = null,
                                PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                            });
                            //MessageBox.Show(String.Format("Left Clicked2 at X: {0} Y: {1}", e.X, e.Y)); 
                        }
                    }
                    else
                    {
                        //is outside
                        if (es.Button == MouseButtons.Right)
                        {
                            events.Add(new Events()
                            {
                                Time = string.Format("{0}:{1}", mins, secs),
                                PlayerId = PlayerTeamID.Key,
                                TeamId = PlayerTeamID.Value,
                                Event = 4,
                                DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Missed 3P", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                                X = es.X,
                                Y = es.Y,
                                Change = null,
                                PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                            });
                            //MessageBox.Show(String.Format("Right Clicked3 at X: {0} Y: {1}", e.X, e.Y));
                        }
                        else if (es.Button == MouseButtons.Left)
                        {
                            events.Add(new Events()
                            {
                                Time = string.Format("{0}:{1}", mins, secs),
                                PlayerId = PlayerTeamID.Key,
                                TeamId = PlayerTeamID.Value,
                                Event = 5,
                                DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Made 3P", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                                X = es.X,
                                Y = es.Y,
                                Change = null,
                                PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                            });
                            //MessageBox.Show(String.Format("Left Clicked3 at X: {0} Y: {1}", e.X, e.Y));
                        }
                    }


                    listBoxEvents.BeginUpdate();
                    AddEvent();
                    listBoxEvents.EndUpdate();
                }
            };
            
            //listBoxHome.Sorted = true;
            //listBoxAway.Sorted = true;            
            //var pos = this.PointToScreen(label3.Location);
            //pos = pictureBox1.PointToClient(pos);
            //label3.Parent = pictureBox1;
            //label3.Location = pos;
            //label3.BackColor = Color.Transparent;
            //label3.BringToFront();
            //var pos = this.PointToScreen(pictureBox2.Location);
            //pos = pictureBox1.PointToClient(pos);
            //pictureBox2.Parent = pictureBox1;
            //pictureBox2.Location = pos;
            //pictureBox2.BackColor = Color.Transparent;

            //pictureBox2.BackColor = Color.Transparent;
            //pictureBox2.Location = pictureBox1;
            //pictureBox1.MouseClick += (s, e) => MessageBox.Show(String.Format("Mouse Clicked at X: {0} Y: {1}", e.X, e.Y));

            
            
                
            //pictureBox1.MouseClick += (s, e) =>
            //{
            //    var radius = 131;
            //    if (e.Button == MouseButtons.Right)
            //    {
            //        var sqr = Math.Sqrt(e.Y * e.Y + (135 - e.X) * (135 - e.X));
            //        if (sqr <= radius)
            //        {
            //            MessageBox.Show(String.Format("Right Clicked 2 at X: {0} Y: {1}", e.X, e.Y));
            //        }
            //        else { MessageBox.Show(String.Format("Right Clicked 3 at X: {0} Y: {1}", e.X, e.Y)); }

            //    }
            //    else if (e.Button == MouseButtons.Left)
            //    {
            //        var sqr = Math.Sqrt(e.Y * e.Y + (135 - e.X) * (135 - e.X));
            //        if (sqr <= radius)
            //        { MessageBox.Show(String.Format("Left Clicked 2 at X: {0} Y: {1}", e.X, e.Y)); }
            //        else { MessageBox.Show(String.Format("Left Clicked 3 at X: {0} Y: {1}", e.X, e.Y)); }
            //    }
            //};

            //listBoxHome.Items.Insert(1, polrr.ToString());
            //for (int i = 5; i < listBoxHome.Items.Count; i++)
            //{ listBoxHome.SelectionMode = SelectionMode.None; }
            //listBoxHome.DrawMode = DrawMode.OwnerDrawFixed;
            //listBoxHome.DrawItem += new DrawItemEventHandler(OurListBox1_DrawItem);
        
        //private void OurListBox1_DrawItem(object sender, DrawItemEventArgs e)
        //{
        //    e.DrawBackground();
        //    e.Graphics.DrawString(listBoxHome.Items[e.Index].ToString(), new Font("Microsoft Sans Serif", 8, FontStyle.Regular), Brushes.DarkBlue, e.Bounds);
        //    e.DrawFocusRectangle();
        //}
        
        }
        private void ShowData()
        {
            listBoxHome.DataSource = Homelist;
            listBoxHome.DisplayMember = "Value";
            listBoxHome.ValueMember = "Key";
        }
        private void ShowAwayData()
        {
            listBoxAway.DataSource = Awaylist;
            listBoxAway.DisplayMember = "Value";
            listBoxAway.ValueMember = "Key";
        }
        private void AddEvent()
        {
            listBoxEvents.DataSource = events.ToList();
            listBoxEvents.DisplayMember = "DisplayPbp";
        }

        public int mins = 10, secs = 0;
        bool paused = false; // this bool is to check if the timer was paused

        public KeyValuePair<int, int> getPlayerAndTeamID()
        {
            int PlayerId; 
            if (listBoxHome.SelectedIndex != -1)
            {
                KeyValuePair<int, string> kvp = (KeyValuePair<int, string>)listBoxHome.SelectedItem;
                PlayerId = kvp.Key;
                return new KeyValuePair<int, int>(PlayerId,HomeTeamId);
            }
            else if (listBoxAway.SelectedIndex != -1)
            {
                KeyValuePair<int, string> kvp = (KeyValuePair<int, string>)listBoxAway.SelectedItem;
                PlayerId = kvp.Key;
                return new KeyValuePair<int, int>(PlayerId, AwayTeamId);
            }
            else
            {
                PlayerId = 0;
                return new KeyValuePair<int, int>(PlayerId, 0); 
            }
        }
        public KeyValuePair<string, string> getPlayerAndTeamName()
        {
            string PlayerName;
            if (listBoxHome.SelectedIndex != -1)
            {
                KeyValuePair<int, string> kvp = (KeyValuePair<int, string>)listBoxHome.SelectedItem;
                PlayerName = kvp.Value;
                return new KeyValuePair<string, string>(PlayerName, HTeamName);
            }
            else if (listBoxAway.SelectedIndex != -1)
            {
                KeyValuePair<int, string> kvp = (KeyValuePair<int, string>)listBoxAway.SelectedItem;
                PlayerName = kvp.Value;
                return new KeyValuePair<string, string>(PlayerName, ATeamName);
            }
            else
            {
                PlayerName = "0";
                return new KeyValuePair<string, string>(PlayerName, "0");
            }
        }
        ////selected ID of Player
        //public int getPlayerId();int getTeamId()
        //{
        //    int PlayerId;
        //    if (listBoxHome.SelectedIndex != -1)
        //    {
        //        KeyValuePair<int, string> kvp = (KeyValuePair<int, string>)listBoxHome.SelectedItem;
        //        PlayerId = kvp.Key;
        //        return PlayerId;
        //    }
        //    else if (listBoxAway.SelectedIndex != -1)
        //    {
        //        KeyValuePair<int, string> kvp = (KeyValuePair<int, string>)listBoxAway.SelectedItem;
        //        PlayerId = kvp.Key;
        //        return PlayerId;
        //    }
        //    else { PlayerId =0;
        //    return PlayerId;
        //    }
            
        //}
        private void InvertMySelection(ListBox inner, ListBox outer)
        {
            // Loop through all items the ListBox. 
            for (int i = 0; i < inner.Items.Count; i++)
            {
                // Determine if the item is selected. 
                if (inner.GetSelected(i) == true)
                    //uncheck the other listbox when check the first one
                    outer.ClearSelected();
            }
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            if (!paused)
            {
                if (labelMin.Text == "" || labelSec.Text == "" )//here we check if the textboxes are empty
                {
                    MessageBox.Show("Τέλος Περιόδου");
                }
                else// on here we save the labels values to some variables named mins, secs and we start the timer
                {
                    mins = int.Parse(labelMin.Text);
                    secs = int.Parse(labelSec.Text);
                    
                    button1.Enabled = false;
                    timer1.Start();
                    button2.Enabled = true;
                    button4.Enabled = true;
                    button5.Enabled = true;

                }
            }
            else if (paused)
            {
                paused = false;
                timer1.Start();
                button2.Enabled = true;
                button1.Enabled = false;
                button4.Enabled = true;
                button5.Enabled = true;
            }     
            //DictionaryEntry de = (DictionaryEntry)listBoxHome.SelectedItem;
            //string htKey = de.Value.ToString();            

            //string polll = listBoxHome.SelectedValue.ToString();
            //var po = listBoxHome.SelectedValue.ToString();
//            foreach (ListItem item in listBoxHome.Items)
           
//{
//    int itemId = item.Id;
    
//}
        }

        private void listBoxHome_SelectedIndexChanged(object sender, EventArgs e)
        {
            InvertMySelection(listBoxHome, listBoxAway);
            
            ////make only first5 selectable
            //for (int i = 5; i < listBoxHome.Items.Count; i++)
            //{
            //    if (listBoxHome.GetSelected(i) == true)
            //        listBoxHome.ClearSelected();
               
            //}

            if (listBoxHome.SelectedIndex >= 5)
            {
                listBoxHome.SelectedIndex = -1;
                listBoxHome.Invalidate();
            }
        }

        private void listBoxAway_SelectedIndexChanged(object sender, EventArgs e)
        {
            InvertMySelection( listBoxAway,listBoxHome);

            //make only first5 selectable
            //for (int i = 5; i < listBoxAway.Items.Count; i++)
            //{
            //    if (listBoxAway.GetSelected(i) == true)
            //        listBoxAway.ClearSelected();
            //}
            if (listBoxAway.SelectedIndex >= 5)
            {
                listBoxAway.SelectedIndex = -1;
                listBoxAway.Invalidate();
            }
        }
        
        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
            GraphicsPath gp = new GraphicsPath();

            gp.AddEllipse(29, -185, 215, 325); //x,y the upper left corner of the rect containing the ellipse
            //e.Graphics.FillPath(Brushes.White, gp);
            //e.Graphics.DrawPath(Pens.Black, gp);
            Point finalMousePos = e.Location;
            if (gp.IsVisible(e.X, e.Y))
            {
                //is inside
                label3.Text = "2 Points";
            } 
            else
            {
                //is outside
                label3.Text = "3 Points";
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            paused = true;
            button1.Enabled = true;
            button4.Enabled = true;
            button2.Enabled = false;
            timer1.Stop();
        }

       

        private void label3_MouseHover(object sender, EventArgs e)
        {
            label3.Text = "3 Points";
        }
        private void label3_MouseEnter(object sender, EventArgs e)
        {
            label3.Text = "3 Points";
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            if ( mins == 0 && secs == 0)// on here we check if the time is up and we add some stuff on times up
            {
                timer1.Stop();

                button1.Enabled = false;
                labelMin.Text = "00";
                labelSec.Text = "00";
                MessageBox.Show(new Form() { TopMost = true }, "Τέλος Περιόδου", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information);
                button2.Enabled = false;
                button4.Enabled = false;
                button5.Enabled = false;
            }
            else
            {
                if (secs < 1)// here is the most important code (dont forget to change the timer to 1000 milliseconds)!!! first we check if the secs are smaller than 1
                {
                    secs = 59;// on here we make the secs to 59 if it is smaller than 1
                    if (mins < 1)// here we check if the minutes are smaller than 1
                    {
                        mins = 10;// on here we make the mins to 59 if it is smaller than 1                        
                    }
                    else mins -= 1;// on here we remove from the current mins 1

                }
                else secs -= 1;// and here we do the same with the seconds
               
                if (mins > 9)
                    labelMin.Text = mins.ToString();
                else labelMin.Text = "0" + mins.ToString();
                if (secs > 9)
                    labelSec.Text = secs.ToString();
                else labelSec.Text = "0" + secs.ToString();
            }
        }  
        private void button4_Click(object sender, EventArgs e)
        {
            if (mins > 1)
            {
                mins -= 1; labelMin.Text = "0" + mins.ToString(); button5.Enabled = true;

            }
            else if (mins == 1)
            {
                if (secs == 0)
                {
                    mins = 0;
                    timer1.Stop();

                    labelMin.Text = "00";
                    labelSec.Text = "00";
                    MessageBox.Show(new Form() { TopMost = true }, "Τέλος Περιόδου", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    button1.Enabled = false;
                    button2.Enabled = false;
                    button4.Enabled = false;
                    button5.Enabled = false;
                }
                else { mins -= 1; labelMin.Text = "0" + mins.ToString(); }
            }
            else
            {
                mins = 0; secs = 0;
                timer1.Stop();

                labelMin.Text = "00";
                labelSec.Text = "00";
                MessageBox.Show(new Form() { TopMost = true }, "Τέλος Περιόδου", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information);

                button1.Enabled = false;
                button2.Enabled = false;
                button4.Enabled = false;
                button5.Enabled = false;
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (mins == 0)
            {
                if (secs <= 10)
                {
                    secs = 0;
                    timer1.Stop();

                    labelMin.Text = "00";
                    labelSec.Text = "00";
                    MessageBox.Show(new Form() { TopMost = true }, "Τέλος Περιόδου", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    button1.Enabled = false;
                    button2.Enabled = false;
                    button4.Enabled = false;
                    button5.Enabled = false;
                }
                else
                {
                    if (secs < 20)
                    { secs -= 10; labelSec.Text = "0" + secs.ToString(); }
                    else { secs -= 10; labelSec.Text = secs.ToString(); }
                }
            }
            
            else
            {
                if (secs < 10)// here is the most important code (dont forget to change the timer to 1000 milliseconds)!!! first we check if the secs are smaller than 1
                {
                    secs = secs + 50;// on here we make the secs to 59 if it is smaller than 1
                    if (mins < 1)// here we check if the minutes are smaller than 1
                    {
                        mins = 10;// on here we make the mins to 59 if it is smaller than 1                        
                    }
                    else mins -= 1;// on here we remove from the current mins 1

                }
                else secs -= 10;// and here we do the same with the seconds

                if (mins > 9)
                    labelMin.Text = mins.ToString();
                else labelMin.Text = "0" + mins.ToString();
                if (secs > 9)
                    labelSec.Text = secs.ToString();
                else labelSec.Text = "0" + secs.ToString();
            }
        }

        private void panel1_MouseEnter(object sender, EventArgs e)
        {
            label3.Text = "Shooting Court";
        }

        private void listBoxHome_DrawItem(object sender, DrawItemEventArgs e)
        {
            // Draw the background of the ListBox control for each item.
            e.DrawBackground();
            // Define the default color of the brush as black.
            Brush myBrush = Brushes.Gray;

            // Determine the color of the brush to draw each item based  
            // on the index of the item to draw. 
            if (e.Index < 5)
            {
                myBrush = Brushes.DarkBlue;
            }

            // Draw the current item text based on the current Font  
            // and the custom brush settings.
            e.Graphics.DrawString(((KeyValuePair<int, string>)listBoxHome.Items[e.Index]).Value,
                e.Font, myBrush, e.Bounds, StringFormat.GenericDefault);
            // If the ListBox has focus, draw a focus rectangle around the selected item.                       
            e.DrawFocusRectangle();
        }

        private void listBoxAway_DrawItem(object sender, DrawItemEventArgs e)
        {
            // Draw the background of the ListBox control for each item.
            e.DrawBackground();
            // Define the default color of the brush as black.
            Brush myBrush = Brushes.Gray;

            // Determine the color of the brush to draw each item based  
            // on the index of the item to draw. 
            if (e.Index < 5)
            {
                myBrush = Brushes.DarkBlue;
            }

            // Draw the current item text based on the current Font  
            // and the custom brush settings.
            e.Graphics.DrawString(((KeyValuePair<int, string>)listBoxAway.Items[e.Index]).Value,
                e.Font, myBrush, e.Bounds, StringFormat.GenericDefault);
            // If the ListBox has focus, draw a focus rectangle around the selected item.
            e.DrawFocusRectangle();
        }

        private void listBoxHome_MeasureItem(object sender, MeasureItemEventArgs e)
        {
            
                if (e.Index == 4) e.ItemHeight = 38;//Set the Height of the item at index 2 to 50
            
        }

        private void listBoxAway_MeasureItem(object sender, MeasureItemEventArgs e)
        {
            
                if (e.Index == 4) e.ItemHeight = 38;//Set the Height of the item at index 2 to 50
            
        }

        

        public List<int> HScoreP = new List<int>();
        public List<int> AScoreP = new List<int>();        
        //period count
        int periodcount = 1;
        private void button7_Click(object sender, EventArgs e)
        {
            
            //period.Add("1st PERIOD"); period.Add("2nd PERIOD"); period.Add("3rd PERIOD"); period.Add("4th PERIOD");
            //period.Add("1st OVERTIME"); period.Add("2nd OVERTIME"); period.Add("3rd OVERTIME"); period.Add("4th OVERTIME"); period.Add("5th OVERTIME");
            //period.Add("6th OVERTIME"); period.Add("7th OVERTIME"); period.Add("8th OVERTIME"); period.Add("9th OVERTIME"); period.Add("10th OVERTIME");
            if (periodcount < 4)
            {
                if (mins == 0 && secs == 0)
                {
                    string HSc = labelHScore.Text; string ASc = labelAScore.Text;
                    HScoreP.Add(Convert.ToInt16(HSc)); AScoreP.Add(Convert.ToInt16(ASc));
                    if (periodcount == 1) { label1HS.Text = HSc.ToString(); label1AS.Text = ASc.ToString(); }
                    else if (periodcount == 2) { label2HS.Text = HSc.ToString(); label2AS.Text = ASc.ToString(); }
                    else if (periodcount == 3) { label3HS.Text = HSc.ToString(); label3AS.Text = ASc.ToString(); }
                    else if (periodcount == 4) { label4HS.Text = HSc.ToString(); label4AS.Text = ASc.ToString(); }
                    else { }

                    Periodlabel.Text = period[periodcount].ToString();

                    events.Add(new Events()
                    {
                        Time = string.Format("{0}:{1}", mins, secs),
                        PlayerId = 0,
                        TeamId = 9999,
                        Event = 6,
                        DisplayPbp = period[periodcount].ToString(),
                        X = 0,
                        Y = 0,
                        Change = null,
                        PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                        //Dob = new DateTime(1984, 5, 26)
                    });
                    listBoxEvents.BeginUpdate();
                    AddEvent();
                    listBoxEvents.EndUpdate();

                    if (periodcount <= 12)
                    {
                        if (periodcount >= 4) { mins = 5; labelMin.Text = "0" + mins.ToString(); }
                        else { mins = 10; labelMin.Text = mins.ToString(); }
                        periodcount++;

                        button1.Enabled = true;
                        button4.Enabled = true;
                        button5.Enabled = true;
                    }
                }
                else { MessageBox.Show(new Form() { TopMost = true }, "Υπάρχει ακόμα χρόνος", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information); }
            }
            else 
            {
                if (Convert.ToInt16(labelHScore.Text) == Convert.ToInt16(labelAScore.Text))
                {
                    if (mins == 0 && secs == 0)
                    {
                        string HSc = labelHScore.Text; string ASc = labelAScore.Text;
                        HScoreP.Add(Convert.ToInt16(HSc)); AScoreP.Add(Convert.ToInt16(ASc));
                        if (periodcount == 1) { label1HS.Text = HSc.ToString(); label1AS.Text = ASc.ToString(); }
                        else if (periodcount == 2) { label2HS.Text = HSc.ToString(); label2AS.Text = ASc.ToString(); }
                        else if (periodcount == 3) { label3HS.Text = HSc.ToString(); label3AS.Text = ASc.ToString(); }
                        else if (periodcount == 4) { label4HS.Text = HSc.ToString(); label4AS.Text = ASc.ToString(); }
                        else { }

                        Periodlabel.Text = period[periodcount].ToString();

                        events.Add(new Events()
                        {
                            Time = string.Format("{0}:{1}", mins, secs),
                            PlayerId = 0,
                            TeamId = 9999,
                            Event = 6,
                            DisplayPbp = period[periodcount].ToString(),
                            X = 0,
                            Y = 0,
                            Change = null,
                            PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                            //Dob = new DateTime(1984, 5, 26)
                        });
                        listBoxEvents.BeginUpdate();
                        AddEvent();
                        listBoxEvents.EndUpdate();

                        if (periodcount <= 12)
                        {
                            if (periodcount >= 4) { mins = 5; labelMin.Text = "0" + mins.ToString(); }
                            else { mins = 10; labelMin.Text = mins.ToString(); }
                            periodcount++;

                            button1.Enabled = true;
                            button4.Enabled = true;
                            button5.Enabled = true;
                        }
                    }
                    else { MessageBox.Show(new Form() { TopMost = true }, "Υπάρχει ακόμα χρόνος", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information); }
                }
                else { MessageBox.Show(new Form() { TopMost = true }, "Το Score Πρέπει να Είναι Ισόπαλο", "Πατήστε -> ΟΚ", MessageBoxButtons.OK, MessageBoxIcon.Information); }

            }
            
        }        
        private void button6_Click(object sender, EventArgs e)
        {
            //stop the clock in subtitiution
            paused = true;
            button1.Enabled = true;
            button4.Enabled = true;
            button2.Enabled = false;
            timer1.Stop();
            timerUpdateStats.Stop();
            Sub sub = new Sub();
            sub.GetPeriodStr = Periodlabel.Text.ToString();
            sub.GetHometeam = new KeyValuePair<int,string>(HomeTeamId,HTeamName);
            sub.GetHomelist = Homelist;
            sub.GetEvents = events;
            sub.GetTime = new KeyValuePair<int, int>(mins, secs);
            //dictionaryHome.Add(item.Id, item.Name); 
            //game.listBoxHome.DataSource = new BindingSource(dictionaryHome, null);
            //game.listBoxHome.DisplayMember = "Value";
            //game.listBoxHome.ValueMember = "Key"; 
            
            //int itemId = item.Id;
            for (int i = 0; i < Homelist.Count; i++)
            {
                sub.checkedListBox1.Items.Add(Homelist[i].Value.ToString());
            }
            sub.checkedListBox1.DisplayMember = "Value";
            //lb1.Items.Clear();
            this.Opacity = 0.7;     
            sub.ShowDialog();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            //stop the clock in subtitiution
            paused = true;
            button1.Enabled = true;
            button4.Enabled = true;
            button2.Enabled = false;
            timer1.Stop();
            timerUpdateStats.Stop();
            SubAway subaway = new SubAway();
            subaway.GetPeriodStr = Periodlabel.Text.ToString();
            subaway.GetAwayteam = new KeyValuePair<int, string>(AwayTeamId, ATeamName);
            subaway.GetAwaylist = Awaylist;
            subaway.GetEvents = events;
            subaway.GetTime = new KeyValuePair<int, int>(mins, secs);
            for (int i = 0; i < Awaylist.Count; i++)
            {
                subaway.checkedListBox1.Items.Add(Awaylist[i].Value.ToString());
            }
            subaway.checkedListBox1.DisplayMember = "Value";
            this.Opacity = 0.7;
            subaway.ShowDialog();
        }
        private void Game_Activated(object sender, EventArgs e)
        {
            if (button3.Enabled)
            {
                labelHN.Text = HTeamName.Substring(0, 3).ToString();
                labelAN.Text = ATeamName.Substring(0, 3).ToString();
                listBoxHome.BeginUpdate();
                ShowData();
                listBoxHome.EndUpdate();
                listBoxHome.SelectedIndex = -1;

                listBoxAway.BeginUpdate();
                ShowAwayData();
                listBoxAway.EndUpdate();
                listBoxAway.SelectedIndex = -1;

                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
                timerUpdateStats.Start();
            }
            else
            { }
            this.Opacity = 1;
        }

        private void DeleteEvent_Click(object sender, EventArgs e)
        {
            if (listBoxEvents.SelectedIndex != -1)
            {
                int select = listBoxEvents.SelectedIndex;
                events.RemoveAt(select);
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
            else { }
        }

        private void listBoxEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            int select = listBoxEvents.SelectedIndex;
            if (select == -1)
            { }
            else
            {
                if (events[select].TeamId == 9999)
                    listBoxEvents.ClearSelected();
            }
        }

        private void TIME_OUT_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = 0,
                    TeamId = PlayerTeamID.Value,
                    Event = 7,
                    DisplayPbp = string.Format("{0}:{1}-{2}-Time Out", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3)),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void FASTBREAK_MADE_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 8,
                    DisplayPbp = string.Format("{0}:{1}-{2}-Fastbreak Made", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3)),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void FASTBREAK_MISSED_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 9,
                    DisplayPbp = string.Format("{0}:{1}-{2}-Fastbreak Missed", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3)),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void ASSIST_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 10,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Assist", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void TURNOVER_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 11,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Turnover", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void DEFENSIVE_REBOUND_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 12,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Def Rebound", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void OFFENSIVE_REBOUND_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 13,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Off Rebound", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void STEAL_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 14,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Steal", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void FOUL_ON_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 15,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Foul On", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void FOUL_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 16,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Foul", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void FT_MISSED_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 17,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Free Throw Missed", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void FT_MADE_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 18,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Free Throw Made", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void BLOCK_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 19,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Block", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void BLOCK_AGAINST_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 20,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Block Against", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }

        private void UNSPORTSMAN_FOUL_Click(object sender, EventArgs e)
        {
            if (listBoxHome.SelectedIndex == -1 && listBoxAway.SelectedIndex == -1)
            { MessageBox.Show("Παρακαλώ Επιλέξτε Παίχτη"); }
            else
            {
                var PlayerTeamID = getPlayerAndTeamID();
                var PlayerTeamName = getPlayerAndTeamName();
                events.Add(new Events()
                {
                    Time = string.Format("{0}:{1}", mins, secs),
                    PlayerId = PlayerTeamID.Key,
                    TeamId = PlayerTeamID.Value,
                    Event = 21,
                    DisplayPbp = string.Format("{0}:{1}-{2}-{3}-Unsportsman Foul", labelMin.Text, labelSec.Text, PlayerTeamName.Value.Substring(0, 3), PlayerTeamName.Key),
                    X = 0,
                    Y = 0,
                    Change = null,
                    PeriodCode = SetPerCode(Periodlabel.Text.ToString())
                });
                listBoxEvents.BeginUpdate();
                AddEvent();
                listBoxEvents.EndUpdate();
            }
        }
        //public static DataTable resort(DataTable dt, string colName, string direction)
        //{
        //    dt.DefaultView.Sort = colName + " " + direction;
        //    dt = dt.DefaultView.ToTable();
        //    return dt;
        //}
        private void UpdateStatsXML()
        {
            //Home Team
            DataTable dt = new DataTable();
            dt.TableName = "Player";
            dt.Columns.Add("PlayerId", typeof(int));
            dt.Columns.Add("PlayerName", typeof(string)); 
            dt.Columns.Add("PlayerNo", typeof(int));
            dt.Columns.Add("TwoPMissed", typeof(int));
            dt.Columns.Add("TwoPMade", typeof(int));
            dt.Columns.Add("ThreePMissed", typeof(int));
            dt.Columns.Add("ThreePMade", typeof(int));
            dt.Columns.Add("Assist", typeof(int));
            dt.Columns.Add("Turnover", typeof(int));
            dt.Columns.Add("DefRebound", typeof(int));
            dt.Columns.Add("OffRebound", typeof(int));
            dt.Columns.Add("Steal", typeof(int));
            dt.Columns.Add("FoulOn", typeof(int));
            dt.Columns.Add("Foul", typeof(int));
            dt.Columns.Add("FTMissed", typeof(int));
            dt.Columns.Add("FTMade", typeof(int));
            dt.Columns.Add("Block", typeof(int));
            dt.Columns.Add("BlockAgainst", typeof(int));
            dt.Columns.Add("UnsportsmanFoul", typeof(int));
            dt.Columns.Add("MinutesPlayed", typeof(int));
            //DataColumn dc1 = new DataColumn("PlayerId");
            //DataColumn dc2 = new DataColumn("PlayerName");
            //DataColumn dc3 = new DataColumn("PlayerNo");
            //DataColumn dc4 = new DataColumn("2PMissed");
            
            //for (int i=1;i<4;i++)
            //{
            //    dt.Columns.Add(string.Format("dc{0}",i));
            //}
            //dt.Columns.Add(dc1); dt.Columns.Add(dc2); dt.Columns.Add(dc3); dt.Columns.Add(dc4);
            for (int i = 0; i < Homelist.Count; i++)
            {
                dt.Rows.Add(Homelist[i].Key, Homelist[i].Value.Substring(4), Homelist[i].Value.Substring(0, 2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);                
            }
            dt.DefaultView.Sort = "PlayerNo ASC";
            dt = dt.DefaultView.ToTable();
            dt.PrimaryKey = new[] { dt.Columns["PlayerId"] };
            //resort(dt, "PlayerNo", "ASC");

            DataTable dteam = new DataTable();
            dteam.TableName = "HomeTeam";
            dteam.Columns.Add("HomeTeamId", typeof(int));
            dteam.Columns.Add("HomeTeamName", typeof(string));
            dteam.Columns.Add("TimeOut", typeof(int));
            dteam.Columns.Add("FastbreaksMade", typeof(int));
            dteam.Columns.Add("FastbreaksMissed", typeof(int));
            //dteam.Columns.Add("1stPScore", typeof(int));
            //dteam.Columns.Add("2ndPScore", typeof(int));
            //dteam.Columns.Add("3rdPScore", typeof(int));
            //dteam.Columns.Add("4thPScore", typeof(int));
            dteam.Rows.Add(HomeTeamId, HTeamName, 0, 0, 0);
           
            int pr = SetPerCode(Periodlabel.Text);
            int NTsec = mins * 60 + secs;
            if (NTsec == 600)
            {
                for (int q = 1; q < pr; q++)
                {
                    dteam.Columns.Add(period[q - 1].ToString().Replace(" ", string.Empty), typeof(int));
                    dteam.Rows[0][4 + q] = HScoreP[q - 1];
                }
            }
            else 
            {
                for (int q = 1; q < pr; q++)
                {
                    dteam.Columns.Add(period[q - 1].ToString().Replace(" ", string.Empty), typeof(int));
                    dteam.Rows[0][4 + q] = HScoreP[q - 1];
                }
                dteam.Columns.Add(Periodlabel.Text.ToString().Replace(" ", string.Empty), typeof(int));
                dteam.Rows[0][dteam.Columns.Count -1] = Convert.ToInt16(labelHScore.Text);
            }

            
            //temp def min pl  for Home          
            List<Changes> cl1 = new List<Changes>();
            List<Changes> cl2 = new List<Changes>();
            List<Changes> cl3 = new List<Changes>();
            List<Changes> cl4 = new List<Changes>();
            List<Changes> cl5 = new List<Changes>();
            List<Changes> cl6 = new List<Changes>();
            List<Changes> cl7 = new List<Changes>();
            List<Changes> cl8 = new List<Changes>();
            List<Changes> cl9 = new List<Changes>();
            List<Changes> cl10 = new List<Changes>();
            List<Changes> cl11 = new List<Changes>();
            List<Changes> cl12 = new List<Changes>();
            List<Changes> cl13 = new List<Changes>();
            List<Changes> cl14 = new List<Changes>();


            DataTable dxy = new DataTable();
            dxy.TableName = "CoordinatesHome";
            dxy.Columns.Add("XYText", typeof(string));
            string XYtextHome = null;
            //List<KeyValuePair<int, int>> Mplayed = new List<KeyValuePair<int, int>>();

            //for (int i = 0; i < Homelist.Count; i++)
            //{
            //    Mplayed.Add(new KeyValuePair<int, int>(Homelist[i].Key, 0));
            //}

            for (int i = 0; i < events.Count; i++)
            {
                //Temp minutes calculate lists
                //List<KeyValuePair<int, int>>[] clist = new List<KeyValuePair<int, int>>[14];

                //for (int n = 1; i < 15; n++)
                //{
                //    clist[n] = new List<KeyValuePair<int, int>>();
                //}                
                
                int plId = events[i].PlayerId;
                if (events[i].Event == 2 && events[i].TeamId == HomeTeamId)
                {                    
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(3); p++;
                    dt.Rows[index][3] = p;

                    XYtextHome += "2 " + events[i].X.ToString() +" "+ events[i].Y.ToString()+"*";
                    //dxy.Rows.Add(0, events[i].X, events[i].Y);
                    //dt.Rows[index][3];dt.Rows[index].ItemArray[3];
                }
                else if (events[i].Event == 3 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(4); p++;
                    dt.Rows[index][4] = p;

                    XYtextHome += "3 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 4 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(5); p++;
                    dt.Rows[index][5] = p;

                    XYtextHome += "4 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 5 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(6); p++;
                    dt.Rows[index][6] = p;

                    XYtextHome += "5 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 10 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(7); p++;
                    dt.Rows[index][7] = p;
                }
                else if (events[i].Event == 11 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(8); p++;
                    dt.Rows[index][8] = p;
                }
                else if (events[i].Event == 12 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(9); p++;
                    dt.Rows[index][9] = p;
                }
                else if (events[i].Event == 13 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(10); p++;
                    dt.Rows[index][10] = p;
                }
                else if (events[i].Event == 14 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(11); p++;
                    dt.Rows[index][11] = p;
                }
                else if (events[i].Event == 15 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(12); p++;
                    dt.Rows[index][12] = p;
                }
                else if (events[i].Event == 16 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(13); p++;
                    dt.Rows[index][13] = p;
                }
                else if (events[i].Event == 17 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(14); p++;
                    dt.Rows[index][14] = p;
                }
                else if (events[i].Event == 18 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(15); p++;
                    dt.Rows[index][15] = p;
                }
                else if (events[i].Event == 19 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(16); p++;
                    dt.Rows[index][16] = p;
                }
                else if (events[i].Event == 20 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(17); p++;
                    dt.Rows[index][17] = p;
                }
                else if (events[i].Event == 21 && events[i].TeamId == HomeTeamId)
                {
                    int index = dt.Rows.IndexOf(dt.Rows.Find(plId));
                    int p = dt.Rows[index].Field<int>(18); p++;
                    dt.Rows[index][18] = p;
                }
                else if (events[i].Event == 7 && events[i].TeamId == HomeTeamId)
                {                    
                    int p = dteam.Rows[0].Field<int>(2); p++;
                    dteam.Rows[0][2] = p;
                }
                else if (events[i].Event == 8 && events[i].TeamId == HomeTeamId)
                {
                    int p = dteam.Rows[0].Field<int>(3); p++;
                    dteam.Rows[0][3] = p;
                }
                else if (events[i].Event == 9 && events[i].TeamId == HomeTeamId)
                {
                    int p = dteam.Rows[0].Field<int>(4); p++;
                    dteam.Rows[0][4] = p;
                }

                //calculate Minutes Played 
                //Home Team      
         
                //    List<KeyValuePair<int, int>>[] clist = new List<KeyValuePair<int, int>>[14];

                //for (int n = 1; i < 15; n++)
                //{
                //    clist[n] = new List<KeyValuePair<int, int>>();
                //}

                else if (events[i].Event == 22 && events[i].TeamId == HomeTeamId)
                {      
                    int Tsec = Convert.ToInt16(events[i].Time.Substring(0,2))*60 + Convert.ToInt16(events[i].Time.Substring(3,2));
                    if (events[i].PeriodCode == 1)
                    {
                        cl1.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                        //for(int f=0;f<5;f++)
                        //{
                        //    clist1.Add(new KeyValuePair<int, int>(Tsec ,events[i].Change[f]));
                        //}
                    }
                    else if (events[i].PeriodCode == 2)
                    {
                        cl2.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 3)
                    {
                        cl3.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 4)
                    {
                        cl4.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 5)
                    {
                        cl5.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 6)
                    {
                        cl6.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 7)
                    {
                        cl7.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 8)
                    {
                        cl8.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 9)
                    {
                        cl9.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 10)
                    {
                        cl10.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 11)
                    {
                        cl11.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 12)
                    {
                        cl12.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 13)
                    {
                        cl13.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 14)
                    {
                        cl14.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }

                }

                else { }
            }

            List<Clists> AllCLists = new List<Clists>()
            { 
                new Clists{ Changes=cl1}, new Clists{ Changes=cl2}, new Clists{ Changes=cl3}, new Clists{ Changes=cl4}, new Clists{ Changes=cl5}, new Clists{ Changes=cl6}, new Clists{ Changes=cl7}, new Clists{ Changes=cl8}, new Clists{ Changes=cl9}, new Clists{ Changes=cl10}, new Clists{ Changes=cl11}, new Clists{ Changes=cl12}, new Clists{ Changes=cl13}, new Clists{ Changes=cl14}
             };
            int PCount;
            if (NTsec == 600 || NTsec == 300 && periodcount>4)
            {
                PCount = SetPerCode(Periodlabel.Text) - 1; NTsec = 0;

                for (int i = 0; i < PCount; i++)  //cl1=AllCLists[i].Changes an i=0.
                {
                    for (int f = 0; f < 5; f++)
                    {
                        int playId = AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].ChangebT[f];
                        int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));
                        int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].Ts - NTsec;
                        dt.Rows[ind][19] = Mp;
                    }
                    for (int j = AllCLists[i].Changes.Count - 2; j > -1; j--)
                    {
                        for (int f = 0; f < 5; f++)
                        {

                            int playId = AllCLists[i].Changes[j].ChangebT[f];
                            int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));
                            int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[i].Changes[j].Ts - AllCLists[i].Changes[j + 1].Ts;
                            dt.Rows[ind][19] = Mp;                            
                        }
                    }
                }
            }
            else if (NTsec == 0)
            {
                PCount = SetPerCode(Periodlabel.Text);            
                for (int i = 0; i < PCount; i++)  //cl1=AllCLists[i].Changes an i=0.           
                {                
                    for (int f = 0; f < 5; f++)                
                    {                    
                        int playId = AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].ChangebT[f];
                        int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));                   
                        int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].Ts - NTsec;                    
                        dt.Rows[ind][19] = Mp;
                    //find indexof Mplayed
                    //int n = -1;
                    //foreach (KeyValuePair<int, int> item in Mplayed)
                    //{
                    //    if (item.Key == AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].ChangebT[f])
                    //    {
                    //        n = Mplayed.IndexOf(item);
                    //        break;
                    //    }
                    //}
                    ////int index = cl1.Where<Changes>( x => return x.ChangebT[f] == 20; ).Select<Changes,int>( x => cl1.IndexOf(x)).Single<int>();
                    //Mplayed[n] = new KeyValuePair<int, int>(Mplayed[n].Key, Mplayed[n].Value + AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].Ts - NTsec);                
                    }                
                    for (int j = AllCLists[i].Changes.Count - 2; j > -1; j--)               
                    {                    
                        for (int f = 0; f < 5; f++)                    
                        {                        
                            int playId = AllCLists[i].Changes[j].ChangebT[f];                        
                            int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));                        
                            int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[i].Changes[j].Ts - AllCLists[i].Changes[j + 1].Ts;                        
                            dt.Rows[ind][19] = Mp;
                        //int n = -1;
                        //foreach (KeyValuePair<int, int> item in Mplayed)
                        //{
                        //    if (item.Key == AllCLists[i].Changes[j].ChangebT[f])
                        //    {
                        //        n = Mplayed.IndexOf(item);
                        //        break;
                        //    }
                        //}
                        //Mplayed[n] = new KeyValuePair<int, int>(Mplayed[n].Key, Mplayed[n].Value + AllCLists[i].Changes[j].Ts - AllCLists[i].Changes[j + 1].Ts);                    
                        }              
                    }//edw         
                }           
            }
            else {
                PCount = SetPerCode(Periodlabel.Text);
               
                for (int f = 0; f < 5; f++)               
                {
                    int playId = AllCLists[PCount - 1].Changes[AllCLists[PCount - 1].Changes.Count - 1].ChangebT[f];
                    int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));
                    int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[PCount - 1].Changes[AllCLists[PCount - 1].Changes.Count - 1].Ts - NTsec;
                    dt.Rows[ind][19] = Mp;
                }
                for (int j = AllCLists[PCount-1].Changes.Count - 2; j > -1; j--)
                {
                    for (int f = 0; f < 5; f++)
                    {
                        int playId = AllCLists[PCount - 1].Changes[j].ChangebT[f];
                        int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));
                        int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[PCount - 1].Changes[j].Ts - AllCLists[PCount - 1].Changes[j + 1].Ts;
                        dt.Rows[ind][19] = Mp;
                    }
                }
                //foreach (Clists cl in AllCLists)
                for (int i = 0; i < PCount-1; i++)  
                {
                    NTsec = 0;
                    for (int f = 0; f < 5; f++)
                    {
                        int playId = AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].ChangebT[f];
                        int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));
                        int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[i].Changes[AllCLists[i].Changes.Count - 1].Ts - NTsec;
                        dt.Rows[ind][19] = Mp;
                    }
                    for (int j = AllCLists[i].Changes.Count - 2; j > -1; j--)
                    {
                        for (int f = 0; f < 5; f++)
                        {

                            int playId = AllCLists[i].Changes[j].ChangebT[f];
                            int ind = dt.Rows.IndexOf(dt.Rows.Find(playId));
                            int Mp = dt.Rows[ind].Field<int>(19); Mp = Mp + AllCLists[i].Changes[j].Ts - AllCLists[i].Changes[j + 1].Ts;
                            dt.Rows[ind][19] = Mp;
                        }
                    }
                }
            }

            //a xycoordinareHome row Text
            dxy.Rows.Add(XYtextHome);

            //eventList
            DataTable delist = new DataTable();
            delist.TableName = "Event";
            delist.Columns.Add("EventSText", typeof(string));
            string EventText = null;
            for (int i = 0; i < events.Count; i++)
            {
                EventText += events[i].DisplayPbp+"*";
            }
            delist.Rows.Add(EventText);


            //Period , Time and eventlist info to HomeXml
            NTsec = mins * 60 + secs;  
            DataTable dtGInfo = new DataTable();
            dtGInfo.TableName = "GameInfo";
            dtGInfo.Columns.Add("CTime", typeof(int));
            dtGInfo.Columns.Add("CPeriod", typeof(string));
            dtGInfo.Columns.Add("CScore", typeof(string));
            dtGInfo.Columns.Add("GameId", typeof(int));
            string CPeriod;
            if(labelFS.Visible)
            {CPeriod = labelFS.Text;  }
            else { CPeriod = Periodlabel.Text; }
            dtGInfo.Rows.Add(NTsec, CPeriod, labelHScore.Text + "-" + labelAScore.Text,GameId);

          
            DataSet ds = new DataSet();
            ds.DataSetName = "HomeStats";
            ds.Tables.Add(dt);
            ds.Tables.Add(dteam);
            ds.Tables.Add(dtGInfo);
            ds.Tables.Add(dxy);
            ds.Tables.Add(delist);            
            ds.WriteXml(GameId.ToString() + "HomeXMLStats.xml");

            //Away Team
            DataTable dta = new DataTable();
            dta.TableName = "Player";
            dta.Columns.Add("PlayerId", typeof(int));
            dta.Columns.Add("PlayerName", typeof(string));
            dta.Columns.Add("PlayerNo", typeof(int));
            dta.Columns.Add("TwoPMissed", typeof(int));
            dta.Columns.Add("TwoPMade", typeof(int));
            dta.Columns.Add("ThreePMissed", typeof(int));
            dta.Columns.Add("ThreePMade", typeof(int));
            dta.Columns.Add("Assist", typeof(int));
            dta.Columns.Add("Turnover", typeof(int));
            dta.Columns.Add("DefRebound", typeof(int));
            dta.Columns.Add("OffRebound", typeof(int));
            dta.Columns.Add("Steal", typeof(int));
            dta.Columns.Add("FoulOn", typeof(int));
            dta.Columns.Add("Foul", typeof(int));
            dta.Columns.Add("FTMissed", typeof(int));
            dta.Columns.Add("FTMade", typeof(int));
            dta.Columns.Add("Block", typeof(int));
            dta.Columns.Add("BlockAgainst", typeof(int));
            dta.Columns.Add("UnsportsmanFoul", typeof(int));
            dta.Columns.Add("MinutesPlayed", typeof(int));
            //DataColumn dc1 = new DataColumn("PlayerId");
            //DataColumn dc2 = new DataColumn("PlayerName");
            //DataColumn dc3 = new DataColumn("PlayerNo");
            //DataColumn dc4 = new DataColumn("2PMissed");

            //for (int i=1;i<4;i++)
            //{
            //    dt.Columns.Add(string.Format("dc{0}",i));
            //}
            //dt.Columns.Add(dc1); dt.Columns.Add(dc2); dt.Columns.Add(dc3); dt.Columns.Add(dc4);
            for (int i = 0; i < Awaylist.Count; i++)
            {
                dta.Rows.Add(Awaylist[i].Key, Awaylist[i].Value.Substring(4), Awaylist[i].Value.Substring(0, 2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            }
            dta.DefaultView.Sort = "PlayerNo ASC";
            dta = dta.DefaultView.ToTable();
            dta.PrimaryKey = new[] { dta.Columns["PlayerId"] };
            //resort(dt, "PlayerNo", "ASC");

            DataTable dteama = new DataTable();
            dteama.TableName = "AwayTeam";
            dteama.Columns.Add("AwayTeamId", typeof(int));
            dteama.Columns.Add("AwayTeamName", typeof(string));
            dteama.Columns.Add("TimeOut", typeof(int));
            dteama.Columns.Add("FastbreaksMade", typeof(int));
            dteama.Columns.Add("FastbreaksMissed", typeof(int));
            dteama.Rows.Add(AwayTeamId, ATeamName, 0, 0, 0);

            NTsec = mins * 60 + secs;
            if (NTsec == 600)
            {
                for (int q = 1; q < pr; q++)
                {
                    dteama.Columns.Add(period[q - 1].ToString().Replace(" ", string.Empty), typeof(int));
                    dteama.Rows[0][4 + q] = AScoreP[q - 1];
                }
            }
            else
            {
                for (int q = 1; q < pr; q++)
                {
                    dteama.Columns.Add(period[q - 1].ToString().Replace(" ", string.Empty), typeof(int));
                    dteama.Rows[0][4 + q] = AScoreP[q - 1];
                }
                dteama.Columns.Add(Periodlabel.Text.ToString().Replace(" ", string.Empty), typeof(int));
                dteama.Rows[0][dteama.Columns.Count -1] = Convert.ToInt16(labelAScore.Text);
            }
            
            //temp def min pl  for Away          
            List<Changes> cla1 = new List<Changes>();
            List<Changes> cla2 = new List<Changes>();
            List<Changes> cla3 = new List<Changes>();
            List<Changes> cla4 = new List<Changes>();
            List<Changes> cla5 = new List<Changes>();
            List<Changes> cla6 = new List<Changes>();
            List<Changes> cla7 = new List<Changes>();
            List<Changes> cla8 = new List<Changes>();
            List<Changes> cla9 = new List<Changes>();
            List<Changes> cla10 = new List<Changes>();
            List<Changes> cla11 = new List<Changes>();
            List<Changes> cla12 = new List<Changes>();
            List<Changes> cla13 = new List<Changes>();
            List<Changes> cla14 = new List<Changes>();

            DataTable dxya = new DataTable();
            dxya.TableName = "CoordinatesAway";
            dxya.Columns.Add("XYText", typeof(string));          
            string XYtextAway = null;

            for (int i = 0; i < events.Count; i++)
            {
                int plId = events[i].PlayerId;
                if (events[i].Event == 2 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(3); p++;
                    dta.Rows[index][3] = p;

                    XYtextAway += "2 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 3 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(4); p++;
                    dta.Rows[index][4] = p;

                    XYtextAway += "3 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 4 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(5); p++;
                    dta.Rows[index][5] = p;

                    XYtextAway += "4 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 5 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(6); p++;
                    dta.Rows[index][6] = p;

                    XYtextAway += "5 " + events[i].X.ToString() + " " + events[i].Y.ToString() + "*";
                }
                else if (events[i].Event == 10 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(7); p++;
                    dta.Rows[index][7] = p;
                }
                else if (events[i].Event == 11 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(8); p++;
                    dta.Rows[index][8] = p;
                }
                else if (events[i].Event == 12 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(9); p++;
                    dta.Rows[index][9] = p;
                }
                else if (events[i].Event == 13 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(10); p++;
                    dta.Rows[index][10] = p;
                }
                else if (events[i].Event == 14 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(11); p++;
                    dta.Rows[index][11] = p;
                }
                else if (events[i].Event == 15 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(12); p++;
                    dta.Rows[index][12] = p;
                }
                else if (events[i].Event == 16 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(13); p++;
                    dta.Rows[index][13] = p;
                }
                else if (events[i].Event == 17 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(14); p++;
                    dta.Rows[index][14] = p;
                }
                else if (events[i].Event == 18 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(15); p++;
                    dta.Rows[index][15] = p;
                }
                else if (events[i].Event == 19 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(16); p++;
                    dta.Rows[index][16] = p;
                }
                else if (events[i].Event == 20 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(17); p++;
                    dta.Rows[index][17] = p;
                }
                else if (events[i].Event == 21 && events[i].TeamId == AwayTeamId)
                {
                    int index = dta.Rows.IndexOf(dta.Rows.Find(plId));
                    int p = dta.Rows[index].Field<int>(18); p++;
                    dta.Rows[index][18] = p;
                }
                else if (events[i].Event == 7 && events[i].TeamId == AwayTeamId)
                {
                    int p = dteama.Rows[0].Field<int>(2); p++;
                    dteama.Rows[0][2] = p;
                }
                else if (events[i].Event == 8 && events[i].TeamId == AwayTeamId)
                {
                    int p = dteama.Rows[0].Field<int>(4); p++;
                    dteama.Rows[0][3] = p;
                }
                else if (events[i].Event == 9 && events[i].TeamId == AwayTeamId)
                {
                    int p = dteama.Rows[0].Field<int>(4); p++;
                    dteama.Rows[0][4] = p;
                }

                    else if (events[i].Event == 22 && events[i].TeamId == AwayTeamId)
                {      
                    int Tsec = Convert.ToInt16(events[i].Time.Substring(0,2))*60 + Convert.ToInt16(events[i].Time.Substring(3,2));
                    if (events[i].PeriodCode == 1)
                    {
                        cla1.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                        
                    }
                    else if (events[i].PeriodCode == 2)
                    {
                        cla2.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 3)
                    {
                        cla3.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 4)
                    {
                        cla4.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 5)
                    {
                        cla5.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 6)
                    {
                        cla6.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 7)
                    {
                        cla7.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 8)
                    {
                        cla8.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 9)
                    {
                        cla9.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 10)
                    {
                        cla10.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 11)
                    {
                        cla11.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 12)
                    {
                        cla12.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 13)
                    {
                        cla13.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }
                    else if (events[i].PeriodCode == 14)
                    {
                        cla14.Add(new Changes()
                        {
                            Ts = Tsec,
                            ChangebT = events[i].Change
                        });
                    }

                }

                else { }            
            }

            //away team minutes played calculation
            List<Clists> AllCListsA = new List<Clists>()
            { 
                new Clists{ Changes=cla1}, new Clists{ Changes=cla2}, new Clists{ Changes=cla3}, new Clists{ Changes=cla4}, new Clists{ Changes=cla5}, new Clists{ Changes=cla6}, new Clists{ Changes=cla7}, new Clists{ Changes=cla8}, new Clists{ Changes=cla9}, new Clists{ Changes=cla10}, new Clists{ Changes=cla11}, new Clists{ Changes=cla12}, new Clists{ Changes=cla13}, new Clists{ Changes=cla14}
             };

            //int PCount = SetPerCode(Periodlabel.Text);
            NTsec = mins * 60 + secs;
            if (NTsec == 600 || NTsec == 300 && periodcount > 4)
            {
                PCount = SetPerCode(Periodlabel.Text) - 1; NTsec = 0;

                for (int i = 0; i < PCount; i++) 
                {
                    for (int f = 0; f < 5; f++)
                    {
                        int playAId = AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].ChangebT[f];
                        int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                        int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].Ts - NTsec;
                        dta.Rows[indA][19] = MpA;
                    }
                    for (int j = AllCListsA[i].Changes.Count - 2; j > -1; j--)
                    {
                        for (int f = 0; f < 5; f++)
                        {

                            int playAId = AllCListsA[i].Changes[j].ChangebT[f];
                            int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                            int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[j].Ts - AllCListsA[i].Changes[j + 1].Ts;
                            dta.Rows[indA][19] = MpA;
                        }
                    }
                }
            }
            else if (NTsec == 0)
            {
                PCount = SetPerCode(Periodlabel.Text);
                for (int i = 0; i < PCount; i++)           
                {
                    for (int f = 0; f < 5; f++)
                    {
                        int playAId = AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].ChangebT[f];
                        int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                        int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].Ts - NTsec;
                        dta.Rows[indA][19] = MpA;                                     
                    }
                    for (int j = AllCListsA[i].Changes.Count - 2; j > -1; j--)
                    {
                        for (int f = 0; f < 5; f++)
                        {
                            int playAId = AllCListsA[i].Changes[j].ChangebT[f];
                            int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                            int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[j].Ts - AllCListsA[i].Changes[j + 1].Ts;
                            dta.Rows[indA][19] = MpA;                                               
                        }
                    }      
                }
            }
            else
            {
                PCount = SetPerCode(Periodlabel.Text);

                for (int f = 0; f < 5; f++)
                {
                    int playAId = AllCListsA[PCount - 1].Changes[AllCListsA[PCount - 1].Changes.Count - 1].ChangebT[f];
                    int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                    int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[PCount - 1].Changes[AllCListsA[PCount - 1].Changes.Count - 1].Ts - NTsec;
                    dta.Rows[indA][19] = MpA;
                }
                for (int j = AllCListsA[PCount - 1].Changes.Count - 2; j > -1; j--)
                {
                    for (int f = 0; f < 5; f++)
                    {
                        int playAId = AllCListsA[PCount - 1].Changes[j].ChangebT[f];
                        int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                        int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[PCount - 1].Changes[j].Ts - AllCListsA[PCount - 1].Changes[j + 1].Ts;
                        dta.Rows[indA][19] = MpA;
                    }
                }
                for (int i = 0; i < PCount - 1; i++)
                {
                    NTsec = 0;
                    for (int f = 0; f < 5; f++)
                    {
                        int playAId = AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].ChangebT[f];
                        int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                        int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].Ts - NTsec;
                        dta.Rows[indA][19] = MpA;
                    }
                    for (int j = AllCListsA[i].Changes.Count - 2; j > -1; j--)
                    {
                        for (int f = 0; f < 5; f++)
                        {
                            int playAId = AllCListsA[i].Changes[j].ChangebT[f];
                            int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
                            int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[j].Ts - AllCListsA[i].Changes[j + 1].Ts;
                            dta.Rows[indA][19] = MpA;
                        }
                    }
                }
            }           
            
            //old
            //for (int i = 0; i < PCount; i++)  
            //{
                
            //    for (int f = 0; f < 5; f++)
            //    {
            //        int playAId = AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].ChangebT[f];
            //        int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
            //        int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[AllCListsA[i].Changes.Count - 1].Ts - NTsec;
            //        dta.Rows[indA][19] = MpA;
                                        
            //    }
            //    for (int j = AllCListsA[i].Changes.Count - 2; j > -1; j--)
            //    {
            //        for (int f = 0; f < 5; f++)
            //        {

            //            int playAId = AllCListsA[i].Changes[j].ChangebT[f];
            //            int indA = dta.Rows.IndexOf(dta.Rows.Find(playAId));
            //            int MpA = dta.Rows[indA].Field<int>(19); MpA = MpA + AllCListsA[i].Changes[j].Ts - AllCListsA[i].Changes[j + 1].Ts;
            //            dta.Rows[indA][19] = MpA;                                              
            //        }
            //    }
            //}
            
            //away XY coordinares Row text add
            dxya.Rows.Add(XYtextAway);


            DataSet dsa = new DataSet();
            dsa.DataSetName = "AwayStats";
            dsa.Tables.Add(dta);
            dsa.Tables.Add(dteama);
            dsa.Tables.Add(dxya);
            dsa.WriteXml(GameId.ToString() + "AwayXMLStats.xml");
            labelUpdateXML.BackColor = Color.Green;
            labelUpdateXML.ForeColor = Color.White;
            
            //PrintPreview printpreview = new PrintPreview();
            //printpreview.Getdtp = dt; printpreview.ShowDialog();   
            //string grandParent = new DirectoryInfo(HttpContext.Current.Server.MapPath("~/")).Parent.Parent.FullName;


            StringWriter sw = new StringWriter();
            ds.WriteXml(sw);
            string HomeStringXml = sw.ToString();
            StringWriter swa = new StringWriter();
            dsa.WriteXml(swa);
            string AwayStringXml = swa.ToString();

            labelUpdateXML.Text = basketballWcf.UpdateXmlStats(GameId, HomeStringXml, AwayStringXml);
            if (labelUpdateXML.Text.Contains("Last Update : "))
            { }
            else
            {
                labelUpdateXML.BackColor = Color.Red;
                labelUpdateXML.ForeColor = Color.White;
            }       


            //try
            //{
            //    File.Copy(GameId.ToString() + "HomeXMLStats.xml", @"C:\Users\iratus\Documents\Visual Studio 2012\Projects\basketball\basket wesite\livegames\" + GameId.ToString() + "HomeXMLStats.xml", true);
            //    File.Copy(GameId.ToString() + "AwayXMLStats.xml", @"C:\Users\iratus\Documents\Visual Studio 2012\Projects\basketball\basket wesite\livegames\" + GameId.ToString() + "AwayXMLStats.xml", true);
            //}
            //catch (Exception ex)
            //{
            //    labelUpdateXML.BackColor = Color.Red;
            //    labelUpdateXML.ForeColor = Color.White;
            //    labelUpdateXML.Text = ex.ToString();
            //}
        }
        private void PrintPreview_Click(object sender, EventArgs e)
        {    
            PrintPreview printpreview = new PrintPreview();
            printpreview.GetGid = GameId;
            if (button3.Enabled) {UpdateStatsXML(); }
            else
            {
                
            }
            this.Opacity = 0.7;
            printpreview.ShowDialog(); 
        }
        private void button3_Click(object sender, EventArgs e)
        {
            int Ntsec = mins * 60 + secs;
            if (Ntsec == 0 && periodcount > 3 && Convert.ToInt16(labelHScore.Text) != Convert.ToInt16(labelAScore.Text))
            {
                timerUpdateStats.Stop();
                labelFS.Visible = true;
                UpdateStatsXML();
                panel18.Enabled = false;
                EventPanel.Enabled = false;
                panel1.Enabled = false;
                button6.Enabled = false;
                button8.Enabled = false;
                DeleteEvent.Enabled = false;

                SendToDb.Visible = true;

                button3.Enabled = false;
            }
            else { MessageBox.Show("Δε Μπορεί να Λήξει το Παιχνίδι Ακόμη"); }
            
            //timer1.Stop();
            //button1.Enabled = false;
            //button2.Enabled = false;
            //button4.Enabled = false;
            //button5.Enabled = false;
            //labelMin.Text = "00";
            //labelSec.Text = "00";
            //int poll;
            //poll =  getPlayerId();
        }

        private void listBoxEvents_DataSourceChanged(object sender, EventArgs e)
        {
            int Hs=0;int As=0;
            for (int i = 0; i < events.Count; i++)
            {                
                if (events[i].Event == 3 && events[i].TeamId == HomeTeamId)
                {
                    Hs += 2;
                }
                else if (events[i].Event == 5 && events[i].TeamId == HomeTeamId)
                {
                    Hs += 3;
                }
                else if (events[i].Event == 18 && events[i].TeamId == HomeTeamId)
                {
                    Hs++;
                }
                else if (events[i].Event == 3 && events[i].TeamId == AwayTeamId)
                {
                    As+=2;
                }
                else if (events[i].Event == 5 && events[i].TeamId == AwayTeamId)
                {
                    As += 3;
                }
                else if (events[i].Event == 18 && events[i].TeamId == AwayTeamId)
                {
                    As++;
                }
                else { }

                if (events[events.Count - 1].Event == 1 || events[events.Count - 1].Event == 6)
                {
                    panel18.Enabled = false;
                    EventPanel.Enabled = false;
                    panel1.Enabled = false;
                    panel26.Enabled = false;
                    panel27.Enabled = false;
                    button6.Enabled =true;
                    button8.Enabled = true;
                }
                else if (events[events.Count - 2].Event == 1 || events[events.Count - 2].Event == 6)
                {
                    if (events[events.Count - 1].TeamId == HomeTeamId)
                    {
                        button6.Enabled = false;
                    }
                    else if (events[events.Count - 1].TeamId == AwayTeamId)
                    {
                        button8.Enabled = false;
                    }
                }                
                else
                {
                    panel18.Enabled = true;
                    EventPanel.Enabled = true;
                    panel1.Enabled = true;
                    panel26.Enabled = true;
                    panel27.Enabled = true;
                    button6.Enabled = true;
                    button8.Enabled = true;
                }
            }
            labelHScore.Text = Hs.ToString();
            labelAScore.Text = As.ToString();
        }
        private void timerUpdateStats_Tick(object sender, EventArgs e)
        {
            UpdateStatsXML();           
        }

        private void SendToDb_Click(object sender, EventArgs e)
        {
            XDocument xmlDoc = XDocument.Load(GameId.ToString() + "HomeXMLStats.xml");
            XDocument xmlDocA = XDocument.Load(GameId.ToString() + "AwayXMLStats.xml");
            string xmlH = xmlDoc.ToString(); string xmlA = xmlDocA.ToString();

            labelUpdateXML.Text = basketballWcf.SendXmltoDatabase(xmlH, xmlA);
            if (labelUpdateXML.Text == "Database successfully updated")
            { SendToDb.Enabled = false; }
            else
            {
                labelUpdateXML.BackColor = Color.Red;
                labelUpdateXML.ForeColor = Color.White;
                SendToDb.Enabled = true;
            }       

        }
        static void connection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            MessageBox.Show("InfoMessage Handled Error Level-" + e.Errors[0].Class.ToString() + ":" + e.Message);
            MessageBox.Show(e.Message, Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Information);
            // e contains info message etc
        }

        private void Game_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Είστε σίγουρος οτι θέλετε να βγείτε απο την εφαρμογή?", "ΈΞΟΔΟΣ", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                e.Cancel = true;
            }   
        }
        //private void listBoxHome_DrawItem(object sender, DrawItemEventArgs e)
        //{
        //    if (e.Index < 0) return;
        //    //if the item state is selected them change the back color 
        //    if ((e.State & DrawItemState.Selected) == DrawItemState.Selected)
        //        e = new DrawItemEventArgs(e.Graphics,
        //                                  e.Font,
        //                                  e.Bounds,
        //                                  e.Index,
        //                                  e.State ^ DrawItemState.Selected,
        //                                  e.ForeColor,
        //                                  Color.LightGray);//Choose the color

        //    // Draw the background of the ListBox control for each item.
        //    e.DrawBackground();
        //    // Draw the current item text
        //    e.Graphics.DrawString(listBoxHome.Items[e.Index].ToString(), e.Font, Brushes.Black, e.Bounds, StringFormat.GenericDefault);
        //    // If the ListBox has focus, draw a focus rectangle around the selected item.
        //    e.DrawFocusRectangle();
        //}
    }
}
