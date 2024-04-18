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

        .tblOrderDetails {
            width: 90%;
            margin: 10px auto;
        }

            .tblOrderDetails tr td {
                border: 1px solid black;
                text-align: center;
                height: 35px
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

            <asp:GridView CssClass="tblOrderDetails" ID="gvOrderDetails" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="orderDetails_id" DataSourceID="sdsOrderDetails" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="orderDetails_id" HeaderText="Order Detail Id" InsertVisible="False" ReadOnly="True" SortExpression="orderDetails_id" />
                    <asp:BoundField DataField="order_id" HeaderText="Order Id" SortExpression="order_id" />
                    <asp:BoundField DataField="customer_id" HeaderText="Customer Id" SortExpression="customer_id" />
                    <asp:BoundField DataField="product_id" HeaderText="Product Id" SortExpression="product_id" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="totalPrice" HeaderText="Total Price" SortExpression="totalPrice" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:MarketManagementSystemConnectionString %>" ProviderName="<%$ ConnectionStrings:MarketManagementSystemConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM [tblOrderDetails] WHERE ([order_id] = @order_id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="order_id" QueryStringField="orderId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
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
