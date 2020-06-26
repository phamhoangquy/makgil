<%@ Page Language="c#" CodeBehind="GoogleFeedEdit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.ProductUI.GoogleFeedEdit" %>



<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">

    <portal:BreadcrumbAdmin ID="breadcrumb" runat="server"
        CurrentPageTitle="Chỉnh sửa Google Feed Category" CurrentPageUrl="~/Product/AdminCP/Feed/GoogleFeedEdit.aspx" />
    
    <div class="admin-content col-md-12">
                <portal:NotifyMessage ID="message" runat="server" />
        <div class="workplace">
            <div class="form-horizontal">
                <div class="settingrow form-group">
                    <gb:SiteLabel ID="lblFromDate" runat="server" ConfigKey="ZoneLabel" ForControl="ddlZones" CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <asp:DropDownList runat="server" ID="ddlZones" AutoPostBack="true" />
                    </div>
                </div>
                <div class="settingrow form-group">
                    <gb:SiteLabel ID="SiteLabel1" runat="server" Text="Google categoryId" ForControl="dpFromDate" CssClass="settinglabel control-label col-sm-3" />
                    <div class="col-sm-9">
                        <div class="input-group">
                            <asp:TextBox ID="txtCategoryId" runat="server" MaxLength="255" />
                            <div class="input-group-btn">
                                <asp:Button SkinID="DefaultButton" ID="btnUpdate" Text="<%$Resources:ProductResources, ProductUpdateButton %>"
                                    runat="server" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>



            </div>


        </div>
    </div>
</asp:Content>
