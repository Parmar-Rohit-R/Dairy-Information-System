<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact1.aspx.cs" Inherits="DIS.Contact1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="Contact.css" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <style type="text/css">
        #TextArea1 {
            width: 266px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
      
    <div>
        <nav style="background-image:url('/Image/sh54lwhi_400x400.jpg'); height: 131px; width: 100%; background-color: #FFFFFF;">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <div class="div1"> <asp:Image ID="Image1" runat="server" Height="63px" ImageUrl="~/Image/IMG_20241204_152750.jpg" Width="166px" BorderStyle="None" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  </div>
        <div class="div2">    
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" PostBackUrl="~/Home.aspx" CssClass="Link" ForeColor="White">Home</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" PostBackUrl="~/About1.aspx" CssClass="Link" ForeColor="White">About</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" PostBackUrl="~/Contact1.aspx" CssClass="Link" ForeColor="White">Contact</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="false" PostBackUrl="~/Product1.aspx" CssClass="Link" ForeColor="White">Product</asp:LinkButton>
             &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="false" CssClass="Link" ForeColor="White" PostBackUrl="~/Gallery/Gallery.aspx">Photo Gallery</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton8" runat="server" CssClass="Link" ForeColor="White" PostBackUrl="~/View_Milk.aspx">View Milk</asp:LinkButton>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: white;" class="bi bi-person-circle bg-light"></i> <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="false" CssClass="Link" ForeColor="White" OnClick="LinkButton5_Click"></asp:LinkButton>             &nbsp;      <i style="color: white;" class="bi bi-box-arrow-right"></i>       <asp:LinkButton ID="LinkButton6" runat="server" CssClass="Link" CausesValidation="false" ForeColor="White" OnClick="LinkButton6_Click">Logout</asp:LinkButton>

        
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>   
        </nav>
    </div> 
        
    <br />
    
    <div>
       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14563.759325351213!2d72.42121154230915!3d24.138751093499756!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395ceebae56efda5%3A0x3ed2df61fe71883e!2sBanas%20Dairy!5e0!3m2!1sen!2sin!4v1733585908683!5m2!1sen!2sin" width="100%" height="650" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
<br />
        <br />
        <br />
        <br />
   <div class="contact-container">
            <div class="contact-form">
                <h2>Send us a message</h2>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-input" Placeholder="Name"></asp:TextBox>
       <asp:Label ID="Error" runat="server"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" Placeholder="Email"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Message" ControlToValidate="txtMessage" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-textarea" TextMode="MultiLine" Placeholder="Message"></asp:TextBox>
                <asp:Button ID="btnSend" runat="server" CssClass="btn-submit" Text="Send Message" OnClick="btnSend_Click" />
                <asp:Label ID="lblStatus" runat="server" CssClass="status-label"></asp:Label>
            </div>
            <div class="contact-info">
                <h2>Contact Information</h2>
                <p><i class="bi bi-telephone"></i> 91-2742-253881</p>
                <p><i class="bi bi-envelope"></i> bansdairyinformation247@gmail.com</p>
                <p><i class="bi bi-geo-alt-fill"></i> 385001 Palanpur, Gujarat, India</p>
            </div>
        </div>
        <br />
        <br />
        <br />
         </form>

    <form>
        <footer>
            <div class="container">
                <div class="sec a">
                   <h2>About Us</h2>
                    <p style="font-size: 18px;"> ”We will strive to be the best Dairy Cooperative, with productive </p>
                    <p style="font-size: 18px;">and  sustainable dairy farming and products meeting global needs,  </p>
                    <p style="font-size: 18px;"> by strengthening: our Values, Cooperative movement, Women empowerment, Regenerative agriculture, innovation;”</p>
                    <ul class="sci">
                        <li><a href="#"><i class="bi bi-facebook"></i></a></li>
                        <li><a href="#"><i class="bi bi-twitter"></i></a></li>
                        <li><a href="#"><i class="bi bi-instagram"></i></a></li>
                        <li><a href="#"><i class="bi bi-youtube"></i></a></li>
                    </ul>
                </div>
                <div class="sec q">
                     <h2>Links</h2>
                    <ul>
                        <li><a href="#" style="font-size:20px;">Home</a></li>
                        <li><a href="#" style="font-size:20px;">About</a></li>
                        <li><a href="#" style="font-size:20px;">Contact</a></li>
                        <li><a href="#" style="font-size:20px;">Reports</a></li>
                    </ul>
                </div>
                <div class="sec q">
                     <h2>Product</h2>
                    <ul>
                        <li><a href="#" style="font-size:20px;">Dahi</a></li>
                        <li><a href="#" style="font-size:20px;">Ghee</a></li>
                        <li><a href="#" style="font-size:20px;">Paneer</a></li>
                        <li><a href="#" style="font-size:20px;">Butters</a></li>
                    </ul>
                </div>
                <div class="sec con">
                     <h2>Contact Us</h2>
                    <ul class="info">
                        <li>
                            <span><i class="bi bi-telephone-fill"></i></span><p> +1 123 456 789</p>
                        </li>
                        <li>
                           <span>  <i class="bi bi-envelope"></i></span><p> information@gmail.com</p>
                        </li>
                        <li>
                           <span>  <i class="bi bi-geo-alt-fill"></i></span><p> 123 Street, City,County</p>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>
        <div class="c">
           <hr /><br />
            <p>Copyright @2025 Banas Dairy. All Rights Reserved.</p>
        </div>

    </form>
    

   <script src="js/bootstrap.min.js"></script>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Contact]"></asp:SqlDataSource>
    </body>
</html>
