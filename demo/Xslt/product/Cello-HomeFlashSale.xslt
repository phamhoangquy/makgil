<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="cello-title">
			<h2>
				<xsl:value-of select="/FlashSaleList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="/FlashSaleList/Product"></xsl:apply-templates>

			</div>
		</div>

		<xsl:if test="count(/FlashSaleList/Product) >0">
			<div class="swiper-nav">
				<div class="swiper-prev">
					<em class="lnr lnr-chevron-left"></em>
				</div>
				<div class="swiper-next">
					<em class="lnr lnr-chevron-right"></em>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Product">
		<div class="swiper-slide">
			<div class="productItem">
				<div class="top-item">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
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
						<xsl:if test="Percent != ''">
							<div class="pro">
								<span>
									-<xsl:value-of select="Percent" disable-output-escaping="yes">
									</xsl:value-of>%
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
								<div class="status stt-1"><span>New</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 8) mod 2 = 1">
								<div class="status stt-2"><span>Sắp có hàng</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 16) mod 2 = 1">
								<div class="status stt-3"><span>Like new</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 32) mod 2 = 1">
								<div class="status stt-4"><span>Hàng 99%</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 64) mod 2 = 1">
								<div class="status stt-5"><span>Hàng demo</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 1024) mod 2 = 1">
								<div class="status stt-5"><span>Pre-Order</span></div>
							</xsl:when>
						</xsl:choose>
						
						<xsl:choose>
							<xsl:when test="floor(ShowOption div 128) mod 2 = 1">
								<div class="sale sl-1"><span>Sale cực sốc</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 256) mod 2 = 1">
								<div class="sale sl-2"><span>Loa di động</span></div>
							</xsl:when>
							<xsl:when test="floor(ShowOption div 512) mod 2 = 1">
								<div class="sale sl-3"><span>Bán chạy</span></div>
							</xsl:when>
						</xsl:choose>
						<div class="time">
							<xsl:attribute name="data-endtime">
								<xsl:value-of select="EndDate" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<p>
								<span class="opt-title">
								Còn lại 
								</span>
								<span class="num hour"></span>
								<b>:</b>
								<span class="num minute"></span>
								<b>:</b>
								<span class="num second"></span>
							</p>
						</div>
					</a>
				</div>
				<div class="bottom-item">
					<!-- <a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute> -->
						<!-- <div class="color">
							<xsl:apply-templates select="ProductColorImage"></xsl:apply-templates>
						</div> -->
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
					<!-- </a> -->
				</div>
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
				<!-- <div class="buy-now">
					<a href="javascript:void(0)" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
						<xsl:attribute name="data-productid">
							<xsl:value-of select="ProductId"></xsl:value-of>
						</xsl:attribute>
						<em class="mdi mdi-cart-outline"></em>
						<span>MUA NGAY</span>
					</a>
				</div> -->
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductColorImage">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="ProductUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="color-item">
				<xsl:if test="position() = 1">
					<xsl:attribute name="class">
						<xsl:text>color-item active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="ProductTitle"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</a>
	</xsl:template>
</xsl:stylesheet>