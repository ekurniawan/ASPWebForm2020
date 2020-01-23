<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SampleDapper.aspx.cs" Inherits="SampleServerControl.SampleDapper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="btnAmbilBerita" Text="Submit" runat="server" OnClick="btnAmbilBerita_Click" />
    <asp:Label ID="lblKet" runat="server" />
    <br />
    <asp:Button ID="btnKategori" Text="Kategori" runat="server" OnClick="btnKategori_Click" /><br />
    <asp:Label ID="lblKategori" runat="server" />
</asp:Content>
