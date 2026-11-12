<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="web_cl2vf.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <header>
            <nav id="nav-head">
                <img src="https://ximg.es/200/ccc/000" />
                <asp:Button class="btn-login" runat="server" Text="Login" />
            </nav>
        </header>

        <h1>Login</h1>

        <p>Please enter your credentials to log in.</p>

        <p>Username:</p>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <br />
        <p>Password:</p>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" />

    </form>
</body>
</html>
