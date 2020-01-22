<%@ Page Title="Sample ADO" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleADO.aspx.cs" Inherits="SampleServerControl.SampleADO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="row-md-6">
            <asp:Label ID="lblKet" runat="server" /><br />
            <div class="form-group">
                <label>ID Kategori :</label>
                <asp:TextBox ID="txtIDKategori" CssClass="form-control" runat="server" />
            </div>
            <div class="form-group">
                <label>Nama Kategori :</label>
                <asp:TextBox ID="txtNama" CssClass="form-control" runat="server" />
            </div>
            <asp:Button ID="btnInsert" CssClass="btn btn-primary btn-sm" Text="Insert" runat="server" OnClick="btnInsert_Click" />
        </div>
    </div>
    <br /><hr />
    <div class="row">
        <div class="col-md-6">
            <asp:GridView ID="gvKategori" CssClass="table table-bordered" runat="server">
            </asp:GridView>
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
        </div>
        <div class="col-md-6">
            <label>Masukan Kategori ID: </label>
            <asp:TextBox ID="txtKategori" runat="server" /><br />
            <asp:Button ID="btnGetID" Text="Submit" runat="server" OnClick="btnGetID_Click" /><br />
            <label>Nama Kategori :</label>
            <asp:TextBox ID="txtNamaKategori" runat="server" />
        </div>
    </div>


</asp:Content>
