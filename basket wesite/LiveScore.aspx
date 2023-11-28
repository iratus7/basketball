<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="LiveScore.aspx.cs" Inherits="LiveScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>  <br /><table class="Livescores"><tr><td>
          <asp:Label ID="LabelAgonistiki" runat="server" Font-Size="XX-Large">ΔΕΝ ΥΠΑΡΧΟΥΝ ΣΗΜΕΡΙΝΟΙ ΑΓΩΝΕΣ</asp:Label></td><td><img src="/basket%20wesite/images/liveball.jpg" alt="" /></td></tr>
          <tr><td colspan="2">
        <asp:GridView ID="GridViewLiveChoose" runat="server" OnRowDataBound="GridViewLiveChoose_RowDataBound" BackColor="#000066">           
       </asp:GridView> </td></tr>
          <tr><td>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"
            ViewStateMode="Enabled">
   <ContentTemplate> <asp:GridView ID="GridViewTimeRemain" runat="server" CssClass="TimeRemainGrid" BackColor="Black" Font-Bold="True" Font-Size="X-Large" GridLines="Horizontal">           
       </asp:GridView></ContentTemplate>
   <Triggers>
      <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
   </Triggers>
</asp:UpdatePanel>               <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" ></asp:Timer>
</td><td><img src="/basket%20wesite/images/scoretable.jpg" alt="" /></td></tr>
            </table><br />   
</asp:Content>

