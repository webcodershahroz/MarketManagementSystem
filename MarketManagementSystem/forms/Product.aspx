<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MarketManagementSystem.forms.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details : Market Management System</title>
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
            width: 99%;
            margin: 10px auto 50px auto;
        }

            .tblProduct tr td {
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
            margin: 5px;
        }

        .detailBar, .addProductFormContainer {
            padding: 10px;
            background-color: #eeeeee;
            display: flex;
            align-items: center;
            justify-content: space-between;
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

        .searchItems {
            background-color: darkgrey;
            border-radius: 4px;
            padding: 10px;
            position: absolute;
            width: 200px;
            margin: 1px 0px;
            display: none;
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

        .styleFD {
            display: flex;
            align-items: center;
            gap: 5px
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

    <form id="formProduct" runat="server">
        <div class="addProductFormContainer" style="background-color: #ebf9ff;">
            <div class="styleFD">
                <asp:Label Text="Product name:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductName inputStyle" ID="txtProductName" runat="server" />
                </div>
            </div>
            <div class="styleFD">
                <asp:Label Text="Purchasing Price:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductPurchasingPrice inputStyle" ID="txtProductPurchasingPrice" runat="server" />
                </div>
            </div>
            <div class="styleFD">
                <asp:Label Text="Selling Price:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductSellingPrice inputStyle" ID="txtProductSellingPrice" runat="server" />
                </div>
            </div>
            <div class="styleFD">
                <asp:Label Text="Stock:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductStock inputStyle" ID="txtProductStock" runat="server" />
                </div>
            </div>
            <div>
                <asp:Button CssClass="btn" ID="btnAddProduct" BackColor="Green" Text="Add" runat="server" OnClick="btnAddProduct_Click" />
            </div>
        </div>
        <div class="detailBar">
            <div class="styleFD">
                <asp:Label Text="Search Product:" runat="server" />
                <asp:TextBox ID="txtSearch" CssClass="inputStyle"  runat="server"/>
                <asp:Button Text="Search" CssClass="btn" ID="btnSearch" runat="server" />
            </div>
        </div>

        <asp:GridView CssClass="tblProduct" ID="gvProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="sdsProduct" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Sr #">
                    <ItemTemplate><%#Container.DataItemIndex +1 %></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="product_id" HeaderText="Product Id" InsertVisible="False" SortExpression="product_id" ReadOnly="True" />
                <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                <asp:BoundField DataField="product_purchasingPrice" HeaderText="Product Purchasing Price" SortExpression="product_purchasingPrice" />
                <asp:BoundField DataField="product_sellingPrice" HeaderText="Product Selling Price" SortExpression="product_sellingPrice" />
                <asp:BoundField DataField="product_stock" HeaderText="Stock" SortExpression="product_stock" />

                <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn" ShowEditButton="True" ShowDeleteButton="True" HeaderText="Actions">
                    <ControlStyle />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#7ca4e3" />
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
        <asp:SqlDataSource ID="sdsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:MarketManagementSystemConnectionString %>" ProviderName="<%$ ConnectionStrings:MarketManagementSystemConnectionString.ProviderName %>"
            SelectCommand="select * from [tblProduct]"
            DeleteCommand="delete from [tblProduct] where [product_id] = @product_id"
            UpdateCommand="update [tblProduct] set [product_name] = @product_name,[product_purchasingPrice] = @product_purchasingPrice,[product_sellingPrice] = @product_sellingPrice,[product_stock] = @product_stock where [product_id]=@product_id"
            FilterExpression="[product_name] like '{0}%'"
            >
            <DeleteParameters>
                <asp:Parameter Name="product_id" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_id" />
                <asp:Parameter Name="product_name" />
                <asp:Parameter Name="product_purchasingPrice" />
                <asp:Parameter Name="product_sellingPrice" />
                <asp:Parameter Name="product_stock" />
            </UpdateParameters>
            <FilterParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="search_text" PropertyName="Text" />
            </FilterParameters>
        </asp:SqlDataSource>
    </form>
    <script>
</script>
</body>
</html>
