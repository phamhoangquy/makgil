<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="cello-title">
			<h2><xsl:value-of select="/ZoneList/Title" disable-output-escaping="yes"></xsl:value-of></h2>
		</div>
		<div class="cello-navTab">
			<div class="cello-mbTab">Danh sách</div>
			<ul class="cello-tabList">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<li class="item">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text>item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="cello-tabItem">
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<a target="_self">
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>