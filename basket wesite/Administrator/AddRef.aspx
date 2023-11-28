<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="AddRef.aspx.cs" Inherits="AddRef" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div>
            <h1>ΔΙΑΧΕΙΡΗΣΗ ΔΙΑΙΤΗΤΩΝ</h1>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID,IDOCOUNTRY" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
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
                            <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
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
                            <asp:DropDownList ID="DropDownListBorn" runat="server" DataSource='<%# Enumerable.Range(1910, 100) %>' SelectedValue='<%# Bind("BORN") %>'>
                            </asp:DropDownList>
                         </td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server"
                                DataSourceID="SqlDataSource2"
                                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                            <asp:DropDownList ID="DropDownListInsertBorn" runat="server" AppendDataBoundItems="true" DataSource='<%# Enumerable.Range(1910 , 100) %>' SelectedValue='<%# Bind("BORN") %>'>
                        <asp:ListItem>ΕΠΙΛΕΞΤΕ ΕΤΟΣ ΓΕΝΝΗΣΗΣ</asp:ListItem>    
                        </asp:DropDownList>
                       <asp:RequiredFieldValidator ID="InsertBornValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Έτος Γέννησης"
                            ControlToValidate="DropDownListInsertBorn" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΕΤΟΣ ΓΕΝΝΗΣΗΣ" ForeColor="Red"></asp:RequiredFieldValidator>
                       </td>
                        <td>

                            <asp:DropDownList ID="DropDownList2" runat="server"
                                DataSourceID="SqlDataSource2"
                                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("COUNTRY_ID") %>' AppendDataBoundItems="True">
                                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="InsertCountry_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Χώρα"
                                ControlToValidate="DropDownList2" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΧΩΡΑ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                        <td>&nbsp;</td>
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
                            <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                        </td>

                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="Tr2" runat="server" style="background-color: #DCDCDC; color: #333333;">
                                        <th id="Th1" runat="server"></th>
                                        <th id="Th2" runat="server">ID</th>
                                        <th id="Th3" runat="server">SURENAME</th>
                                        <th id="Th4" runat="server">FIRST_NAME</th>
                                        <th id="Th5" runat="server">BORN</th>
                                        <th id="Th6" runat="server">COUNTRY</th>

                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                            <asp:Label ID="BORNLabel" runat="server" Text='<%# Eval("BORN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Eval("COUNTRY") %>' />
                        </td>
                        <td>
                            <asp:Label ID="COUNTRY_IDLabel" runat="server" Text='<%# Eval("COUNTRY_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="IDOCOUNTRYLabel" runat="server" Text='<%# Eval("IDOCOUNTRY") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>                           
            <asp:ValidationSummary ID="ValidationSummaryEdit" ValidationGroup="EDIT" ForeColor="Red" runat="server" />
            <asp:ValidationSummary ID="ValidationSummaryInsert" ValidationGroup="INSERT" ForeColor="Red" runat="server" />


            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [REFEREE] WHERE [ID] = @ID" InsertCommand="INSERT INTO [REFEREE] ([SURENAME], [FIRST_NAME], [COUNTRY_ID], [BORN]) VALUES (@SURENAME, @FIRST_NAME, @COUNTRY_ID, @BORN)" SelectCommand="SELECT REFEREE.ID, REFEREE.SURENAME, REFEREE.FIRST_NAME, REFEREE.BORN, COUNTRY.NAME AS COUNTRY, REFEREE.COUNTRY_ID, COUNTRY.ID AS IDOCOUNTRY FROM REFEREE INNER JOIN COUNTRY ON REFEREE.COUNTRY_ID = COUNTRY.ID ORDER BY REFEREE.SURENAME" UpdateCommand="UPDATE [REFEREE] SET [SURENAME] = @SURENAME, [FIRST_NAME] = @FIRST_NAME, [COUNTRY_ID] = @COUNTRY_ID, [BORN] = @BORN WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SURENAME" Type="String" />
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                    <asp:Parameter Name="BORN" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SURENAME" Type="String" />
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="COUNTRY_ID" Type="Int32" />
                    <asp:Parameter Name="BORN" Type="Int32" />
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
        </div>


    </div>
</asp:Content>

