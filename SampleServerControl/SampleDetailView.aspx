<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleDetailView.aspx.cs" Inherits="SampleServerControl.SampleDetailView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" DeleteCommand="DELETE FROM [Kategori] WHERE [id_kat] = @id_kat" InsertCommand="INSERT INTO [Kategori] ([nama_kat]) VALUES (@nama_kat)" SelectCommand="SELECT * FROM [Kategori]" UpdateCommand="UPDATE [Kategori] SET [nama_kat] = @nama_kat WHERE [id_kat] = @id_kat" >
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
            <asp:DetailsView ID="dvKategori" CssClass="table table-bordered" 
                AllowPaging="true"
                runat="server" AutoGenerateRows="False" DataKeyNames="id_kat" DataSourceID="sdsKategori" >
                <Fields>
                    <asp:TemplateField HeaderText="Nama Kategori">
                        <ItemTemplate>
                            <%# Eval("nama_kat") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox Text='<%# Bind("nama_kat") %>' ID="txtNama" runat="server" />
                            <asp:RequiredFieldValidator ErrorMessage="Nama required" 
                                ForeColor="Red" ControlToValidate="txtNama" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
</asp:Content>
