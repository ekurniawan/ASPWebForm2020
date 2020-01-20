<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormUpload.aspx.cs" Inherits="SampleServerControl.FormUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label>Masukan File Gambar :</label>
            <asp:FileUpload ID="fpGambar" runat="server" /><br />
            <asp:Button ID="btnUpload" Text="Upload File" runat="server" OnClick="btnUpload_Click" />
            <br /><br />
            <asp:Label ID="lblKet" runat="server" /><br /><br />
            <asp:DataList ID="dlPhoto" RepeatColumns="3" runat="server">
                <ItemTemplate>
                    <asp:Image ID="imgPic" ImageUrl='<%# Eval("Name","~/Images/{0}") %>' 
                        runat="server" style="width:200px;" /><br />
                    <%# Eval("Name") %>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
