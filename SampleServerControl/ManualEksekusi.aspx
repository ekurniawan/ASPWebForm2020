<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="ManualEksekusi.aspx.cs" Inherits="SampleServerControl.ManualEksekusi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsKategori" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        DeleteCommand="DELETE FROM [Kategori] WHERE [id_kat] = @id_kat" 
        InsertCommand="INSERT INTO [Kategori] ([nama_kat]) VALUES (@nama_kat)" 
        SelectCommand="SELECT [id_kat], [nama_kat] FROM [Kategori]" 
        UpdateCommand="UPDATE [Kategori] SET [nama_kat] = @nama_kat WHERE [id_kat] = @id_kat" >
        <DeleteParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nama_kat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nama_kat" Type="String" />
            <asp:Parameter Name="id_kat" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <label>Masukan Nama Kategori :</label>
    <asp:TextBox runat="server" ID="txtNama" />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" /><br /><br />
    <asp:Label ID="lblKet" runat="server" />
</asp:Content>
