<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="GridWithCheckbox.aspx.cs" Inherits="SampleServerControl.GridWithCheckbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsBerita" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT Berita.id_berita, Berita.id_kat, Berita.judul_berita, Berita.detail_berita, Berita.tanggal, Berita.isapprove, Berita.pics, Kategori.nama_kat FROM Berita INNER JOIN Kategori ON Berita.id_kat = Kategori.id_kat ORDER BY Berita.judul_berita" 
        DeleteCommand="DELETE FROM [Berita] WHERE [id_berita] = @id_berita" 
        InsertCommand="INSERT INTO [Berita] ([id_kat], [judul_berita], [detail_berita], [tanggal], [isapprove], [pics]) VALUES (@id_kat, @judul_berita, @detail_berita, @tanggal, @isapprove, @pics)" 
        UpdateCommand="UPDATE [Berita] SET [id_kat] = @id_kat, [judul_berita] = @judul_berita, [detail_berita] = @detail_berita, [isapprove] = @isapprove, [pics] = @pics WHERE [id_berita] = @id_berita" >
        <DeleteParameters>
            <asp:Parameter Name="id_berita" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
            <asp:Parameter Name="judul_berita" Type="String" />
            <asp:Parameter Name="detail_berita" Type="String" />
            <asp:Parameter Name="tanggal" Type="DateTime" />
            <asp:Parameter Name="isapprove" Type="Boolean" />
            <asp:Parameter Name="pics" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
            <asp:Parameter Name="judul_berita" Type="String" />
            <asp:Parameter Name="detail_berita" Type="String" />
            <asp:Parameter Name="isapprove" Type="Boolean" />
            <asp:Parameter Name="pics" Type="String" />
            <asp:Parameter Name="id_berita" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT * FROM [Kategori] ORDER BY [nama_kat]" />
    <asp:GridView ID="gvBerita" runat="server" 
        CssClass="table table-bordered" AutoGenerateColumns="False" 
        DataKeyNames="id_berita" DataSourceID="sdsBerita" ShowFooter="true"
        OnRowDataBound="gvBerita_RowDataBound">
        <Columns>
            <asp:BoundField DataField="id_berita" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_berita" />
            <asp:TemplateField HeaderText="Kategori">
                <ItemTemplate>
                    <%# Eval("nama_kat") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList 
                        DataTextField="nama_kat" DataValueField="id_kat"
                        SelectedValue='<%# Bind("id_kat") %>'
                        DataSourceID="sdsKategori" ID="ddKategori" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="judul_berita" HeaderText="judul_berita" SortExpression="judul_berita" />
            <asp:BoundField DataField="detail_berita" HeaderText="detail_berita" SortExpression="detail_berita" />
            <asp:CheckBoxField DataField="isapprove" HeaderText="isapprove" SortExpression="isapprove" />
            <asp:ImageField DataImageUrlField="pics" DataImageUrlFormatString="~/Images/{0}">
                <ControlStyle Width="100px" />
            </asp:ImageField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
