<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelKontrol.aspx.cs" Inherits="SampleServerControl.PanelKontrol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Panel Control</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlGender" runat="server">
                <label>Gender :</label>
                <asp:RadioButton Text="Male" GroupName="gender" runat="server" />
                <asp:RadioButton Text="Female" GroupName="gender" runat="server" />
            </asp:Panel>
            <asp:Button ID="btnShow" Text="Show" runat="server" OnClick="btnShow_Click" />&nbsp;
            <asp:Button ID="btnHide" Text="Hide" runat="server" OnClick="btnHide_Click" />
            <br /><br />
            <asp:ValidationSummary runat="server" HeaderText="Kesalahan"
                ShowMessageBox="true" ShowSummary="true" />
            <label>Username :</label><br />
            <asp:TextBox ID="txtUsername" runat="server" /><br />
            <asp:RequiredFieldValidator ErrorMessage="{username harus diisi}" 
                ControlToValidate="txtUsername" runat="server" ForeColor="Red" /><br /><br />
            <label>Password :</label><br />
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" /><br />
            <label>Repassword :</label><br />
            <asp:TextBox runat="server" ID="txtRepassword" TextMode="Password" /><br />
            <asp:CompareValidator ErrorMessage="{Password dan Repassword harus sama}" 
                ControlToValidate="txtRepassword" ControlToCompare="txtPassword" ForeColor="Red" 
                runat="server" /><br /><br />
            <label>Umur :</label><br />
            <asp:TextBox runat="server" ID="txtUmur" /><br />
            <asp:RangeValidator ErrorMessage="{range umur 17-70}" 
                ControlToValidate="txtUmur" Type="Integer" MinimumValue="17" MaximumValue="70" 
                runat="server" ForeColor="Red" /><br /><br />

            <label>Email :</label><br />
            <asp:TextBox runat="server" ID="txtEmail" /><br />
            <asp:RegularExpressionValidator ErrorMessage="{email tidak sesuai}" 
                ControlToValidate="txtEmail"
                ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                runat="server" ForeColor="Red" /><br /><br />

            <label>Nik :</label><br />
            <asp:TextBox runat="server" ID="txtNik" /><br />
            <asp:CustomValidator ID="cvNik" ErrorMessage="{Format Nik tidak sesuai}" 
                ControlToValidate="txtNik" ForeColor="Red" 
                OnServerValidate="cvNik_ServerValidate" runat="server" /><br /><br />

            <asp:Button ID="btnSubmit" Text="Submit" 
                runat="server" />
        </div>
    </form>
</body>
</html>
