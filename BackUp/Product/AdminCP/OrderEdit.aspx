﻿<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderEdit.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderEditPage" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" SkinID="radLoadingPanelSkin"
        runat="server" Transparency="30" MinDisplayTime="500" BackColor="#E0E0E0">
        <img src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>' alt="Loading..." style="border: 0;" />
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <%--
            <telerik:AjaxSetting AjaxControlID="btnAddNew">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="litOrderTotal" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderDebt" />
                    <telerik:AjaxUpdatedControl ControlID="grid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderTotal" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderDebt" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="txtOrderPaying">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtOrderPaying" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderDebt" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="txtOrderOldDebt">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtOrderOldDebt" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderTotal" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderDebt" />
                </UpdatedControls>
            </telerik:AjaxSetting>--%>
            <telerik:AjaxSetting AjaxControlID="autCustomers">
                <UpdatedControls>
                    <%--                    <telerik:AjaxUpdatedControl ControlID="divCustomerInfo" />
                    <telerik:AjaxUpdatedControl ControlID="divCustomerSummary" />--%>
                    <%--                    <telerik:AjaxUpdatedControl ControlID="formOrderUser" />--%>
                    <telerik:AjaxUpdatedControl ControlID="autCustomers" />
                    <telerik:AjaxUpdatedControl ControlID="txtBillingFirstName" />
                    <telerik:AjaxUpdatedControl ControlID="txtBillingLastName" />
                    <telerik:AjaxUpdatedControl ControlID="txtBillingEmail" />
                    <telerik:AjaxUpdatedControl ControlID="txtBillingPhone" />
                    <telerik:AjaxUpdatedControl ControlID="txtBillingAddress" />
                    <telerik:AjaxUpdatedControl ControlID="ddBillingProvince" />
                    <telerik:AjaxUpdatedControl ControlID="ddBillingDistrict" />
                    <telerik:AjaxUpdatedControl ControlID="divRewardPoints" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="autProducts">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="autProducts" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderSubtotal" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderTotal" />
                    <telerik:AjaxUpdatedControl ControlID="grid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="chkSameAddress">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="divShippingInfo" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ddShippingProvince">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddShippingDistrict" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ddBillingProvince">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddBillingDistrict" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rdbListShippingMethod">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="litShippingFee" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderTotal" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderSubtotal" />
                    <telerik:AjaxUpdatedControl ControlID="litOrderTotal" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <Site:ProductDisplaySettings ID="displaySettings" runat="server" />
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="<%$Resources:ProductResources, OrderAdminTitle %>" ParentUrl="~/Product/AdminCP/OrderList.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, OrderDetailTitle %>" CurrentPageUrl="~/Product/AdminCP/OrderEdit.aspx" />
    <div class="admin-content">
        <portal:NotifyMessage ID="message" runat="server" />
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:Button ID="btnUpdate" SkinID="UpdateButton" Text="<%$Resources:ProductResources, ProductUpdateButton %>" runat="server" CausesValidation="true" />
            <asp:Button SkinID="DefaultButton" ID="btnPrint" Text="In đơn hàng" runat="server" CausesValidation="false" />
            <asp:Button ID="btnDelete" SkinID="DeleteButton" Text="<%$Resources:Resource, DeleteButton %>" runat="server" CausesValidation="false" />
            <a id="lnkPrint" style="display: inline-block; padding-left: 5px" runat="server" onclick="printOrder();" href="javascript:;"><i class="fa fa-print"></i>In</a>
        </portal:HeadingPanel>
        <div class="workplace admin-content-bg-white">
            <div class="row">
                <div class="col-md-8">
                    <div class="mrb10">
                        <telerik:RadAutoCompleteBox ID="autProducts" TextSettings-SelectionMode="Single" Skin="Simple" runat="server" Width="100%" DropDownWidth="500" DropDownHeight="200"
                            EmptyMessage="Tìm sản phẩm">
                            <WebServiceSettings Method="GetProductNames" Path="/Product/AdminCP/OrderEdit.aspx" />
                            <ClientDropDownItemTemplate>
                                <table cellpadding="0" cellspacing="3" width="100%">
                                    <tr>
                                        <td style="width:70%"><strong>#= Text #</strong></td>
                                        <td style="width:20%;text-align:right;">#= Attributes.Price #</td>
                                        <%--<td style="text-align:right;">#= Attributes.StockQuantity #</td>--%>
                                    </tr>
                                </table>
                            </ClientDropDownItemTemplate>
                        </telerik:RadAutoCompleteBox>
                    </div>
                    <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                        <MasterTableView DataKeyNames="Guid,ProductId,AttributeDescription,AttributesXml,Quantity,DiscountAmount" AllowPaging="false" AllowSorting="false">
                            <Columns>
                                <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>" UniqueName="ProductName">
                                    <ItemTemplate>
                                        <asp:Literal ID="litProductCode" runat="server" />
                                        <div>
                                            <asp:Literal ID="litProductName" runat="server" />
                                        </div>
                                        <asp:Literal ID="litAttributes" runat="server" />
                                        <div class="gifts">
                                            <%#Eval("AttributeDescription")%>
                                        </div>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderQuantityLabel %>" UniqueName="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQuantity" SkinID="NumericTextBox" Visible="true"
                                            MaxLength="4" Text='<%# Eval("Quantity") %>' runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged" />
                                        <%--<%# Eval("Quantity") %>--%>
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
                                <telerik:GridTemplateColumn Visible="true" UniqueName="Delete">
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" SkinID="InsertButton" CommandName="Delete" CommandArgument='<%#Eval("ProductId").ToString()%>' Text="Hủy" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <hr />
                    <div class="form-horizontal">
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblOrderStatus" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderStatusLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddOrderStatus" runat="server" CssClass="form-control" />
                                <asp:Label ID="litOrderStatus" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblOrderNote" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderNoteLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtOrderNote" TextMode="MultiLine" Style="min-height: 50px" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblCreatedOn" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderCreatedOnLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <asp:Literal ID="litCreatedOn" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblOrderCode" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderCodeLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <asp:Literal ID="litOrderCode" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="SiteLabel1" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0"
                                Text="Ngày nhận hàng thuận tiện nhất cho khách hàng" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <asp:Literal ID="litCustomerDateWant" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="SiteLabel4" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0"
                                Text="Khung thời gian bạn muốn nhận hàng" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <asp:Literal ID="litCustomerTimeWant" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div id="divShippingMethod" runat="server" class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingMethod" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="ShippingMethodLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7 rdo-list">
                                <asp:RadioButtonList ID="rdbListShippingMethod" AutoPostBack="true" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="ShippingMethodId" runat="server" />
                            </div>
                        </div>
                        <div id="divPaymentMethod" runat="server" class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblPaymentMethod" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="PaymentMethodLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7 rdo-list">
                                <asp:RadioButtonList ID="rdbListPaymentMethod" RepeatLayout="UnorderedList" CssClass="nav" DataTextField="Name" DataValueField="PaymentMethodId" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblPaymentStatus" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="PaymentStatusLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <asp:DropDownList ID="ddlPaymentStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Đã thanh toán" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Pending" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Chưa thanh toán" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnGetPaymentStatus" Text="Kiểm tra thủ công" SkinID="DefaultButton" Visible="false" runat="server" />
                            </div>
                        </div>

                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="SiteLabel3" runat="server" ForControl="cbOrdervices"
                                CssClass="settinglabel control-label col-sm-5 mb-0" Text="Dịch vụ " />
                            <div class="col-sm-7">
                                <asp:CheckBox runat="server" ID="cbOrdervices" Text="DV đông lạnh" Enabled="false" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblOrderSubtotal" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderSubTotalLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <b>
                                        <asp:Literal ID="litOrderSubtotal" runat="server" Text="Dịch vụ đông lạnh" />
                                    </b>
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="SiteLabel2" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0"
                                Text="Phí Dịch vụ" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <b>
                                        <asp:Literal ID="litOrderServiceTotal" runat="server" />
                                    </b>
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingFee" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderShippingFeeLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <b>
                                        <asp:Literal ID="litShippingFee" runat="server" />
                                    </b>
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblOrderDiscount" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderDiscountLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <b>
                                        <asp:Literal ID="litOrderDiscount" runat="server" />
                                    </b>
                                </p>
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblOrderTotal" runat="server" CssClass="settinglabel control-label col-sm-5 mb-0" ConfigKey="OrderTotalLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-7">
                                <p class="form-control-static mb-0">
                                    <b>
                                        <asp:Literal ID="litOrderTotal" runat="server" />
                                    </b>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div style="position: relative;" class="mrb10">
                        <telerik:RadAutoCompleteBox ID="autCustomers" TextSettings-SelectionMode="Single" Skin="Simple" runat="server" Width="100%" DropDownWidth="250" DropDownHeight="200"
                            EmptyMessage="Tìm khách hàng" OnClientEntryAdding="OnClientEntryAddingHandler">
                            <WebServiceSettings Method="GetUserNames" Path="/Product/AdminCP/OrderEdit.aspx" />
                            <ClientDropDownItemTemplate>
                                <table cellpadding="0" cellspacing="3" width="100%">
                                    <tr>
                                        <td style="width:70%"><strong>#= Text #</strong></td>
                                        <%--<td style="text-align:right;">#= Attributes.FirstName #</td>--%>
                                    </tr>
                                </table>
                            </ClientDropDownItemTemplate>
                        </telerik:RadAutoCompleteBox>
                        <%--<a id="linkAddNewPartner" runat="server" href="/Product/Partners/CustomerEdit.aspx" class="popup-link" style="position:absolute;right:4px;top:-6px;font-size:35px;color:Green;"><i class="fa fa-plus"></i></a>--%>
                    </div>
                    <h4 class="order-title" id="formOrderUser" runat="server">
                        <gb:SiteLabel ID="lblCustomerInfo" runat="server" ConfigKey="OrderCustomerInfo" ResourceFile="ProductResources" UseLabelTag="false" />
                    </h4>
                    <div class="form-horizontal">
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingFirstName" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderFirstNameLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtBillingFirstName" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="reqFirstName" ErrorMessage="Vui lòng nhập Họ tên" Display="Dynamic"
                                    ControlToValidate="txtBillingFirstName" runat="server" ValidationGroup="OrderEdit" SkinID="UserAddress" />
                                <asp:Literal ID="litBillingFirstName" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingLastName" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderLastNameLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtBillingLastName" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litBillingLastName" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingEmail" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderEmailLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtBillingEmail" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litBillingEmail" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingPhone" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderPhoneLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtBillingPhone" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litBillingPhone" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingAddress" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderAddressLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litBillingAddress" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingProvince" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderProvinceLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddBillingProvince" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="Guid" DataTextField="Name" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Literal ID="litBillingProvince" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblBillingDistrict" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderDistrictLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddBillingDistrict" DataValueField="Guid" DataTextField="Name" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Literal ID="litBillingDistrict" Visible="false" runat="server" />
                            </div>
                        </div>
                    </div>
                    <%--<h3 class="mb-30">
                        <gb:SiteLabel ID="lblConsigneeInfo" runat="server" ConfigKey="OrderConsigneeInfo" ResourceFile="ProductResources" UseLabelTag="false" />
                    </h3>--%>
                    <asp:CheckBox ID="chkSameAddress" runat="server" AutoPostBack="true" Text="Giao hàng đến địa chỉ khác" />
                    <div id="divShippingInfo" runat="server" visible="false" class="form-horizontal">
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingFirstName" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderFirstNameLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtShippingFirstName" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litShippingFirstName" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingLastName" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderLastNameLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtShippingLastName" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litShippingLastName" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingEmail" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderEmailLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtShippingEmail" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litShippingEmail" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingPhone" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderPhoneLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtShippingPhone" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litShippingPhone" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingAddress" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderAddressLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtShippingAddress" runat="server" CssClass="form-control" />
                                <asp:Literal ID="litShippingAddress" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingProvince" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderProvinceLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddShippingProvince" AutoPostBack="true" AppendDataBoundItems="true" DataValueField="Guid" DataTextField="Name" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Literal ID="litShippingProvince" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblShippingDistrict" runat="server" CssClass="settinglabel control-label col-sm-4 mb-0" ConfigKey="OrderDistrictLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddShippingDistrict" AutoPostBack="true" DataValueField="Guid" DataTextField="Name" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="<%$Resources:ProductResources, OrderSelectLabel %>" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Literal ID="litShippingDistrict" Visible="false" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div id="divRewardPoints" runat="server">
                            <hr />
                            <div class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblPointReward" runat="server" ForControl="txtPointReward" CssClass="settinglabel control-label col-sm-4 mb-0" Text="Điểm thưởng" ResourceFile="ProductResources" />
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPointReward" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblPointUsed" runat="server" ForControl="txtPointUsed" CssClass="settinglabel control-label col-sm-4 mb-0" Text="Điểm sử dụng" ResourceFile="ProductResources" />
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtPointUsed" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="settingrow form-group row align-items-center">
                                <asp:CheckBox ID="chkPointApproved" runat="server" />
                                <gb:SiteLabel ID="lblPointApproved" runat="server" ForControl="chkPointApproved" CssClass="settinglabel control-label col-sm-4 mb-0" Text="Duyệt điểm" ResourceFile="ProductResources" />
                                <div class="col-sm-8">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function OnClientEntryAddingHandler(sender, eventArgs) {
            if (sender.get_entries().get_count() > 0) {
                eventArgs.set_cancel(true);
            }
        }
    </script>
    <%--<style type="text/css">
        .attributes {
            font-size: 12px;
            font-style: italic;
        }

        .gifts img {
            max-width: 50px;
        }

        .RadComboBox, .RadComboBoxDropDown {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 13px
        }

            .RadComboBox .rcbActionButton {
                width: 34px;
                height: 34px;
            }

            .RadComboBox .rcbInner {
                height: auto;
                padding: 8px 22px 8px 5px
            }

            .RadComboBox .rcbInput, .RadComboBox .rcbInput:focus {
                box-shadow: none
            }
    </style>--%>
    <style type="text/css">
        .order-title {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .quantity {
            position: relative;
        }

            .quantity i {
                position: absolute;
                top: 6px;
                right: 5px;
            }

        .RadAutoCompleteBoxPopup .racList {
            font-family: inherit;
            font-size: 13px;
        }

        .RadAutoCompleteBox .racTokenList {
            background-clip: padding-box;
            background-color: #ffffff;
            background-image: none;
            border: 1px solid #cccccc;
            border-radius: 0;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
            color: #555555;
            display: block;
            font-size: 14px;
            line-height: 1.42857;
            padding: 7px 12px;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
        }

        .RadAutoCompleteBox .racToken {
            margin: 1px;
        }

        .RadAutoCompleteBox .racRemoveTokenLink {
            top: 5px;
        }

        .RadAutoCompleteBox .racTokenList .racInput {
            font-family: inherit;
            font-size: 13px;
            box-shadow: none;
            width: auto !important;
            margin-top: 4px;
        }
    </style>
    <script type="text/javascript">

        function getUrlParameter(sParam) {
            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : sParameterName[1];
                }
            }
        }

        function printOrder() {
            var orderId;
            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === "OrderID") {
                    orderId = sParameterName[1] === undefined ? true : sParameterName[1];
                }
            }
            //var orderId = getUrlParameter("OrderID");
            $.ajax({
                url: "/Product/Services/OrderPrint.ashx",
                type: "GET",
                dataType: "html",
                data: {
                    id: orderId
                },
                cache: !0,
                success: function (data) {
                    var oldstr = document.body.innerHTML;
                    document.body.innerHTML = "<html><head><title></title></head><body>" + data + "</body>";
                    window.print();
                    document.body.innerHTML = oldstr;
                }
            })

            return false;
        }
    </script>
</asp:Content>