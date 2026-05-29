<%@ Page Title="Session Demo"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="ServerSideTechniques._Default" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Server Side Session Management</h2>

    <table class="table">

        <tr>
            <td>Enter Name:</td>
            <td>
                <asp:TextBox
                    ID="txtName"
                    runat="server">
                </asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Button
                    ID="btnNext"
                    runat="server"
                    Text="Go To Welcome Page"
                    CssClass="btn btn-primary"
                    OnClick="btnNext_Click" />
            </td>
        </tr>

    </table>

</asp:Content>