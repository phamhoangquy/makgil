<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-8 top-banner">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="/BannerList/Banner" mode="Slider"></xsl:apply-templates>
						</div>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-navigation">
						<span class="swiper-prev"></span>
						<span class="swiper-next"></span>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="part-banner">
						<xsl:apply-templates select="/BannerList/Banner" mode="Sidebanner"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Banner" mode="Slider">
		<xsl:if test="position()&gt;3">
			<div class="swiper-slide">
				<div class="item">
					<a>
						<xsl:attribute name="href">
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
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Banner" mode="Sidebanner">
		<xsl:if test="position()&gt;0 and position()&lt;4">
			<div class="item">
				<a>
					<xsl:attribute name="href">
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
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>