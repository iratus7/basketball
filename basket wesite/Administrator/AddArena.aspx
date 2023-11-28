<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="AddArena.aspx.cs" Inherits="AddArena" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>ΔΙΑΧΕΙΡΗΣΗ ΓΗΠΕΔΩΝ</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [ARENAS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [ARENAS] ([NAME], [CITY], [COUNTRY_ID], [ATTENDANCE], [IMAGE]) VALUES (@NAME, @CITY, @COUNTRY_ID, @ATTENDANCE, (@NAME + '.jpg'))" SelectCommand="SELECT ARENAS.ID, ARENAS.NAME, ARENAS.CITY, ARENAS.COUNTRY_ID, ARENAS.ATTENDANCE, ARENAS.IMAGE, COUNTRY.ID AS COUNTRYID, COUNTRY.NAME AS COUNTRY FROM ARENAS INNER JOIN COUNTRY ON ARENAS.COUNTRY_ID = COUNTRY.ID ORDER BY ARENAS.NAME" UpdateCommand="UPDATE [ARENAS] SET [NAME] = @NAME, [CITY] = @CITY, [COUNTRY_ID] = @COUNTRY_ID, [ATTENDANCE] = @ATTENDANCE, [IMAGE] = (@NAME + '.jpg') WHERE [ID] = @ID">
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


        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID,COUNTRYID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemCommand="ListView1_ItemCommand">
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
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ATTENDANCELabel" runat="server" Text='<%# Eval("ATTENDANCE") %>' />
                    </td>
                    <td>
                        <asp:Image ID="IMAGEArena" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/arenas/" + Eval("IMAGE") %>' />
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
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="ATTENDANCETextBox" runat="server" Text='<%# Bind("ATTENDANCE") %>' />
                        <asp:RequiredFieldValidator ID="EditAttendanceValidate" ValidationGroup="EDIT" runat="server" ErrorMessage="Το πεδίο ATTENDANCE είναι υποχρεωτικό"
                            ControlToValidate="ATTENDANCETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                         <asp:RegularExpressionValidator ValidationGroup="EDIT" ID="RegularExpressionValidatorFiluploadEdit" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                            ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload2" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="NewfileuploadCustomValidator" runat="server" ValidationGroup="EDIT"
                            ToolTip="FileSize should not exceed 1mb"
                            ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                            ControlToValidate="FileUpload2"
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
                        <asp:Button ID="InsertButton" runat="server" ValidationGroup="INSERT" CausesValidation="true" CommandName="Insert" Text="Εισαγωγή" />
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
                        <asp:DropDownList ID="DropDownList2" runat="server"
                            DataSourceID="SqlDataSource2"
                            DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>' AppendDataBoundItems="True">
                            <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="Country_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Χώρα"
                            ControlToValidate="DropDownList2" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="ATTENDANCETextBox" runat="server" Text='<%# Bind("ATTENDANCE") %>' />
                        <asp:RequiredFieldValidator ID="InsertAttendanceValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Το πεδίο ATTENDANCE είναι υποχρεωτικό"
                            ControlToValidate="ATTENDANCETextBox" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RegularExpressionValidator ValidationGroup="INSERT" ID="RegularExpressionValidatorFiluploadIns" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                            ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload1" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
                     <asp:CustomValidator ID="NewfileuploadCustomValidator" runat="server" ValidationGroup="INSERT"
                            ToolTip="FileSize should not exceed 1mb"
                            ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                            ControlToValidate="FileUpload1"
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
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ATTENDANCELabel" runat="server" Text='<%# Eval("ATTENDANCE") %>' />
                    </td>
                    <td>
                        <asp:Image ID="IMAGEArenas" runat="server" Height="100px" Width="100px" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/arenas/" + Eval("IMAGE") %>' />
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
                                    <th runat="server">COUNTRY</th>
                                    <th runat="server">ATTENDANCE</th>
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
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ATTENDANCELabel" runat="server" Text='<%# Eval("ATTENDANCE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IMAGELabel" runat="server" Text='<%# Eval("IMAGE") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ValidationSummary ID="ValidationSummaryEdit" ValidationGroup="EDIT" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummaryInsert" ValidationGroup="INSERT" ForeColor="Red" runat="server" />

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT [ID], [COUNTRY_CODE], [NAME] FROM [COUNTRY]"></asp:SqlDataSource>


    </div>

</asp:Content>

