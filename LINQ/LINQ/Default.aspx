<%@ Page Title="LINQ Demo" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="WebpageDemo._Default" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <h2>LINQ Demonstration</h2>

    <p>
        Displaying students whose course is BCA using LINQ Query.
    </p>

    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="true"
        CssClass="table table-bordered">
    </asp:GridView>

</asp:Content>