<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MarketManagementSystem.forms.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Signup : Market Management System</title>
    <style>
        body {
            background: #eeeeee;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Calibri;
        }

        .lblLogin {
            text-align: center;
        }

        .formSignup {
            width: 40%;
            margin: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .txtBox {
            font-size: large;
            height: 45px;
            width: 452px;
            margin: 20px 0;
            padding: 0px 5px;
            border: none;
            box-shadow: 0px 0px 1px black;
            border-radius: 4px;
            outline: none;
        }

        .btn {
            height: 43px;
            width: 452px;
            font-size: x-large;
            border: none;
            background-color: black;
            color: white;
            border-radius: 8px;
            cursor: pointer;
        }
        .styleDF{
            display: flex; flex-direction: column
        }
    </style>
</head>
<body>
    <form class="formSignup" id="formSignup" runat="server">
        <asp:Label ID="lblSignup" runat="server" Text="Sign up" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="60px"></asp:Label>
        <asp:Label Text="Welcome to MMS" runat="server" Font-Size="X-Large" Font-Bold="True" />
        <asp:Label ForeColor="Red" ID="txtSomethingWrong" runat="server"/>
        <div style="margin-top:10px">
            <div style="display: flex; align-items: center; gap: 10px">
                <div class="styleDF">
                    <asp:Label ID="lblFullName" Text="Full Name:" runat="server" Font-Size="Large" />
                    <asp:TextBox runat="server" Width="249px" ID="txtShopName" CssClass="txtBox" />
                </div>
                <div class="styleDF">
                    <asp:Label ID="lblType" Text="Type:" runat="server" Font-Size="Large" />
                    <asp:DropDownList CssClass="txtBox" Width="189px" ID="txtType" runat="server">
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Employee</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="styleDF">
                <asp:Label ID="lblEmail" Text="Email:" runat="server" Font-Size="Large" />
                <asp:TextBox runat="server" ID="txtEmail" CssClass="txtBox" />
            </div>
            <div class="styleDF">
                <asp:Label ID="lblPassword" Text="Password:" runat="server" Font-Size="Large" />
                <asp:TextBox runat="server" ID="txtPassword" CssClass="txtBox" />
            </div>
            <div class="styleDF">
                <asp:Label ID="lblConfirmPassword" Text="Confirm Password:" runat="server" Font-Size="Large" />
                <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="txtBox" />
            </div>
        </div>

        <asp:Button ID="btnSignup" Text="Sign Up" runat="server" CssClass="btn" OnClick="btnSignup_Click" />
        <asp:LinkButton ID="lnkBtnHaveAccount" PostBackUrl="~/forms/Login.aspx" Text="Already have an account?" runat="server" />

    </form>
</body>
</html>
