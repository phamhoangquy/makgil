<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="side-navigation-wrapper">
			<div class="title-wrapper">
				<h2>
					<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ModuleTitle"></xsl:value-of>
				</h2>
			</div>
			<ul class="side-navigation">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:apply-templates select="Zone" mode='Parent'></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode='Parent'>

		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(Zone)> 0">
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>active open</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<div class="title"><a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</a><em class="lnr lnr-chevron-down"></em></div>
				<ul class="nav-sub">
					<xsl:apply-templates select="Zone" mode='Child'></xsl:apply-templates>

				</ul>
			</xsl:if>
			<xsl:if test="count(Zone) &lt; 1">

				<div class="title"><a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</a></div>
			</xsl:if>

		</li>
	</xsl:template>

	<xsl:template match="Zone" mode='Child'>
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>
