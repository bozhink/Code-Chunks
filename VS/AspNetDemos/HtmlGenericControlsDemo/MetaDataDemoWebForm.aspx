<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetaDataDemoWebForm.aspx.cs" Inherits="HtmlGenericControlsDemo.MetaDataDemoWebForm" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta id="MetaInfo" runat="server" />
    <title>Meta Data Demo</title>
    <script runat="server">
        void Page_Load(object sender, EventArgs e)
        {
            this.MetaInfo.Attributes["name"] = "description";
            this.MetaInfo.Attributes["content"] = "The page was generated on: " + DateTime.Now.ToString();
        }
    </script>
</head>
<body>
    <form id="formMain" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
