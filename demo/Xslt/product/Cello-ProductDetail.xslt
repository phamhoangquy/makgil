<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="container">
			<div class="productDetail">
				<div class="row">
					<div class="col-md-4 col-lg-6 col-xl-5 productSlider ajaxproductslider">
						<div class="swiper-container bigImages">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="/ProductDetail/ProductImages" mode="Big">
								</xsl:apply-templates>
							</div>
							<div class="swiper-pagination"></div>
						</div>
						<div class="swiper-container thumbImages">
							<div class="swiper-wrapper">
								<xsl:apply-templates select="/ProductDetail/ProductImages" mode="Small">
								</xsl:apply-templates>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-lg-6 col-xl-7">
						<div class="row">
							<div class="col-12">
								<div class="productInfoBlock-1">
									<h1>
										<xsl:value-of select="/ProductDetail/Title" disable-output-escaping="yes">
										</xsl:value-of>
									</h1>
									<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes">
									</xsl:value-of>
									<div class="cobra">

										<div class="code">
											<span>SKU: </span>
											<span class="product-code">
												<xsl:value-of select="/ProductDetail/Code"
													disable-output-escaping="yes">
												</xsl:value-of>
											</span>
										</div>
										<div class="brand">
											<div class="img">
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="/ProductDetail/ManufacturerUrl">
														</xsl:value-of>
													</xsl:attribute>
													<img>
													<xsl:attribute name="src">
														<xsl:value-of select="/ProductDetail/ManufacturerImageUrl">
														</xsl:value-of>
													</xsl:attribute>
													<xsl:attribute name="alt">
														<xsl:value-of select="/ProductDetail/ManufacturerTitle"
															disable-output-escaping="yes" />
													</xsl:attribute>
													</img>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-7 table">
								<div class="priceBox">
									<div class="price">
										<xsl:value-of select="/ProductDetail/Price" disable-output-escaping="yes">
										</xsl:value-of>
									</div>

									<xsl:if
										test="/ProductDetail/PreOrder = 'true' and /ProductDetail/SpecialPricePreOrder != ''">
										<div class="price pre-order-price">
											<p>
												<span class="pre-order-text">
													<xsl:text>Giá đặt Trước: </xsl:text>
												</span>
												<span class="pre-order">
													<xsl:value-of select="/ProductDetail/SpecialPricePreOrder"
														disable-output-escaping="yes">
													</xsl:value-of>
												</span>
											</p>
											<p>
												<span class="date-pre-order-text">
													<xsl:text>Ngày giao dự kiến: </xsl:text>
												</span>
												<span class="date-pre-order">
													<xsl:value-of select="/ProductDetail/PreOrderEndDate"
														disable-output-escaping="yes">
													</xsl:value-of>
												</span>
											</p>
										</div>
									</xsl:if>
									<xsl:if test="/ProductDetail/OldPrice != ''">
										<div class="tr oldPrice">
											<span>Giá gốc: </span>
											<span>
												<xsl:value-of select="/ProductDetail/OldPrice"
													disable-output-escaping="yes"></xsl:value-of>
											</span>
										</div>

										<xsl:if test="OldPrice!=0">
											<div class="tr saving">
												<span>Tiết kiệm: </span>
												<span>
													<span>
														<xsl:value-of select="/ProductDetail/Percent"
															disable-output-escaping="yes"></xsl:value-of>
													</span>%
												</span>
												<span>
													<xsl:text>(-</xsl:text>

													<span>
														<xsl:value-of select="/ProductDetail/DiscountAmount"
															disable-output-escaping="yes"></xsl:value-of>
													</span>
													<xsl:text>)</xsl:text>
												</span>
											</div>
										</xsl:if>
									</xsl:if>
								</div>
								<div class="productInfo">
									<div class="status-section">
										<div class="tr status">
											<span>Tình trạng</span>
											<xsl:if test="/ProductDetail/OutStock != 'true' ">
												<span>Còn hàng</span>
											</xsl:if>
											<xsl:if test="/ProductDetail/OutStock = 'true' ">
												<span>Hết hàng</span>
											</xsl:if>
										</div>

									</div>
									<xsl:if test="count(/ProductDetail/ProductProperties)>0">
										<xsl:apply-templates select="/ProductDetail/ProductProperties">
										</xsl:apply-templates>
									</xsl:if>
									<div class="tr quantity">
										<xsl:if test="/ProductDetail/OutStock != 'true' ">
											<span>Số lượng</span>
											<span>
												<span class="decrease">-</span>
												<!-- <input id="number" type="text" value="1" /> -->
												<input value="1" id="number">
												<xsl:attribute name="name">
													<xsl:text>addtocart_</xsl:text>
													<xsl:value-of select="/ProductDetail/ProductId"
														disable-output-escaping="yes"></xsl:value-of>
													<xsl:text>.EnteredQuantity</xsl:text>
												</xsl:attribute>
												</input>
												<span class="increase">+</span>
											</span>

										</xsl:if>
									</div>
									<xsl:if test="/ProductDetail/BriefContent != ''">
										<xsl:value-of select="/ProductDetail/BriefContent"
											disable-output-escaping="yes">
										</xsl:value-of>
									</xsl:if>
								</div>
								<div class="productButton-section">
									<div class="productButton">
										<a class="btnBuy btn-addtocart" href="javascript:void(0)"
											onclick="AjaxCart.addproducttocart_details(this); return false;">
											<xsl:attribute name="data-productid">
												<xsl:value-of select="/ProductDetail/ProductId">
												</xsl:value-of>
											</xsl:attribute>Mua ngay
										</a>
									</div>
									<!-- <xsl:if test="/ProductDetail/OutStock != 'true'">
										<div class="productButton">
												<a class="btnBuy btn-addtocart" href="javascript:void(0)"
												onclick="AjaxCart.addproducttocart_details(this); return false;">
												<xsl:attribute name="data-productid">
													<xsl:value-of select="/ProductDetail/ProductId">
													</xsl:value-of>
												</xsl:attribute>Mua ngay
											</a>
											<xsl:choose>
												<xsl:when test="/ProductDetail/PreOrder = 'true'">
													<a class="btnBuy btn-addtocart" href="javascript:void(0)"
														onclick="AjaxCart.addproducttocart_details(this); return false;">
														<xsl:attribute name="data-productid">
															<xsl:value-of select="/ProductDetail/ProductId">
															</xsl:value-of>
														</xsl:attribute>Đặt Hàng Trước
													</a>
												</xsl:when>
												<xsl:otherwise>
													<a class="btnBuy btn-addtocart" href="javascript:void(0)"
														onclick="AjaxCart.addproducttocart_details(this); return false;">
														<xsl:attribute name="data-productid">
															<xsl:value-of select="/ProductDetail/ProductId">
															</xsl:value-of>
														</xsl:attribute>Mua ngay
													</a>
													<xsl:if test="/ProductDetail/EnableTraGop = 'true'">
														<a class="btnBuy btn-addtocart" href="javascript:void(0)"
															onclick="AjaxCart.addproducttocart_details(this); return false;">
															<xsl:attribute name="data-productid">
																<xsl:value-of select="/ProductDetail/ProductId">
																</xsl:value-of>
															</xsl:attribute>Mua trả góp
														</a>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</xsl:if> -->
								</div>
								<input type="hidden" id="hdProductId">
								<xsl:attribute name="value">
									<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
								</xsl:attribute>
								</input>
								<div class="socialShare">
									<a class="facebook">
										<xsl:attribute name="href">
											<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
											<xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
										</xsl:attribute>
										<img src="/Data/Sites/1/skins/default/img/sanpham-ct/btn-1.png" alt=""></img>
									</a>
									<a class="zalo zalo-share-button" data-customize="true"
										data-oaid="579745863508352884" data-color="red">
										<xsl:attribute name="data-href">
											<xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
										</xsl:attribute>
										<img src="/Data/Sites/1/skins/default/img/sanpham-ct/btn-2.png" alt=""></img>
									</a>
								</div>
							</div>
							<div class="col-xl-5">
								<xsl:if test="/ProductDetail/GiftProductTemplate != ''">
									<div class="giftBox">
										<h4>
											<span class="fas fa-gift"></span>
											<span>QUÀ TẶNG &amp; KHUYẾN MÃI</span>
										</h4>
										<div id="giftProductTemplate">
											<xsl:value-of select="/ProductDetail/GiftProductTemplate"
												disable-output-escaping="yes" />
										</div>
										<div class="bottom">
											<xsl:value-of select="/ProductDetail/GiftDescription"
												disable-output-escaping="yes" />
										</div>
									</div>

								</xsl:if>

								<xsl:if test="/ProductDetail/SupportHtml != ''">
									<xsl:value-of select="/ProductDetail/SupportHtml" disable-output-escaping="yes" />
								</xsl:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<xsl:if test="count(/ProductDetail/ProductSamePrice) &gt; 0">
				<div class="productSamePrice">
					<div class="row">
						<div class="col-12 productSlider-2">
							<div class="blockTitle">Sản phẩm cùng tầm giá</div>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="/ProductDetail/ProductSamePrice"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:if>
			<div class="productDetail-2">
				<div class="row">
					<div class="col-lg-8">
						<xsl:if test="/ProductDetail/FullContent !=''">
							<div class="product-description">
								<div class="blockTitle">Mô tả sản phẩm</div>
								<div class="content">
									<xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes">
									</xsl:value-of>
								</div>
							</div>
						</xsl:if>
						<xsl:if test="count(/ProductDetail/ProductVideos) > 0">
							<div class="video">
								<div class="blockTitle">Video</div>
								<div class="content">
									<xsl:apply-templates select="/ProductDetail/ProductVideos"></xsl:apply-templates>
								</div>
							</div>
						</xsl:if>
						<div class="comments">
							<div class="blockTitle">Hỏi, đáp về sản phẩm</div>
							<xsl:value-of select="/ProductDetail/ProductComments">
							</xsl:value-of>
						</div>
					</div>
					<div class="col-lg-4">
						<xsl:if test="count(/ProductDetail/ProductAttributes) &gt; 0">

							<div class="infoDetail">
								<div class="blockTitle">Thông tin chi Tiết</div>
								<div class="infoBox">
									<div class="infoTable">
										<xsl:apply-templates select="/ProductDetail/ProductAttributes">
										</xsl:apply-templates>
									</div>
								</div>
							</div>
						</xsl:if>
						<xsl:if test="count(/ProductDetail/ProductBuyWith)&gt;0">
							<div class="productMuaKem">
								<div class="blockTitle">Sản phẩm nên mua kèm</div>
								<div class="swiper-navigation">
									<div class="swiper-button-prev">
										<span class="lnr lnr-chevron-left"></span>
									</div>
									<div class="swiper-button-next">
										<span class="lnr lnr-chevron-right"></span>
									</div>
								</div>
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="/ProductDetail/ProductBuyWith">
										</xsl:apply-templates>
									</div>
								</div>
							</div>
						</xsl:if>
						<xsl:if test="count(/ProductDetail/NewsRelated) &gt;0">

							<div class="newsRelated">
								<div class="blockTitle">Tin tức liên quan</div>
								<ul>
									<xsl:apply-templates select="/ProductDetail/NewsRelated"></xsl:apply-templates>
								</ul>
							</div>
						</xsl:if>
					</div>
				</div>
			</div>
			<div class="">
				<div class="row">
					<xsl:if test="count(/ProductDetail/ProductOther)&gt;0">

						<div class="col-12 productSlider-2">
							<div class="blockTitle">Sản phẩm tương tự</div>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</xsl:if>

					<xsl:if test="count(/ProductDetail/ProductViewed)&gt;0">

						<div class="col-12 productSlider-2">
							<div class="blockTitle">Sản phẩm đã xem</div>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="/ProductDetail/ProductViewed"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
			<xsl:if test="/ProductDetail/ManufacturerDescription != ''">
				<div class="term-content">
					<div class="container">
						<div class="body">
							<div class="title">
								<div class="btn-close">
									<span class="mdi mdi-close"></span>
								</div>
							</div>
							<div class="content">
								<xsl:value-of select="/ProductDetail/ManufacturerDescription"
									disable-output-escaping="yes" />
							</div>
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="ProductImages" mode="Big">
		<div class="swiper-slide">
			<a data-fancybox="product-detail">
				<xsl:attribute name="ImageUrl">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages" mode="Small">
		<div class="swiper-slide">
			<img>
			<xsl:attribute name="src">
				<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			</img>
		</div>
	</xsl:template>

	<xsl:template match="ProductOther">
		<div class="swiper-slide productItem">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="top-item">
					<div class="img">
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<xsl:if test="OldPrice!=0">
						<div class="pro">
							<span>
								<xsl:text disable-output-escaping="yes">-</xsl:text>
								<xsl:value-of select="Percent" disable-output-escaping="yes"></xsl:value-of>
								<xsl:text disable-output-escaping="yes">%</xsl:text>
							</span>
						</div>
					</xsl:if>
					<xsl:if test="PromotionCatalogText != ''">
						<div class="gift">
							<em class="fas fa-gift"></em>
							<span>Quà tặng</span>
						</div>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 4) mod 2 = 1">
							<div class="status stt-1">
								<span>New</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 8) mod 2 = 1">
							<div class="status stt-2">
								<span>Sắp có hàng</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 16) mod 2 = 1">
							<div class="status stt-3">
								<span>Like new</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 32) mod 2 = 1">
							<div class="status stt-4">
								<span>Hàng 99%</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 64) mod 2 = 1">
							<div class="status stt-5">
								<span>Hàng demo</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 1024) mod 2 = 1">
							<div class="status stt-5">
								<span>Pre-Order</span>
							</div>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 128) mod 2 = 1">
							<div class="sale sl-1">
								<span>Sale cực sốc</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 256) mod 2 = 1">
							<div class="sale sl-2">
								<span>Loa di động</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 512) mod 2 = 1">
							<div class="sale sl-3">
								<span>Bán chạy</span>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
				<div class="bottom-item">
					<!-- <div class="color"><xsl:apply-templates select="ProductColorImage"></xsl:apply-templates></div> -->
					<div class="name">
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</div>
					<div class="price">
						<div class="old">
							<span>
								<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
						<div class="new">
							<span>
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
					</div>
				</div>
			</a>
			<xsl:if test="PromotionCatalogText != ''">
				<div class="gift-detail">
					<div class="detail-wrapper">
						<div class="detail-title">
							<h5>Quà tặng kèm</h5>
							<div class="detail-close">
								<em class="mdi mdi-close"></em>
							</div>
						</div>
						<div class="detail-info">
							<xsl:value-of select="PromotionCatalogText" disable-output-escaping="yes" />
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="ProductViewed">
		<div class="swiper-slide productItem">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="top-item">
					<div class="img">
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<xsl:if test="OldPrice!=0">
						<div class="pro">
							<span>
								<xsl:text disable-output-escaping="yes">-</xsl:text>
								<xsl:value-of select="Percent" disable-output-escaping="yes"></xsl:value-of>
								<xsl:text disable-output-escaping="yes">%</xsl:text>
							</span>
						</div>
					</xsl:if>
					<xsl:if test="PromotionCatalogText != ''">
						<div class="gift">
							<em class="fas fa-gift"></em>
							<span>Quà tặng</span>
						</div>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 4) mod 2 = 1">
							<div class="status stt-1">
								<span>New</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 8) mod 2 = 1">
							<div class="status stt-2">
								<span>Sắp có hàng</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 16) mod 2 = 1">
							<div class="status stt-3">
								<span>Like new</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 32) mod 2 = 1">
							<div class="status stt-4">
								<span>Hàng 99%</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 64) mod 2 = 1">
							<div class="status stt-5">
								<span>Hàng demo</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 1024) mod 2 = 1">
							<div class="status stt-5">
								<span>Pre-Order</span>
							</div>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 128) mod 2 = 1">
							<div class="sale sl-1">
								<span>Sale cực sốc</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 256) mod 2 = 1">
							<div class="sale sl-2">
								<span>Loa di động</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 512) mod 2 = 1">
							<div class="sale sl-3">
								<span>Bán chạy</span>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
				<div class="bottom-item">
					<!-- <div class="color"><xsl:apply-templates select="ProductColorImage"></xsl:apply-templates></div> -->
					<div class="name">
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</div>
					<div class="price">
						<div class="old">
							<span>
								<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
						<div class="new">
							<span>
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
					</div>
				</div>
			</a>
			<xsl:if test="PromotionCatalogText != ''">
				<div class="gift-detail">
					<div class="detail-wrapper">
						<div class="detail-title">
							<h5>Quà tặng kèm</h5>
							<div class="detail-close">
								<em class="mdi mdi-close"></em>
							</div>
						</div>
						<div class="detail-info">
							<xsl:value-of select="PromotionCatalogText" disable-output-escaping="yes" />
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="Manufacturers">
		<img>
		<xsl:attribute name="src">
			<xsl:value-of select="ImageUrl"></xsl:value-of>
		</xsl:attribute>
		<xsl:attribute name="alt">
			<xsl:value-of select="Title"></xsl:value-of>
		</xsl:attribute>
		</img>
	</xsl:template>

	<xsl:template match="ProductAttributes">
		<div class="tr">
			<div class="td">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<div class="td">
				<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductVideos">
		<div class="item">
			<a data-fancybox="video">
				<xsl:attribute name="href">
					<xsl:value-of select="VideoUrl" />
				</xsl:attribute>
				<img src="/Data/Sites/1/skins/default/img/sanpham-ct/11.png" alt="">
				<xsl:attribute name="src">
					<xsl:value-of select="ThumbnailUrl" />
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" />
				</xsl:attribute>
				</img>
				<xsl:if test="position()=1">
					<div class="playbutton">
						<img src="/Data/Sites/1/skins/default/img/play-btn.png" alt=""></img>
					</div>
				</xsl:if>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="NewsRelated">
		<li class="item">
			<div class="img">
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
			<a class="caption">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<time class="createdDate">
					<span class="far fa-calendar"></span>
					<span>
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</time>
				<h4>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h4>
			</a>
		</li>
	</xsl:template>

	<xsl:template match="ProductBuyWith">
		<div class="swiper-slide productItem">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="top-item">
					<div class="img">
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<xsl:if test="OldPrice!=0">
						<div class="pro">
							<span>
								<xsl:text disable-output-escaping="yes">-</xsl:text>
								<xsl:value-of select="Percent" disable-output-escaping="yes"></xsl:value-of>
								<xsl:text disable-output-escaping="yes">%</xsl:text>
							</span>
						</div>
					</xsl:if>
					<xsl:if test="PromotionCatalogText != ''">
						<div class="gift">
							<em class="fas fa-gift"></em>
							<span>Quà tặng</span>
						</div>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 4) mod 2 = 1">
							<div class="status stt-1">
								<span>New</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 8) mod 2 = 1">
							<div class="status stt-2">
								<span>Sắp có hàng</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 16) mod 2 = 1">
							<div class="status stt-3">
								<span>Like new</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 32) mod 2 = 1">
							<div class="status stt-4">
								<span>Hàng 99%</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 64) mod 2 = 1">
							<div class="status stt-5">
								<span>Hàng demo</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 1024) mod 2 = 1">
							<div class="status stt-5">
								<span>Pre-Order</span>
							</div>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 128) mod 2 = 1">
							<div class="sale sl-1">
								<span>Sale cực sốc</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 256) mod 2 = 1">
							<div class="sale sl-2">
								<span>Loa di động</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 512) mod 2 = 1">
							<div class="sale sl-3">
								<span>Bán chạy</span>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
				<div class="bottom-item">
					<!-- <div class="color"><xsl:apply-templates select="ProductColorImage"></xsl:apply-templates></div> -->
					<div class="name">
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</div>
					<div class="price">
						<div class="old">
							<span>
								<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
						<div class="new">
							<span>
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
					</div>
				</div>
			</a>
			<xsl:if test="PromotionCatalogText != ''">
				<div class="gift-detail">
					<div class="detail-wrapper">
						<div class="detail-title">
							<h5>Quà tặng kèm</h5>
							<div class="detail-close">
								<em class="mdi mdi-close"></em>
							</div>
						</div>
						<div class="detail-info">
							<xsl:value-of select="PromotionCatalogText" disable-output-escaping="yes" />
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="ProductSamePrice">
		<div class="swiper-slide productItem">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="top-item">
					<div class="img">
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<xsl:if test="OldPrice!=0">
						<div class="pro">
							<span>
								<xsl:text disable-output-escaping="yes">-</xsl:text>
								<xsl:value-of select="Percent" disable-output-escaping="yes"></xsl:value-of>
								<xsl:text disable-output-escaping="yes">%</xsl:text>
							</span>
						</div>
					</xsl:if>
					<xsl:if test="PromotionCatalogText != ''">
						<div class="gift">
							<em class="fas fa-gift"></em>
							<span>Quà tặng</span>
						</div>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 4) mod 2 = 1">
							<div class="status stt-1">
								<span>New</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 8) mod 2 = 1">
							<div class="status stt-2">
								<span>Sắp có hàng</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 16) mod 2 = 1">
							<div class="status stt-3">
								<span>Like new</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 32) mod 2 = 1">
							<div class="status stt-4">
								<span>Hàng 99%</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 64) mod 2 = 1">
							<div class="status stt-5">
								<span>Hàng demo</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 1024) mod 2 = 1">
							<div class="status stt-5">
								<span>Pre-Order</span>
							</div>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 128) mod 2 = 1">
							<div class="sale sl-1">
								<span>Sale cực sốc</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 256) mod 2 = 1">
							<div class="sale sl-2">
								<span>Loa di động</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 512) mod 2 = 1">
							<div class="sale sl-3">
								<span>Bán chạy</span>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
				<div class="bottom-item">
					<!-- <div class="color"><xsl:apply-templates select="ProductColorImage"></xsl:apply-templates></div> -->
					<div class="name">
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</div>
					<div class="price">
						<div class="old">
							<span>
								<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
						<div class="new">
							<span>
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
					</div>
				</div>
			</a>
			<xsl:if test="PromotionCatalogText != ''">
				<div class="gift-detail">
					<div class="detail-wrapper">
						<div class="detail-title">
							<h5>Quà tặng kèm</h5>
							<div class="detail-close">
								<em class="mdi mdi-close"></em>
							</div>
						</div>
						<div class="detail-info">
							<xsl:value-of select="PromotionCatalogText" disable-output-escaping="yes" />
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="ProductProperties">
		<div class="tr color">
			<span>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</span>
			<div class="list">
				<xsl:choose>
					<xsl:when test="FieldType=1">
						<xsl:apply-templates select="Options" mode="Color"></xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="Options" mode="Other"></xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<input type="hidden" class="product-option-input">
			<xsl:attribute name="name">
				<xsl:text>product_option_</xsl:text>
				<xsl:value-of select="FieldId"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="ActiveOptionId"></xsl:value-of>
			</xsl:attribute>
			</input>
		</div>
	</xsl:template>
	<xsl:template match="Options" mode="Color">
		<a class="product-option product-option-color" onclick="AjaxCart.selectproductoption(this);return false;">
			<xsl:attribute name="data-name">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId" />
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>product-option product-option-color active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="ImageUrl!=''">
					<img src="/Data/Sites/1/skins/default/img/sanpham-ct/7.png" alt="">
					<xsl:attribute name="src">
						<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">
						<xsl:text>background-color:</xsl:text>
						<xsl:value-of select="Color"></xsl:value-of>
						<xsl:text>;</xsl:text>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
		</a>
	</xsl:template>

	<xsl:template match="Options" mode="Other">
		<a class="product-option" href="#" onclick="AjaxCart.selectproductoption(this);return false;">
			<xsl:attribute name="data-name">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>product-option active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</a>
	</xsl:template>

</xsl:stylesheet>