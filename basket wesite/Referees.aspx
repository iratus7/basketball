<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Referees.aspx.cs" Inherits="Referees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>REFEREES</h2> 
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Justify" ShowFooter="False" ShowHeader="False" BackColor="#6F4526" BorderColor="#996633" BorderWidth="2px" CellSpacing="5" GridLines="Both" CellPadding="5">
        <AlternatingItemStyle HorizontalAlign="Center" BackColor="RosyBrown"></AlternatingItemStyle>  
        <ItemStyle HorizontalAlign="Center"></ItemStyle>
        <ItemTemplate>
            REFEREE:
            <strong><asp:Label ID="LabelRef" runat="server" Text='<%# Eval("FULLNAME") %>'></asp:Label></strong></br>
            COUNTRY:
            <asp:Label Text='<%# Eval("COUNTRY") %>' runat="server" ID="COUNTRYLabel" /><asp:Image ID="ImageCountry" runat="server" AlternateText="N/A IMAGE" ImageUrl='<%# "~/images/country%20flags/" + Eval("IMAGE_COUNTRY") + ".png" %>' /><br />
            BORN:
            <asp:Label Text='<%# Eval("BORN") %>' runat="server" ID="BORNLabel" /><br />
            <br />
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballCstr %>" SelectCommand="SELECT COUNTRY.NAME AS COUNTRY, COUNTRY.COUNTRY_CODE AS IMAGE_COUNTRY, COUNTRY.ID AS IDOCOUNTRY, REFEREE.ID,(REFEREE.SURENAME+' '+REFEREE.FIRST_NAME) AS FULLNAME, REFEREE.SURENAME, REFEREE.FIRST_NAME, REFEREE.COUNTRY_ID, REFEREE.BORN FROM COUNTRY INNER JOIN REFEREE ON COUNTRY.ID = REFEREE.COUNTRY_ID WHERE (REFEREE.ID = @ID) ORDER BY REFEREE.SURENAME">
    <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
