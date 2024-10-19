<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="MarketManagementSystem.forms.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers : Market Management System</title>
    <link href="../style/style.css" rel="stylesheet" />
</head>
<body>
    <header>
        <nav>
            <h1>Welcome to the Market Management System</h1>
            <h1>Ashyana Karyana</h1>
        </nav>
    </header>
    <form id="formCustomers" runat="server">
        <div class="detailBar" style="background-color: #ebf9ff;">
            <div >
                <asp:Label Text="Customer name:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerName inputStyle" ID="txtCustomerName" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Email:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerEmail inputStyle" ID="txtCustomerEmail" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Address:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerAddress inputStyle" ID="txtCustomerAddress" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Contact:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerContact inputStyle" ID="txtCustomerContact" runat="server" />
                </div>
            </div>
            <div>
                <asp:Label Text="Previous Balance:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtPreviousBalance inputStyle" ID="txtPreviousBalance" runat="server" />
                </div>
            </div>
            <div>
                <asp:Button CssClass="btn" ID="btnAdd" BackColor="Green" Text="Add" runat="server" OnClick="BtnAdd_Click" />
                <asp:Button CssClass="btn" ID="btnUpdate" Text="Update" runat="server" Visible="False" OnClick="BtnUpdate_Click" />
                <asp:Button CssClass="btn" ID="btnDelete" BackColor="Red" Text="Delete" runat="server" Visible="False" OnClick="BtnDelete_Click"/>
                <asp:Button CssClass="btn" ID="btnClear" BackColor="Yellow" Text="Clear" runat="server" ForeColor="Black" OnClick="BtnClear_Click"/>
            </div>
        </div>
        <div class="detailBar">
            <div>
                <asp:Label Text="Search Customer:" runat="server" />
                <asp:TextBox ID="txtSearch" CssClass="inputStyle" runat="server" TextChanged="BtnSearch_Click" />
                <asp:Button Text="Search" CssClass="btn" ID="btnSearch" runat="server" OnClick="BtnSearch_Click" />
            </div>
        </div>
        <div>
            <asp:GridView CssClass="tbl" ID="gvCustomer" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged">
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
                <SelectedRowStyle BackColor="#769ade" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
