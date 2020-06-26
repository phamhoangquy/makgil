<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="cello-title">
			<h2>
				<xsl:value-of select="/ZoneList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
		</div>
		<div class="cello-navTab">
			<!-- <div class="cello-mbTab">Danh sách</div> -->
			<ul class="cello-tabList">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</ul>
		</div>
		<div class="cello-tabContent">
			<xsl:apply-templates select="/ZoneList/Zone" mode="Content"></xsl:apply-templates>
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
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="Content">
		<div class="row list-item no-gutters" cello-tabContent="1">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text>row list-item no-gutters active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="cello-tabContent">
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:apply-templates select="Manufacturer"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Manufacturer">
		<div class="col-xl-item col-sm-6 col-md-4 col-lg-3 item">
			<div class="top-item">
				<div class="img">
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
		</div>
	</xsl:template>
</xsl:stylesheet>
