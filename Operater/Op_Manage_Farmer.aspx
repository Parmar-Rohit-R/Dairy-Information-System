<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Op_Manage_Farmer.aspx.cs" Inherits="DIS.Operater.Op_Maneag_Farmer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="Op_Manage_Farmer.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
    <div class="dashboard-container">
    <nav class="sidebar">
        <div class="logo-sidebar">
           
            <img src="../Image/Banas_Logo1%20(1).png" alt="Dairy Logo" />
        </div>
      <ul>
            <li><a class="das" href="Op_D.aspx"><i class="fa-solid fa-house" "></i>&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</a></li>
            <li>
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Farmer Details</b> </a>
            <div class="dropdown-content">
                <a href="Op_Add_Farmer.aspx">Add Farmer Details</a>
                <a href="Op_Manage_Farmer.aspx">Manage Farmer Details</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-cow"></i>&nbsp;&nbsp;&nbsp;&nbsp;Milk Collection </a>
            <div class="dropdown-content">
                <a href="Add_Milk_Collection.aspx">Add Milk Collection</a>
                <a href="View_Milk_Collection.aspx">View Milk Collection</a>
            </div>
            </li>
           <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-receipt"></i>&nbsp;&nbsp;&nbsp;&nbsp;Report </a>
            <div class="dropdown-content">
                <a href="Report.aspx">Daily Report</a>
                <a href="M_Report.aspx">Mothly Report</a>
            </div>
            </li>
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
        <p class="P1">Manage Farmer Details</p>
           <p class="P2"><asp:TextBox ID="TextBox1" AutoPostBack="True" placeHolder="Search Farmer Name" OnTextChanged="txtSearch_TextChanged" runat="server"></asp:TextBox></p>

       <div class="div1">
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="8" CssClass="custom-grid" AutoGenerateColumns="False" DataKeyNames="Farmer_ID" 
    OnRowEditing="GridView1_RowEditing" 
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowDeleting="GridView1_RowDeleting">
    <Columns>
        
        <asp:BoundField DataField="Farmer_ID" HeaderText="Farmer_ID" ReadOnly="True" />
        <asp:BoundField DataField="FarmerName" HeaderText="FarmerName" />
         <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" />
        <asp:BoundField DataField="F_UserID" HeaderText="F_UserID" />
        <asp:BoundField DataField="F_Password" HeaderText="F_Password" />
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