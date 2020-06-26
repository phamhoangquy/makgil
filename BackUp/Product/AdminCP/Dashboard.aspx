<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="Dashboard.aspx.cs" Inherits="CanhCam.Web.ProductUI.DashboardPage" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="Báo cáo tổng quan" CurrentPageUrl="~/Product/AdminCP/Dashboard.aspx" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel>
        <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <telerik:RadHtmlChart ID="chart" Height="400" runat="server">
                <PlotArea>
                    <Series>
                        <telerik:ColumnSeries DataFieldY="OrderTotal">
                            <LabelsAppearance DataFormatString="{0:#,##0}"></LabelsAppearance>
                            <TooltipsAppearance DataFormatString="{0:#,##0}" Visible="true"></TooltipsAppearance>
                            <Appearance>
                                <FillStyle BackgroundColor="#30abf2" />
                            </Appearance>
                        </telerik:ColumnSeries>
                    </Series>
                    <XAxis DataLabelsField="Time" BaseUnit="Days">
                        <%--<TitleAppearance Text="Thời gian"></TitleAppearance>--%>
                        <MinorGridLines Visible="false"></MinorGridLines>
                        <MajorGridLines Visible="false"></MajorGridLines>
                        <LabelsAppearance RotationAngle="0" DataFormatString="{d}"></LabelsAppearance>
                    </XAxis>
                    <YAxis>
                        <%--<TitleAppearance Text="Doanh thu"></TitleAppearance>--%>
                        <MinorGridLines Visible="false"></MinorGridLines>
                        <LabelsAppearance DataFormatString="{0:#,##0}"></LabelsAppearance>
                    </YAxis>
                </PlotArea>
                <Legend>
                    <Appearance Position="Bottom"></Appearance>
                </Legend>
                <ChartTitle Text="Doanh thu tháng này"></ChartTitle>
            </telerik:RadHtmlChart>
            <asp:UpdatePanel ID="up" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddDateRange" AutoPostBack="true" Width="350" runat="server">
                        <asp:ListItem Text="Hôm nay" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Hôm qua" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Tuần này" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Tháng này" Selected="True" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Literal ID="litOrderCount" Text="0" runat="server"></asp:Literal>
                    đơn hàng

                    <div class="row">
                        <section class="col-lg-7 connectedSortable">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="ion ion-clipboard mr-1"></i>Đơn hàng mới nhất&nbsp;

                                        <a class="btn btn-xs btn-info btn-flat margin-l-10" href="/Product/AdminCP/OrderList.aspx">Xem tất cả</a>
                                    </h3>
                                </div>
                                <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server" PageSize="10">
                                    <MasterTableView DataKeyNames="OrderId,OrderStatus" AllowSorting="false" AllowPaging="false">
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="35" HeaderText="<%$Resources:Resource, RowNumber %>">
                                                <ItemTemplate>
                                                    <%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, OrderCodeLabel %>" DataField="OrderCode" />
                                            <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderCustomerLabel %>">
                                                <ItemTemplate>
                                                    <%# CanhCam.Web.ProductUI.OrderHelper.GetCustomer(Eval("BillingFirstName").ToString(), Eval("BillingLastName").ToString()) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderCreatedDateLabel %>">
                                                <ItemTemplate>
                                                    <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, Resources.ProductResources.OrderCreatedDateFormat, timeOffset)%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="<%$Resources:ProductResources, OrderStatusLabel %>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOrderStatus" ForeColor='<%#CanhCam.Web.ProductUI.OrderHelper.GetForeColor(Convert.ToInt32(Eval("OrderStatus")))%>' Text='<%# CanhCam.Web.ProductUI.ProductHelper.GetOrderStatus(Convert.ToInt32(Eval("OrderStatus"))) %>' runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderTotalLabel %>">
                                                <ItemTemplate>
                                                    <%# CanhCam.Web.ProductUI.ProductHelper.FormatPrice(Convert.ToDecimal(Eval("OrderTotal")), true)%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <%--<asp:HyperLink CssClass="cp-link" ID="lnkQuickView" NavigateUrl="#" runat="server"
                                        Text="<%$Resources:ProductResources, OrderQuickViewLink %>">
                                    </asp:HyperLink>--%>
                                                    <asp:HyperLink CssClass="cp-link" ID="EditLink" runat="server"
                                                        Text="<%$Resources:ProductResources, OrderDetailLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/OrderEdit.aspx?OrderID=" + Eval("OrderId") %>'>
                                            </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                        </section>
                        <section class="col-lg-5 connectedSortable">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="ion ion-clipboard mr-1"></i>Sản phẩm bán chạy&nbsp;
                            </h3>
                                </div>
                                <telerik:RadGrid ID="gridBestsellers" SkinID="radGridSkin" runat="server" PageSize="10">
                                    <MasterTableView AllowSorting="false" AllowPaging="false">
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="35" HeaderText="<%$Resources:Resource, RowNumber %>">
                                                <ItemTemplate>
                                                    <%# (grid.PageSize * grid.CurrentPageIndex) + Container.ItemIndex + 1%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, ProductCodeLabel %>" DataField="Code" UniqueName="Code" />
                                            <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, ProductNameLabel %>" DataField="Title" />
                                            <telerik:GridBoundColumn HeaderText="<%$Resources:ProductResources, OrderQuantityLabel %>" DataField="Quantity" />
                                            <telerik:GridTemplateColumn HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="<%$Resources:ProductResources, OrderTotalLabel %>" DataField="SubTotal">
                                                <ItemTemplate>
                                                    <%# Eval("OrderTotalFormat") %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="100">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="EditLink" runat="server"
                                                        Text="<%$Resources:ProductResources, OrderDetailLink %>" NavigateUrl='<%# SiteRoot + "/Product/AdminCP/ProductEdit.aspx?ProductID=" + Eval("ProductId") %>'>
                                            </asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                            <%--<!-- Map card -->
                <div class="card bg-gradient-primary">
                  <div class="card-header border-0">
                    <h3 class="card-title">
                      <i class="fas fa-map-marker-alt mr-1"></i>
                      Visitors
                    </h3>
                    <!-- card tools -->
                    <div class="card-tools">
                      <button type="button"
                              class="btn btn-primary btn-sm daterange"
                              data-toggle="tooltip"
                              title="Date range">
                        <i class="far fa-calendar-alt"></i>
                      </button>
                      <button type="button"
                              class="btn btn-primary btn-sm"
                              data-card-widget="collapse"
                              data-toggle="tooltip"
                              title="Collapse">
                        <i class="fas fa-minus"></i>
                      </button>
                    </div>
                    <!-- /.card-tools -->
                  </div>
                  <div class="card-body">
                    <div id="world-map" style="height: 250px; width: 100%;"></div>
                  </div>
                  <!-- /.card-body-->
                  <div class="card-footer bg-transparent">
                    <div class="row">
                      <div class="col-4 text-center">
                        <div id="sparkline-1"></div>
                        <div class="text-white">Visitors</div>
                      </div>
                      <!-- ./col -->
                      <div class="col-4 text-center">
                        <div id="sparkline-2"></div>
                        <div class="text-white">Online</div>
                      </div>
                      <!-- ./col -->
                      <div class="col-4 text-center">
                        <div id="sparkline-3"></div>
                        <div class="text-white">Sales</div>
                      </div>
                      <!-- ./col -->
                    </div>
                    <!-- /.row -->
                  </div>
                </div>
                <!-- /.card -->

                <!-- solid sales graph -->
                <div class="card bg-gradient-info">
                  <div class="card-header border-0">
                    <h3 class="card-title">
                      <i class="fas fa-th mr-1"></i>
                      Sales Graph
                    </h3>

                    <div class="card-tools">
                      <button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
                        <i class="fas fa-minus"></i>
                      </button>
                      <button type="button" class="btn bg-info btn-sm" data-card-widget="remove">
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                  </div>
                  <div class="card-body">
                    <canvas class="chart" id="line-chart" style="height: 250px;"></canvas>
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer bg-transparent">
                    <div class="row">
                      <div class="col-4 text-center">
                        <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60"
                               data-fgColor="#39CCCC">

                        <div class="text-white">Mail-Orders</div>
                      </div>
                      <!-- ./col -->
                      <div class="col-4 text-center">
                        <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60"
                               data-fgColor="#39CCCC">

                        <div class="text-white">Online</div>
                      </div>
                      <!-- ./col -->
                      <div class="col-4 text-center">
                        <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60"
                               data-fgColor="#39CCCC">

                        <div class="text-white">In-Store</div>
                      </div>
                      <!-- ./col -->
                    </div>
                    <!-- /.row -->
                  </div>
                  <!-- /.card-footer -->
                </div>--%>
                            <!-- /.card -->
                        </section>
                    </div>
                    <%--<div class="card direct-chat direct-chat-primary">
                <div class="card-header">
                    <h3 class="card-title">Hoạt động quản trị</h3>
                </div>
                <telerik:RadGrid ID="gridActivity" SkinID="radGridSkin" runat="server">
                    <MasterTableView DataKeyNames="Guid" AllowPaging="false" AllowSorting="false" PageSize="5">
                        <Columns>
                            <telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityByUser %>" DataField="UserActivity" />
                            <telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityLabel %>" DataField="Activity" />
                            <telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityLogForContent %>" DataField="LogContent" />
                            <telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityFromUrl %>" DataField="Url" />
                            <telerik:GridBoundColumn HeaderText="<%$Resources:Resource, UserActivityIPAddress %>" DataField="IPAddress" />
                            <telerik:GridTemplateColumn HeaderText="<%$Resources:Resource, UserActivityCreatedDate %>">
                                <ItemTemplate>
                                    <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedDate")), timeZone, "g", timeOffset)%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>--%>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>