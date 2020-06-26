<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="ContentTemplateEdit.aspx.cs" Inherits="CanhCam.Web.AdminUI.ContentTemplateEditPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
		CurrentPageTitle="<%$Resources:Resource, ContentTemplatesEditorLink %>"
		CurrentPageUrl="~/AdminCP/ContentTemplates.aspx" />
	<div class="admin-content">

		<div class="workplace admin-content-bg-white">
			<div class="form-horizontal">
				<div class="settingrow form-group row align-items-center">
					<gb:SiteLabel ID="lblTitle" runat="server" ForControl="txtTitle"
						CssClass="settinglabel control-label col-sm-3 mb-0" ConfigKey="ContentTemplateTitleLabel"
						ResourceFile="Resource" />
					<div class="col-sm-9">
						<asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" />
					</div>
				</div>
			</div>
			<div id="divtabs" class="tabs">
				<ul class="nav nav-pills margin-bottom">
					<li role="presentation" class="nav-item"><a aria-controls="tabTemplate" role="tab" data-toggle="tab"
							href="#tabTemplate" class="nav-link"><span>
								<asp:Literal ID="litTemplateTab" runat="server" /></span></a></li>
					<li id="liDescription" runat="server" class="nav-item">
						<a aria-controls="tabDescription" role="tab" data-toggle="tab" id="lnkDescription"
							runat="server" href="#tabDescription" class="nav-link"><span>
								<asp:Literal ID="litDescriptionTab" runat="server" /></span></a>
					</li>
					<li id="liSecurity" runat="server" visible="false" class="nav-item"><a aria-controls="tabSecurity"
							role="tab" data-toggle="tab" id="lnkSecurity" runat="server" href="#tabSecurity"
							class="nav-link"><span>
								<asp:Literal ID="litSecurityTab" runat="server" /></span></a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="tabTemplate">
						<div class="settingrow form-group">
							<gbe:EditorControl ID="edTemplate" runat="server">
							</gbe:EditorControl>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabDescription">
						<div class="settingrow form-group">
							<gbe:EditorControl ID="edDescription" runat="server">
							</gbe:EditorControl>
						</div>
						<div class="settingrow form-group">
							<gb:SiteLabel ID="lblLogo" ForControl="ddImage" runat="server"
								CssClass="settinglabel control-label" ConfigKey="ContentTemplateImageLabel"
								EnableViewState="false" />
							<div class="input-group">
								<asp:DropDownList ID="ddImage" runat="server" TabIndex="10" EnableViewState="true"
									DataValueField="Name" DataTextField="Name" CssClass="form-control">
								</asp:DropDownList>
								<div class="input-group-addon">
									<img alt="" src="" id="imgTemplate" runat="server" enableviewstate="false" />
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="tabSecurity" runat="server" visible="false">
						<portal:AllowedRolesSetting ID="arTemplate" runat="server" />
					</div>
				</div>
			</div>
			<portal:HeadingPanel ID="heading" runat="server">
				<asp:Button SkinID="SaveButton" ID="btnSave" runat="server" />
				<asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" />
				<asp:HyperLink SkinID="CancelButton" ID="lnkCancel" runat="server" />
			</portal:HeadingPanel>
		</div>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server">
</asp:Content>