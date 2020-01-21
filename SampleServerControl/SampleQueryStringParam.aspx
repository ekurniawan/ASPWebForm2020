<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleQueryStringParam.aspx.cs" Inherits="SampleServerControl.SampleQueryStringParam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT * FROM [Kategori] ORDER BY [nama_kat]" />
    <asp:GridView runat="server" CssClass="table table-bordered" ID="gvKategori" AutoGenerateColumns="False" 
        DataKeyNames="id_kat" DataSourceID="sdsKategori">
        <Columns>
            <asp:BoundField DataField="id_kat" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
            <asp:BoundField DataField="nama_kat" HeaderText="Nama" SortExpression="nama_kat" />
            <asp:HyperLinkField DataNavigateUrlFields="id_kat" 
                DataNavigateUrlFormatString="GetQueryPar?id_kat={0}" 
                DataTextField="nama_kat" />
        </Columns>
    </asp:GridView>
</asp:Content>
