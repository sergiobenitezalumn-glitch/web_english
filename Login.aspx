<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="web_cl2vf.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Login</title>
<link href="Content/Site.css" rel="stylesheet" />
<link href="Content/Login.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
        
        <header>
            <nav id="nav-head">
                <img src="https://ximg.es/200/ccc/000" />
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

                <asp:Button ID="btnLogin" runat="server" Text="Login" />

            </div>
        </div>


    </form>
</body>
</html>
