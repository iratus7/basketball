<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="TeamNews.aspx.cs" Inherits="Administrator_TeamNews" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <!-- <script src="../Scripts/jquery-2.0.3.min.js"></script>-->
     <script src="../Scripts/jquery-1.11.1.min.js"></script> 
    <script src="../Scripts/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />
    <script src="../Scripts/jquery-ui-timepicker-addon.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>ΔΙΑΧΕΙΡΗΣΗ ΝΕΩΝ</h1>
    <asp:FormView ID="FormViewNewsTeam" runat="server" DataSourceID="news" DataKeyNames="ID" AllowPaging="True" Width="500px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
            TEAM:
            <asp:HiddenField runat="server" ID="HiddenTeamId" Value='<%# Bind("TEAM_ID") %>' />
            <asp:Label Text='<%# Eval("NAME") %>' runat="server" ID="Label2" /><br />
            TITLE:
            <asp:TextBox Text='<%# Bind("TITLE") %>' runat="server" ID="TITLETextBox" Rows="5" MaxLength="40" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="TITLETextBox" ID="RegularExpressionValidator6" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator>
            <br />
            NEWS:
            <asp:TextBox Text='<%# Bind("NEWS") %>' runat="server" ID="TEAM_COMMENTTextBox" Rows="10" MaxLength="400" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="TEAM_COMMENTTextBox" ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{6,400}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 400."></asp:RegularExpressionValidator>
            <br />
            DATE & TIME:
            <input type="datetime" id="selectedDateTime" class="selectedDateTime" runat="server" value='<%# Bind("DATE_TIME") %>' />
            <br />
            <asp:LinkButton runat="server" Text="ΕΠΕΞΕΡΓΑΣΙΑ" ValidationGroup="EDIT" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="ΑΚΥΡΩΣΗ" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            TEAM:
            <asp:DropDownList ID="DropDownListteam" runat="server"
                DataSourceID="SqlDataGetTeams"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TEAM_ID") %>'>
            </asp:DropDownList><br />
            TITLE:
            <asp:TextBox Text='<%# Bind("TITLE") %>' runat="server" ID="TITLETextBoxIN" Rows="5" MaxLength="40" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="TITLETextBoxIN" ID="RegularExpressionValidatorIn6" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator>
            <br />
            NEWS:
            <asp:TextBox Text='<%# Bind("NEWS") %>' runat="server" ID="TEAM_COMMENTTextBoxIn" Rows="10" MaxLength="400" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="TEAM_COMMENTTextBoxIn" ID="RegularExpressionValidatorin3" ValidationExpression="^[\s\S]{6,400}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 400."></asp:RegularExpressionValidator>
            <br />
            DATE & TIME:
            <input type="datetime" id="selectedDateTimeIN" class="selectedDateTime" runat="server" value='<%# Bind("DATE_TIME") %>' />
            <br />
            <asp:LinkButton runat="server" Text="ΕΙΣΑΓΩΓΗ" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="ΑΚΥΡΩΣΗ" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            TEAM:
            <asp:Label Text='<%# Eval("NAME") %>' runat="server" ID="Label1" /><br />
            TITLE:
            <asp:Label Text='<%# Eval("TITLE") %>' runat="server" ID="TITLELabel" /><br />
            NEWS:
            <asp:Label Text='<%# Eval("NEWS") %>' runat="server" ID="NEWSLabel" /><br />
            DATE & TIME:
            <asp:Label Text='<%# Eval("DATE_TIME") %>' runat="server" ID="DATE_TIMELabel" /><br />
            <asp:LinkButton runat="server" Text="ΕΠΕΞΕΡΓΑΣΙΑ" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="ΔΙΑΓΡΑΦΗ" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="ΕΙΣΑΓΩΓΗ" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#5D7B9D" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>

    <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server" ForeColor="Red" ValidationGroup="EDIT" ShowValidationErrors="true" />
       <asp:ValidationSummary ID="InsertValidationSum" runat="server" ForeColor="Red" ValidationGroup="INSERT" ShowValidationErrors="true" />

    <asp:SqlDataSource ID="news" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT TEAM_NEWS.ID, TEAM_NEWS.TEAM_ID, TEAM_NEWS.TITLE, TEAM_NEWS.NEWS, TEAM_NEWS.DATE_TIME, TEAMS.NAME, TEAMS.ID AS IDOTEAM FROM TEAM_NEWS INNER JOIN TEAMS ON TEAM_NEWS.TEAM_ID = TEAMS.ID" DeleteCommand="DELETE FROM [TEAM_NEWS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TEAM_NEWS] ([TEAM_ID], [TITLE], [NEWS], [DATE_TIME]) VALUES (@TEAM_ID, @TITLE, @NEWS, @DATE_TIME)" UpdateCommand="UPDATE [TEAM_NEWS] SET [TEAM_ID] = @TEAM_ID, [TITLE] = @TITLE, [NEWS] = @NEWS, [DATE_TIME] = @DATE_TIME WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TEAM_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="NEWS" Type="String"></asp:Parameter>
            <asp:Parameter Name="DATE_TIME" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TEAM_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="NEWS" Type="String"></asp:Parameter>
            <asp:Parameter Name="DATE_TIME" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataGetTeams" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT T.ID, T.NAME FROM TEAMS AS T EXCEPT SELECT T.ID, T.NAME FROM TEAMS AS T INNER JOIN TEAM_NEWS AS N ON T.ID = N.TEAM_ID EXCEPT SELECT T.ID, T.NAME FROM TEAMS AS T WHERE T.NAME = 'FREE AGENT'">
    </asp:SqlDataSource>
    
    <script>
        $('.selectedDateTime').datetimepicker({
            dateFormat: "dd-mm-yy",
            timeFormat: "hh:mm tt"
        });
       </script>
</asp:Content>

