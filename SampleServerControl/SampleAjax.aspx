<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleAjax.aspx.cs" Inherits="SampleServerControl.SampleAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label ID="lblKet" runat="server" />
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblUpdatePanel" runat="server" />
            <asp:SqlDataSource ID="sdsKategori" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                SelectCommand="SELECT [id_kat], [nama_kat] FROM [Kategori]" />
            <asp:GridView ID="gvKategori" CssClass="table table-bordered" 
                runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id_kat" DataSourceID="sdsKategori" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id_kat" HeaderText="id_kat" InsertVisible="False" ReadOnly="True" SortExpression="id_kat" />
                    <asp:BoundField DataField="nama_kat" HeaderText="nama_kat" SortExpression="nama_kat" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
