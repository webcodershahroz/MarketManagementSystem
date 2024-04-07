<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="MarketManagementSystem.forms.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Orders : Market Management System</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: Calibri;
        }

        nav {
            background-color: lightblue;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        .tblProduct {
            width: 95%;
            margin: 10px auto;
        }

            .tblProduct tr td {
                border: 1px solid black;
                text-align: center;
                height: 35px
            }

        .btn {
            background-color:black;
            color: white;
            padding: 2px 10px;
            border-radius: 4px;
            border: none;
            height: 29px;
            width:fit-content
        }

        .detailBar {
            padding: 10px;
            background-color: #eeeeee;
            height: fit-content;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            position: fixed;
            top: 49px;
            width: 100%;
            flex-wrap: wrap;
        }

        .inputStyle {
            height: 30px;
            width: 200px;
            outline: none;
            padding: 0 8px;
            font-size: 17px;
        }
        .totalBar {
    width: 100%;
    position: fixed;
    bottom: 0px;
    background-color: lightblue;
    height: 45px;
    font-size: 30px;
    padding: 15px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    gap: 10px;
}
    </style>
</head>
<body>
    <header>
        <nav>
            <h1>Welcome to the Market Management System</h1>
            <h1>Ashyana Karyana</h1>
        </nav>
    </header>
    <form id="formOrders" runat="server">
        <div>
            <table class="tblProduct">
                <tr>
                    <th>#</th>
                    <th>Customer id</th>
                    <th>Customer name</th>
                    <th>Date</th>
                    <th>Total Bill</th>
                    <th>Action</th>

                </tr>
                <tr>
                    <td>1</td>
                    <td>239023</td>
                    <td>Shahroz</td>
                    <td>22-12-2003</td>
                    <td>2000</td>
                    <td>
                        <asp:Button Text="See details" CssClass="btn" PostBackUrl="~/forms/OrderDetails.aspx" ID="btnSeeDetails" runat="server" />
                        <asp:Button Text="Delete" BackColor="Red" CssClass="btn" ID="btnDelete" runat="server" />
                    </td>
                </tr>
               
            </table>
        </div>
    </form>
    <div class="totalBar">
    <div>
        <asp:Label Text="No of Orders:" runat="server" />
        <asp:Label ID="lblTotalNoOfOrders" Text="1" runat="server" />
    </div>
    <div>
        <asp:Label Text="Total Sellings:" runat="server" />
        <asp:Label ID="lblTotalSellings" Text="20000" runat="server" />
    </div>
</div>
</body>
</html>
