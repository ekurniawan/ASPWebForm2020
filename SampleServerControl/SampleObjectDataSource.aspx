<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleObjectDataSource.aspx.cs" Inherits="SampleServerControl.SampleObjectDataSource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" ViewStateMode="Disabled"
    EnableViewState="false" runat="server">



    <asp:ObjectDataSource ID="odsKategori" TypeName="SampleServerControl.DAL.KategoriDAL"
        SelectMethod="GetAll" UpdateMethod="Update" DeleteMethod="Delete"
        InsertMethod="Insert" runat="server">
        <InsertParameters>
            <asp:Parameter Name="nama_kat" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
            <asp:Parameter Name="nama_kat" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="id_kat" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>

    <div class="row">
        <div class="col-md-6">
            <asp:ListView ID="lvKategori" DataKeyNames="id_kat"
                DataSourceID="odsKategori" runat="server" InsertItemPosition="FirstItem">
                <LayoutTemplate>
                    <table id="myData" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Kategori</th>
                                <th>&nbsp;</th>
                                <th>$nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </tbody>
                        <tfoot>
                            <tr>
                                <td>ID</td>
                                <td>Kategori</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </tfoot>
                    </table>
                </LayoutTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label>Nama :</label>
                        <asp:TextBox ID="txtNama" CssClass="form-control"
                            Text='<%# Bind("nama_kat") %>' runat="server" ValidationGroup="insert" />
                        <asp:RequiredFieldValidator ValidationGroup="insert" ErrorMessage="Name Required" ControlToValidate="txtNama" runat="server" />
                    </div>
                    <asp:Button Text="Insert" ValidationGroup="insert" CssClass="btn btn-warning btn-sm" CommandName="Insert" runat="server" />
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div class="form-group">
                        <label>ID :</label>
                        <asp:TextBox  ID="txtID" CssClass="form-control"
                            Text='<%# Bind("id_kat") %>' ReadOnly="true" ValidationGroup="update" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Nama :</label>
                        <asp:TextBox ID="txtNama" CssClass="form-control"
                            Text='<%# Bind("nama_kat") %>' ValidationGroup="update" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Name Required" ValidationGroup="update" ControlToValidate="txtNama" runat="server" />
                    </div>
                    <asp:Button Text="Update" CssClass="btn btn-warning btn-sm" ValidationGroup="update" CommandName="Update" runat="server" />&nbsp;
                    <asp:Button Text="Cancel" CssClass="btn btn-danger btn-sm" ValidationGroup="update" CommandName="Cancel" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id_kat") %></td>
                        <td><%# Eval("nama_kat") %></td>
                        <td><a href='<%# Eval("id_kat","~/EditKategori?id_kat={0}") %>'
                            runat="server" class="btn btn-warning btn-sm">edit</a></td>
                        <td>
                            <asp:Button CommandName="Edit" CssClass="btn btn-warning btn-sm" Text="Inline Edit" runat="server" /></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#myData').DataTable();
        });
    </script>

</asp:Content>


