<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrayDataBindWebForm.aspx.cs" Inherits="DataBindingWebApplication.Forms.ArrayDataBindWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form" runat="server">
    <div>
        <asp:Label ID="MessageLabel" runat="server" Text="" />
        <asp:CheckBoxList ID="CheckBoxListItem" runat="server" OnSelectedIndexChanged="CheckBoxListItem_SelectedIndexChanged" AutoPostBack="true"/>
    </div>
    </form>
</body>
</html>
