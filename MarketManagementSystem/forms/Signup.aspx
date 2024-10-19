<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MarketManagementSystem.forms.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Signup : Market Management System</title>
    <link href="../style/style.css" rel="stylesheet" />
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
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="txtBox" />
            </div>
            <div class="styleDF">
                <asp:Label ID="lblConfirmPassword" Text="Confirm Password:"  runat="server" Font-Size="Large" />
                <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="txtBox" />
            </div>
        </div>

        <asp:Button ID="btnSignup" Text="Sign Up" runat="server" CssClass="btn" OnClick="btnSignup_Click" />
        <asp:LinkButton ID="lnkBtnHaveAccount" PostBackUrl="~/forms/Login.aspx" Text="Already have an account?" runat="server" />

    </form>
</body>
</html>
