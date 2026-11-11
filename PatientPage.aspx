<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="web_cl2vf.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #Select1 {
            width: 353px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please, sign up for your new account:</div>
        <p>
            Username:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            Pasword:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
    </form>
    <p>
        <select id="Select1" name="D1">
            <option></option>
        </select></p>
</body>
</html>
