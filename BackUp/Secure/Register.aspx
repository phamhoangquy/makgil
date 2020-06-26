<%@ Page Language="c#" CodeBehind="Register.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="CanhCam.Web.UI.Pages.Register" LinePragmas="false" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:RegistrationPageDisplaySettings ID="displaySettings" runat="server" />
    <asp:Panel ID="pnlRegister" CssClass="wrap-secure wrap-register signup-page clearfix" runat="server">
        <div class="container">
            <div class="row flex flex-wrap">
                <div class="col-xs-12 col-md-10 col-lg-8 col-xl-6 offset-md-1 offset-lg-2 offset-xl-3">
                    <div class="signup-panel flex flex-wrap clearfix">
                        <div class="signup-form clearfix">
                            <h1 class="headtitle">
                                <gb:SiteLabel ID="lblRegisterLabel" runat="server" ConfigKey="RegisterLabel" UseLabelTag="false" />
                            </h1>
                            <asp:Panel ID="pnlAuthenticated" runat="server" Visible="false">
                                <asp:Literal ID="litAlreadyAuthenticated" runat="server" />
                            </asp:Panel>
                            <asp:Panel ID="pnlRegisterWrapper" runat="server">
                                <asp:Panel ID="pnlStandardRegister" runat="server">
                                    <asp:CreateUserWizard ID="RegisterUser" runat="server" NavigationStyle-HorizontalAlign="Center">
                                        <WizardSteps>
                                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                                                <ContentTemplate>
                                                    <div id="divPreamble" runat="server" class="regpreamble"></div>
                                                    <div class="form-horizontal">
                                                        <asp:Panel ID="pnlRequiredProfilePropertiesUpper" runat="server">
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlUserName" runat="server" CssClass="form-group clearfix">
                                                            <gb:SiteLabel ID="lblLoginName" runat="server" ForControl="UserName" CssClass="settinglabel control-label"
                                                                ConfigKey="RegisterLoginNameLabel" />
                                                            <div class="settingcontrol">
                                                                <asp:TextBox ID="UserName" runat="server" TabIndex="10" MaxLength="50" CssClass="form-control" />
                                                                <asp:RequiredFieldValidator ControlToValidate="UserName" ID="UserNameRequired" runat="server"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="regexUserName" runat="server" ControlToValidate="UserName"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationExpression="" ValidationGroup="profile" Enabled="false"
                                                                    SkinID="Registration"></asp:RegularExpressionValidator>
                                                                <asp:CustomValidator ID="FailSafeUserNameValidator" runat="server" ControlToValidate="UserName"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" EnableClientScript="false" SkinID="Registration"></asp:CustomValidator>
                                                                <asp:Panel ID="pnlUserNameHint" runat="server" CssClass="hint" Visible="false">
                                                                    <asp:Label ID="lblUserNameHint" runat="server" />
                                                                </asp:Panel>
                                                            </div>
                                                        </asp:Panel>
                                                        <div class="form-group clearfix">
                                                            <gb:SiteLabel ID="lblRegisterEmail1" runat="server" ForControl="Email" CssClass="settinglabel control-label"
                                                                ConfigKey="RegisterEmailLabel" />
                                                            <div class="settingcontrol">
                                                                <asp:TextBox ID="Email" runat="server" TabIndex="10" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ControlToValidate="Email" ID="EmailRequired" runat="server"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="EmailRegex" runat="server" ControlToValidate="Email"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$"
                                                                    ValidationGroup="profile" SkinID="Registration"></asp:RegularExpressionValidator>
                                                                <asp:Panel ID="pnlEmailHint" runat="server" CssClass="hint" Visible="false">
                                                                    <gb:SiteLabel ID="SiteLabel4" runat="server" ConfigKey="RegisterEmailHint" UseLabelTag="false"></gb:SiteLabel>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <asp:Panel ID="divConfirmEmail" runat="server" Visible="false" CssClass="form-group clearfix">
                                                            <gb:SiteLabel ID="SiteLabel7" runat="server" ForControl="EmailConfirm" CssClass="settinglabel control-label"
                                                                ConfigKey="RegisterEmailConfirmLabel" />
                                                            <div class="settingcontrol">
                                                                <asp:TextBox ID="ConfirmEmail" runat="server" TabIndex="10" MaxLength="100" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ControlToValidate="ConfirmEmail" ID="ConfirmEmailRequired"
                                                                    runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" Enabled="false" SkinID="Registration"></asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ControlToCompare="Email" ControlToValidate="ConfirmEmail" ID="EmailCompare"
                                                                    runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" Enabled="false" SkinID="Registration"></asp:CompareValidator>
                                                                <asp:Panel ID="pnlEmailConfirmHint" runat="server" CssClass="hint" Visible="false">
                                                                    <gb:SiteLabel ID="SiteLabel8" runat="server" ConfigKey="RegisterEmailConfirmHint"
                                                                        UseLabelTag="false" />
                                                                </asp:Panel>
                                                            </div>
                                                        </asp:Panel>
                                                        <div class="form-group clearfix">
                                                            <gb:SiteLabel ID="lblRegisterPassword1" runat="server" ForControl="Password" CssClass="settinglabel control-label"
                                                                ConfigKey="RegisterPasswordLabel" />
                                                            <div class="settingcontrol">
                                                                <telerik:RadTextBox runat="server" ID="Password" EnableViewState="false" TabIndex="10" MaxLength="20" CssClass="form-control" Width="100%" TextMode="Password" EnableSingleInputRendering="false">
                                                                    <PasswordStrengthSettings ShowIndicator="false"></PasswordStrengthSettings>
                                                                </telerik:RadTextBox>
                                                                <asp:RequiredFieldValidator ControlToValidate="Password" ID="PasswordRequired" Display="Dynamic" SetFocusOnError="true"
                                                                    runat="server" ValidationGroup="profile" SkinID="Registration"></asp:RequiredFieldValidator>
                                                                <asp:CustomValidator ID="PasswordRulesValidator" runat="server" ControlToValidate="Password"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" EnableClientScript="false" SkinID="Registration"></asp:CustomValidator>
                                                                <asp:RegularExpressionValidator ID="PasswordRegex" runat="server" ControlToValidate="Password"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:RegularExpressionValidator>
                                                                <asp:Panel ID="pnlPasswordHint" runat="server" CssClass="hint" Visible="false">
                                                                    <gb:SiteLabel ID="SiteLabel5" runat="server" ConfigKey="RegisterPasswordHint" UseLabelTag="false" />
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="form-group clearfix">
                                                            <gb:SiteLabel ID="lblRegisterConfirmPassword1" runat="server" ForControl="ConfirmPassword"
                                                                CssClass="settinglabel control-label" ConfigKey="RegisterConfirmPasswordLabel" />
                                                            <div class="settingcontrol">
                                                                <asp:TextBox ID="ConfirmPassword" EnableViewState="false" runat="server" TabIndex="10" TextMode="Password"
                                                                    MaxLength="20" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" ID="ConfirmPasswordRequired"
                                                                    runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:RequiredFieldValidator>
                                                                <asp:CompareValidator ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                                                    ID="PasswordCompare" runat="server" Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile"
                                                                    SkinID="Registration"></asp:CompareValidator>
                                                                <asp:Panel ID="pnlConfirmPasswordHint" runat="server" CssClass="hint" Visible="false">
                                                                    <gb:SiteLabel ID="SiteLabel6" runat="server" ConfigKey="RegisterConfirmPasswordHint"
                                                                        UseLabelTag="false" />
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="form-group clearfix" id="divQuestion" runat="server">
                                                            <gb:SiteLabel ID="SiteLabel2" runat="server" ForControl="Question" CssClass="settinglabel control-label"
                                                                ConfigKey="RegisterSecurityQuestion" />
                                                            <div class="settingcontrol">
                                                                <asp:TextBox ID="Question" runat="server" TabIndex="10" CssClass="form-control" />
                                                                <asp:RequiredFieldValidator ControlToValidate="Question" ID="QuestionRequired" runat="server"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <div class="form-group clearfix" id="divAnswer" runat="server">
                                                            <gb:SiteLabel ID="SiteLabel1" runat="server" ForControl="Answer" CssClass="settinglabel control-label"
                                                                ConfigKey="RegisterSecurityAnswer" />
                                                            <div class="settingcontrol">
                                                                <asp:TextBox ID="Answer" runat="server" TabIndex="10" CssClass="form-control" />
                                                                <asp:RequiredFieldValidator ControlToValidate="Answer" ID="AnswerRequired" runat="server"
                                                                    Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                        <asp:Panel ID="pnlRequiredProfileProperties" runat="server">
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlSubscribe" CssClass="form-group clearfix reg-subscribe" runat="server" Visible="false">
                                                            <div class="settingcontrol">
                                                                <asp:CheckBox ID="chkSubscribe" runat="server" />
                                                                <asp:Label ID="lblNewsletterListHeading" runat="server" CssClass="letterlist" />
                                                            </div>
                                                        </asp:Panel>
                                                        <asp:Panel CssClass="form-group clearfix captcha reg-captcha" ID="divCaptcha" runat="server">
                                                            <gb:SiteLabel ID="litCaptcha" runat="server" ForControl="captcha" CssClass="settinglabel control-label"
                                                                ConfigKey="CaptchaInstructions" />
                                                            <div class="settingcontrol">
                                                                <telerik:RadCaptcha ID="captcha" runat="server" ValidationGroup="profile" EnableRefreshImage="true"
                                                                    CaptchaTextBoxLabel="" ErrorMessage="<%$Resources:Resource, CaptchaFailureMessage %>"
                                                                    CaptchaTextBoxCssClass="form-control"
                                                                    CaptchaTextBoxTitle="<%$Resources:Resource, CaptchaInstructions %>"
                                                                    CaptchaLinkButtonText="<%$Resources:Resource, CaptchaRefreshImage %>" />
                                                            </div>
                                                        </asp:Panel>
                                                        <div id="divAgreement" runat="server" class="regagree">
                                                        </div>
                                                        <div class="confirm clearfix">
                                                                <asp:CheckBox ID="chkAgree" runat="server" />
                                                                <asp:CustomValidator runat="server" ID="MustAgree" EnableClientScript="true" OnClientValidate="CheckBoxRequired_ClientValidate"
                                                                    Enabled="false" Display="Dynamic" SetFocusOnError="true" ValidationGroup="profile" SkinID="Registration"></asp:CustomValidator>
                                                        </div>
                                                        <portal:gbLabel ID="ErrorMessage" runat="server" CssClass="settingcontrol regerror" />
                                                        <div class="hvr-shutter-out-horizontal btn-login">
                                                                <portal:gbRegisterButton SkinID="DefaultButton" ID="StartNextButton" runat="server" CommandName="MoveNext"
                                                                    Text="Next" ValidationGroup="profile" CausesValidation="true" />
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:CreateUserWizardStep>
                                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                                                <ContentTemplate>
                                                    <div class="regcomplete">
                                                        <asp:Panel ID="pnComplete" runat="server"></asp:Panel>
                                                        <portal:gbLabel ID="CompleteMessage" runat="server" />
                                                        <asp:Button SkinID="DefaultButton" ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                            ValidationGroup="CreateUserWizard1" />
                                                    </div>
                                                    <div class="clear"></div>
                                                </ContentTemplate>
                                            </asp:CompleteWizardStep>
                                        </WizardSteps>
                                        <StartNavigationTemplate>
                                        </StartNavigationTemplate>
                                    </asp:CreateUserWizard>
                                    <asp:Literal ID="litTest" runat="server" />
                                </asp:Panel>
                                <asp:Panel ID="pnlThirdPartyAuth" runat="server" Visible="false" CssClass="clearpanel thirdpartyauth">
                                    <h2>
                                        <asp:Literal ID="litThirdPartyAuthHeading" runat="server" /></h2>
                                    <asp:Panel ID="pnlWindowsLiveID" runat="server" CssClass="windowslivepanel" Visible="false">
                                        <asp:HyperLink ID="lnkWindowsLiveID" runat="server" NavigateUrl="~/Secure/RegisterWithWindowsLiveID.aspx" />
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="divLiteralOr" runat="server" Visible="false" CssClass="clearpanel orpanel">
                                        <asp:Literal ID="litOr" runat="server" /><br />
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlOpenID" runat="server" CssClass="openidpanel" Visible="false">
                                        <asp:HyperLink ID="lnkOpenIDRegistration" runat="server" NavigateUrl="~/Secure/RegisterWithOpenID.aspx" />
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlRpx" runat="server" CssClass="openidpanel" Visible="false">
                                        <portal:OpenIdRpxNowLink ID="rpxLink" runat="server" />
                                        <br />
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
