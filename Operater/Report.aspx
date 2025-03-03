<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="DIS.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Report.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <link href="Add_Milk_Collection.css" rel="stylesheet" />
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
            <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-cow"></i>&nbsp;&nbsp;&nbsp;&nbsp;Milk Collection </a>
            <div class="dropdown-content">
                <a href="Add_Milk_Collection.aspx">Add Milk Collection</a>
                <a href="View_Milk_Collection.aspx">View Milk Collection</a>
            </div>
            </li>
           <li> <a href="javascript:void(0)" class="dropdown-btn"><i class="fa-solid fa-receipt"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>Report</b> </a>
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
        <p class="P1">Daily Milk Report</p>
   
      <div class="div1">

           <br />
&nbsp;&nbsp;&nbsp; Morning&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <asp:TextBox ID="txtMorning" ReadOnly="true" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Evening&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:TextBox ID="txtEvening" ReadOnly="true" runat="server"></asp:TextBox>

             <br />
            
             <br />
&nbsp;&nbsp; Total_Cow&nbsp;&nbsp;&nbsp;&nbsp; 
<asp:TextBox ID="txtTotalCow" ReadOnly="true" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp; Total_Farmer&nbsp;&nbsp;
<asp:TextBox ID="txtTotalFarmer" ReadOnly="true" runat="server"></asp:TextBox>
             <br />
             <br />
&nbsp;&nbsp; Total_Buffalo  <asp:TextBox ID="txtTotalBuffalo" ReadOnly="true" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; Total_Milk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtTotalMilk" ReadOnly="true" runat="server"></asp:TextBox>
             <br />
             <br />
&nbsp;&nbsp; Total_Fat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtTotalFat" ReadOnly="true" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total_SNF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtTotalSNF" ReadOnly="true" runat="server"></asp:TextBox>
        
          
       </div>

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

