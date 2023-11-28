<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="LatestNews.aspx.cs" Inherits="LatestNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>ΔΙΑΧΕΙΡΗΣΗ 5 ΤΕΛΕΥΤΑΙΩΝ ΕΝΗΜΕΡΩΣΕΩΝ</h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceLatestNews" OnDataBound="FormView1_DataBound" OnItemUpdated="FormView1_ItemUpdated" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
            NEO:           
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1"  />/5<br />
            ΜΕ ΜΙΑ ΛΕΞΗ:
            <asp:TextBox Text='<%# Bind("ONE_WORD") %>' runat="server" ID="ONE_WORDTextBox" Rows="1" MaxLength="15" Width="250px" />
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="ONE_WORDTextBox" ValidationGroup="UPDATE" ID="RegularExpressionValidatorONE_WORD" ValidationExpression="^[\s\S]{2,15}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 2 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 15."></asp:RegularExpressionValidator>
            <br />
            ΤΙΤΛΟΣ:
            <asp:TextBox Text='<%# Bind("TITLE") %>' runat="server" ID="TITLETextBox" Rows="5" MaxLength="40" Width="550px" TextMode="MultiLine"  />
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TITLETextBox" ValidationGroup="UPDATE" ID="RegularExpressionValidatorTitle" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator>
            <br />
            ΚΕΙΜΕΝΟ:
            <asp:TextBox Text='<%# Bind("TEXT") %>' runat="server" ID="TEXTTextBox" Rows="10" MaxLength="400" Width="550px" TextMode="MultiLine"/>
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="TEXTTextBox" ValidationGroup="UPDATE" ID="RegularExpressionValidatorText" ValidationExpression="^[\s\S]{6,400}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 400."></asp:RegularExpressionValidator>
            <br />
            LINK:
            <asp:TextBox Text='<%# Bind("LINK") %>' runat="server" ID="LINKTextBox" Rows="1" MaxLength="30" Width="550px" />
            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="LINKTextBox" ValidationGroup="UPDATE" ID="RegularExpressionValidatorLink" ValidationExpression="^[\s\S]{4,30}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 4 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 30."></asp:RegularExpressionValidator>
            <br />
            ΦΩΤΟΓΡΑΦΙΑ:
            <asp:Image ID="ImageEdit" runat="server" AlternateText="N/A IMAGE" Width="800px" Height="300px" />
            <asp:FileUpload ID="FileUploadSlider" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidatorFilupload1" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUploadSlider" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUploadSlider"  Text="*" ForeColor="Red"></asp:CustomValidator>
            <br />
            <asp:LinkButton runat="server" Text="Αλλαγή" CommandName="Update" ID="UpdateButton" CausesValidation="True" ValidationGroup="UPDATE"/>&nbsp;<asp:LinkButton runat="server" Text="Ακύρωση" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>  
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />      
        <ItemTemplate>
            NEO:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" />/5<br />
            ΜΕ ΜΙΑ ΛΕΞΗ:
            <asp:Label Text='<%# Bind("ONE_WORD") %>' runat="server" ID="ONEWORDLabel" /><br />
            ΤΙΤΛΟΣ:
            <asp:Label Text='<%# Bind("TITLE") %>' runat="server" ID="TITLELabel" /><br />
            ΚΕΙΜΕΝΟ:
            <asp:Label Text='<%# Bind("TEXT") %>' runat="server" ID="TEXTLabel" /><br />
            LINK:
            <asp:Label Text='<%# Bind("LINK") %>' runat="server" ID="LINKLabel" /><br />
            ΦΩΤΟΓΡΑΦΙΑ:
            <asp:Image ID="Image1" runat="server" AlternateText="N/A IMAGE" Width="800px" Height="300px" /><br />
            <asp:LinkButton runat="server" Text="Επεξεργασία" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#5D7B9D" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    <asp:ValidationSummary ID="ValidationSummaryLatestNews" runat="server" ForeColor="Red" ValidationGroup="UPDATE" ShowValidationErrors="true" />
    <asp:SqlDataSource runat="server" ID="SqlDataSourceLatestNews" ConnectionString='<%$ ConnectionStrings:BasketballCstr %>' SelectCommand="SELECT [ID], [TITLE], [TEXT], [ONE_WORD], [LINK] FROM [LATEST_NEWS]" UpdateCommand="UPDATE LATEST_NEWS SET TITLE = @TITLE, TEXT = @TEXT, ONE_WORD = @ONE_WORD, LINK = @LINK WHERE (ID = @ID)">
        <UpdateParameters>
            <asp:Parameter Name="TITLE" Type="String"></asp:Parameter>
            <asp:Parameter Name="TEXT" Type="String"></asp:Parameter>
            <asp:Parameter Name="ONE_WORD" Type="String"></asp:Parameter>
            <asp:Parameter Name="LINK" Type="String"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

