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
            <asp:ListView ID="lvKategori" OnItemDataBound="lvKategori_ItemDataBound" 
                DataSourceID="sdsKategori" DataKeyNames="id_kat" runat="server"
                InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <table class="table table-striped">
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Nama</th>
                            <th></th>
                        </tr>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </table>
                    <asp:DataPager ID="dpKategori" PageSize="3" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ShowFirstPageButton="true"
                                ShowPreviousPageButton="true" ShowLastPageButton="false"
                                ShowNextPageButton="false" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ShowFirstPageButton="false"
                                ShowPreviousPageButton="false"
                                ShowNextPageButton="true"
                                ShowLastPageButton="true" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:Label ID="lblNo" runat="server" /></td>
                        <td><%# Eval("id_kat") %></td>
                        <td><%# Eval("nama_kat") %></td>
                        <td>
                            <asp:LinkButton CssClass="btn btn-primary btn-sm" Text="Edit"
                               CommandName="Edit" runat="server" />
                        </td>
                    </tr>
                </ItemTemplate>
                <InsertItemTemplate>
                    <div class="alert alert-warning">
                        <asp:Label ID="lblNo" runat="server" />
                        <label>Nama Kategori :</label><br />
                        <asp:TextBox ID="txtNama" Text='<%# Bind("nama_kat") %>' runat="server" /><br />
                        <asp:RequiredFieldValidator ErrorMessage="Nama Required" ForeColor="Red" ControlToValidate="txtNama" runat="server" /><br />
                        <asp:LinkButton CssClass="btn btn-success btn-sm" Text="Insert" CommandName="Insert" runat="server" />
                    </div>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div class="alert alert-success">
                        <asp:Label ID="lblNo" runat="server" />
                        <label>Nama Kategori :</label><br />
                        <asp:TextBox ID="txtNama" Text='<%# Bind("nama_kat") %>' runat="server" /><br />
                        <asp:RequiredFieldValidator ErrorMessage="Nama Required" ForeColor="Red" ControlToValidate="txtNama" runat="server" /><br />
                        <asp:LinkButton CssClass="btn btn-primary btn-sm" Text="Update" CommandName="Update" runat="server" />&nbsp;
                        <asp:LinkButton CssClass="btn btn-warning btn-sm" Text="Cancel" CommandName="Cancel" runat="server" />
                    </div>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    Data MAsih Kosong...
                </EmptyDataTemplate>
            </asp:ListView>
        </div>

    </div>
</asp:Content>
