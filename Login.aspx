<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="web_cl2vf.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link rel="stylesheet" href="Content/Site.css" />
    <link rel="stylesheet" href="Content/Login.css" />
</head>
<body>
    <form id="form1" runat="server">
        
        <header>
            <nav id="nav-head">
                <a href="Hero.aspx">
                    <img src="img/logo2.png" alt="Doctor's House Logo" />
                </a>
            </nav>
        </header>
            
        
<div class="login-container">
    <div class="login-box">

        <h1>Login</h1>

        <p class="description">Please enter your credentials to log in.</p>

        <p>Username:</p>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

        <p>Password:</p>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

    </div>
</div>


    </form>
</body>
</html>
<!-- comentario 2 -->

