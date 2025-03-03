<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="DIS.Admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="A_Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
         <div class="login-container">
          
            <div class="login-form">
                <h2>Login</h2>  
                <p>Login to continue</p>
                
                <div class="input-field">
                    <label for="txtEmail">Email&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label> &nbsp;&nbsp;&nbsp; <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Email" ForeColor="Red" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></asp:RegularExpressionValidator>
                         </label>
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtPassword">Password&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="lblError1" runat="server" ForeColor="Red"></asp:Label> <br />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password has 8 to 12 characters" ValidationExpression="^.{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                         </label>
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>
                
              
                <div class="button-container">
                 
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-Login" OnClick="btnLogin_Click" />
                </div>
                
                
                <div class="remember-me">
                    <asp:CheckBox ID="chkRememberMe" runat="server" />
                    <label for="chkRememberMe">Remember me</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton1" runat="server" CssClass="f" PostBackUrl="~/Admin/Forgot-Password.aspx">Forgot Password?</asp:LinkButton>
                </div>
                

            </div>
        </div>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Admin]"></asp:SqlDataSource>

    </form>

    </body>
</html>
