<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="AddCoach.aspx.cs" Inherits="AddCoach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>ΔΙΑΧΕΙΡΗΣΗ ΠΡΟΠΟΝΗΤΩΝ</h1>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID,TEAMID,COUNTRYID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemCommand="ListView1_ItemCommand">
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
                        <asp:Label ID="SURENAMELabel" runat="server" Text='<%# Eval("SURENAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FIRST_NAMELabel" runat="server" Text='<%# Eval("FIRST_NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TEAMLabel" runat="server" Text='<%# Eval("TEAM") %>' />
                    </td>
                    <td>
                        <asp:Image ID="ImagePlayerAlt" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/coaches/" + Eval("IMAGE") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" ValidationGroup="EDIT" CausesValidation="true" CommandName="Update" Text="Αλλαγή" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Ακύρωση" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SURENAMETextBox" runat="server" Text='<%# Bind("SURENAME") %>' />
                        <asp:RequiredFieldValidator ID="EditSurenameValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο SURENAME είναι υποχρεωτικό"
                            ControlToValidate="SURENAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="FIRST_NAMETextBox" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
                        <asp:RequiredFieldValidator ID="EditFirst_nameValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο FIRSTNAME είναι υποχρεωτικό"
                            ControlToValidate="FIRST_NAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlDataSource3"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListBorn" runat="server" DataSource='<%# Enumerable.Range(1910, 100) %>' SelectedValue='<%# Bind("BORN") %>'>
                            </asp:DropDownList>
                        </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TEAM_ID") %>'>
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
                        <asp:Button ID="InsertButton" runat="server" ValidationGroup="INSERT" CausesValidation="true" CommandName="Insert" Text="Εσαγωγή" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Καθαρισμός" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="SURENAMETextBox" runat="server" Text='<%# Bind("SURENAME") %>' />
                        <asp:RequiredFieldValidator ID="InsertSurenameValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο SURENAME είναι υποχρεωτικό"
                            ControlToValidate="SURENAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="FIRST_NAMETextBox" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
                        <asp:RequiredFieldValidator ID="InsertFirst_nameValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο FIRSTNAME είναι υποχρεωτικό"
                            ControlToValidate="FIRST_NAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server"
                            DataSourceID="SqlDataSource3"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>' AppendDataBoundItems="True">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertCountry_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Χώρα"
                            ControlToValidate="DropDownList3" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListInsertBorn" runat="server" AppendDataBoundItems="true" DataSource='<%# Enumerable.Range(1910, 100) %>' SelectedValue='<%# Bind("BORN") %>'>
                        <asp:ListItem>ΕΠΙΛΕΞΤΕ ΕΤΟΣ ΓΕΝΝΗΣΗΣ</asp:ListItem>    
                        </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="InsertBornValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Έτος Γέννησης"
                            ControlToValidate="DropDownListInsertBorn" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΕΤΟΣ ΓΕΝΝΗΣΗΣ" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TEAM_ID") %>' AppendDataBoundItems="true">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΟΜΑΔΑ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="InsertTeam_idValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Ομάδα"
                            ControlToValidate="DropDownList4" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΟΜΑΔΑ" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:Label ID="SURENAMELabel" runat="server" Text='<%# Eval("SURENAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FIRST_NAMELabel" runat="server" Text='<%# Eval("FIRST_NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TEAMLabel" runat="server" Text='<%# Eval("TEAM") %>' />
                    </td>
                    <td>
                        <asp:Image ID="ImagePlayer" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/coaches/" + Eval("IMAGE") %>' />
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
                                    <th runat="server">SURENAME</th>
                                    <th runat="server">FIRST_NAME</th>
                                    <th runat="server">COUNTRY</th>
                                    <th runat="server">BORN</th>
                                    <th runat="server">TEAM</th>
                                    <th runat="server">IMAGE</th>
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
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
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
                        <asp:Label ID="SURENAMELabel" runat="server" Text='<%# Eval("SURENAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="FIRST_NAMELabel" runat="server" Text='<%# Eval("FIRST_NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TEAMLabel" runat="server" Text='<%# Eval("TEAM") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IMAGELabel" runat="server" Text='<%# Eval("IMAGE") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ValidationSummary ID="ValidationSummaryEdit" ValidationGroup="EDIT" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummaryInsert" ValidationGroup="INSERT" ForeColor="Red" runat="server" />

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [COACH] WHERE [ID] = @ID" InsertCommand="INSERT INTO [COACH] ([SURENAME], [FIRST_NAME], [COUNTRY_ID], [BORN], [TEAM_ID], [IMAGE]) VALUES (@SURENAME, @FIRST_NAME, @COUNTRY_ID, @BORN, @TEAM_ID, (@FIRST_NAME + '-' + @SURENAME +'.jpg'))" SelectCommand="SELECT COACH.ID, COACH.SURENAME, COACH.FIRST_NAME, COACH.COUNTRY_ID, COACH.BORN, COACH.TEAM_ID, COACH.IMAGE, TEAMS.ID AS TEAMID, TEAMS.NAME AS TEAM, COUNTRY.ID AS COUNTRYID, COUNTRY.NAME AS COUNTRY FROM COACH INNER JOIN TEAMS ON COACH.TEAM_ID = TEAMS.ID INNER JOIN COUNTRY ON COACH.COUNTRY_ID = COUNTRY.ID ORDER BY COACH.SURENAME" UpdateCommand="UPDATE [COACH] SET [SURENAME] = @SURENAME, [FIRST_NAME] = @FIRST_NAME, [COUNTRY_ID] = @COUNTRY_ID, [BORN] = @BORN, [TEAM_ID] = @TEAM_ID, [IMAGE] = (@FIRST_NAME + '-' + @SURENAME +'.jpg') WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SURENAME" Type="String" />
                <asp:Parameter Name="FIRST_NAME" Type="String" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="BORN" Type="Int32" />
                <asp:Parameter Name="TEAM_ID" Type="Int32" />
                <asp:Parameter Name="IMAGE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SURENAME" Type="String" />
                <asp:Parameter Name="FIRST_NAME" Type="String" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="BORN" Type="Int32" />
                <asp:Parameter Name="TEAM_ID" Type="Int32" />
                <asp:Parameter Name="IMAGE" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT [ID], [NAME], [COUNTRY_ID], [CITY], [ARENA_ID], [PRESIDENT], [LOGO] FROM [TEAMS]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT [ID], [COUNTRY_CODE], [NAME] FROM [COUNTRY]"></asp:SqlDataSource>

    </div>



</asp:Content>

