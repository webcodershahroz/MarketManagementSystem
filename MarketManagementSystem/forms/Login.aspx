<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MarketManagementSystem.forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Login : Market Management System</title>
    <link href="../style/style.css" rel="stylesheet" />
</head>
<body>
    <form class="formLogin" id="form1" runat="server">
        <asp:Label ID="lblLogin" runat="server" Text="Login" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="60px"></asp:Label>
        <asp:Label Text="Welcome to MMS" runat="server" Font-Size="X-Large" Font-Bold="True" />
        <asp:Label ForeColor="Red" ID="lblIncorrectEmailPassword" runat="server" />
        <div style="display: flex; flex-direction: column">
            <asp:Label Text="Email:" runat="server" Font-Size="Large" />
            <asp:TextBox runat="server" ID="txtEmail" CssClass="txtBox" />
        </div>
        <div style="display: flex; flex-direction: column">
            <asp:Label Text="Password:" runat="server" Font-Size="Large" />
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="txtBox" />
        <asp:LinkButton ID="lnkBtnForgetPass" Text="Forget Password?" runat="server" />
        </div>
        <div><asp:CheckBox Text="Remember me" runat="server" /></div>
        <asp:Button ID="btnLogin" Text="Login"  runat="server" CssClass="btn" OnClick="btnLogin_Click"/>
        <asp:LinkButton ID="lnkBtnCreateAccount" PostBackUrl="~/forms/Signup.aspx" Text="Don't have an account? Create Now." runat="server" />

    </form>
</body>
</html>
