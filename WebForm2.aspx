<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="TelerikWebApp28.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
  <link  rel="stylesheet" href="StyleSheet1.css" />
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
         <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
     <Scripts>
         <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
         <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
         <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
     </Scripts>
 </telerik:RadScriptManager>
 <script type="text/javascript">
  
 </script>
    
 <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server"></telerik:RadAjaxManager>
        <telerik:RadComboBox ID="RadComboBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="class_id" DataValueField="class_id"  AllowCustomText="True"  OnSelectedIndexChanged="RadComboBox1_SelectedIndexChanged" AutoPostBack="true" >
        </telerik:RadComboBox>
        <telerik:RadComboBox ID="RadComboBox2" runat="server" AllowCustomText="True" AutoPostBack="true" OnSelectedIndexChanged="RadComboBox2_SelectedIndexChanged"  ></telerik:RadComboBox>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString3 %>' ProviderName='<%$ ConnectionStrings:online_schoolConnectionString3.ProviderName %>' SelectCommand="SELECT [class_id] FROM [class]"></asp:SqlDataSource>
    </form>
</body>
</html>
