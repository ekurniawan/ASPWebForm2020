<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleDropdownList.aspx.cs" Inherits="SampleServerControl.SampleDropdownList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="ddLanguage" runat="server" 
        DataSourceID="sdsData" DataTextField="NamaKota" 
        DataValueField="KotaId">
    </asp:DropDownList>

    <asp:SqlDataSource ID="sdsData" runat="server" DataSourceMode="DataReader"
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT * FROM [Kota]" />
</asp:Content>
