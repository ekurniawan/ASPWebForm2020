<%@ Page Title="" Language="C#" MasterPageFile="~/Startbootstrap.Master" AutoEventWireup="true" CodeBehind="SampleJQuery.aspx.cs" Inherits="SampleServerControl.SampleJQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function callAjaxMethod(e) {

            //To prevent postback from happening as we are ASP.Net TextBox control

            //If we had used input html element, there is no need to use ' e.preventDefault()' as posback will not happen

            e.preventDefault();
            
            var url = '<%=ResolveUrl("SampleJQuery.aspx/GetData") %>';
            $.ajax({
                url: url,
                type: "post",
                dataType: "json",
                data: "{nama:'erick'}",
                contentType: "application/json; charset=utf-8",
                success: function (Result) {
                    $("#lblKet").text("Berhasil menambah data !");
                    console.log(Result.d);
                },
                error: function (e, x) {
                    alert(x.ResponseText);
                }
            });
        }
    </script>
    <label id="lblKet"></label>
    <br />
    <div>
        <table>
            <tr>
                <td>Enter the year:</td>
                <td>
                    <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAjax" runat="server" OnClientClick="callAjaxMethod(event)" Text="Call method using Ajax" />
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table>
            <tr>
                <td>Result:</td>
                <td>
                    <asp:TextBox ID="txtIsLeapYear" runat="server"></asp:TextBox></td>
            </tr>
        </table>
    </div>
</asp:Content>
