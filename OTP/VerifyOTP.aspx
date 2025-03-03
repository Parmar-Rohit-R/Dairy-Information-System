<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyOTP.aspx.cs" Inherits="DIS.OTP.VerifyOTP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/V-O.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="forgot-container">
           
            <div class="forgot-form">
                <h2>OTP Verification</h2>
                <p>Check your gmail</p>
                
                
                <div class="input-field">
                    <label for="txtEmail">OTP&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </label>
                    &nbsp;<asp:TextBox ID="txtOTP" runat="server" CssClass="input-box" placeholder="Enter OTP"></asp:TextBox>
                </div>

                <div class="button-container">
                 <asp:Label ID="lblResult" runat="server"></asp:Label> <br />
        <asp:Button ID="btnForgot" runat="server" Text="Verify OTP" CssClass="btn-F" OnClick="btnforgot_Click" Width="247px" />
                &nbsp;
                </div>

                <br />

                <div class="button-container">
                 
        <asp:Button ID="Back" runat="server" Text="Back" CssClass="btn-F" PostBackUrl="~/OTP/ForgotPassword.aspx" Width="131px" />
                </div>
                

                </div>
       </div>
    </form>
</body>
</html>
