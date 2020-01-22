<%@ Page Title="Sample ADO" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleADO.aspx.cs" Inherits="SampleServerControl.SampleADO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gvKategori" CssClass="table table-bordered" runat="server">
    </asp:GridView>
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
</asp:Content>
