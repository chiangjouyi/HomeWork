<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WfrmNewsList.aspx.cs" Inherits="ASP.NET_HW.NEWS.WfrmNewsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: xx-large;
            font-family: 微軟正黑體;
            height: 119px;
        }
        .auto-style3 {
            font-size: large;
            font-family: 微軟正黑體;
        }
        .auto-style4 {
            height: 20px;
        }
        .auto-style5 {
            font-size: large;
            text-decoration: none;
        }
        .auto-style6 {
            font-weight: normal;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style9 {
            font-size: x-large;
            font-family: 微軟正黑體;
            color: #336699;
        }
        .auto-style10 {
            font-size: x-large;
            font-family: 微軟正黑體;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><strong>NEWS 新聞</strong></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbASP.NET HWConnectionString %>" DeleteCommand="DELETE FROM [tNews] WHERE [nID] = @nID" InsertCommand="INSERT INTO [tNews] ([nDate], [nSubject], [nContent]) VALUES (@nDate, @nSubject, @nContent)" SelectCommand="SELECT * FROM [tNews]" UpdateCommand="UPDATE [tNews] SET [nDate] = @nDate, [nSubject] = @nSubject, [nContent] = @nContent WHERE [nID] = @nID">
                        <DeleteParameters>
                            <asp:Parameter Name="nID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nDate" Type="String" />
                            <asp:Parameter Name="nSubject" Type="String" />
                            <asp:Parameter Name="nContent" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nDate" Type="String" />
                            <asp:Parameter Name="nSubject" Type="String" />
                            <asp:Parameter Name="nContent" Type="String" />
                            <asp:Parameter Name="nID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td><strong>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style10" DataKeyNames="nID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="836px">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="nID" DataNavigateUrlFormatString="WfrmNewsContent.aspx?nid={0}" DataTextField="nSubject" HeaderText="新聞列表">
                            <ItemStyle Font-Size="Large" />
                            </asp:HyperLinkField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    </strong></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;<strong><span class="auto-style9">發佈新聞</span></strong></td>
            </tr>
            <tr>
                <td><strong>
                    <asp:FormView ID="FormView1" runat="server" CellPadding="4" CssClass="auto-style3" DataKeyNames="nID" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" Width="834px" Height="389px" OnItemInserting="FormView1_ItemInserting">
                        <EditItemTemplate>
                            nID:
                            <asp:Label ID="nIDLabel1" runat="server" Text='<%# Eval("nID") %>' />
                            <br />
                            nDate:
                            <asp:TextBox ID="nDateTextBox" runat="server" Text='<%# Bind("nDate") %>' />
                            <br />
                            nSubject:
                            <asp:TextBox ID="nSubjectTextBox" runat="server" Text='<%# Bind("nSubject") %>' />
                            <br />
                            nContent:
                            <asp:TextBox ID="nContentTextBox" runat="server" Text='<%# Bind("nContent") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            標題<br /> 
                            <asp:TextBox ID="nSubjectTextBox" runat="server" Text='<%# Bind("nSubject") %>' CssClass="auto-style7" Width="400px" />
                            &nbsp;<asp:RequiredFieldValidator ID="vad標題不可空白" runat="server" ControlToValidate="nSubjectTextBox" ErrorMessage="標題不可空白" Font-Bold="True" Font-Size="Medium" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            內文<br /> 
                            <asp:TextBox ID="nContentTextBox" runat="server" Height="161px" Text='<%# Bind("nContent") %>' TextMode="MultiLine" Width="751px" CssClass="auto-style7" />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:RequiredFieldValidator ID="vad內文不可空白" runat="server" ControlToValidate="nContentTextBox" ErrorMessage="內文不可空白" Font-Bold="True" Font-Size="Medium" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="auto-style5" Font-Bold="True" Font-Size="Large" ForeColor="#003399" OnClick="InsertButton_Click" Text="發佈" />
                            </span>&nbsp; &nbsp;<span class="auto-style6"><asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="auto-style5" Font-Bold="True" Font-Size="Large" ForeColor="#003399" Text="取消" />
                            <br />
                            </span>
                            <br />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            nID:
                            <asp:Label ID="nIDLabel" runat="server" Text='<%# Eval("nID") %>' />
                            <br />
                            nDate:
                            <asp:Label ID="nDateLabel" runat="server" Text='<%# Bind("nDate") %>' />
                            <br />
                            nSubject:
                            <asp:Label ID="nSubjectLabel" runat="server" Text='<%# Bind("nSubject") %>' />
                            <br />
                            nContent:
                            <asp:Label ID="nContentLabel" runat="server" Text='<%# Bind("nContent") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>
                    </strong></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            </table>
        <div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
