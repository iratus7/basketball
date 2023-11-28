using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace BasketballApp
{
    public partial class PrintPreview : Form
    {
        //private DataTable dtp;
        //public DataTable Getdtp
        //{
        //    get { return dtp; }
        //    set { dtp = value; }
        //}
        private int GId;
        public int GetGid
        {
            get { return GId; }
            set { GId = value; }
        }
        public PrintPreview()
        {
            InitializeComponent();
            labelInfo.Text = "MP: Minutes Played, P: Points, FT: Free Throws, 2P: Two Points, 3P: Three Points \rDR Defensive Rebounds, OR: Offensive Rebounds, F: Fouls Made, FO: Fouls ON \rTO: Turnovers, ST: Steals, BL: BLOCKS MADE, BA: BLOCKS SUFFERED \rUF: UNSPORTSMAN FOUL, AS:ASSIST, IND:INDEX RATING";
        }
        //private void Doc_PrintPage(object sender, PrintPageEventArgs e)
        //{
        //    float x = e.MarginBounds.Left;
        //    float y = e.MarginBounds.Top;
        //    Bitmap bmp = new Bitmap(this.panelPrint.Width, this.panelPrint.Height);
        //    this.panelPrint.DrawToBitmap(bmp, new Rectangle(0, 0, this.panelPrint.Width, this.panelPrint.Height));
        //    e.Graphics.DrawImage((Image)bmp, x, y);
        //}
        private void ReadXmlToPrint()    
        {            
            XDocument xmlDoc = XDocument.Load(GId.ToString() + "HomeXMLStats.xml");
           
            var StatsTeam = from Team in xmlDoc.Descendants("HomeTeam")
                            select new
                            {
                                TName = Team.Element("HomeTeamName").Value,
                                FB = Team.Element("FastbreaksMade").Value + "/" + Convert.ToString(Convert.ToInt16(Team.Element("FastbreaksMade").Value) + Convert.ToInt16(Team.Element("FastbreaksMissed").Value)),
                                TIMEOUT = Team.Element("TimeOut").Value
                            };
            foreach (var Team in StatsTeam)
            {
                labelHT.Text = Team.TName;
                labelHFB.Text = Team.FB;
                labelHTO.Text = Team.TIMEOUT;
                labelQH.Text = Team.TName;
            }

            var StatsEvents = from Player in xmlDoc.Descendants("Player")
                              select new
                              {
                                  No = Player.Element("PlayerNo").Value,
                                  Name = Player.Element("PlayerName").Value,
                                  MP = Player.Element("MinutesPlayed").Value,
                                  P = Convert.ToInt16(Player.Element("FTMade").Value) + 2 * Convert.ToInt16(Player.Element("TwoPMade").Value) + 3 * Convert.ToInt16(Player.Element("ThreePMade").Value),
                                  FT = Player.Element("FTMade").Value + "/" + Convert.ToString(Convert.ToInt16(Player.Element("FTMade").Value) + Convert.ToInt16(Player.Element("FTMissed").Value)),
                                  TwoP = Player.Element("TwoPMade").Value + "/" + Convert.ToString(Convert.ToInt16(Player.Element("TwoPMade").Value) + Convert.ToInt16(Player.Element("TwoPMissed").Value)),
                                  ThreeP = Player.Element("ThreePMade").Value + "/" + Convert.ToString(Convert.ToInt16(Player.Element("ThreePMade").Value) + Convert.ToInt16(Player.Element("ThreePMissed").Value)),
                                  DR = Player.Element("DefRebound").Value,
                                  OR = Player.Element("OffRebound").Value,
                                  AS = Player.Element("Assist").Value,
                                  TO = Player.Element("Turnover").Value,
                                  ST = Player.Element("Steal").Value,
                                  BL = Player.Element("Block").Value,
                                  BA = Player.Element("BlockAgainst").Value,
                                  F = Player.Element("Foul").Value,
                                  FO = Player.Element("FoulOn").Value,
                                  UF = Player.Element("UnsportsmanFoul").Value,

                                  INR = (Convert.ToInt16(Player.Element("FTMade").Value) + 2 * Convert.ToInt16(Player.Element("TwoPMade").Value) + 3 * Convert.ToInt16(Player.Element("ThreePMade").Value)) + (Convert.ToInt16(Player.Element("DefRebound").Value) + Convert.ToInt16(Player.Element("OffRebound").Value)) + Convert.ToInt16(Player.Element("Assist").Value) + Convert.ToInt16(Player.Element("Steal").Value) + Convert.ToInt16(Player.Element("Block").Value) + Convert.ToInt16(Player.Element("FoulOn").Value) - ((Convert.ToInt16(Player.Element("FTMissed").Value) + 2 * Convert.ToInt16(Player.Element("TwoPMissed").Value) + 3 * Convert.ToInt16(Player.Element("ThreePMissed").Value)) + Convert.ToInt16(Player.Element("Turnover").Value) + Convert.ToInt16(Player.Element("Foul").Value)),

                                  FTM = Player.Element("FTMade").Value,
                                  FTMI = Player.Element("FTMissed").Value,
                                  TM = Player.Element("TwoPMade").Value,
                                  TMI = Player.Element("TwoPMissed").Value,
                                  THM = Player.Element("ThreePMade").Value,
                                  THMI = Player.Element("ThreePMissed").Value

                              };

            DataTable dtp = new DataTable();
            dtp.Columns.Add(new DataColumn("No", typeof(string)));
            dtp.Columns.Add(new DataColumn("Name", typeof(string)));
            dtp.Columns.Add(new DataColumn("MP", typeof(string)));
            dtp.Columns.Add(new DataColumn("P", typeof(int)));
            dtp.Columns.Add(new DataColumn("FT", typeof(string)));
            dtp.Columns.Add(new DataColumn("2P", typeof(string)));
            dtp.Columns.Add(new DataColumn("3P", typeof(string)));
            dtp.Columns.Add(new DataColumn("DR", typeof(int)));
            dtp.Columns.Add(new DataColumn("OR", typeof(int)));
            dtp.Columns.Add(new DataColumn("AS", typeof(int)));
            dtp.Columns.Add(new DataColumn("TO", typeof(int)));
            dtp.Columns.Add(new DataColumn("ST", typeof(int)));
            dtp.Columns.Add(new DataColumn("BL", typeof(int)));
            dtp.Columns.Add(new DataColumn("BA", typeof(int)));
            dtp.Columns.Add(new DataColumn("F", typeof(int)));
            dtp.Columns.Add(new DataColumn("FO", typeof(int)));
            dtp.Columns.Add(new DataColumn("UF", typeof(int)));
            dtp.Columns.Add(new DataColumn("IND", typeof(int)));
            int FTAM = 0; int FTAMI = 0; int TM = 0; int TMI = 0; int THM = 0; int THMI = 0;
            foreach (var Player in StatsEvents)
            {
                dtp.Rows.Add(Player.No, Player.Name, Player.MP, Player.P, Player.FT, Player.TwoP, Player.ThreeP, Player.DR, Player.OR, Player.AS, Player.TO, Player.ST, Player.BL, Player.BA, Player.F, Player.FO, Player.UF, Player.INR);
                FTAM += Convert.ToInt32(Player.FTM); FTAMI += Convert.ToInt32(Player.FTMI);
                TM += Convert.ToInt32(Player.TM); TMI += Convert.ToInt32(Player.TMI);
                THM += Convert.ToInt32(Player.THM); THMI += Convert.ToInt32(Player.THMI);
            }

            int AM = 0; int AP = 0; int ADR = 0; int AOR = 0; int AS = 0; int AT = 0; ; int AST = 0; int AB = 0; int ABA = 0; int AF = 0; int AFO = 0; int AUF = 0; int IND = 0;
            for (int i = 0; i < dtp.Rows.Count; i++)
            {
                AM += Convert.ToInt32(dtp.Rows[i][2]);
                AP += Convert.ToInt32(dtp.Rows[i][3]);
                ADR += Convert.ToInt32(dtp.Rows[i][7]);
                AOR += Convert.ToInt32(dtp.Rows[i][8]);
                AS += Convert.ToInt32(dtp.Rows[i][9]);
                AT += Convert.ToInt32(dtp.Rows[i][10]);
                AST += Convert.ToInt32(dtp.Rows[i][11]);
                AB += Convert.ToInt32(dtp.Rows[i][12]);
                ABA += Convert.ToInt32(dtp.Rows[i][13]);
                AF += Convert.ToInt32(dtp.Rows[i][14]);
                AFO += Convert.ToInt32(dtp.Rows[i][15]);
                AUF += Convert.ToInt32(dtp.Rows[i][16]);
                IND += Convert.ToInt32(dtp.Rows[i][17]);
            }
            dtp.Rows.Add("#", "TOTAL", ((AM / 60) + ":" + (AM % 60)).ToString(), AP, FTAM + "/" + (FTAM + FTAMI), TM + "/" + (TM + TMI), THM + "/" + (THM + THMI), ADR, AOR, AS, AT, AST, AB, ABA, AF, AFO, AUF, IND);

            //foreach (DataRow Mrow in dtp.Columns)
            //{
            //    TimeSpan minss = TimeSpan.FromSeconds(Convert.ToInt16(Mrow[2].ToString()));
            //    Mrow[2] = minss.ToString();
            //} 
            for(int i = 0; i < dtp.Rows.Count-1; i++)
            {
                TimeSpan minss = TimeSpan.FromSeconds(Convert.ToInt16(dtp.Rows[i][2].ToString()));
                dtp.Rows[i][2] = minss.ToString(@"mm\:ss");
            }
            dataGridViewHome.DataSource = dtp;

            
            
            //DefaultCellStyle.Font = new System.Drawing.Font("Arial", 24, FontStyle.Bold);

            //for(int i=0;i<dataGridViewHome.Columns.Count;i++)
            //{            
            //    dataGridViewHome.Columns[i].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            //}

            //Away
            XDocument xmlDocA = XDocument.Load(GId.ToString() + "AwayXMLStats.xml");

            var StatsTeamA = from TeamA in xmlDocA.Descendants("AwayTeam")
                             select new
                             {
                                 TName = TeamA.Element("AwayTeamName").Value,
                                 FB = TeamA.Element("FastbreaksMade").Value + "/" + Convert.ToString(Convert.ToInt16(TeamA.Element("FastbreaksMade").Value) + Convert.ToInt16(TeamA.Element("FastbreaksMissed").Value)),
                                 TIMEOUT = TeamA.Element("TimeOut").Value
                             };
            foreach (var TeamA in StatsTeamA)
            {
                labelAT.Text = TeamA.TName;
                labelAFB.Text = TeamA.FB;
                labelATO.Text = TeamA.TIMEOUT;
                labelQA.Text = TeamA.TName;
            }

            var StatsEventsA = from PlayerA in xmlDocA.Descendants("Player")
                               select new
                               {
                                   No = PlayerA.Element("PlayerNo").Value,
                                   Name = PlayerA.Element("PlayerName").Value,
                                   MP = PlayerA.Element("MinutesPlayed").Value,
                                   P = Convert.ToInt16(PlayerA.Element("FTMade").Value) + 2 * Convert.ToInt16(PlayerA.Element("TwoPMade").Value) + 3 * Convert.ToInt16(PlayerA.Element("ThreePMade").Value),
                                   FT = PlayerA.Element("FTMade").Value + "/" + Convert.ToString(Convert.ToInt16(PlayerA.Element("FTMade").Value) + Convert.ToInt16(PlayerA.Element("FTMissed").Value)),
                                   TwoP = PlayerA.Element("TwoPMade").Value + "/" + Convert.ToString(Convert.ToInt16(PlayerA.Element("TwoPMade").Value) + Convert.ToInt16(PlayerA.Element("TwoPMissed").Value)),
                                   ThreeP = PlayerA.Element("ThreePMade").Value + "/" + Convert.ToString(Convert.ToInt16(PlayerA.Element("ThreePMade").Value) + Convert.ToInt16(PlayerA.Element("ThreePMissed").Value)),
                                   DR = PlayerA.Element("DefRebound").Value,
                                   OR = PlayerA.Element("OffRebound").Value,
                                   AS = PlayerA.Element("Assist").Value,
                                   TO = PlayerA.Element("Turnover").Value,
                                   ST = PlayerA.Element("Steal").Value,
                                   BL = PlayerA.Element("Block").Value,
                                   BA = PlayerA.Element("BlockAgainst").Value,
                                   F = PlayerA.Element("Foul").Value,
                                   FO = PlayerA.Element("FoulOn").Value,
                                   UF = PlayerA.Element("UnsportsmanFoul").Value,

                                   INR = (Convert.ToInt16(PlayerA.Element("FTMade").Value) + 2 * Convert.ToInt16(PlayerA.Element("TwoPMade").Value) + 3 * Convert.ToInt16(PlayerA.Element("ThreePMade").Value)) + (Convert.ToInt16(PlayerA.Element("DefRebound").Value) + Convert.ToInt16(PlayerA.Element("OffRebound").Value)) + Convert.ToInt16(PlayerA.Element("Assist").Value) + Convert.ToInt16(PlayerA.Element("Steal").Value) + Convert.ToInt16(PlayerA.Element("Block").Value) + Convert.ToInt16(PlayerA.Element("FoulOn").Value) - ((Convert.ToInt16(PlayerA.Element("FTMissed").Value) + 2 * Convert.ToInt16(PlayerA.Element("TwoPMissed").Value) + 3 * Convert.ToInt16(PlayerA.Element("ThreePMissed").Value)) + Convert.ToInt16(PlayerA.Element("Turnover").Value) + Convert.ToInt16(PlayerA.Element("Foul").Value)),

                                   FTM = PlayerA.Element("FTMade").Value,
                                   FTMI = PlayerA.Element("FTMissed").Value,
                                   TM = PlayerA.Element("TwoPMade").Value,
                                   TMI = PlayerA.Element("TwoPMissed").Value,
                                   THM = PlayerA.Element("ThreePMade").Value,
                                   THMI = PlayerA.Element("ThreePMissed").Value
                               };

            DataTable dtpa = new DataTable();
            dtpa.Columns.Add(new DataColumn("No", typeof(string)));
            dtpa.Columns.Add(new DataColumn("Name", typeof(string)));
            dtpa.Columns.Add(new DataColumn("MP", typeof(string)));
            dtpa.Columns.Add(new DataColumn("P", typeof(int)));
            dtpa.Columns.Add(new DataColumn("FT", typeof(string)));
            dtpa.Columns.Add(new DataColumn("2P", typeof(string)));
            dtpa.Columns.Add(new DataColumn("3P", typeof(string)));
            dtpa.Columns.Add(new DataColumn("DR", typeof(int)));
            dtpa.Columns.Add(new DataColumn("OR", typeof(int)));
            dtpa.Columns.Add(new DataColumn("AS", typeof(int)));
            dtpa.Columns.Add(new DataColumn("TO", typeof(int)));
            dtpa.Columns.Add(new DataColumn("ST", typeof(int)));
            dtpa.Columns.Add(new DataColumn("BL", typeof(int)));
            dtpa.Columns.Add(new DataColumn("BA", typeof(int)));
            dtpa.Columns.Add(new DataColumn("F", typeof(int)));
            dtpa.Columns.Add(new DataColumn("FO", typeof(int)));
            dtpa.Columns.Add(new DataColumn("UF", typeof(int)));
            dtpa.Columns.Add(new DataColumn("IND", typeof(int)));
            int FTAMA = 0; int FTAMIA = 0; int TMA = 0; int TMIA = 0; int THMA = 0; int THMIA = 0;

            foreach (var PlayerA in StatsEventsA)
            {
                dtpa.Rows.Add(PlayerA.No, PlayerA.Name, PlayerA.MP, PlayerA.P, PlayerA.FT, PlayerA.TwoP, PlayerA.ThreeP, PlayerA.DR, PlayerA.OR, PlayerA.AS, PlayerA.TO, PlayerA.ST, PlayerA.BL, PlayerA.BA, PlayerA.F, PlayerA.FO, PlayerA.UF, PlayerA.INR);

                FTAMA += Convert.ToInt32(PlayerA.FTM); FTAMIA += Convert.ToInt32(PlayerA.FTMI);
                TMA += Convert.ToInt32(PlayerA.TM); TMIA += Convert.ToInt32(PlayerA.TMI);
                THMA += Convert.ToInt32(PlayerA.THM); THMIA += Convert.ToInt32(PlayerA.THMI);
            }

            int AMA = 0; int APA = 0; int ADRA = 0; int AORA = 0; int ASA = 0; int ATA = 0; ; int ASTA = 0; int ABAW = 0; int ABAA = 0; int AFA = 0; int AFOA = 0; int AUFA = 0; int INDA = 0;
            for (int i = 0; i < dtpa.Rows.Count; i++)
            {
                AMA += Convert.ToInt32(dtpa.Rows[i][2]);
                APA += Convert.ToInt32(dtpa.Rows[i][3]);
                ADRA += Convert.ToInt32(dtpa.Rows[i][7]);
                AORA += Convert.ToInt32(dtpa.Rows[i][8]);
                ASA += Convert.ToInt32(dtpa.Rows[i][9]);
                ATA += Convert.ToInt32(dtpa.Rows[i][10]);
                ASTA += Convert.ToInt32(dtpa.Rows[i][11]);
                ABAW += Convert.ToInt32(dtpa.Rows[i][12]);
                ABAA += Convert.ToInt32(dtpa.Rows[i][13]);
                AFA += Convert.ToInt32(dtpa.Rows[i][14]);
                AFOA += Convert.ToInt32(dtpa.Rows[i][15]);
                AUFA += Convert.ToInt32(dtpa.Rows[i][16]);
                INDA += Convert.ToInt32(dtpa.Rows[i][17]);
            }
            dtpa.Rows.Add("#", "TOTAL", ((AMA / 60) + ":" + (AMA % 60)).ToString(), APA, FTAMA + "/" + (FTAMA + FTAMIA), TMA + "/" + (TMA + TMIA), THMA + "/" + (THMA + THMIA), ADRA, AORA, ASA, ATA, ASTA, ABAW, ABAA, AFA, AFOA, AUFA, INDA);
            for (int i = 0; i < dtpa.Rows.Count-1; i++)
            {
                TimeSpan mnss = TimeSpan.FromSeconds(Convert.ToInt16(dtpa.Rows[i][2].ToString()));
                dtpa.Rows[i][2] = mnss.ToString(@"mm\:ss");
            }
            //dtpa.Rows[dtpa.Rows.Count - 1][2] = ((AMA / 60) + ":" + (AMA % 60)).ToString();
            dataGridViewAway.DataSource = dtpa;

            //quarter scores
            int cQ = xmlDoc.Descendants("HomeTeam").Elements().Count();
            DataTable dts = new DataTable();
            //int kkki = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(5).Value.ToString());            
            List<string> Qlist = new List<string>();
            string[] Qs = new string[] { "1st Q", "2nd Q", "3rd Q", "4th Q", "1st O", "2nd O", "3rd O", "4th OI", "5th O", "6th O", "7th O", "8th O", "9th O", "10th O" };
            Qlist.AddRange(Qs); 
            for (int i = 5; i < cQ; i++)
            {
                dts.Columns.Add(Qlist[i - 5].ToString().Replace(" ", string.Empty), typeof(int));                
            }
            //List<int> zerolist = Enumerable.Repeat(0, cQ -5).ToList();            
            //dts.Rows.InsertAt(zerolist,0);
            //object[] zerolist = new object[cQ - 5];
            //for (int i = 0; i < cQ - 5; i++) { zerolist[i] = 0; }
            //DataRow row = dts.NewRow();
            //row.ItemArray = zerolist;
            //dts.Rows.InsertAt(row,0);
            dts.Rows.Add(0);
            dts.Rows.Add(0);
            //dts.Rows.InsertAt(row, 1); 
            for (int i = 5; i < cQ; i++)
            {     
                dts.Rows[0][i - 5] = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(i).Value.ToString());
                dts.Rows[1][i - 5] = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(i).Value.ToString());
            }
            dataGridViewQScore.DataSource = dts;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            //dataGridViewHome.ClearSelection();
            //dataGridViewAway.ClearSelection();
            button1.Visible = false;
            Thread.Sleep(500);
            using (Bitmap b = new Bitmap(987, 785))
            {
                using (Graphics g = Graphics.FromImage(b))
                {
                    //this.DrawToBitmap(b, new System.Drawing.Rectangle(0, 0, this.panelP.Width, this.panelP.Height));
                    g.CopyFromScreen(this.Location.X + 28, this.Location.Y + 30, 0, 0, panelP.Size);
                }
                Document doc = new Document(PageSize.A4);
                iTextSharp.text.Image i = iTextSharp.text.Image.GetInstance(b, System.Drawing.Imaging.ImageFormat.Bmp);
                PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream("output.pdf", FileMode.Create));
                doc.SetPageSize(new iTextSharp.text.Rectangle(this.Size.Width + doc.LeftMargin + doc.RightMargin, this.Size.Height + doc.TopMargin + doc.BottomMargin));

                doc.Open();

                doc.Add(i);
                doc.Close();
            }
            System.Diagnostics.Process.Start("output.pdf");

            button1.Visible = true;
            //using (Bitmap b = new Bitmap(this.Width, this.Height))
            //{
            //    using (Graphics g = Graphics.FromImage(b))
            //    {
            //        g.CopyFromScreen(this.Location, new Point(0, 0), this.Size);
            //    }



            //PrintDocument doc = new PrintDocument();
            //doc.PrintPage += this.Doc_PrintPage;
            //PrintDialog dlgSettings = new PrintDialog();
            //dlgSettings.Document = doc;
            //if (dlgSettings.ShowDialog() == DialogResult.OK)
            //{
            //    doc.Print();
            //}






            //if (dtp==null) { }
            //else
            //{
            //    //This is the absolute path to the PDF that we will create
            //    string outputFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "Sample.pdf");

            //    //Create a standard .Net FileStream for the file, setting various flags
            //    using (FileStream fs = new FileStream(outputFile, FileMode.Create, FileAccess.Write, FileShare.None))
            //    {
            //        //Create a new PDF document setting the size to A4
            //        using (Document doc = new Document(PageSize.A4))
            //        {
            //            //Bind the PDF document to the FileStream using an iTextSharp PdfWriter
            //            using (PdfWriter w = PdfWriter.GetInstance(doc, fs))
            //            {
            //                //Open the document for writing
            //                doc.Open();

            //                //Create a table with two columns
            //                PdfPTable t = new PdfPTable(20);

            //                //Borders are drawn by the individual cells, not the table itself.
            //                //Tell the default cell that we do not want a border drawn
            //                t.DefaultCell.Border = 1;
            //                int[] intTblWidth = { 3,15, 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,30 };
            //                t.SetWidths(intTblWidth);

            //                //Add four cells. Cells are added starting at the top left of the table working left to right first, then down
            //                for (int i = 0; i < dtp.Rows.Count; i++)
            //                {
            //                    for (int j = 0; j < dtp.Columns.Count; j++)
            //                    {
            //                        t.AddCell(dtp.Rows[i][j].ToString());
            //                    }
            //                }
            //                //Add the table to our document
            //                doc.Add(t);

            //                //Close our document
            //                doc.Close();
            //            }
            //        }
            //    }


            //}
        }

        private void PrintPreview_Shown(object sender, EventArgs e)
        {
           
            dataGridViewHome.ClearSelection();
            dataGridViewAway.ClearSelection();
            
            System.Windows.Forms.DataGridViewCellStyle boldStyle = new System.Windows.Forms.DataGridViewCellStyle();
            boldStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.25F, System.Drawing.FontStyle.Bold);
            boldStyle.BackColor = Color.Bisque;
            dataGridViewHome.Rows[dataGridViewHome.Rows.Count - 1].DefaultCellStyle = boldStyle;
            dataGridViewAway.Rows[dataGridViewAway.Rows.Count - 1].DefaultCellStyle = boldStyle;
            //dataGridViewHome.Rows[dataGridViewHome.Rows.Count - 1].Height = 35;
            //dataGridViewHome.Rows[dataGridViewHome.Rows.Count - 1].MinimumHeight = 20;
        }

        private void PrintPreview_Load(object sender, EventArgs e)
        {
            ReadXmlToPrint();
            if (dataGridViewQScore.Columns.Count == 0) { //dataGridViewQScore.Visible = false;
                labelQH.Visible = false; labelQA.Visible = false; }
            else { dataGridViewQScore.ClearSelection(); }
            foreach (DataGridViewColumn column in dataGridViewQScore.Columns)
            {
                column.SortMode = DataGridViewColumnSortMode.NotSortable;
            }
        }
    }
}
