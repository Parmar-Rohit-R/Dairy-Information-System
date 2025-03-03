<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="DIS.OTP.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/F-P.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="forgot-container">
           
            <div class="forgot-form">
                <h2>EmailID</h2>
                <p>Enter Email For Forgot Password.</p>
                
                
                <div class="input-field">
                    <label for="txtEmail">Email&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </label>
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter Email"></asp:TextBox>
                </div>

                <div class="button-container">
                 <asp:Label ID="lblResult" runat="server"></asp:Label> <br />
        <asp:Button ID="btnForgot" runat="server" Text="Send OTP" CssClass="btn-F" OnClick="btnforgot_Click" Width="247px" />
                &nbsp;
                </div>

                <br />

                <div class="button-container">
                 
        <asp:Button ID="Back" runat="server" Text="Back" CssClass="btn-F" PostBackUrl="~/Login.aspx" Width="131px" />
                </div>
                

                </div>
       </div>
    </form>
</body>
</html>
