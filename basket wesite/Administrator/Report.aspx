<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>ΔΙΑΧΕΙΡΗΣΗ ΣΧΟΛΙΩΝ</h1>
    <asp:FormView ID="FormViewReport" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceReport" OnItemInserting="FormViewReport_ItemInserting" EmptyDataText="ΔΕΝ ΥΠΑΡΧΟΥΝ ΣΧΟΛΙΑ ΓΙΑ ΚΑΝΕΝΑΝ ΑΓΩΝΑ" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
            GAME_ID:
            <asp:Label Text='<%# Bind("GAME_ID") %>' runat="server" ID="LabelEditGameId" /><br />
            HOME_COACH_COMMENT:
            <asp:TextBox Text='<%# Bind("HOME_COACH_COMMENT") %>' runat="server" ID="HOME_COACH_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="HOME_COACH_COMMENTTextBox" ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            AWAY_COACH_COMMENT:
            <asp:TextBox Text='<%# Bind("AWAY_COACH_COMMENT") %>' runat="server" ID="AWAY_COACH_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="AWAY_COACH_COMMENTTextBox" ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            HOME_PLAYER:
            <asp:DropDownList ID="DropDownListRep" runat="server"
                DataSourceID="SqlDataSourceGetPlayers"
                DataTextField="HOME_PLAYER_S" DataValueField="HP_ID" SelectedValue='<%# Bind("HOME_PLAYER_ID") %>'>
            </asp:DropDownList><br />
            AWAY PLAYERS:
            <asp:DropDownList ID="DropDownListAwayPlayerEdit" runat="server"
                DataSourceID="SqlDataSourceGETPA"
                DataTextField="AWAY_PLAYER_S" DataValueField="AP_ID" SelectedValue='<%# Bind("AWAY_PLAYER_ID") %>'>
            </asp:DropDownList><br />
            HOME_PLAYER_COMMENT:
            <asp:TextBox Text='<%# Bind("HOME_PLAYER_COMMENT") %>' runat="server" ID="HOME_PLAYER_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="HOME_PLAYER_COMMENTTextBox" ID="RegularExpressionValidator2" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            AWAY_PLAYER_COMMENT:
            <asp:TextBox Text='<%# Bind("AWAY_PLAYER_COMMENT") %>' runat="server" ID="AWAY_PLAYER_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="AWAY_PLAYER_COMMENTTextBox" ID="RegularExpressionValidator4" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            REPORT_TEXT:
            <asp:TextBox Text='<%# Bind("REPORT_TEXT") %>' runat="server" ID="REPORT_TEXTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="REPORT_TEXTTextBox" ID="RegularExpressionValidator5" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            REPORT_TITLE:
            <asp:TextBox Text='<%# Bind("REPORT_TITLE") %>' runat="server" ID="REPORT_TITLETextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="REPORT_TITLETextBox" ID="RegularExpressionValidator6" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            FIRST_QUARTER:
            <asp:TextBox Text='<%# Bind("FIRST_QUARTER") %>' runat="server" ID="FIRST_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="FIRST_QUARTERTextBox" ID="RegularExpressionValidator7" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            SECOND_QUARTER:
            <asp:TextBox Text='<%# Bind("SECOND_QUARTER") %>' runat="server" ID="SECOND_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="SECOND_QUARTERTextBox" ID="RegularExpressionValidator8" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            THIRD_QUARTER:
            <asp:TextBox Text='<%# Bind("THIRD_QUARTER") %>' runat="server" ID="THIRD_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="THIRD_QUARTERTextBox" ID="RegularExpressionValidator9" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            FORTH_QUARTER:
            <asp:TextBox Text='<%# Bind("FORTH_QUARTER") %>' runat="server" ID="FORTH_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="EDIT" ControlToValidate="FORTH_QUARTERTextBox" ID="RegularExpressionValidator10" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            <asp:FileUpload ID="FileUploadReportEdit" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="EDIT" ID="RegularExpressionValidatorFiluploadEdit" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUploadReportEdit" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="NewfileuploadCustomValidator" runat="server" ValidationGroup="EDIT"
                ToolTip="FileSize should not exceed 1mb"
                ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUploadReportEdit"
                OnServerValidate="checkfilesize" Text="*" ForeColor="Red"></asp:CustomValidator>
            <asp:LinkButton runat="server" Text="Αλλαγή" CommandName="Update" ValidationGroup="EDIT" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Ακύρωση" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />

            <asp:SqlDataSource ID="SqlDataSourceGetPlayers" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT HP.SURNAME AS HOME_PLAYER_S, HP.FIRSTNAME AS HOME_PLAYER_F, HP.ID AS HP_ID, GAMES.ID, REPORT.GAME_ID FROM PLAYERS AS HP INNER JOIN GAMES ON HP.TEAM_ID = GAMES.HOME_TEAM_ID INNER JOIN REPORT ON GAMES.ID = REPORT.GAME_ID WHERE (REPORT.GAME_ID = @GAME_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LabelEditGameId" PropertyName="Text" Name="GAME_ID"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceGETPA" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT AP.SURNAME AS AWAY_PLAYER_S, AP.FIRSTNAME AS AWAY_PLAYER_F, AP.ID AS AP_ID, GAMES.ID FROM PLAYERS AS AP INNER JOIN GAMES ON AP.TEAM_ID = GAMES.AWAY_TEAM_ID WHERE (GAMES.ID = @GAME_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LabelEditGameId" PropertyName="Text" Name="GAME_ID"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>

        </EditItemTemplate>
<EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            GAME_ID:
            <asp:DropDownList ID="DropDownListReportIns" runat="server" AutoPostBack="true"
                DataSourceID="SqlDataSourceGetGame"
                DataTextField="GAME" DataValueField="ID" SelectedValue='<%# Bind("GAME_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΑΓΩΝΑ" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="GameValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Αγώνα"
                ControlToValidate="DropDownListReportIns" Text="*" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator><br />
            HOME_COACH_COMMENT:
            <asp:TextBox Text='<%# Bind("HOME_COACH_COMMENT") %>' runat="server" ID="HOME_COACH_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="HOME_COACH_COMMENTTextBox" ID="RegularExpressionValidator10" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            AWAY_COACH_COMMENT:
            <asp:TextBox Text='<%# Bind("AWAY_COACH_COMMENT") %>' runat="server" ID="AWAY_COACH_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="AWAY_COACH_COMMENTTextBox" ID="RegularExpressionValidator11" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            HOME_PLAYER:
            <asp:DropDownList ID="DropDownListRepIns" runat="server" AppendDataBoundItems="True" EnableViewState="false"
                DataSourceID="SqlDataSourceGetPlayers"
                DataTextField="HOME_PLAYER_S" DataValueField="HP_ID">
                <asp:ListItem Text="ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΠΑΙΧΤΗ" Value="0" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="InsertPlayerHValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Παίχτη"
                ControlToValidate="DropDownListRepIns" Text="*" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            AWAY PLAYERS:
            <asp:DropDownList ID="DropDownListAwayPlayerInsert" runat="server" AppendDataBoundItems="True" EnableViewState="false"
                DataSourceID="SqlDataSourceGETPA"
                DataTextField="AWAY_PLAYER_S" DataValueField="AP_ID">
                <asp:ListItem Text="ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΠΑΙΧΤΗ" Value="0" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="InsertPlayerAValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Παίχτη"
                ControlToValidate="DropDownListAwayPlayerInsert" Text="*" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            HOME_PLAYER_COMMENT:
            <asp:TextBox Text='<%# Bind("HOME_PLAYER_COMMENT") %>' runat="server" ID="HOME_PLAYER_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="HOME_PLAYER_COMMENTTextBox" ID="RegularExpressionValidator12" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            AWAY_PLAYER_COMMENT:
            <asp:TextBox Text='<%# Bind("AWAY_PLAYER_COMMENT") %>' runat="server" ID="AWAY_PLAYER_COMMENTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="AWAY_PLAYER_COMMENTTextBox" ID="RegularExpressionValidator13" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            REPORT_TEXT:
            <asp:TextBox Text='<%# Bind("REPORT_TEXT") %>' runat="server" ID="REPORT_TEXTTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="REPORT_TEXTTextBox" ID="RegularExpressionValidator14" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            REPORT_TITLE:
            <asp:TextBox Text='<%# Bind("REPORT_TITLE") %>' runat="server" ID="REPORT_TITLETextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="REPORT_TITLETextBox" ID="RegularExpressionValidator15" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            FIRST_QUARTER:
            <asp:TextBox Text='<%# Bind("FIRST_QUARTER") %>' runat="server" ID="FIRST_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="FIRST_QUARTERTextBox" ID="RegularExpressionValidator16" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            SECOND_QUARTER:
            <asp:TextBox Text='<%# Bind("SECOND_QUARTER") %>' runat="server" ID="SECOND_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="SECOND_QUARTERTextBox" ID="RegularExpressionValidator17" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            THIRD_QUARTER:
            <asp:TextBox Text='<%# Bind("THIRD_QUARTER") %>' runat="server" ID="THIRD_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="THIRD_QUARTERTextBox" ID="RegularExpressionValidator18" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            FORTH_QUARTER:
            <asp:TextBox Text='<%# Bind("FORTH_QUARTER") %>' runat="server" ID="FORTH_QUARTERTextBox" Rows="5" MaxLength="150" Width="550px" TextMode="MultiLine" />
            <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="INSERT" ControlToValidate="FORTH_QUARTERTextBox" ID="RegularExpressionValidator19" ValidationExpression="^[\s\S]{6,150}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 150."></asp:RegularExpressionValidator>
            <br />
            <asp:FileUpload ID="FileUploadReportInsert" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="INSERT" ID="RegularExpressionValidatorFiluploadIns" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUploadReportInsert" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="fileuploadCustomValidateIns" runat="server" ValidationGroup="INSERT"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUploadReportInsert" OnServerValidate="checkfilesize" Text="*" ForeColor="Red"></asp:CustomValidator>
            <asp:LinkButton runat="server" Text="Εισαγωγή" CommandName="Insert" ValidationGroup="INSERT" ID="InsertButton" CausesValidation="true" />&nbsp;<asp:LinkButton runat="server" Text="Ακύρωση" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />

            <asp:SqlDataSource ID="SqlDataSourceGetPlayers" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT HP.SURNAME AS HOME_PLAYER_S, HP.FIRSTNAME AS HOME_PLAYER_F, HP.ID AS HP_ID, GAMES.ID FROM PLAYERS AS HP INNER JOIN GAMES ON HP.TEAM_ID = GAMES.HOME_TEAM_ID WHERE (GAMES.ID = @GAME_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListReportIns" PropertyName="SelectedValue" Name="GAME_ID" DefaultValue="8"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceGETPA" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT AP.SURNAME AS AWAY_PLAYER_S, AP.FIRSTNAME AS AWAY_PLAYER_F, AP.ID AS AP_ID, GAMES.ID FROM PLAYERS AS AP INNER JOIN GAMES ON AP.TEAM_ID = GAMES.AWAY_TEAM_ID WHERE (GAMES.ID = @GAME_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListReportIns" PropertyName="SelectedValue" Name="GAME_ID" DefaultValue="8"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>

        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
            GAME_ID:
            <asp:Label Text='<%# Bind("GAME_ID") %>' runat="server" ID="GAME_IDLabel" /><br />
            HOME_COACH_COMMENT:
            <asp:Label Text='<%# Bind("HOME_COACH_COMMENT") %>' runat="server" ID="HOME_COACH_COMMENTLabel" /><br />
            AWAY_COACH_COMMENT:
            <asp:Label Text='<%# Bind("AWAY_COACH_COMMENT") %>' runat="server" ID="AWAY_COACH_COMMENTLabel" /><br />
            HOME PLAYER:
            <asp:Label Text='<%# Bind("HOME_PLAYER_ID") %>' runat="server" ID="Label1" /><br />
            AWAY PLAYER:
            <asp:Label Text='<%# Bind("AWAY_PLAYER_ID") %>' runat="server" ID="Label2" /><br />
            HOME_PLAYER_COMMENT:
            <asp:Label Text='<%# Bind("HOME_PLAYER_COMMENT") %>' runat="server" ID="HOME_PLAYER_COMMENTLabel" /><br />
            AWAY_PLAYER_COMMENT:
            <asp:Label Text='<%# Bind("AWAY_PLAYER_COMMENT") %>' runat="server" ID="AWAY_PLAYER_COMMENTLabel" /><br />
            REPORT_TEXT:
            <asp:Label Text='<%# Bind("REPORT_TEXT") %>' runat="server" ID="REPORT_TEXTLabel" /><br />
            REPORT_TITLE:
            <asp:Label Text='<%# Bind("REPORT_TITLE") %>' runat="server" ID="REPORT_TITLELabel" /><br />
            FIRST_QUARTER:
            <asp:Label Text='<%# Bind("FIRST_QUARTER") %>' runat="server" ID="FIRST_QUARTERLabel" /><br />
            SECOND_QUARTER:
            <asp:Label Text='<%# Bind("SECOND_QUARTER") %>' runat="server" ID="SECOND_QUARTERLabel" /><br />
            THIRD_QUARTER:
            <asp:Label Text='<%# Bind("THIRD_QUARTER") %>' runat="server" ID="THIRD_QUARTERLabel" /><br />
            FORTH_QUARTER:
            <asp:Label Text='<%# Bind("FORTH_QUARTER") %>' runat="server" ID="FORTH_QUARTERLabel" /><br />
            <asp:Image ID="IMAGEReport" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/report/" + Eval("IMAGE") %>' />

            <asp:LinkButton runat="server" Text="Επεξεργασία" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Διαγραφή" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Εισαγωγή" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#5D7B9D" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSourceReport" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT ID, GAME_ID, HOME_COACH_COMMENT, AWAY_COACH_COMMENT, HOME_PLAYER_COMMENT, AWAY_PLAYER_COMMENT, REPORT_TEXT, REPORT_TITLE, FIRST_QUARTER, SECOND_QUARTER, THIRD_QUARTER, FORTH_QUARTER, IMAGE, HOME_PLAYER_ID, AWAY_PLAYER_ID FROM REPORT" DeleteCommand="DELETE FROM [REPORT] WHERE [ID] = @ID" InsertCommand="INSERT INTO REPORT(GAME_ID, HOME_COACH_COMMENT, AWAY_COACH_COMMENT, HOME_PLAYER_COMMENT, AWAY_PLAYER_COMMENT, REPORT_TEXT, REPORT_TITLE, FIRST_QUARTER, SECOND_QUARTER, THIRD_QUARTER, FORTH_QUARTER, IMAGE, HOME_PLAYER_ID, AWAY_PLAYER_ID) VALUES (@GAME_ID, @HOME_COACH_COMMENT, @AWAY_COACH_COMMENT, @HOME_PLAYER_COMMENT, @AWAY_PLAYER_COMMENT, @REPORT_TEXT, @REPORT_TITLE, @FIRST_QUARTER, @SECOND_QUARTER, @THIRD_QUARTER, @FORTH_QUARTER, CAST(@GAME_ID AS NVARCHAR) + '.jpg', @HOME_PLAYER_ID, @AWAY_PLAYER_ID)" UpdateCommand="UPDATE REPORT SET GAME_ID = @GAME_ID, HOME_COACH_COMMENT = @HOME_COACH_COMMENT, AWAY_COACH_COMMENT = @AWAY_COACH_COMMENT, HOME_PLAYER_COMMENT = @HOME_PLAYER_COMMENT, AWAY_PLAYER_COMMENT = @AWAY_PLAYER_COMMENT, REPORT_TEXT = @REPORT_TEXT, REPORT_TITLE = @REPORT_TITLE, FIRST_QUARTER = @FIRST_QUARTER, SECOND_QUARTER = @SECOND_QUARTER, THIRD_QUARTER = @THIRD_QUARTER, FORTH_QUARTER = @FORTH_QUARTER, IMAGE = CAST(@GAME_ID AS NVARCHAR) + '.jpg', HOME_PLAYER_ID = @HOME_PLAYER_ID, AWAY_PLAYER_ID = @AWAY_PLAYER_ID WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GAME_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="HOME_COACH_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="AWAY_COACH_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="HOME_PLAYER_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="AWAY_PLAYER_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="REPORT_TEXT" Type="String"></asp:Parameter>
            <asp:Parameter Name="REPORT_TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="FIRST_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="SECOND_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="THIRD_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="FORTH_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="HOME_PLAYER_ID"></asp:Parameter>
            <asp:Parameter Name="AWAY_PLAYER_ID"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GAME_ID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="HOME_COACH_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="AWAY_COACH_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="HOME_PLAYER_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="AWAY_PLAYER_COMMENT" Type="String"></asp:Parameter>
            <asp:Parameter Name="REPORT_TEXT" Type="String"></asp:Parameter>
            <asp:Parameter Name="REPORT_TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="FIRST_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="SECOND_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="THIRD_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="FORTH_QUARTER" Type="String"></asp:Parameter>
            <asp:Parameter Name="HOME_PLAYER_ID"></asp:Parameter>
            <asp:Parameter Name="AWAY_PLAYER_ID"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceGetGame" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT CAST(GAMES.AGONISTIKI AS VARCHAR) + 'η ΑΓΩΝΙΣΤΙΚΗ : ' + CAST(GAMES.DATE_TIME AS NVARCHAR) + ' : ' + CAST(H_TEAM.NAME AS NVARCHAR) + '-' + CAST(A_TEAM.NAME AS NVARCHAR) AS GAME, GAMES.ID FROM GAMES INNER JOIN TEAMS AS H_TEAM ON GAMES.HOME_TEAM_ID = H_TEAM.ID INNER JOIN TEAMS AS A_TEAM ON GAMES.AWAY_TEAM_ID = A_TEAM.ID LEFT OUTER JOIN REPORT ON GAMES.ID = REPORT.GAME_ID EXCEPT SELECT CAST(GAMES_1.AGONISTIKI AS VARCHAR) + 'η ΑΓΩΝΙΣΤΙΚΗ : ' + CAST(GAMES_1.DATE_TIME AS NVARCHAR) + ' : ' + CAST(H_TEAM.NAME AS NVARCHAR) + '-' + CAST(A_TEAM.NAME AS NVARCHAR) AS GAME, GAMES_1.ID FROM GAMES AS GAMES_1 INNER JOIN TEAMS AS H_TEAM ON GAMES_1.HOME_TEAM_ID = H_TEAM.ID INNER JOIN TEAMS AS A_TEAM ON GAMES_1.AWAY_TEAM_ID = A_TEAM.ID INNER JOIN REPORT AS REPORT_1 ON GAMES_1.ID = REPORT_1.GAME_ID"></asp:SqlDataSource>
    
    <!-- DEN XREIAZETAI
    <asp:SqlDataSource ID="SqlDataSourceGetEditGame" runat="server" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT CAST(GAMES_1.AGONISTIKI AS VARCHAR) + 'η ΑΓΩΝΙΣΤΙΚΗ : ' + CAST(GAMES_1.DATE_TIME AS NVARCHAR) + ' : ' + CAST(H_TEAM.NAME AS NVARCHAR) + '-' + CAST(A_TEAM.NAME AS NVARCHAR) AS GAME, GAMES_1.ID FROM GAMES AS GAMES_1 INNER JOIN TEAMS AS H_TEAM ON GAMES_1.HOME_TEAM_ID = H_TEAM.ID INNER JOIN TEAMS AS A_TEAM ON GAMES_1.AWAY_TEAM_ID = A_TEAM.ID INNER JOIN REPORT AS REPORT_1 ON GAMES_1.ID = REPORT_1.GAME_ID ORDER BY GAMES_1.ID"></asp:SqlDataSource>
        -->              
       <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server" ForeColor="Red" ValidationGroup="EDIT" ShowValidationErrors="true" />
       <asp:ValidationSummary ID="InsertValidationSum" runat="server" ForeColor="Red" ValidationGroup="INSERT" ShowValidationErrors="true" />
    
     </asp:Content>
