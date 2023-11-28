<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="FirstLetterPlayers.aspx.cs" Inherits="FirstLetterPlayers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>PLAYERS</h2> 
   

    <table class="leaderTable"><tr><th style="font-size:30px;color: aliceblue";">
    <asp:HyperLink ID="HyperLinkA" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=A">A</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkB" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=B">B</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkC" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=C">C</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkD" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=D">D</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkE" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=E">E</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkF" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=F">F</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkG" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=G">G</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkH" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=H">H</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkI" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=I">I</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkJ" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=J">J</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkK" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=K">K</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkL" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=L">L</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkM" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=M">M</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkN" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=N">N</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkO" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=O">O</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkP" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=P">P</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkQ" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=Q">Q</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkR" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=R">R</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkS" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=S">S</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkT" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=T">T</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkU" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=U">U</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkV" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=V">V</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkW" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=W">W</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkX" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=X">X</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkY" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=Y">Y</asp:HyperLink>
    <asp:HyperLink ID="HyperLinkZ" runat="server" NavigateUrl="FirstLetterPlayers.aspx?FIRSTLETTER=Z">Z</asp:HyperLink></th></tr><tr><td>
    <asp:GridView ID="GridView1" runat="server" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" EmptyDataText="ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΓΡΑΜΜΑ...">
        <Columns>
            <asp:BoundField DataField="NO" HeaderText="NO" ReadOnly="True" InsertVisible="False" SortExpression="NO" ></asp:BoundField>
            <asp:TemplateField HeaderText="FULLNAME">
                <ItemTemplate>
<asp:HyperLink CssClass="has-tooltip" runat="server" Text='<%# Eval("FULLNAME") %>' NavigateUrl='<%# Eval("ID", "Players.aspx?ID={0}") %>' data-image='<%# "images/players/" + Eval("IMAGE") %>'  ID="HyperLink1"></asp:HyperLink>                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView></td></tr></table>
        <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT ID, NO, SURNAME, FIRSTNAME, SURNAME + ' ' + FIRSTNAME AS FULLNAME, IMAGE FROM PLAYERS WHERE (SURNAME LIKE + @FIRSTLETTER + N'%')">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="FIRSTLETTER" Name="FIRSTLETTER" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.has-tooltip').hover(function () {
                $(this).find('.tooltip').html('<img src="' + $(this).data('image') + '" alt="loading...">').fadeIn();
            }, function () {
                $(this).find('.tooltip').hide();
            }).append('<span class="tooltip"></span>');
        });
        </script>

   <!--     <img id="images" src="#" alt=""/>
<script type="text/javascript">
    $('#GridView1').mouseenter(function () {
    var id = $('#GridView1').text();
    $('#images').prop('~/images/players/', id);
    $('#images').show();
}).mouseleave(function () {
    $('#images').hide();
})
</script> -->
</asp:Content>

