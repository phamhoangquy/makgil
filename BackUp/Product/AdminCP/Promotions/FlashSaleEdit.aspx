<%@ Page Language="c#" CodeBehind="FlashSaleEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.FlashSaleEditPage" %>

<%@ Import Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="<%$Resources:ProductResources, FlashSalePageTitle %>" ParentUrl="~/Product/AdminCP/Promotions/FlashSale.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, FlashSaleEditPageTitle %>" CurrentPageUrl="~/Product/AdminCP/Promotions/FlashSaleEdit.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button SkinID="UpdateButton" ID="btnUpdate" ValidationGroup="DealEdit" Text="<%$Resources:Resource, UpdateButton %>" runat="server" />
            <asp:Button SkinID="UpdateButton" ID="btnUpdateAndNew" ValidationGroup="DealEdit" Text="<%$Resources:Resource, UpdateAndNewButton %>" runat="server" />
            <asp:Button SkinID="UpdateButton" ID="btnUpdateAndClose" ValidationGroup="DealEdit" Text="<%$Resources:Resource, UpdateAndCloseButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsert" ValidationGroup="DealEdit" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsertAndNew" ValidationGroup="DealEdit" Text="<%$Resources:Resource, InsertAndNewButton %>" runat="server" />
            <asp:Button SkinID="InsertButton" ID="btnInsertAndClose" ValidationGroup="DealEdit" Text="<%$Resources:Resource, InsertAndCloseButton %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" Text="<%$Resources:Resource, DeleteButton %>" CausesValidation="false" />
        </portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <div id="divtabs" runat="server" class="tabs">
                <ul id="ulTabs" class="nav nav-tabs" runat="server">
                    <li role="presentation" class="active">
                        <asp:Literal ID="litTabContent" runat="server" /></li>
                    <li role="presentation">
                        <asp:Literal ID="litTabHistory" runat="server" /></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade active in" id="tabContent">
                        <div class="form-horizontal">
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblName" runat="server" ForControl="txtName" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" Text="Tên" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtName" MaxLength="255" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="<%$Resources:ProductResources, CouponNameRequiredWarning %>"
                                        Display="Dynamic" SetFocusOnError="true" CssClass="txterror" ValidationGroup="DealEdit" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblDiscount" runat="server" ForControl="txtDiscountAmount" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponDiscountLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtDiscountAmount" SkinID="PriceTextBox" Style="display: inline-block" MaxLength="20" runat="server" />
                                    <asp:DropDownList ID="ddlUsePercentage" Style="width: auto; display: inline-block" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, DiscountPercentagePerProduct %>" Value="true"></asp:ListItem>
                                        <asp:ListItem Text="<%$Resources:ProductResources, DiscountAmountPerProduct %>" Value="false"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblFromDate" runat="server" ForControl="dpStartDate" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="DiscountStartDateLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <telerik:RadDateTimePicker ID="dpStartDate" Width="250" Height="30" Culture="en-US" DateInput-DateFormat="dd/MM/yyyy HH:mm" TimeView-TimeFormat="HH:mm" runat="server" Skin="Simple" />
                                    <asp:RequiredFieldValidator ID="reqStartDate" SkinID="Discount" ForeColor="Red" runat="server" ControlToValidate="dpStartDate"
                                        ErrorMessage="<%$Resources:ProductResources, DiscountStartDateRequiredWarning %>"
                                        Display="Dynamic" SetFocusOnError="true" ValidationGroup="DealEdit" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblExpiryDate" runat="server" ForControl="dpEndDate" ShowRequired="true" CssClass="settinglabel control-label col-sm-3" ConfigKey="DiscountEndDateLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <telerik:RadDateTimePicker ID="dpEndDate" Width="250" Height="30" Culture="en-US" DateInput-DateFormat="dd/MM/yyyy HH:mm" TimeView-TimeFormat="HH:mm" runat="server" Skin="Simple" />
                                    <asp:RequiredFieldValidator ID="reqEndDate" SkinID="Discount" ForeColor="Red" runat="server" ControlToValidate="dpEndDate"
                                        ErrorMessage="<%$Resources:ProductResources, DiscountEndDateRequiredWarning %>"
                                        Display="Dynamic" SetFocusOnError="true" ValidationGroup="DealEdit" />
                                </div>
                            </div>
                            <div id="divMinPurchase" runat="server" visible="false" class="settingrow form-group">
                                <gb:SiteLabel ID="lblMinPurchase" runat="server" ForControl="txtMinPurchase" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponMinPurchaseLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtMinPurchase" SkinID="PriceTextBox" MaxLength="20" runat="server" />
                                </div>
                            </div>
                            <div id="divDiscountQtyStep" runat="server" class="settingrow form-group">
                                <gb:SiteLabel ID="lblDiscountQtyStep" runat="server" ForControl="ddlDiscountQtyStep" CssClass="settinglabel control-label col-sm-3" Text="SL sản phẩm được áp dụng" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:TextBox runat="server" ID="txtQty" SkinID="PriceTextBox" Style="display: inline-block" Text="1" MaxLength="4"></asp:TextBox>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:SiteLabel ID="lblActiveStatus" runat="server" ForControl="ddActiveStatus" CssClass="settinglabel control-label col-sm-3" ConfigKey="CouponActiveStatusLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddActiveStatus" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, CouponActiveLabel %>" Value="true"></asp:ListItem>
                                        <asp:ListItem Text="<%$Resources:ProductResources, CouponInactiveLabel %>" Value="false"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div id="divAppliedType" visible="false" runat="server">
                                <hr class="mrt10 mrb10" />
                                <div class="appliedtoproducts">
                                    <asp:UpdatePanel ID="up" runat="server">
                                        <ContentTemplate>
                                            <div class="clearfix">
                                                <div class="pull-left" style="width: 35%;">
                                                    <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server">
                                                        <div class="settingrow form-group">
                                                            <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                                                                ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="ddZones" Width="100%" AutoPostBack="false" runat="server" />
                                                            </div>
                                                        </div>
                                                        <div class="settingrow form-group">
                                                            <gb:SiteLabel ID="lblTitle" runat="server" ConfigKey="ProductNameLabel"
                                                                ResourceFile="ProductResources" ForControl="txtTitle" CssClass="settinglabel control-label col-sm-3" />
                                                            <div class="col-sm-9">
                                                                <asp:TextBox ID="txtTitle" runat="server" MaxLength="255" />
                                                                <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="<%$Resources:ProductResources, ProductSearchButton %>"
                                                                    runat="server" CausesValidation="false" />
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                    <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                                                        <MasterTableView DataKeyNames="ProductId" AllowPaging="true">
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
                                                                <telerik:GridTemplateColumn HeaderStyle-Width="95" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, ProductPriceLabel %>" UniqueName="Price">
                                                                    <ItemTemplate>
                                                                        <%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price")), true) %>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn Visible="false" HeaderStyle-Width="50" HeaderText="Hot?" UniqueName="SpecialProduct">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="btnSpecialProduct" runat="server"
                                                                            CommandName="SpecialProduct" CommandArgument='<%#Eval("ProductId")%>' ImageUrl='<%# GetSpecialProductImageUrl(Convert.ToInt32(Eval("ProductId")))%>' />
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                                            </Columns>
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </div>
                                                <div class="pull-left mrt180" style="width: 3%">
                                                    <asp:ImageButton ID="btnRemove" runat="server" ImageUrl="~/Data/SiteImages/lt2.gif" CssClass="btnleft" />
                                                    <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="~/Data/SiteImages/rt2.gif" CssClass="btnright" />
                                                </div>
                                                <div class="pull-left " style="width: 61%">
                                                    <asp:Panel ID="Panel1" DefaultButton="btnUpdateTime" runat="server">
                                                        <div class="settingrow form-group">
                                                            <gb:SiteLabel ID="SiteLabel1" runat="server" Text="Cập nhật nhanh thời gian"
                                                                ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                                                            <div class="col-sm-9">
                                                                <gb:DatePickerControl ID="dpTemplateTimeStart" runat="server" ShowTime="True" SkinID="product"
                                                                    CssClass="forminput"></gb:DatePickerControl>
                                                                <gb:DatePickerControl ID="dpTemplateTimeEnd" runat="server" ShowTime="True" SkinID="product"
                                                                    CssClass="forminput"></gb:DatePickerControl>
                                                                <asp:Button SkinID="DefaultButton" ID="btnUpdateTime" Text="<%$Resources:Resource, UpdateButton %>"
                                                                    runat="server" CausesValidation="false" />
                                                                <br />
                                                                <asp:Button SkinID="DefaultButton" ID="btnSearchRelate" Text="<%$Resources:ProductResources, ProductSearchButton %>"
                                                                    runat="server" CausesValidation="false" />
                                                                <br />
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                    <div class="mrb15">
                                                        <gb:SiteLabel ID="lblRelatedProduct" runat="server" UseLabelTag="false"
                                                            ResourceFile="ProductResources" ConfigKey="CouponSelectedProductsLabel" />
                                                    </div>
                                                    <telerik:RadGrid ID="gridRelated" SkinID="radGridSkin" runat="server" CssClass="table">
                                                        <MasterTableView DataKeyNames="Guid,ItemId,FlashSaleID,UsePercentage,StockQty,SoldQty,Discount,StartTime,EndTime">
                                                            <Columns>
                                                                <telerik:GridTemplateColumn HeaderStyle-Width="50" HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                                                    <ItemTemplate>
                                                                        <portal:MediaElement ID="ml" runat="server" Width="40" />
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn HeaderText="Sản phẩm">
                                                                    <ItemTemplate>
                                                                        <asp:Literal ID="litProductCode" runat="server" />
                                                                        <div>
                                                                            <asp:Literal ID="litProductName" runat="server" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn HeaderText="ngày bắt đầu">
                                                                    <ItemTemplate>
                                                                        <gb:DatePickerControl ID="rdpdstart" runat="server" ShowTime="True" SkinID="product"
                                                                            CssClass="forminput"></gb:DatePickerControl>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn HeaderText="ngày kết thúc">
                                                                    <ItemTemplate>
                                                                        <gb:DatePickerControl ID="rdpdend" runat="server" ShowTime="True" SkinID="product"
                                                                            CssClass="forminput"></gb:DatePickerControl>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn HeaderText="SL Sản Phẩm">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox runat="server" ID="txtQty" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("StockQty"))) %>'></asp:TextBox>
                                                                        <div>
                                                                            <asp:Literal ID="litSoldQty" runat="server" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn HeaderText="Giảm giá">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtDiscountAmount" SkinID="PriceTextBox" Style="display: inline-block" Text='<%# ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Discount"))) %>' MaxLength="20" runat="server" />
                                                                        <asp:DropDownList ID="ddlFlashSaleType" CssClass="percentage" Style="width: auto; display: inline-block" runat="server">
                                                                            <asp:ListItem Value="1" Text="%"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="VND"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                            </Columns>
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tabHistory" runat="server">
                        <asp:UpdatePanel ID="upHistory" runat="server">
                            <ContentTemplate>
                                <telerik:RadGrid ID="gridOrder" SkinID="radGridSkin" runat="server">
                                    <MasterTableView DataKeyNames="OrderId,OrderStatus" AllowSorting="false">
                                        <Columns>
                                            <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, OrderIdLabel %>" DataField="OrderCode" />
                                            <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderCreatedOnLabel %>">
                                                <ItemTemplate>
                                                    <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, "dd/MM/yyyy HH:mm", timeOffset)%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn>
                                                <ItemTemplate>
                                                    <asp:HyperLink CssClass="cp-link" ID="EditLink" runat="server"
                                                        Text="<%$Resources:ProductResources, OrderDetailLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminOrderDetail.aspx?OrderID=" + Eval("OrderId") %>'>
                                                    </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">
            .settingrow input.rcbInput {
                border: none;
                padding: 0;
                width: 100%;
            }

            .settingrow select.percentage {
                min-width: inherit;
                width: 60px;
            }

            .separator {
                margin-top: 10px;
                border: solid 1px #ccc
            }

            .table-responsive {
                width: 100% !important;
            }
        </style>
    </div>
</asp:Content>
