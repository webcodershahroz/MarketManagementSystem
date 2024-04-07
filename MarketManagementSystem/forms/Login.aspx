<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MarketManagementSystem.forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Login : Market Management System</title>
    <style>
        body{
            background: #eeeeee;
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Calibri;
        }
        .lblLogin {
            text-align: center;
        }

        .formLogin {
            width: 40%;
            margin: auto;
            display:flex;
            flex-direction:column;
            align-items:center;
            gap:20px;
            height:90vh;
            justify-content:center;
            
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
    </style>
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
            <asp:TextBox runat="server" ID="txtPassword" CssClass="txtBox" />
        <asp:LinkButton ID="lnkBtnForgetPass" Text="Forget Password?" runat="server" />
        </div>
        <div><asp:CheckBox Text="Remember me" runat="server" /></div>
        <asp:Button ID="btnLogin" Text="Login"  runat="server" CssClass="btn" OnClick="btnLogin_Click"/>
        <asp:LinkButton ID="lnkBtnCreateAccount" PostBackUrl="~/forms/Signup.aspx" Text="Don't have an account? Create Now." runat="server" />

    </form>
</body>
</html>
