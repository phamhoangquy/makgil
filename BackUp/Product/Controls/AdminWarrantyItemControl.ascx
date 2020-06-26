<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="AdminWarrantyItemControl.ascx.cs" Inherits="CanhCam.Web.ProductUI.AdminWarrantyItemControl" %>

<%@ Import Namespace="CanhCam.Web.ProductUI" %>
<asp:UpdatePanel ID="up" runat="server">
    <ContentTemplate>
        <div class="row">
            <div class="col-md-12">
                <asp:Panel ID="pnlInsert" CssClass="form-horizontal" DefaultButton="btnInsert" runat="server">
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="SiteLabel1" runat="server" Text="Tên sản phẩm"
                            ForControl="txtPhone" CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <div class="input-group">
                                <asp:TextBox ID="txtTitle" MaxLength="255" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="SiteLabel2" runat="server" Text="Số Seri"
                            ForControl="txtPhone" CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <div class="input-group">
                                <asp:TextBox ID="txtSeri" MaxLength="255" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblEndDate" runat="server" Text="Ngày mua"
                            CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <gb:DatePickerControl ID="dpStartDate" runat="server" ShowTime="True" SkinID="product"
                                CssClass="forminput"></gb:DatePickerControl>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="SiteLabel4" runat="server" Text="Ngày hết hạn"
                            CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <asp:DropDownList runat="server" ID="ddlMonth">
                                <asp:ListItem Value="0">None</asp:ListItem>
                                <asp:ListItem Value="6">6 Tháng</asp:ListItem>
                                <asp:ListItem Value="12">12 Tháng</asp:ListItem>
                                <asp:ListItem Value="18">18 Tháng</asp:ListItem>
                                <asp:ListItem Value="24">24 Tháng</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="SiteLabel3" runat="server" Text="Ngày hết hạn"
                            CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <gb:DatePickerControl ID="dpEndDate" runat="server" ShowTime="True" SkinID="product"
                                CssClass="forminput"></gb:DatePickerControl>
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblTitle" runat="server" Text=" " CssClass="settinglabel control-label col-sm-3" />
                        <div class="col-sm-9">
                            <asp:Button SkinID="SearchButton" ID="btnInsert" Text="Thêm mới"
                                runat="server" CausesValidation="false" />
                            <asp:Button SkinID="SearchButton" ID="btnUpdate" Text="Cập nhật"
                                runat="server" CausesValidation="false" />
                            <asp:Button SkinID="DeleteButton" ID="btnDelete" Text="Xóa"
                                runat="server" CausesValidation="false" />
                        </div>
                    </div>
                    <div class="settingrow form-group">
                        <gb:SiteLabel ID="lblFileUpload" runat="server" ForControl="fileUpload" CssClass="settinglabel control-label col-sm-3" Text="Nhập tập tin (xls)" ResourceFile="ProductResources" />
                        <div class="col-sm-9">
                            <telerik:RadAsyncUpload ID="fileUpload" SkinID="radAsyncUploadSkin" MultipleFileSelection="Disabled"
                                AllowedFileExtensions="xls" runat="server" />
                            <asp:Button SkinID="DefaultButton" ID="btnImport" Text="Import" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
                <telerik:RadGrid ID="grid" SkinID="radGridSkin" runat="server">
                    <MasterTableView DataKeyNames="Id" AllowPaging="false" AllowSorting="false">
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="Sản phẩm">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtTitle"
                                        MaxLength="255" Text='<%# GetTitle(Eval("Title").ToString(),Convert.ToInt32(Eval("ProductID"))) %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Số Seri">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSeri"
                                        MaxLength="255" Text='<%# Eval("Seri").ToString() %>' runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Ngày mua">
                                <ItemTemplate>
                                    <gb:DatePickerControl ID="dpDateBuy" runat="server" ShowTime="True" SkinID="product" Text='<%# Eval("DateStartWarranty").ToString() %>'
                                        CssClass="forminput"></gb:DatePickerControl>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Ngày hết hạn">
                                <ItemTemplate>
                                    <gb:DatePickerControl ID="dpDateEnd" runat="server" ShowTime="True" SkinID="product" Text='<%# Eval("DateEndWarranty").ToString() %>'
                                        CssClass="forminput"></gb:DatePickerControl>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridClientSelectColumn HeaderStyle-Width="35" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
