<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleGrid.aspx.cs" Inherits="SampleServerControl.SampleGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT [id_kat], [nama_kat] FROM [Kategori]" />

    <div class="row">
        <div class="col-md-6">
            <asp:GridView ID="gvKategori" runat="server" CssClass="table table-bordered"
                AutoGenerateColumns="False" DataKeyNames="id_kat" DataSourceID="sdsKategori">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id_kat" HeaderText="id_kat" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
                    <asp:BoundField DataField="nama_kat" HeaderText="nama_kat" SortExpression="nama_kat" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-6">
            <asp:GridView ID="gvBerita" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="id_berita" DataSourceID="sdsBerita">
                <Columns>
                    <asp:BoundField DataField="id_berita" HeaderText="id_berita" InsertVisible="False" ReadOnly="True" SortExpression="id_berita" />
                    <asp:BoundField DataField="id_kat" HeaderText="id_kat" SortExpression="id_kat" />
                    <asp:BoundField DataField="judul_berita" HeaderText="judul_berita" SortExpression="judul_berita" />
                    <asp:BoundField DataField="detail_berita" HeaderText="detail_berita" SortExpression="detail_berita" />
                    <asp:BoundField DataField="tanggal" HeaderText="tanggal" SortExpression="tanggal" />
                </Columns>
            </asp:GridView>
        </div>
    </div>


    <asp:SqlDataSource ID="sdsBerita" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Berita] WHERE ([id_kat] = @id_kat)">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvKategori"
                Name="id_kat" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
