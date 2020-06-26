<%@ Page Language="c#" CodeBehind="WarrantyEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.WarrantyPage" %>

<%@ Register Src="~/Product/Controls/AdminWarrantyItemControl.ascx" TagPrefix="Site" TagName="AdminWarrantyItemControl" %>


<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    
    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        ParentTitle="Danh sách bảo hành" ParentUrl="~/Product/AdminCP/Warranty/WarrantyList.aspx"
        CurrentPageTitle="Chỉnh sửa bảo hành" CurrentPageUrl="~/Product/AdminCP/Warranty/WarrantyEdit.aspx" />
    <div class="admin-content col-md-12">
        <asp:UpdatePanel ID="upButton" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <portal:HeadingPanel ID="heading" runat="server">
                    <asp:Button SkinID="UpdateButton" ID="btnUpdate" ValidationGroup="PaymentMethodEdit" Text="<%$Resources:Resource, UpdateButton %>" runat="server" />
                    <asp:Button SkinID="UpdateButton" ID="btnUpdateAndNew" ValidationGroup="PaymentMethodEdit" Text="<%$Resources:Resource, UpdateAndNewButton %>" runat="server" />
                    <asp:Button SkinID="UpdateButton" ID="btnUpdateAndClose" ValidationGroup="PaymentMethodEdit" Text="<%$Resources:Resource, UpdateAndCloseButton %>" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsert" ValidationGroup="PaymentMethodEdit" Text="<%$Resources:Resource, InsertButton %>" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsertAndNew" ValidationGroup="PaymentMethodEdit" Text="<%$Resources:Resource, InsertAndNewButton %>" runat="server" />
                    <asp:Button SkinID="InsertButton" ID="btnInsertAndClose" ValidationGroup="PaymentMethodEdit" Text="<%$Resources:Resource, InsertAndCloseButton %>" runat="server" />
                    <asp:Button SkinID="DeleteButton" ID="btnDelete" runat="server" Text="<%$Resources:Resource, DeleteButton %>" CausesValidation="false" />

                </portal:HeadingPanel>
                <portal:NotifyMessage ID="message" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="workplace">
            <asp:Panel ID="pnlNews" runat="server" DefaultButton="btnUpdate">
                <div id="divtabs" class="tabs">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a aria-controls="tabContent" role="tab" data-toggle="tab" href="#tabContent">
                            <asp:Literal ID="litContentTab" runat="server" /></a></li>
                        <li role="presentation" id="liWarrantyItem" runat="server">
                            <asp:Literal ID="litWarrantyItem" runat="server" /></li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tabContent">
                            <div class="form-horizontal">
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="SiteLabel1" runat="server" Text="Họ và tên"
                                        ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtFullName" MaxLength="255" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="settingrow form-group">
                                    <gb:SiteLabel ID="SiteLabel2" runat="server" Text="Số điện thoại"
                                        ForControl="ddZones" CssClass="settinglabel control-label col-sm-3" />
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtPhone" MaxLength="255" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="tabWarrantyItem" runat="server">
                            <Site:AdminWarrantyItemControl runat="server" ID="adminWarrantyItemControl" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <portal:SessionKeepAliveControl ID="ka1" runat="server" />
    </div>
</asp:Content>
