<%@ Page ValidateRequest="false" Language="c#" CodeBehind="ManufacturerEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.ManufacturerEditPage" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:ManufacturerDisplaySettings ID="displaySettings" runat="server" />
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="<%$Resources:ProductResources, ManufacturersTitle %>"
        ParentUrl="~/Product/AdminCP/Manufacturers.aspx"
        CurrentPageTitle="<%$Resources:ProductResources, ManufacturerEditTitle %>"
        CurrentPageUrl="~/Product/AdminCP/ManufacturerEdit.aspx" />
    <div class="admin-content">
        <asp:UpdatePanel ID="upButton" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <portal:NotifyMessage ID="message" runat="server" />
                <portal:HeadingPanel ID="heading" runat="server">
                    <asp:Button SkinID="UpdateButton" ID="btnUpdate" Text="<%$Resources:Resource, UpdateButton %>"
                        ValidationGroup="manufacturer" runat="server" />
                    <asp:Button SkinID="UpdateButton" ID="btnUpdateAndNew"
                        Text="<%$Resources:Resource, UpdateAndNewButton %>" ValidationGroup="manufacturer"
                        runat="server" />
                    <asp:Button SkinID="UpdateButton" ID="btnUpdateAndClose"
                        Text="<%$Resources:Resource, UpdateAndCloseButton %>" ValidationGroup="manufacturer"
                        runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsert" Text="<%$Resources:Resource, InsertButton %>"
                        ValidationGroup="manufacturer" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsertAndNew"
                        Text="<%$Resources:Resource, InsertAndNewButton %>" ValidationGroup="manufacturer"
                        runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsertAndClose"
                        Text="<%$Resources:Resource, InsertAndCloseButton %>" ValidationGroup="manufacturer"
                        runat="server" />
                    <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" Text="Delete this item"
                        CausesValidation="false" />
                    <asp:Button SkinID="DeleteButton" ID="btnDeleteLanguage" Visible="false"
                        OnClick="btnDeleteLanguage_Click" Text="<%$Resources:Resource, DeleteLanguageButton %>"
                        runat="server" CausesValidation="false" />
                </portal:HeadingPanel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="workplace admin-content-bg-white">
            <div id="divtabs" class="tabs">
                <ul id="ulTabs" runat="server" class="nav nav-pills margin-bottom">
                    <li role="presentation" class="nav-item"><a aria-controls="tabContent" role="tab" data-toggle="tab"
                        href="#tabContent" class="nav-link active">
                        <asp:Literal ID="litContentTab" runat="server" /></a></li>
                    <li role="presentation" class="nav-item">
                        <asp:Literal ID="litMetaTab" runat="server" />
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade active show in" id="tabContent">
                        <div class="form-horizontal">
                            <div id="divPages" runat="server" class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblPages" runat="server" ForControl="ddPages"
                                    CssClass="settinglabel control-label col-sm-3 mb-0"
                                    ConfigKey="ZoneSettingsPageLabel" />
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="ddPages" runat="server" DataTextField="PageName"
                                        DataValueField="PageID" CssClass="form-control" />
                                </div>
                            </div>
                            <div id="divZones" runat="server" class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel" ResourceFile="Resource"
                                    ForControl="cobZones" CssClass="settinglabel control-label col-sm-3 mb-0" />
                                <div class="col-sm-9">
                                    <portal:ComboBox ID="cobZones" SelectionMode="Multiple" runat="server" />
                                </div>
                            </div>
                            <div id="divPrimaryImage" runat="server"
                                class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblPrimaryImage" runat="server" ForControl="txtPrimaryImage"
                                    CssClass="settinglabel control-label col-sm-3 mb-0"
                                    ConfigKey="ManufacturerPrimaryImageLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:Image ID="imgPrimaryImage" Style="max-width: 100px; display: block;"
                                        Visible="false" runat="server" AlternateText="" />
                                    <div class="input-group">
                                        <asp:TextBox ID="txtPrimaryImage" MaxLength="255" runat="server"
                                            CssClass="form-control" />
                                        <div class="input-group-addon">
                                            <portal:FileBrowserTextBoxExtender ID="PrimaryImageFileBrowser"
                                                runat="server" BrowserType="image" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="divSecondImage" visible="false" runat="server"
                                class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblSecondImage" runat="server" ForControl="txtSecondImage"
                                    CssClass="settinglabel control-label col-sm-3 mb-0"
                                    ConfigKey="ManufacturerSecondImageLabel" ResourceFile="ProductResources" />
                                <div class="col-sm-9">
                                    <asp:Image ID="imgSecondImage" Style="max-width: 100px; display: block;"
                                        Visible="false" runat="server" AlternateText="" />
                                    <div class="input-group">
                                        <asp:TextBox ID="txtSecondImage" MaxLength="255" runat="server"
                                            CssClass="form-control" />
                                        <div class="input-group-addon">
                                            <portal:FileBrowserTextBoxExtender ID="SecondImageFileBrowser"
                                                runat="server" BrowserType="image" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="divShowOption" visible="false" runat="server"
                                class="settingrow form-group row align-items-center">
                                <gb:SiteLabel ID="lblShowOption" runat="server" ForControl="chlShowOption"
                                    ConfigKey="ShowOptionLabel" ResourceFile="ProductResources"
                                    CssClass="settinglabel control-label col-sm-3 mb-0" />
                                <div class="col-sm-9">
                                    <asp:CheckBoxList ID="chlShowOption" SkinID="Enum" runat="server" />
                                </div>
                            </div>
                            <div id="divIsPublished" class="settingrow form-group row align-items-center"
                                runat="server">
                                <div class="offset-sm-3 col">
                                    <asp:CheckBox ID="chkIsPublished" runat="server" Checked="true" />
                                    <gb:SiteLabel ID="lblIsPublished" runat="server" ForControl="chkIsPublished"
                                        ConfigKey="ManufacturerIsPublishedLabel" ResourceFile="ProductResources"
                                        CssClass="settinglabel control-label mb-0" />
                                </div>
                            </div>
                            <asp:UpdatePanel ID="up" runat="server">
                                <ContentTemplate>
                                    <telerik:RadTabStrip ID="tabLanguage" OnTabClick="tabLanguage_TabClick"
                                        EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false"
                                        CssClass="subtabs" SkinID="SubTabs" Visible="false" SelectedIndex="0"
                                        runat="server" />
                                    <div class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblName" runat="server" ForControl="txtName"
                                            CssClass="settinglabel control-label col-sm-3 mb-0"
                                            ConfigKey="ManufacturerNameLabel" ResourceFile="ProductResources" />
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtName" runat="server" MaxLength="255"
                                                CssClass="forminput verywidetextbox form-control" />
                                            <asp:RequiredFieldValidator ID="reqName" runat="server"
                                                ControlToValidate="txtName" Display="Dynamic" SetFocusOnError="true"
                                                CssClass="txterror" ValidationGroup="manufacturer" />
                                        </div>
                                    </div>
                                    <div id="divUrl" runat="server"
                                        class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblUrl" runat="server" ForControl="txtUrl"
                                            CssClass="settinglabel control-label col-sm-3 mb-0"
                                            ConfigKey="ManufacturerUrlLabel" ResourceFile="ProductResources" />
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtUrl" runat="server" MaxLength="255"
                                                CssClass="forminput verywidetextbox form-control" />
                                            <span id="spnUrlWarning" runat="server"
                                                style="font-weight: normal; display: none;" class="txterror"></span>
                                            <asp:HiddenField ID="hdnTitle" runat="server" />
                                            <asp:RegularExpressionValidator ID="regexUrl" runat="server"
                                                ControlToValidate="txtUrl"
                                                ValidationExpression="((http\://|https\://|~/){1}(\S+){0,1})"
                                                Display="Dynamic" SetFocusOnError="true"
                                                ValidationGroup="manufacturer" />
                                        </div>
                                    </div>
                                    <div id="divDescription" runat="server"
                                        class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblDescription" runat="server"
                                            CssClass="settinglabel control-label col-sm-3 mb-0"
                                            ConfigKey="ManufacturerDescriptionLabel" ResourceFile="ProductResources" />
                                        <div class="col-sm-9">
                                            <gbe:EditorControl ID="edDescription" runat="server" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tabMeta" runat="server">
                        <asp:UpdatePanel ID="upSEO" runat="server">
                            <ContentTemplate>
                                <telerik:RadTabStrip ID="tabLanguageSEO" OnTabClick="tabLanguageSEO_TabClick"
                                    EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false" CssClass="subtabs"
                                    SkinID="SubTabs" Visible="false" SelectedIndex="0" runat="server" />
                                <div class="form-horizontal">
                                    <div class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblMetaTitle" runat="server" ForControl="txtMetaTitle"
                                            CssClass="settinglabel control-label col-sm-3 mb-0"
                                            ConfigKey="MetaTitleLabel" />
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtMetaTitle" runat="server" MaxLength="65"
                                                CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblMetaDescription" runat="server"
                                            ForControl="txtMetaDescription"
                                            CssClass="settinglabel control-label col-sm-3 mb-0"
                                            ConfigKey="MetaDescriptionLabel" ResourceFile="ProductResources" />
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtMetaDescription" runat="server" MaxLength="156"
                                                CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblMetaKeywords" runat="server" ForControl="txtMetaKeywords"
                                            CssClass="settinglabel control-label col-sm-3 mb-0"
                                            ConfigKey="MetaKeywordsLabel" ResourceFile="ProductResources" />
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtMetaKeywords" runat="server" MaxLength="156"
                                                CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div id="divAdditionalMetaTags" runat="server" visible="false"
                                        class="settingrow form-group row align-items-center">
                                        <gb:SiteLabel ID="lblAdditionalMetaTags" ForControl="txtAdditionalMetaTags"
                                            CssClass="settinglabel control-label col-sm-3 mb-0" runat="server"
                                            ConfigKey="MetaAdditionalLabel" />
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="txtAdditionalMetaTags" CssClass="form-control"
                                                TextMode="MultiLine" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <portal:SessionKeepAliveControl ID="ka1" runat="server" />
    </div>
</asp:Content>