<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="ContentCatalog.aspx.cs" Inherits="CanhCam.Web.AdminUI.ContentCatalogPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
		CurrentPageTitle="<%$Resources:Resource, AdminMenuContentManagerLink %>"
		CurrentPageUrl="~/AdminCP/ContentCatalog.aspx" />
	<div class="admin-content">
		<!-- <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel> -->
		<div class="headInfo form-horizontal admin-content-bg-white">
			<asp:Panel ID="pnlNewContent" CssClass="settingrow form-group" runat="server"
				DefaultButton="btnCreateNewContent">
				<div class="form-group">
					<asp:DropDownList ID="ddModuleType" CssClass="form-control" runat="server"
						DataValueField="ModuleDefID" DataTextField="FeatureName" />
				</div>
				<div class="form-group">
					<div class="input-group">
						<asp:TextBox ID="txtModuleTitle" CssClass="form-control" runat="server"
							EnableViewState="false" />
						<div class="input-group-addon p-0">
							<asp:Button SkinID="InsertButton" ID="btnCreateNewContent" runat="server" />
						</div>
					</div>
				</div>
				<div class="form-group">
				</div>
			</asp:Panel>
			<asp:Panel ID="pnlFind" CssClass="settingrow form-group" runat="server" DefaultButton="btnFind">
				<div class="form-group">
					<asp:TextBox ID="txtTitleFilter"
						placeholder="<%$Resources:Resource, ContentManagerTitleFilterLabel %>" CssClass="form-control"
						runat="server" MaxLength="255" />
				</div>
				<div class="form-group">
					<asp:CheckBox ID="chkFilterByFeature" runat="server" />
					<div class="">
						<asp:Button SkinID="SearchButton" ID="btnFind" runat="server" />
					</div>
				</div>
			</asp:Panel>
		</div>
		<div class="workplace admin-content-bg-white">
			<telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
				<MasterTableView DataKeyNames="ModuleID" AllowPaging="false" AllowSorting="false">
					<Columns>
						<telerik:GridTemplateColumn HeaderStyle-Width="35"
							HeaderText="<%$Resources:Resource, RowNumber %>" AllowFiltering="false">
							<ItemTemplate>
								<%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
							</ItemTemplate>
						</telerik:GridTemplateColumn>
						<telerik:GridTemplateColumn
							HeaderText="<%$Resources:Resource, ContentManagerContentTitleColumnHeader %>">
							<ItemTemplate>
								<%# Eval("ModuleTitle").ToString().Coalesce(Resources.Resource.ContentNoTitle)%>
							</ItemTemplate>
						</telerik:GridTemplateColumn>
						<telerik:GridTemplateColumn
							HeaderText="<%$Resources:Resource, ContentManagerFeatureTypeColumnHeader %>">
							<ItemTemplate>
								<%# CanhCam.Web.Framework.ResourceHelper.GetResourceString(DataBinder.Eval(Container.DataItem, "ResourceFile").ToString(),DataBinder.Eval(Container.DataItem, "FeatureName").ToString()) %>
								(<%# Eval("UseCount") %>)
							</ItemTemplate>
						</telerik:GridTemplateColumn>
						<telerik:GridBoundColumn HeaderText="<%$Resources:Resource, ContentManagerAuthorColumnHeader %>"
							DataField="CreatedBy" />
						<telerik:GridTemplateColumn HeaderStyle-Width="100">
							<ItemTemplate>
								<a class="cp-link btn bg-blue"
									href='<%# SiteRoot + "/AdminCP/ContentManagerPreview.aspx?mid=" + DataBinder.Eval(Container.DataItem,"ModuleID") %>'>
									<%# Resources.Resource.ContentManagerViewEditLabel %></a>
							</ItemTemplate>
						</telerik:GridTemplateColumn>
						<telerik:GridTemplateColumn HeaderStyle-Width="150">
							<ItemTemplate>
								<a class="cp-link btn bg-orange"
									href='<%# SiteRoot + "/AdminCP/ContentManager.aspx?mid=" + DataBinder.Eval(Container.DataItem,"ModuleID") %>'>
									<%# Resources.Resource.ContentManagerPublishDeleteLabel%></a>
							</ItemTemplate>
						</telerik:GridTemplateColumn>
					</Columns>
				</MasterTableView>
			</telerik:RadGrid>
			<portal:gbCutePager ID="pgrContent" runat="server" />
		</div>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />