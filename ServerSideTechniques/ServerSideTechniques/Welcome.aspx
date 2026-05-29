<%@ Page Title="Welcome"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Welcome.aspx.cs"
    Inherits="ServerSideTechniques.Welcome" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>Welcome Page</h2>

    <asp:Label
        ID="lblName"
        runat="server"
        Font-Size="Large"
        Font-Bold="true">
    </asp:Label>

    <br /><br />

    <asp:Button
        ID="btnLogout"
        runat="server"
        Text="Clear Session"
        CssClass="btn btn-danger"
        OnClick="btnLogout_Click" />

</asp:Content>