<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ManufacturerDetailModule.ascx.cs" Inherits="CanhCam.Web.ProductUI.ManufacturerDetailModule" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<Site:ProductDisplaySettings ID="displaySettings" runat="server" />
<asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>
<div id="divPager" visible="false" runat="server" class="pages">
    <portal:gbCutePager ID="pgr" runat="server" />
</div>