<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="OrderEditControl.ascx.cs" Inherits="CanhCam.Web.ProductUI.OrderEditControl" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<site:productdisplaysettings id="displaySettings" runat="server" />
<portal:breadcrumbadmin id="breadcrumb" runat="server"
    parenttitle="<%$Resources:ProductResources, OrderAdminTitle %>" parenturl="~/Product/AdminCP/OrderList.aspx"
    currentpagetitle="<%$Resources:ProductResources, OrderDetailTitle %>" currentpageurl="~/Product/AdminCP/OrderEdit.aspx" />
<div class="admin-content col-md-12">
    <portal:headingpanel id="heading" runat="server">
        <asp:Button ID="btnUpdate" SkinID="UpdateButton" Text="<%$Resources:ProductResources, ProductUpdateButton %>" runat="server" />
        <asp:Button ID="btnSendToGHN" SkinID="UpdateButton" Visible="false" Text="Gửi đến giaohangnhanh.vn" runat="server" />
        <asp:Button ID="btnDeliveried" SkinID="UpdateButton" Visible="false" Text="Đã giao hàng" runat="server" />
        <asp:Button ID="btnOK" SkinID="UpdateButton" Visible="false" Text="Xác nhận" runat="server" CausesValidation="false" />
        <asp:Button ID="btnFinished" SkinID="UpdateButton" Visible="false" Text="Hoàn tất" runat="server" CausesValidation="false" />
        <asp:Button ID="btnCancel" SkinID="DeleteButton" Visible="false" Text="Hủy đơn hàng" runat="server" CausesValidation="false" />
        <asp:Button ID="btnDelete" SkinID="DeleteButton" Text="<%$Resources:Resource, DeleteButton %>" runat="server" CausesValidation="false" />
    </portal:headingpanel>
    <portal:notifymessage id="message" runat="server" />
    <div class="workplace">
        <div class="row">
            <div class="col-md-4">
                <h3>
                    <gb:sitelabel id="lblCustomerInfo" runat="server" configkey="OrderCustomerInfo" resourcefile="ProductResources" uselabeltag="false" />
                </h3>
                <div class="form-horizontal">
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblBillingFirstName" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderFirstNameLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingFirstName" runat="server" />
                            <asp:Literal ID="litBillingFirstName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div id="divBillingLastName" runat="server" visible="false" class="settingrow form-group">
                        <gb:sitelabel id="lblBillingLastName" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderLastNameLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingLastName" runat="server" />
                            <asp:Literal ID="litBillingLastName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblBillingEmail" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderEmailLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingEmail" runat="server" />
                            <asp:Literal ID="litBillingEmail" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblBillingPhone" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderPhoneLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingPhone" runat="server" />
                            <asp:Literal ID="litBillingPhone" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblBillingAddress" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderAddressLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingAddress" runat="server" />
                            <asp:Literal ID="litBillingAddress" Visible="false" runat="server" />
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upBilling" runat="server">
                        <ContentTemplate>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblBillingProvince" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderProvinceLabel" resourcefile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddBillingProvince" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litBillingProvince" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblBillingDistrict" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderDistrictLabel" resourcefile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddBillingDistrict" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litBillingDistrict" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblBillingWard" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderWardLabel" resourcefile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddBillingWard" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litBillingWard" Visible="false" runat="server" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblBillingStreet" runat="server" cssclass="settinglabel control-label col-sm-3" text="Họ tên bé" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingStreet" runat="server" />
                            <asp:Literal ID="litBillingStreet" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblBillingFax" runat="server" cssclass="settinglabel control-label col-sm-3" text="Ngày sinh" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBillingFax" runat="server" />
                            <asp:Literal ID="litBillingFax" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div id="divAffiliate" runat="server" visible="false">
                        <div class="settingrow form-group">
                            <gb:sitelabel id="lblAff" runat="server" cssclass="settinglabel control-label col-sm-6" text="Tài khoản Affiliate:" />
                            <div class="col-sm-6">
                                <p class="form-control-static">
                                    <asp:Literal ID="litAff" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="divAccessTrade" runat="server" visible="false">
                        <div class="settingrow form-group">
                            <gb:sitelabel id="lblAccessTrade" runat="server" cssclass="settinglabel control-label col-sm-6" text="AT Conversion:" />
                            <div class="col-sm-6">
                                <p class="form-control-static">
                                    <asp:Literal ID="litAccessTrade" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <h3>
                    <gb:sitelabel id="lblConsigneeInfo" runat="server" configkey="OrderConsigneeInfo" resourcefile="ProductResources" uselabeltag="false" />
                </h3>
                <div class="form-horizontal">
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingFirstName" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderFirstNameLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingFirstName" runat="server" />
                            <asp:Literal ID="litShippingFirstName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div id="divShippingLastName" runat="server" visible="false" class="settingrow form-group">
                        <gb:sitelabel id="lblShippingLastName" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderLastNameLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingLastName" runat="server" />
                            <asp:Literal ID="litShippingLastName" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingEmail" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderEmailLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingEmail" runat="server" />
                            <asp:Literal ID="litShippingEmail" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingPhone" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderPhoneLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingPhone" runat="server" />
                            <asp:Literal ID="litShippingPhone" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingAddress" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderAddressLabel" resourcefile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingAddress" runat="server" />
                            <asp:Literal ID="litShippingAddress" Visible="false" runat="server" />
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upShipping" runat="server">
                        <ContentTemplate>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblShippingProvince" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderProvinceLabel" resourcefile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddShippingProvince" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litShippingProvince" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblShippingDistrict" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderDistrictLabel" resourcefile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddShippingDistrict" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litShippingDistrict" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblShippingWard" runat="server" cssclass="settinglabel control-label col-sm-3" configkey="OrderWardLabel" resourcefile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddShippingWard" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server">
                                        <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Literal ID="litShippingWard" Visible="false" runat="server" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingStreet" runat="server" cssclass="settinglabel control-label col-sm-3" text="Họ tên bé" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingStreet" runat="server" />
                            <asp:Literal ID="litShippingStreet" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingFax" runat="server" cssclass="settinglabel control-label col-sm-3" text="Ngày sinh" />
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtShippingFax" runat="server" />
                            <asp:Literal ID="litShippingFax" Visible="false" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <h3>
                    <gb:sitelabel id="lblOrderInfo" runat="server" configkey="OrderInfoLabel" resourcefile="ProductResources" uselabeltag="false" />
                </h3>
                <div class="form-horizontal">
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblOrderStatus" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderStatusLabel" resourcefile="ProductResources" />
                        <div class="col-sm-7">
                            <asp:DropDownList ID="ddOrderStatus" CssClass="order-status" runat="server" />
                            <asp:Label ID="litOrderStatus" Visible="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblOrderNote" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderNoteLabel" resourcefile="ProductResources" />
                        <div class="col-sm-7">
                            <asp:TextBox ID="txtOrderNote" TextMode="MultiLine" Style="min-height: 50px" runat="server" />
                            <asp:Literal ID="litOrderNote" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblShippingStatus" runat="server" cssclass="settinglabel control-label col-sm-5" text="Tình trạng Giao hàng" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <asp:Literal ID="litShippingStatus" runat="server" />
                            </p>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblCreatedOn" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderCreatedOnLabel" resourcefile="ProductResources" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <asp:Literal ID="litCreatedOn" runat="server" />
                            </p>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:sitelabel id="lblOrderCode" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderCodeLabel" resourcefile="ProductResources" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <asp:Literal ID="litOrderCode" runat="server" />
                            </p>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upMethod" runat="server">
                        <ContentTemplate>
                            <div id="divShippingMethod" runat="server" class="settingrow form-group">
                                <gb:sitelabel id="lblShippingMethod" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="ShippingMethodLabel" resourcefile="ProductResources" />
                                <div class="col-sm-7">
                                    <asp:RadioButtonList ID="rdbListShippingMethod" AutoPostBack="true" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="ShippingMethodId" runat="server" />
                                    <asp:Literal ID="litShippingMethod" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div id="divPaymentMethod" runat="server" class="settingrow form-group">
                                <gb:sitelabel id="lblPaymentMethod" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="PaymentMethodLabel" resourcefile="ProductResources" />
                                <div class="col-sm-7">
                                    <asp:RadioButtonList ID="rdbListPaymentMethod" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="PaymentMethodId" runat="server" />
                                    <asp:Literal ID="litPaymentMethod" Visible="false" runat="server" />
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblSubTotal" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderSubTotalLabel" resourcefile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static">
                                        <b>
                                            <asp:Literal ID="litSubTotal" runat="server" /></b>
                                    </p>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblShippingFee" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderShippingFeeLabel" resourcefile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static">
                                        <b>
                                            <asp:Literal ID="litShippingFee" runat="server" /></b>
                                    </p>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblDiscount" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderDiscountLabel" resourcefile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static">
                                        <b>
                                            <asp:Literal ID="litDiscount" runat="server" /></b>
                                    </p>
                                </div>
                            </div>
                            <div class="settingrow form-group">
                                <gb:sitelabel id="lblOrderTotal" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderTotalLabel" resourcefile="ProductResources" />
                                <div class="col-sm-7">
                                    <p class="form-control-static">
                                        <b>
                                            <asp:Literal ID="litOrderTotal" runat="server" />
                                        </b>
                                    </p>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div id="divCouponCode" runat="server" visible="false" class="settingrow form-group">
                        <gb:sitelabel id="lblCouponCode" runat="server" cssclass="settinglabel control-label col-sm-5" configkey="OrderCouponCodeLabel" resourcefile="ProductResources" />
                        <div class="col-sm-7">
                            <p class="form-control-static">
                                <b>
                                    <asp:Literal ID="litCouponCode" runat="server" /></b>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h3>
            <gb:sitelabel id="lblProductList" runat="server" configkey="ProductListTitle" resourcefile="ProductResources" uselabeltag="false" />
        </h3>
        <telerik:radgrid id="grid" skinid="radGridSkin" runat="server">
            <MasterTableView DataKeyNames="Guid,ProductId,AttributeDescription,AttributesXml,Quantity,DiscountAmount" AllowPaging="false" AllowSorting="false">
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>" UniqueName="ProductName">
                        <ItemTemplate>
                            <asp:Literal ID="litProductCode" runat="server" />
                            <div>
                                <asp:Literal ID="litProductName" runat="server" />
                            </div>
                            <%# Eval("AttributeDescription")%>
                            <asp:Literal ID="litAttributes" Visible="false" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderQuantityLabel %>" UniqueName="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" SkinID="NumericTextBox" Visible="false"
                                MaxLength="4" Text='<%# Eval("Quantity") %>' runat="server" />
                            <%# Eval("Quantity") %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderPriceLabel %>" UniqueName="OrderPrice">
                        <ItemTemplate>
                            <%#CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price")), true)%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="Khuyến mãi" UniqueName="DiscountAmount">
                        <ItemTemplate>
                            <%#CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("DiscountAmount")), true)%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderTotalPriceLabel %>" UniqueName="OrderTotalPrice">
                        <ItemTemplate>
                            <%#CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity")) - Convert.ToDecimal(Eval("DiscountAmount")), true) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Visible="false" UniqueName="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" CssClass="cp-link" CommandName="Delete" CommandArgument='<%#Eval("Guid").ToString()%>' Text="Hủy" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:radgrid>
    </div>
</div>
<style type="text/css">
    .attributes {
        font-size: 12px;
        font-style: italic;
    }
</style>
<div id="divWarningScripts" runat="server">
    <script type="text/javascript">
        var currVal = $('.order-status').val();
        $('.order-status').change(function () {
            var selected = $(this).val();

            if (selected == '1' || selected == '2') {
                //var message = "Khi chuyển sang trạng thái \"" + $(this).find('option:selected').text() + "\", website sẽ gửi SMS cho KH.\n\nBạn có chắc chắn muốn tiếp tục?\n";
                var message = "KHI CHUYỂN SANG TRẠNG THÁI \"" + $(this).find('option:selected').text().toUpperCase() + "\", WEBSITE SẼ GỬI SMS CHO KH.\n\nBẠN CÓ CHẮC CHẮN MUỐN TIẾP TỤC?\n";
                if (!confirm(message)) {
                    $(this).val(currVal);
                    return false;
                }
            }

            currVal = $(this).val();
        });
    </script>
</div>