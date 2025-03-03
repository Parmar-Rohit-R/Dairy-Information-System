<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DIS.OTP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="1" style="width: 100%; text-align: center;">
    <tr>
        <td>Evening</td>
        <td>
            <asp:Label ID="lblEvening" runat="server"></asp:Label>
            <asp:TextBox ID="txtEveningDate" runat="server" ReadOnly="true" Width="100px"></asp:TextBox>
        </td>
        <td>Morning</td>
        <td>
            <asp:Label ID="lblMorning" runat="server"></asp:Label>
            <asp:TextBox ID="txtMorningDate" runat="server" ReadOnly="true" Width="100px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Total_Cow</td>
        <td><asp:Label ID="lblTotalCowEvening" runat="server"></asp:Label></td>
        <td>Total_Farmer</td>
        <td><asp:Label ID="lblTotalFarmerMorning" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Total_Buffalo</td>
        <td><asp:Label ID="lblTotalBuffaloEvening" runat="server"></asp:Label></td>
        <td>Total_Milk</td>
        <td><asp:Label ID="lblTotalMilkMorning" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Total_Fat</td>
        <td><asp:Label ID="lblTotalFatEvening" runat="server"></asp:Label></td>
        <td>Total_SNF</td>
        <td><asp:Label ID="lblTotalSNFMorning" runat="server"></asp:Label></td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
