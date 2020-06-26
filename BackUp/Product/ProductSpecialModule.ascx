<%@ Control Language="c#" AutoEventWireup="false" CodeBehind="ProductSpecialModule.ascx.cs"
    Inherits="CanhCam.Web.ProductUI.ProductSpecialModule" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<Site:ProductDisplaySettings ID="displaySettings" runat="server" />

<asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>