<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Milk_Collection.aspx.cs" Inherits="DIS.Operater.View_Milk_Collection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">  
         <title></title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link href="View_Milk_Collection.css" rel="stylesheet" />
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
            <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;Farmer Details </a>
            <div class="dropdown-content">
                <a href="Op_Add_Farmer.aspx">Add Farmer Details</a>
                <a href="Op_Manage_Farmer.aspx">Manage Farmer Details</a>
            </div></li>
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-cow"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Milk Collection</b> </a>
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
        <p class="P1">View Milk Collections</p>
        <p class="P2"><asp:TextBox ID="TextBox1" AutoPostBack="True" placeHolder="Search Name" OnTextChanged="txtSearch_TextChanged" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="ddlDates" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDates_SelectedIndexChanged">
</asp:DropDownList>
                </p>
   
       <div class="div1">
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="6" CssClass="custom-grid" AutoGenerateColumns="False" DataKeyNames="No"     
           OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing1"  OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" >
    <Columns>
        
        <asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" />
        <asp:BoundField DataField="FarmerID" HeaderText="FarmerID" />
         <asp:BoundField DataField="Collection_Date" HeaderText="Collection_Date" />
        <asp:BoundField DataField="Time" HeaderText="Time" />
        <asp:BoundField DataField="Milk_Type" HeaderText="Milk_Type" />
        <asp:BoundField DataField="Fat" HeaderText="Fat" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        <asp:BoundField DataField="SNF" HeaderText="SNF" />
        <asp:BoundField DataField="Rate_Per_Liter" HeaderText="Rate_Per_Liter" />
        <asp:BoundField DataField="Total_Amount" HeaderText="Total_Amount" />
        <asp:CommandField ShowEditButton="True" EditText="<i class='fa-solid fa-pen-to-square'></i>"  ControlStyle-CssClass="li" HeaderText="Edit Record" />

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

        <br />
        <br />
        <br />
        <br />

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

    