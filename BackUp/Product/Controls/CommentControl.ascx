<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="CommentControl.ascx.cs"
    Inherits="CanhCam.Web.ProductUI.CommentControl" %>

<%@ Register TagPrefix="Site" Assembly="CanhCam.Features.Product" Namespace="CanhCam.Web.ProductUI" %>
<Site:ProductDisplaySettings ID="displaySettings" runat="server" />

<div id="pnlFeedback" visible="false" data-type="0" runat="server" class="">

    <div class="product-review">
        <div class="medium-title">Đánh giá trung bình</div>
        <div class="medium-rating">
            <div class="point">
                <asp:Literal runat="server" ID="litAVGRating" />
            </div>
            <div id="divProductRating" runat="server" class="rating stars rating-plg"></div>
            <div class="total-comment">
                <asp:Literal runat="server" ID="litCommentCount" />
            </div>
        </div>
        <div class="start-overview">
            <ul class="charts">
                <li class="chart">
                    <label>5 <i class="fas fa-star"></i></label>
                    <div class="progress">
                        <div class="progress-bar" runat="server" id="progress5" role="progressbar" style="width: 76%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="percent">
                        <asp:Literal runat="server" ID="litPercent5" />
                    </div>
                </li>
                <li class="chart">
                    <label>4 <i class="fas fa-star"></i></label>
                    <div class="progress">
                        <div class="progress-bar" runat="server" id="progress4" role="progressbar" style="width: 76%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="percent">
                        <asp:Literal runat="server" ID="litPercent4" />
                    </div>
                </li>
                <li class="chart">
                    <label>3 <i class="fas fa-star"></i></label>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" runat="server" id="progress3" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="percent">
                        <asp:Literal runat="server" ID="litPercent3" />

                    </div>
                </li>
                <li class="chart">
                    <label>2 <i class="fas fa-star"></i></label>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="0" runat="server" id="progress2" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="percent">
                        <asp:Literal runat="server" ID="litPercent2" />
                    </div>
                </li>
                <li class="chart">
                    <label>1 <i class="fas fa-star"></i></label>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" runat="server" id="progress1" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="percent">
                        <asp:Literal runat="server" ID="litPercent1" />

                    </div>
                </li>
            </ul>
        </div>

        <div class="btn-wrap text-center"><a class="btn-comment" href="#!">Viết đánh giá của bạn</a></div>
        <div class="comment-form">
            <div class="module-title">GỬI ĐÁNH GIÁ CỦA BẠN</div>
            <div class="form-wrap">
                <div class="form-group rating">
                    <label>Đánh giá của bạn về sản phẩm này:</label>

                    <div id="divStar" runat="server" data-score="4" class="rating rating-input rating-plg"></div>
                    <%-- <div class="rating-input">
                        <ul>
                            <li class="active"><a href="#!"><i class="fas fa-star"></i></a></li>
                            <li class="active"><a href="#!"><i class="fas fa-star"></i></a></li>
                            <li><a href="#!"><i class="fas fa-star"></i></a></li>
                            <li><a href="#!"><i class="fas fa-star"></i></a></li>
                            <li><a href="#!"><i class="fas fa-star"></i></a></li>
                        </ul>
                    </div>--%>
                </div>
                <div class="form-group">
                    <input class="txtFullName" placeholder="Mời bạn nhập tên (Bắt buộc)" type="text" />
                    <%--<input type="text" placeholder="Nhập tiêu đề đánh giá (không bắt buộc)">--%>
                </div>
                <div class="form-group">
                    <input class="txtEmail" placeholder="Mời bạn nhập email (Không bắt buộc)" type="text" />
                </div>
                <div class="form-group">
                    <%--<textarea name="" cols="3" rows="3" placeholder="Đánh giá của bạn về sản phẩm này"></textarea>--%>
                    <textarea class="journalContent" placeholder="Đánh giá của bạn về sản phẩm này" cols="3" rows="3"></textarea>
                </div>
                <%--<input type="submit" value="Gửi đánh giá">--%>
                <a href="#" class="btnShare">Gửi bình luận</a>
            </div>
        </div>
        <%--      <div class="journalInfo">
            <div>Đánh giá của bạn về sản phẩm này</div>
        </div>
        <div class="journalPlaceholder">Mời bạn thảo luận hoặc đánh giá về sản phẩm này</div>--%>
    </div>


    <div class="comment-list">
        <%--  <div class="sort">
            <label>Sắp xếp theo</label>
            <select name="">
                <option>Mới nhât</option>
            </select>
        </div>--%>

        <div class="comment-items">
            <asp:Repeater ID="rptCommentTop" runat="server">
                <ItemTemplate>

                    <div class="item">
                        <div class="user">
                            <div class="img">
                                <img src="/Data/Sites/1/media/default/img/avt.png" alt="">
                            </div>
                            <div class="name">
                                <%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"FullName").ToString()) %>
                            </div>
                            <time><%# CommentHelper.GetTimeAgo(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, timeOffset) %></time>
                        </div>
                        <div class="caption">

                            <div data-score="<%#Convert.ToInt32(Eval("Rating")) %>" class="rating rating-input"></div>
                            <%--  <div class="rating">
                                <ul>
                                    <li class="active"><i class="fas fa-star"></i></li>
                                    <li class="active"><i class="fas fa-star"></i></li>
                                    <li class="active"><i class="fas fa-star"></i></li>
                                    <li class="active"><i class="fas fa-star"></i></li>
                                    <li><i class="fas fa-star"></i></li>
                                </ul>
                            </div>--%>
                            <div class="title"><%# CommentHelper.GetLevelRating(Convert.ToInt32(Eval("Rating"))) %></div>
                            <span class="cmlike">
                                <%# CommentHelper.GetLikeText(Convert.ToInt32(Eval("CommentId"))) %>
                                <i class="iconcom-likecomm"></i>
                                <span><%#Eval("HelpfulYesTotal")%></span>
                            </span>
                            <abbr title='<%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, "g", timeOffset) %>'>
                                <%# CommentHelper.GetTimeAgo(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, timeOffset) %>
                            </abbr>
                            <div class="des">
                                <%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"ContentText").ToString()).Replace("\n", "<br/>").Replace("\r\n", "<br />") %>
                            </div>
                            <a class="sharelink" href="#!">Chia sẻ facebook</a>
                        </div>
                    </div>
                    <%--        <div class="asktop">
                    <div class="author">
                        <i class="iconcom"></i>
                    </div>
                    <div class="journalitem">
                        <div class="journalsummary">
                            <strong></strong>
                            <span class="top-comment">Bình luận được ưa thích</span>
                            <div>
                            </div>
                        </div>
                        <div class="journalfooter">
                        </div>
                    </div>
                </div>--%>
                </ItemTemplate>
            </asp:Repeater>
            <div class="journalItems">
                <asp:Repeater ID="rptComments" runat="server">
                    <ItemTemplate>
                        <div class="item" id='<%#"jid-" + Eval("CommentId") %>'>
                            <div class="user">
                                <div class="img">
                                    <img src="/Data/Sites/1/media/default/img/avt.png" alt="">
                                </div>
                                <div class="name">
                                    <%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"FullName").ToString()) %>
                                </div>

                                <%# ProductPermission.CanDeleteComment ? "<div onclick='journalDelete(this);' class='minidel'></div>" : "" %>
                                <time><%# CommentHelper.GetTimeAgo(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, timeOffset) %></time>
                            </div>
                            <div class="caption">
                                <%# Convert.ToBoolean(Eval("IsModerator")) ? "<b class='mod'>Quản trị viên</b>" : "" %>
                                <% if (CommentType == ProductCommentType.Rating)
                                    { %>
                                <div data-score="<%#Convert.ToInt32(Eval("Rating")) %>" class="rating rating-input"></div>
                                <% } %>
                                <div class="title"><%# CommentHelper.GetLevelRating(Convert.ToInt32(Eval("Rating"))) %></div>
                                <span class="cmlike">
                                    <%# CommentHelper.GetLikeText(Convert.ToInt32(Eval("CommentId"))) %>
                                    <i class="iconcom-likecomm"></i>
                                    <span><%#Eval("HelpfulYesTotal")%></span>
                                </span>
                                <abbr title='<%# DateTimeHelper.Format(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, "g", timeOffset) %>'>
                                    <%# CommentHelper.GetTimeAgo(Convert.ToDateTime(Eval("CreatedUtc")), timeZone, timeOffset) %>
                                </abbr>
                                <div class="des">
                                    <%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"ContentText").ToString()).Replace("\n", "<br/>").Replace("\r\n", "<br />") %>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div id="divPager" runat="server" visible="false" class="pages commentpager">
        <portal:gbCutePager ID="pgr" PageSize="10" LeaveOutSpans="true" CurrentPageCssClass="ModulePager SelectedPage" runat="server" />
    </div>
</div>
