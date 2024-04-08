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

        .tblOrder {
            width: 95%;
            margin: 10px auto;
        }

            .tblOrder tr td {
                border: 1px solid black;
                text-align: center;
                height: 35px
            }

        .btn {
            background-color: black;
            color: white;
            padding: 2px 10px;
            border-radius: 4px;
            border: none;
            height: 29px;
            width: fit-content;
            margin: 10px
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

            <asp:GridView CssClass="tblOrder" ID="gvOrders" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="order_id" DataSourceID="sdsOrders" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Sr #">
                        <ItemTemplate><%#Container.DataItemIndex + 1 %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="order_id" HeaderText="Order Id" InsertVisible="False" ReadOnly="True" SortExpression="order_id"></asp:BoundField>
                    <asp:BoundField DataField="customer_id" HeaderText="Customer Id" SortExpression="customer_id"></asp:BoundField>
                    <asp:BoundField DataField="order_date" HeaderText="Date" SortExpression="order_date"></asp:BoundField>
                    <asp:BoundField DataField="order_totalPrice" HeaderText="Total Bill" SortExpression="order_totalPrice"></asp:BoundField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlOrderId" NavigateUrl='<%# Eval("order_id","/forms/OrderDetails.aspx?orderId={0}") %>' runat="server" Text="See Details">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:MarketManagementSystemConnectionString %>" ProviderName="<%$ ConnectionStrings:MarketManagementSystemConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [tblOrder]"></asp:SqlDataSource>

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
