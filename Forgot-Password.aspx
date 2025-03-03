<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot-Password.aspx.cs" Inherits="DIS.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="F-P.css" rel="stylesheet" />
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
    <div class="forgot-container">
           
            <div class="forgot-form">
                <h2>Reset Paasword</h2>
                <p>Reset your password if you forgot them.</p>
                
                
                <div class="input-field">
                    <label for="txtEmail">Email&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </label>
                    &nbsp;<asp:TextBox ID="txtName" runat="server" CssClass="input-box" placeholder="Enter your name"></asp:TextBox>
                </div>

                <div class="button-container">
                 
        <asp:Button ID="btnForgot" runat="server" Text="Send Password" CssClass="btn-F" OnClick="btnforgot_Click" Width="254px" />
                </div>

                <br />

                <div class="button-container">
                 
        <asp:Button ID="Back" runat="server" Text="Back" CssClass="btn-F" OnClick="btnBack_Click" PostBackUrl="~/Login.aspx" Width="131px" />
                </div>
                

                </div>
       </div>
    </form>
</body>
</html>
