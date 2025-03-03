<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Singup.aspx.cs" Inherits="DIS.Singup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Singup.css" rel="stylesheet" />
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="signup-container">
            <!-- Sign Up Form -->
            <div class="signup-form">
                <h2>Sign up</h2>
                <p>Sign up to continue</p>
                
                <div class="input-field">
                    <label for="txtName">Name&nbsp;&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage=" Enter Your Name" ForeColor="Red"></asp:RequiredFieldValidator>
                         </label>
                    &nbsp;<asp:TextBox ID="txtName" runat="server" CssClass="input-box" placeholder="Enter your name"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtEmail">Email&nbsp;&nbsp;&nbsp;

                         <asp:Label ID="Error" runat="server" ForeColor="Red"></asp:Label>

                         &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Email" ForeColor="Red" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></asp:RegularExpressionValidator>

                         </label>
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtPassword">Password&nbsp;&nbsp;&nbsp;
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password has 8 to 12 characters" ValidationExpression="^.{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>

                         </label>
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>

                <div class="input-field">
                    <label for="txtPassword">Re-Enter Password&nbsp;&nbsp;&nbsp;
                         <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword1" ControlToValidate="txtPassword" ErrorMessage="Password Don't Match" ForeColor="Red"></asp:CompareValidator>
                         </label>
                    &nbsp;<asp:TextBox ID="txtPassword1" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>
                
                
                <div class="button-container">
                 
        <asp:Button ID="btnSingup" runat="server" Text="Singup" CssClass="btn-signup" OnClick="btnSignup_Click" />
                </div>
                
                <div class="remember-me">
                    <asp:CheckBox ID="chkRememberMe" runat="server" />
                    <label for="chkRememberMe">Remember me</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </div>
                
                <div class="signin-link">
                    <p>Already have an account? <a href="Login.aspx">Login in</a></p>
                </div>
            </div>
        </div>

    </form>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Singup]"></asp:SqlDataSource>
</body>
</html>
