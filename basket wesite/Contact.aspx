<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <h3>ΕΠΙΚΟΙΝΩΝΙΑ</h3>
            <h5>Επικοινωνία μέσω ηλεκτρονικού ταχυδρομείου</h5>           
            <p>Μη διστάσετε να επικοινωνήσετε μαζί μας... <a href="mailto:mai135@uom.edu.gr" class="contactButton"></a></p>
            <h5>Προσθήκη mail στο newsletter </h5>
            <p>Σε αυτό το σημείο μπορείτε να εισάγεται το mail σας για να ενημερώνεστε για τα νέα του σχολείου μας...</p>
                        
            <form method="post" action="send_mail.php" >
                
                  <input type="text" id="mail" name="mail" size="30" />
                
                  <input type="submit" class="sendbutton" value="ΑΠΟΣΤΟΛΗ" />
                
            </form>
            
            <hr width="75%" size="10" noshade="NOSHADE">
            <h3>ΧΡΗΣΙΜΑ ΤΗΛΕΦΩΝΑ</h3>
                <p>τηλ.κέντρο : 00302310.891101</p>
<p>Ταχυδρομική διεύθυνση
Πανεπιστήμιο Μακεδονίας,
Εγνατία 156,
Τ.Θ. 1591
540 06 Θεσσαλονίκη</p>
            <p>Για οποιαδήποτε πληροφορία σχετικά με τα τμήματα και προγράμματα σπουδών, μπορείτε να στέλνετε email στο τμήμα δημοσίων σχέσεων του Πανεπιστημίου Μακεδονίας: <a href="mailto:pubrel@uom.gr">pubrel@uom.gr</a> </p>            
            <p class="centerizep"><i>ΠΑΝΕΠΙΣΤΗΜΙΟ ΜΑΚΕΔΟΝΙΑΣ</i></p>
            <hr width="75%" size="10" noshade="NOSHADE">
            <h3>ΧΑΡΤΗΣ</h3>
            <div class="MapContact">
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3028.2147916831123!2d22.965748722259534!3d40.625144859505944!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xdafb4206c7c961c9!2zzqDOsc69zrXPgM65z4PPhM6uzrzOuc6_IM6czrHOus61zrTOv869zq_Osc-C!5e0!3m2!1sel!2sgr!4v1399880186938" width="600" height="450" frameborder="0" style="border:0"></iframe>    </div>
            <hr width="75%" size="10" noshade="NOSHADE">
</asp:Content>

