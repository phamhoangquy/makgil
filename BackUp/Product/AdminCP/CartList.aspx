<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="CartList.aspx.cs" Inherits="CanhCam.Web.ProductUI.CartListPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:breadcrumbadmin id="breadcrumb" runat="server"
        currentpagetitle="<%$Resources:ProductResources, CartAdminTitle %>"
        currentpageurl="~/Product/AdminCP/CartList.aspx" />
    <div class="admin-content">
        <!-- <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel> -->
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <portal:notifymessage id="message" runat="server" />
                <div class="row">
                    <div class="col-12">
                        <div class="headInfo form-horizontal admin-content-bg-white">
                            <!-- <div id="divCartType" runat="server" class="settingrow form-group row align-items-center">
								<gb:SiteLabel ID="lblCartType" ForControl="ddlCartType"
									CssClass="settinglabel control-label col-sm-3 mb-0" ConfigKey="CartTypeLabel"
									ResourceFile="ProductResources" runat="server" />
								<div class="col-sm-9">
									<asp:DropDownList ID="ddlCartType" AutoPostBack="true" runat="server">
										<asp:ListItem Value="1"
											Text="<%$Resources:ProductResources, CartTypeShoppingCart %>">
										</asp:ListItem>
										<asp:ListItem Value="2"
											Text="<%$Resources:ProductResources, CartTypeWishlist %>">
										</asp:ListItem>
									</asp:DropDownList>
								</div>
							</div> -->
                            <div class="settingrow">
                                <div class="">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtOlderDays" Text="90" MaxLength="4" runat="server"
                                            CssClass="form-control" />
                                        <div class="input-group-addon">
                                            <asp:Literal ID="litDays"
                                                Text="<%$Resources:ProductResources, CartAdminDaysLabel %>"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-20">
                                    <asp:Button SkinID="DeleteButton" ID="btnDelete"
                                        Text="<%$Resources:Resource, DeleteSelectedButton %>" runat="server"
                                        CausesValidation="false" />
                                    <asp:Button SkinID="DeleteButton" ID="btnClear"
                                        Text="<%$Resources:ProductResources, CartAdminDeleteOlderThan %>" runat="server"
                                        CausesValidation="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="workplace admin-content-bg-white">
                            <telerik:radgrid id="grid" skinid="radGridSkin" runat="server">
								<MasterTableView DataKeyNames="Guid,ProductId,AttributesXml" AllowPaging="false"
									AllowSorting="false">
									<Columns>
										<telerik:GridTemplateColumn
											HeaderText="<%$Resources:ProductResources, CartAdminProduct %>">
											<ItemTemplate>
												<%# GetProductUrl(Eval("ProductUrl").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneId")), Eval("ProductTitle").ToString()) %>
												<asp:Literal ID="litAttributes" runat="server" />
											</ItemTemplate>
										</telerik:GridTemplateColumn>
										<telerik:GridTemplateColumn
											HeaderText="<%$Resources:ProductResources, CartAdminUserName %>">
											<ItemTemplate>
												<%# GetCustomerName(Convert.ToInt32(Eval("UserId")), Eval("CreatedByName").ToString(), Eval("UserGuid").ToString()) %>
											</ItemTemplate>
										</telerik:GridTemplateColumn>
										<telerik:GridBoundColumn
											HeaderText="<%$Resources:ProductResources, CartAdminQuantity %>"
											DataField="Quantity" />
										<telerik:GridBoundColumn
											HeaderText="<%$Resources:ProductResources, CartAdminIPAddress %>"
											DataField="CreatedFromIP" />
										<telerik:GridTemplateColumn
											HeaderText="<%$Resources:ProductResources, CartAdminCreatedDate %>">
											<ItemTemplate>
												<%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, "g", timeOffset)%>
											</ItemTemplate>
										</telerik:GridTemplateColumn>
										<telerik:GridClientSelectColumn HeaderStyle-Width="35" />
									</Columns>
								</MasterTableView>
							</telerik:radgrid>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <style type="text/css">
        .attributes {
            font-size: 12px;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server"></asp:Content>