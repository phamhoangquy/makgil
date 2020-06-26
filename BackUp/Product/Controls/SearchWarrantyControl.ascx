<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="SearchWarrantyControl.ascx.cs"
    Inherits="CanhCam.Web.ProductUI.SearchWarrantyControl" %>

<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <section class="cello-baohanh">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="cello-title">
                            <h2>Tra cứu thông tin bảo hành</h2>
                            <p>Quý khách vui lòng điền số serial sản phẩm hoặc số điện thoại khi mua hàng, chỉ áp dụng cho sản mua tại Cello</p>
                        </div>
                        <div class="search-main">
                            <div class="custom-select">
                                <asp:DropDownList runat="server" ID="ddlSearchType" AutoPostBack="true">
                                    <asp:ListItem Value="1" Text="Số điện thoại" />
                                    <asp:ListItem Value="2" Text="Số serial" />
                                </asp:DropDownList>
                            </div>
                            <div class="text-input">
                                <asp:TextBox runat="server" ID="txtKeyWord" placeholder="Nhập số serial của thiết bị HOẶC số điện thoại..." />
                                <asp:LinkButton ID="btnSearch" runat="server"><em class="fas fa-search"></em></asp:LinkButton>
                            </div>
                        </div>
                        <asp:Xml ID="xmlTransformer" runat="server"></asp:Xml>

                    </div>
                    <div class="col-lg-6">
                        <div class="note-wrapper">
                            <asp:Literal runat="server" ID="litNote" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </ContentTemplate>
</asp:UpdatePanel>
