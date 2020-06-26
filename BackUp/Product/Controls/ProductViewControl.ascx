<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ProductViewControl.ascx.cs"
    Inherits="CanhCam.Web.ProductUI.ProductViewControl" %>

<%@ Register TagPrefix="Site" TagName="Comment" Src="~/Product/Controls/CommentControl.ascx" %>
<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<portal:contentexpiredlabel id="expired" runat="server" enableviewstate="false" visible="false" />
<asp:Panel ID="pnlInnerWrap" runat="server">
    <site:productdisplaysettings id="displaySettings" runat="server" />
    <asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>
    <div id="divPager" runat="server" class="pages productdetailpager">
        <portal:gbcutepager id="pgr" runat="server" />
    </div>
    <site:comment id="comment" runat="server" />
</asp:Panel>