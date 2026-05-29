<%@ Page Title="Stored Procedure Demo"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Default.aspx.cs"
Inherits="storeprocdureusingsimple._Default" %>

<asp:Content ID="BodyContent"
ContentPlaceHolderID="MainContent"
runat="server">

    <h2>Stored Procedure Demonstration</h2>

    <asp:Button
        ID="btnLoad"
        runat="server"
        Text="Load Students"
        CssClass="btn btn-primary"
        OnClick="btnLoad_Click" />

    <br /><br />

    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="true"
        CssClass="table table-bordered">
    </asp:GridView>

</asp:Content>