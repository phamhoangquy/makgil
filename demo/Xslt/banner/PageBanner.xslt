<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="cello-slider">
			<div class="container">

				<xsl:if test="count(/BannerList/Banner)>1">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
						</div>
						<div class="swiper-nav">
							<div class="swiper-prev"><em class="lnr lnr-chevron-left"></em></div>
							<div class="swiper-next"><em class="lnr lnr-chevron-right"></em></div>
						</div>
					</div>
				</xsl:if>
				<xsl:if test="count(/BannerList/Banner)&lt;2">
					<xsl:apply-templates select="/BannerList/Banner" mode="alone"></xsl:apply-templates>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Banner">
		<div class="swiper-slide">
			<a >
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="img"><img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="Banner" mode="alone">
			<a >
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="img"><img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
			</a>
	</xsl:template>
</xsl:stylesheet>
