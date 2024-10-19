<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="MarketManagementSystem.forms.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders : Market Management System</title>
    <link href="../style/style.css" rel="stylesheet" />
</head>
<body>
    <header>
        <nav>
            <h1>Welcome to the Market Management System</h1>
            <h1>Ashyana Karyana</h1>
        </nav>


    </header>

    <form id="formOrders" runat="server">
        <div class="detailBar" style="background-color: #ebf9ff;">
            <div style="display:flex; align-items:center; gap:4px">
                <asp:Label Text="Search:" runat="server" />
                <div>
                    <asp:TextBox CssClass="inputStyle" Width="150"  ID="txtSearchOrder" runat="server" AutoPostBack="true" OnTextChanged="TxtSearchOrder_TextChanged"/>
                </div>
            </div>
            <div>
                <asp:Label Text="Search By Date" runat="server" />
                <asp:TextBox runat="server" CssClass="inputStyle"  Width="150" TextMode="Date" ID="txtSearchDate" AutoPostBack="true" OnTextChanged="TxtSearchDate_TextChanged"  />
            </div>
            <div style="display:flex">
                <div>
                    <asp:Label Text="from: " runat="server" />
                    <asp:TextBox runat="server" CssClass="inputStyle"  Width="150" TextMode="Date" ID="txtSearchFrom" AutoPostBack="true" OnTextChanged="TxtSearch_TextChanged"/>
                </div>
                <div>
                    <asp:Label Text="to: " runat="server" />
                    <asp:TextBox runat="server" CssClass="inputStyle" Width="150" TextMode="Date" ID="txtSearchTo"  AutoPostBack="true" OnTextChanged="TxtSearch_TextChanged"/>
                </div>
            </div>
            <div>
                <asp:Button Text="Clear Filter" CssClass="btn" ID="btnClearFilter" OnClick="BtnClearFilter_Click" runat="server" />
            </div>
        </div>
        <div>
            <asp:GridView ID="gvOrder" CssClass="tbl" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GvOrder_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="See Details" />
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
        </div>
    </form>
    <div class="totalBar">
        <div>
            <asp:Label Text="No of Orders:" runat="server" />
            <asp:Label ID="lblTotalNoOfOrders" Text="1" runat="server" />
        </div>
    </div>
</body>
</html>
