<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="right">
			<div class="card-title">
				<h1>
					<xsl:value-of disable-output-escaping="yes" select="/NewsList/ZoneTitle"></xsl:value-of>
				</h1>
			</div>
			<div class="support-wrapper">
				<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
			</div>

		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="toggle-item">
			<div class="title"><span>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</span><em class="lnr lnr-chevron-down"></em></div>
			<article>
				<div class="caption">
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
				</div>
			</article>
		</div>
	</xsl:template>

</xsl:stylesheet>
