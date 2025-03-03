<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DIS.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="Image/Banas_Logo1.png" type="text/x-html-insertion" />
     <link rel="stylesheet" href="Home.css" />
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
            <asp:LinkButton ID="LinkButton7" runat="server" CssClass="Link" ForeColor="White" PostBackUrl="~/Gallery/Gallery.aspx">Photo Gallery</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton8" runat="server" CssClass="Link" ForeColor="White" PostBackUrl="~/View_Milk.aspx">View Milk</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: white;" class="bi bi-person-circle bg-light"></i> <asp:LinkButton ID="LinkButton5" runat="server" CssClass="Link" ForeColor="White" OnClick="LinkButton5_Click"></asp:LinkButton>             &nbsp;      <i style="color: white;" class="bi bi-box-arrow-right"></i>       <asp:LinkButton ID="LinkButton6" runat="server" CssClass="Link" ForeColor="White" OnClick="LinkButton6_Click">Logout</asp:LinkButton>
            <br />
            <br />
        </div>   
        </nav>
    </div>
    </form>

      <br />
    <br />
    <div class="img2">
        <asp:Image ID="Image3" runat="server" Height="600px" Width="100%" ImageUrl="~/Image/un.jpg" />
    </div>
   

    <br />
    <br />

<form style="height: 388px; width: 100%; background-image: url('/Image/bg2milk.png');">
    <div class="img">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:Image ID="Image2" runat="server" Height="308px" ImageUrl="~/Image/dji_export_1649660741894.jpg" Width="641px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>

        <div class="P"> 
            <br />
            <h1>Welcome To Banas Dairy</h1>
            <p>&nbsp;</p>
         <h2>  We’re Leader in Dairy Market</h2>
            <p>  &nbsp;</p>
          <p style="width: 526px">  Cooperation! A quality that resides in the blood of every citizen of India.India is that pious land which has spread the message of "Vasudhaiva Kutumbakam" the world is the family) round the globe. 
Overall, Gujarat is a dry land and especially when it comes to Banaskantha it is considered to be a desert area.</p>
        </div>
           
    </form>

    <br />
    <br />

    <form style="background-color:#f5f5f5; width:100%; height:500px;">
        <div class="contain">
            <h3 class="title">Best For All of you</h3>
    <h1 class="title">Our Products</h1>
    <div class="grid-container">
      <!-- Product 1 -->
      <div class="product-card">
        <div class="product-image">
          <img src="Image/Butter-Milk.png" alt="Banas Eco Butter Milk">
        </div>
        <div class="product-name">Banas Eco Butter Milk 500 ml Pouch</div>
      </div>

      <!-- Product 2 -->
      <div class="product-card">
        <div class="product-image">
          <img src="Image/Banas-Honey.png" alt="Banas Honey">
        </div>
        <div class="product-name">Banas Honey</div>
      </div>

      <!-- Product 3 -->
      <div class="product-card">
        <div class="product-image">
          <img src="Image/Banas -Oil.png" alt="Banas Navras Groundnut Oil">
        </div>
        <div class="product-name">Banas Navras Groundnut Oil</div>
      </div>

      <!-- Product 4 -->
      <div class="product-card">
        <div class="product-image">
          <img src="Image/Bans-Ghee.png" alt="Banas Premium Ghee">
        </div>
        <div class="product-name">Banas Premium Ghee 1 ltr Tin</div>
      </div>
    </div>
  </div>
    </form>

    <br />
    <br />
    <br />

    <form>
         <div class="conta">
        <!-- Left Section: Text -->
        <div class="left-section">
            <h1>Chairman's Message</h1>
            <p>
                My Dear Milk producer brothers and sisters who have brightened their life with tremendous hard work, 
                We have acquired the cooperative values of making collaborative efforts by staying together with one common vision from our Vedas-Puranas. 
                We have planted and nurtured these values from generations to generations assigning them to the next generation responsibly. 
                This tradition has remained firm even during the toughest period of slavery of Britishers. 
                This edifice of cooperation is established on pillars of empathy and brotherhood which the rural areas of Banaskantha have harnessed as economic development.
            </p>
            <a href="#" class="bt">VIEW MORE</a>
        </div>

        <!-- Right Section: Image and Quote -->
        <div class="right-section">
            <img src="Image/owner.png" alt="Chairman Image" />
            <div class="quote">
                संघच्छध्वं संवदध्वं सं वो मनांसि जानताम्।<br />
                देवा भागं यथा पूर्वे संजानाना उपासते॥
            </div>
        </div>
            </div>
    </form>
    <br />
    <br />

   <form style="height: 559px; width: 100%; background-color:#ffd800;">
    <div class="img10">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
<asp:Image ID="Image4" runat="server" ImageUrl="~/Image/banasdairy-branch.png" AlternateText="Banas Dairy Branch" Height="448px" Width="642px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>

        <div class="P10"> 
            <br />
            <br />
            <br />

            <h3>MODERN DAIRY FARM</h3>
            <p>&nbsp;</p>
         <h1>  Know More About Banas Dairy</h1>
            <p>  &nbsp;</p>
          <p style=" font-size:22px; height: 318px; width: 568px; text-align:justify;">                  Late Galbabhai Patel, founder chairman and the selfless sage cocooned a dream touplift Socio-economical status of village farmers which is fulfilled through the creation of a Co-operative milk union for Banaskantha district, on the foot print of “Amul Dairy” of Kheda district, the ideal model of a co-operative. Consequently, eight village level co-operative milk societies in Vadgam and Palanpur taluka of district were registered and started collecting and pouring milk at Dudhsagar Dairy, Mehsana from 3 October, 1966.
</p>
        </div>
           
    </form>
   
    <form>
        <footer>
            <div class="container">
                <div class="sec a">
                    <h2>About Us</h2>
<p style="font-size: 18px;"> ”We will strive to be the best Dairy Cooperative, with productive </p>
                    <p style="font-size: 18px;">and  sustainable dairy farming and products meeting global needs,  </p>
                    <p style="font-size: 18px;"> by strengthening: our Values, Cooperative movement, Women empowerment, Regenerative agriculture, innovation;”</p>                    <ul class="sci">
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
</body>
</html>
