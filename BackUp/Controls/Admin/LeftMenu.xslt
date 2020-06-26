<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">

		<ul class="sidebar-menu tree" data-widget="treeview" role="menu" data-accordion="false">
			<li class="nav-devider"></li>
			<xsl:apply-templates select="/MenuList/Menu"></xsl:apply-templates>
		</ul>
	</xsl:template>

	<xsl:template match="Menu">
		<li>
			<xsl:attribute name="class">
				<xsl:if test="count(Menu)>0">
					<xsl:text>treeview</xsl:text>
				</xsl:if>
				<xsl:if test="IsActive='true'">
					<xsl:text> menu-open</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<a href="#">
				<!-- <xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>nav-link active</xsl:text>
					</xsl:attribute>
				</xsl:if> -->
				<xsl:if test="CssClass!=''">
					<i>
						<xsl:attribute name="class">
							<!-- <xsl:text>nav-icon fas </xsl:text> -->
							<xsl:value-of select="CssClass"></xsl:value-of>
						</xsl:attribute>
					</i>
				</xsl:if>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
				<span class="pull-right-container">
					<i class="fa fa-angle-right pull-right"></i>
				</span>
			</a>
			<xsl:if test="count(Menu)>0">
				<ul class="treeview-menu">
					<xsl:apply-templates select="Menu" mode="Sub"></xsl:apply-templates>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>

	<xsl:template match="Menu" mode="Sub">
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a href="#">
				<xsl:if test="Url != ''">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
				</xsl:if>
				<i class="far fa-circles nav-icon"></i>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>