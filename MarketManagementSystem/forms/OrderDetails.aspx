<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="MarketManagementSystem.forms.OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Order Details : Market Management System</title>
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
            width: 90%;
            margin: 10px auto;
        }

            .tblProduct tr td {
                border: 1px solid black;
                text-align: center;
                height: 35px
            }

                .tblProduct tr td input {
                    width: 60px
                }

        .btn {
            background-color: red;
            color: white;
            padding: 2px 10px;
            border-radius: 4px;
            border: none;
            height: 29px;
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
    <form id="formOrderDetails" runat="server">
        <div>
            <table class="tblProduct">
                <tr>
                    <th>#</th>
                    <th>Product id</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Product Price</th>
                    <th>Total</th>

                </tr>
                <tr>
                    <td>1</td>
                    <td>203839</td>
                    <td>Rice</td>
                    <td>2</td>
                    <td>300</td>
                    <td>600</td>
                </tr>
            </table>
        </div>
        <div class="totalBar">
            <div>
                <asp:Label Text="Total no of products:" runat="server" />
                <asp:Label ID="lblTotalNoOfProductsSell" Text="20" runat="server" />
            </div>
            <div>
                <asp:Label Text="Total Bill:" runat="server" />
                <asp:Label ID="lblTotalBill" Text="3000" runat="server" />
            </div>
        </div>
    </form>

</body>
</html>
