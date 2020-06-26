<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="ajaxfilterresponse">
			<xsl:apply-templates select="/ProductFilter/Group"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="Group">
		<select class="ajaxsort">
			<option>
				<xsl:attribute name="value">
					<xsl:value-of select="ClearUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</option>
			<xsl:apply-templates select="Option" mode="Default"></xsl:apply-templates>
		</select>
	</xsl:template>


	<xsl:template match="Option" mode="Default">
		<option>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</option>
	</xsl:template>
</xsl:stylesheet>
