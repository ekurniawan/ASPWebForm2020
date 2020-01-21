<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleDropdownList.aspx.cs" Inherits="SampleServerControl.SampleDropdownList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
        SelectCommand="SELECT * FROM [Kategori] ORDER BY [nama_kat]"
        DeleteCommand="DELETE FROM [Kategori] WHERE [id_kat] = @id_kat"
        InsertCommand="INSERT INTO [Kategori] ([nama_kat]) VALUES (@nama_kat)"
        UpdateCommand="UPDATE [Kategori] SET [nama_kat] = @nama_kat WHERE [id_kat] = @id_kat">
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
            <asp:DetailsView CssClass="table table-bordered" ID="dvKategori" runat="server" AutoGenerateRows="False"
                DataKeyNames="id_kat" DataSourceID="sdsData" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="id_kat" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
                    <asp:BoundField DataField="nama_kat" HeaderText="Nama Kategori" SortExpression="nama_kat" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </div>
        <div class="col-md-6">
            <asp:GridView ID="gvKategori" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False"
                DataKeyNames="id_kat" DataSourceID="sdsData"
                AllowPaging="True" PageSize="3" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id_kat"
                        HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
                    <asp:BoundField DataField="nama_kat"
                        HeaderText="Nama" SortExpression="nama_kat" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <label>Masukan Judul Berita :</label>
            <asp:TextBox ID="txtJudul" runat="server" AutoPostBack="true" /><br />
            <asp:SqlDataSource ID="sdsBerita" runat="server" OnUpdating="sdsBerita_Updating"
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                SelectCommand="SELECT * FROM [Berita] ORDER BY [judul_berita]"
                FilterExpression="judul_berita like '%{0}%'" OnSelected="sdsBerita_Selected" 
                DeleteCommand="DELETE FROM [Berita] WHERE [id_berita] = @id_berita" 
                InsertCommand="INSERT INTO [Berita] ([id_kat], [judul_berita], [detail_berita], [tanggal]) VALUES (@id_kat, @judul_berita, @detail_berita, @tanggal)" 
                UpdateCommand="UPDATE [Berita] SET [id_kat] = @id_kat, [judul_berita] = @judul_berita, [detail_berita] = @detail_berita, [tanggal] = @tanggal WHERE [id_berita] = @id_berita">
                <DeleteParameters>
                    <asp:Parameter Name="id_berita" Type="Int32" />
                </DeleteParameters>
                <FilterParameters>
                    <asp:ControlParameter ControlID="txtJudul" Name="judul_berita" />
                </FilterParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_kat" Type="Int32" />
                    <asp:Parameter Name="judul_berita" Type="String" />
                    <asp:Parameter Name="detail_berita" Type="String" />
                    <asp:Parameter Name="tanggal" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_kat" Type="Int32" />
                    <asp:Parameter Name="judul_berita" Type="String" />
                    <asp:Parameter Name="detail_berita" Type="String" />
                    <asp:Parameter Name="tanggal" Type="DateTime" />
                    <asp:Parameter Name="id_berita" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gvBerita" CssClass="table table-bordered"
                runat="server" AutoGenerateColumns="False" DataKeyNames="id_berita" DataSourceID="sdsBerita">
                <Columns>
                    <asp:BoundField DataField="id_berita" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_berita" />
                    <asp:BoundField DataField="judul_berita" HeaderText="Judul Berita" SortExpression="judul_berita" />
                    <asp:BoundField DataField="detail_berita" HeaderText="Detail" SortExpression="detail_berita" />
                    <asp:BoundField DataField="tanggal" HeaderText="Tanggal" SortExpression="tanggal" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblError" ForeColor="Red" runat="server" />
        </div>
       
        <div class="col-md-6">
             <asp:DetailsView ID="dvBerita" runat="server" CssClass="table table-bordered"
            AutoGenerateRows="False" DataKeyNames="id_berita" DataSourceID="sdsBerita" AutoGenerateEditButton="true" >
            <Fields>
                <asp:BoundField DataField="id_berita" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_berita" />
                <asp:BoundField DataField="id_kat" HeaderText="Kategori" SortExpression="id_kat" />
                <asp:BoundField DataField="judul_berita" HeaderText="Judul" SortExpression="judul_berita" />
                <asp:BoundField DataField="detail_berita" HeaderText="Detail" SortExpression="detail_berita" />
                <asp:BoundField DataField="tanggal" HeaderText="Tanggal" SortExpression="tanggal" />
            </Fields>
        </asp:DetailsView>
        </div>
    </div>




</asp:Content>
