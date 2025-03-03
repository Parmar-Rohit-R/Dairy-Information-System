-<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Op_Add_Farmer.aspx.cs" Inherits="DIS.Operater.Op" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head id="Head1" runat="server">
      <title></title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
      <link href="Op_Add_Farmer.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
    
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
        <p class="P1">Add Farmer Details</p>
   
       <div class="div1">
           <div class="form-box">
                <table>
                    <tr>
                        <td>
                            <label>FarmerID</label>
                            <asp:TextBox ID="txtFarmerID" runat="server" CssClass="input-box"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFarmerID" ErrorMessage="Enter FarmerID" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;
            <asp:Label ID="Error" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <label>FarmerName</label>
                            <asp:TextBox ID="txtFarmerName" runat="server" CssClass="input-box"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFarmerName" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Email" ForeColor="Red" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></asp:RegularExpressionValidator> </label>
&nbsp;<asp:Label ID="Error1" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            <label>ContactNo</label>
                            <asp:TextBox ID="txtContact" runat="server" CssClass="input-box"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContact" ErrorMessage="Only 10 Number" ValidationExpression="^.{10,10}$" ForeColor="Red"></asp:RegularExpressionValidator>

                        &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtContact" ErrorMessage="Enter Details" ForeColor="Red"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                       &nbsp;
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password has 8 to 12 Character" ValidationExpression="^.{8,12}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        &nbsp;</td>
                        <td>
                            <label>Re-Enter Password</label>
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

           </div>
        <br />
        <br />

       <!-- Footer -->

        <header class="foot">
        <div class="foot-info">
            Copyright Banas Dairy 2025. All Rights Reserved.
        </div>
    </header>


       
    </form>

          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

        $(document).ready(function () {
            $(".numberOnly").on("keypress", function (e) {
                var charCode = e.which ? e.which : event.keyCode;
                if (charCode < 48 || charCode > 57) {
                    return false;
                }
            });

            // Prevents copy-pasting non-numeric values
            $(".numberOnly").on("paste", function (e) {
                e.preventDefault();
            });
        });

    </script>
</body>
</html>
