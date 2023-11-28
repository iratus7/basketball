using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Data.SqlClient;
using System.Web;
using System.Web.ApplicationServices;
using System.Web.Security;
using System.Xml.Linq;
namespace BasketballApp
{
    public partial class LoginForm : Form
    {
        BasketballService.ServicebasketballClient basketballWcf = new BasketballService.ServicebasketballClient();
        public LoginForm()
        {
            Thread tr = new Thread(new ThreadStart(SplashStart));
            tr.Start();
            Thread.Sleep(2500);

            InitializeComponent();
            tr.Abort();
        }
        public void SplashStart()
        {
            Application.Run(new SplashScreen());
        }
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        //public async Task<bool> VerifyUserNamePassword(string userName, string password)
        //{
        //    var usermanager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(new IdentityDbContext()));
        //    return await usermanager.FindAsync(userName, password) != null;
        //}       
        private void button1_Click(object sender, EventArgs e)
        {
            bool result = basketballWcf.Validate(textBoxUser.Text, textBoxPass.Text);
            if (result)
            {
                this.Hide();
                GameChoose gc = new GameChoose();
                gc.Show();
            }
            else
            {
                MessageBox.Show("ΠΑΡΑΚΑΛΩ ΕΛΕΓΞΤΕ ΤΟ USERNAME ΚΑΙ ΤΟ PASSWORD");
                textBoxPass.Text = "";
            }
            //SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Basketball;Integrated Security=True;User ID=apollon;Password=ourania2");
            //SqlDataAdapter sda = new SqlDataAdapter("Select count(*) From aspnet_Membership where UserId='" + textBoxUser.Text + "' and Password ='" + textBoxPass.Text + "'", con);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //if (dt.Rows[0][0].ToString() == "1")
            //{

            //    this.Hide();
            //    GameChoose gc = new GameChoose();
            //    gc.Show();
            //}
            //else
            //{
            //    MessageBox.Show("ΠΑΡΑΚΑΛΩ ΕΛΕΓΞΤΕ ΤΟ USERNAME ΚΑΙ ΤΟ PASSWORD");
            //    textBoxPass.Text = "";
            //}

            }
        private void textBoxPass_TextChanged(object sender, EventArgs e)
        {
            textBoxPass.PasswordChar = '*';
        }
        private void LoginForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Είστε σίγουρος οτι θέλετε να βγείτε απο την εφαρμογή?", "ΈΞΟΔΟΣ", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                e.Cancel = true;
            }   
        }
    }    
}
