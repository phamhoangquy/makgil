<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="UserActivity.aspx.cs" Inherits="CanhCam.Web.AdminUI.UserActivityPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
		CurrentPageTitle="<%$Resources:Resource, UserActivityMonitoring %>"
		CurrentPageUrl="~/AdminCP/UserActivity.aspx" />
	<div class="admin-content">
		<!-- <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel> -->
		<portal:NotifyMessage ID="message" runat="server" />
		<div class="row">
			<div class="col-12">
				<asp:Panel ID="pnlSearch" runat="server" CssClass="headInfo admin-content-bg-white"
					DefaultButton="btnSearch">
					<div class="settingrow form-group">
						<div class="input-group">
							<asp:TextBox ID="txtKeyword" placeholder="<%$Resources:Resource, SearchKeywordLabel %>"
								runat="server" MaxLength="255" CssClass="form-control" />
							<div class="input-group-append">
								<asp:Button SkinID="SearchButton" ID="btnSearch"
									Text="<%$Resources:Resource, SearchButton %>" runat="server" />
							</div>
						</div>
					</div>
					<div class="settingrow form-group">
						<div class="row">
							<div class="col-12">
								<div class="input-group">
									<asp:TextBox ID="txtOlderDays" Text="90" MaxLength="4" runat="server"
										Cssclass="form-control" />
									<div class="input-group-append btn btn-default">
										<asp:Literal ID="litDays" Text="<%$Resources:Resource, UserActivityDaysLabel %>"
											runat="server" />
									</div>
								</div>
							</div>
							<div class="col-12 mt-20">
								<asp:Button SkinID="DeleteButton" ID="btnDelete"
									Text="<%$Resources:Resource, DeleteSelectedButton %>" runat="server"
									CausesValidation="false" Cssclass="mb-20" />
								<asp:Button SkinID="DeleteButton" ID="btnClear"
									Text="<%$Resources:Resource, UserActivityDeleteOlderThan %>" runat="server"
									CausesValidation="false" />
							</div>
						</div>
					</div>
				</asp:Panel>
			</div>
			<div class="col-12">
				<div class="workplace admin-content-bg-white">
					<telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
						<MasterTableView DataKeyNames="Guid" AllowPaging="false" AllowSorting="false">
							<Columns>
								<telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityByUser %>"
									DataField="UserActivity" />
								<telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityLabel %>"
									DataField="Activity" />
								<telerik:GridBoundColumn
									HeaderText="<%$Resources:Resource, UserActivityLogForContent %>"
									DataField="LogContent" />
								<telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityFromUrl %>"
									DataField="Url" />
								<telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityIPAddress %>"
									DataField="IPAddress" />
								<telerik:GridTemplateColumn
									HeaderText="<%$Resources:Resource, UserActivityCreatedDate %>">
									<ItemTemplate>
										<%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedDate")), timeZone, "g", timeOffset)%>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
								<telerik:GridClientSelectColumn HeaderStyle-Width="35" />
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
					<portal:gbCutePager ID="pgr" Visible="false" runat="server" />
				</div>
			</div>
		</div>


	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server">
</asp:Content>