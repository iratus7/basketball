<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="addgame.aspx.cs" Inherits="AddGame" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<%--    <script src="../Scripts/jquery-2.0.3.min.js"></script>--%>
     <script src="../Scripts/jquery-1.11.1.min.js"></script>  

    <script src="../Scripts/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />
    <script src="../Scripts/jquery-ui-timepicker-addon.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>ΔΙΑΧΕΙΡΗΣΗ ΑΓΩΝΩΝ</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" DeleteCommand="DELETE FROM [GAMES] WHERE [ID] = @ID" InsertCommand="INSERT INTO GAMES(AGONISTIKI, HOME_TEAM_ID, AWAY_TEAM_ID, REFEREE1_ID, REFEREE2_ID, REFEREE3_ID, ARENA_ID, DATE_TIME, HOME_TEAM_COACH_ID, AWAY_TEAM_COACH_ID) VALUES (@AGONISTIKI, @HOME_TEAM_ID, @AWAY_TEAM_ID, @REFEREE1_ID, @REFEREE2_ID, @REFEREE3_ID, @ARENA_ID, @DATE_TIME, @HOME_TEAM_COACH_ID, @AWAY_TEAM_COACH_ID)" SelectCommand="SELECT G.ID, G.AGONISTIKI, G.DATE_TIME, ARENAS.NAME AS ARENA, HT.NAME AS HOME_TEAM, AT.NAME AS AWAY_TEAM, R1.SURENAME AS REFEREE1, R2.SURENAME AS REFEREE2, R3.SURENAME AS REFEREE3, G.HOME_TEAM_ID, G.AWAY_TEAM_ID, G.REFEREE1_ID, G.REFEREE2_ID, G.REFEREE3_ID, G.ARENA_ID, G.HOME_TEAM_COACH_ID, G.AWAY_TEAM_COACH_ID FROM GAMES AS G INNER JOIN REFEREE AS R1 ON G.REFEREE1_ID = R1.ID INNER JOIN REFEREE AS R2 ON G.REFEREE2_ID = R2.ID INNER JOIN REFEREE AS R3 ON G.REFEREE3_ID = R3.ID INNER JOIN TEAMS AS HT ON G.HOME_TEAM_ID = HT.ID INNER JOIN TEAMS AS AT ON G.AWAY_TEAM_ID = AT.ID INNER JOIN ARENAS ON G.ARENA_ID = ARENAS.ID INNER JOIN COACH AS CH ON HT.ID = CH.TEAM_ID INNER JOIN COACH AS CA ON AT.ID = CA.TEAM_ID ORDER BY G.ID" UpdateCommand="UPDATE GAMES SET AGONISTIKI = @AGONISTIKI, HOME_TEAM_ID = @HOME_TEAM_ID, AWAY_TEAM_ID = @AWAY_TEAM_ID, REFEREE1_ID = @REFEREE1_ID, REFEREE2_ID = @REFEREE2_ID, REFEREE3_ID = @REFEREE3_ID, ARENA_ID = @ARENA_ID, DATE_TIME = @DATE_TIME, HOME_TEAM_COACH_ID = @HOME_TEAM_COACH_ID, AWAY_TEAM_COACH_ID = @AWAY_TEAM_COACH_ID WHERE (ID = @ID)">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AGONISTIKI" Type="Int32" />
                <asp:Parameter Name="HOME_TEAM_ID" Type="Int32" />
                <asp:Parameter Name="AWAY_TEAM_ID" Type="Int32" />
                <asp:Parameter Name="REFEREE1_ID" Type="Int32" />
                <asp:Parameter Name="REFEREE2_ID" Type="Int32" />
                <asp:Parameter Name="REFEREE3_ID" Type="Int32" />
                <asp:Parameter Name="ARENA_ID" Type="Int32" />
                <asp:Parameter Name="DATE_TIME" Type="DateTime" />
                <asp:Parameter Name="HOME_TEAM_COACH_ID" Type="Int32"/>
                <asp:Parameter Name="AWAY_TEAM_COACH_ID" Type="Int32"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AGONISTIKI" Type="Int32" />
                <asp:Parameter Name="HOME_TEAM_ID" Type="Int32" />
                <asp:Parameter Name="AWAY_TEAM_ID" Type="Int32" />
                <asp:Parameter Name="REFEREE1_ID" Type="Int32" />
                <asp:Parameter Name="REFEREE2_ID" Type="Int32" />
                <asp:Parameter Name="REFEREE3_ID" Type="Int32" />
                <asp:Parameter Name="ARENA_ID" Type="Int32" />
                <asp:Parameter Name="DATE_TIME" Type="DateTime" />
                <asp:Parameter Name="HOME_TEAM_COACH_ID" Type="Int32"/>
                <asp:Parameter Name="AWAY_TEAM_COACH_ID" Type="Int32"/>
                <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            AGONISTIKI:
            <asp:DropDownList ID="DropDownListAgonistiki" runat="server" DataSource='<%# Enumerable.Range(1, 100) %>' SelectedValue='<%# Bind("AGONISTIKI") %>'>
            </asp:DropDownList>
            <br />
            DATE_TIME:
            <input type="datetime" id="selectedDateTime" class="selectedDateTime" runat="server" value='<%# Bind("DATE_TIME") %>' />
                    
            <%--  <asp:TextBox ID="TextBoxDatetime" runat="server" Text='<%# Bind("DATE_TIME") %>'></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBoxDatetime"></asp:CalendarExtender>
            <asp:DropDownList runat="server" ID="hourddl" DataSource='<%# Enumerable.Range(1, 12) %>'></asp:DropDownList>
            <asp:DropDownList runat="server" ID="MinutesDdl" DataSource='<%# Enumerable.Range(1, 59) %>'></asp:DropDownList>
            <asp:DropDownList runat="server" ID="AMPMddl">
                <asp:ListItem>πμ</asp:ListItem>
                <asp:ListItem>μμ</asp:ListItem>
            </asp:DropDownList>
            --%>

            <br />
            ARENA:
            <asp:DropDownList ID="DropDownListArena" runat="server"
                DataSourceID="SqlDataGetArena"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("ARENA_ID") %>'>
            </asp:DropDownList>
            <br />
            HOME_TEAM:
            <asp:DropDownList ID="DropDownListHometeam" runat="server"
                DataSourceID="SqlDataGetTeams"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("HOME_TEAM_ID") %>'>
            </asp:DropDownList>
            <br />
            AWAY_TEAM:
            <asp:DropDownList ID="DropDownListAwayteam" runat="server"
                DataSourceID="SqlDataGetTeams"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("AWAY_TEAM_ID") %>'>
            </asp:DropDownList>
            <asp:CompareValidator ID="CompareValidateEditTeams" runat="server" ValidationGroup="EDIT"
                ControlToValidate="DropDownListHometeam"
                ControlToCompare="DropDownListAwayteam"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικές ομάδες" />
            <br />
            REFEREE1:
            <asp:DropDownList ID="DropDownListReferee1" runat="server"
                DataSourceID="SqlDataGetReferee"
                DataTextField="REFEREE_FULLNAME" DataValueField="ID" SelectedValue='<%# Bind("REFEREE1_ID") %>'>
            </asp:DropDownList>
            <br />
            REFEREE2:
            <asp:DropDownList ID="DropDownListReferee2" runat="server"
                DataSourceID="SqlDataGetReferee"
                DataTextField="REFEREE_FULLNAME" DataValueField="ID" SelectedValue='<%# Bind("REFEREE2_ID") %>'>
            </asp:DropDownList>
            <br />
            REFEREE3:
            <asp:DropDownList ID="DropDownListReferee3" runat="server"
                DataSourceID="SqlDataGetReferee"
                DataTextField="REFEREE_FULLNAME" DataValueField="ID" SelectedValue='<%# Bind("REFEREE3_ID") %>'>
            </asp:DropDownList>
            <asp:HiddenField runat="server" ID="HomeCLabel" Value='<%# Bind("HOME_TEAM_COACH_ID") %>' />
            <asp:HiddenField runat="server" ID="AwayCLabel" Value='<%# Bind("AWAY_TEAM_COACH_ID") %>'></asp:HiddenField>        
            
            <asp:CompareValidator ID="CompareValidateEditReferee1_2" runat="server" ValidationGroup="EDIT"
                ControlToValidate="DropDownListReferee1"
                ControlToCompare="DropDownListReferee2"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικούς διαιτητές"></asp:CompareValidator>

            <asp:CompareValidator ID="CompareValidateEditReferee2_3" runat="server" ValidationGroup="EDIT"
                ControlToValidate="DropDownListReferee2"
                ControlToCompare="DropDownListReferee3"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικούς διαιτητές"></asp:CompareValidator>

            <asp:CompareValidator ID="CompareValidateEditReferee1_3" runat="server" ValidationGroup="EDIT"
                ControlToValidate="DropDownListReferee1"
                ControlToCompare="DropDownListReferee3"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικούς διαιτητές"></asp:CompareValidator>


            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" ValidationGroup="EDIT" CausesValidation="True" CommandName="Update" Text="Αλλαγή" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Ακύρωση" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            AGONISTIKI:         
            <asp:DropDownList ID="DropDownListInsertAgonistiki" runat="server" AppendDataBoundItems="true" DataSource='<%# Enumerable.Range(1 , 100) %>' SelectedValue='<%# Bind("AGONISTIKI") %>'>
                <asp:ListItem>ΕΠΙΛΕΞΤΕ ΑΓΩΝΙΣΤΙΚΗ</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="InsertBornValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Αγωνιστική"
                ControlToValidate="DropDownListInsertAgonistiki" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΑΓΩΝΙΣΤΙΚΗ" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            DATE_TIME:

            <input type="datetime" id="selectedDateTimeIns" class="selectedDateTime" runat="server" value='<%# Bind("DATE_TIME") %>' />
            <asp:RequiredFieldValidator ID="DatetimeValidateIns" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Ημερομηνία"
                ControlToValidate="selectedDateTimeIns" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
            
            <br />
            ARENA:
            <asp:DropDownList ID="DropDownListArenaIns" runat="server"
                DataSourceID="SqlDataGetArena"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("ARENA_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΓΗΠΕΔΟ" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="Arena_IDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Γήπεδο"
                ControlToValidate="DropDownListArenaIns" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΓΗΠΕΔΟ" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            HOME_TEAM:
            <asp:DropDownList ID="DropDownListHomeIns" runat="server"
                DataSourceID="SqlDataGetTeams"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("HOME_TEAM_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΓΗΠΕΔΟΥΧΟ" Value="0" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="HomeIDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Γηπεδούχο"
                ControlToValidate="DropDownListHomeIns" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΓΗΠΕΔΟΥΧΟ" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            AWAY_TEAM:
            <asp:DropDownList ID="DropDownListAwayIns" runat="server" 
                DataSourceID="SqlDataGetTeams"
                DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("AWAY_TEAM_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ ΦΙΛΟΞΕΝΟΥΜΕΝΟ" Value="0" />
            </asp:DropDownList>

            <asp:HiddenField runat="server" ID="HomeCoachLabel" Value='<%# Bind("HOME_TEAM_COACH_ID") %>' />
            <asp:HiddenField runat="server" ID="AwayCoachLabel" Value='<%# Bind("AWAY_TEAM_COACH_ID") %>'></asp:HiddenField>

            <asp:RequiredFieldValidator ID="AwayIDValidate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε Φιλοξενούμενο"
                ControlToValidate="DropDownListAwayIns" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ ΦΙΛΟΞΕΝΟΥΜΕΝΟ" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CompareValidateTeams" runat="server" ValidationGroup="INSERT"
                ControlToValidate="DropDownListHomeIns"
                ControlToCompare="DropDownListAwayIns"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικές ομάδες" />
            <br />
            REFEREE1:
            <asp:DropDownList ID="DropDownListRef1ns" runat="server"
                DataSourceID="SqlDataGetReferee"
                DataTextField="REFEREE_FULLNAME" DataValueField="ID" SelectedValue='<%# Bind("REFEREE1_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ 1o ΔΙΑΙΤΗΤΗ" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="Ref1Validate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε 1o Διαιτητή"
                ControlToValidate="DropDownListRef1ns" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ 1o ΔΙΑΙΤΗΤΗ" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            REFEREE2:
            <asp:DropDownList ID="DropDownListRef2Ins" runat="server"
                DataSourceID="SqlDataGetReferee"
                DataTextField="REFEREE_FULLNAME" DataValueField="ID" SelectedValue='<%# Bind("REFEREE2_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ 2o ΔΙΑΙΤΗΤΗ" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="Ref2Validate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε 2o Διαιτητή"
                ControlToValidate="DropDownListRef2Ins" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ 2o ΔΙΑΙΤΗΤΗ" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            REFEREE3:
            <asp:DropDownList ID="DropDownListRef3Ins" runat="server"
                DataSourceID="SqlDataGetReferee"
                DataTextField="REFEREE_FULLNAME" DataValueField="ID" SelectedValue='<%# Bind("REFEREE3_ID") %>' AppendDataBoundItems="True">
                <asp:ListItem Text="ΕΠΙΛΕΞΤΕ 3o ΔΙΑΙΤΗΤΗ" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="Ref3Validate" runat="server" ValidationGroup="INSERT" ErrorMessage="Παρακαλώ Επιλέξτε 3o Διαιτητή"
                ControlToValidate="DropDownListRef3Ins" Text="*" InitialValue="ΕΠΙΛΕΞΤΕ 3o ΔΙΑΙΤΗΤΗ" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CompareValidateReferee1_2" runat="server" ValidationGroup="INSERT"
                ControlToValidate="DropDownListRef1ns"
                ControlToCompare="DropDownListRef2Ins"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικούς διαιτητές"></asp:CompareValidator>

            <asp:CompareValidator ID="CompareValidator2_3" runat="server" ValidationGroup="INSERT"
                ControlToValidate="DropDownListRef2Ins"
                ControlToCompare="DropDownListRef3Ins"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικούς διαιτητές"></asp:CompareValidator>

            <asp:CompareValidator ID="CompareValidator1_3" runat="server" ValidationGroup="INSERT"
                ControlToValidate="DropDownListRef1ns"
                ControlToCompare="DropDownListRef3Ins"
                Type="String"
                Operator="NotEqual"
                ErrorMessage="Παρακαλώ επιλέξτε διαφορετικούς διαιτητές"></asp:CompareValidator>

            <br />
            <asp:LinkButton ID="InsertButton" runat="server" ValidationGroup="INSERT" CausesValidation="True" CommandName="Insert" Text="Εισαγωγή" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Ακύρωση" />
        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            AGONISTIKI:
            <asp:Label ID="AGONISTIKILabel" runat="server" Text='<%# Bind("AGONISTIKI") %>' />
            <br />
            DATE_TIME:
            <asp:Label ID="DATE_TIMELabel" runat="server" Text='<%# Bind("DATE_TIME") %>' />
            <br />
            ARENA:
            <asp:Label ID="ARENALabel" runat="server" Text='<%# Bind("ARENA") %>' />
            <br />
            HOME_TEAM:
            <asp:Label ID="Label1" runat="server" Text='<%# Bind("HOME_TEAM") %>' />
            <br />
            AWAY_TEAM:
            <asp:Label ID="AWAY_TEAMLabel" runat="server" Text='<%# Bind("AWAY_TEAM") %>' />
            <br />
            REFEREE1:
            <asp:Label ID="REFEREE1_IDLabel" runat="server" Text='<%# Bind("REFEREE1") %>' />
            <br />
            REFEREE2:
            <asp:Label ID="REFEREE2_IDLabel" runat="server" Text='<%# Bind("REFEREE2")%>' />
            <br />
            REFEREE3:
            <asp:Label ID="REFEREE3_IDLabel" runat="server" Text='<%# Bind("REFEREE3") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Επεξεργασία" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Διαγραφή" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Εισαγωγή" />
        </ItemTemplate>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#5D7B9D" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    <asp:ValidationSummary ID="ValidationSummaryInsert" ValidationGroup="INSERT" ForeColor="Red" runat="server" />
    <asp:ValidationSummary ID="ValidationSummaryEdit" ValidationGroup="EDIT" ForeColor="Red" runat="server" />
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />



    <asp:SqlDataSource ID="SqlDataGetTeams" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT * FROM [TEAMS]" DeleteCommand="DELETE FROM [TEAMS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TEAMS] ([NAME], [COUNTRY_ID], [CITY], [ARENA_ID], [PRESIDENT], [LOGO]) VALUES (@NAME, @COUNTRY_ID, @CITY, @ARENA_ID, @PRESIDENT, @LOGO)" UpdateCommand="UPDATE [TEAMS] SET [NAME] = @NAME, [COUNTRY_ID] = @COUNTRY_ID, [CITY] = @CITY, [ARENA_ID] = @ARENA_ID, [PRESIDENT] = @PRESIDENT, [LOGO] = @LOGO WHERE [ID] = @ID">
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
    <asp:SqlDataSource ID="SqlDataGetReferee" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT ID, SURENAME, FIRST_NAME, COUNTRY_ID, BORN, SURENAME + '-' + FIRST_NAME AS REFEREE_FULLNAME FROM REFEREE" DeleteCommand="DELETE FROM [REFEREE] WHERE [ID] = @ID" InsertCommand="INSERT INTO [REFEREE] ([SURENAME], [FIRST_NAME], [COUNTRY_ID], [BORN]) VALUES (@SURENAME, @FIRST_NAME, @COUNTRY_ID, @BORN)" UpdateCommand="UPDATE [REFEREE] SET [SURENAME] = @SURENAME, [FIRST_NAME] = @FIRST_NAME, [COUNTRY_ID] = @COUNTRY_ID, [BORN] = @BORN WHERE [ID] = @ID">
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
    <asp:SqlDataSource ID="SqlDataGetArena" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT * FROM [ARENAS]" DeleteCommand="DELETE FROM [ARENAS] WHERE [ID] = @ID" InsertCommand="INSERT INTO [ARENAS] ([NAME], [CITY], [COUNTRY_ID], [ATTENDANCE], [IMAGE]) VALUES (@NAME, @CITY, @COUNTRY_ID, @ATTENDANCE, @IMAGE)" UpdateCommand="UPDATE [ARENAS] SET [NAME] = @NAME, [CITY] = @CITY, [COUNTRY_ID] = @COUNTRY_ID, [ATTENDANCE] = @ATTENDANCE, [IMAGE] = @IMAGE WHERE [ID] = @ID">
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
    <script>
        $('.selectedDateTime').datetimepicker({
            dateFormat: "dd-mm-yy",
            timeFormat: "hh:mm tt"
        });


       </script>


</asp:Content>

