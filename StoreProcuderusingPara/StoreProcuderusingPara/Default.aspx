<%@ Page Title="Parameterized Stored Procedure"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Default.aspx.cs"
Inherits="StoreProcuderusingPara._Default" %>

<asp:Content ID="BodyContent"
ContentPlaceHolderID="MainContent"
runat="server">

    <h2>Parameterized Stored Procedure Demo</h2>

    <table>

        <tr>
            <td>Enter Roll Number:</td>
            <td>
                <asp:TextBox
                    ID="txtRollNo"
                    runat="server">
                </asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search Student"
                    OnClick="btnSearch_Click" />
            </td>
        </tr>

    </table>

    <br />

    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="true">
    </asp:GridView>

</asp:Content>