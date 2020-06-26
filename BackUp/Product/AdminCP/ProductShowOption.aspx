<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="ProductShowOption.aspx.cs" Inherits="CanhCam.Web.ProductUI.ProductShowOptionPage" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:ProductDisplaySettings ID="displaySettings" runat="server" />
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="<%$Resources:ProductResources, ProductShowOptionTilte %>"
        CurrentPageUrl="~/Product/AdminCP/ProductShowOption.aspx" />
    <div class="admin-content col-md-12">
        <!-- <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel> -->
        <asp:UpdatePanel ID="upPanel" runat="server">
            <ContentTemplate>
                <portal:NotifyMessage ID="message" runat="server" />
                <div class="workplace no-gutters">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box h-p100 mb-0">
                                <div class="box-header">
                                    <div class="form-horizontal">
                                        <div class="settingrow form-group">
                                            <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                                                ForControl="ddZones" CssClass="settinglabel control-label" />
                                            <div class="">
                                                <asp:DropDownList ID="ddZones" Width="100%" runat="server"
                                                    CssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="settingrow form-group mb-0">
                                            <gb:SiteLabel ID="lblTitle" runat="server" ConfigKey="ProductNameLabel"
                                                ResourceFile="ProductResources" ForControl="txtTitle"
                                                CssClass="settinglabel control-label " />
                                            <div class="">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtTitle" runat="server" MaxLength="255"
                                                        CssClass="form-control" />
                                                    <div class="input-group-btn">
                                                        <asp:Button SkinID="DefaultButton" ID="btnSearch"
                                                            Text="<%$Resources:ProductResources, ProductSearchButton %>"
                                                            runat="server" CausesValidation="false"
                                                            CssClass="form-control" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <telerik:RadGrid ID="grid1" SkinID="radGridSkin" runat="server">
                                        <MasterTableView DataKeyNames="ProductId,ShowOption">
                                            <Columns>
                                                <telerik:GridTemplateColumn HeaderStyle-Width="50"
                                                    HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                                    <ItemTemplate>
                                                        <portal:MediaElement ID="ml" runat="server" Width="40"
                                                            FileUrl='<%# CanhCam.Web.ProductUI.ProductHelper.GetImageFilePath(siteSettings.SiteId, Convert.ToInt32(Eval("ProductId")), Eval("ImageFile").ToString(), Eval("ThumbnailFile").ToString()) %>' />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn
                                                    HeaderText="<%$Resources:ProductResources, ProductNameLabel %>"
                                                    DataField="Title" UniqueName="Title" SortExpression="Title"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                                    ShowFilterIcon="false" FilterControlWidth="100%">
                                                    <ItemTemplate>
                                                        <asp:HyperLink CssClass="cp-link" ID="Title" runat="server"
                                                            Text='<%# Eval("Title").ToString() %>'
                                                            NavigateUrl='<%# CanhCam.Web.ProductUI.ProductHelper.FormatProductUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneId")))  %>'>
														</asp:HyperLink>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn HeaderStyle-Width="100">
                                                    <ItemTemplate>
                                                        <asp:HyperLink CssClass="cp-link btn bg-orange" ID="EditLink" runat="server"
                                                            Text="<%$Resources:ProductResources, ProductEditLink %>"
                                                            NavigateUrl='<%# SiteRoot + "/Product/AdminCP/ProductEdit.aspx?ProductID=" + Eval("ProductID") %>'>
														</asp:HyperLink>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1 text-center mrt50">
                            <div class="h-p100">
                                <div class="box-body px-0">
                                    <asp:LinkButton ID="btnLeft" runat="server" CssClass="btnleft"><i
											class="fa fa-arrow-left text-16px"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnRight" runat="server" CssClass="btnright"><i
											class="fa fa-arrow-right text-16px"></i></asp:LinkButton>
                                    <br />
                                    <portal:gbHelpLink ID="GbHelpLink1" runat="server" RenderWrapper="false"
                                        HelpKey="productshowoption-addremove-help" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="box h-p100 mb-0">
                                <div class="box-header">
                                    <div class="settingrow form-group mb-0">
                                        <gb:SiteLabel ID="lblShowOption" runat="server" ForControl="ddlShowOption"
                                            CssClass="settinglabel control-label" ConfigKey="ShowOptionLabel"
                                            ResourceFile="ProductResources" />
                                        <div class="">
                                            <asp:DropDownList ID="ddlShowOption" AutoPostBack="true" runat="server"
                                                DataTextField="Name" DataValueField="Value" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <telerik:RadGrid ID="grid2" SkinID="radGridSkin" runat="server">
                                        <MasterTableView DataKeyNames="ProductId,ShowOption">
                                            <Columns>
                                                <telerik:GridTemplateColumn HeaderStyle-Width="50"
                                                    HeaderText="<%$Resources:ProductResources, ProductPictureHeading %>">
                                                    <ItemTemplate>
                                                        <portal:MediaElement ID="ml" runat="server" Width="40"
                                                            FileUrl='<%# CanhCam.Web.ProductUI.ProductHelper.GetImageFilePath(siteSettings.SiteId, Convert.ToInt32(Eval("ProductId")), Eval("ImageFile").ToString(), Eval("ThumbnailFile").ToString()) %>' />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn
                                                    HeaderText="<%$Resources:ProductResources, ProductNameLabel %>"
                                                    DataField="Title" UniqueName="Title" SortExpression="Title"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                                                    ShowFilterIcon="false" FilterControlWidth="100%">
                                                    <ItemTemplate>
                                                        <asp:HyperLink CssClass="cp-link" ID="Title" runat="server"
                                                            Text='<%# Eval("Title").ToString() %>'
                                                            NavigateUrl='<%# CanhCam.Web.ProductUI.ProductHelper.FormatProductUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("ProductId")), Convert.ToInt32(Eval("ZoneId")))  %>'>
														</asp:HyperLink>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn HeaderStyle-Width="100">
                                                    <ItemTemplate>
                                                        <asp:HyperLink CssClass="cp-link btn bg-orange" ID="EditLink" runat="server"
                                                            Text="<%$Resources:ProductResources, ProductEditLink %>"
                                                            NavigateUrl='<%# SiteRoot + "/Product/AdminCP/ProductEdit.aspx?ProductID=" + Eval("ProductID") %>'>
														</asp:HyperLink>
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
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />