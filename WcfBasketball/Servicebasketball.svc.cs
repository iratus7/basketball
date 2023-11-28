using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Web.Configuration;
using System.Web.Security;
using System.Xml.Linq;
namespace WcfBasketball
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Servicebasketball : IServicebasketball
    {
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }   
        public bool Validate(string username, string password)
        {
            //var provider = Membership.Provider;
            //string name = provider.ApplicationName; // Get the application name here
            return Membership.ValidateUser(username, password);
        }
        public string UpdateXmlStats(int GameId, string HomeXml, string AwayXml)
        {
            try
            {
                XDocument xdh = XDocument.Parse(HomeXml);
                XDocument xda = XDocument.Parse(AwayXml);
                xdh.Save(@"C:\Users\iratus\Documents\Visual Studio 2012\Projects\basketball\basket wesite\livegames\" + GameId.ToString() + "HomeXMLStats.xml");
                xda.Save(@"C:\Users\iratus\Documents\Visual Studio 2012\Projects\basketball\basket wesite\livegames\" + GameId.ToString() + "AwayXMLStats.xml");
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }

            return "Last Update : " + DateTime.Now.ToString("hh:mm");
        }
        public string SendXmltoDatabase(string HomeXml, string AwayXml)
        {
            string constring = WebConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();            
            try
            {
                XDocument xmlDoc = XDocument.Parse(HomeXml);
                int HTemId = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(0).Value);
                int GamId = Convert.ToInt16(xmlDoc.Descendants("GameInfo").Elements().ElementAt(3).Value);


                var StatsEvents = from Player in xmlDoc.Descendants("Player")
                                  select new
                                  {
                                      PlId = Convert.ToInt16(Player.Element("PlayerId").Value),
                                      GmId = GamId,
                                      TmId = HTemId,
                                      No = Convert.ToInt16(Player.Element("PlayerNo").Value),
                                      MP = Convert.ToInt16(Player.Element("MinutesPlayed").Value),
                                      FTMA = Convert.ToInt16(Player.Element("FTMade").Value),
                                      FTMI = Convert.ToInt16(Player.Element("FTMissed").Value),
                                      TwoPMA = Convert.ToInt16(Player.Element("TwoPMade").Value),
                                      TwoPMI = Convert.ToInt16(Player.Element("TwoPMissed").Value),
                                      ThreePMA = Convert.ToInt16(Player.Element("ThreePMade").Value),
                                      ThreePMI = Convert.ToInt16(Player.Element("ThreePMissed").Value),
                                      AS = Convert.ToInt16(Player.Element("Assist").Value),
                                      DR = Convert.ToInt16(Player.Element("DefRebound").Value),
                                      OR = Convert.ToInt16(Player.Element("OffRebound").Value),
                                      F = Convert.ToInt16(Player.Element("Foul").Value),
                                      FO = Convert.ToInt16(Player.Element("FoulOn").Value),
                                      TO = Convert.ToInt16(Player.Element("Turnover").Value),
                                      ST = Convert.ToInt16(Player.Element("Steal").Value),
                                      BL = Convert.ToInt16(Player.Element("Block").Value),
                                      BA = Convert.ToInt16(Player.Element("BlockAgainst").Value),
                                      UF = Convert.ToInt16(Player.Element("UnsportsmanFoul").Value),
                                      J = 1
                                  };


                foreach (var Player in StatsEvents)
                {
                    SqlCommand cmd = new SqlCommand();
                    TimeSpan MinPl = TimeSpan.FromSeconds(Convert.ToInt16(Player.MP.ToString()));
                    string sql = string.Format(@"INSERT INTO [STATISTICS] ([PLAYER_ID], [GAME_ID], [TEAM_ID], [PLAYER_NO], [MINUTES_PLAYED], [FREE_THROW_MADE], [FREE_THROW_MISSED], [2POINTS_MADE], [2POINTS_MISSED], [3POINT_MADE], [3POINT_MISSED], [ASSISTS], [DEFENSIVE_REBOUNDS], [OFFENSIVE_REBOUNDS], [FOULS_MADE], [FOULS_ON], [TURNOVERS], [STEALS], [BLOCKS_MADE], [BLOCKS_SUFFERED], [UNSPORTSMAN_FOUL], [JOIN_MATCH]) VALUES({0},{1},{2},{3},'{4}',{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21} )", Player.PlId, Player.GmId, Player.TmId, Player.No, MinPl, Player.FTMA, Player.FTMI, Player.TwoPMA, Player.TwoPMI, Player.ThreePMA, Player.ThreePMI, Player.AS, Player.DR, Player.OR, Player.F, Player.FO, Player.TO, Player.ST, Player.BL, Player.BA, Player.UF, Player.J);
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                }

                XDocument xmlDocA = XDocument.Parse(AwayXml);
                int ATemId = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(0).Value);


                var StatsEventsA = from PlayerA in xmlDocA.Descendants("Player")
                                   select new
                                   {
                                       PlId = Convert.ToInt16(PlayerA.Element("PlayerId").Value),
                                       GmId = GamId,
                                       TmId = ATemId,
                                       No = Convert.ToInt16(PlayerA.Element("PlayerNo").Value),
                                       MP = Convert.ToInt16(PlayerA.Element("MinutesPlayed").Value),
                                       FTMA = Convert.ToInt16(PlayerA.Element("FTMade").Value),
                                       FTMI = Convert.ToInt16(PlayerA.Element("FTMissed").Value),
                                       TwoPMA = Convert.ToInt16(PlayerA.Element("TwoPMade").Value),
                                       TwoPMI = Convert.ToInt16(PlayerA.Element("TwoPMissed").Value),
                                       ThreePMA = Convert.ToInt16(PlayerA.Element("ThreePMade").Value),
                                       ThreePMI = Convert.ToInt16(PlayerA.Element("ThreePMissed").Value),
                                       AS = Convert.ToInt16(PlayerA.Element("Assist").Value),
                                       DR = Convert.ToInt16(PlayerA.Element("DefRebound").Value),
                                       OR = Convert.ToInt16(PlayerA.Element("OffRebound").Value),
                                       F = Convert.ToInt16(PlayerA.Element("Foul").Value),
                                       FO = Convert.ToInt16(PlayerA.Element("FoulOn").Value),
                                       TO = Convert.ToInt16(PlayerA.Element("Turnover").Value),
                                       ST = Convert.ToInt16(PlayerA.Element("Steal").Value),
                                       BL = Convert.ToInt16(PlayerA.Element("Block").Value),
                                       BA = Convert.ToInt16(PlayerA.Element("BlockAgainst").Value),
                                       UF = Convert.ToInt16(PlayerA.Element("UnsportsmanFoul").Value),
                                       J = 1
                                   };


                foreach (var PlayerA in StatsEventsA)
                {
                    SqlCommand cmdA = new SqlCommand();
                    TimeSpan MinPlA = TimeSpan.FromSeconds(Convert.ToInt16(PlayerA.MP.ToString()));
                    string sqlA = string.Format(@"INSERT INTO [STATISTICS] ([PLAYER_ID], [GAME_ID], [TEAM_ID], [PLAYER_NO], [MINUTES_PLAYED], [FREE_THROW_MADE], [FREE_THROW_MISSED], [2POINTS_MADE], [2POINTS_MISSED], [3POINT_MADE], [3POINT_MISSED], [ASSISTS], [DEFENSIVE_REBOUNDS], [OFFENSIVE_REBOUNDS], [FOULS_MADE], [FOULS_ON], [TURNOVERS], [STEALS], [BLOCKS_MADE], [BLOCKS_SUFFERED], [UNSPORTSMAN_FOUL], [JOIN_MATCH]) VALUES({0},{1},{2},{3},'{4}',{5},{6},{7},{8},{9},{10},{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21} )", PlayerA.PlId, PlayerA.GmId, PlayerA.TmId, PlayerA.No, MinPlA, PlayerA.FTMA, PlayerA.FTMI, PlayerA.TwoPMA, PlayerA.TwoPMI, PlayerA.ThreePMA, PlayerA.ThreePMI, PlayerA.AS, PlayerA.DR, PlayerA.OR, PlayerA.F, PlayerA.FO, PlayerA.TO, PlayerA.ST, PlayerA.BL, PlayerA.BA, PlayerA.UF, PlayerA.J);
                    cmdA.CommandText = sqlA;
                    cmdA.Connection = con;
                    cmdA.ExecuteNonQuery();
                }


                int TOut = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(2).Value);
                int FBMA = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(3).Value);
                int FBMI = Convert.ToInt16(xmlDoc.Descendants("HomeTeam").Elements().ElementAt(4).Value);

                int TOutA = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(2).Value);
                int FBMAA = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(3).Value);
                int FBMIA = Convert.ToInt16(xmlDocA.Descendants("AwayTeam").Elements().ElementAt(4).Value);

                SqlCommand cmdT = new SqlCommand();
                string sqlT = string.Format(@"INSERT INTO [TEAM_STATS] ([FASTBREAK_MADE] ,[FASTBREAK_MISSED] ,[TIMEOUT] ,[GAME_ID] ,[TEAM_ID]) VALUES({0},{1},{2},{3},{4}) ;INSERT INTO [TEAM_STATS] ([FASTBREAK_MADE] ,[FASTBREAK_MISSED] ,[TIMEOUT] ,[GAME_ID] ,[TEAM_ID]) VALUES({5},{6},{7},{8},{9});", FBMA, FBMI, TOut, GamId, HTemId, FBMAA, FBMIA, TOutA, GamId, ATemId);
                cmdT.CommandText = sqlT;
                cmdT.Connection = con;
                cmdT.ExecuteNonQuery();

                int CQ = xmlDoc.Descendants("HomeTeam").Elements().Count();
                string QSHome = null;
                string QSAway = null;
                for (int i = 5; i < CQ; i++)
                {
                    QSHome += xmlDoc.Descendants("HomeTeam").Elements().ElementAt(i).Value + " ";
                    QSAway += xmlDocA.Descendants("AwayTeam").Elements().ElementAt(i).Value + " ";
                }

                string HTNAME = xmlDoc.Descendants("HomeTeam").Elements().ElementAt(1).Value;
                string ATNAME = xmlDocA.Descendants("AwayTeam").Elements().ElementAt(1).Value;

                SqlCommand cmdSc = new SqlCommand();
                string sqlSc = string.Format(@"INSERT INTO [QSCORES] ([GAME_ID] ,[QSCORES_HOME] ,[QSCORES_AWAY] ,[HOME_TEAM] ,[AWAY_TEAM]) VALUES({0},'{1}','{2}','{3}','{4}')", GamId, QSHome.TrimEnd(), QSAway.TrimEnd(), HTNAME, ATNAME);
                cmdSc.CommandText = sqlSc;
                cmdSc.Connection = con;
                cmdSc.ExecuteNonQuery();

                string PBPText = xmlDoc.Descendants("Event").Elements().ElementAt(0).Value;
                SqlCommand cmdPbP = new SqlCommand();
                string sqlPbP = string.Format(@"INSERT INTO [PLAY_BY_PLAY] ([GAME_ID] ,[PBP]) VALUES({0},'{1}')", GamId, PBPText);
                cmdPbP.CommandText = sqlPbP;
                cmdPbP.Connection = con;
                cmdPbP.ExecuteNonQuery();

                string XYTextH = xmlDoc.Descendants("CoordinatesHome").Elements().ElementAt(0).Value;
                string XYTextA = xmlDocA.Descendants("CoordinatesAway").Elements().ElementAt(0).Value;
                SqlCommand cmdXYT = new SqlCommand();
                string sqlXYT = string.Format(@"INSERT INTO [COORDINATES] ([GAME_ID], [XYTEXT_HOME], [XYTEXT_AWAY]) VALUES({0},'{1}','{2}')", GamId, XYTextH, XYTextA);
                cmdXYT.CommandText = sqlXYT;
                cmdXYT.Connection = con;
                cmdXYT.ExecuteNonQuery();              

            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            con.Close();  
            return "Database successfully updated";
        }
        public DataTable GetTodayMatches()
        {
            string constring = WebConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT GAMES.ID AS GAME,GAMES.DATE_TIME AS [DATE], GAMES.AGONISTIKI AS AGONISTIKI, HT.NAME AS [HOME TEAM], AT.NAME AS [AWAY TEAM], REF1.SURENAME AS [1st REFEREE], REF2.SURENAME AS [2nd REFEREE], REF3.SURENAME AS [3rd REFEREE], ARENAS.NAME AS ARENA, HC.SURENAME AS [HOME COACH], AC.SURENAME AS [AWAY COACH],GAMES.HOME_TEAM_ID,GAMES.AWAY_TEAM_ID FROM GAMES INNER JOIN TEAMS AS HT ON GAMES.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON GAMES.AWAY_TEAM_ID = AT.ID INNER JOIN ARENAS ON GAMES.ARENA_ID = ARENAS.ID INNER JOIN COACH AS HC ON GAMES.HOME_TEAM_COACH_ID = HC.ID INNER JOIN COACH AS AC ON GAMES.AWAY_TEAM_COACH_ID = AC.ID INNER JOIN REFEREE AS REF1 ON GAMES.REFEREE1_ID = REF1.ID INNER JOIN REFEREE AS REF2 ON GAMES.REFEREE2_ID = REF2.ID INNER JOIN REFEREE AS REF3 ON GAMES.REFEREE3_ID = REF3.ID  WHERE CAST(GAMES.DATE_TIME AS DATE) = CAST(CURRENT_TIMESTAMP AS DATE)", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close(); dt.TableName = "TodayMatches";                        
            return dt;
        }
        public DataTable GetHomeRoster(int GameId)
        {
            string constring = WebConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT PLAYERS.ID, CAST(PLAYERS.NO AS VARCHAR) + ' - ' + PLAYERS.SURNAME + ', ' + PLAYERS.FIRSTNAME AS PLAYER FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN GAMES ON TEAMS.ID = GAMES.HOME_TEAM_ID WHERE (GAMES.ID ="+GameId+") ORDER BY PLAYERS.NO", con);
            DataTable dth = new DataTable();
            sda.Fill(dth);
            con.Close(); dth.TableName = "HomeRoster";                        
            return dth;
        }
        public DataTable GetAwayRoster(int GameId)
        {
            string constring = WebConfigurationManager.ConnectionStrings["BasketballCstr"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT PLAYERS.ID, CAST(PLAYERS.NO AS VARCHAR) + ' - ' + PLAYERS.SURNAME + ', ' + PLAYERS.FIRSTNAME AS PLAYER FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN GAMES ON TEAMS.ID = GAMES.AWAY_TEAM_ID WHERE (GAMES.ID =" + GameId + ") ORDER BY PLAYERS.NO", con);
            DataTable dta = new DataTable();
            sda.Fill(dta);
            con.Close(); dta.TableName = "AwayRoster";
            return dta;
        }

    }
}
