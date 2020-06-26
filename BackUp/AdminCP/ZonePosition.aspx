<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="ZonePosition.aspx.cs" Inherits="CanhCam.Web.AdminUI.ZonePositionPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server" ParentTitle="<%$Resources:Resource, ZoneStructureLink %>"
		ParentUrl="~/AdminCP/ZoneTree.aspx" CurrentPageTitle="<%$Resources:Resource, ZonePositionHeading %>"
		CurrentPageUrl="~/AdminCP/ZonePermission.aspx" />
	<div class="admin-content">
		<!-- <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel> -->
		<portal:NotifyMessage ID="message" runat="server" />
		<asp:UpdatePanel ID="upPages" UpdateMode="Conditional" runat="server">
			<ContentTemplate>
				<div class="workplace">
					<div class="row no-gutters">
						<div class="col-sm-5 mrt50">
							<div class="box h-p100 mb-0">
								<div class="box-body">
									<asp:ListBox ID="lstZones" runat="server" Width="100%" Height="400"
										SelectionMode="Multiple" Cssclass="p-15" />
								</div>
							</div>
						</div>
						<div class="col-sm-1 text-center mrt50">
							<div class="h-p100">
								<div class="box-body px-0">
									<asp:LinkButton ID="btnRemove" runat="server" CssClass="btnleft"><i
											class="fa fa-arrow-left text-16px"></i></asp:LinkButton>
									<asp:LinkButton ID="btnAdd" runat="server" CssClass="btnright"><i
											class="fa fa-arrow-right text-16px"></i></asp:LinkButton>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="box h-p100 mb-0">
								<div class="box-header">
									<div class="form-horizontal h-p100">
										<div class="settingrow form-group row">
											<gb:SiteLabel ID="lblPosition" runat="server" ForControl="ddlPosition"
												CssClass="settinglabel control-label col-sm-3"
												ConfigKey="ZoneSettingsPositionLabel" />
											<div class="col-sm-9">
												<asp:DropDownList ID="ddlPosition" AutoPostBack="true" runat="server"
													DataTextField="Name" DataValueField="Value"
													Cssclass="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="box-body">
									<asp:ListBox ID="lstSelectedZones" runat="server" Width="100%" Height="100%"
										SelectionMode="Multiple" Cssclass="p-15" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server">
</asp:Content>