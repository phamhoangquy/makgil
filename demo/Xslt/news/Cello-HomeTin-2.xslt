<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="part-news">
			<div class="title">
				<h5>
					<xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
				</h5>
				<div class="swiper-pagination" mapTo="#part-page" mapPoint="576"></div>
			</div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
				</div>
				<div id="part-page"></div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="swiper-slide">
			<a class="item">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<figure>
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
					<figcaption>
						<div class="time"><em class="far fa-calendar"></em>
							<time>
								<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
							</time>
						</div>
						<div class="title">
							<h3>
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</h3>
						</div>
					</figcaption>
				</figure>
			</a></div>
	</xsl:template>
</xsl:stylesheet>
