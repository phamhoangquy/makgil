<%@ Page Language="c#" CodeBehind="ModuleDefinitions.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.AdminUI.ModuleDefinitions" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
		CurrentPageTitle="<%$Resources:Resource, AdminMenuFeatureModulesLink %>"
		CurrentPageUrl="~/AdminCP/ModuleAdmin.aspx" />
	<div class="admin-content">
		<portal:NotifyMessage ID="message" runat="server" />
		<div class="workplace admin-content-bg-white">
			<div class="form-horizontal row">
				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="lblFeatureName" runat="server" ForControl="txtFeatureName"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsResourceKeyLabel" />
					<div class="">
						<asp:TextBox ID="txtFeatureName" runat="server" Columns="50" MaxLength="255"
							CssClass="forminput form-control"></asp:TextBox>
						<asp:RequiredFieldValidator ID="reqFeatureName" runat="server" Display="Dynamic"
							ValidationGroup="DefinitionSettings" ControlToValidate="txtFeatureName"
							SetFocusOnError="true"></asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="lblResourceFile" runat="server" ForControl="txtResourceFile"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsResourceFileLabel" />
					<div class="">
						<asp:TextBox ID="txtResourceFile" runat="server" Columns="50" MaxLength="255"
							CssClass="forminput form-control"></asp:TextBox>
					</div>
				</div>
				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="lblControlSource" runat="server" ForControl="txtControlSource"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsDesktopSourceLabel" />
					<div class="">
						<asp:TextBox ID="txtControlSource" runat="server" Columns="50" MaxLength="150"
							CssClass="forminput form-control"></asp:TextBox>
						<asp:RequiredFieldValidator ID="reqControlSource" runat="server" Display="Dynamic"
							ValidationGroup="DefinitionSettings" ControlToValidate="txtControlSource"
							SetFocusOnError="true"></asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="SiteLabel3" runat="server" ForControl="txtFeatureGuid"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsFeatureGuidLabel" />
					<div class="">
						<asp:TextBox ID="txtFeatureGuid" runat="server" Columns="50" MaxLength="36"
							CssClass="forminput form-control"></asp:TextBox>
					</div>
				</div>
				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="lblSortOrder" runat="server" ForControl="txtSortOrder"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsSortOrderLabel" />
					<div class="">
						<asp:TextBox ID="txtSortOrder" runat="server" Columns="20" MaxLength="3"
							CssClass="forminput form-control">
						</asp:TextBox>
						<asp:RequiredFieldValidator ID="reqSortOrder" runat="server" Display="Dynamic"
							ValidationGroup="DefinitionSettings" ControlToValidate="txtSortOrder"
							SetFocusOnError="true"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="regexSortOrder" runat="server" Display="Dynamic"
							ValidationGroup="DefinitionSettings" ControlToValidate="txtSortOrder"
							ValidationExpression="^[0-9][0-9]{0,4}$" SetFocusOnError="true" />
					</div>
				</div>

				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="SiteLabel2" runat="server" ForControl="txtDefaultCacheDuration"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsDefaultCacheDurationLabel">
					</gb:SiteLabel>
					<div class="">
						<asp:TextBox ID="txtDefaultCacheDuration" runat="server" Columns="20" MaxLength="8"
							CssClass="forminput form-control"></asp:TextBox>
						<asp:RequiredFieldValidator ID="reqDefaultCache" runat="server" Display="Dynamic"
							ValidationGroup="DefinitionSettings" ControlToValidate="txtDefaultCacheDuration"
							SetFocusOnError="true"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="regexCacheDuration" runat="server" Display="Dynamic"
							ValidationGroup="DefinitionSettings" ControlToValidate="txtDefaultCacheDuration"
							ValidationExpression="^[0-9][0-9]{0,8}$" SetFocusOnError="true" />
					</div>
				</div>

				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="SiteLabel7" runat="server" ForControl="txtSearchListName"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsSearchListNameLabel" />
					<div class="">
						<asp:TextBox ID="txtSearchListName" runat="server" Columns="50" MaxLength="255"
							CssClass="forminput form-control"></asp:TextBox>
					</div>
				</div>
				<div class="settingrow form-group col-lg-6">
					<gb:SiteLabel ID="lblIcon" runat="server" ForControl="ddIcons" CssClass="settinglabel control-label"
						ConfigKey="AdminMenuIconLabel" />
					<div class="">
						<div class="input-group">
							<asp:DropDownList ID="ddIcons" runat="server" DataValueField="Name" DataTextField="Name"
								CssClass="forminput form-control">
							</asp:DropDownList>
							<div class="input-group-addon">
								<img id="imgIcon" alt="" src="" runat="server" />
							</div>
						</div>
					</div>
				</div>
				<div class="settingrow form-group col-12">
					<asp:CheckBox ID="chkIsAdmin" runat="server"></asp:CheckBox>
					<gb:SiteLabel ID="Sitelabel1" runat="server" ForControl="chkIsAdmin"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsIsAdminLabel" />
					<div class="">
					</div>
				</div>
				<div class="settingrow form-group col-12">
					<asp:CheckBox ID="chkIsCacheable" runat="server">
					</asp:CheckBox>
					<gb:SiteLabel ID="Sitelabel5" runat="server" ForControl="chkIsCacheable"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsIsCacheableLabel" />
					<div class="">
					</div>
				</div>
				<div class="settingrow form-group col-12">
					<asp:CheckBox ID="chkIsSearchable" runat="server">
					</asp:CheckBox>
					<gb:SiteLabel ID="Sitelabel6" runat="server" ForControl="chkIsSearchable"
						CssClass="settinglabel control-label" ConfigKey="ModuleDefinitionsIsSearchableLabel" />
					<div class="">
					</div>
				</div>
			</div>
			<portal:HeadingPanel ID="heading" runat="server">
				<asp:Button SkinID="UpdateButton" ID="updateButton" runat="server" Text=""
					ValidationGroup="DefinitionSettings" />
				<asp:HyperLink SkinID="DefaultButton" ID="lnkConfigureSettings" runat="server" />
				<asp:Button SkinID="CancelButton" ID="cancelButton" runat="server" Text="" CausesValidation="false" />
				<asp:Button SkinID="DeleteButton" ID="deleteButton" runat="server" Text="" CausesValidation="false" />
			</portal:HeadingPanel>
		</div>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />