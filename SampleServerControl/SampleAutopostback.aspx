<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleAutopostback.aspx.cs" Inherits="SampleServerControl.SampleAutopostback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Masukan Keyword :
            <asp:TextBox ID="txtSearch" AutoPostBack="true" 
                runat="server" OnTextChanged="txtSearch_TextChanged" /><br />
            <asp:Label ID="lblSearch" runat="server" />
        </div>
    </form>
</body>
</html>
