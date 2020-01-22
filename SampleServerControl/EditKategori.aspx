<%@ Page Title="Edit Kategori" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="EditKategori.aspx.cs" Inherits="SampleServerControl.EditKategori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource ID="odsKategori" TypeName="SampleServerControl.DAL.KategoriDAL"
        SelectMethod="GetById" UpdateMethod="Update" DeleteMethod="Delete" runat="server">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_kat" QueryStringField="id_kat" />
        </SelectParameters>
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
            <asp:FormView ID="frmEditKat" DataSourceID="odsKategori" OnItemUpdated="frmEditKat_ItemUpdated"
                DefaultMode="Edit" runat="server">
                <EditItemTemplate>
                    <div class="form-group">
                        <label>ID :</label>
                        <asp:TextBox ID="txtID" CssClass="form-control"
                            Text='<%# Bind("id_kat") %>' ReadOnly="true" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Nama :</label>
                        <asp:TextBox ID="txtNama" CssClass="form-control"
                            Text='<%# Bind("nama_kat") %>' runat="server" /><br />
                        <asp:RequiredFieldValidator ErrorMessage="Name Required" ControlToValidate="txtNama" runat="server" />
                    </div>
                    <asp:Button Text="Update" CssClass="btn btn-warning btn-sm" CommandName="Update" runat="server" />&nbsp;
                    <asp:Button Text="Cancel" CssClass="btn btn-danger btn-sm" CommandName="Cancel" runat="server" />
                </EditItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>
