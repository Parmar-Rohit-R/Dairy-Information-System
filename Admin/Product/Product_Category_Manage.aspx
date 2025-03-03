<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product_Category_Manage.aspx.cs" Inherits="DIS.Admin.Product.Product_Category_Manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link href="P_C_M.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="dashboard-container">
    <nav class="sidebar">
        <div class="logo-sidebar">
           
            <img src="../../Image/Banas_Logo1%20(1).png" alt="Dairy Logo" />
        </div>
        <ul>
            <li><a href="../Admin_Das.aspx"><i class="fa-solid fa-house"></i>&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</a></li>
             <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="bi bi-person-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;Admin Details </a>
            <div class="dropdown-content">
                <a href="../Admin_Add.aspx">Add Admin Details</a>
                <a href="../Admin_Manage.aspx">Manage Admin Details</a>
            </div></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="bi bi-person-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;Operator Details </a>
            <div class="dropdown-content">
                <a href="../Op_Add.aspx">Add Operator Details</a>
                <a href="../Op_Manage.aspx">Manage Operator Details</a>
            </div></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;&nbsp;&nbsp;Farmer Details </a>
            <div class="dropdown-content">
                <a href="../V_Farmer.aspx">View Farmer Details</a>
            </div></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;User Details </a>
            <div class="dropdown-content">
                <a href="../Admin_Das_Add.aspx">Add User Details</a>
                <a href="../Admin_Das_Manage.aspx">Manage Details</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-cow"></i>&nbsp;&nbsp;&nbsp;&nbsp;Milk Collection </a>
            <div class="dropdown-content">
                <a href="../View_Milk_Collection.aspx">View Milk Collection</a>
            </div>
            </li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-list"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Categories</b> </a>
            <div class="dropdown-content">
                <a href="Product_Category_Add.aspx">Add Product Categories</a>
                <a href="Product_Category_Manage.aspx">View Products Categories</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-p"></i>&nbsp;&nbsp;&nbsp;&nbsp;Product  </a>
            <div class="dropdown-content">
                <a href="Product_Add.aspx">Add Product</a>
                <a href="Product_Manage.aspx">View Products</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="bi bi-image"></i>&nbsp;&nbsp;&nbsp;&nbsp;Gallery  </a>
            <div class="dropdown-content">
                <a href="../Add_Gallery.aspx">Add Gallery Photos</a>
                <a href="../Manage_Gallery.aspx">Manage Gallery Photos</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-receipt"></i>&nbsp;&nbsp;&nbsp;&nbsp;Report </a>
            <div class="dropdown-content">
                <a href="../Report.aspx">Daily Report</a>
                <a href="../M_Report.aspx">Monthly Report</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-address-book"></i>&nbsp;&nbsp;&nbsp;&nbsp;Contact Us </a>
            <div class="dropdown-content">
                <a href="../View_Contact.aspx">View Contact Us</a>
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

        <p class="P1">Manage Product Categories&nbsp;</p>
           <p class="P2"><asp:TextBox ID="TextBox1" AutoPostBack="True" placeHolder="Search Category Name" OnTextChanged="txtSearch_TextChanged" runat="server"></asp:TextBox></p>

       <div class="div1">
           <br />
          
<asp:GridView ID="gvCategories" runat="server" DataKeyNames="CategoryID" AllowPaging="True" AutoGenerateColumns="False" CssClass="custom-grid" OnRowEditing="gvCategories_RowEditing" 
    OnRowDeleting="gvCategories_RowDeleting" OnRowUpdating="gvCategories_RowUpdating"  OnRowCancelingEdit="GridView1_RowCancelingEdit">
    <Columns>
        <asp:BoundField DataField="CategoryID" HeaderText="Category ID" ReadOnly="True" />
        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
        <asp:TemplateField>
               <HeaderTemplate>
                    <asp:Label ID="ELabel" runat="server" Text="Edit Record"></asp:Label>
                </HeaderTemplate>
                       <ItemTemplate>
                           <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" CssClass="btn btn-primary">
                               <i class="fa-solid fa-pen-to-square"></i>
                           </asp:LinkButton>
                       </ItemTemplate>
                       <EditItemTemplate>
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" CssClass="Update">
                              <i class="bi bi-floppy"></i>
                           </asp:LinkButton>
                           <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" CssClass="Cancel">
                              <i class="bi bi-x-circle"></i>
                           </asp:LinkButton>
                       </EditItemTemplate>
                   </asp:TemplateField>

                   <asp:TemplateField>
                       <HeaderTemplate>
                    <asp:Label ID="DLabel" runat="server" Text="Delete Record"></asp:Label>
                </HeaderTemplate>
                       <ItemTemplate>
                              <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" CssClass="Delete">
                               <i class="fa-solid fa-trash"></i>
                           </asp:LinkButton>                       
                       </ItemTemplate>
                       </asp:TemplateField>
    </Columns>
</asp:GridView>
         
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
