<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="D.Image.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Singup.css" rel="stylesheet" />
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
   <div class="signup-container">
            <!-- Sign Up Form -->
            <div class="signup-form">
                <h2>Your Profile</h2>
                <p>You Can Change It.</p>
                
                <div class="input-field">
                    <label for="txtName">Name&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Not Blank" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtName" runat="server" CssClass="input-box" placeholder="Enter your name"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtEmail">Email&nbsp;&nbsp;&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Email" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></asp:RegularExpressionValidator>
                    &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                    </label>
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtPassword">Password&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Not Blank" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password has 8 to 12 characters" ValidationExpression="^.{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>

                    </label>
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" placeholder="Enter your password"></asp:TextBox>
                </div>
                
                <div class="button-container">
                 
        <asp:Button ID="btnSingup" runat="server" Text="Change" CssClass="btn-signup" Width="384px" OnClick="btnSingup_Click" />
                </div>
                <br />
               
                <div class="button-container">
                 
        <asp:Button ID="Back" runat="server" Text="Back" CssClass="btn-signup" PostBackUrl="~/Home.aspx" Width="214px" />
                </div>
            
            </div>
        </div>
    </form>



</body>
</html>
