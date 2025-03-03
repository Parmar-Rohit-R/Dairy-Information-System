<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Op_Add.aspx.cs" Inherits="DIS.Admin.Op_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Op_A.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
     <style type="text/css">
        .auto-style1 {
            width: 540px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <div class="dashboard-container">
    <nav class="sidebar">
        <div class="logo-sidebar">
           
            <img src="../Image/Banas_Logo1%20(1).png" alt="Dairy Logo" />
        </div>
          <ul>
            <li><a href="Admin_Das.aspx"><i class="fa-solid fa-house"></i>&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</a></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="bi bi-person-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;Admin Details </a>
            <div class="dropdown-content">
                <a href="Admin_Add.aspx">Add Admin Details</a>
                <a href="Admin_Manage.aspx">Manage Admin Details</a>
            </div></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-user-tie"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Operator Details</b> </a>
            <div class="dropdown-content">
                <a href="Op_Add.aspx">Add Operator Details</a>
                <a href="Op_Manage.aspx">Manage Operator Details</a>
            </div></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;&nbsp;&nbsp;Farmer Details </a>
            <div class="dropdown-content">
                <a href="V_Farmer.aspx">View Farmer Details</a>
            </div></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;User Details </a>
            <div class="dropdown-content">
                <a href="Admin_Das_Add.aspx">Add User Details</a>
                <a href="Admin_Das_Manage.aspx">Manage User Details</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-cow"></i>&nbsp;&nbsp;&nbsp;&nbsp;Milk Collection </a>
            <div class="dropdown-content">
                <a href="View_Milk_Collection.aspx">View Milk Collection</a>
            </div>
            </li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-list"></i>&nbsp;&nbsp;&nbsp;&nbsp;Categories </a>
            <div class="dropdown-content">
                <a href="Product/Product_Category_Add.aspx">Add Product Categories</a>
                <a href="Product/Product_Category_Manage.aspx">View Products Categories</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-p"></i>&nbsp;&nbsp;&nbsp;&nbsp;Product  </a>
            <div class="dropdown-content">
                <a href="Product/Product_Add.aspx">Add Product</a>
                <a href="Product/Product_Manage.aspx">View Products</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="bi bi-image"></i>&nbsp;&nbsp;&nbsp;&nbsp;Gallery  </a>
            <div class="dropdown-content">
                <a href="Add_Gallery.aspx">Add Gallery Photos</a>
                <a href="Manage_Gallery.aspx">Manage Gallery Photos</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-receipt"></i>&nbsp;&nbsp;&nbsp;&nbsp;Report </a>
            <div class="dropdown-content">
                <a href="Report.aspx">Daily Report</a>
                <a href="M_Report.aspx">Monthly Report</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-address-book"></i>&nbsp;&nbsp;&nbsp;&nbsp;Contact Us </a>
            <div class="dropdown-content">
                <a href="View_Contact.aspx">View Contact Us</a>
            </div></li>
        </ul>
    </nav>

    <!-- Header -->
    <header class="header">
        <div class="header-info">
          <p> <i style="color: black;" class="bi bi-person-circle bg-light"></i> <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Link" OnClick="LinkButton1_Click1"></asp:LinkButton> </p>
&nbsp;&nbsp;
       <p>   <i style="color: black;" class="bi bi-box-arrow-right"></i>  <asp:LinkButton ID="LinkButton2" runat="server" CssClass="Link" OnClick="LinkButton2_Click1">Logout</asp:LinkButton> </p>
&nbsp;
        </div>
    </header>

        <!-- Center Content-->
        <p class="P1">Add Operator Details</p>
   
       <div class="div1">
           <div class="form-box">
                <table>
                    <tr>
                        <td>
                            <label>Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="input-box"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" ErrorMessage="Enter OperatorName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style1">
                            <label>OperatorID</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Email" ForeColor="Red" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></asp:RegularExpressionValidator> </label>
&nbsp;<asp:Label ID="Error1" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <label>Operator_Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter OperatorPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                       &nbsp;
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password has 8 to 12 Character" ValidationExpression="^.{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        &nbsp;</td>
                        <td>
                            <label>Re-Enter Operator_Password</label>
                            <asp:TextBox ID="txtRePassword" runat="server" CssClass="input-box" TextMode="Password"></asp:TextBox>
                                       <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtRePassword" ErrorMessage="Don't Match" ForeColor="Red" ControlToValidate="txtPassword"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" Text="Button" CssClass="btn-primary" OnClick="btnSubmit_Click"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
       </div>
      

       <!-- Footer -->

        <header class="foot">
        <div class="foot-info">
            Copyright Banas Dairy 2025. All Rights Reserved.
        </div>
    </header>


        </div>
    </form>

    <script>
        // Get all dropdown buttons
        const dropdowns = document.querySelectorAll('.dropdown-btn');

        // Add click event listener to toggle dropdowns
        dropdowns.forEach(function (btn) {
            btn.addEventListener('click', function () {
                const dropdownContent = this.nextElementSibling;
                dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';
            });
        });
    </script>
</body>
</html>

