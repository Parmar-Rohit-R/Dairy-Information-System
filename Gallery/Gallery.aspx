<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="DIS.Gallery.Gallery" %>

<!DOCTYPE html>
<html>
<head>
    <title>Gallery</title>
    <link href="Gallery.css" rel="stylesheet" />
    <link rel="shortcut icon" href="Image/Banas_Logo1.png" type="text/x-html-insertion" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home.aspx" CssClass="Link" ForeColor="White">Home</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/About1.aspx" CssClass="Link" ForeColor="White">About</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Contact1.aspx" CssClass="Link" ForeColor="White">Contact</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Product1.aspx" CssClass="Link" ForeColor="White">Product</asp:LinkButton>
             &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton8" runat="server" CssClass="Link" ForeColor="White" PostBackUrl="~/Gallery/Gallery.aspx">Photo Gallery</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton6" runat="server" CssClass="Link" ForeColor="White" PostBackUrl="~/View_Milk.aspx">View Milk</asp:LinkButton>
                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: white;" class="bi bi-person-circle bg-light"></i> <asp:LinkButton ID="LinkButton5" runat="server" CssClass="Link" ForeColor="White" OnClick="LinkButton5_Click"></asp:LinkButton>             &nbsp;      <i style="color: white;" class="bi bi-box-arrow-right"></i>       <asp:LinkButton ID="LinkButton7" runat="server" CssClass="Link" ForeColor="White" OnClick="LinkButton7_Click">Logout</asp:LinkButton>

            <br />
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>   
        </nav>
    </div>
    </form>

    <br />
    <br />

    <form class="f1">
                <div style="text-align:center;">

                   <h2>Our Gallery</h2> <br /><br />
                    </div>

       <div class="gallery-container">
    <asp:Repeater ID="rptGallery" runat="server">
        <ItemTemplate>
            <div class="gallery-item">
                <img src='<%# Eval("ImagePath") %>' alt="Gallery Image" class="gallery-img" onclick="openLightbox('<%# Eval("ImagePath") %>')" />
                <p class="gallery-description"><%# Eval("Description") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>



        <!-- Lightbox -->
        <div id="lightbox" class="lightbox">
            <span class="close-btn" onclick="closeLightbox()">&times;</span>
            <img id="lightbox-img" class="lightbox-img">
        </div>
    </form>

    <br />
    <br />
    <br />
     <br />
    <br />
    <br /> <br />
    <br />
    <br />
    <br />
    <br />
    <br /> <br />
    <br />
    <br /><br />
    <br />
    <br /> <br />
    <br />
    <br /><br />
    <br />
    <br /> <br />
    <br />
    <br />
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
                            <span><i class="bi bi-telephone-fill"></i></span><p> 91-2742-25281</p>
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


    <script src="Gallery.js"></script>
</body>
</html>
