<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="MarketManagementSystem.forms.Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard : Market Management System</title>
    <link href="../style/style.css" rel="stylesheet" />
</head>
<body>
    <header>
        <nav>
            <h1>Welcome to the Market Management System</h1>
            <h1>Ashyana Karyana</h1>
        </nav>
    </header>
    <form id="formBill" runat="server">
        <div>
            <div class="detailBar">
                <asp:Panel CssClass="detailBar" runat="server" ID="pnlAddPdtControls" Visible="false">
                    <asp:Panel runat="server" ID="pnlEdit" Visible="false" style="display:flex">
                        <div>
                            <asp:Button CssClass="btn" ID="btnEditProduct" Text="Edit" BackColor="Green" runat="server" OnClick="BtnEditProduct_Click" />
                        </div>
                        <div>
                            <asp:Button CssClass="btn" ID="btnDeleteProduct" Text="Delete" BackColor="Red" runat="server" OnClick="BtnDeleteProduct_Click"  />
                        </div>
                    </asp:Panel>
                    <div>
                        <asp:TextBox ID="txtOrderId" runat="server" Enabled="false" BackColor="#c6c6b4" Width="30px" />
                    </div>
                    <div>
                        <asp:Label Text="Search Product:" runat="server" />
                        <asp:DropDownList runat="server" ID="ddlProduct" CssClass="inputStyle" AutoPostBack="true" OnSelectedIndexChanged="DdlProduct_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label Text="Quantity:" runat="server" />
                        <asp:TextBox CssClass="inputStyle" Width="100" ID="txtQuantity" Text="1" TextMode="Number" runat="server" />
                    </div>
                    <div>
                        <asp:Label Text="Price:" runat="server" />
                        <asp:TextBox CssClass="inputStyle" Width="100" ID="txtPrice" runat="server" />
                    </div>
                    <div>
                        <asp:Button CssClass="btn" ID="btnAddProduct" Text="Add" BackColor="Green" runat="server" OnClick="BtnAddProduct_Click" />
                    </div>
                    <div>
                        <asp:Button CssClass="btn" BackColor="Black" ID="btnPrint" Text="Print" runat="server" OnClick="BtnPrint_Click" />
                    </div>
                    <div>
                        <asp:Button CssClass="btn" ID="btnEditCustomer" Text="Change Customer" runat="server" OnClick="BtnEditCustomer_Click" />
                    </div>
                    <div>
                        <asp:Button CssClass="btn" BackColor="Red" ID="btnCancelOrder" Text="Cancel Order" runat="server" OnClick="BtnCancelOrder_Click" />
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" CssClass="detailBar" ID="pnlAddCtrControls">
                    <div>
                        <asp:Label Text="Customer Name:" runat="server" />
                        <asp:DropDownList runat="server" ID="ddlCustomer" CssClass="inputStyle" AutoPostBack="true" OnSelectedIndexChanged="DdlCustomer_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:TextBox runat="server" ID="txtDate" CssClass="inputStyle" TextMode="DateTime" Enabled="false" />
                    </div>
                    <div>
                        <asp:Button CssClass="btn" ID="btnCreateOrder" Text="Create Order" runat="server" OnClick="BtnCreateOrder_Click" />
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="totalBar">
            <div>
                <asp:Label Text="No of Items:" runat="server" />
                <asp:Label ID="lblTotalNoOfItems" Text="0" runat="server" />
            </div>
            <div style="display: flex; align-items: center;">
                <asp:CheckBox Font-Size="Medium" Text="Add Previous Balance(if any)" ID="cbAddPreviousBalance" runat="server" OnCheckedChanged="CbAddPreviousBalance_CheckedChanged" AutoPostBack="true" />
            </div>
            <div style="display: flex; align-items: center; gap: 5px">
                <asp:Label Text="Total:" runat="server" />
                <asp:TextBox ID="txtTotalPrice" CssClass="inputStyle" Text="0" Enabled="false" runat="server" />
            </div>
            <div style="display: flex; align-items: center; gap: 5px">
                <asp:Label Text="Recived Amount" runat="server" />
                <asp:TextBox ID="txtRecivedAmount" TextMode="Number"
                    CssClass="inputStyle" runat="server" />
            </div>
        </div>
        <asp:GridView ID="gvBillDetail" CssClass="tbl" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GvBillDetail_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
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
    </form>
</body>
</html>
