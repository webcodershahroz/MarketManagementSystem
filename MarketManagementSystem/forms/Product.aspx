<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MarketManagementSystem.forms.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details : Market Management System</title>
    <link href="../style/style.css" rel="stylesheet" />
</head>

<body>
    <header>
        <nav>
            <h1>Welcome to the Market Management System</h1>
            <h1>Ashyana Karyana</h1>
        </nav>
    </header>

    <form id="formProduct" runat="server">
        <div class="detailBar" style="background-color: #ebf9ff;">
            <div>
                <asp:Label Text="Product name:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductName inputStyle" ID="txtProductName" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Purchasing Price:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductPurchasingPrice inputStyle" ID="txtProductPurchasingPrice" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Selling Price:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductSellingPrice inputStyle" ID="txtProductSellingPrice" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Stock:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtProductStock inputStyle" ID="txtProductStock" runat="server" />
                </div>
            </div>
            <div>
                <asp:Button CssClass="btn" ID="btnAddProduct" BackColor="Green" Text="Add"  runat="server" OnClick="BtnAddProduct_Click" />
                <asp:Button CssClass="btn" ID="btnDeleteProduct" BackColor="Red" Text="Delete" Visible="False" runat="server" OnClick="BtnDeleteProduct_Click" />
                <asp:Button CssClass="btn" ID="btnUpdateProduct" Text="Update" runat="server" Visible="False" OnClick="BtnUpdateProduct_Click" />
                <asp:Button CssClass="btn" ID="btnClearProduct" BackColor="Yellow" ForeColor="Black" Text="Clear"  runat="server" OnClick="BtnClearFields_Click" />
            </div>
        </div>
        <div class="detailBar">
            <div class="styleFD">
                <asp:Label Text="Search Product:" runat="server" />
                <asp:TextBox ID="txtSearch" CssClass="inputStyle"  runat="server"/>
                <asp:Button Text="Search" CssClass="btn" ID="btnSearch" runat="server" OnClick="BtnSearch_Click" />
            </div>
            <div class="styleFD">
                <asp:CheckBox Text="Show products of stock less than 20." ID="cbFilterProduct" runat="server" AutoPostBack="true" OnCheckedChanged="CbFilterProduct_CheckedChanged" />
            </div>
        </div>
    <script>
</script>
        <asp:GridView ID="gvProduct" CssClass="tbl" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvProduct_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#769ade" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
    </body>
</html>
