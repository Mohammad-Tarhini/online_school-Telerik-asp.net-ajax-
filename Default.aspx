<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <link  rel="stylesheet" href="StyleSheet1.css" />
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
       
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
        <div class="head"> hello in my school </div>
        <div class="hhh">
            <telerik:RadButton ID="RadButton1" runat="server" Text="student login " OnClick="RadButton1_Click"></telerik:RadButton>
            <telerik:RadButton ID="RadButton2" runat="server" Text="new student"  OnClick="RadButton2_Click"></telerik:RadButton>
        <telerik:RadButton ID="RadButton3" runat="server" Text="teacher login "  OnClick="RadButton3_Click" ></telerik:RadButton>
       </div >
        
        <div id="sign_in" class="form-container"  runat="server">
                      <h3>Sign In</h3>
            <asp:Label ID="lblUsername" runat="server" Text="Username:" Width="70px"></asp:Label>
           
            <asp:TextBox ID="txtUsername" runat="server" Width="90px"></asp:TextBox>
            <br />
           <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password:" Width="70px"></asp:Label>
         
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="90px"></asp:TextBox><br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
        <div id="new_student" class="form-container" runat="server">
             <h3>New Student Registration</h3>
            <asp:Label ID="Label3" runat="server" Text="student_ID" Width="120px"></asp:Label>
            <asp:TextBox ID="txtstdid" runat="server" Width="150px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblFirstName" runat="server" Text="First Name:" Width="120"></asp:Label>
            
            <asp:TextBox ID="txtFirstName" runat="server" Width="150px"></asp:TextBox><br />
           
            <br /><asp:Label ID="lblLastName" runat="server" Text="Last Name:" Width="120"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" Width="150px"></asp:TextBox ><br />
           <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email:" Width="120px"></asp:Label>
           
            <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox><br />
           <br />
            <asp:Label ID="lblDateOfBirth" runat="server" Text="Date of Birth:" Width="120px"></asp:Label>
            
            <asp:TextBox ID="txtDateOfBirth" runat="server" Width="150px"></asp:TextBox><br />
            
             
            <br />
            <asp:Label ID="RadLabel2" runat="server" Text="passward" Width="120px"></asp:Label>
            <asp:TextBox ID="txtpassward" runat="server" Width="150px"></asp:TextBox>
            <br />
            <asp:Button ID="btnRegister" runat="server" Text="Register"  OnClick="btnRegister_Click" />
        </div>

         <div ID="teacherlogin" class="form-container"  runat="server">
               <h3>teacher login </h3>
     <asp:Label ID="Label1" runat="server" Text="id:" Width="70px"></asp:Label>
    
     <asp:TextBox ID="txtteacherid" runat="server" Width="90px"></asp:TextBox><br />
    <br />
     <asp:Label ID="Label2" runat="server" Text="Password:" Width="70px"></asp:Label>
  
     <asp:TextBox ID="txttecherpassword" runat="server" TextMode="Password" Width="90px"></asp:TextBox><br />
     <br />
             <telerik:RadButton ID="tlogin" runat="server" Text="login teacher " OnClick="tlogin_Click"></telerik:RadButton>
 
         </div> 



                 <telerik:RadLabel ID="lbl" runat="server"></telerik:RadLabel>

        


    </div>
    </form>
</body>
</html>
