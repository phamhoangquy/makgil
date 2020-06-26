﻿<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ProductNewsRelatedControl.ascx.cs" Inherits="CanhCam.Web.ProductUI.ProductNewsRelatedControl" %>

<asp:UpdatePanel ID="up" runat="server">
    <ContentTemplate>
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <asp:Panel ID="pnlSearch" CssClass="form-horizontal" DefaultButton="btnSearch" runat="server">
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblZones" runat="server" ConfigKey="ZoneLabel"
                            ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <asp:DropDownList ID="ddZones" Width="100%" AutoPostBack="false" runat="server" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblTitle" runat="server" ConfigKey="NewsFeatureName"
                            ResourceFile="NewsResources" ForControl="txtTitle" CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <div class="input-group">
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" MaxLength="255" />
                                <div class="input-group-btn">
                                    <asp:Button SkinID="SearchButton" ID="btnSearch" Text="<%$Resources:NewsResources, NewsListSearchButton %>"
                                        runat="server" CausesValidation="false" />
                                </div>
                            </div>

                        </div>
                    </div>
                </asp:Panel>
                <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                    <MasterTableView DataKeyNames="NewsGuid">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="<%$Resources:NewsResources, NewsFeatureName %>">
                                <ItemTemplate>
                                    <asp:HyperLink CssClass="cp-link" ID="Title" runat="server" Text='<%# Eval("Title").ToString() %>'
                                        NavigateUrl='<%# CanhCam.Web.NewsUI.NewsHelper.FormatNewsUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("NewsId")), Convert.ToInt32(Eval("ZoneID")))  %>'>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
            <div class="col-md-1 col-sm-1 mrt50">
                <asp:LinkButton ID="btnRemove" runat="server" CssClass="btnleft"><i class="fa fa-arrow-left text-16px"></i></asp:LinkButton>
                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btnright"><i class="fa fa-arrow-right text-16px"></i></asp:LinkButton>
            </div>
            <div class="col-md-5 col-sm-5">
                <gb:SiteLabel ID="lblRelatedProduct" runat="server" CssClass="settinglabel control-label"
                    ResourceFile="NewsResources" ConfigKey="RelatedNewsTab" />
                <telerik:RadGrid ID="gridRelated" SkinID="radGridSkin" runat="server">
                    <MasterTableView DataKeyNames="NewsGuid">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="<%$Resources:NewsResources, NewsFeatureName %>">
                                <ItemTemplate>
                                    <asp:HyperLink CssClass="cp-link" ID="Title" runat="server" Text='<%# Eval("Title").ToString() %>'
                                        NavigateUrl='<%# CanhCam.Web.NewsUI.NewsHelper.FormatNewsUrl(Eval("Url").ToString(), Convert.ToInt32(Eval("NewsId")), Convert.ToInt32(Eval("ZoneID")))  %>'>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
