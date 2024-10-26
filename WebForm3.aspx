<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="TelerikWebApp28.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
         
        <div>
            <telerik:RadListBox ID="RadListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="class_id" DataValueField="class_id" AutoPostBack="true"  OnSelectedIndexChanged="RadListBox1_SelectedIndexChanged">
         <HeaderTemplate>
        <div style="display: flex; justify-content: space-between; width: 100%; background-color: #f1f1f1; padding: 5px; border: 1px solid #ccc;">
            <span style="width: 30%; text-align: left;">class_id</span>
            <span style="width: 30%; text-align: left;">semaster</span>
            <span style="width: 40%; text-align: left;">number_of_room</span>
        </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div style="display: flex; justify-content: space-between; width: 100%; padding: 5px; border-bottom: 1px solid #eee;">
            <span style="width: 30%; text-align: left;"><%# Eval("class_id") %></span>
            <span style="width: 30%; text-align: left;"><%# Eval("semaster") %></span>
            <span style="width: 30%; text-align: left;"><%# Eval("number_of_room") %></span>
        </div>
    </ItemTemplate>
            </telerik:RadListBox>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString4 %>' ProviderName='<%$ ConnectionStrings:online_schoolConnectionString4.ProviderName %>' SelectCommand="SELECT * FROM [class]"></asp:SqlDataSource>
            
            <telerik:RadListBox ID="RadListBox2" runat="server" DataSourceID="SqlDataSource2" DataTextField="student_id" SelectionMode="Multiple" DataValueField="student_id" AutoPostBack="true"  OnSelectedIndexChanged="RadListBox2_SelectedIndexChanged"    >
                     <HeaderTemplate>
    <div style="display: flex; justify-content: space-between; width: 100%;width:400px; background-color: #f1f1f1; padding: 5px; border: 1px solid #ccc;">
        <span style="width: 30%; text-align: left;">student_id</span>
        <span style="width: 30%; text-align: left;">FirstName</span>
        <span style="width: 30%; text-align: left;">class</span>
    </div>
</HeaderTemplate>
<ItemTemplate>
    <div style="display: flex; justify-content: space-between; width: 100%;width:400px; padding: 5px; border-bottom: 1px solid #eee;">
        <span style="width: 30%; text-align: left;"><%# Eval("student_id") %></span>
        <span style="width: 30%; text-align: left;"><%# Eval("FirstName") %></span>
        <span style="width: 30%; text-align: left;"><%# Eval("class") %></span>
    </div>
</ItemTemplate>
            </telerik:RadListBox>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString4 %>' ProviderName='<%$ ConnectionStrings:online_schoolConnectionString4.ProviderName %>' SelectCommand="SELECT * FROM [students] where class = @class_id">
                            <SelectParameters>
                    <asp:ControlParameter ControlID="RadListBox1" PropertyName="SelectedValue" Name="class_id" Type="string" />
                </SelectParameters>
                        </asp:SqlDataSource>
            <telerik:RadButton ID="RadButton1" runat="server" Text="RadButton"></telerik:RadButton>
            <br />
                    <telerik:RadListBox ID="RadListBox3" runat="server" DataSourceID="SqlDataSource3" DataTextField="cid" DataValueField="cid" CheckBoxes="true" AutoPostBack="true"     >
     <HeaderTemplate>
    <div style="display: flex; justify-content: space-between; width: 100%; width:500px; background-color: #f1f1f1; padding: 5px; border: 1px solid #ccc;">
        <span style="width: 30%; text-align: left;">cid</span>
        <span style="width: 30%; text-align: left;">course_name</span>
        <span style="width: 40%; text-align: left;">credit</span>
    </div>
</HeaderTemplate>
<ItemTemplate>
    <div style="display: flex; justify-content: space-between; width: 100%;width:500px; border-bottom: 1px solid #eee;">
        <span style="width: 30%; text-align: left;"><%# Eval("cid") %></span>
        <span style="width: 30%; text-align: left;"><%# Eval("course_name") %></span>
        <span style="width: 30%; text-align: left;"><%# Eval("credit") %></span>
    </div>
</ItemTemplate>
        </telerik:RadListBox>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString4 %>' ProviderName='<%$ ConnectionStrings:online_schoolConnectionString4.ProviderName %>' SelectCommand="SELECT * FROM [courses] where semester = @semester_id">
            <SelectParameters>
    <asp:ControlParameter ControlID="RadListBox1" PropertyName="SelectedValue" Name="semester_id" Type="string" />
</SelectParameters>
        </asp:SqlDataSource>


            </div>
                     
    </form>
</body>
</html>
