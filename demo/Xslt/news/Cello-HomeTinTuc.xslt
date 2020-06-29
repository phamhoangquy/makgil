<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="cello-title">
			<h2>
				<xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
		</div>
		<div class="row">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-4 top-news"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()=2">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-8 part-news"&gt;&lt;div class="row"&gt;&lt;div
				class="col-md-6"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()>2 and position()&lt;8">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-md-6"&gt;</xsl:text>
		</xsl:if>
		<div class="item">
			<a>
			<xsl:attribute name="href">
				<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
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
						<time>
							<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
						</time>
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</figcaption>
				</figure>
			</a>
		</div>
		<xsl:if test=" position()=1">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()>1 and position()&lt;7">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()=7">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
