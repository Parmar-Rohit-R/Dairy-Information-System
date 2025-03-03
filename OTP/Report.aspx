<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="DIS.OTP.Report" %>

<!DOCTYPE html>
<html>
<head>
    <title>Milk Collection Report</title>
    <style>
        table {
            width: 70%;
            margin: auto;
            border-collapse: collapse;
            text-align: center;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
        }

        .textbox {
            width: 100%;
            text-align: center;
            border: none;
            font-weight: bold;
        }

        .header {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .total-label {
            background-color: #e0e0e0;
        }
    </style>
</head>  
<body>
    <h2 style="text-align: center;">Milk Collection Report</h2>
    <form id="form1" runat="server">
        <table>
            <tr class="header">
                <th>Evening</th>
                <th>Morning</th>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtEveningDate" CssClass="textbox" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtMorningDate" CssClass="textbox" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th colspan="2" class="header">Totals</th>
            </tr>
            <tr>
                <td class="total-label">Total Cow (Evening): <asp:Label ID="lblTotalCowEvening" runat="server"></asp:Label></td>
                <td class="total-label">Total Cow (Morning): <asp:Label ID="lblTotalCowMorning" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="total-label">Total Buffalo (Evening): <asp:Label ID="lblTotalBuffaloEvening" runat="server"></asp:Label></td>
                <td class="total-label">Total Buffalo (Morning): <asp:Label ID="lblTotalBuffaloMorning" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="total-label">Total Farmers (Evening): <asp:Label ID="lblTotalFarmersEvening" runat="server"></asp:Label></td>
                <td class="total-label">Total Farmers (Morning): <asp:Label ID="lblTotalFarmersMorning" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="total-label">Total Milk (Evening): <asp:Label ID="lblTotalMilkEvening" runat="server"></asp:Label></td>
                <td class="total-label">Total Milk (Morning): <asp:Label ID="lblTotalMilkMorning" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="total-label">Total Fat (Evening): <asp:Label ID="lblTotalFatEvening" runat="server"></asp:Label></td>
                <td class="total-label">Total Fat (Morning): <asp:Label ID="lblTotalFatMorning" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="total-label">Total SNF (Evening): <asp:Label ID="lblTotalSNFEvening" runat="server"></asp:Label></td>
                <td class="total-label">Total SNF (Morning): <asp:Label ID="lblTotalSNFMorning" runat="server"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>