<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="video-list">
								<div class="swiper-container">
									<div class="swiper-wrapper">
									<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
									</div>
								</div>
								<div class="swiper-nav">
									<div class="swiper-prev"><em class="lnr lnr-chevron-left"></em></div>
									<div class="swiper-next"><em class="lnr lnr-chevron-right"></em></div>
								</div>
							</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="swiper-slide"><a class="item">
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
												<figure>
													<div class="img"><img>
													<xsl:attribute name="src">
														<xsl:value-of select="ImageUrl"></xsl:value-of>
													</xsl:attribute>
													<xsl:attribute name="alt">
														<xsl:value-of select="Title"></xsl:value-of>
													</xsl:attribute>
													</img></div>
													<figcaption>
														<div class="play"><em class="fas fa-play"></em></div>
														<div class="title">
															<h5><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></h5>
														</div>
													</figcaption>
												</figure>
											</a></div>
	</xsl:template>
</xsl:stylesheet>