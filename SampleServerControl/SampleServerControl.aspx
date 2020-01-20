<%@ Page Language="C#" AutoEventWireup="true" 
    CodeBehind="SampleServerControl.aspx.cs"
    Inherits="SampleServerControl.SampleServerControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sample Server Control</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtTanggal" TextMode="Date" 
                runat="server" /><br />
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" /><Br />
            <asp:Button ID="btnAdd" 
                OnClick="btnAdd_Click" runat="server" Text="Add" />
            <asp:Label ID="lblCounter" ViewStateMode="Disabled"
                runat="server" Text="0" />
        </div>
    </form>
</body>
</html>
