<%@ Page Title="Client Side Session Management"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="SessionManagment._Default" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Client Side Session Management Using Cookies</h2>

    <table class="table">

        <tr>
            <td>Name :</td>
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
                    ID="btnSave"
                    runat="server"
                    Text="Save Cookie"
                    CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    Font-Bold="true">
                </asp:Label>
            </td>
        </tr>

    </table>

</asp:Content>