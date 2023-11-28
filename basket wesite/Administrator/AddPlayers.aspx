<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="AddPlayers.aspx.cs" Inherits="AddPlayers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>ΔΙΑΧΕΙΡΗΣΗ ΠΑΙΧΤΩΝ</h1>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID,IDOTEAM,IDOCOUNTRY" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemCommand="ListView1_ItemCommand">
            <AlternatingItemTemplate>
                <tr style="background-color: #fff7f1; color: #800000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Διαγραφή" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Επεξεργασία" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NOLabel" runat="server" Text='<%# Eval("NO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SURNAMELabel" runat="server" Text='<%# Eval("SURNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FIRSTNAMELabel" runat="server" Text='<%# Eval("FIRSTNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="POSITIONLabel" runat="server" Text='<%# Eval("POSITION") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HEIGHTLabel" runat="server" Text='<%# Eval("HEIGHT") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                    </td>
                    <td>
                        <asp:Image ID="ImagePlayer" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' />
                    </td>                    
                    <td>
                        <asp:Label ID="TEAMLabel" runat="server" Text='<%# Eval("TEAM") %>' />
                    </td>

                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>

                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" ValidationGroup="EDIT" CommandName="Update" Text="Αλλαγή" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Ακύρωση" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListEditNO" runat="server" DataSource='<%# Enumerable.Range(0, 100) %>' SelectedValue='<%# Bind("NO") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="SURNAMETextBox" runat="server" Text='<%# Bind("SURNAME") %>' />
                        <asp:RequiredFieldValidator ID="EditSurenameValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο SURENAME είναι υποχρεωτικό"
                            ControlToValidate="SURNAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="FIRSTNAMETextBox" runat="server" Text='<%# Bind("FIRSTNAME") %>' />
                        <asp:RequiredFieldValidator ID="EditFirstnameValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο FIRSTNAME είναι υποχρεωτικό"
                            ControlToValidate="FIRSTNAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("POSITION") %>'>
                            <asp:ListItem>Guard</asp:ListItem>
                            <asp:ListItem>Forward</asp:ListItem>
                            <asp:ListItem>Center</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListHeight" runat="server" DataSource='<%# Enumerable.Range(130, 120).Select(x => x / 100f) %>' SelectedValue='<%# Bind("HEIGHT") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListBorn" runat="server" DataSource='<%# Enumerable.Range(1910, 100) %>' SelectedValue='<%# Bind("BORN") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RegularExpressionValidator ValidationGroup="EDIT" ID="RegularExpressionValidatorFiluploadEdit" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                            ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload1" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="NewfileuploadCustomValidator" runat="server" ValidationGroup="EDIT"
                            ToolTip="FileSize should not exceed 1mb"
                            ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                            ControlToValidate="FileUpload1"
                            OnServerValidate="checkfilesizeEdit" Text="*" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList7" runat="server"
                            DataSourceID="SqlDataSource3"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TEAM_ID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>'>
                        </asp:DropDownList>

                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" ValidationGroup="INSERT" CommandName="Insert" Text="Εισαγωγή" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Καθαρισμός" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownListInsNo" runat="server" AppendDataBoundItems="true" DataSource='<%# Enumerable.Range(0, 100) %>' SelectedValue='<%# Bind("NO") %>'>
                            <asp:ListItem>ΕΠΙΛΕΞΤΕ ΝΟΥΜΕΡΟ</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsNoValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Νούμερο"
                            ControlToValidate="DropDownListInsNo" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΝΟΥΜΕΡΟ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="SURENAMETextBox" runat="server" Text='<%# Bind("SURNAME") %>' />
                        <asp:RequiredFieldValidator ID="InsertSurenameValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο SURENAME είναι υποχρεωτικό"
                            ControlToValidate="SURENAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="FIRSTNAMETextBox" runat="server" Text='<%# Bind("FIRSTNAME") %>' />
                        <asp:RequiredFieldValidator ID="InsertFirstnameValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο FIRSTNAME είναι υποχρεωτικό"
                            ControlToValidate="FIRSTNAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListposIns" runat="server" SelectedValue='<%# Bind("POSITION") %>'>
                            <asp:ListItem>ΕΠΙΛΕΞΤΕ ΘΕΣΗ</asp:ListItem>
                            <asp:ListItem>Guard</asp:ListItem>
                            <asp:ListItem>Forward</asp:ListItem>
                            <asp:ListItem>Center</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertPositionValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Θέση"
                            ControlToValidate="DropDownListposIns" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΘΕΣΗ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListInsertHeight" runat="server" AppendDataBoundItems="true" DataSource='<%# Enumerable.Range(130 , 120).Select(x => x / 100f) %>' SelectedValue='<%# Bind("HEIGHT") %>'>
                            <asp:ListItem>ΕΠΙΛΕΞΤΕ ΥΨΟΣ</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertHeightValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Ύψος"
                            ControlToValidate="DropDownListInsertHeight" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΥΨΟΣ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListInsertBorn" runat="server" AppendDataBoundItems="true" DataSource='<%# Enumerable.Range(1910, 100) %>' SelectedValue='<%# Bind("BORN") %>'>
                            <asp:ListItem>ΕΠΙΛΕΞΤΕ ΕΤΟΣ ΓΕΝΝΗΣΗΣ</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertBornValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Έτος Γέννησης"
                            ControlToValidate="DropDownListInsertBorn" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΕΤΟΣ ΓΕΝΝΗΣΗΣ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:RegularExpressionValidator ValidationGroup="INSERT" ID="RegularExpressionValidatorFiluploadIns" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                            ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload2" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="NewfileuploadCustomValidator" runat="server" ValidationGroup="INSERT"
                            ToolTip="FileSize should not exceed 1mb"
                            ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                            ControlToValidate="FileUpload2"
                            OnServerValidate="checkfilesizeIns" Text="*" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList6" runat="server"
                            DataSourceID="SqlDataSource3"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TEAM_ID") %>' AppendDataBoundItems="true">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΟΜΑΔΑ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertTeam_idValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Ομάδα"
                            ControlToValidate="DropDownList6" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΟΜΑΔΑ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList5" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>' AppendDataBoundItems="True">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertCountry_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Χώρα"
                            ControlToValidate="DropDownList5" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #f8c083; color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Διαγραφή" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Επεξεργασία" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NOLabel" runat="server" Text='<%# Eval("NO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SURNAMELabel" runat="server" Text='<%# Eval("SURNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FIRSTNAMELabel" runat="server" Text='<%# Eval("FIRSTNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="POSITIONLabel" runat="server" Text='<%# Eval("POSITION") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HEIGHTLabel" runat="server" Text='<%# Eval("HEIGHT") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                    </td>
                    <td>
                        <asp:Image ID="ImagePlayer" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/players/" + Eval("IMAGE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TEAMLabel" runat="server" Text='<%# Eval("TEAM") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>

                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #DCDCDC; color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">ID</th>
                                    <th runat="server">NO</th>
                                    <th runat="server">SURNAME</th>
                                    <th runat="server">FIRSTNAME</th>
                                    <th runat="server">POSITION</th>
                                    <th runat="server">HEIGHT</th>
                                    <th runat="server">BORN</th>
                                    <th runat="server">IMAGE</th>
                                    <th runat="server">TEAM</th>
                                    <th runat="server">COUNTRY</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Διαγραφή" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Επεξεργασία" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NOLabel" runat="server" Text='<%# Eval("NO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SURNAMELabel" runat="server" Text='<%# Eval("SURNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FIRSTNAMELabel" runat="server" Text='<%# Eval("FIRSTNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="POSITIONLabel" runat="server" Text='<%# Eval("POSITION") %>' />
                    </td>
                    <td>
                        <asp:Label ID="HEIGHTLabel" runat="server" Text='<%# Eval("HEIGHT") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IMAGELabel" runat="server" Text='<%# Eval("IMAGE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TEAMLabel" runat="server" Text='<%# Eval("TEAM") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ValidationSummary ID="ValidationSummaryEdit" ValidationGroup="EDIT" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummaryInsert" ValidationGroup="INSERT" ForeColor="Red" runat="server" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [PLAYERS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [PLAYERS] ([NO], [SURNAME], [FIRSTNAME], [POSITION], [TEAM_ID], [COUNTRY_ID], [HEIGHT], [BORN], [IMAGE]) VALUES (@NO, @SURNAME, @FIRSTNAME, @POSITION, @TEAM_ID, @COUNTRY_ID, @HEIGHT, @BORN, (@FIRSTNAME + '-' + @SURNAME + '.jpg'))" SelectCommand="SELECT PLAYERS.ID, PLAYERS.NO, PLAYERS.SURNAME, PLAYERS.FIRSTNAME, PLAYERS.POSITION, PLAYERS.TEAM_ID, PLAYERS.COUNTRY_ID, PLAYERS.HEIGHT, PLAYERS.BORN, PLAYERS.IMAGE, TEAMS.ID AS IDOTEAM, TEAMS.NAME AS TEAM, COUNTRY.ID AS IDOCOUNTRY, COUNTRY.NAME AS COUNTRY FROM PLAYERS INNER JOIN TEAMS ON PLAYERS.TEAM_ID = TEAMS.ID INNER JOIN COUNTRY ON PLAYERS.COUNTRY_ID = COUNTRY.ID ORDER BY TEAM_ID" UpdateCommand="UPDATE [PLAYERS] SET [NO] = @NO, [SURNAME] = @SURNAME, [FIRSTNAME] = @FIRSTNAME, [POSITION] = @POSITION, [TEAM_ID] = @TEAM_ID, [COUNTRY_ID] = @COUNTRY_ID, [HEIGHT] = @HEIGHT, [BORN] = @BORN, [IMAGE] = (@FIRSTNAME + '-' + @SURNAME +'.jpg') WHERE [ID] = @ID">

            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NO" Type="Int32" />
                <asp:Parameter Name="SURNAME" Type="String" />
                <asp:Parameter Name="FIRSTNAME" Type="String" />
                <asp:Parameter Name="POSITION" Type="String" />
                <asp:Parameter Name="TEAM_ID" Type="Int32" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="HEIGHT" Type="Double" />
                <asp:Parameter Name="BORN" Type="Int32" />
                <asp:Parameter Name="IMAGE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NO" Type="Int32" />
                <asp:Parameter Name="SURNAME" Type="String" />
                <asp:Parameter Name="FIRSTNAME" Type="String" />
                <asp:Parameter Name="POSITION" Type="String" />
                <asp:Parameter Name="TEAM_ID" Type="Int32" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="HEIGHT" Type="Double" />
                <asp:Parameter Name="BORN" Type="Int32" />
                <asp:Parameter Name="IMAGE" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [TEAMS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TEAMS] ([NAME], [COUNTRY_ID], [CITY], [ARENA_ID], [PRESIDENT], [LOGO]) VALUES (@NAME, @COUNTRY_ID, @CITY, @ARENA_ID, @PRESIDENT, @LOGO)" SelectCommand="SELECT [ID], [NAME], [COUNTRY_ID], [CITY], [ARENA_ID], [PRESIDENT], [LOGO] FROM [TEAMS]" UpdateCommand="UPDATE [TEAMS] SET [NAME] = @NAME, [COUNTRY_ID] = @COUNTRY_ID, [CITY] = @CITY, [ARENA_ID] = @ARENA_ID, [PRESIDENT] = @PRESIDENT, [LOGO] = @LOGO WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="ARENA_ID" Type="Int32" />
                <asp:Parameter Name="PRESIDENT" Type="String" />
                <asp:Parameter Name="LOGO" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="ARENA_ID" Type="Int32" />
                <asp:Parameter Name="PRESIDENT" Type="String" />
                <asp:Parameter Name="LOGO" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [COUNTRY] WHERE [ID] = @ID" InsertCommand="INSERT INTO [COUNTRY] ([NAME]) VALUES (@NAME)" SelectCommand="SELECT [ID], [NAME] FROM [COUNTRY]" UpdateCommand="UPDATE [COUNTRY] SET [NAME] = @NAME WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />

    </div>
</asp:Content>

