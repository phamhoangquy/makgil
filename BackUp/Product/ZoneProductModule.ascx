<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ZoneProductModule.ascx.cs"
    Inherits="CanhCam.Web.ProductUI.ZoneProductModule" %>
<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<Site:ProductDisplaySettings ID="displaySettings" runat="server" />
<asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>