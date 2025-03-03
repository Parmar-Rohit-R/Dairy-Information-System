<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Profile.aspx.cs" Inherits="DIS.Admin.Admin_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Profile.css" rel="stylesheet" />
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
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not Blank" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>
                </div>
                
                <div class="input-field">
                    <label for="txtPassword">Password&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Not Blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" placeholder="Enter your password"></asp:TextBox>
                </div>
                
                <div class="button-container">
                 
        <asp:Button ID="btnSingup" runat="server" Text="Change" CssClass="btn-signup" Width="384px" OnClick="btnSingup_Click" />
                </div>
                <br />
               
                <div class="button-container">
                 
        <asp:Button ID="Back" runat="server" Text="Back" CssClass="btn-signup" PostBackUrl="~/Admin/Admin_Das.aspx" Width="214px" />
                </div>
            
            </div>
        </div>

    </form>
</body>
</html>
