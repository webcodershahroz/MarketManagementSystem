<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="MarketManagementSystem.forms.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers : Market Management System</title>
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

        .tblCustomer {
            width: 95%;
            margin: 10px auto;
        }

            .tblCustomer tr td {
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
            width: fit-content
        }

        .detailBar, .addCustomerFormContainer {
            padding: 10px;
            background-color: #eeeeee;
            height: fit-content;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
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
    <form id="formCustomers" runat="server">
        <div class="addCustomerFormContainer" style="background-color: #ebf9ff;">
            <div class="styleFD">
                <asp:Label Text="Customer name:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerName inputStyle" ID="txtCustomerName" runat="server" />
                </div>
            </div>
            <div class="styleFD">
                <asp:Label Text="Email:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerEmail inputStyle" ID="txtCustomerEmail" runat="server" />
                </div>
            </div>
            <div class="styleFD">
                <asp:Label Text="Address:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerAddress inputStyle" ID="txtCustomerAddress" runat="server" />
                </div>
            </div>
            <div class="styleFD">
                <asp:Label Text="Contact:" runat="server" />
                <div>
                    <asp:TextBox CssClass="txtCustomerContact" ID="txtCustomerContact" runat="server" />
                </div>
            </div>
            <div>
                <asp:Button CssClass="btn" BackColor="Green" Text="Add" runat="server" />
            </div>
        </div>
        <div>
            <table class="tblCustomer">
                <tr>
                    <th>#</th>
                    <th>Customer id</th>
                    <th>Customer name</th>
                    <th>Customer email</th>
                    <th>Customer address</th>
                    <th>Customer contact</th>
                    <th>Previous Balance</th>
                    <th>Action</th>

                </tr>
                <tr>
                    <td>1</td>
                    <td>293810</td>
                    <td>
                        <asp:TextBox Text="Shahroz" ID="txtUpdateCustomerName" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox Text="shahrozshahzad17@gmail.com" ID="txtUpdateCustomerEmail" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox Text="ChakAkka, Dina" ID="txtUpdateCustomerAddress" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox Text="+92 3495898836" ID="txtUpdateCustomerContact" runat="server" /></td>
                    <td>
                        <asp:TextBox Text="200" ID="txtPreviousBalance" runat="server" /></td>
                    <td>
                        <asp:Button Text="Update" CssClass="btn" ID="btnUpdate" runat="server" />
                        <asp:Button BackColor="Red" Text="Delete" CssClass="btn" ID="btnDelete" runat="server" />
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
