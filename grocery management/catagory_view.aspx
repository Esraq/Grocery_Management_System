<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="catagory_view.aspx.cs" Inherits="grocery_management.catagory_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 52px;
        }
        .auto-style2 {
            width: 139px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 style="text-align: center;">Catagories</h1>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/product_view.aspx"><h3>Products</h3></asp:HyperLink>
        <table>
            <tr>
                <td><h3>Add Catagory</h3></td>
                <td><asp:TextBox ID="CatagoryTextBox" runat="server"></asp:TextBox></td>
                <td class="auto-style1"><asp:RequiredFieldValidator style="color:red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter catagory name to insert" ValidationGroup='insert' ControlToValidate="CatagoryTextBox"></asp:RequiredFieldValidator></td>
                <td><h3>Delete Catagory</h3></td>
                <td class="auto-style2"><asp:DropDownList ID="DeleteCatagoryDropDownList" runat="server">

                    </asp:DropDownList></td>
                <td></td>
                <td><h3>Search Catagory</h3></td>
                <td><asp:TextBox ID="SearchCatagoryTextBox" runat="server"></asp:TextBox></td>
                <td><h3>Update Catagory</h3></td>
                <td><asp:DropDownList ID="UpdateDropDownList" runat="server"></asp:DropDownList></td>
                <td>to</td>
                <td><asp:TextBox ID="UpdateTextBox" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field Required" ValidationGroup="update" ControlToValidate="UpdateTextBox"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="AddButton" runat="server" Text="Add Catagories" OnClick="AddButton_Click" ValidationGroup="insert" /></td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td></td>
                <td class="auto-style2"><asp:Button ID="DeleteButton" runat="server" Text="Delete Catagory" OnClick="DeleteButton_Click" ValidationGroup="delete" /></td>
                <td>
                    &nbsp;</td>
                <td></td>
                <td><asp:Button ID="SearchButton" runat="server" Text="Search Catagory" OnClick="SearchButton_Click" /></td>
                <td></td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" ValidationGroup="update" Width="77px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="CatagoryGridView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td></td>
                <td></td>
                <td class="auto-style1">
                    <asp:GridView ID="SearchGridView" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </td>
            </tr>
         </table>
    </div>
    </form>
</body>
</html>
