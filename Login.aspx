<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DIS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Login.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
     .custom-ok-button {
        background-color: blue !important;
        color: white !important;
        border: none !important;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
    }

</style>
</head>
<body>
    <form id="form1" runat="server">
    
         <div class="login-container">
          
            <div class="login-form">
                <h2>Login</h2>  
                <p>Login to continue</p>
                
                <div class="input-field">
                    <label for="txtEmail">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                         &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Email" ForeColor="Red" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></asp:RegularExpressionValidator>
                         <br />
                         </label>
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtPassword">Password&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label><br />
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password has 8 to 12 characters" ValidationExpression="^.{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>

                         </label>
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>
                
              
                <div class="button-container">
                 
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-Login" OnClick="btnLogin_Click"/>
                </div>
                
                
                <div class="remember-me">
                    <asp:CheckBox ID="chkRememberMe" runat="server" />
                    <label for="chkRememberMe">Remember me</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton1" runat="server" CssClass="f" PostBackUrl="~/OTP/ForgotPassword.aspx">Forgot Password?</asp:LinkButton>
                </div>
                
               
                <div class="Login-link">
                    <p>Don't have an account? <a href="Singup.aspx">Sign in</a></p>
                </div>

                <div class="button-container">
                 
        <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn-Login" Height="47px" Width="166px" PostBackUrl="~/Home1.aspx" />
                </div>

            </div>
        </div>

    </form>
</body>
</html>
