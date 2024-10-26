<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TelerikWebApp28.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheet1.css" />    
    
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
        <telerik:RadLabel ID="RadLabel1" runat="server"></telerik:RadLabel>
        <telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  OnItemCommand="RadGrid2_ItemCommand"   >
            
            <MasterTableView DataKeyNames="semester" AutoGenerateColumns="False" >
                <DetailTables>
                    <telerik:GridTableView Name="child" runat="server" DataKeyNames="cid" DataSourceID="SqlDataSource2" AllowMultiRowSelection="true">
                        <ParentTableRelation>
                            <telerik:GridRelationFields MasterKeyField="semester" DetailKeyField="semester"></telerik:GridRelationFields>
                        </ParentTableRelation>

                        <DetailTables>
                            <telerik:GridTableView Name="grandchild" runat="server" DataKeyNames="register_id" DataSourceID="SqlDataSource3" AllowMultiRowSelection="false" >
                              
                                <ParentTableRelation>
                                    <telerik:GridRelationFields MasterKeyField="cid" DetailKeyField="cid"></telerik:GridRelationFields>
                                </ParentTableRelation>
                                
                                
                                <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                                <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                                <EditFormSettings>
                                    <EditColumn ShowNoSortIcon="False"></EditColumn>
                                </EditFormSettings>

                                <Columns>
                                    <telerik:GridBoundColumn DataField="schedule" HeaderText="Schedule" SortExpression="schedule" UniqueName="schedule"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="teacher" HeaderText="Teacher" SortExpression="teacher" UniqueName="teacher"></telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Register"  Text="registeration"></telerik:GridButtonColumn>
                               
                                    </Columns>
                            </telerik:GridTableView>
                        </DetailTables>

                        <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                        <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                        <EditFormSettings>
                            <EditColumn ShowNoSortIcon="False"></EditColumn>
                        </EditFormSettings>

                        <Columns>
                            <telerik:GridBoundColumn DataField="cid" HeaderText="Course ID" SortExpression="cid" UniqueName="cid"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="course_name" HeaderText="Course Name" SortExpression="course_name" UniqueName="course_name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="credit" HeaderText="Credit" SortExpression="credit" UniqueName="credit"></telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>

                <Columns>
                    <telerik:GridBoundColumn DataField="semester" HeaderText="Semester" SortExpression="semester" UniqueName="semester"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
           

        </telerik:RadGrid>
       
       
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
            ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString2 %>' 
            ProviderName='<%$ ConnectionStrings:online_schoolConnectionString2.ProviderName %>' 
            SelectCommand="SELECT DISTINCT semester FROM [courses]">
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ID="SqlDataSource2" 
            ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString2 %>' 
            ProviderName='<%$ ConnectionStrings:online_schoolConnectionString2.ProviderName %>' 
            SelectCommand="SELECT [cid], [course_name], [credit] FROM [courses] WHERE [semester] = @semester">
            <SelectParameters>
                <asp:Parameter Name="semester" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ID="SqlDataSource3" 
            ConnectionString='<%$ ConnectionStrings:online_schoolConnectionString2 %>' 
            ProviderName='<%$ ConnectionStrings:online_schoolConnectionString2.ProviderName %>' 
            SelectCommand="SELECT [register_id], [cid], [schedule], [teacher] FROM [open_course_to_register] WHERE [cid] = @cid">
            <SelectParameters>
                <asp:Parameter Name="cid" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>