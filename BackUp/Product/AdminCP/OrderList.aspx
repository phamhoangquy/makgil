﻿<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="OrderList.aspx.cs" Inherits="CanhCam.Web.ProductUI.OrderListPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:ProductResources, OrderAdminTitle %>"
        CurrentPageUrl="~/Product/AdminCP/OrderList.aspx" />
    <div class="admin-content">

        <portal:NotifyMessage ID="message" runat="server" />
        <portal:HeadingPanel ID="heading" runat="server">
            <asp:HyperLink SkinID="InsertButton" ID="lnkInsert" Text="<%$Resources:Resource, InsertButton %>"
                runat="server" />
            <asp:Button SkinID="ExportButton" ID="btnExport" OnClick="btnExport_Click"
                Text="<%$Resources:ProductResources, OrderExportButton %>" runat="server" CausesValidation="false" />
            <asp:Button SkinID="ExportButton" ID="btnExportByProduct" OnClick="btnExportByProduct_Click" Visible="false"
                Text="<%$Resources:ProductResources, OrderExportByProductButton %>" runat="server"
                CausesValidation="false" />
            <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="<%$Resources:Resource, DeleteSelectedButton %>"
                runat="server" CausesValidation="false" />
        </portal:HeadingPanel>
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" CssClass="headInfo admin-content-bg-white form-horizontal"
            runat="server">
            <div class="settingrow form-group row align-items-center">
                <gb:SiteLabel ID="lblKeyword" runat="server" ConfigKey="OrderKeywordLabel"
                    ResourceFile="ProductResources" ForControl="txtKeyword"
                    CssClass="settinglabel control-label col-sm-3" />
                <div class="col-sm-9">
                    <asp:TextBox ID="txtKeyword" placeholder="<%$Resources:ProductResources, OrderKeywordTip %>"
                        runat="server" MaxLength="255" CssClass="form-control" />
                </div>
            </div>
            <div class="settingrow form-group row align-items-center">
                <gb:SiteLabel ID="lblOrderStatus" runat="server" ConfigKey="OrderStatusLabel"
                    ResourceFile="ProductResources" ForControl="ddOrderStatus"
                    CssClass="settinglabel control-label col-sm-3" />
                <div class="col-sm-9">
                    <asp:DropDownList ID="ddOrderStatus" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="settingrow form-group row align-items-center">
                <gb:SiteLabel ID="lblFromDate" runat="server" ConfigKey="OrderDateFromLabel"
                    ResourceFile="ProductResources" ForControl="dpFromDate"
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
            <div class="settingrow form-group row align-items-center">
                <div class="offset-sm-3 col-sm-9">
                    <asp:Button SkinID="DefaultButton" ID="btnSearch"
                        Text="<%$Resources:ProductResources, OrderSearchButton %>" runat="server"
                        CausesValidation="false" />
                </div>
            </div>
        </asp:Panel>
        <div class="row">
            <div class="col-12">
                <div class="workplace admin-content-bg-white">
                    <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                        <MasterTableView DataKeyNames="OrderId,OrderStatus" AllowSorting="false">
                            <Columns>
                                <telerik:GridTemplateColumn HeaderStyle-Width="35"
                                    HeaderText="<%$Resources:Resource, RowNumber %>">
                                    <ItemTemplate>
                                        <%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, OrderCodeLabel %>"
                                    DataField="OrderCode" />
                                <telerik:GridTemplateColumn
                                    HeaderText="<%$Resources:ProductResources, OrderCustomerLabel %>">
                                    <ItemTemplate>
                                        <%# CanhCam.Web.ProductUI.OrderHelper.GetCustomer(Eval("BillingFirstName").ToString(), Eval("BillingLastName").ToString()) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn
                                    HeaderText="<%$Resources:ProductResources, OrderCreatedDateLabel %>">
                                    <ItemTemplate>
                                        <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, Resources.ProductResources.OrderCreatedDateFormat, timeOffset)%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn
                                    HeaderText="<%$Resources:ProductResources, OrderStatusLabel %>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrderStatus"
                                            ForeColor='<%#CanhCam.Web.ProductUI.OrderHelper.GetForeColor(Convert.ToInt32(Eval("OrderStatus")))%>'
                                            Text='<%# CanhCam.Web.ProductUI.ProductHelper.GetOrderStatus(Convert.ToInt32(Eval("OrderStatus"))) %>'
                                            runat="server" />
                                        <asp:DropDownList ID="ddOrderStatus"
                                            OnSelectedIndexChanged="ddOrderStatus_SelectedIndexChanged"
                                            AutoPostBack="false" Visible="false" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right"
                                    ItemStyle-HorizontalAlign="Right"
                                    HeaderText="<%$Resources:ProductResources, OrderTotalLabel %>">
                                    <ItemTemplate>
                                        <%# CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("OrderTotal")), true)%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:HyperLink CssClass="cp-link btn btn-default bg-teal" ID="lnkQuickView"
                                            NavigateUrl="#" runat="server"
                                            Text="<%$Resources:ProductResources, OrderQuickViewLink %>">
										</asp:HyperLink>
                                        <asp:HyperLink CssClass="cp-link btn btn-default bg-teal" ID="EditLink"
                                            runat="server" Text="<%$Resources:ProductResources, OrderDetailLink %>"
                                            NavigateUrl='<%# SiteRoot + "/Product/AdminCP/OrderEdit.aspx?OrderID=" + Eval("OrderId") %>'>
										</asp:HyperLink>
                                        <a id="lnkPrint" style="display: inline-block; padding-left: 5px" runat="server" onclick='<%# "printOrder(" + Eval("OrderId").ToString() + ")" %>' href="javascript:;"><i class="fa fa-print"></i>In</a>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadToolTipManager ID="RadToolTipManager1" runat="server" Position="BottomCenter"
                        Width="960" RelativeTo="Element" OnAjaxUpdate="OnAjaxUpdate" HideEvent="ManualClose"
                        ShowEvent="OnClick" EnableDataCaching="true">
                    </telerik:RadToolTipManager>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .RadToolTip td.rtWrapperContent {
            background: none repeat scroll 0 0 #dbf4cd !important;
            border: 1px solid #dbf4cd !important;
        }

        .OrderPopup {
            color: #4e4f4f;
            font-family: Arial !important;
            margin: 10px 0;
            width: 100%;
        }

            .OrderPopup .BillingDetails,
            .OrderPopup .ShippingDetails {
                width: 32%;
            }

            .OrderPopup .OrderProducts {
                width: 36%;
            }

                .OrderPopup .Key,
                .OrderPopup .Value,
                .OrderPopup .OrderProducts .Key,
                .OrderPopup .OrderProducts .Price,
                .OrderPopup .OrderProducts td {
                    background: none repeat scroll 0 0 #dbf4cd !important;
                    border: medium none !important;
                    height: auto !important;
                    padding: 4px !important;
                }

            .OrderPopup .BillingDetails .Key,
            .OrderPopup .ShippingDetails .Key {
                background: none repeat scroll 0 0 #dbf4cd !important;
                border: medium none;
                vertical-align: top;
                width: 130px;
            }

            .OrderPopup .BillingDetails .Value,
            .OrderPopup .ShippingDetails .Value {
                background: none repeat scroll 0 0 #dbf4cd !important;
                border: medium none;
                vertical-align: top;
            }

            .OrderPopup .Seperator {
                background: #9fce8c none repeat scroll 0 0 !important;
                border: medium none !important;
                padding: 1px;
            }

            .OrderPopup .QuickViewPanel {
                background: none repeat scroll 0 0 #dbf4cd !important;
                border: medium none !important;
                vertical-align: top;
                padding-left: 5px;
            }

            .OrderPopup h5 {
                font-size: 13px;
                font-weight: bold;
                margin: 0 0 4px;
                padding-bottom: 5px;
            }

            .OrderPopup .OrderProducts .Key {
                text-align: right;
            }

            .OrderPopup .OrderProducts .Price {
                text-align: right;
                width: 100px;
            }

            .OrderPopup .OrderProducts .Seperator {
                margin: 10px 0;
            }
    </style>
    <script type="text/javascript">
        function printOrder(orderId) {
            $.ajax({
                url: "/Product/Services/OrderPrint.ashx",
                type: "GET",
                dataType: "html",
                data: {
                    id: orderId
                },
                cache: !0,
                success: function (data) {
                    var oldstr = document.body.innerHTML;
                    document.body.innerHTML = "<html><head><title></title></head><body>" + data + "</body>";
                    window.print();
                    document.body.innerHTML = oldstr;
                }
            })

            return false;
        }
    </script>
</asp:Content>