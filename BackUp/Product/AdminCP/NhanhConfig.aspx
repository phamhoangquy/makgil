<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="NhanhConfig.aspx.cs" Inherits="CanhCam.Web.ProductUI.NhanhConfigPage" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <Site:ProductDisplaySettings ID="displaySettings" runat="server" />
    <div class="admin-content col-md-12">
        <portal:HeadingPanel ID="heading" runat="server"></portal:HeadingPanel>
        <asp:UpdatePanel ID="up" runat="server">
            <ContentTemplate>
                <portal:NotifyMessage ID="message" runat="server" />
                <div class="headInfo form-horizontal">
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="SiteLabel1" runat="server" ForControl="ddlZone"
                            CssClass="settinglabel control-label col-sm-3" Text="Link Listen Product Add" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox runat="server" ID="txturiListenProductAdd"></asp:TextBox>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="SiteLabel2" runat="server" ForControl="ddlZone"
                            CssClass="settinglabel control-label col-sm-3" Text="Link Listen Inventory" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox runat="server" ID="txturiListenInventory"></asp:TextBox>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblZone" runat="server" ForControl="ddlZone"
                            CssClass="settinglabel control-label col-sm-3" Text="Link Listen Order" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <asp:TextBox runat="server" ID="txturiListenOrderStatus"></asp:TextBox>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <asp:Button SkinID="DefaultButton" ID="btnSend" Text="Gửi" runat="server" />
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
