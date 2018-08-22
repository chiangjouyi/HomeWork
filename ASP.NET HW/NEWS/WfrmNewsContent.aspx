<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WfrmNewsContent.aspx.cs" Inherits="ASP.NET_HW.NEWS.WfrmNewsContent" %>

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
            height: 20px;
        }
        .auto-style4 {
            color: #C0C0C0;
        }
        .auto-style5 {
            font-family: 微軟正黑體;
        }
        .auto-style6 {
            font-size: large;
            color: #333333;
        }
        .auto-style3 {
            font-size: xx-large;
            color: #1A171A;
        }
        .auto-style8 {
            font-size: large;
            font-family: 微軟正黑體;
        }
        .auto-style13 {
            font-size: x-large;
            font-family: 微軟正黑體;
            color: #CC3399;
        }
        .auto-style14 {
            height: 17px;
            color: #CC6699;
        }
        .auto-style18 {
            font-size: large;
            color: #333333;
            text-decoration: none;
        }
        .auto-style20 {
            height: 24px;
        }
        .auto-style21 {
            font-size: large;
            color: #CC6699;
        }
        .auto-style22 {
            font-size: small;
            color: #999999;
        }
        .auto-style23 {
            font-size: large;
        }
        .auto-style24 {
            text-decoration: none;
            color: #CC0099;
        }
        .auto-style25 {
            font-size: medium;
        }
        .auto-style26 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbASP.NET HWConnectionString %>" DeleteCommand="DELETE FROM [tNews] WHERE [nID] = @nID" InsertCommand="INSERT INTO [tNews] ([nDate], [nSubject], [nContent]) VALUES (@nDate, @nSubject, @nContent)" SelectCommand="SELECT * FROM [tNews] WHERE ([nID] = @nID)" UpdateCommand="UPDATE [tNews] SET [nDate] = @nDate, [nSubject] = @nSubject, [nContent] = @nContent WHERE [nID] = @nID">
                        <DeleteParameters>
                            <asp:Parameter Name="nID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter DbType="Date" Name="nDate" />
                            <asp:Parameter Name="nSubject" Type="String" />
                            <asp:Parameter Name="nContent" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="nID" QueryStringField="nid" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="nDate" />
                            <asp:Parameter Name="nSubject" Type="String" />
                            <asp:Parameter Name="nContent" Type="String" />
                            <asp:Parameter Name="nID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style5" DataKeyNames="nID" DataSourceID="SqlDataSource1" GridLines="None" Width="959px">
                        <Columns>
                            <asp:TemplateField InsertVisible="False" SortExpression="nID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("nID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <strong>
                                    <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text='<%# Bind("nSubject") %>'></asp:Label>
                                    </strong>
                                    <br />
                                    <table class="auto-style1">
                                        <tr>
                                            <td><strong>
                                                <asp:Label ID="Label2" runat="server" CssClass="auto-style4" Text='<%# Eval("nDate") %>'></asp:Label>
                                                </strong></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style20"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" CssClass="auto-style6" Text='<%# Eval("nContent") %>'></asp:Label>
                                                <strong>&nbsp; </strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style26"><strong>&nbsp; [<asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style18" NavigateUrl="WfrmNewsList.aspx" Text="回新聞列表"></asp:HyperLink>
                                                ]</strong></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemStyle Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#CC0000" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbASP.NET HWConnectionString %>" DeleteCommand="DELETE FROM [tMessge] WHERE [mID] = @mID" InsertCommand="INSERT INTO [tMessge] ([mDate], [mUser], [mPost], [mNewsID]) VALUES (@mDate, @mUser, @mPost, @mNewsID)" SelectCommand="SELECT * FROM [tMessge] WHERE ([mNewsID] = @mNewsID)" UpdateCommand="UPDATE [tMessge] SET [mDate] = @mDate, [mUser] = @mUser, [mPost] = @mPost, [mNewsID] = @mNewsID WHERE [mID] = @mID">
                        <DeleteParameters>
                            <asp:Parameter Name="mID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter DbType="Date" Name="mDate" />
                            <asp:Parameter Name="mUser" Type="String" />
                            <asp:Parameter Name="mPost" Type="String" />
                            <asp:Parameter Name="mNewsID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="mNewsID" QueryStringField="nid" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="mDate" />
                            <asp:Parameter Name="mUser" Type="String" />
                            <asp:Parameter Name="mPost" Type="String" />
                            <asp:Parameter Name="mNewsID" Type="Int32" />
                            <asp:Parameter Name="mID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style14"><span class="auto-style13"><strong>留個言吧......</strong></span><br />
                </td>
            </tr>
            <tr>
                <td><strong>
                    <asp:FormView ID="FormView1" runat="server" CssClass="auto-style8" DataKeyNames="mID" DataSourceID="SqlDataSource2" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting" Width="625px">
                        <EditItemTemplate>
                            mID:
                            <asp:Label ID="mIDLabel1" runat="server" Text='<%# Eval("mID") %>' />
                            <br />
                            mDate:
                            <asp:TextBox ID="mDateTextBox" runat="server" Text='<%# Bind("mDate") %>' />
                            <br />
                            mUser:
                            <asp:TextBox ID="mUserTextBox" runat="server" Text='<%# Bind("mUser") %>' />
                            <br />
                            mPost:
                            <asp:TextBox ID="mPostTextBox" runat="server" Text='<%# Bind("mPost") %>' />
                            <br />
                            mNewsID:
                            <asp:TextBox ID="mNewsIDTextBox" runat="server" Text='<%# Bind("mNewsID") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            留言人<br /> 
                            <asp:TextBox ID="mUserTextBox" runat="server" CssClass="auto-style23" Text='<%# Bind("mUser") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="mUserTextBox" CssClass="auto-style25" ErrorMessage="留言人不可空白" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;<br />留言內容<br /> 
                            <asp:TextBox ID="mPostTextBox" runat="server" CssClass="auto-style23" Text='<%# Bind("mPost") %>' TextMode="MultiLine" Width="590px" />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mPostTextBox" CssClass="auto-style25" ErrorMessage="留言內容不可空白" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="auto-style24" Text="張貼留言" />
                            &nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="auto-style24" Text="取消" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            mID:
                            <asp:Label ID="mIDLabel" runat="server" Text='<%# Eval("mID") %>' />
                            <br />
                            mDate:
                            <asp:Label ID="mDateLabel" runat="server" Text='<%# Bind("mDate") %>' />
                            <br />
                            mUser:
                            <asp:Label ID="mUserLabel" runat="server" Text='<%# Bind("mUser") %>' />
                            <br />
                            mPost:
                            <asp:Label ID="mPostLabel" runat="server" Text='<%# Bind("mPost") %>' />
                            <br />
                            mNewsID:
                            <asp:Label ID="mNewsIDLabel" runat="server" Text='<%# Bind("mNewsID") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                        </ItemTemplate>
                    </asp:FormView>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style5" DataKeyNames="mID" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Width="630px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="留言板" InsertVisible="False" SortExpression="mID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("mID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <strong>
                                    <asp:Label ID="Label1" runat="server" CssClass="auto-style21" Text='<%# Bind("mUser") %>'></asp:Label>
                                    </strong>&nbsp;
                                    <asp:Label ID="Label4" runat="server" CssClass="auto-style22" Text='<%# Eval("mDate") %>'></asp:Label>
                                    &nbsp;<table class="auto-style1">
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">
                                                <asp:Label ID="Label5" runat="server" CssClass="auto-style6" Text='<%# Eval("mPost") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="Gray" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
