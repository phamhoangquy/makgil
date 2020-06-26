<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="AdminTaxRate.aspx.cs" Inherits="CanhCam.Web.AdminUI.AdminTaxRatePage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server" CurrentPageTitle="<%$Resources:Resource, TaxRateAdminLink %>"
		CurrentPageUrl="~/AdminCP/AdminTaxRate.aspx" ParentTitle="<%$Resources:Resource, CoreDataAdministrationLink %>"
		ParentUrl="~/AdminCP/CoreData.aspx" />
	<div class="admin-content">

		<portal:NotifyMessage ID="message" runat="server" />
		<div class="row">
			<div class="col-lg-7 col-xl-9 order-2 order-lg-1">
				<div class="workplace admin-content-bg-white">
					<telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
						<MasterTableView DataKeyNames="Guid" EditMode="InPlace" AllowPaging="false"
							AllowSorting="false">
							<Columns>
								<telerik:GridTemplateColumn>
									<ItemTemplate>
										<%# Eval("Description") %>
									</ItemTemplate>
									<EditItemTemplate>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblDescription" runat="server" CssClass="settinglabel"
												ConfigKey="TaxRateGridDescriptionHeader" ResourceFile="Resource" />
											<asp:TextBox ID="txtDescription" Columns="20"
												Text='<%# Eval("Description") %>' runat="server" MaxLength="255"
												CssClass="forminput form-control" />
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblTaxClass" runat="server" CssClass="settinglabel"
												ConfigKey="TaxRateGridTaxClassHeader" ResourceFile="Resource" />
											<asp:DropDownList ID="ddTaxClass" runat="server" DataValueField="Guid"
												DataTextField="Title" CssClass="forminput form-control" />
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblPriority" runat="server" CssClass="settinglabel"
												ConfigKey="TaxRateGridPriorityHeader" ResourceFile="Resource" />
											<asp:TextBox ID="txtPriority" Columns="20" Text='<%# Eval("Priority") %>'
												runat="server" MaxLength="4" CssClass="forminput form-control" />
										</div>
										<div class="settingrow form-group">
											<gb:SiteLabel ID="lblRate" runat="server" CssClass="settinglabel"
												ConfigKey="TaxRateGridRateHeader" ResourceFile="Resource" />
											<asp:TextBox ID="txtRate" Columns="20" Text='<%# Eval("Rate") %>'
												runat="server" MaxLength="9" CssClass="forminput form-control" />
										</div>
										<div class="settingrow">
											<label class="settinglabel"></label>
											<asp:Button ID="btnGridUpdate" SkinID="UpdateButton" runat="server"
												Text='<%# Resources.Resource.TaxRateGridUpdateButton %>'
												CommandName="Update" />
											<asp:Button ID="btnGridCancel" SkinID="CancelButton" runat="server"
												Text='<%# Resources.Resource.TaxRateGridCancelButton %>'
												CommandName="Cancel" />
											<asp:Button ID="btnGridDelete" SkinID="DeleteButton" runat="server"
												Text='<%# Resources.Resource.TaxRateGridDeleteButton %>'
												CommandName="Delete" />
										</div>
									</EditItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn>
									<ItemTemplate>
										<%# Eval("Rate") %>
									</ItemTemplate>
									<EditItemTemplate>
									</EditItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridTemplateColumn HeaderStyle-Width="100">
									<ItemTemplate>
										<asp:Button ID="btnEdit" runat="server" CommandName="Edit" SkinID="EditButton"
											Text='<%# Resources.Resource.TaxRateGridEditButton %>' />
									</ItemTemplate>
									<EditItemTemplate>
									</EditItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
			<div class="col-lg-5 col-xl-3 order-1 order-lg-2">
				<div class="headInfo form-horizontal admin-content-bg-white">
					<div class="settingrow form-group">
						<gb:SiteLabel ID="lblCountry" runat="server" CssClass="settinglabel control-label"
							ConfigKey="TaxRateGridCountryHeader" />
						<div class="">
							<asp:DropDownList ID="ddCountry" runat="server" DataValueField="Guid" DataTextField="Name"
								AutoPostBack="true" Cssclass="form-control" />
						</div>
					</div>
					<div class="settingrow form-group">
						<gb:SiteLabel ID="lblGeoZone" runat="server" CssClass="settinglabel control-label"
							ConfigKey="TaxRateGridGeoZoneHeader" />
						<div class="">
							<asp:DropDownList ID="ddGeoZones" runat="server" DataValueField="Guid" DataTextField="Name"
								AutoPostBack="true" Cssclass="form-control" />
						</div>
					</div>
					<portal:HeadingPanel ID="heading" runat="server">
						<asp:Button SkinID="InsertButton" ID="btnAddNew" runat="server" />
					</portal:HeadingPanel>
				</div>
			</div>
		</div>


	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />