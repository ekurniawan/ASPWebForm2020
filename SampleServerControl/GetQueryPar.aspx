<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="GetQueryPar.aspx.cs" Inherits="SampleServerControl.GetQueryPar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:SqlDataSource ID="sdsBerita" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Berita] WHERE ([id_kat] = @id_kat)" >
            <SelectParameters>
                <asp:QueryStringParameter Name="id_kat" QueryStringField="id_kat" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
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
</asp:Content>
