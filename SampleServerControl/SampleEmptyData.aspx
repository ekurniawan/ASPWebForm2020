<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleEmptyData.aspx.cs" Inherits="SampleServerControl.SampleEmptyData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">
            <label>Search Kategori: </label>
            <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="true" />

            <asp:SqlDataSource ID="sdsKategori" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                SelectCommand="SELECT * FROM [Kategori] WHERE ([nama_kat] LIKE '%' + @nama_kat + '%')" 
                DeleteCommand="DELETE FROM [Kategori] WHERE [id_kat] = @id_kat" 
                InsertCommand="INSERT INTO [Kategori] ([nama_kat]) VALUES (@nama_kat)" 
                UpdateCommand="UPDATE [Kategori] SET [nama_kat] = @nama_kat WHERE [id_kat] = @id_kat" >
                <DeleteParameters>
                    <asp:Parameter Name="id_kat" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nama_kat" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="nama_kat" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nama_kat" Type="String" />
                    <asp:Parameter Name="id_kat" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvKategori" CssClass="table table-bordered" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="id_kat" DataSourceID="sdsKategori">
                <Columns>
                    <asp:BoundField DataField="id_kat" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
                    <asp:BoundField DataField="nama_kat" HeaderText="Nama Kategori" 
                        SortExpression="nama_kat" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:FormView ID="fvKategori" DataSourceID="sdsKategori" DefaultMode="Insert" runat="server">
                        <InsertItemTemplate>
                            <label>Nama Kategori :</label>
                            <asp:TextBox ID="txtNamaKat" runat="server" Text='<%# Bind("nama_kat") %>' />
                            <asp:Button ID="btnInsert" CommandName="Insert" Text="Insert" runat="server" />
                        </InsertItemTemplate>
                    </asp:FormView>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
