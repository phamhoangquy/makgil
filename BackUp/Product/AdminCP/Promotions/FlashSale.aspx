<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="FlashSale.aspx.cs" Inherits="CanhCam.Web.ProductUI.FlashSalePage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:ProductResources, FlashSalePageTitle %>" CurrentPageUrl="~/Product/AdminCP/Promotions/FlashSale.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:HyperLink SkinID="InsertButton" ID="lnkInsert" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:Resource, DeleteSelectedButton %>" runat="server" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                <MasterTableView DataKeyNames="FlashSaleID" AllowSorting="false">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="Tên">
                            <ItemTemplate>
                                <%# Eval("Name") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, CouponExpiryDateLabel %>">
                            <ItemTemplate>
                                <%# Eval("EndDate")%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                      <%--  <telerik:GridTemplateColumn HeaderText="Số HĐ đã sử dụng">
                            <ItemTemplate>
                                <%# Eval("OrderCount") %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>--%>
                        <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, CouponActiveStatusLabel %>">
                            <ItemTemplate>
                                <%# GetActive(Convert.ToBoolean(Eval("IsActive")), Eval("StartDate"), Eval("EndDate"))%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:HyperLink CssClass="cp-link" ID="EditLink" runat="server"
                                    Text="<%$Resources:ProductResources, CouponEditLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/Promotions/FlashSaleEdit.aspx?FlashSaleID=" + Eval("FlashSaleID") %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
</asp:Content>
