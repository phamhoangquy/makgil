<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="AdminProductControl.ascx.cs" Inherits="CanhCam.Web.ProductUI.AdminProductControl" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<%@ Import Namespace="CanhCam.Web.ProductUI" %>

<Site:ProductDisplaySettings ID="displaySettings" runat="server" />
<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
    CurrentPageTitle="<%$Resources:ProductResources, ProductListTitle %>" CurrentPageUrl="~/Product/AdminCP/ProductList.aspx" />
<div class="admin-content">

    <portal:NotifyMessage ID="message" runat="server" />
    <div class="row">
        <div class="col-12">
            <asp:Panel ID="pnlSearch" CssClass="headInfo admin-content-bg-white" DefaultButton="btnSearch" runat="server">
                <portal:HeadingPanel ID="heading" runat="server">
                   
                    <asp:Button SkinID="UpdateButton" ID="btnUpdate" Text="<%$Resources:ProductResources, ProductUpdateButton %>"
                        runat="server" />
                    <asp:HyperLink SkinID="InsertButton" ID="lnkInsert" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
                    <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:ProductResources, ProductDeleteSelectedButton %>"
                        runat="server" CausesValidation="false" />
                </portal:HeadingPanel>
                <div class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                        ForControl="ddZones" CssClass="control-label col-sm-3 mb-0" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddZones" AutoPostBack="false" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div runat="server" id="divManufacturer" class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="SiteLabel1" runat="server" ConfigKey="ManufacturerNameLabel" ResourceFile="ProductResources"
                        ForControl="ddZones" CssClass="control-label col-sm-3 mb-0" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddManufacturers" DataTextField="Name" DataValueField="ManufacturerId" AutoPostBack="false" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <asp:Repeater runat="server" ID="rpCustomFiledShoppingCart" Visible="false">
                    <ItemTemplate>
                        <div class="settingrow form-group row align-items-center">
                            <asp:Label CssClass="control-label col-sm-3 mb-0" ID="lbCustomFiled" runat="server" />
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlCustomOption" AutoPostBack="false" runat="server" CssClass="form-control" />
                            </div>
                            <asp:HiddenField ID="hdfCustomFieldId" Value='<%#Eval("CustomFieldId")%>'
                                runat="server" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblTitle" runat="server" ConfigKey="ProductNameLabel"
                        ResourceFile="ProductResources" ForControl="txtTitle" CssClass="control-label col-sm-3 mb-0" />
                    <div class="col-sm-9">
                        <div class="input-group">
                            <asp:TextBox ID="txtTitle" runat="server" MaxLength="255" CssClass="form-control" />
                            <div class="input-group-btn">
                                <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="<%$Resources:ProductResources, ProductSearchButton %>" CssClass="btn btn-default"
                                    runat="server" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="col-12">
            <div class="workplace admin-content-bg-white">
                <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                    <MasterTableView DataKeyNames="ProductId,ZoneId,DisplayOrder,ViewCount,Code,Price,OldPrice">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-Width="35" HeaderText="<%$Resources:Resource, RowNumber %>">
                                <ItemTemplate>
                                    <%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="100" HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                <ItemTemplate>
                                    <portal:MediaElement ID="ml" runat="server" Width="90" FileUrl='<%# ProductHelper.GetImageFilePath(siteSettings.SiteId, Convert.ToInt32(Eval("ProductId")), Eval("ImageFile").ToString(), Eval("ThumbnailFile").ToString()) %>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="115" HeaderStyle-Wrap="false" HeaderText="<%$Resources:ProductResources, ProductCodeLabel %>" UniqueName="ProductCode">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtProductCode" Width="95"
                                        MaxLength="50" Text='<%# Eval("Code") %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>">
                                <ItemTemplate>
                                    <asp:HyperLink CssClass="cp-link" ID="Title" runat="server" Text='<%# Eval("Title").ToString() %>'
                                        NavigateUrl='<%# ProductHelper.FormatProductUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneId")))  %>'>
                                    </asp:HyperLink>
                                    <asp:HyperLink CssClass="cp-link" ID="EditParent" runat="server" Style="display: inline-block;"
                                        Visible='<%# Convert.ToInt32(Eval("ParentId")) > 0 %>'
                                        Text="<i class='fa fa-clipboard'></i>" ToolTip="Tới sản phẩm cha" NavigateUrl='<%# siteRoot + EditPageUrl + "?ProductID=" + Eval("ParentId") %>'>
                                    </asp:HyperLink>
                                    <%--                                    <%# GetShoppingPropertites(Convert.ToInt32(Eval("ProductId"))) %>--%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Thuộc tính">
                                <ItemTemplate>
                                    <asp:Repeater ID="rptShoppingProperties" runat="server">
                                        <ItemTemplate>
                                            <gb:SiteLabel ID="lblText" runat="server" Text='<%#Eval("Name") %>'
                                                ForControl="txtField" CssClass="settinglabel control-label" />
                                            <asp:DropDownList ID="ddlField" AppendDataBoundItems="true"
                                                DataTextField="Name" DataValueField="CustomFieldOptionID" runat="server"
                                                CssClass="form-control" />
                                            <asp:HiddenField ID="hdfCustomFieldId" Value='<%#Eval("CustomFieldId")%>'
                                                runat="server" />
                                            <asp:HiddenField ID="hdfDataType" Value='<%#Eval("DataType")%>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="100" HeaderText="<%$Resources:ProductResources, ProductPriceLabel %>" UniqueName="Price">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtPrice" SkinID="PriceTextBox" Style="text-align: right"
                                        MaxLength="50" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price"))) %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="100" HeaderText="<%$Resources:ProductResources, ProductOldPriceLabel %>" UniqueName="OldPrice">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOldPrice" SkinID="PriceTextBox" Style="text-align: right"
                                        MaxLength="50" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("OldPrice"))) %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="100" HeaderText="<%$Resources:ProductResources, ProductDisplayOrderLabel %>">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDisplayOrder" SkinID="NumericTextBox"
                                        MaxLength="4" Text='<%# Eval("DisplayOrder") %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Visible="false" HeaderStyle-Width="100" HeaderText="<%$Resources:ProductResources, ProductViewCountLabel %>"
                                AllowFiltering="false">
                                <ItemTemplate>
                                    <%# Eval("ViewCount") %>
                                    <asp:TextBox ID="txtViewCount" SkinID="NumericTextBox" Visible="false"
                                        MaxLength="9" Text='<%# Eval("ViewCount") %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="50">
                                <ItemTemplate>
                                    <asp:HyperLink CssClass="cp-link btn bg-orange" ID="EditLink" runat="server"
                                        Visible='<%# CanEditProduct(Convert.ToInt32(Eval("UserId")), Convert.ToBoolean(Eval("IsPublished")), Eval("StateId")) %>'
                                        Text="<%$Resources:ProductResources, ProductEditLink %>" NavigateUrl='<%# siteRoot + EditPageUrl + "?ProductID=" + Eval("ProductId") %>'>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </div>
</div>