<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="List.aspx.cs" Inherits="CanhCam.Web.BannerUI.BannerList" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Banner" Namespace="CanhCam.Web.BannerUI" %>
<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<Site:BannerDisplaySettings ID="displaySettings" runat="server" />
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
		CurrentPageTitle="<%$Resources:BannerResources, ImageListHeading %>" CurrentPageUrl="~/Banner/List.aspx" />
	<div class="admin-content">

		<portal:NotifyMessage ID="message" runat="server" />
		<div class="row">
			<div class="col-12">
				<div class="headInfo admin-content-bg-white form-horizontal">
					<portal:HeadingPanel ID="heading" runat="server">
						<asp:Button SkinID="UpdateButton" ID="btnUpdate"
							Text="<%$Resources:BannerResources, BannerEditUpdateButton %>" runat="server" />
						<asp:HyperLink SkinID="InsertButton" ID="lnkInsert"
							Text="<%$Resources:BannerResources, InsertLink %>" runat="server" />
						<asp:Button SkinID="DeleteButton" ID="btnDelete"
							Text="<%$Resources:BannerResources, BannerListDeleteSelectedButton %>" runat="server"
							CausesValidation="false" />
					</portal:HeadingPanel>
					<div class="settingrow form-group">
						<gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel" ForControl="ddZones"
							CssClass="settinglabel control-label" />
						<div class="">
							<asp:DropDownList ID="ddZones" AutoPostBack="true" runat="server" Cssclass="form-control" />
						</div>
					</div>
					<div id="divBulkUpload" runat="server" class="settingrow form-group">
						<gb:SiteLabel ID="lblBulkUpload" runat="server" ForControl="txtISOCode2"
							CssClass="settinglabel control-label" ResourceFile="BannerResources"
							ConfigKey="BulkUploadLink" />
						<div class="">
							<telerik:RadAsyncUpload ID="uplImageFile" SkinID="radAsyncUploadSkin"
								MultipleFileSelection="Automatic" AllowedFileExtensions="jpg,jpeg,gif,png"
								runat="server" />
						</div>
					</div>
					<div class="settingrow form-group mb-0">
						<div class="input-group">
							<asp:Button SkinID="DefaultButton" ID="btnUpload" runat="server" />
							<div class="input-group-addon">
								<portal:gbHelpLink ID="GbHelpLink1" runat="server" RenderWrapper="false"
									HelpKey="bannerlist-bulkupload-help" />
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="col-12">
				<div class="workplace admin-content-bg-white">
					<telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
						<MasterTableView DataKeyNames="ItemID,DisplayOrder,Position">
							<Columns>
								<telerik:GridTemplateColumn HeaderStyle-Width="35"
									HeaderText="<%$Resources:Resource, RowNumber %>" AllowFiltering="false">
									<ItemTemplate>
										<%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn
									HeaderText="<%$Resources:BannerResources, BannerListImageHeader %>">
									<ItemTemplate>
										<%# GetFullImageMarkup(Eval("ImageFile").ToString(), Eval("Caption").ToString())%>
										<div><%# Eval("Caption").ToString()%></div>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn
									HeaderText="<%$Resources:BannerResources, ThumbnailLabel %>">
									<ItemTemplate>
										<%# GetThumnailMarkup(Eval("ThumbnailFile").ToString(), Eval("Caption").ToString())%>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn
									HeaderText="<%$Resources:BannerResources, BannerPositionLabel %>">
									<ItemTemplate>
										<asp:CheckBoxList ID="chkListPosition" runat="server" DataTextField="Name"
											DataValueField="Value" SkinID="Enum" />
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn HeaderStyle-Width="100"
									HeaderText="<%$Resources:BannerResources, BannerDisplayOrderLabel %>">
									<ItemTemplate>
										<asp:TextBox ID="txtDisplayOrder" SkinID="NumericTextBox" MaxLength="4"
											Text='<%# Eval("DisplayOrder") %>' runat="server" Cssclass="form-control" />
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn HeaderStyle-Width="100">
									<ItemTemplate>
										<asp:HyperLink CssClass="cp-link btn bg-orange" ID="EditLink" runat="server"
											Text="<%# Resources.BannerResources.BannerEditImageLink %>"
											NavigateUrl='<%# this.SiteRoot + "/Banner/Edit.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") %>' />
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridClientSelectColumn HeaderStyle-Width="35" />
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>

		</div>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />