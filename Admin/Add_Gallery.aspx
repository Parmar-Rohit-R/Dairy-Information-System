<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Gallery.aspx.cs" Inherits="DIS.Admin.Add_Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="Admin_Add.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />

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
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-user-tie"></i>&nbsp;&nbsp;&nbsp;&nbsp;Operator Details </a>
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
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="bi bi-image"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Gallery</b>  </a>
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
        <p class="P1">Add Gallery Photos</p>
   
       <div class="div1">
           <br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gallery Photo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:FileUpload ID="fileUpload" runat="server" />&nbsp;&nbsp;
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fileUpload" ErrorMessage="Gallery Photo is required." ForeColor="Red"></asp:RequiredFieldValidator>
           <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Enter Description&nbsp;
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Placeholder="Enter image description"></asp:TextBox>&nbsp;&nbsp;&nbsp;
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required." ForeColor="Red"></asp:RequiredFieldValidator>
           <br /><br />
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="btnUpload" CssClass="btn-signup" runat="server" Text="Upload" OnClick="btnUpload_Click" /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
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
