<%@ Page Language="c#" CodeBehind="CustomersList.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="CanhCam.Web.AccountUI.CustomersListPage" %>

<%--<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />--%>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:AccountResources, CustomersListTitle %>" CurrentPageUrl="~/Product/AdminCP/CustomersList.aspx" />

    <div class="admin-content">
        <%--Message Box--%>
        <portal:NotifyMessage ID="message" runat="server" />
        <%--Update, Insert, Delete Button--%>
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:HyperLink SkinID="InsertButton" ID="lnkInsert" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:Resource, DeleteSelectedButton %>"
                runat="server" CausesValidation="false" Visible="false" />
            <asp:Button SkinID="ExportButton" ID="btnExport" 
                Text="Export" runat="server" CausesValidation="false" />
        </portal:HeadingPanel>
        <%--Filter Options--%>
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" CssClass="headInfo admin-content-bg-white form-horizontal" runat="server">
            <div class="form-horizontal">
                <%--Name Filter--%>
                <div class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblNameKeyword" runat="server" ConfigKey="CustomerNameLabel"
                        ResourceFile="AccountResources" ForControl="txtNameKeyword"
                        CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtNameKeyword" runat="server" MaxLength="100" CssClass="form-control" />
                    </div>
                </div>
                <%--Email Filter--%>
                <div class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblEmailKeyword" runat="server" ConfigKey="CustomerEmailLabel"
                        ResourceFile="AccountResources" ForControl="txtEmailKeyword"
                        CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtEmailKeyword" runat="server" MaxLength="100" CssClass="form-control" />
                    </div>
                </div>
                <%--Phone Filter--%>
                <div class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblPhoneKeyword" runat="server" ConfigKey="CustomerPhoneLabel"
                        ResourceFile="AccountResources" ForControl="txtPhoneKeyword"
                        CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtPhoneKeyword" runat="server" MaxLength="50" CssClass="form-control" />
                    </div>
                </div>
                <%--Date Filter--%>
                <div class="settingrow form-group row align-items-center">
                    <gb:SiteLabel ID="lblFromDate" runat="server" ConfigKey="CustomerDateFromLabel"
                        ResourceFile="AccountResources" ForControl="dpFromDate"
                        CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <div class="form-inline justify-content-start align-items-center">
                            <gb:DatePickerControl ID="dpFromDate" ShowTime="false" runat="server" />
                            <div style="margin: 0 8px;">
                                <gb:SiteLabel ID="lblEndDate" runat="server" ConfigKey="OrderDateToLabel"
                                    ResourceFile="ProductResources" ForControl="dpToDate"
                                    CssClass="settinglabel control-label mx-8" />
                            </div>
                            <gb:DatePickerControl ID="dpToDate" ShowTime="false" runat="server" />
                        </div>
                    </div>
                </div>
                <%--Filter Button--%>
                <div class="settingrow form-group row align-items-center">
                    <div class="col-lg-6"></div>
                    <div class="col-lg-6">
                        <div class="form-inline">
                            <div class="form-group">
                                <asp:Button SkinID="DefaultButton" ID="btnSearch" Text="<%$Resources:ProductResources, OrderSearchButton %>" runat="server" CausesValidation="false" />
                            </div>
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <%--Table Display--%>
        <div class="workplace">
            <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                <MasterTableView DataKeyNames="UserID,Name,Email,Phone,TotalOrdersBought,TotalMoney,TotalConfirmedMoney,TotalUnconfirmedMoney" AllowFilteringByColumn="false">
                    <Columns>
                        <%--Name--%>
                        <telerik:GridBoundColumn HeaderText="<%$Resources:AccountResources, CustomerNameLabel %>" DataField="Name" />
                        <%--Email--%>
                        <telerik:GridBoundColumn HeaderText="<%$Resources:AccountResources, CustomerEmailLabel %>" DataField="Email" />
                        <%--Phone--%>
                        <telerik:GridBoundColumn HeaderText="<%$Resources:AccountResources, CustomerPhoneLabel %>" DataField="Phone" />
                        <%--TotalOrdersBought--%>
                        <telerik:GridBoundColumn HeaderText="<%$Resources:AccountResources, CustomerTotalOrdersBoughtLabel %>" DataField="TotalOrdersBought" />
                        <%--TotalMoney--%>
                        <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right"
                            ItemStyle-HorizontalAlign="Right"
                            HeaderText="<%$Resources:AccountResources, CustomerTotalMoneyLabel %>">
                            <ItemTemplate>
                                <%# CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("TotalMoney")), true)%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%--TotalConfirmedMoney--%>
                        <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right"
                            ItemStyle-HorizontalAlign="Right"
                            HeaderText="<%$Resources:AccountResources, CustomerTotalConfirmedMoneyLabel %>">
                            <ItemTemplate>
                                <%# CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("TotalConfirmedMoney")), true)%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%--TotalUnconfirmedMoney--%>
                        <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right"
                            ItemStyle-HorizontalAlign="Right"
                            HeaderText="<%$Resources:AccountResources, CustomerTotalUnconfirmedMoneyLabel %>">
                            <ItemTemplate>
                                <%# CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("TotalUnconfirmedMoney")), true)%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn
                            HeaderText="<%$Resources:AccountResources, CustomerPhoneReferrerLabel %>">
                            <ItemTemplate>
                                <asp:Literal runat="server" ID="litCustomerPhoneReferrer" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn
                            HeaderText="<%$Resources:AccountResources, CustomerEmailReferrerLabel %>">
                            <ItemTemplate>
                                <asp:Literal runat="server" ID="litCustomerEmailReferrer" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="cp-link btn btn-default bg-teal" ID="EditLink"
                                    runat="server" Text="<%$Resources:ProductResources, OrderDetailLink %>"
                                    NavigateUrl='<%# SiteRoot + "/Product/AdminCP/CustomerEdit.aspx?id=" + Eval("UserID") %>'>
								</asp:HyperLink>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridClientSelectColumn HeaderStyle-Width="35" Visible="false" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
</asp:Content>