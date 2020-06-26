<%@ Page Language="c#" MaintainScrollPositionOnPostback="true" CodeBehind="ManageUsers.aspx.cs"
    MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AdminUI.ManageUsers" %>

<%@ Register Src="~/AdminCP/Controls/UserRoles.ascx" TagPrefix="portal" TagName="UserRoles" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server" CurrentPageTitle="<%$Resources:Resource, MemberListLink %>"
		CurrentPageUrl="~/Secure/MemberList.aspx" />
	<div class="admin-content admin-content-bg-white">

		<portal:NotifyMessage ID="message" runat="server" />
		<asp:Panel ID="pnlUserProfile" runat="server" DefaultButton="btnUpdate" CssClass="workplace manageusers">
			<div id="divtabs" class="tabs">
				<ul class="nav nav-pills margin-bottom margin-top-10">
					<li role="presentation" class="nav-item">
						<asp:Literal ID="litSecurityTab" runat="server" />
					</li>
					<li role="presentation" id="liProfile" runat="server" class="nav-item">
						<asp:Literal ID="litProfileTab" runat="server" />
					</li>
					<li role="presentation" id="liRoles" runat="server" class="nav-item">
						<asp:Literal ID="litRolesTab" runat="server" />
					</li>
					<li role="presentation" id="liActivity" runat="server" class="nav-item">
						<asp:Literal ID="litActivityTab" runat="server" />
					</li>
					<li role="presentation" id="liLocation" runat="server" class="nav-item">
						<asp:Literal ID="litLocationTab" runat="server" />
					</li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade show active in" id="tabSecurity">
						<div class="form-horizontal">
							<div class="row">
								<div class="col-lg-6">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblUserName" runat="server" ForControl="txtName"
											CssClass="settinglabel control-label"
											ConfigKey="ManageUsersUserNameLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtName" runat="server" TabIndex="10" Columns="45"
													MaxLength="100" CssClass="form-control" />
												<div class="input-group-append">
													<portal:gbHelpLink ID="gbHelpLink1" runat="server"
														HelpKey="userfullnamehelp" />
												</div>
												<asp:RequiredFieldValidator ID="rfvName" runat="server"
													Display="Dynamic" ControlToValidate="txtName"
													ValidationGroup="profile">
												</asp:RequiredFieldValidator>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="SitelabelLoginName" runat="server" ForControl="txtLoginName"
											CssClass="settinglabel control-label"
											ConfigKey="ManageUsersLoginNameLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtLoginName" runat="server" TabIndex="10" Columns="45"
													MaxLength="50" CssClass="form-control" />
												<div class="input-group-append">
													<portal:gbHelpLink ID="gbHelpLink2" runat="server"
														HelpKey="userloginnamehelp" />
												</div>
											</div>
											<asp:RequiredFieldValidator ID="rfvLoginName" runat="server"
												Display="Dynamic" ControlToValidate="txtLoginName"
												ValidationGroup="profile">
											</asp:RequiredFieldValidator>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group">
										<gb:SiteLabel ID="lblEmail" runat="server" ForControl="txtEmail"
											CssClass="settinglabel control-label" ConfigKey="ManageUsersEmailLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtEmail" runat="server" Columns="45" TabIndex="10"
													MaxLength="100" CssClass="form-control" />
												<div class="input-group-append">
													<portal:gbHelpLink ID="gbHelpLink3" runat="server"
														HelpKey="useremailhelp" />

												</div>
											</div>
											<asp:RegularExpressionValidator ID="regexEmail" runat="server"
												ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="profile"
												ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
											</asp:RegularExpressionValidator>
											<asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic"
												ControlToValidate="txtEmail" ValidationGroup="profile">
											</asp:RequiredFieldValidator>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divPassword" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="lblPassword" runat="server" ForControl="txtPassword"
											CssClass="settinglabel control-label"
											ConfigKey="ManageUsersPasswordLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtPassword" runat="server" Columns="45" TabIndex="10"
													MaxLength="50" CssClass="form-control" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink8" runat="server"
														HelpKey="userpasswordhelp" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divReqPasswordChange" runat="server" class="settingrow form-inline">
										<div class="form-group">
											<asp:CheckBox ID="chkRequirePasswordChange" runat="server" TabIndex="10" />
											<gb:SiteLabel ID="SiteLabel17" runat="server"
												ForControl="chkRequirePasswordChange"
												CssClass="settinglabel control-label mb-0"
												ConfigKey="UserMustChangePassword" />
											<div class="input-group ml-2 d-flex align-items-center">
												<div class="input-group-append ml-2">
													<portal:gbHelpLink ID="gbHelpLink17" runat="server"
														RenderWrapper="false"
														HelpKey="manageuser-mustchangepassword-help" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divOpenID" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel12" runat="server" ForControl="txtOpenIDURI"
											CssClass="settinglabel control-label"
											ConfigKey="ManageUsersOpenIDURILabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtOpenIDURI" runat="server" TabIndex="10" Columns="45"
													MaxLength="100" CssClass="form-control" />
												<div class="input-group-append">
													<portal:gbHelpLink ID="gbHelpLink4" runat="server"
														HelpKey="useropenidhelp" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divWindowsLiveID" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel13" runat="server" ForControl="txtWindowsLiveID"
											CssClass="settinglabel control-label"
											ConfigKey="ManageUsersWindowsLiveIDLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtWindowsLiveID" runat="server" TabIndex="10"
													Columns="45" MaxLength="100" CssClass="form-control" />
												<div class="input-group-append">
													<portal:gbHelpLink ID="gbHelpLink5" runat="server"
														HelpKey="manageuserwindowsliveidhelp" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divLiveMessenger" runat="server">
										<div class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel14" runat="server"
												ForControl="txtLiveMessengerCID" CssClass="settinglabel control-label"
												ConfigKey="LiveMessengerCIDLabel" />
											<div class="">
												<div class="input-group">
													<asp:TextBox ID="txtLiveMessengerCID" runat="server" TabIndex="10"
														Columns="45" MaxLength="255" CssClass="form-control" />
													<div class="input-group-append">
														<portal:gbHelpLink ID="gbHelpLink6" runat="server"
															HelpKey="livemessenger-cid-help" />
													</div>
												</div>
											</div>
										</div>
										<div id="div1" runat="server" class="settingrow form-group">
											<gb:SiteLabel ID="SiteLabel15" runat="server"
												ForControl="chkEnableLiveMessengerOnProfile"
												CssClass="settinglabel control-label"
												ConfigKey="EnableLiveMessengerLabel" />
											<div class="">
												<asp:CheckBox ID="chkEnableLiveMessengerOnProfile" runat="server" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink7" runat="server"
														RenderWrapper="false" HelpKey="livemessenger-admin-help" />
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="col-lg-6">
									<div class="settingrow form-group" id="divSecurityQuestion" runat="server">
										<gb:SiteLabel ID="SiteLabel1" runat="server" ForControl="txtPasswordQuestion"
											CssClass="settinglabel control-label"
											ConfigKey="UsersSecurityQuestionLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtPasswordQuestion" runat="server" TabIndex="10"
													Columns="45" MaxLength="255" CssClass="form-control" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink9" runat="server"
														HelpKey="usersecurityquestionhelp" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="settingrow form-group" id="divSecurityAnswer" runat="server">
										<gb:SiteLabel ID="SiteLabel2" runat="server" ForControl="txtPasswordAnswer"
											CssClass="settinglabel control-label"
											ConfigKey="UsersSecurityAnswerLabel" />
										<div class="">
											<div class="input-group">
												<asp:TextBox ID="txtPasswordAnswer" runat="server" TabIndex="10"
													Columns="45" MaxLength="255" CssClass="form-control" />
												<div class="input-group-append">

													<portal:gbHelpLink ID="gbHelpLink10" runat="server"
														HelpKey="usersecurityanswerhelp" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divProfileApproved" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="lblProfileApproved" runat="server"
											ForControl="chkProfileApproved" CssClass="settinglabel control-label"
											ConfigKey="ManageUsersProfileApprovedLabel" />
										<div class="">
											<asp:CheckBox ID="chkProfileApproved" runat="server" TabIndex="10" />
											<portal:gbHelpLink ID="gbHelpLink11" runat="server" RenderWrapper="false"
												HelpKey="userprofileapprovedhelp" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divApprovedForLogin" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="lblApprovedForLogin" runat="server"
											CssClass="settinglabel control-label" ConfigKey="ApprovedForLogin" />
										<div class="">
											<asp:Button SkinID="DefaultButton" ID="btnApprove" runat="server"
												CausesValidation="false" />
											<portal:gbHelpLink ID="gbHelpLink12" runat="server"
												HelpKey="manageuser-approvedforlogin-help" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divTrusted" visible="false" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="lblTrusted" runat="server" ForControl="chkTrusted"
											CssClass="settinglabel control-label" ConfigKey="ManageUsersTrustedLabel" />
										<div class="">
											<asp:CheckBox ID="chkTrusted" runat="server" TabIndex="10" />
											<portal:gbHelpLink ID="gbHelpLink13" runat="server" RenderWrapper="false"
												HelpKey="usertrustedhelp" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divLockout" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel9" runat="server" ForControl="chkIsLockedOut"
											CssClass="settinglabel control-label" ConfigKey="UserIsLockedOutLabel" />
										<div class="">
											<asp:CheckBox ID="chkIsLockedOut" runat="server" Enabled="false" />
											<asp:Button SkinID="DefaultButton" ID="btnUnlockUser" runat="server"
												CausesValidation="false" />
											<asp:Button SkinID="DefaultButton" ID="btnLockUser" runat="server"
												CausesValidation="false" />
											<portal:gbHelpLink ID="gbHelpLink14" runat="server" RenderWrapper="false"
												HelpKey="useradminunlockhelp" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divEmailConfirm" runat="server" class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel11" runat="server" ForControl="chkEmailIsConfirmed"
											CssClass="settinglabel control-label"
											ConfigKey="UserEmailIsConfirmedLabel" />
										<div class="">
											<asp:CheckBox ID="chkEmailIsConfirmed" runat="server" Enabled="false"
												CssClass="forminput" />
											<asp:Button SkinID="DefaultButton" ID="btnConfirmEmail" runat="server"
												CausesValidation="false" />
											<asp:Button SkinID="DefaultButton" ID="btnResendConfirmationEmail"
												runat="server" CausesValidation="false" />
											<portal:gbHelpLink ID="gbHelpLink15" runat="server" RenderWrapper="false"
												HelpKey="useradminconfirmemailhelp" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divDisplayInMemberList" visible="false" runat="server"
										class="settingrow form-group">
										<gb:SiteLabel ID="lblDisplayInMemberList" runat="server"
											ForControl="chkDisplayInMemberList" CssClass="settinglabel control-label"
											ConfigKey="ManageUsersDisplayInMemberListLabel" />
										<div class="">
											<asp:CheckBox ID="chkDisplayInMemberList" runat="server" TabIndex="10" />
											<portal:gbHelpLink ID="gbHelpLink16" runat="server" RenderWrapper="false"
												HelpKey="userdisplayinmemberlisthelp" />
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div id="divEditorPreference" runat="server" visible="false"
										class="settingrow form-group">
										<gb:SiteLabel ID="SiteLabel29" runat="server" ForControl="ddEditorProviders"
											CssClass="settinglabel control-label"
											ConfigKey="SiteSettingsEditorProviderLabel" EnableViewState="false" />
										<div class="">
											<div class="input-group">
												<asp:DropDownList ID="ddEditorProviders" DataTextField="name"
													DataValueField="name" EnableViewState="true" TabIndex="10"
													runat="server" CssClass="forminput">
												</asp:DropDownList>
												<portal:gbHelpLink ID="gbHelpLink20" runat="server"
													HelpKey="sitesettingssiteeditorproviderhelp" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabProfile" runat="server">
						<div class="form-horizontal pad">
							<div id="divAvatarUrl" runat="server">
								<div class="settingrow form-group">
									<gb:SiteLabel ID="lblAvatar" runat="server" ForControl="ddAvatars"
										CssClass="settinglabel control-label" ConfigKey="UserProfileAvatarLabel" />
									<div class="">
										<portal:Avatar ID="userAvatar" runat="server" CssClass="forminput" />
										<asp:HyperLink ID="lnkAvatarUpld" runat="server" />
										<div class="input-group-append">

											<portal:gbHelpLink ID="avatarHelp" runat="server" RenderWrapper="false"
												HelpKey="useravatarhelp" />
										</div>
									</div>
								</div>
							</div>
							<div id="divTimeZone" runat="server" visible="false" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel16" runat="server" CssClass="settinglabel control-label"
									ConfigKey="TimeZone" />
								<div class="">
									<portal:TimeZoneIdSetting ID="timeZoneSetting" runat="server" />
								</div>
							</div>
							<asp:Panel ID="pnlProfileProperties" runat="server">
							</asp:Panel>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabRoles" runat="server">
						<portal:UserRoles ID="UserRolesControl" runat="server" />
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabActivity" runat="server">
						<div class="form-horizontal pad">
							<div id="divCreatedDate" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="lblCreatedDateLabel" runat="server"
									CssClass="settinglabel control-label" ConfigKey="ManageUsersCreatedDateLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblCreatedDate" runat="server" CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divUserGuid" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="lblUserGuidLabel" runat="server" CssClass="settinglabel control-label"
									ConfigKey="ManageUsersUserGuidLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblUserGuid" runat="server" CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divLastActivity" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel3" runat="server" CssClass="settinglabel control-label"
									ConfigKey="UserLastActivityDateLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblLastActivityDate" runat="server" CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divLastLogin" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel4" runat="server" CssClass="settinglabel control-label"
									ConfigKey="UserLastLoginDateLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblLastLoginDate" runat="server" CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divPasswordChanged" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel5" runat="server" CssClass="settinglabel control-label"
									ConfigKey="UserLastPasswordChangeDateLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblLastPasswordChangeDate" runat="server" CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divLockoutDate" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel6" runat="server" CssClass="settinglabel control-label"
									ConfigKey="UserLastLockoutDateLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblLastLockoutDate" runat="server" CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divFailedPasswordAttempt" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel7" runat="server" CssClass="settinglabel control-label"
									ConfigKey="UserFailedPasswordAttemptCountLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblFailedPasswordAttemptCount" runat="server"
											CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divFailedPasswordAnswerAttempt" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel8" runat="server" CssClass="settinglabel control-label"
									ConfigKey="UserFailedPasswordAnswerAttemptCountLabel" />
								<div class="">
									<p class="form-control-static">
										<asp:Label ID="lblFailedPasswordAnswerAttemptCount" runat="server"
											CssClass="forminput" />
									</p>
								</div>
							</div>
							<div id="divComment" visible="false" runat="server" class="settingrow form-group">
								<gb:SiteLabel ID="SiteLabel10" runat="server" ForControl="txtComment"
									CssClass="settinglabel control-label" ConfigKey="UserCommentsLabel" />
								<div class="">
									<asp:TextBox ID="txtComment" runat="server" TabIndex="10" MaxLength="255"
										TextMode="MultiLine" Rows="15" Columns="55" CssClass="forminput" />
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabLocation" runat="server">
						<div class="mrb10">
							<asp:Button SkinID="DeleteButton" ID="btnPurgeUserLocations" runat="server"
								CausesValidation="false" />
						</div>
						<telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
							<MasterTableView DataKeyNames="RowID" AllowPaging="false" AllowSorting="false">
								<Columns>
									<telerik:GridTemplateColumn HeaderStyle-Width="35"
										HeaderText="<%$Resources:Resource, RowNumber %>" AllowFiltering="false">
										<ItemTemplate>
											<%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
										</ItemTemplate>
									</telerik:GridTemplateColumn>
									<telerik:GridTemplateColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridIPAddressHeading %>">
										<ItemTemplate>
											<a class='popup-link cp-link' title='<%# Eval("IPAddress") %>'
												href='http://whois.arin.net/rest/ip/<%# Eval("IPAddress") %>.txt'>
												<%# Eval("IPAddress") %></a>
										</ItemTemplate>
									</telerik:GridTemplateColumn>
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridHostnameHeading %>"
										DataField="Hostname" />
									<%--<telerik:GridBoundColumn HeaderText="<%$Resources:Resource, ManageUsersLocationGridISPHeading %>"
									DataField="ISP" />
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridContinentHeading %>"
										DataField="Continent" />
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridCountryHeading %>"
										DataField="Country" />
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridRegionHeading %>"
										DataField="Region" />
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridCityHeading %>"
										DataField="City" />
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridTimeZoneHeading %>"
										DataField="TimeZone" />--%>
									<telerik:GridBoundColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridCaptureCountHeading %>"
										DataField="CaptureCount" />
									<telerik:GridTemplateColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridFirstCaptureHeading %>">
										<ItemTemplate>
											<%# DateTimeHelper.GetTimeZoneAdjustedDateTimeString(Eval("FirstCaptureUTC"), TimeOffset)%>
										</ItemTemplate>
									</telerik:GridTemplateColumn>
									<telerik:GridTemplateColumn
										HeaderText="<%$Resources:Resource, ManageUsersLocationGridLastCaptureHeading %>">
										<ItemTemplate>
											<%# DateTimeHelper.GetTimeZoneAdjustedDateTimeString(Eval("LastCaptureUTC"), TimeOffset)%>
										</ItemTemplate>
									</telerik:GridTemplateColumn>
								</Columns>
							</MasterTableView>
						</telerik:RadGrid>
					</div>
				</div>
			</div>
		</asp:Panel>
		<portal:HeadingPanel ID="heading" runat="server">
			<asp:Button SkinID="UpdateButton" ID="btnUpdate" runat="server" ValidationGroup="profile" />
			<asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" CausesValidation="false" />
		</portal:HeadingPanel>
	</div>
</asp:Content>