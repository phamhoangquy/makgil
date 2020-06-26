﻿<%@ Page Language="c#" CodeBehind="DiscountComboSaleDialog.aspx.cs" MasterPageFile="~/App_MasterPages/DialogMaster.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.DiscountComboSaleDialog" %>

<%@ Import Namespace="CanhCam.Web.ProductUI" %>
<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>

<asp:Content ContentPlaceHolderID="phMain" ID="MPContent" runat="server">
    <Site:ProductDisplaySettings ID="displaySettings" runat="server" />
    <div style="width: 96%">
        <portal:HeadingControl ID="heading" Text="Chọn sản phẩm combo sale" runat="server" />
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <portal:NotifyMessage ID="message" runat="server" />
                <div class="clearfix">
                    <div class="pull-left" style="width: 45%;">
                        <asp:Panel ID="pnlSearch" CssClass="form-horizontal mrb30" DefaultButton="btnSearch" runat="server">
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                                    ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddZones" AutoPostBack="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblTitle" runat="server" ConfigKey="ProductNameLabel"
                                    ResourceFile="ProductResources" ForControl="txtTitle" CssClass="settinglabel control-label col-sm-3" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtTitle" runat="server" Style="width: 70%; display: inline-block" MaxLength="255" />
                                    <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="<%$Resources:ProductResources, ProductSearchButton %>"
                                        runat="server" CausesValidation="false" />
                                </div>
                            </div>
                        </asp:Panel>
                        <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                            <MasterTableView DataKeyNames="ProductId" AllowPaging="false">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="50" HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                        <ItemTemplate>
                                            <portal:MediaElement ID="ml" runat="server" Width="40" FileUrl='<%# ProductHelper.GetImageFilePath(siteSettings.SiteId, Convert.ToInt32(Eval("ProductId")), Eval("ImageFile").ToString(), Eval("ThumbnailFile").ToString()) %>' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Sản phẩm">
                                        <ItemTemplate>
                                            <%# Eval("Code") %>
                                            <div>
                                                <asp:HyperLink CssClass="cp-link" ID="Title" runat="server" Text='<%# Eval("Title").ToString() %>'
                                                    NavigateUrl='<%# ProductHelper.FormatProductUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneID")))  %>'>
                                            </asp:HyperLink>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="75" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, ProductPriceLabel %>" UniqueName="Price">
                                        <ItemTemplate>
                                            <%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price"))) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                    <div class="pull-left" style="width: 3%; padding-top: 150px;">
                        <asp:ImageButton ID="btnRemove" runat="server" ImageUrl="~/Data/SiteImages/lt2.gif" CssClass="btnleft" />
                        <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Data/SiteImages/rt2.gif" CssClass="btnright" />
                    </div>
                    <div class="pull-left" style="width: 50%; margin-top: 67px">
                        <div class="mrb10 text-right">
                            <asp:Button ID="btnUpdate" SkinID="DefaultButton" Text="Cập nhật" runat="server" />
                        </div>
                        <telerik:RadGrid ID="gridRelated" SkinID="radGridSkin" runat="server">
                            <MasterTableView DataKeyNames="ProductId" AllowPaging="false">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="50" HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                        <ItemTemplate>
                                            <portal:MediaElement ID="ml" runat="server" Width="40" FileUrl='<%# ProductHelper.GetImageFilePath(siteSettings.SiteId, Convert.ToInt32(Eval("ProductId")), Eval("ImageFile").ToString(), Eval("ThumbnailFile").ToString()) %>' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Sản phẩm Combo">
                                        <ItemTemplate>
                                            <%# Eval("Code") %>
                                            <div>
                                                <asp:HyperLink CssClass="cp-link" ID="Title" runat="server" Text='<%# Eval("Title").ToString() %>'
                                                    NavigateUrl='<%# ProductHelper.FormatProductUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneID")))  %>'>
                                            </asp:HyperLink>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Giảm giá Combo">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtDiscountAmount" SkinID="PriceTextBox" MaxLength="20" runat="server" />
                                            <asp:DropDownList ID="ddlDiscountType" CssClass="percentage" runat="server">
                                                <asp:ListItem Value="1" Text="%"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="VND"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="SL">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtComboSaleQty" SkinID="NumericTextBox" runat="server" />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <div class="mrt20">
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblGiftCustomProducts" runat="server" CssClass="settinglabel control-label" Text="Quà tặng" />
                                <gbe:EditorControl ID="edGiftCustomProducts" runat="server" />
                            </div>
                            <div id="divGiftProducts" runat="server" visible="false" class="settingrow form-group">
                                <gb:SiteLabel ID="lblGiftProducts" runat="server" CssClass="settinglabel control-label" Text="Quà tặng (SP Combo)" />
                                <gbe:EditorControl ID="edGiftProducts" runat="server" />
                            </div>
                            <div id="divGiftDescription" runat="server" visible="false" class="settingrow form-group">
                                <gb:SiteLabel ID="lblGiftDescription" runat="server" CssClass="settinglabel control-label" Text="Mô tả (hiển thị ở chi tiết SP chính)" />
                                <gbe:EditorControl ID="edGiftDescription" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <style type="text/css">
        .RadGrid {
            width: 100% !important;
        }

        .RadEditor .reContentCell {
            height: 100% !important;
        }

        textarea {
            height: auto;
        }
    </style>
    <portal:SessionKeepAliveControl ID="ka1" runat="server" />
</asp:Content>