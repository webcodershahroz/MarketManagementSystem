<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="MarketManagementSystem.forms.Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard : Market Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing:border-box;
            font-family: Calibri;
        }

        nav {
            background-color: lightblue;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            position: fixed;
            top: 0px;
            width: 100%;
            height: fit-content;
        }

        .tblProduct {
            width: 99%;
            margin: 105px auto;
        }

            .tblProduct tr td {
                border: 1px solid black;
                text-align: center;
                height: 35px
            }

                .tblProduct tr td input {
                    width: 60px
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

        .btn {
            background-color: red;
            color: white;
            padding: 2px 10px;
            border-radius: 4px;
            border: none;
            height: 29px;
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

    <form id="formBill" runat="server">
        <div class="detailBar">
            <div>
                <asp:Label Text="Search Product:" runat="server" />
                <asp:TextBox CssClass="txtSearch inputStyle" ID="txtSearch" runat="server"  />
            </div>
            <div>
                <asp:Label Text="Quantity:" runat="server" />
                <input class="txtQuantity inputStyle" style="width: 100px" id="txtQuantity" type="number" value="1" />
            </div>
            <div>
                <asp:Button CssClass="btn" ID="btnAddProduct" Text="Add" BackColor="Green" runat="server" />
            </div>
            <div>
                <asp:Label Text="Customer Name:" runat="server" />
                <asp:TextBox CssClass="txtCustomerName inputStyle" ID="txtCustomerName" runat="server" />
            </div>
            <div>
                <asp:Button CssClass="btn" ID="btnClearDashboard" Text="Clear Dashboard" runat="server" />
            </div>
            <div>
                <asp:Button CssClass="btn" BackColor="Black" ID="btnPrint" Text="Print" runat="server" />
            </div>
        </div>
        <div>
            <table class="tblProduct">
                <tr>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Product Price</th>
                    <th>Total</th>
                    <th>Action</th>

                </tr>
                <tr>
                    <td>1</td>
                    <td>Rice</td>
                    <td>2</td>
                    <td>300</td>
                    <td>600</td>
                    <td>
                        <asp:Button Text="Delete" CssClass="btn" ID="btnDelete" runat="server" /></td>
                </tr>
            </table>
        </div>
        <div class="totalBar">
            <div>
                <asp:Label Text="No of Items:" runat="server" />
                <asp:Label ID="lblTotalNoOfItems" Text="1" runat="server" />
            </div>
            <div>
                <asp:Label Text="Total:" runat="server" />
                <asp:Label ID="lblTotalPrice" Text="600" runat="server" />
            </div>
        </div>

    </form>
    <script>
        console.log("Welcome to Market Management System");
        //Search box item show or hide
        document.getElementById('txtSearch').addEventListener('change', () => {
            
        })


    </script>
</body>
</html>
