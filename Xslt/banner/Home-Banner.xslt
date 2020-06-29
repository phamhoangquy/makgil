<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="home-banner">
			<div class="container-custom">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
					</div>
					<div class="swiper-pagination home-banner-pagination"></div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="swiper-slide">
			<div class="wrapper">
				<a>
					<xsl:if test="Url !=''">

						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
					</xsl:if>

					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
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
			<div class="caption">
				<h2 class="title-caption">
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</h2>
				<div class="text">
					<xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
