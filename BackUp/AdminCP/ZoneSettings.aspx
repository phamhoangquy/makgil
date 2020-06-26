<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="ZoneSettings.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AdminUI.ZoneProperties" %>

<%@ Register TagPrefix="portal" TagName="PublishType" Src="~/Controls/PublishTypeSetting.ascx" %>
<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:ZonesDisplaySettings ID="displaySettings" runat="server" />
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server" CurrentPageTitle="<%$Resources:Resource, ZoneInsertLink %>"
		CurrentPageUrl="~/AdminCP/ZoneSettings.aspx" ParentTitle="<%$Resources:Resource, ZoneStructureLink %>"
		ParentUrl="~/AdminCP/ZoneTree.aspx" />
	<div class="admin-content admin-content-bg-white">

		<portal:NotifyMessage ID="message" runat="server" />
		<div id="divtabs" class="tabs workplace">
			<ul class="nav nav-pills margin-bottom margin-top-10">
				<li role="presentation" class="nav-item ">
					<a aria-controls="tabSettings" role="tab" class="nav-link active" data-toggle="tab"
						href="#tabSettings">
						<asp:Literal ID="litSettingsTab" runat="server" />
					</a>
				</li>
				<li role="presentation" class="nav-item" id="liSecurity" runat="server" enableviewstate="false">
					<asp:Literal ID="litSecurityTab" runat="server" />
				</li>
				<li role="presentation" class="nav-item"><a aria-controls="tabSEO" role="tab" class="nav-link"
						data-toggle="tab" href="#tabSEO">
						<asp:Literal ID="litSEOSettingsTab" runat="server" /></a></li>
				<li role="presentation" class="nav-item"><a aria-controls="tabSitemap" role="tab" class="nav-link"
						data-toggle="tab" href="#tabSitemap">
						<asp:Literal ID="litSitemapTab" runat="server" /></a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade active show in" id="tabSettings">
					<div class="form-horizontal">
						<asp:UpdatePanel ID="up" runat="server">
							<ContentTemplate>
								<telerik:RadTabStrip ID="tabLanguage" OnTabClick="tabLanguage_TabClick"
									EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false" CssClass="subtabs"
									SkinID="SubTabs" Visible="false" SelectedIndex="0" runat="server" />
								<div class="row">
									<div class="col-lg-6">
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblZoneName" runat="server" ForControl="txtZoneName"
												CssClass="settinglabel control-label" ConfigKey="ZoneNameLabel" />
											<div class=''>
												<div class="input-group">
													<asp:TextBox ID="txtZoneName" runat="server" MaxLength="255"
														Cssclass="form-control" />
													<div class="input-group-append">
														<portal:gbHelpLink ID="gbHelpLink2" runat="server"
															HelpKey="zonesettingszonenamehelp" />
													</div>
												</div>
												<asp:RequiredFieldValidator ID="reqPageName" runat="server"
													Display="Dynamic" ControlToValidate="txtZoneName"
													ValidationGroup="zonesettings" SetFocusOnError="true" />
												<asp:HiddenField ID="hdnPageName" runat="server" />
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="settingrow form-group">
											<gb:SiteLabel ID="Sitelabel3" runat="server" ForControl="txtUrl"
												CssClass="settinglabel control-label"
												ConfigKey="ZoneSettingsUrlLabel" />
											<div class=''>
												<div class="input-group">
													<asp:TextBox ID="txtUrl" runat="server" MaxLength="255"
														Cssclass="form-control" />
													<div class="input-group-append">

														<portal:gbHelpLink ID="gbHelpLink5" runat="server"
															HelpKey="zonesettingsurlhelp" />
													</div>
												</div>
												<asp:RegularExpressionValidator ID="regexUrl" runat="server"
													ControlToValidate="txtUrl"
													ValidationExpression="((http\://|https\://|~/){1}(\S+){0,1})"
													Display="Dynamic" ValidationGroup="zonesettings"
													SetFocusOnError="true" />
												<span id="spnUrlWarning" runat="server"
													style="font-weight: normal; display: none;"
													class="txterror warning"></span>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div id="divDescription" runat="server" visible="false"
											class="settingrow form-group pagedescription">
											<gb:SiteLabel ID="Sitelabel36" runat="server" ForControl="edDescription"
												CssClass="settinglabel control-label"
												ConfigKey="ZoneSettingsDescription" />
											<div class="">
												<gbe:EditorControl id="edDescription" runat="server" />
												<asp:TextBox ID="txtDescription" CssClass="form-control" Visible="false"
													runat="server" />
											</div>
										</div>
									</div>
								</div>
							</ContentTemplate>
						</asp:UpdatePanel>
						<div class="row">
							<div class="col-lg-6">
								<div class="settingrow form-group">
									<gb:SiteLabel ID="lbl" runat="server" ForControl="ddPages"
										CssClass="settinglabel control-label" ConfigKey="ZoneSettingsPageLabel" />
									<div class="">
										<asp:DropDownList ID="ddPages" runat="server" DataTextField="PageName"
											DataValueField="PageID" Cssclass="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="settingrow form-group">
									<gb:SiteLabel ID="lblParentZone" runat="server" ForControl="ddParentZones"
										CssClass="settinglabel control-label" ConfigKey="ZoneSettingsParentZoneLabel" />
									<div class="">
										<asp:Label ID="lblParentZoneName" runat="server" Visible="false" />
										<asp:DropDownList ID="ddParentZones" runat="server" DataTextField="Name"
											DataValueField="ZoneID" Cssclass="form-control" />
										<asp:HiddenField ID="hdnParentZoneId" runat="server" />
										<asp:HyperLink ID="lnkParentZoneEdit" runat="server" CssClass="popup-link"
											Visible="false" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div id="divPrimaryImage" runat="server" class="settingrow form-group">
									<gb:SiteLabel ID="lblPrimaryImage" runat="server" ForControl="txtPrimaryImage"
										CssClass="settinglabel control-label"
										ConfigKey="ZoneSettingsPrimaryImageLabel" />
									<div class="">
										<asp:Image ID="imgPrimaryImage" style="max-width:100px; display:block;"
											Visible="false" runat="server" AlternateText="" />
										<div class="input-group">
											<asp:TextBox ID="txtPrimaryImage" MaxLength="255" runat="server"
												Cssclass="form-control" />
											<div class="input-group-append">
												<portal:FileBrowserTextBoxExtender ID="PrimaryImageFileBrowser"
													runat="server" BrowserType="image" Cssclass="btn btn-default" />
											</div>
											<div class="input-group-append">

												<portal:gbHelpLink ID="gbHelpLink6" runat="server"
													HelpKey="zonesettingsprimaryimagehelp" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div id="divSecondImage" runat="server" class="settingrow form-group">
									<gb:SiteLabel ID="lblSecondImage" runat="server" ForControl="txtSecondImage"
										CssClass="settinglabel control-label"
										ConfigKey="ZoneSettingsSecondImageLabel" />
									<div class="">
										<asp:Image ID="imgSecondImage" style="max-width:100px; display:block;"
											Visible="false" runat="server" AlternateText="" />
										<div class="input-group">
											<asp:TextBox ID="txtSecondImage" MaxLength="255" runat="server"
												Cssclass="form-control" />
											<div class="input-group-append">
												<portal:FileBrowserTextBoxExtender ID="SecondImageFileBrowser"
													runat="server" BrowserType="image" Cssclass="btn btn-default" />
											</div>
											<div class="input-group-append">

												<portal:gbHelpLink ID="gbHelpLink3" runat="server"
													HelpKey="zonesettingssecondimagehelp" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div id="divBodyCss" runat="server" class="settingrow form-group bodycss hidden">
									<gb:SiteLabel ID="SiteLabel27" runat="server" ForControl="txtBodyCssClass"
										CssClass="settinglabel control-label" ConfigKey="ZoneSettingsBodyCssClass" />
									<div class="">
										<div class="input-group">
											<asp:TextBox ID="txtBodyCssClass" runat="server" MaxLength="50"
												CssClass="form-control" />
											<div class="input-group-append">

												<portal:gbHelpLink ID="gbHelpLink35" runat="server"
													HelpKey="zonesettings-bodycssclass-help" />
											</div>
										</div>
										<asp:RegularExpressionValidator ID="regexBodyCss" Visible="false" runat="server"
											ControlToValidate="txtBodyCssClass"
											ValidationExpression="^([\s]?[a-zA-Z]+[_\-a-zA-Z0-9]+)*\z+"
											Display="Dynamic" ValidationGroup="zonesettings" SetFocusOnError="true" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div id="divPublishMode" class="settingrow form-group d-flex align-items-center"
									runat="server">
									<gb:SiteLabel ID="lblPublishMode" runat="server"
										CssClass="settinglabel control-label   mb-0" ConfigKey="PublishMode" />
									<div class="d-flex align-items-center">
										<div class="input-group">
											<portal:PublishType ID="publishType" runat="server" />
											<div class="input-group-append ml-2">

												<portal:gbHelpLink ID="gbHelpLink38" runat="server"
													HelpKey="zonesettings-publish-mode-help" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="divSSL" runat="server" class="settingrow form-group d-flex align-items-center">
							<asp:CheckBox ID="chkRequireSSL" runat="server" />
							<gb:SiteLabel ID="lblRequireSSL" runat="server" ForControl="chkRequireSSL"
								CssClass="settinglabel control-label   mb-0" ConfigKey="ZoneSettingsRequireSSLLabel" />
							<div class="d-flex align-items-center">
								<div class="input-group-append ml-2">

									<portal:gbHelpLink ID="gbHelpLink18" runat="server" RenderWrapper="false"
										HelpKey="zonesettingsrequiresslhelp" />
								</div>
							</div>
						</div>
						<div id="divPosition" visible="false" runat="server" class="settingrow form-group">
							<gb:SiteLabel ID="lblPosition" runat="server" ForControl="chkListPosition"
								CssClass="settinglabel control-label" ConfigKey="ZoneSettingsPositionLabel" />
							<div class="">
								<asp:CheckBoxList ID="chkListPosition" runat="server" DataTextField="Name"
									DataValueField="Value" SkinID="Enum" Cssclass="form-control" />
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div id="divIsPublished" runat="server"
									class="settingrow form-group d-flex align-items-center">
									<asp:CheckBox ID="chkIsPublished" runat="server" Checked="true" />
									<gb:SiteLabel ID="Sitelabel19" runat="server" ForControl="chkIsPublished"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsIsPublishedLabel" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">
											<portal:gbHelpLink ID="gbHelpLink29" runat="server" RenderWrapper="false"
												HelpKey="zonesettingsispublishedhelp" />
										</div>
									</div>
								</div>
								<div id="divIsClickable" runat="server"
									class="settingrow form-group d-flex align-items-center">
									<asp:CheckBox ID="chkIsClickable" runat="server" Checked="true" />
									<gb:SiteLabel ID="lblIsClickable" runat="server" ForControl="chkIsClickable"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsIsClickableLabel" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">
											<portal:gbHelpLink ID="gbHelpLink33" runat="server" RenderWrapper="false"
												HelpKey="zonesettingsisclickablehelp" />
										</div>
									</div>
								</div>
								<div id="divAllowBrowserCache" runat="server"
									class="settingrow form-group sitemapsettingrow d-flex align-items-center">
									<asp:CheckBox ID="chkAllowBrowserCache" runat="server"></asp:CheckBox>
									<gb:SiteLabel ID="Sitelabel12" runat="server" ForControl="chkAllowBrowserCache"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsAllowBrowserCacheLabel" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">
											<portal:gbHelpLink ID="gbHelpLink8" runat="server" RenderWrapper="false"
												HelpKey="zonesettingsallowbrowsercachehelp" />
										</div>
									</div>
								</div>
								<div class="settingrow form-group d-flex align-items-center">
									<asp:CheckBox ID="chkIncludeInSiteMap" runat="server" Checked="true" />
									<gb:SiteLabel ID="Sitelabel16" runat="server" ForControl="chkIncludeInSiteMap"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsIncludeInSiteMapLabel" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">

											<portal:gbHelpLink ID="gbHelpLink10" runat="server" RenderWrapper="false"
												HelpKey="zonesettingsincludeinsitemaphelp" />
										</div>
									</div>
								</div>
								<div class="settingrow form-group d-flex align-items-center">
									<asp:CheckBox ID="chkNewWindow" runat="server"></asp:CheckBox>
									<gb:SiteLabel ID="lblNewWindow" runat="server" ForControl="chkNewWindow"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsOpenInNewWindowLabel" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">
											<portal:gbHelpLink ID="gbHelpLink14" runat="server" RenderWrapper="false"
												HelpKey="zonesettingsnewwindowhelp" />
										</div>
									</div>
								</div>
								<div class="settingrow form-group d-flex align-items-center">
									<asp:CheckBox ID="chkHideAfterLogin" runat="server"></asp:CheckBox>
									<gb:SiteLabel ID="lblHideAfterLogin" runat="server" ForControl="chkHideAfterLogin"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsHideAfterLoginLabel" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">
											<portal:gbHelpLink ID="gbHelpLink17" runat="server" RenderWrapper="false"
												HelpKey="zonesettingshideafterloginhelp" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<asp:Panel ID="pnlModified" runat="server" EnableViewState="false" Visible="false">
							<div class="settingrow form-group pcreateddate">
								<gb:SiteLabel ID="Sitelabel31" runat="server" CssClass="settinglabel control-label"
									ConfigKey="Created" />
								<div class="">
									<asp:Label ID="lblCreatedDate" runat="server" CssClass="readonly" />
								</div>
							</div>
							<div class="settingrow form-group pmodifieddate">
								<gb:SiteLabel ID="Sitelabel32" runat="server" CssClass="settinglabel control-label"
									ConfigKey="LastModified" />
								<div class="">
									<asp:Label ID="lblLastModifiedDate" runat="server" CssClass="readonly" />
								</div>
							</div>
							<div class="settingrow form-group pmodby">
								<gb:SiteLabel ID="Sitelabel33" runat="server" CssClass="settinglabel control-label"
									ConfigKey="LastModifiedBy" />
								<div class="">
									<asp:Label ID="lblLastModifiedBy" runat="server" CssClass="readonly" />
								</div>
							</div>
						</asp:Panel>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="tabSecurity" runat="server">
					<div id="divRoles" runat="server" class="accordion">
						<h3 id="h3ViewRoles" runat="server">
							<gb:SiteLabel ID="lblAuthorizedRoles" runat="server" ConfigKey="ZoneSettingsViewRolesLabel"
								UseLabelTag="false" />
						</h3>
						<div id="divViewRoles" runat="server">
							<asp:RadioButton ID="rbViewAdminOnly" runat="server" GroupName="rdoviewroles"
								CssClass="rbroles rbadminonly" />
							<div>
								<asp:RadioButton ID="rbViewUseRoles" runat="server" GroupName="rdoviewroles"
									CssClass="rbroles" />
							</div>
							<asp:CheckBoxList ID="chkListViewRoles" runat="server" SkinID="Roles" />
						</div>
						<h3 id="h3AuthorizedRoles" runat="server">
							<gb:SiteLabel ID="SiteLabel21" runat="server" ConfigKey="ZoneSettingsAuthorizedRolesLabel"
								UseLabelTag="false" />
						</h3>
						<div id="divAuthorizedRoles" runat="server">
							<asp:RadioButton ID="rbEditAdminOnly" runat="server" GroupName="rdoeditroles"
								CssClass="rbroles rbadminonly" />
							<div>
								<asp:RadioButton ID="rbEditUseRoles" runat="server" GroupName="rdoeditroles"
									CssClass="rbroles" />
							</div>
							<asp:CheckBoxList ID="chkListEditRoles" runat="server" SkinID="Roles" />
						</div>
					</div>
					<div id="divRoleLinks" runat="server" visible="false" enableviewstate="false">
						<ul class="list-group">
							<li class="list-group-item">
								<asp:HyperLink ID="lnkZoneViewRoles" runat="server" />
							</li>
							<li class="list-group-item">
								<asp:HyperLink ID="lnkZoneAuthorizedRoles" runat="server" />
							</li>
						</ul>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="tabSEO">
					<asp:Panel ID="pnlMetaSettings" runat="server" SkinID="plain">
						<asp:UpdatePanel ID="upSEO" runat="server">
							<ContentTemplate>
								<telerik:RadTabStrip ID="tabLanguageSEO" OnTabClick="tabLanguageSEO_TabClick"
									EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false" CssClass="subtabs"
									SkinID="SubTabs" Visible="false" SelectedIndex="0" runat="server" />
								<div class="form-horizontal">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblMetaTitle" runat="server" ForControl="txtMetaTitle"
											CssClass="settinglabel control-label" ConfigKey="MetaTitleLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaTitle" runat="server" MaxLength="65"
													Cssclass="form-control" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="GbHelpLink4" runat="server"
														HelpKey="zonesettings-metatitle-help" />
												</div>
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblDescription" runat="server" ForControl="txtMetaDescription"
											CssClass="settinglabel control-label" ConfigKey="MetaDescriptionLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaDescription" runat="server" MaxLength="156"
													Cssclass="form-control" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink23" runat="server"
														HelpKey="zonesettings-metadescription-help" />
												</div>
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblKeywords" runat="server" ForControl="txtMetaKeywords"
											CssClass="settinglabel control-label" ConfigKey="MetaKeywordsLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaKeywords" runat="server" MaxLength="156"
													Cssclass="form-control" />
												<div class="input-group-append ">

													<portal:gbHelpLink ID="gbHelpLink22" runat="server"
														HelpKey="zonesettings-metakeywords-help" />
												</div>
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel23" runat="server" ForControl="txtCannonicalOverride"
											CssClass="settinglabel control-label"
											ConfigKey="ZoneSettingsCanonicalOverride" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtCannonicalOverride" runat="server" MaxLength="255"
													Cssclass="form-control" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink31" runat="server"
														HelpKey="zonesettings-cannonicaloverride-help" />
												</div>
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblAdditionalMetaTags" ForControl="txtAdditionalMetaTags"
											CssClass="settinglabel control-label" runat="server"
											ConfigKey="MetaAdditionalLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtAdditionalMetaTags" CssClass="form-control"
													TextMode="MultiLine" runat="server" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink25" runat="server"
														HelpKey="zonesettings-additionalmeta-help" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</ContentTemplate>
						</asp:UpdatePanel>
						<asp:Panel ID="pnlMeta" runat="server">
							<asp:UpdatePanel ID="updMetaLinks" runat="server" UpdateMode="Conditional">
								<ContentTemplate>
									<div class="mrb10">
										<div class="left">
											<asp:Button SkinID="DefaultButton" ID="btnAddMetaLink" runat="server" />
										</div>
										<div class="left">
											<asp:UpdateProgress ID="prgMetaLinks" runat="server"
												AssociatedUpdatePanelID="updMetaLinks">
												<ProgressTemplate>
													<img src='<%= Page.ResolveUrl("~/Data/SiteImages/indicators/indicator1.gif") %>'
														alt=' ' />
												</ProgressTemplate>
											</asp:UpdateProgress>
										</div>
										<div class="clear">
										</div>
									</div>
									<telerik:RadGrid ID="grdMetaLinks" SkinID="radGridSkin" runat="server">
										<MasterTableView DataKeyNames="Guid" EditMode="InPlace" AllowPaging="false"
											AllowSorting="false">
											<Columns>
												<telerik:GridTemplateColumn>
													<ItemTemplate>
														<asp:Button ID="btnEditMetaLink" SkinID="DefaultButton"
															runat="server" CommandName="Edit"
															Text='<%# Resources.Resource.ContentMetaGridEditButton %>' />
														<asp:LinkButton ID="btnMoveUpMetaLink" runat="server"
															CommandName="MoveUp" CommandArgument='<%# Eval("Guid") %>'
															ToolTip='<%# Resources.Resource.ContentMetaGridMoveUpButton %>'
															Visible='<%# (Convert.ToInt32(Eval("SortRank")) > 3) %>'><i
																class="fa fa-angle-up"></i></asp:LinkButton>
														<asp:LinkButton ID="btnMoveDownMetaLink" runat="server"
															CommandName="MoveDown" CommandArgument='<%# Eval("Guid") %>'
															ToolTip='<%# Resources.Resource.ContentMetaGridMoveDownButton %>'>
															<i class="fa fa-angle-down"></i></asp:LinkButton>
													</ItemTemplate>
													<EditItemTemplate>
													</EditItemTemplate>
												</telerik:GridTemplateColumn>
												<telerik:GridTemplateColumn>
													<ItemTemplate>
														<%# Eval("Rel") %>
													</ItemTemplate>
													<EditItemTemplate>
														<div class="settingrow form-group">
															<gb:SiteLabel ID="lblNameMetaRel" runat="server"
																ForControl="txtRel"
																CssClass="settinglabel control-label"
																ConfigKey="ContentMetaRelLabel"
																ResourceFile="Resource" />
															<asp:TextBox ID="txtRel"
																CssClass="widetextbox forminput form-control"
																runat="server" Text='<%# Eval("Rel") %>' />
															<asp:RequiredFieldValidator ID="reqMetaName" runat="server"
																ControlToValidate="txtRel"
																ErrorMessage='<%# Resources.Resource.ContentMetaLinkRelRequired %>'
																ValidationGroup="metalink" />
														</div>
														<div class="settingrow form-group">
															<gb:SiteLabel ID="lblMetaHref" runat="server"
																ForControl="txtHref"
																CssClass="settinglabel control-label"
																ConfigKey="ContentMetaMetaHrefLabel"
																ResourceFile="Resource" />
															<asp:TextBox ID="txtHref" CssClass="form-control"
																runat="server" Text='<%# Eval("Href") %>' />
															<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
																runat="server" ControlToValidate="txtHref"
																ErrorMessage='<%# Resources.Resource.ContentMetaLinkHrefRequired %>'
																ValidationGroup="metalink" />
														</div>
														<div class="settingrow form-group">
															<gb:SiteLabel ID="lblScheme" runat="server"
																ForControl="txtScheme"
																CssClass="settinglabel control-label"
																ConfigKey="ContentMetHrefLangLabel"
																ResourceFile="Resource" />
															<asp:TextBox ID="txtHrefLang"
																CssClass="widetextbox forminput" runat="server"
																Text='<%# Eval("HrefLang") %>' />
														</div>
														<div class="settingrow form-group">
															<asp:Button SkinID="DefaultButton" ID="btnUpdateMetaLink"
																runat="server"
																Text='<%# Resources.Resource.ContentMetaGridUpdateButton %>'
																CommandName="Update" ValidationGroup="metalink"
																CausesValidation="true" />
															<asp:Button SkinID="DefaultButton" ID="btnDeleteMetaLink"
																runat="server"
																Text='<%# Resources.Resource.ContentMetaGridDeleteButton %>'
																CommandName="Delete" CausesValidation="false" />
															<asp:Button SkinID="DefaultButton" ID="btnCancelMetaLink"
																runat="server"
																Text='<%# Resources.Resource.ContentMetaGridCancelButton %>'
																CommandName="Cancel" CausesValidation="false" />
														</div>
													</EditItemTemplate>
												</telerik:GridTemplateColumn>
												<telerik:GridTemplateColumn>
													<ItemTemplate>
														<%# Eval("Href") %>
													</ItemTemplate>
												</telerik:GridTemplateColumn>
											</Columns>
										</MasterTableView>
									</telerik:RadGrid>
								</ContentTemplate>
							</asp:UpdatePanel>
							<asp:UpdatePanel ID="upMeta" runat="server" UpdateMode="Conditional">
								<ContentTemplate>
									<div class="mrb10">
										<div class="left">
											<asp:Button SkinID="DefaultButton" ID="btnAddMeta" runat="server" />
										</div>
										<div class="left">
											<asp:UpdateProgress ID="prgMeta" runat="server"
												AssociatedUpdatePanelID="upMeta">
												<ProgressTemplate>
													<img src='<%= Page.ResolveUrl("~/Data/SiteImages/indicators/indicator1.gif") %>'
														alt=' ' />
												</ProgressTemplate>
											</asp:UpdateProgress>
										</div>
										<div class="clear">
										</div>
									</div>
									<telerik:RadGrid ID="grdContentMeta" SkinID="radGridSkin" runat="server">
										<MasterTableView DataKeyNames="Guid" EditMode="InPlace" AllowPaging="false"
											AllowSorting="false">
											<Columns>
												<telerik:GridTemplateColumn>
													<ItemTemplate>
														<asp:Button ID="btnEditMeta" SkinID="DefaultButton"
															runat="server" CommandName="Edit"
															Text='<%# Resources.Resource.ContentMetaGridEditButton %>' />
														<asp:LinkButton ID="btnMoveUpMeta" runat="server"
															CommandName="MoveUp" CommandArgument='<%# Eval("Guid") %>'
															ToolTip='<%# Resources.Resource.ContentMetaGridMoveUpButton %>'
															Visible='<%# (Convert.ToInt32(Eval("SortRank")) > 3) %>'><i
																class="fa fa-angle-up"></i></asp:LinkButton>
														<asp:LinkButton ID="btnMoveDownMeta" runat="server"
															CommandName="MoveDown" CommandArgument='<%# Eval("Guid") %>'
															ToolTip='<%# Resources.Resource.ContentMetaGridMoveDownButton %>'>
															<i class="fa fa-angle-down"></i></asp:LinkButton>
													</ItemTemplate>
													<EditItemTemplate>
													</EditItemTemplate>
												</telerik:GridTemplateColumn>
												<telerik:GridTemplateColumn>
													<ItemTemplate>
														<%# Eval("Name") %>
													</ItemTemplate>
													<EditItemTemplate>
														<div class="form-horizontal">
															<div class="settingrow form-group">
																<gb:SiteLabel ID="lblName" runat="server"
																	ForControl="txtName"
																	CssClass="settinglabel control-label"
																	ConfigKey="ContentMetaNameLabel"
																	ResourceFile="Resource" />
																<asp:TextBox ID="txtName"
																	CssClass="widetextbox forminput form-control"
																	runat="server" Text='<%# Eval("Name") %>' />
																<asp:RequiredFieldValidator ID="reqMetaName"
																	runat="server" ControlToValidate="txtName"
																	ErrorMessage='<%# Resources.Resource.ContentMetaNameRequired %>'
																	ValidationGroup="meta" />
															</div>
															<div class="settingrow form-group">
																<gb:SiteLabel ID="lblMetaContent" runat="server"
																	ForControl="txtMetaContent"
																	CssClass="settinglabel control-label"
																	ConfigKey="ContentMetaMetaContentLabel"
																	ResourceFile="Resource" />
																<asp:TextBox ID="txtMetaContent" CssClass="form-control"
																	runat="server" Text='<%# Eval("MetaContent") %>' />
																<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
																	runat="server" ControlToValidate="txtName"
																	ErrorMessage='<%# Resources.Resource.ContentMetaContentRequired %>'
																	ValidationGroup="meta" />
															</div>
															<div class="settingrow form-group">
																<gb:SiteLabel ID="lblScheme" runat="server"
																	ForControl="txtScheme"
																	CssClass="settinglabel control-label"
																	ConfigKey="ContentMetaSchemeLabel"
																	ResourceFile="Resource" />
																<asp:TextBox ID="txtScheme"
																	CssClass="widetextbox forminput form-control"
																	runat="server" Text='<%# Eval("Scheme") %>' />
															</div>
															<div class="settingrow form-group">
																<gb:SiteLabel ID="lblLangCode" runat="server"
																	ForControl="txtLangCode"
																	CssClass="settinglabel control-label"
																	ConfigKey="ContentMetaLangCodeLabel"
																	ResourceFile="Resource" />
																<asp:TextBox ID="txtLangCode"
																	CssClass="smalltextbox forminput form-control"
																	runat="server" Text='<%# Eval("LangCode") %>' />
															</div>
															<div class="settingrow form-group">
																<gb:SiteLabel ID="lblDir" runat="server"
																	ForControl="ddDirection"
																	CssClass="settinglabel control-label"
																	ConfigKey="ContentMetaDirLabel"
																	ResourceFile="Resource" />
																<asp:DropDownList ID="ddDirection" runat="server"
																	CssClass="forminput form-control">
																	<asp:ListItem Text="" Value=""></asp:ListItem>
																	<asp:ListItem Text="ltr" Value="ltr"></asp:ListItem>
																	<asp:ListItem Text="rtl" Value="rtl"></asp:ListItem>
																</asp:DropDownList>
															</div>
															<div class="settingrow form-group">
																<asp:Button SkinID="DefaultButton" ID="btnUpdateMeta"
																	runat="server"
																	Text='<%# Resources.Resource.ContentMetaGridUpdateButton %>'
																	CommandName="Update" ValidationGroup="meta"
																	CausesValidation="true" />
																<asp:Button SkinID="DefaultButton" ID="btnDeleteMeta"
																	runat="server"
																	Text='<%# Resources.Resource.ContentMetaGridDeleteButton %>'
																	CommandName="Delete" CausesValidation="false" />
																<asp:Button SkinID="DefaultButton" ID="btnCancelMeta"
																	runat="server"
																	Text='<%# Resources.Resource.ContentMetaGridCancelButton %>'
																	CommandName="Cancel" CausesValidation="false" />
															</div>
														</div>
													</EditItemTemplate>
												</telerik:GridTemplateColumn>
												<telerik:GridTemplateColumn>
													<ItemTemplate>
														<%# Eval("MetaContent") %>
													</ItemTemplate>
												</telerik:GridTemplateColumn>
											</Columns>
										</MasterTableView>
									</telerik:RadGrid>
								</ContentTemplate>
							</asp:UpdatePanel>
						</asp:Panel>
					</asp:Panel>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="tabSitemap">
					<div class="form-horizontal">
						<asp:Panel ID="pnlSearchEngineOptimization" runat="server" SkinID="plain">
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel14" runat="server" ForControl="ddChangeFrequency"
									CssClass="settinglabel control-label"
									ConfigKey="ZoneSettingsChangeFrequencyLabel" />
								<div class="">
									<div class="input-group">
										<asp:DropDownList ID="ddChangeFrequency" runat="server"
											CssClass="forminput form-control" />
										<div class="input-group-append">

											<portal:gbHelpLink ID="gbHelpLink26" runat="server"
												HelpKey="zonesettingsseochangefequencyhelp" />
										</div>
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel15" runat="server" ForControl="ddSiteMapPriority"
									CssClass="settinglabel control-label" ConfigKey="ZoneSettingsPriorityLabel" />
								<div class="">
									<div class="input-group">
										<asp:DropDownList ID="ddSiteMapPriority" runat="server"
											CssClass="forminput form-control">
											<asp:ListItem Text="0.0" Value="0.0" />
											<asp:ListItem Text="0.1" Value="0.1" />
											<asp:ListItem Text="0.2" Value="0.2" />
											<asp:ListItem Text="0.3" Value="0.3" />
											<asp:ListItem Text="0.4" Value="0.4" />
											<asp:ListItem Text="0.5" Value="0.5" Selected="true" />
											<asp:ListItem Text="0.6" Value="0.6" />
											<asp:ListItem Text="0.7" Value="0.7" />
											<asp:ListItem Text="0.8" Value="0.8" />
											<asp:ListItem Text="0.9" Value="0.9" />
											<asp:ListItem Text="1.0" Value="1.0" />
										</asp:DropDownList>
										<div class="input-group-append">

											<portal:gbHelpLink ID="gbHelpLink27" runat="server"
												HelpKey="zonesettingssitemappriorityhelp" />
										</div>
									</div>
								</div>
							</div>
						</asp:Panel>
						<div class="row">
							<div class="offset-sm-3 col">
								<div class="settingrow form-group d-flex align-items-center">
									<asp:CheckBox ID="chkIncludeInSearchEngineSiteMap" runat="server" Checked="true" />
									<gb:SiteLabel ID="SiteLabel22" runat="server"
										ForControl="chkIncludeInSearchEngineSiteMap"
										CssClass="settinglabel control-label mb-0"
										ConfigKey="ZoneSettingsIncludeInSearchengineSiteMap" />
									<div class="d-flex align-items-center">
										<div class="input-group-append ml-2">

											<portal:gbHelpLink ID="gbHelpLink30" runat="server" RenderWrapper="false"
												HelpKey="zonesettings-IncludeInSearchEngineSiteMap-help" />
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<portal:HeadingPanel ID="heading" runat="server" Cssclass="pt-0">
			<asp:UpdatePanel ID="upButton" UpdateMode="Conditional" runat="server" Cssclass="pt-0">
				<ContentTemplate>
					<asp:Button SkinID="SaveButton" ID="applyBtn" runat="server" ValidationGroup="zonesettings"
						Text="Apply Changes" />
					<asp:Button SkinID="SaveButton" ID="applyAndNewBtn" ValidationGroup="zonesettings" runat="server" />
					<asp:Button SkinID="SaveButton" ID="applyAndCloseBtn" ValidationGroup="zonesettings"
						runat="server" />
					<asp:HyperLink SkinID="DefaultButton" ID="lnkViewPage" Visible="false" runat="server"
						EnableViewState="false"></asp:HyperLink>
					<asp:Button ID="btnDelete" SkinID="DeleteButton" runat="server" CausesValidation="false" />
					<asp:Button ID="btnDeleteLanguage" SkinID="DeleteButton" Visible="false" runat="server"
						CausesValidation="false" />
				</ContentTemplate>
			</asp:UpdatePanel>
		</portal:HeadingPanel>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />