<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="LoginControl.ascx.cs"
    Inherits="CanhCam.Web.UI.LoginControl" %>

<div class="panel-heading">
    <gb:SiteLabel ID="lblEnterUsernamePassword" runat="server" UseLabelTag="false" />
</div>
<portal:SiteLogin ID="LoginCtrl" runat="server" CssClass="loginForm">
    <LayoutTemplate>
        <asp:Panel ID="pnlLContainer" CssClass="panel-body" runat="server" DefaultButton="Login">
            <div class="form-horizontal">
                <div class="form-group">
                    <gb:SiteLabel ID="lblEmail" runat="server" CssClass="control-label" Visible="false" ForControl="UserName" ConfigKey="SignInEmailLabel" />
                    <gb:SiteLabel ID="lblUserID" runat="server" CssClass="control-label" Visible="false" ForControl="UserName" ConfigKey="ManageUsersLoginNameLabel" />
                    <label>
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </label>
                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control" MaxLength="100" />
                </div>
                <div class="form-group">
                    <gb:SiteLabel ID="lblPassword" runat="server" CssClass="control-label" Visible="false" ForControl="Password" ConfigKey="SignInPasswordLabel" />
                    <label>
                        <i class="fa fa-lock" aria-hidden="true"></i>
                    </label>
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="password" />
                </div>
                <asp:Panel class="captcha" ID="divCaptcha" runat="server">
                    <telerik:RadCaptcha ID="captcha" runat="server" EnableRefreshImage="true"
                        CaptchaTextBoxCssClass="form-control" CaptchaTextBoxLabel="" ErrorMessage="<%$Resources:Resource, CaptchaFailureMessage %>"
                        CaptchaTextBoxTitle="<%$Resources:Resource, CaptchaInstructions %>"
                        CaptchaLinkButtonText="<%$Resources:Resource, CaptchaRefreshImage %>" />
                </asp:Panel>
                <div class="form-group forget">
                    <asp:CheckBox ID="RememberMe" runat="server" />
                </div>
                <div class="form-group hvr-shutter-out-horizontal btn-login">
                    <asp:Button CssClass="btn btn-primary" ID="Login" CommandName="Login" runat="server" Text="Login" />
                </div>
                <div class="form-group">
                    <asp:HyperLink ID="lnkPasswordRecovery" runat="server" />&nbsp;
                        <asp:HyperLink ID="lnkRegisterExtraLink" runat="server" />
                </div>
            </div>
            <portal:gbLabel ID="FailureText" runat="server" CssClass="alert alert-danger" EnableViewState="false" />
        </asp:Panel>
    </LayoutTemplate>
</portal:SiteLogin>
