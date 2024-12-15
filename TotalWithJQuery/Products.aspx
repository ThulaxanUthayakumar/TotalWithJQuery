<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="TotalWithJQuery.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Pate</title>
</head>
<body>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=txtQty]").val("0");

        });
        $("body").on("change keyup", "[id*=txtQty]", function () {
            var qty = parseFloat($.trim($.trim($(this).val())));
            if (isNaN(qty)) {
                qty = 0;
            }
            $(this).val(qty);

            //Check row wise total
            var row = $(this).closest("tr");
            $("[id*=lblTotalAmount]", row).html(parseFloat($(".ItemPrice", row).html()) * parseFloat($(this).val()));

            //Check total billed amount
            var billedTotal = 0;
            $("[id*=lblTotalAmount]").each(function () {
                billedTotal = billedTotal + parseFloat($(this).html());
            });
            $("[id*=lblTotalBilledAmount]").html(billedTotal.toString());

        });

    </script>




    <form id="form1" runat="server">
        <div align="center">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" AutoGenerateColumns="false">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Product Name" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="Product Price" ItemStyle-HorizontalAlign="Right" ItemStyle-CssClass="ItemPrice" />
                    <asp:TemplateField HeaderText="Qty">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" style ="text-align:right" Width="50px" Text="0"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Total Amount" ItemStyle-HorizontalAlign="Right">
             <ItemTemplate>
                 <asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br /><br />
            <asp:Label ID="lblGtotal" runat="server" Text="Grand Total:  " style ="font-weight:bold"></asp:Label>
            <asp:Label ID="lblTotalBilledAmount" runat="server" Text="0" style ="font-weight:bold;background-color:yellow"></asp:Label>

        </div>
    </form>
    
</body>
</html>
