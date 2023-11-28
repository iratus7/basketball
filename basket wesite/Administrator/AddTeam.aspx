<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="AddTeam.aspx.cs" Inherits="AddTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>ΔΙΑΧΕΙΡΗΣΗ ΟΜΑΔΩΝ</h1>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID,ARENAID,COUNTRYID" DataSourceID="SqlDataSource3" InsertItemPosition="LastItem" OnItemCommand="ListView1_ItemCommand">
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
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PRESIDENTLabel" runat="server" Text='<%# Eval("PRESIDENT") %>' />
                    </td>
                    <td>
                        <asp:Image ID="LogoTeam" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ARENALabel" runat="server" Text='<%# Eval("ARENA") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #008A8C; color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" ValidationGroup="EDIT" CommandName="Update" Text="Αλλαγή" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Ακύρωση" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <asp:RequiredFieldValidator ID="EditNameValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο NAME είναι υποχρεωτικό"
                            ControlToValidate="NAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                        <asp:RequiredFieldValidator ID="EditCityValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο CITY είναι υποχρεωτικό"
                            ControlToValidate="CITYTextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PRESIDENTTextBox" runat="server" Text='<%# Bind("PRESIDENT") %>' />
                        <asp:RequiredFieldValidator ID="EditPresidentValidate" runat="server" ValidationGroup="EDIT" ErrorMessage="Το πεδίο PRESIDENT είναι υποχρεωτικό"
                            ControlToValidate="PRESIDENTTextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:RegularExpressionValidator ValidationGroup="EDIT" ID="RegularExpressionValidatorFiluploadEdit" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .png"
                            ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(png)$" ControlToValidate="FileUpload2" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>

                        <asp:CustomValidator ID="NewfileuploadCustomValidator" runat="server" ValidationGroup="EDIT"
                            ToolTip="FileSize should not exceed 1mb"
                            ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                            ControlToValidate="FileUpload2"
                            OnServerValidate="checkfilesizeEdit" Text="*" ForeColor="Red"></asp:CustomValidator>

                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList8" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("ARENA_ID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList9" runat="server"
                            DataSourceID="SqlDataSource1"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FF6600; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <asp:RequiredFieldValidator ID="InsertNameValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο NAME είναι υποχρεωτικό"
                            ControlToValidate="NAMETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                        <asp:RequiredFieldValidator ID="InsertCityValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο CITY είναι υποχρεωτικό"
                            ControlToValidate="CITYTextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="PRESIDENTTextBox" runat="server" Text='<%# Bind("PRESIDENT") %>' />
                        <asp:RequiredFieldValidator ID="InsertPresidentValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο PRESIDENT είναι υποχρεωτικό"
                            ControlToValidate="PRESIDENTTextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RegularExpressionValidator ValidationGroup="INSERT" ID="RegularExpressionValidatorFiluploadIns" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .png"
                            ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(png)$" ControlToValidate="FileUpload1" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="fileuploadCustomValidateIns" runat="server" ValidationGroup="INSERT"
                            ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                            ControlToValidate="FileUpload1" OnServerValidate="checkfilesizeIns" Text="*" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("ARENA_ID") %>' AppendDataBoundItems="True">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΓΗΠΕΔΟ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="Arena_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Γήπεδο"
                            ControlToValidate="DropDownList1" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΓΗΠΕΔΟ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server"
                            DataSourceID="SqlDataSource1"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>' AppendDataBoundItems="True">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΕΘΝΙΚΟΤΗΤΑ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="Country_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Εθνικότητα"
                            ControlToValidate="DropDownList2" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΕΘΝΙΚΟΤΗΤΑ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #f8c083; color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Διαγραφή" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Επεξεργασία" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PRESIDENTLabel" runat="server" Text='<%# Eval("PRESIDENT") %>' />
                    </td>
                    <td>
                        <asp:Image ID="LogoTeam" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/teams/" + Eval("LOGO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ARENALabel" runat="server" Text='<%# Eval("ARENA") %>' />
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
                                    <th runat="server">NAME</th>
                                    <th runat="server">CITY</th>
                                    <th runat="server">PRESIDENT</th>
                                    <th runat="server">LOGO</th>
                                    <th runat="server">ARENA</th>
                                    <th runat="server">COUNTRY</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
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
                <tr style="background-color: #008A8C; font-weight: bold; color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Διαγραφή" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Επεξεργασία" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PRESIDENTLabel" runat="server" Text='<%# Eval("PRESIDENT") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LOGOLabel" runat="server" Text='<%# Eval("LOGO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ARENALabel" runat="server" Text='<%# Eval("ARENA") %>' />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [TEAMS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TEAMS] ([NAME], [COUNTRY_ID], [CITY], [ARENA_ID], [PRESIDENT], [LOGO]) VALUES (@NAME, @COUNTRY_ID, @CITY, @ARENA_ID, @PRESIDENT, (@NAME + '.png'))" SelectCommand="SELECT TEAMS.ID, TEAMS.NAME, TEAMS.COUNTRY_ID, TEAMS.CITY, TEAMS.ARENA_ID, TEAMS.PRESIDENT, TEAMS.LOGO, ARENAS.ID AS ARENAID, ARENAS.NAME AS ARENA, COUNTRY.ID AS COUNTRYID, COUNTRY.NAME AS COUNTRY FROM TEAMS INNER JOIN COUNTRY ON TEAMS.COUNTRY_ID = COUNTRY.ID INNER JOIN ARENAS ON TEAMS.ARENA_ID = ARENAS.ID ORDER BY TEAMS.NAME" UpdateCommand="UPDATE [TEAMS] SET [NAME] = @NAME, [COUNTRY_ID] = @COUNTRY_ID, [CITY] = @CITY, [ARENA_ID] = @ARENA_ID, [PRESIDENT] = @PRESIDENT, [LOGO] = (@NAME + '.png') WHERE [ID] = @ID">
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [ARENAS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [ARENAS] ([NAME], [CITY], [COUNTRY_ID], [ATTENDANCE], [IMAGE]) VALUES (@NAME, @CITY, @COUNTRY_ID, @ATTENDANCE, @IMAGE)" SelectCommand="SELECT [ID], [NAME], [CITY], [COUNTRY_ID], [ATTENDANCE], [IMAGE] FROM [ARENAS]" UpdateCommand="UPDATE [ARENAS] SET [NAME] = @NAME, [CITY] = @CITY, [COUNTRY_ID] = @COUNTRY_ID, [ATTENDANCE] = @ATTENDANCE, [IMAGE] = @IMAGE WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="ATTENDANCE" Type="Int32" />
                <asp:Parameter Name="IMAGE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                <asp:Parameter Name="ATTENDANCE" Type="Int32" />
                <asp:Parameter Name="IMAGE" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [COUNTRY] WHERE [ID] = @ID" InsertCommand="INSERT INTO [COUNTRY] ([COUNTRY_CODE], [NAME]) VALUES (@COUNTRY_CODE, @NAME)" SelectCommand="SELECT [ID], [COUNTRY_CODE], [NAME] FROM [COUNTRY]" UpdateCommand="UPDATE [COUNTRY] SET [COUNTRY_CODE] = @COUNTRY_CODE, [NAME] = @NAME WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COUNTRY_CODE" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COUNTRY_CODE" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
</asp:Content>

