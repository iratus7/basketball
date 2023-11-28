<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/AdministratorMasterPage.master" AutoEventWireup="true" CodeFile="AddPhotos.aspx.cs" Inherits="Administrator_AddPhotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <b>ALBUM</b>
    <asp:DropDownList runat="server" ID="DdlAddPhoto" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DdlAddPhoto_SelectedIndexChanged" >
                        <asp:ListItem Text="ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ALBUM" Value="0" />

        <asp:ListItem Text="History Album" Value="1" />
        <asp:ListItem Text="Nba Album" Value="2" />
        <asp:ListItem Text="European Basketball" Value="3" />
        <asp:ListItem Text="South Americas Basketball" Value="4" />
        <asp:ListItem Text="Greek Basketball" Value="5" />
        <asp:ListItem Text="Youth Basketball" Value="6" />
        <asp:ListItem Text="Best Three Pointers" Value="7" />
        <asp:ListItem Text="Best Dunkers" Value="8" />
        <asp:ListItem Text="Best Defensive Players" Value="9" />
       
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="InsertPhotoValidate" runat="server" ValidationGroup="UPDATE" ErrorMessage="Παρακαλώ Επιλέξτε Album"
                ControlToValidate="DdlAddPhoto" Text="*" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>
    <div id="AddPhotos" runat="server">
    <table>
        
        <tr><th>ΤΙΤΛΟΣ</th><th>ΠΡΟΕΠΙΣΚΟΠΙΣΗ</th><th>ΑΝΕΒΑΣΜΑ</th></tr>
        
        <tr><td><b>1 </b><asp:TextBox runat="server" ID="t1"></asp:TextBox></td><td><asp:Image ID="Image1" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t1" ValidationGroup="UPDATE" ID="RegularExpressionValidatorTitle" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidatorFilupload1" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload1" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload1"  Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>2 </b><asp:TextBox runat="server" ID="t2"></asp:TextBox></td><td><asp:Image ID="Image2" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t2" ValidationGroup="UPDATE" ID="RegularExpressionValidator20" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload2" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload2" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload2" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>3 </b><asp:TextBox runat="server" ID="t3"></asp:TextBox></td><td><asp:Image ID="Image3" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t3" ValidationGroup="UPDATE" ID="RegularExpressionValidator21" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload3" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload3" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload3" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>4 </b><asp:TextBox runat="server" ID="t4"></asp:TextBox></td><td><asp:Image ID="Image4" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t4" ValidationGroup="UPDATE" ID="RegularExpressionValidator22" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload4" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload4" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload4" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>5 </b><asp:TextBox runat="server" ID="t5"></asp:TextBox></td><td><asp:Image ID="Image5" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t5" ValidationGroup="UPDATE" ID="RegularExpressionValidator23" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload5" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload5" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator5" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload5" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>6 </b><asp:TextBox runat="server" ID="t6"></asp:TextBox></td><td><asp:Image ID="Image6" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t6" ValidationGroup="UPDATE" ID="RegularExpressionValidator24" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload6" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload6" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator6" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload6" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>7 </b><asp:TextBox runat="server" ID="t7"></asp:TextBox></td><td><asp:Image ID="Image7" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t7" ValidationGroup="UPDATE" ID="RegularExpressionValidator25" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload7" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload7" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator7" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload7" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>8 </b><asp:TextBox runat="server" ID="t8"></asp:TextBox></td><td><asp:Image ID="Image8" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t8" ValidationGroup="UPDATE" ID="RegularExpressionValidator26" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload8" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator7" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload8" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator8" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload8" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>9 </b><asp:TextBox runat="server" ID="t9"></asp:TextBox></td><td><asp:Image ID="Image9" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t9" ValidationGroup="UPDATE" ID="RegularExpressionValidator27" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload9" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator19" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload9" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator9" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload9" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>10 </b><asp:TextBox runat="server" ID="t10"></asp:TextBox></td><td><asp:Image ID="Image10" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t10" ValidationGroup="UPDATE" ID="RegularExpressionValidator28" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload10" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator8" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload10" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator10" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload10" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>11 </b><asp:TextBox runat="server" ID="t11"></asp:TextBox></td><td><asp:Image ID="Image11" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t11" ValidationGroup="UPDATE" ID="RegularExpressionValidator29" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload11" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator9" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload11" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator11" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload11" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>12 </b><asp:TextBox runat="server" ID="t12"></asp:TextBox></td><td><asp:Image ID="Image12" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t12" ValidationGroup="UPDATE" ID="RegularExpressionValidator30" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload12" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator10" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload12" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator12" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload12" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>13 </b><asp:TextBox runat="server" ID="t13"></asp:TextBox></td><td><asp:Image ID="Image13" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t13" ValidationGroup="UPDATE" ID="RegularExpressionValidator31" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload13" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator11" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload13" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator13" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload13" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>14 </b><asp:TextBox runat="server" ID="t14"></asp:TextBox></td><td><asp:Image ID="Image14" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t14" ValidationGroup="UPDATE" ID="RegularExpressionValidator32" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload14" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator12" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload14" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator14" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload14" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>15 </b><asp:TextBox runat="server" ID="t15"></asp:TextBox></td><td><asp:Image ID="Image15" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t15" ValidationGroup="UPDATE" ID="RegularExpressionValidator33" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload15" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator13" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload15" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator15" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload15" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>16 </b><asp:TextBox runat="server" ID="t16"></asp:TextBox></td><td><asp:Image ID="Image16" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t16" ValidationGroup="UPDATE" ID="RegularExpressionValidator34" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload16" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator14" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload16" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator16" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload16" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>17 </b><asp:TextBox runat="server" ID="t17"></asp:TextBox></td><td><asp:Image ID="Image17" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t17" ValidationGroup="UPDATE" ID="RegularExpressionValidator35" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload17" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator15" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload17" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator17" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload17" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>18 </b><asp:TextBox runat="server" ID="t18"></asp:TextBox></td><td><asp:Image ID="Image18" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t18" ValidationGroup="UPDATE" ID="RegularExpressionValidator36" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload18" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator16" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload18" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator18" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload18" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>19 </b><asp:TextBox runat="server" ID="t19"></asp:TextBox></td><td><asp:Image ID="Image19" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t19" ValidationGroup="UPDATE" ID="RegularExpressionValidator37" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload19" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator17" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload19" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator19" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload19" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td><b>20 </b><asp:TextBox runat="server" ID="t20"></asp:TextBox></td><td><asp:Image ID="Image20" runat="server" AlternateText="N/A IMAGE" Width="100px" Height="100px" /><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="t20" ValidationGroup="UPDATE" ID="RegularExpressionValidator38" ValidationExpression="^[\s\S]{6,40}$" runat="server" ErrorMessage="ΜΠΟΡΕΙΤΕ ΝΑ ΕΙΣΑΓΕΤΕ ΠΕΡΙΣΣΟΤΕΡΟΥΣ ΑΠΟ 6 ΧΑΡΑΚΤΗΡΕΣ ΚΑΙ ΛΙΓΟΤΕΡΟΥΣ ΑΠΟ 40."></asp:RegularExpressionValidator></td><td><asp:FileUpload ID="FileUpload20" runat="server" />
            <asp:RegularExpressionValidator ValidationGroup="UPDATE" ID="RegularExpressionValidator18" runat="server" ErrorMessage="Μπορείτε να ανεβάσετε μόνο αρχεία .jpg"
                ValidationExpression="^(?!\..*)(?!.*\.\.)(?=.*[^.]$)([^\&quot;#%&*:<>?\\/{|}~]){1,123}\.(jpg)$" ControlToValidate="FileUpload20" Text="*" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator20" runat="server" ValidationGroup="UPDATE"
                ToolTip="FileSize should not exceed 1mb" ErrorMessage="Το Μέγεθος του Αρχείου δε Πρέπει να Ξεπερνάει το 1MByte"
                ControlToValidate="FileUpload20" Text="*" ForeColor="Red"></asp:CustomValidator></td></tr>
        <tr><td>
            <asp:Button ID="ButtonPhoto" runat="server" Text="ΕΠΙΒΕΒΑΙΩΣΗ" OnClick="ButtonPhoto_Click" CausesValidation="true" ValidationGroup="UPDATE" />   
            <asp:Button ID="ClearPhotosButton" runat="server" Text="ΚΑΘΑΡΙΣΜΟΣ" OnClick="ClearPhotosButton_Click" />   

            </td></tr>

               <asp:ValidationSummary ID="ValidationSummaryPhoto" runat="server" ForeColor="Red" ValidationGroup="UPDATE" ShowValidationErrors="true" />

    </table>

        </div>
</asp:Content>

