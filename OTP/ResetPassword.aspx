<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="DIS.OTP.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/R-P.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="forgot-container">
           
            <div class="forgot-form">
                <h2>Reset Paasword</h2>
                <p>Reset your password if you forgot them.</p>
                
                
                <div class="input-field">
                    <label for="txtEmail">New Password&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </label>
                    &nbsp;<asp:TextBox ID="txtNewPassword" runat="server" CssClass="input-box" placeholder="Enter Password"></asp:TextBox>
                    <br />
                    <br /><label for="txtEmail">Confirm Password</label><br />
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-box" placeholder="Enter Confirm Password" ></asp:TextBox>
                </div>

                <div class="button-container">
                 <asp:Label ID="lblResult" runat="server"></asp:Label> <br />
        <asp:Button ID="btnForgot" runat="server" Text="Reset Password" CssClass="btn-F" OnClick="btnResetPassword_Click" Width="247px" />
                &nbsp;
                </div>

                <br />

                <div class="button-container">
                 
        <asp:Button ID="Back" runat="server" Text="Back" CssClass="btn-F" PostBackUrl="~/OTP/VerifyOTP.aspx" Width="131px" />
                </div>
                

                </div>
       </div>
    </form>
</body>
</html>
