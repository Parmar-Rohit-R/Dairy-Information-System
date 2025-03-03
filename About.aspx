<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="D1.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>
    <link rel="shortcut icon" href="Image/Banas_Logo1.png" type="text/x-html-insertion" />
    <link href="About.css" rel="stylesheet" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
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
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home1.aspx" CssClass="Link" ForeColor="White">Home</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/About.aspx" CssClass="Link" ForeColor="White">About</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Contact.aspx" CssClass="Link" ForeColor="White">Contact</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Product.aspx" CssClass="Link" ForeColor="White">Product</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
             <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Login.aspx" CssClass="Link" ForeColor="White">Login</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
             <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Admin/Admin_Login.aspx" CssClass="Link" ForeColor="White">Admin</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
        </div>   
        </nav>
    </div>
    </form>

    
    <form style="width:100%; background-image:url('Image/vw.jpg'); background-repeat:no-repeat; height: 574px;">
        <div class="img1">
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Image ID="Image2" runat="server" Height="529px" Width="493px" ImageUrl="~/Image/overview.png" />
            <br />

        </div>

        <div style="width: 469px; height: 533px;" class="p1">
             &nbsp;
            <h1>Overview </h1>
             <p>&nbsp;</p>
           <p class="p2">    Cooperation! A quality that resides in the blood of every citizen of India. India is that pious land which has spread the message of “Vasudhaiva Kutumbakam” the world is the family) round the globe. Overall, Gujarat is a dry land and especially when it comes to Banaskantha it is considered to be a desert area. Picking up the impression of the backward area due to the lack of scope for industrialization, our founder Lt. Galbabhai Nanjibhai Patel saw the dream of changing this identity of this area.
          </p>
            <p>
            <br />
                <br />
              With the vision of “the widow living in the remotest village of the district shall live her life with self-respect and dignity keeping her hand on the handle of the sickle”; Galbakaka attempted that the local people shall participate in the integrated business of milk by initiating cooperative activities with the milk cooperative societies on October 3rd, 1966. </div>
             &nbsp;</p>
    </form>
    <div style="margin-bottom:2%; margin-top: 3%;">    

      <p class="p3">
                In the area where the firm belief was prevailing that “the son and the milk cannot be sold” accomplishing this task was a challenge itself. Taking each and every social class with him without any partiality, on January 31st, 1969, Banaskantha District Cooperative Milk Producers’ Union Ltd (Banas Dairy) got registered under The Cooperative Societies Act. Later on, on January 14th, 1971, Galbakaka inaugurated the Banas Dairy Plant spread in 122 acres which is currently situated in Jagana Village- 4 kms away from present Palanpur. Beginning with some hundred litres per day, Banas Dairy today has reached on an average daily capacity of 5.7 million litres milk production.&nbsp;
        </p>
     </div>
    
    <form style="height: 603px; width:99%; ">
        <h1 style="font-size: 50px; margin-right:3%; " class="h">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Purpose Vision Statement <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .....................<i class="bi bi-star-fill" style="font-size: 50%;"></i>.....................</h1>
        <p style="font-size: 50px; margin-right:3%; " class="h">&nbsp;</p>
        <div class="pa1">
            <h2 style="margin-bottom:0;"> <u>Banas Purpose</u></h2>
      
           <p style="margin-left:10%"> “Engaged in Harvesting Happiness”</p>
            <p style="margin-left:10%"> &nbsp;</p>

            <h2 style="margin-top:0;"><u>Banas Vision</u></h2>

             <p> ”We will strive to be the best Dairy Cooperative, with productive and sustainable dairy farming and products meeting global needs, by strengthening: our Values, Cooperative movement, Women empowerment, Regenerative agriculture, innovation; Enriching lives through technology and expand ‘Beyond Dairy’ for happiness of all stakeholders, by becoming a Quality Organization, a Great Place to Work and help India become a ‘Dairy to the world’.”</p>
        </div>
        <div class="pa2">
               <h2><u>બનાસનો હેતુ:</u></h2> 
               <p style="margin-left:10%"> “બનાસ આપણું માવતર, સૌના સુખનું વાવેતર”</p>
               <p style="margin-left:10%"> &nbsp;</p>

                <h2><u>બનાસનો ધ્યેય:</u></h2>
               <p> ઉત્પાદક અને સાતત્યપૂર્ણ ડેરી પ્રવૃતિ થકી વૈશ્વિક જરૂરિયાતોને અનુરૂપ ઉત્પાદનો બનાવી, આપણાં હિતધારકોની સુખાકારી માટે ડેરી અને ડેરી સિવાયના નવા આયામોમાં વિસ્તૃતિકરણ, નવીનતા તથા ટેક્નોલોજીના ઉપયોગ, મૂલ્યોની જાળવણી કરીને તેમજ સ્ત્રી સશક્તિકરણ તથા સહકારી માળખાને વધુ મજબૂત બનાવીને, સજીવ ખેતીને પ્રોત્સાહન આપીને અને સંસ્થાને ગુણવત્તાસભર તથા ઉત્તમ કાર્યસ્થળ બનાવી અમો શ્રેષ્ઠ સહકારી ડેરી તેમજ ભારતને ‘વિશ્વની ડેરી‘ બનાવવા પ્રયત્નશીલ રહીશું.</p>
        </div>
    </form>
    
    <form style="height: 625px; background-color:#f2f4e4; width: 99%;" class="pa3">
        <br />
        <h1 style="font-size: 50px; margin-right:3%;" class="h">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; History of Banas Dairy​ <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .....................<i class="bi bi-star-fill" style="font-size: 50%;"></i>.....................</h1> <br />
        <div class="hb1">
               <asp:Image ID="Image3" runat="server" Height="426px" Width="584px" ImageUrl="Image/history.png" />
        </div>
        <div class="hb1">

      <p class="p2">    Late Galbabhai Patel, founder chairman and the selfless sage cocooned a dream to uplift Socio-economical status of village farmers which is fulfilled through the creation of a Co-operative milk union for Banaskantha district, on the foot print of “Amul Dairy” of Kheda district, the ideal model of a co-operative. Consequently, eight village level co-operative milk societies in Vadgam and Palanpur taluka of district were registered and started collecting and pouring milk at DudhSagar Dairy, Mehsana from 3 October,1966..<br /><br />

The milk union got registered under the Co-operative Act on 31st January, 1969 as Banaskantha District Co-operative milk producers’ Union Limited, Palanpur, popularly known as “BANAS DAIRY”.<br /><br />

The foundation stone was laid down by late Galbabhai Patel on 14th January.1971 at 122 acres land acquired near Jagana village in order to set up dairy plant under the Operation Flood programme launched by National Dairy Development Board. On 7thmay,1971 the dairy started functioning at the same place with handling capacity of 1.5 lac liters of milk that was expanded later on with processing capacity of 4lac liters milk per day..
          </p>
        </div>
    </form>
    <br />
    <br />
    <br />
    <form id="f1" style="height: 534px; background-color:#eee6e6; width: 99%;">
         <div class="hb1">
            <br />
             <p class="p2">
                 As a result of relentless efforts of dedicated and committed leadership by founder chairman late Galbabhai Nanjibhai Patel, Ex.Chairman late Galbabhai Manjibhai Patel, Ex. Chairman working on co-operative principles won the trust of milk producers. Ultimately, it has been transforment into the modern dairy complex, the largest Dairy Co-operative in India...<br /><br />

                A small step, organizing some societies and collecting few hundred liters of milk in the year1966 has turned in to a quantum leap, when the ambitious and ultra-modern automated dairy plant of Asia continent has been shaped adjoining to first plant (Banas II dairy) with cost of Rs.110Crore to meet not only present but also future need to handle 10.5 lac liters milk per day.<br /><br />

                The Banas II Dairy Complex has the most modernized State-of -Art Technology having equipped with three types of programmable Logical Controls (PLCs).in addition, it has more than 560 pneumatic valves under the intelligent System. Surprisingly, entire processing of plant is being operated through Man-Machine-Interface (MMI). The reporting has been done with automatic system as well. The plant manufactures the products of international quality due to uninterrupted rhythm in processes and operation..
             </p>

         </div>
         <div class="hb1">
             <br />
             <br />
             <asp:Image ID="Image4" runat="server" Height="426px" Width="584px" ImageUrl="Image/history2.png" />
         </div>
    </form>

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
