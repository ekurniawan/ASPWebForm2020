<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="BeritaWithKategori.aspx.cs" Inherits="SampleServerControl.BeritaWithKategori" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource ID="odsBeritaWithKategori" 
       TypeName="SampleServerControl.DAL.ViewBeritaWithKategoriDAL"
       SelectMethod="GetAll" runat="server" />
    <div class="row">
        <div class="col-md-6">
            <asp:GridView ID="gvBerita" CssClass="table table-bordered" 
               DataSourceID="odsBeritaWithKategori" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="id_berita" HeaderText="ID" SortExpression="id_berita" />
                    <asp:BoundField DataField="nama_kat" HeaderText="Kategori" SortExpression="nama_kat" />
                    <asp:BoundField DataField="judul_berita" HeaderText="Judul" SortExpression="judul_berita" />
                    <asp:BoundField DataField="detail_berita" HeaderText="Detail" SortExpression="detail_berita" />
                    <asp:BoundField DataField="tanggal" HeaderText="Tanggal" SortExpression="tanggal" />
                    <asp:CheckBoxField DataField="isapprove" HeaderText="Approval" SortExpression="isapprove" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
