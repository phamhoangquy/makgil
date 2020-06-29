<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div style="width: 100%; display: flex; flex-wrap: wrap">
			<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-xl-item col-6 col-sm-4 col-lg-3 productItem">
			<a >
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
					<xsl:if test="OldPrice != ''">
						<div class="pro">
							<span>
							-
								<xsl:value-of select="Percent" disable-output-escaping="yes"></xsl:value-of>%
						
							</span>
						</div>
					</xsl:if>
					<xsl:if test="PromotionCatalogText != ''">
						<div class="gift">
							<em class="fas fa-gift"></em>
							<span>
								Quà tặng
							</span>
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
					<div class="name">
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</div>
					<div class="price">
						<xsl:if test="OldPrice != ''">
							<div class="old">
								<span>
									<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
								</span>
							</div>
						</xsl:if>
						<xsl:if test="Price != ''">
							<div class="new">
								<span>
									<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
								</span>
							</div>
						</xsl:if>
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