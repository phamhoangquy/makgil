<%@ Page Language="C#" AutoEventWireup="false" MaintainScrollPositionOnPostback="true"
    MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="SiteSettings.aspx.cs"
    Inherits="CanhCam.Web.AdminUI.SiteSettingsPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
		CurrentPageTitle="<%$Resources:Resource, AdminMenuSiteSettingsLink %>"
		CurrentPageUrl="~/AdminCP/SiteSettings.aspx" />
	<div class="admin-content">

		<asp:UpdatePanel ID="upNotify" UpdateMode="Conditional" runat="server">
			<ContentTemplate>
				<portal:NotifyMessage ID="message" runat="server" />
			</ContentTemplate>
		</asp:UpdatePanel>
		<asp:Panel ID="pnlSiteSettings" CssClass="workplace admin-content-bg-white" runat="server">
			<portal:HeadingPanel id="heading" runat="server">
				<asp:Button SkinID="SaveButton" ID="btnSave" Text="Apply Changes" ValidationGroup="sitesettings"
					runat="server" />
				<asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" Visible="false"
					CausesValidation="false" />
				<asp:HyperLink SkinID="InsertButton" ID="lnkNewSite" Visible="false" runat="server" />
			</portal:HeadingPanel>
			<div id="divtabs" class="tabs">
				<ul class="nav nav-pills margin-bottom" role="tablist">
					<li role="presentation" id="liGeneral" runat="server" class="nav-item active"><a
							aria-controls='tabSettings' role='tab' data-toggle='tab' href="#tabSettings"
							class="nav-link active">
							<asp:Literal ID="litSettingsTab" runat="server" EnableViewState="false" /></a></li>
					<li role="presentation" id="liSecurity" runat="server" enableviewstate="false" class="nav-item">
						<asp:Literal ID="litSecurityTabLink" runat="server" EnableViewState="false" />
					</li>
					<li role="presentation" class="nav-item"><a aria-controls='tabSEO' role='tab' data-toggle='tab'
							href="#tabSEO" class="nav-link">
							<asp:Literal ID="litSEOTab" runat="server" EnableViewState="false" /></a></li>
					<li role="presentation" class="nav-item"><a aria-controls='tabCompanyInfo' role='tab'
							data-toggle='tab' href="#tabCompanyInfo" class="nav-link">
							<asp:Literal ID="litCompanyInfoTab" runat="server" EnableViewState="false" /></a></li>
					<li role="presentation" id="liHosts" runat="server" visible="false" enableviewstate="false"
						class="nav-item">
						<asp:Literal ID="litHostsTabLink" runat="server" EnableViewState="false" />
					</li>
					<li role="presentation" id="liFolderNames" runat="server" visible="false" enableviewstate="false"
						class="nav-item">
						<asp:Literal ID="litFolderNamesTabLink" runat="server" EnableViewState="false" />
					</li>
					<li role="presentation" id="liFeatures" runat="server" visible="false" enableviewstate="false"
						class="nav-item">
						<asp:Literal ID="litFeaturesTabLink" runat="server" EnableViewState="false" />
					</li>
					<li role="presentation" id="liWebParts" runat="server" visible="false" enableviewstate="false"
						class="nav-item">
						<asp:Literal ID="litWebPartsTabLink" runat="server" EnableViewState="false" />
					</li>
					<li role="presentation" visible="false" runat="server" class="nav-item"><a
							aria-controls='tabApiKeys' role='tab' data-toggle='tab' href="#tabApiKeys" class="nav-link">
							<asp:Literal ID="litAPIKeysTab" runat="server" EnableViewState="false" /></a></li>
					<li role="presentation" id="liMailSettings" runat="server" enableviewstate="false" class="nav-item">
						<asp:Literal ID="litMailSettingsTabLink" runat="server" EnableViewState="false" />
					</li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in show" id="tabSettings">
						<div class="form-horizontal">
							<div class="row">
								<div id="divSiteId" runat="server" class="settingrow form-group" visible="false">
									<gb:SiteLabel ID="lblSiteIdLabel" runat="server"
										CssClass="settinglabel control-label" ConfigKey="SiteSettingsSiteIDLabel"
										EnableViewState="false" />
									<div class="">
										<p class="form-control-static">
											<asp:Label ID="lblSiteId" runat="server" />/
											<asp:Label ID="lblSiteGuid" runat="server" />
										</p>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblSiteTitle" ForControl="txtSiteName" runat="server"
											CssClass="settinglabel control-label" ConfigKey="SiteSettingsSiteTitleLabel"
											ShowRequired="true" EnableViewState="false" />
										<div class="">
											<asp:TextBox ID="txtSiteName" TabIndex="10" runat="server"
												CssClass="form-control" />
											<asp:RequiredFieldValidator ID="reqSiteTitle" runat="server"
												Display="Dynamic" ControlToValidate="txtSiteName"
												ValidationGroup="sitesettings" SetFocusOnError="true" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divTimeZone" runat="server" visible="false" class="settingrow form-group">
										<gb:SiteLabel ID="lblTimeZone" runat="server"
											CssClass="settinglabel control-label" ConfigKey="TimeZone" />
										<div class="">
											<portal:TimeZoneIdSetting ID="timeZone" runat="server" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblSkin" ForControl="ddSkins" runat="server"
											CssClass="settinglabel control-label" ConfigKey="SiteSettingsSiteSkinLabel"
											EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<portal:SkinList ID="SkinSetting" runat="server" />
												<portal:gbHelpLink ID="gbHelpLink2" runat="server"
													HelpKey="sitesettingssiteskinhelp" />
											</div>
											<asp:Button ID="btnRestoreSkins" SkinID="DefaultButton" runat="server"
												Visible="false" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group mobilesetting">
										<gb:SiteLabel ID="lblMobileSkin" runat="server" ForControl="ddMobileSkin"
											CssClass="settinglabel control-label" ConfigKey="MobileSkin" />
										<div class="">
											<div class="input-group">
												<asp:DropDownList ID="ddMobileSkin" runat="server" DataValueField="Name"
													DataTextField="Name" CssClass="form-control" TabIndex="10">
												</asp:DropDownList>
												<portal:gbHelpLink ID="gbHelpLink96" runat="server"
													HelpKey="mobile-skin-help" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 d-none">
									<div id="divFriendlyUrlPattern" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="lblDefaultFriendlyUrlPatten" runat="server"
											ForControl="ddDefaultFriendlyUrlPattern"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsDefaultFriendlyUrlPatternLabel"
											EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<asp:DropDownList ID="ddDefaultFriendlyUrlPattern" runat="server"
													TabIndex="10" CssClass="form-control">
													<asp:ListItem Value="PageNameWithDotASPX"
														Text="<%$ Resources:Resource, UrlFormatAspx %>"></asp:ListItem>
													<asp:ListItem Value="PageName"
														Text="<%$ Resources:Resource, UrlFormatExtensionless %>">
													</asp:ListItem>
												</asp:DropDownList>
												<portal:gbHelpLink ID="gbHelpLink4" runat="server"
													HelpKey="sitesettingsdefaultfriendlyurlpatternhelp" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel29" runat="server" ForControl="ddEditorProviders"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsEditorProviderLabel" EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<asp:DropDownList ID="ddEditorProviders" DataTextField="name"
													DataValueField="name" EnableViewState="true" TabIndex="10"
													runat="server" CssClass="form-control">
												</asp:DropDownList>
												<portal:gbHelpLink ID="gbHelpLink7" runat="server"
													HelpKey="sitesettingssiteeditorproviderhelp" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divMyPageSkin" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel45" runat="server"
											CssClass="settinglabel control-label" ConfigKey="MyPageSkinLabel" />
										<div class="">
											<div class="input-group">
												<asp:DropDownList ID="ddMyPageSkin" runat="server" DataValueField="Name"
													DataTextField="Name" CssClass="form-control" TabIndex="10">
												</asp:DropDownList>
												<portal:gbHelpLink ID="gbHelpLink13" runat="server"
													HelpKey="mypageskinhelp" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group" id="divPreferredHostName" runat="server">
										<gb:SiteLabel ID="SiteLabel24" runat="server" ForControl="txtPreferredHostName"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsPreferredHostNameLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtPreferredHostName" TabIndex="10" MaxLength="100"
													CssClass="form-control" runat="server" />
												<portal:gbHelpLink ID="gbHelpLink17" runat="server"
													HelpKey="sitesettingspreferredhostnamehelp" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group" visible="false" runat="server">
										<gb:SiteLabel ID="SiteLabel53" runat="server" ForControl="txtPrivacyPolicyUrl"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsPrivacyUrlLabel" EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<div class="input-group-addon">
													<asp:Label ID="lblPrivacySiteRoot" runat="server" />
												</div>
												<asp:TextBox ID="txtPrivacyPolicyUrl" TabIndex="10" MaxLength="100"
													CssClass="form-control" runat="server" />
												<portal:gbHelpLink ID="gbHelpLink62" runat="server"
													HelpKey="sitesettingsprivacyhelp" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group" visible="false" runat="server">
										<gb:SiteLabel ID="SiteLabel56" runat="server" ForControl="txtOpenSearchName"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsOpenSearchNameLabel" EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtOpenSearchName" TabIndex="10" MaxLength="100"
													CssClass="form-control" runat="server" />
												<portal:gbHelpLink ID="gbHelpLink65" runat="server"
													HelpKey="sitesettings-opensearchname-help" />
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group" visible="false" runat="server">
										<gb:SiteLabel ID="SiteLabel79" runat="server" ForControl="txtMetaProfile"
											CssClass="settinglabel control-label" ConfigKey="MetaProfileLabel"
											EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaProfile" TabIndex="10" CssClass="form-control"
													runat="server" />
												<portal:gbHelpLink ID="gbHelpLink50" runat="server"
													HelpKey="meta-profile-help" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="settingrow form-group" visible="false" runat="server">
								<gb:SiteLabel ID="lblAvatarSystem" runat="server" ForControl="ddAvatarSystem"
									CssClass="settinglabel control-label" ConfigKey="AvatarSystemLabel"
									EnableViewState="false" />
								<div class="">
									<div class="input-group">
										<asp:DropDownList ID="ddAvatarSystem" DataTextField="name" DataValueField="name"
											EnableViewState="true" TabIndex="10" runat="server" CssClass="form-control">
											<asp:ListItem Value="none" Text="<%$ Resources:Resource, AvatarTypeNone %>">
											</asp:ListItem>
											<asp:ListItem Value="internal"
												Text="<%$ Resources:Resource, AvatarTypeInternal %>"></asp:ListItem>
											<asp:ListItem Value="gravatar"
												Text="<%$ Resources:Resource, AvatarTypeGravatar %>"></asp:ListItem>
										</asp:DropDownList>
										<portal:gbHelpLink ID="gbHelpLink8" runat="server"
											HelpKey="avatarsystem-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group" visible="false" runat="server">
								<gb:SiteLabel ID="lblAllowUserSkins" runat="server" ForControl="chkAllowUserSkins"
									CssClass="settinglabel control-label" ConfigKey="AllowUserEditorLabel"
									EnableViewState="false" />
								<div class="">
									<asp:CheckBox ID="chkAllowUserEditorChoice" runat="server" TabIndex="10" />
									<portal:gbHelpLink ID="gbHelpLink80" runat="server" RenderWrapper="false"
										HelpKey="sitesetting-user-editor-help" />
								</div>
							</div>
							<div id="divAllowUserSkins" visible="false" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel2" runat="server" ForControl="chkAllowUserSkins"
									CssClass="settinglabel control-label" ConfigKey="SiteSettingsAllowUserSkinsLabel"
									EnableViewState="false" />
								<div class="">
									<asp:CheckBox ID="chkAllowUserSkins" runat="server" TabIndex="10" />
									<portal:gbHelpLink ID="gbHelpLink9" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsuserskinhelp" />
								</div>
							</div>
							<div id="divAllowPageSkins" visible="false" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel2x" runat="server" ForControl="chkAllowPageSkins"
									CssClass="settinglabel control-label" ConfigKey="SiteSettingsAllowPageSkinsLabel"
									EnableViewState="false" />
								<div class="">
									<asp:CheckBox ID="chkAllowPageSkins" runat="server" TabIndex="10" />
									<portal:gbHelpLink ID="gbHelpLink10" runat="server" RenderWrapper="false"
										HelpKey="sitesettingspageskinhelp" />
								</div>
							</div>
							<div id="divAllowHideMenu" visible="false" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel2y" runat="server" ForControl="chkAllowHideMenuOnPages"
									CssClass="settinglabel control-label"
									ConfigKey="SiteSettingsAllowHideMainMenuLabel" />
								<div class="">
									<asp:CheckBox ID="chkAllowHideMenuOnPages" runat="server" TabIndex="10" />
									<portal:gbHelpLink ID="gbHelpLink11" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsallowhidemenuhelp" />
								</div>
							</div>
							<div id="divMyPage" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel20" ForControl="chkEnableMyPageFeature" runat="server"
									CssClass="settinglabel control-label"
									ConfigKey="SiteSettingsEnableMyPageFeatureLabel" EnableViewState="false" />
								<div class="">
									<asp:CheckBox ID="chkEnableMyPageFeature" runat="server" TabIndex="10" />
									<portal:gbHelpLink ID="gbHelpLink12" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsmypagehelp" />
								</div>
							</div>
							<div id="divSSL" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel3" runat="server" ForControl="chkRequireSSL"
									CssClass="settinglabel control-label" ConfigKey="SiteSettingsRequireSSLLabel" />
								<div class="">
									<asp:CheckBox ID="chkRequireSSL" runat="server" TabIndex="10" />
									<portal:gbHelpLink ID="gbHelpLink14" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsrequiresslhelp" />
								</div>
							</div>
							<div id="divReallyDeleteUsers" runat="server" class="settingrow form-group">
								<asp:CheckBox ID="chkReallyDeleteUsers" runat="server" TabIndex="10" />
								<gb:SiteLabel ID="SitelabelReallyDeleteUsers" runat="server"
									ForControl="chkReallyDeleteUsers" CssClass="settinglabel control-label"
									ConfigKey="SiteSettingsReallyDeleteUsersLabel" />
								<div class="text-muted font-italic">
									<gb:SiteLabel ID="SitelabelReallyDeleteUsersExplain" UseLabelTag="false"
										runat="server" ConfigKey="SiteSettingsReallyDeleteUsersExplainLabel" />
									<portal:gbHelpLink ID="gbHelpLink15" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsreallydeleteusershelp" />
								</div>
							</div>
							<div id="divContentVersioning" visible="false" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel48" runat="server" ForControl="chkForceContentVersioning"
									CssClass="settinglabel control-label" ConfigKey="ForceContentVersioning" />
								<div class="">
									<asp:CheckBox ID="chkForceContentVersioning" runat="server" TabIndex="10" />
									<gb:SiteLabel ID="Sitelabel49" UseLabelTag="false" runat="server" />
									<portal:gbHelpLink ID="gbHelpLink16" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsforcecontentversioninghelp" />
								</div>
							</div>
							<div id="divApprovalsWorkflow" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="Sitelabel59" runat="server" ForControl="chkEnableContentWorkflow"
									CssClass="settinglabel control-label" ConfigKey="EnableContentWorkflow" />
								<div class="">
									<asp:CheckBox ID="chkEnableContentWorkflow" runat="server" TabIndex="10" />
									<gb:SiteLabel ID="Sitelabel57" UseLabelTag="false" runat="server" />
									<portal:gbHelpLink ID="gbHelpLink67" runat="server" RenderWrapper="false"
										HelpKey="sitesettingsenablecontentworkflowhelp" />
								</div>
							</div>




						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabSecurity" runat="server">
						<div id="divSecurityTabs" class="tabs">
							<ul class="nav nav-pills margin-bottom" role="tablist">
								<li class="nav-item" id="liGeneralSecurity" runat="server" enableviewstate="false">
									<asp:Literal ID="litGeneralSecurityTabLink" runat="server"
										EnableViewState="false" />
								</li>
								<li class="nav-item" id="liLDAP" visible="false" runat="server" enableviewstate="false">
									<asp:Literal ID="litLDAPTabLink" runat="server" EnableViewState="false" />
								</li>
								<li class="nav-item" id="liOpenID" visible="false" runat="server"
									enableviewstate="false">
									<asp:Literal ID="litOpenIDTabLink" runat="server" EnableViewState="false" />
								</li>
								<li class="nav-item" id="liWindowsLive" visible="false" runat="server"
									enableviewstate="false">
									<asp:Literal ID="litWindowsLiveTabLink" runat="server" EnableViewState="false" />
								</li>
								<li class="nav-item" id="liCaptcha" visible="false" runat="server"><a
										href="#tabAntiSpam">
										<asp:Literal ID="litAntiSpamTab" runat="server" EnableViewState="false" /></a>
								</li>
							</ul>
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade active in show" id="tabGeneralSecurity"
									runat="server">
									<asp:Panel ID="pnlUserSecurity" runat="server" CssClass="form-horizontal">
										<div id="divSiteIsClosed" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkSiteIsClosed" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="Sitelabel102" runat="server"
													ForControl="chkAllowRegistration"
													CssClass="settinglabel control-label" ConfigKey="SiteIsClosed" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink97" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettings-siteisclosed-help" />
												</div>
											</div>
											<div class="">
												<asp:HyperLink ID="lnkEditClosedMessage"
													CssClass="cp-link btn btn-default" runat="server" />
											</div>
										</div>
										<div id="divAllowRegistration" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkAllowRegistration" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="Sitelabel1" runat="server"
													ForControl="chkAllowRegistration"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsAllowRegistrationLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink18" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsallowregistrationhelp" />
												</div>
											</div>
										</div>
										<div id="divUseEmailForLogin" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkUseEmailForLogin" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="Sitelabelemailforlogin" runat="server"
													ForControl="chkUseEmailForLogin"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsUseEmailForLoginLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink19" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsuseemailforloginhelp" />
												</div>
											</div>
										</div>
										<div id="divAllowPersistentLogin" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkAllowPersistentLogin" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="Sitelabel103" runat="server"
													ForControl="chkAllowPersistentLogin"
													CssClass="settinglabel control-label"
													ConfigKey="AllowPersistentLogin" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink98" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettings-AllowPersistentLogin-help" />
												</div>
											</div>
										</div>
										<div id="div3" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkRequireEmailTwice" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="Sitelabel92" runat="server"
													ForControl="chkRequireEmailTwice"
													CssClass="settinglabel control-label"
													ConfigKey="RequireEmailTwiceOnRegistration" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink87" runat="server"
														RenderWrapper="false" HelpKey="RequireEmailTwice-help" />
												</div>
											</div>
										</div>
										<div id="divSecureRegistration" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkSecureRegistration" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="lblSecureRegistration" runat="server"
													ForControl="chkSecureRegistration"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsSecureRegistrationLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink20" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingssecureregistrationhelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkRequireApprovalForLogin" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="SiteLabel96" runat="server"
													ForControl="chkRequireApprovalForLogin"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsRequireApprovalForLogin" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink91" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettings-requireapprovalforlogin-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel97" runat="server"
												ForControl="txtEmailAdressesForUserApprovalNotification"
												CssClass="settinglabel control-label"
												ConfigKey="EmailAddressesForUserApprovalNotification" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtEmailAdressesForUserApprovalNotification"
														TabIndex="10" CssClass="form-control" runat="server" />
													<portal:gbHelpLink ID="gbHelpLink92" runat="server"
														HelpKey="sitesettings-EmailAdressesForUserApprovalNotification-help" />
												</div>
											</div>
										</div>
										<div id="divAllowUserToChangeName" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkAllowUserToChangeName" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="SitelabelAllowUserToChangeName" runat="server"
													ForControl="chkAllowUserToChangeName"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsAllowUsersToChangeNameLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink21" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsallowusernamechangehelp" />
												</div>
											</div>
										</div>
										<div id="divDisableDbAuthentication" runat="server"
											class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkDisableDbAuthentication" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="Sitelabel76" runat="server"
													ForControl="chkDisableDbAuthentication"
													CssClass="settinglabel control-label"
													ConfigKey="DisableDbAuthentication" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink76" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettings-DisableDbAuthentication-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblPasswordFormat" runat="server"
												ForControl="ddPasswordFormat" CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsPasswordFormatLabel" />
											<div class="">
												<div class="input-group">
													<asp:DropDownList ID="ddPasswordFormat" runat="server" TabIndex="10"
														CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink22" runat="server"
														HelpKey="sitesettingspasswordformathelp" />
												</div>
											</div>
										</div>
										<div id="divPasswordRecovery" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkAllowPasswordRetrieval" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="lbl1" runat="server"
													ForControl="chkAllowPasswordRetrieval"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsAllowPasswordRetrievalLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink23" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsallowpasswordretrievalhelp" />
												</div>
											</div>
										</div>
										<div id="divAllowPasswordReset" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkAllowPasswordReset" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="SiteLabel12" runat="server"
													ForControl="chkAllowPasswordReset"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsAllowPasswordResetLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink25" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsallowpasswordresethelp" />
												</div>
											</div>
										</div>
										<div id="divForcePasswordChangeOnRecovery" runat="server"
											class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkRequirePasswordChangeAfterRecovery" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="SiteLabel95" runat="server"
													ForControl="chkRequirePasswordChangeAfterRecovery"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsRequirePasswordChangeOnRevovery" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink90" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettings-requirepasswordchangeafterrecovery-help" />
												</div>
											</div>
										</div>
										<div runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkRequiresQuestionAndAnswer" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="Sitelabel16" runat="server"
													ForControl="chkRequiresQuestionAndAnswer"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsRequiresQuestionAndAnswerLabel" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink24" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsrequirequestionandanswerhelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblPasswordExpiryInDays" runat="server"
												ForControl="txtPasswordExpiryInDays"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsPasswordExpiryInDaysLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtPasswordExpiryInDays" TabIndex="10"
														MaxLength="3" Columns="10" CssClass="form-control"
														runat="server" />
													<portal:gbHelpLink ID="gbHelpLink3" runat="server"
														HelpKey="sitesettingspasswordexpiryindayshelp" />
												</div>
												<asp:RegularExpressionValidator ID="regexPasswordExpiryInDays"
													runat="server" ControlToValidate="txtPasswordExpiryInDays"
													ValidationGroup="sitesettings" Display="Dynamic"
													ValidationExpression="^-{0,1}\d+$"></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblMaxInvalidPasswordAttempts" runat="server"
												ForControl="txtMaxInvalidPasswordAttempts"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsMaxInvalidPasswordAttemptsLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtMaxInvalidPasswordAttempts" TabIndex="10"
														MaxLength="2" Columns="10" CssClass="form-control"
														runat="server" />
													<portal:gbHelpLink ID="gbHelpLink26" runat="server"
														HelpKey="sitesettingsmaxincalidpasswordhelp" />
												</div>
												<asp:RegularExpressionValidator ID="regexMaxInvalidPasswordAttempts"
													runat="server" ControlToValidate="txtMaxInvalidPasswordAttempts"
													ValidationGroup="sitesettings" Display="Dynamic"
													ValidationExpression="^-{0,1}\d+$"></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel18" runat="server"
												ForControl="txtPasswordAttemptWindowMinutes"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsPasswordAttemptWindowMinutesLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtPasswordAttemptWindowMinutes" TabIndex="10"
														MaxLength="2" Columns="10" CssClass="form-control"
														runat="server" />
													<portal:gbHelpLink ID="gbHelpLink27" runat="server"
														HelpKey="sitesettingspasswordattemptwindowhelp" />
												</div>
												<asp:RegularExpressionValidator ID="regexPasswordAttemptWindow"
													runat="server" ControlToValidate="txtPasswordAttemptWindowMinutes"
													ValidationGroup="sitesettings" Display="Dynamic"
													ValidationExpression="^-{0,1}\d+$"></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel13" runat="server"
												ForControl="txtMinimumPasswordLength"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsMinimumPasswordLengthLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtMinimumPasswordLength" TabIndex="10"
														MaxLength="2" Columns="10" CssClass="form-control"
														runat="server" Text="7" />
													<portal:gbHelpLink ID="gbHelpLink28" runat="server"
														HelpKey="sitesettingspasswordlengthhelp" />
												</div>
												<asp:RegularExpressionValidator ID="regexMinPasswordLength"
													runat="server" ControlToValidate="txtMinimumPasswordLength"
													ValidationGroup="sitesettings" Display="Dynamic"
													ValidationExpression="^-{0,1}\d+$"></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel14" runat="server"
												ForControl="txtMinRequiredNonAlphaNumericCharacters"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsMinRequiredNonAlphaNumericCharactersLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtMinRequiredNonAlphaNumericCharacters"
														TabIndex="10" MaxLength="2" CssClass="form-control" Columns="10"
														runat="server" Text="0" />
													<portal:gbHelpLink ID="gbHelpLink29" runat="server"
														HelpKey="sitesettingspasswordnonalphacharactershelp" />
												</div>
												<asp:RegularExpressionValidator ID="regexPasswordMinNonAlphaNumeric"
													runat="server"
													ControlToValidate="txtMinRequiredNonAlphaNumericCharacters"
													ValidationGroup="sitesettings" Display="Dynamic"
													ValidationExpression="^-{0,1}\d+$"></asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkShowPasswordStrength" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="SiteLabel90" runat="server"
													ForControl="chkShowPasswordStrength"
													CssClass="settinglabel control-label"
													ConfigKey="ShowPasswordStrengthOnRegistrationPage" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink85" runat="server"
														RenderWrapper="false"
														HelpKey="ShowPasswordStrengthOnRegistrationPage-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblPasswordStrengthRegularExpression" runat="server"
												ForControl="txtPasswordStrengthRegularExpression"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsPasswordStrengthExpressionLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtPasswordStrengthRegularExpression" TabIndex="10"
														TextMode="MultiLine" SkinID="regex" Rows="3" runat="server"
														CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink30" runat="server"
														HelpKey="sitesettingspasswordstrengthhelp" />
												</div>
											</div>
										</div>
										<%--<div class="settingrow form-group">
                                        <gb:SiteLabel ID="SiteLabel94" runat="server" ForControl="txtPasswordStrengthErrorMessage"
                                            CssClass="settinglabel control-label" ConfigKey="SiteSettingsPasswordStrengthErrorMessage" />
                                        <div class="">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtPasswordStrengthErrorMessage" TabIndex="10" runat="server" CssClass="form-control" />
                                                <portal:gbHelpLink ID="gbHelpLink89" runat="server" HelpKey="sitesettingspasswordstrength-errormessage-help" />
                                            </div>
                                        </div>
                                    </div>--%>
										<div class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkRequireCaptcha" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="SiteLabel91" runat="server"
													ForControl="chkRequireCaptcha" CssClass="settinglabel control-label"
													ConfigKey="RequireCaptchaOnRegistrationPage" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink86" runat="server"
														RenderWrapper="false"
														HelpKey="RequireCaptchaOnRegistrationPage-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkRequireCaptchaOnLogin" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="SiteLabel93" runat="server"
													ForControl="chkRequireCaptchaOnLogin"
													CssClass="settinglabel control-label"
													ConfigKey="RequireCaptchaOnLoginPage" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink88" runat="server"
														RenderWrapper="false"
														HelpKey="RequireCaptchaOnLoginPage-help" />
												</div>
											</div>
										</div>
									</asp:Panel>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="tabLDAP" visible="false" runat="server">
									<asp:Panel ID="pnlLdapSettings" runat="server" CssClass="form-horizontal">
										<div id="divUseLdap" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkUseLdapAuth" runat="server" TabIndex="10" />
												<gb:SiteLabel ID="lblUseLdapAuth" ForControl="chkUseLdapAuth"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsUseLdapAuth" runat="server" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink31" runat="server"
														RenderWrapper="false" HelpKey="sitesettingsuseldaphelp" />
												</div>
											</div>
										</div>
										<div id="divLdapTestPassword" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="Sitelabel9" ForControl="txtLdapTestPassword"
												ConfigKey="SiteSettingsLdapTestPassword"
												CssClass="settinglabel control-label" runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtLdapTestPassword" Columns="55" TabIndex="10"
														runat="server" TextMode="password" CssClass="form-control"
														MaxLength="255" />
													<portal:gbHelpLink ID="gbHelpLink32" runat="server"
														HelpKey="sitesettingsldappasswordhelp" />
												</div>
											</div>
										</div>
										<div id="divAutoCreateLdapUsers" runat="server" class="settingrow form-group">
											<div class="input-group">
												<asp:CheckBox ID="chkAutoCreateLdapUserOnFirstLogin" runat="server"
													TabIndex="10" />
												<gb:SiteLabel ID="lblAutoCreateLdapUser"
													ForControl="chkAutoCreateLdapUserOnFirstLogin"
													CssClass="settinglabel control-label"
													ConfigKey="SiteSettingsAutoCreateLdapUserOnFirstLoginLabel"
													runat="server" />
												<div class="ml-5">
													<portal:gbHelpLink ID="gbHelpLink33" runat="server"
														RenderWrapper="false"
														HelpKey="sitesettingsautocreateldapuserhelp" />
												</div>
											</div>
										</div>
										<div id="divLdapServer" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="lblLdapServer" ForControl="txtLdapServer"
												CssClass="settinglabel control-label" ConfigKey="SiteSettingsLdapServer"
												runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtLdapServer" Columns="55" runat="server"
														TabIndex="10" MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink34" runat="server"
														HelpKey="sitesettingsldapserverhelp" />
												</div>
											</div>
										</div>
										<div id="divLdapPort" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="lblLdapPort" ForControl="txtLdapPort"
												CssClass="settinglabel control-label" ConfigKey="SiteSettingsLdapPort"
												runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtLdapPort" Columns="55" runat="server"
														TabIndex="10" MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink35" runat="server"
														HelpKey="sitesettingsldapporthelp" />
												</div>
											</div>
										</div>
										<div id="divLdapDomain" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="Sitelabel26" ForControl="txtLdapDomain"
												CssClass="settinglabel control-label" ConfigKey="SiteSettingsLdapDomain"
												runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtLdapDomain" Columns="55" runat="server"
														TabIndex="10" MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink36" runat="server"
														HelpKey="sitesettingsldapdomainhelp" />
												</div>
											</div>
										</div>
										<div id="divLdapRootDn" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="lblLdapRootDN" ForControl="txtLdapRootDN"
												CssClass="settinglabel control-label" ConfigKey="SiteSettingsLdapRootDN"
												runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtLdapRootDN" Columns="55" runat="server"
														TabIndex="10" MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink37" runat="server"
														HelpKey="sitesettingsldaprootdnhelp" />
												</div>
											</div>
										</div>
										<div id="divLdapUserDNKey" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="Sitelabel8" ForControl="ddLdapUserDNKey"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsLdapUserDNKey" runat="server" />
											<div class="">
												<div class="input-group">
													<asp:DropDownList ID="ddLdapUserDNKey" runat="server" TabIndex="10"
														CssClass="form-control">
														<asp:ListItem Value="uid">uid (OpenLDAP)</asp:ListItem>
														<asp:ListItem Value="CN">CN (Active Directory)</asp:ListItem>
													</asp:DropDownList>
													<portal:gbHelpLink ID="gbHelpLink38" runat="server"
														HelpKey="sitesettingsldapuserdnkeyhelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel72" ForControl="chkAllowDbFallbackWithLdap"
												CssClass="settinglabel control-label"
												ConfigKey="AllowDbFallbackWithLdap" runat="server" />
											<div class="">
												<asp:CheckBox ID="chkAllowDbFallbackWithLdap" runat="server"
													TabIndex="10" />
												<portal:gbHelpLink ID="gbHelpLink1" runat="server" RenderWrapper="false"
													HelpKey="sitesetting-AllowDbFallbackWithLdap-help" />
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblAllowEmailLoginWithLdapDbFallback"
												ForControl="chkAllowEmailLoginWithLdapDbFallback"
												CssClass="settinglabel control-label"
												ConfigKey="AllowEmailLoginWithLdapDbFallback" runat="server">
											</gb:SiteLabel>
											<div class="">
												<asp:CheckBox ID="chkAllowEmailLoginWithLdapDbFallback" runat="server"
													TabIndex="10" />
												<portal:gbHelpLink ID="gbHelpLink66" runat="server"
													RenderWrapper="false"
													HelpKey="sitesetting-AllowEmailLoginWithLdapDbFallback-help" />
											</div>
										</div>
									</asp:Panel>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="tabOpenID" visible="false"
									runat="server">
									<div class="form-horizontal">
										<div id="divOpenID" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="Sitelabel31" runat="server"
												ForControl="chkAllowOpenIDAuth" CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsAllowOpenIDAuthenticationLabel" />
											<div class="">
												<asp:CheckBox ID="chkAllowOpenIDAuth" runat="server" TabIndex="10" />
												<portal:gbHelpLink ID="gbHelpLink39" runat="server"
													RenderWrapper="false" HelpKey="sitesettingsopenidhelp" />
											</div>
										</div>
										<div id="divOpenIDSelector" runat="server" visible="false"
											class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel27" ForControl="txtOpenIdSelectorCode"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsOpenIdSelectorLabel" runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtOpenIdSelectorCode" Columns="55" runat="server"
														TabIndex="10" MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink40" runat="server"
														HelpKey="sitesettingsopenidselectorhelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel54" ForControl="txtRpxNowApiKey"
												CssClass="settinglabel control-label" ConfigKey="RpxNowApiKeyLabel"
												runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtRpxNowApiKey" Columns="55" runat="server"
														MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink63" runat="server"
														HelpKey="rpxnow-apikey-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblRpxNowApplicationName"
												ForControl="txtRpxNowApplicationName"
												CssClass="settinglabel control-label"
												ConfigKey="RpxNowApplicationNameLabel" runat="server" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtRpxNowApplicationName" Columns="55"
														runat="server" MaxLength="255" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink64" runat="server"
														HelpKey="rpxnow-applicationname-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<div class="col-sm-offset-3 ">
												<asp:HyperLink ID="lnkRpxAdmin" runat="server" Visible="false" />
												<asp:Button SkinID="DefaultButton" ID="btnSetupRpx" runat="server" />
											</div>
										</div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="tabWindowsLiveID" visible="false"
									runat="server">
									<div class="form-horizontal">
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblAllowWindowsLiveAuth" runat="server"
												ForControl="chkAllowWindowsLiveAuth"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsAllowWindowsLiveAuthLabel" />
											<div class="">
												<div class="input-group">
													<asp:CheckBox ID="chkAllowWindowsLiveAuth" runat="server"
														TabIndex="10" />
													<portal:gbHelpLink ID="gbHelpLink41" runat="server"
														RenderWrapper="false" HelpKey="sitesettingswindowslivehelp" />
												</div>
											</div>
										</div>
										<div id="divLiveMessenger" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="Sitelabel50" runat="server"
												ForControl="chkAllowWindowsLiveMessengerForMembers"
												CssClass="settinglabel control-label"
												ConfigKey="AllowLiveMessengerOnProfilesLabel" />
											<div class="">
												<div class="input-group">
													<asp:CheckBox ID="chkAllowWindowsLiveMessengerForMembers"
														runat="server" TabIndex="10" />
													<portal:gbHelpLink ID="gbHelpLink42" runat="server"
														RenderWrapper="false" HelpKey="livemessenger-admin-help" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel33" runat="server"
												ForControl="txtWindowsLiveAppID" CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsWindowsLiveAppIDLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtWindowsLiveAppID" TabIndex="10" MaxLength="100"
														Columns="45" CssClass="form-control" runat="server" />
													<portal:gbHelpLink ID="gbHelpLink43" runat="server"
														HelpKey="sitesettingswindowslivehelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel34" runat="server" ForControl="txtWindowsLiveKey"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsWindowsLiveKeyLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtWindowsLiveKey" TabIndex="10" MaxLength="100"
														Columns="45" runat="server" CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink44" runat="server"
														HelpKey="sitesettingswindowslivehelp" />
												</div>
												<asp:RegularExpressionValidator ID="regexWinLiveSecret" runat="server"
													ControlToValidate="txtWindowsLiveKey" ValidationGroup="sitesettings"
													Display="Dynamic" ValidationExpression=".{16}.*">
												</asp:RegularExpressionValidator>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel51" runat="server"
												ForControl="txtAppLogoForWindowsLive"
												CssClass="settinglabel control-label"
												ConfigKey="WindowsLiveAppLogoLabel" />
											<div class="">
												<div class="input-group">
													<div class="input-group-addon">
														<asp:Label ID="lblSiteRoot" runat="server" />
													</div>
													<asp:TextBox ID="txtAppLogoForWindowsLive" TabIndex="10"
														MaxLength="100" Columns="45" runat="server"
														CssClass="form-control" />
													<portal:gbHelpLink ID="gbHelpLink45" runat="server"
														HelpKey="windowslive-applogo-help" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="tabAntiSpam" visible="false"
									runat="server">
									<div class="form-horizontal">
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel6" runat="server" ForControl="ddCaptchaProviders"
												CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsCaptchaProviderLabel" />
											<div class="">
												<div class="input-group">
													<asp:DropDownList ID="ddCaptchaProviders" DataTextField="name"
														DataValueField="name" EnableViewState="true" TabIndex="10"
														runat="server" CssClass="form-control">
													</asp:DropDownList>
													<portal:gbHelpLink ID="gbHelpLink46" runat="server"
														HelpKey="sitesettingscaptchaproviderhelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel7" runat="server"
												ForControl="txtRecaptchPrivateKey" CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsSiteRecaptchaPrivateKeyLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtRecaptchaPrivateKey" TabIndex="10"
														MaxLength="100" Columns="45" CssClass="form-control"
														runat="server" />
													<portal:gbHelpLink ID="gbHelpLink47" runat="server"
														HelpKey="sitesettingsrecaptchahelp" />
												</div>
											</div>
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel30" runat="server"
												ForControl="txtRecaptchaPublicKey" CssClass="settinglabel control-label"
												ConfigKey="SiteSettingsSiteRecaptchaPublicKeyLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtRecaptchaPublicKey" TabIndex="10"
														MaxLength="100" Columns="45" CssClass="form-control"
														runat="server" />
													<portal:gbHelpLink ID="gbHelpLink48" runat="server"
														HelpKey="sitesettingsrecaptchahelp" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabSEO">
						<asp:UpdatePanel ID="up" runat="server">
							<ContentTemplate>
								<telerik:RadTabStrip ID="tabLanguage" OnTabClick="tabLanguage_TabClick"
									EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false" CssClass="subtabs"
									SkinID="SubTabs" Visible="false" SelectedIndex="0" runat="server" />
								<div class="form-horizontal">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblMetaTitle" runat="server" ForControl="txtMetaTitle"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsMetaTitleLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaTitle" runat="server" MaxLength="65"
													CssClass="form-control" />
												<portal:gbHelpLink ID="GbHelpLink49" runat="server"
													HelpKey="sitesettings-metatitle-help" />
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblMetaDescription" runat="server"
											ForControl="txtMetaDescription" CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsMetaDescriptionLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaDescription" runat="server" MaxLength="156"
													CssClass="form-control" />
												<portal:gbHelpLink ID="GbHelpLink61" runat="server"
													HelpKey="sitesettings-metadescription-help" />
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblMetaKeywords" runat="server" ForControl="txtMetaKeywords"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsMetaKeyWordsLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaKeywords" runat="server" MaxLength="156"
													CssClass="form-control" />
												<portal:gbHelpLink ID="GbHelpLink57" runat="server"
													HelpKey="sitesettings-metakeywords-help" />
											</div>
										</div>
									</div>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblMetaAdditional" CssClass="settinglabel control-label"
											ForControl="txtMetaAdditional" runat="server"
											ConfigKey="SiteSettingsMetaAdditionalLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtMetaAdditional" runat="server" TextMode="MultiLine"
													CssClass="form-control" />
												<portal:gbHelpLink ID="gbHelpLink69" runat="server"
													HelpKey="sitesettings-additionalmeta-help" />
											</div>
										</div>
									</div>
									<div id="divGAnalytics" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel25" runat="server" ForControl="txtGoogleAnayticsCode"
											CssClass="settinglabel control-label"
											ConfigKey="GoogleAnalyticsAccountLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtGoogleAnayticsCode" TextMode="MultiLine"
													Columns="45" runat="server" CssClass="form-control" />
												<portal:gbHelpLink ID="gbHelpLink70" runat="server"
													HelpKey="sitesettings-googleanayticscode-help" />
											</div>
										</div>
									</div>
								</div>
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabCompanyInfo">
						<div class="form-horizontal">
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel47" runat="server" ForControl="txtCompanyName"
									CssClass="settinglabel control-label" ConfigKey="SiteSettingsCompanyNameLabel"
									EnableViewState="false" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtCompanyName" runat="server" TabIndex="10" MaxLength="100"
											CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink5" runat="server"
											HelpKey="sitesettingscompanynamehelp" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel42" runat="server" ForControl="txtStreetAddress"
									CssClass="settinglabel control-label" ConfigKey="StreetAddress"
									EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtStreetAddress" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div id="divStreetAddress2" runat="server" visible="false" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel77" runat="server" ForControl="txtStreetAddress2"
									CssClass="settinglabel control-label" ConfigKey="StreetAddress2"
									EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtStreetAddress2" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div id="divLocality" runat="server" visible="false" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel43" runat="server" ForControl="txtLocality"
									CssClass="settinglabel control-label" ConfigKey="Locality"
									EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtLocality" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div id="divRegion" runat="server" visible="false" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel66" runat="server" ForControl="txtRegion"
									CssClass="settinglabel control-label" ConfigKey="Region" EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtRegion" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div id="divPostalCode" runat="server" visible="false" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel67" runat="server" ForControl="txtPostalCode"
									CssClass="settinglabel control-label" ConfigKey="PostalCode"
									EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtPostalCode" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div id="divCountry" runat="server" visible="false" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel68" runat="server" ForControl="txtCountry"
									CssClass="settinglabel control-label" ConfigKey="Country" EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtCountry" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel69" runat="server" ForControl="txtPhone"
									CssClass="settinglabel control-label" ConfigKey="Phone" EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtPhone" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel70" runat="server" ForControl="txtFax"
									CssClass="settinglabel control-label" ConfigKey="Fax" EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtFax" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel71" runat="server" ForControl="txtPublicEmail"
									CssClass="settinglabel control-label" ConfigKey="PublicEmail"
									EnableViewState="false" />
								<div class="">
									<asp:TextBox ID="txtPublicEmail" runat="server" TabIndex="10" MaxLength="100"
										CssClass="form-control" />
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabHosts" runat="server" visible="false">
						<asp:UpdatePanel ID="upHosts" UpdateMode="Conditional" runat="server">
							<ContentTemplate>
								<asp:Panel ID="pnlHostNames" runat="server" DefaultButton="btnAddHost">
									<div class="settingrow form-group">
										<div class="input-group">
											<asp:TextBox ID="txtHostName" MaxLength="255" runat="server"
												CssClass="form-control" />
											<div class="input-group-btn">
												<asp:Button ID="btnAddHost" SkinID="DefaultButton" runat="server" />
											</div>
											<portal:gbHelpLink ID="gbHelpLink53" runat="server"
												HelpKey="sitesettingshostnamehelp" />
										</div>
									</div>
									<portal:gbLabel ID="lblHostMessage" runat="server" CssClass="alert alert-danger"
										EnableViewState="false" />
								</asp:Panel>
								<h3>
									<asp:Literal ID="litHostListHeader" runat="server" />
								</h3>
								<asp:Repeater ID="rptHosts" runat="server">
									<HeaderTemplate>
										<ul class="simplelist">
									</HeaderTemplate>
									<ItemTemplate>
										<li>
											<asp:LinkButton CommandName="delete"
												CommandArgument='<%# DataBinder.Eval(Container.DataItem, "HostID") %>'
												ToolTip="<%# Resources.Resource.SiteSettingsDeleteHostLabel %>"
												runat="server" ID="btnDeleteHost"><i class="fa fa-trash-o"></i>
											</asp:LinkButton>
											<%# DataBinder.Eval(Container.DataItem, "HostName") %>
										</li>
									</ItemTemplate>
									<AlternatingItemTemplate>
										<li>
											<asp:LinkButton CommandName="delete"
												CommandArgument='<%# DataBinder.Eval(Container.DataItem, "HostID") %>'
												ToolTip="<%# Resources.Resource.SiteSettingsDeleteHostLabel %>"
												runat="server" ID="btnDeleteHost"><i class="fa fa-trash-o"></i>
											</asp:LinkButton>
											<%# DataBinder.Eval(Container.DataItem, "HostName") %>
										</li>
										</ItemTemplate>
									</AlternatingItemTemplate>
									<FooterTemplate>
										</ul>
									</FooterTemplate>
								</asp:Repeater>
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabFolderNames" runat="server" visible="false">
						<asp:UpdatePanel ID="upFolderNames" UpdateMode="Conditional" runat="server">
							<ContentTemplate>
								<asp:Panel ID="pnlAddFolder" runat="server" DefaultButton="btnAddFolder">
									<div class="settingrow form-group">
										<div class="input-group">
											<asp:TextBox ID="txtFolderName" MaxLength="255" runat="server"
												CssClass="form-control" />
											<asp:Button SkinID="DefaultButton" ID="btnAddFolder" runat="server">
											</asp:Button>
											<portal:gbHelpLink ID="gbHelpLink54" runat="server"
												HelpKey="sitesettingsfoldernamehelp" />
										</div>
									</div>
									<portal:gbLabel ID="lblFolderMessage" runat="server"
										CssClass="alert alert-danger" />
								</asp:Panel>
								<h3>
									<asp:Literal ID="litFolderNamesListHeading" runat="server"
										EnableViewState="false" />
								</h3>
								<asp:Repeater ID="rptFolderNames" runat="server">
									<HeaderTemplate>
										<ul class="simplelist">
									</HeaderTemplate>
									<ItemTemplate>
										<li>
											<asp:LinkButton ImageUrl='<%# DeleteLinkImage %>' CommandName="delete"
												ToolTip="<%# Resources.Resource.SiteSettingsDeleteFolderMapping %>"
												CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Guid") %>'
												AlternateText="<%# Resources.Resource.SiteSettingsDeleteHostLabel %>"
												runat="server" ID="btnDeleteFolder"><i class="fa fa-trash-o"></i>
											</asp:LinkButton>
											<%# DataBinder.Eval(Container.DataItem, "FolderName") %>
										</li>
									</ItemTemplate>
									<AlternatingItemTemplate>
										<li>
											<asp:LinkButton ImageUrl='<%# DeleteLinkImage %>' CommandName="delete"
												ToolTip="<%# Resources.Resource.SiteSettingsDeleteFolderMapping %>"
												CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Guid") %>'
												AlternateText="<%# Resources.Resource.SiteSettingsDeleteHostLabel %>"
												runat="server" ID="btnDeleteFolder"><i class="fa fa-trash-o"></i>
											</asp:LinkButton>
											<%# DataBinder.Eval(Container.DataItem, "FolderName") %>
										</li>
										</ItemTemplate>
									</AlternatingItemTemplate>
									<FooterTemplate>
										</ul>
									</FooterTemplate>
								</asp:Repeater>
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabSiteFeatures" runat="server" visible="false">
						<asp:UpdatePanel ID="upFeatures" UpdateMode="Conditional" runat="server">
							<ContentTemplate>
								<div class="row">
									<div class="col-sm-5">
										<h3>
											<gb:SiteLabel ID="Sitelabel4" runat="server"
												ConfigKey="SiteSettingsSiteAvailableFeaturesLabel"
												UseLabelTag="false" />
										</h3>
										<asp:ListBox ID="lstAllFeatures" runat="Server" Width="100%" Height="200"
											SelectionMode="Multiple" />
									</div>
									<div class="col-sm-1 text-center mrt60">
										<asp:Button SkinID="DefaultButton" Text="&laquo;" runat="server"
											ID="btnRemoveFeature" CausesValidation="false" />
										<asp:Button SkinID="DefaultButton" Text="&raquo;" runat="server"
											ID="btnAddFeature" CausesValidation="false" />
										<br />
										<portal:gbHelpLink ID="gbHelpLink55" runat="server" RenderWrapper="false"
											HelpKey="sitesettingschildsitefeatureshelp" />
									</div>
									<div class="col-sm-6">
										<h3>
											<gb:SiteLabel ID="Sitelabel5" runat="server"
												ConfigKey="SiteSettingsSiteSelectedFeaturesLabel" UseLabelTag="false" />
										</h3>
										<asp:ListBox ID="lstSelectedFeatures" runat="Server" Width="100%" Height="200"
											SelectionMode="Multiple" />
									</div>
								</div>
								<portal:gbLabel ID="lblFeatureMessage" runat="server" CssClass="alert alert-danger" />
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabWebParts" runat="server" visible="false">
						<asp:UpdatePanel ID="upWebParts" UpdateMode="Conditional" runat="server">
							<ContentTemplate>
								<div class="row">
									<div class="col-sm-5">
										<h3>
											<gb:SiteLabel ID="Sitelabel21" runat="server"
												ConfigKey="WebPartAdminAllWebParts" UseLabelTag="false" />
										</h3>
										<asp:ListBox ID="lstAllWebParts" runat="Server" Width="100%" Height="200" />
									</div>
									<div class="col-sm-1 text-center mrt60">
										<asp:Button SkinID="DefaultButton" Text="&laquo;" runat="server"
											ID="btnRemoveWebPart" />
										<asp:Button SkinID="DefaultButton" Text="&raquo;" runat="server"
											ID="btnAddWebPart" />
										<br />
										<portal:gbHelpLink ID="gbHelpLink56" runat="server" RenderWrapper="false"
											HelpKey="sitesettingschildsitefeatureshelp" />
									</div>
									<div class="col-sm-6">
										<h3>
											<gb:SiteLabel ID="Sitelabel22" runat="server"
												ConfigKey="WebPartAdminSelectedWebParts" UseLabelTag="false" />
										</h3>
										<asp:ListBox ID="lstSelectedWebParts" runat="Server" Width="100%"
											Height="200" />
									</div>
								</div>
								<portal:gbLabel ID="lblWebPartMessage" runat="server" CssClass="alert alert-danger"
									EnableViewState="false" />
							</ContentTemplate>
						</asp:UpdatePanel>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabApiKeys" visible="false" runat="server">
						<div class="form-horizontal">
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel86" runat="server" ForControl="ddSearchEngine"
									CssClass="settinglabel control-label" ConfigKey="DefaultSiteSearch" />
								<div class="">
									<div class="input-group">
										<asp:DropDownList ID="ddSearchEngine" runat="server" CssClass="form-control">
											<asp:ListItem Value="internal"
												Text="<%$ Resources:Resource, InternalSearchEngine %>" />
											<asp:ListItem Value="bing"
												Text="<%$ Resources:Resource, BingSiteSearch %>" />
											<asp:ListItem Value="google"
												Text="<%$ Resources:Resource, GoogleSiteSearch %>" />
										</asp:DropDownList>
										<portal:gbHelpLink ID="gbHelpLink81" runat="server"
											HelpKey="default-search-engine-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel87" runat="server" ForControl="txtBingSearchAPIKey"
									CssClass="settinglabel control-label" ConfigKey="BingSearchApiKey" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtBingSearchAPIKey" TabIndex="10" MaxLength="100" Columns="45"
											runat="server" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink82" runat="server"
											HelpKey="bing-search-apikey-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel88" runat="server" ForControl="txtGoogleCustomSearchId"
									CssClass="settinglabel control-label" ConfigKey="GoogleCustomSearchId" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtGoogleCustomSearchId" TabIndex="10" MaxLength="100"
											Columns="45" runat="server" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink83" runat="server"
											HelpKey="google-custom-searchid-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel89" runat="server"
									ForControl="chkShowAlternateSearchIfConfigured"
									CssClass="settinglabel control-label" ConfigKey="ShowAlternateSearchIfConfigured" />
								<div class="">
									<asp:CheckBox ID="chkShowAlternateSearchIfConfigured" runat="server" />
									<portal:gbHelpLink ID="gbHelpLink84" runat="server" RenderWrapper="false"
										HelpKey="show-alternate-search-help" />
								</div>
							</div>
							<div id="divWoopra" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel46" runat="server" ForControl="chkEnableWoopra"
									CssClass="settinglabel control-label" ConfigKey="EnableWoopraLabel" />
								<div class="">
									<asp:CheckBox ID="chkEnableWoopra" runat="server" />
									<portal:gbHelpLink ID="gbHelpLink58" runat="server" RenderWrapper="false"
										HelpKey="wooprahelp" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel10" runat="server" ForControl="txtGmapApiKey"
									CssClass="settinglabel control-label" ConfigKey="SiteSettingsGmapApiKeyLabel" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtGmapApiKey" TabIndex="10" MaxLength="100" Columns="45"
											runat="server" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink59" runat="server"
											HelpKey="sitesettingsgmapapikeyhelp" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel80" runat="server" ForControl="ddCommentSystem"
									CssClass="settinglabel control-label" ConfigKey="SiteSettingsCommentSystem" />
								<div class="">
									<div class="input-group">
										<asp:DropDownList ID="ddCommentSystem" runat="server" CssClass="form-control">
											<asp:ListItem Value="intensedebate"
												Text="<%$ Resources:Resource, CommentSystemIntenseDebate %>" />
											<asp:ListItem Value="disqus"
												Text="<%$ Resources:Resource, CommentSystemDisqus %>" />
											<asp:ListItem Value="facebook"
												Text="<%$ Resources:Resource, CommentSystemFacebook %>" />
										</asp:DropDownList>
										<portal:gbHelpLink ID="gbHelpLink51" runat="server"
											HelpKey="comment-system-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel75" runat="server" ForControl="txtFacebookAppId"
									CssClass="settinglabel control-label" ConfigKey="FacebookAppId" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtFacebookAppId" TabIndex="10" MaxLength="255" runat="server"
											CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink68" runat="server"
											HelpKey="FacebookAppId-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel81" runat="server" ForControl="txtIntenseDebateAccountId"
									CssClass="settinglabel control-label" ConfigKey="IntenseDebateAccountId" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtIntenseDebateAccountId" TabIndex="10" MaxLength="255"
											runat="server" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink52" runat="server"
											HelpKey="intensedebate-accoutid-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel82" runat="server" ForControl="txtDisqusSiteShortName"
									CssClass="settinglabel control-label" ConfigKey="DisqusSiteShortName" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtDisqusSiteShortName" TabIndex="10" MaxLength="255"
											runat="server" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink78" runat="server"
											HelpKey="disqus-siteshortname-help" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel23" runat="server" ForControl="txtAddThisUserId"
									CssClass="settinglabel control-label"
									ConfigKey="SiteSettingsAddThisAccountIdLabel" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtAddThisUserId" TabIndex="10" MaxLength="100" Columns="45"
											runat="server" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink60" runat="server"
											HelpKey="sitesettingsaddthisuseridhelp" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabMailSettings" runat="server" visible="false">
						<div class="form-horizontal">
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel19" runat="server" ForControl="txtSiteEmailFromAddress"
									CssClass="settinglabel control-label"
									ConfigKey="SiteSettingsSiteEmailFromAddressLabel" EnableViewState="false" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtSiteEmailFromAddress" runat="server" TabIndex="10"
											MaxLength="100" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink6" runat="server"
											HelpKey="sitesettingssiteemailfromhelp" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel100" runat="server" ForControl="txtSiteEmailFromAlias"
									CssClass="settinglabel control-label"
									ConfigKey="SiteSettingsSiteEmailFromAliasLabel" EnableViewState="false" />
								<div class="">
									<div class="input-group">
										<asp:TextBox ID="txtSiteEmailFromAlias" runat="server" TabIndex="10"
											MaxLength="100" CssClass="form-control" />
										<portal:gbHelpLink ID="gbHelpLink95" runat="server"
											HelpKey="sitesettingssiteemailfromaliashelp" />
									</div>
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel28" runat="server" ForControl="txtSMTPUser"
									CssClass="settinglabel control-label" ConfigKey="SMTPUser" />
								<div class="">
									<asp:TextBox ID="txtSMTPUser" TabIndex="10" MaxLength="100" Columns="45"
										runat="server" CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel36" runat="server" ForControl="txtSMTPPassword"
									CssClass="settinglabel control-label" ConfigKey="SMTPPassword" />
								<div class="">
									<asp:TextBox ID="txtSMTPPassword" TabIndex="10" TextMode="Password" MaxLength="100"
										Columns="45" runat="server" CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel37" runat="server" ForControl="txtSMTPServer"
									CssClass="settinglabel control-label" ConfigKey="SMTPServer" />
								<div class="">
									<asp:TextBox ID="txtSMTPServer" TabIndex="10" MaxLength="100" Columns="45"
										runat="server" CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel38" runat="server" ForControl="txtSMTPPort"
									CssClass="settinglabel control-label" ConfigKey="SMTPPort" />
								<div class="">
									<asp:TextBox ID="txtSMTPPort" TabIndex="10" MaxLength="100" Columns="45"
										runat="server" CssClass="form-control" />
								</div>
							</div>
							<div class="settingrow form-group">
								<asp:CheckBox ID="chkSMTPRequiresAuthentication" runat="server" />
								<gb:SiteLabel ID="SiteLabel41" runat="server" ForControl="chkSMTPRequiresAuthentication"
									CssClass="settinglabel control-label" ConfigKey="SMTPRequiresAuthentication" />
								<div class="">
								</div>
							</div>
							<div class="settingrow form-group">
								<asp:CheckBox ID="chkSMTPUseSsl" runat="server" />
								<gb:SiteLabel ID="SiteLabel40" runat="server" ForControl="chkSMTPUseSsl"
									CssClass="settinglabel control-label" ConfigKey="SMTPUseSsl" />
								<div class="">
								</div>
							</div>
							<div class="settingrow form-group" id="divSMTPEncoding" runat="server">
								<gb:SiteLabel ID="SiteLabel39" runat="server" ForControl="txtSMTPPreferredEncoding"
									CssClass="settinglabel control-label" ConfigKey="SMTPPreferredEncoding" />
								<div class="">
									<asp:TextBox ID="txtSMTPPreferredEncoding" TabIndex="10" MaxLength="100"
										Columns="45" runat="server" CssClass="form-control" />
								</div>
							</div>
							<asp:UpdatePanel ID="upTestEmail" runat="server">
								<ContentTemplate>
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblTestEmail" runat="server" ForControl="txtEmailTest"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsTestSendEmailLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtTestEmail" TabIndex="10" MaxLength="100"
													Columns="45" runat="server" CssClass="form-control" />
												<div class="input-group-btn">
													<asp:Button ID="btnTestEmail" SkinID="DefaultButton"
														Text="<%$Resources:Resource, SiteSettingsSendEmailButton %>"
														runat="server" />
												</div>
											</div>
										</div>
									</div>
								</ContentTemplate>
							</asp:UpdatePanel>
						</div>
					</div>
				</div>
			</div>

		</asp:Panel>
		<asp:HiddenField ID="hdnCurrentSkin" runat="server" />
	</div>
</asp:Content>