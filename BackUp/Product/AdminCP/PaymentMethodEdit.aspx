<%@ Page Language="c#" CodeBehind="PaymentMethodEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.PaymentMethodEditPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="<%$Resources:ProductResources, PaymentMethodsTitle %>"
        ParentUrl="~/Product/AdminCP/PaymentMethods.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, PaymentMethodEditTitle %>"
        CurrentPageUrl="~/Product/AdminCP/PaymentMethodEdit.aspx" />
    <div class="admin-content">
        <asp:UpdatePanel ID="upButton" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <portal:NotifyMessage ID="message" runat="server" />
                <portal:HeadingPanel ID="heading" runat="server">
                    <asp:Button SkinID="UpdateButton" ID="btnUpdate" ValidationGroup="PaymentMethodEdit"
                        Text="<%$Resources:Resource, UpdateButton %>" runat="server" />
                    <asp:Button SkinID="UpdateButton" ID="btnUpdateAndNew" ValidationGroup="PaymentMethodEdit"
                        Text="<%$Resources:Resource, UpdateAndNewButton %>" runat="server" />
                    <asp:Button SkinID="UpdateButton" ID="btnUpdateAndClose" ValidationGroup="PaymentMethodEdit"
                        Text="<%$Resources:Resource, UpdateAndCloseButton %>" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsert" ValidationGroup="PaymentMethodEdit"
                        Text="<%$Resources:Resource, InsertButton %>" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsertAndNew" ValidationGroup="PaymentMethodEdit"
                        Text="<%$Resources:Resource, InsertAndNewButton %>" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsertAndClose" ValidationGroup="PaymentMethodEdit"
                        Text="<%$Resources:Resource, InsertAndCloseButton %>" runat="server" />
                    <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server"
                        Text="<%$Resources:Resource, DeleteButton %>" CausesValidation="false" />
                    <asp:Button SkinID="DeleteButton" ID="btnDeleteLanguage" Visible="false"
                        OnClick="btnDeleteLanguage_Click" Text="<%$Resources:Resource, DeleteLanguageButton %>"
                        runat="server" CausesValidation="false" />
                </portal:HeadingPanel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="workplace admin-content-bg-white">
            <div class="form-horizontal">
                <div id="divPaymentProvider" runat="server" class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblPaymentProvider" runat="server" ForControl="ddlPaymentProvider"
                        CssClass="settinglabel control-label col-sm-3" ConfigKey="PaymentMethodProviderLabel"
                        ResourceFile="ProductResources" />
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ddlPaymentProvider" runat="server" AutoPostBack="true"
                            CssClass="form-control" />
                    </div>
                </div>
                <div class="settingrow form-group row align-items-center">
                    <div class="col offset-sm-3">
                        <asp:CheckBox ID="chkIsActive" Checked="true" runat="server" />
                        <gb:SiteLabel ID="lblIsActive" runat="server" ForControl="chkIsActive"
                            CssClass="settinglabel control-label col-sm-3" ConfigKey="PaymentMethodIsActiveLabel"
                            ResourceFile="ProductResources" />
                    </div>
                    <div class="col-sm-9">
                        <p class="form-control-static">
                        </p>
                    </div>
                </div>
                <div id="divAdditionalFee" runat="server">
                    <div class="settingrow form-group row align-items-center">
                        <gb:SiteLabel ID="lblAdditionalFee" runat="server" ForControl="txtAdditionalFee"
                            CssClass="settinglabel control-label col-sm-3" ConfigKey="PaymentMethodAdditionalFeeLabel"
                            ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <div class="form-inline">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtAdditionalFee" runat="server" MaxLength="20"
                                            CssClass="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlUsePercentage" Width="160" runat="server">
                                            <asp:ListItem
                                                Text="<%$Resources:ProductResources, PaymentMethodAdditionalFeeByAmount %>"
                                                Value="false"></asp:ListItem>
                                            <asp:ListItem
                                                Text="<%$Resources:ProductResources, PaymentMethodAdditionalFeeByPercentage %>"
                                                Value="true"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upFree" runat="server">
                        <ContentTemplate>
                            <div class="settingrow form-group row align-items-center">
                                <asp:CheckBox ID="chkFreeOnOrdersOverXEnabled" AutoPostBack="true" runat="server" />
                                <gb:SiteLabel ID="lblFreeOnOrdersOverXEnabled" runat="server"
                                    ForControl="chkFreeOnOrdersOverXEnabled"
                                    CssClass="settinglabel control-label col-sm-3"
                                    ConfigKey="PaymentMethodFreeOnOrdersOverXLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <p class="form-control-static">
                                    </p>
                                </div>
                            </div>
                            <div id="divFreeOnOrdersOverXValue" visible="false" runat="server"
                                class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblFreeOnOrdersOverXValue" runat="server"
                                    ForControl="txtFreeOnOrdersOverXValue"
                                    CssClass="settinglabel control-label col-sm-3"
                                    ConfigKey="PaymentMethodFreeOnOrdersOverXValueLabel"
                                    ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtFreeOnOrdersOverXValue" runat="server" MaxLength="20"
                                        SkinID="PriceTextBox" CssClass="form-control" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:UpdatePanel ID="up" runat="server">
                    <ContentTemplate>
                        <telerik:RadTabStrip ID="tabLanguage" OnTabClick="tabLanguage_TabClick"
                            EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false" CssClass="subtabs"
                            SkinID="SubTabs" Visible="false" SelectedIndex="0" runat="server" />
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblName" runat="server" ForControl="txtName"
                                CssClass="settinglabel control-label col-sm-3" ShowRequired="true"
                                ConfigKey="ShippingMethodNameLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtName" MaxLength="255" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="<%$Resources:ProductResources, PaymentMethodNameRequiredWarning %>"
                                    Display="Dynamic" SetFocusOnError="true" CssClass="txterror"
                                    ValidationGroup="PaymentMethodEdit" />
                            </div>
                        </div>
                        <div class="settingrow form-group row align-items-center">
                            <gb:SiteLabel ID="lblDescription" runat="server" ForControl="edDescription"
                                CssClass="settinglabel control-label col-sm-3"
                                ConfigKey="ShippingMethodDescriptionLabel" ResourceFile="ProductResources" />
                            <div class="col-sm-9">
                                <gbe:EditorControl ID="edDescription" runat="server" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <portal:SessionKeepAliveControl ID="ka1" runat="server" />
    </div>
</asp:Content>