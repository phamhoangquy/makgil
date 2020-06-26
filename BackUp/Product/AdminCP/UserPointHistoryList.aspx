<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="UserPointHistoryList.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" Inherits="CanhCam.Web.ProductUI.UserPointHistoryListPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:ProductResources, UserPointHistoryListTitle %>"
        CurrentPageUrl="~/Product/AdminCP/UserPointHistoryList.aspx" />

    <div class="admin-content">
        <portal:NotifyMessage ID="message" runat="server" />
        <%--        <portal:HeadingPanel ID="heading" runat="server">
              <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:Resource, DeleteSelectedButton %>"
				runat="server" CausesValidation="false" />
        </portal:HeadingPanel>--%>

        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" CssClass="headInfo admin-content-bg-white form-horizontal"
            runat="server">
            <div class="settingrow form-group row align-items-center">
                <gb:SiteLabel ID="lblStartDate" runat="server" Text="Từ ngày" ForControl="dpStartDate" CssClass="settinglabel control-label col-sm-3" />
                <div class="col-sm-9">
                    <gb:DatePickerControl ID="dpStartDate" runat="server" SkinID="news"></gb:DatePickerControl>
                </div>
            </div>
            <div class="settingrow form-group row align-items-center">
                <gb:SiteLabel ID="lblEndDate" runat="server" Text="Đến ngày" ForControl="dpEndDate" CssClass="settinglabel control-label col-sm-3" />
                <div class="col-sm-9">
                    <gb:DatePickerControl ID="dpEndDate" runat="server" SkinID="news"></gb:DatePickerControl>
                </div>
            </div>
            <div class="settingrow form-group row align-items-center">
                <gb:SiteLabel ID="lblTitle" runat="server" Text="Từ khóa" ForControl="txtTitle" CssClass="settinglabel control-label col-sm-3" />
                <div class="col-sm-9">
                    <asp:TextBox ID="txtTitle" runat="server" MaxLength="255" placeholder="Username" CssClass="form-control" />
                </div>
            </div>
            <div class="settingrow form-group row align-items-center">
                <div class="col-sm-9 offset-sm-3">
                    <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="Tìm kiếm"
                        runat="server" CausesValidation="false" />
                </div>
            </div>
        </asp:Panel>

        <div class="workplace">
            <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                <MasterTableView DataKeyNames="Id">
                    <Columns>

                        <telerik:GridTemplateColumn HeaderText="Mã đơn hàng">
                            <ItemTemplate>
                                <%# Eval("OrderCode") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Username">
                            <ItemTemplate>
                                <%# Eval("User") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Số tiền mua hàng" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# Eval("Amount") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Điểm thưởng" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <%# Eval("Point") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Ngày đặt hàng">
                            <ItemTemplate>
                                <%--<%# Eval("DateCreated") %>--%> <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("DateCreated")), timeZone, Resources.ProductResources.OrderCreatedDateFormat, timeOffset)%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="cp-link btn btn-default bg-teal" ID="EditLink"
                                    runat="server" Text="Chi tiết"
                                    NavigateUrl='<%# Eval("OrderURL") %>' />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <%--<telerik:GridClientSelectColumn HeaderStyle-Width="35" />--%>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
</asp:Content>