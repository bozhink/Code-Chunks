<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebServerControlsDemo.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Web Server Controls</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBoxInput" runat="server" TextMode="SingleLine"></asp:TextBox>
            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
            <asp:Label ID="LabelResult" runat="server" Text="..." Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
