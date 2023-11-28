<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Macabi.aspx.cs" Inherits="Macabi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>MACABI</h1>
    <div class="sidebar">

                <h3>ΤΕΛΕΥΤΑΙΑ ΝΕΑ</h3>
                <h4>Συγκέντρωση διαμαρτυρίας στη Γ διεύθυνση 23/10/2013</h4>
                <h5>21 Οκτωβρίου 2013</h5>
                <p>Την τετάρτη 23/10/13 2:00μμ θα πραγματοποιηθεί συγκέντρωση διαμαρτυρίας στη Γ διεύθυνση Αθήνας, Μάκρης 3 Αιγάλεω.</p>                           
                <a href="files/ΣΥΓΚΕΝΤΡΩΣΗ ΔΙΑΜΑΡΤΥΡΙΑΣ ΣΤΗ Γ ΔΙΕΥΘΥΝΣΗ.docx">Κατεβάστε την ανακοίνωση απο εδώ...</a>
                <hr width="75%" size="10" noshade="NOSHADE"></hr>
                <h4>Κάλεσμα γνέων 16/10/2013</h4>
                <h5>16 Οκτωβρίου 2013</h5>
                <p>Σαν συνέχεια της προηγούμενης μας συνάντησης, σας καλούμε την τετάρτη 16/10/13 σε νέα συγκέντρωση. Στην πρώτη μας συγκέντρωση συζητήσαμε για το τι συμβαίνει αυτή τη στιγμή στην εκπαίδευση. Σ΄ αυτή μας τη συνάντηση θα συντονιστούμε και θα σχεδιάσουμε τις δράσεις μας</p>                           
                <a href="files/ΑΦΙΣΑ ΓΙΑ ΚΑΛΕΣΜΑ ΓΟΝΕΩΝ 16-10-13.docx">Κατεβάστε την αφίσα της συγκέντρωσης απο εδώ...</a>
                <a href="files/ΚΑΛΕΣΜΑ ΓΟΝΕΩΝ 16-10-13.docx">...και το κάλεσμα της συγκέντρωσης απο εδώ</a>
                <hr width="75%" size="10" noshade="NOSHADE"></hr>
            </div>
       
    <asp:GridView ID="GridView1" runat="server" CssClass="grid-viewPlayers" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" >
        
        <Columns>
            
            <asp:TemplateField HeaderText="NO" SortExpression="NO">               
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NO") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Players.aspx?ID={0}" DataTextField="SURNAME" HeaderText="SURNAME" />

            <asp:TemplateField HeaderText="FIRSTNAME" SortExpression="FIRSTNAME">           
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("FIRSTNAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="POSITION" SortExpression="POSITION">                
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("POSITION") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="HEIGHT" SortExpression="HEIGHT">               
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("HEIGHT") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BORN" SortExpression="BORN">                
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("BORN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NATIONALITY" SortExpression="NATIONALITY">                
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("NATIONALITY") %>'></asp:Label>
                    <asp:Image ID="ImageCountryView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("COUNTRY_IMAGE") + ".png" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PLAYER_IMAGE" SortExpression="PLAYER_IMAGE">                
                <ItemTemplate>                  
                        <asp:Image ID="ImagePlayer" runat="server" Height="40px" Width="40px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("PLAYER_IMAGE") %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        
    </asp:GridView>
   <asp:GridView ID="GridView2" CssClass="grid-viewCoach" OnRowCreated="gvHover_RowCreated" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" ShowHeader="True" HorizontalAlign="Left">
        
        <Columns>
            <asp:TemplateField HeaderText="COACH" SortExpression="COACH">                
                <ItemTemplate><asp:Image ID="CoachImageView" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/coaches/" + Eval("COACH_IMAGE") %>' /><br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("COACH") %>'></asp:Label>
                </ItemTemplate>               
            </asp:TemplateField>            
        </Columns>        
    </asp:GridView>
    <asp:GridView ID="GridView3" runat="server" CssClass="grid-viewCoach" OnRowCreated="gvHover_RowCreated" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:TemplateField HeaderText="ARENA" SortExpression="ARENA">                
                <ItemTemplate><asp:Image ID="IMAGEArena" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/arenas/" + Eval("ARENA_IMAGE") %>' /><br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ARENA") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT ID, NO, SURNAME, FIRSTNAME, POSITION, HEIGHT, BORN, NATIONALITY, COACH_FIRST_NAME + ' ' + COACH AS COACH, LOGO, PLAYER_IMAGE, COUNTRY_IMAGE FROM View_MACABI">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT DISTINCT ARENA, ARENA_IMAGE FROM View_MACABI"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT DISTINCT COACH_FIRST_NAME + ' ' + COACH AS COACH, COACH_IMAGE, COACH_FIRST_NAME FROM View_MACABI"></asp:SqlDataSource>
    
</asp:Content>

