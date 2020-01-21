<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleListView.aspx.cs" Inherits="SampleServerControl.SampleListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" DeleteCommand="DELETE FROM [Kategori] WHERE [id_kat] = @id_kat" InsertCommand="INSERT INTO [Kategori] ([nama_kat]) VALUES (@nama_kat)" SelectCommand="SELECT * FROM [Kategori] ORDER BY [nama_kat]" UpdateCommand="UPDATE [Kategori] SET [nama_kat] = @nama_kat WHERE [id_kat] = @id_kat">
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

    <div class="row">
        <div class="col-md-6">
            <asp:ListView ID="lvKategori" DataSourceID="sdsKategori" runat="server">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <tr>
                            <th>ID</th>
                            <th>Nama</th>
                        </tr>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id_kat") %></td>
                        <td><%# Eval("nama_kat") %></td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    Data MAsih Kosong...
                </EmptyDataTemplate>
            </asp:ListView>
        </div>

    </div>
</asp:Content>
