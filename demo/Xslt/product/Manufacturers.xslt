<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="cello-tabContent">
			<div class="row list-item no-gutters active">
				<xsl:if test="count(/ManufacturerList/Manufacturer)&gt;12">
					<xsl:attribute name="style">
						<xsl:text disable-output-escaping="yes">height: 250px</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates select="/ManufacturerList/Manufacturer"></xsl:apply-templates>
			</div>
		</div>
		<xsl:if test="count(/ManufacturerList/Manufacturer)&gt;12">
			<div class="button">
				<div class="cello-viewMore">
					<a href="javascript:void(0)">Xem thêm</a>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Manufacturer">
		<div class="col-xl-2 col-lg-3 col-4 item">
			<div class="top-item">
				<a class="brand-item">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
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
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>