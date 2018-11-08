<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_view.aspx.cs" Inherits="grocery_management.product_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Products</h1>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/catagory_view.aspx">Catagory Page</asp:HyperLink>
        <table>
            <tr>
                <td colspan="2"><h2>Add Products</h2></td>
                <td></td>
                <td colspan="2"><h2>Delete Products</h2></td>
                <td></td>
                <td colspan="2"><h2>Search Products</h2></td>

            </tr>
            <tr>
                <td>Name</td>
                <td><asp:TextBox ID="ProductNameTextBox" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert product name" Display="Dynamic" ControlToValidate="ProductNameTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator></td>
                <td>Name</td>
                <td>
                    <asp:TextBox ID="DeleteTextBox" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DeleteTextBox" ErrorMessage="Field is required" ValidationGroup="delete"></asp:RequiredFieldValidator>
                </td>
                <td>Name</td>
                <td>
                    <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1">Price</td>
                <td class="auto-style1">
                    <asp:TextBox ID="ProductPriceTextBox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input it's current market price" ControlToValidate="ProductPriceTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td> 
                <td></td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete" Width="126px" OnClick="DeleteButton_Click" ValidationGroup="delete" />
                </td>
                <td></td>
                <td>
                </td>
                <td>
                    <asp:Button ID="SearchButton" runat="server" Text="Search" Width="123px" OnClick="SearchButton_Click" />
                </td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td>
                    <asp:TextBox ID="ProductQuantityTextBox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Quantity of products available" ControlToValidate="ProductQuantityTextBox" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                <td></td>
                 <td colspan="2">
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
            <tr>
                <td>Catagory</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="AddButton" runat="server" Text="Add Product" OnClick="AddButton_Click" style="margin-left: 0px" Width="125px" ValidationGroup="insert" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="ProductsGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td colspan="2"><b>To fint products with quantity less than 10</b></td>
                 <td>
                     <asp:Button ID="SpecialFunctionButton" runat="server" Text="Button" OnClick="SpecialFunctionButton_Click" /></td>
            <td></td>
            </tr>
        </table>

    </div>
    </form>
</body>
</html>
