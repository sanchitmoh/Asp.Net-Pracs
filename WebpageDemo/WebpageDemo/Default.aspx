<%@ Page Title="Student Details"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Default.aspx.cs"
Inherits="WebpageDemo._Default" %>

<asp:Content ID="BodyContent"
ContentPlaceHolderID="MainContent"
runat="server">

    <h2>Student Information System</h2>

    <br />

    <asp:Label ID="Label1"
        runat="server"
        Text="Select Student">
    </asp:Label>

    <br /><br />

    <asp:DropDownList
        ID="ddlStudents"
        runat="server"
        AutoPostBack="true"
        OnSelectedIndexChanged="ddlStudents_SelectedIndexChanged">
    </asp:DropDownList>

    <br /><br />

    <asp:GridView
        ID="GridView1"
        runat="server"
        CssClass="table table-bordered">
    </asp:GridView>

</asp:Content>