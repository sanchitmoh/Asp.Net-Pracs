<%@ Page Title="Web Service Demo"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="Webservice._Default" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Consume Web Service</h2>

    <table class="table">

        <tr>
            <td>Number 1</td>
            <td>
                <asp:TextBox
                    ID="txtNum1"
                    runat="server">
                </asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Number 2</td>
            <td>
                <asp:TextBox
                    ID="txtNum2"
                    runat="server">
                </asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Button
                    ID="btnAdd"
                    runat="server"
                    Text="Add Numbers"
                    OnClick="btnAdd_Click" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Label
                    ID="lblResult"
                    runat="server"
                    Font-Bold="true">
                </asp:Label>
            </td>
        </tr>

    </table>

</asp:Content>