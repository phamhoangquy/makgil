<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MembershipStatisticsControl.ascx.cs"
    Inherits="CanhCam.Web.MembershipStatisticsControl" %>
<ul class="userstats">
    <li>
        <asp:Image ID="imgMembership" runat="server" EnableViewState="false" />
        <gb:SiteLabel ID="Sitelabel4" runat="server" ConfigKey="SiteStatisticsMembershipLabel"
            UseLabelTag="false" />
    </li>
    <li>
        <ul class="userstats">
            <li>
                <asp:Image ID="imgNewToday" runat="server" EnableViewState="false" />
                <gb:SiteLabel ID="Sitelabel2" runat="server" ConfigKey="SiteStatisticsNewTodayLabel"
                    UseLabelTag="false" />
                <asp:Label ID="lblNewUsersToday" runat="server" EnableViewState="false" />
            </li>
            <li>
                <asp:Image ID="imgNewYesterday" runat="server" EnableViewState="false" />
                <gb:SiteLabel ID="Sitelabel3" runat="server" ConfigKey="SiteStatisticsNewYesterdayLabel"
                    UseLabelTag="false" />
                <asp:Label ID="lblNewUsersYesterday" runat="server" EnableViewState="false" />
            </li>
            <li>
                <asp:Image ID="imgTotalUsers" runat="server" EnableViewState="false" />
                <gb:SiteLabel ID="Sitelabel5" runat="server" ConfigKey="SiteStatisticsTotalUsersLabel"
                    UseLabelTag="false" />
                <asp:Label ID="lblTotalUsers" runat="server" EnableViewState="false" />
            </li>
            <li>
                <asp:Image ID="imgNewestMember" runat="server" EnableViewState="false" />
                <gb:SiteLabel ID="Sitelabel1" runat="server" ConfigKey="SiteStatisticsNewestMemberLabel"
                    UseLabelTag="false" />
                <br />
                &nbsp;&nbsp;
                <asp:Label ID="lblNewestUser" runat="server" EnableViewState="false" CssClass="username" />
            </li>
        </ul>
    </li>
</ul>
