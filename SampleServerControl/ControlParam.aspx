<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="ControlParam.aspx.cs" Inherits="SampleServerControl.ControlParam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">
            <asp:SqlDataSource runat="server" ID="sdsKategori" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT [id_kat], [nama_kat] FROM [Kategori] ORDER BY [nama_kat]" />
            <label>Pilih Kategori :</label>
            <asp:DropDownList ID="ddKategori" runat="server"
                DataSourceID="sdsKategori" DataTextField="nama_kat"
                DataValueField="id_kat" AutoPostBack="true" />
            <asp:SqlDataSource ID="sdsBerita" runat="server"
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                SelectCommand="SELECT Berita.id_berita, Berita.judul_berita, Berita.detail_berita, Berita.tanggal, Kategori.id_kat, Kategori.nama_kat FROM Berita INNER JOIN Kategori ON Berita.id_kat = Kategori.id_kat WHERE (Berita.id_kat = @id_kat)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddKategori"
                        Name="id_kat" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvBerita" CssClass="table table-bordered"
                runat="server" AutoGenerateColumns="False" DataKeyNames="id_berita"
                DataSourceID="sdsBerita">
                <Columns>
                    <asp:BoundField DataField="id_berita" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_berita" />
                    <asp:BoundField DataField="nama_kat" HeaderText="Kategori" SortExpression="nama_kat" />
                    <asp:BoundField DataField="judul_berita" HeaderText="Judul" SortExpression="judul_berita" />
                    <asp:BoundField DataField="detail_berita" HeaderText="Detail" SortExpression="detail_berita" />
                    <asp:BoundField DataField="tanggal" HeaderText="Tanggal" SortExpression="tanggal" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-6">
            <label>Masukan Kategori ID:</label>
            <asp:TextBox ID="txtKategori" runat="server" />
            <asp:Button ID="btnBuatCookie" CssClass="btn btn-primary btn-sm" Text="Buat Cookie" runat="server" OnClick="btnBuatCookie_Click" />
            <br />
            <asp:SqlDataSource ID="sdsBeritaCookie" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Berita] WHERE ([id_kat] = @id_kat)">
                <SelectParameters>
                    <asp:CookieParameter CookieName="id_kat"
                        Name="id_kat" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvCookie" CssClass="table table-bordered"
                runat="server" AutoGenerateColumns="False"
                DataKeyNames="id_berita" DataSourceID="sdsBeritaCookie">
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
    <div class="row">
        <div class="col-md-6">
            <label>Masukan Kategori ID:</label>
            <asp:TextBox ID="txtSession" runat="server" />
            <asp:Button ID="btnSession" CssClass="btn btn-primary btn-sm" Text="Buat Session" runat="server" OnClick="btnSession_Click" />
            <br />
            <asp:SqlDataSource ID="sdsSession" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" SelectCommand="SELECT * FROM [Berita] WHERE ([id_kat] = @id_kat)">
                <SelectParameters>
                    <asp:SessionParameter SessionField="id_kat" 
                        Name="id_kat" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvSession" CssClass="table table-bordered"
                runat="server" AutoGenerateColumns="False"
                DataKeyNames="id_berita" DataSourceID="sdsSession">
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

</asp:Content>
