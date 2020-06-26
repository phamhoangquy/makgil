<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="navbar-custom-menu">
			<!-- <a class="nav-link" data-widget="pushmenu" href="#">
				<i class="fas fa-bars"></i>
			</a> -->

			<ul class="nav navbar-nav">
				<xsl:if test="/MenuList/LastPageVisitedUrl!=''">
					<li class="nav-item d-none d-sm-inline-block">
						<a class="viewwebsite nav-link">
							<xsl:attribute name="href">
								<xsl:value-of select="/MenuList/LastPageVisitedUrl"></xsl:value-of>
							</xsl:attribute>
							<i class="fa fa-desktop"></i>
							<xsl:text> </xsl:text>
							<xsl:value-of select="/MenuList/ViewWebsite"></xsl:value-of>
						</a>
					</li>
				</xsl:if>
				<xsl:apply-templates select="/MenuList/Menu"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="Menu">
		<li class="nav-item d-none d-sm-inline-block">
			<xsl:choose>
				<xsl:when test="count(Menu)>0">
					<xsl:attribute name="class">
						<xsl:text>nav-item dropdown</xsl:text>
						<xsl:if test="IsActive='true'">
							<xsl:text> active</xsl:text>
						</xsl:if>
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="IsActive='true'">
						<xsl:attribute name="class">
							<xsl:text>nav-item d-none d-sm-inline-block active</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(Menu)>0">
					<a href="#" class="nav-link" data-toggle="dropdown">
						<xsl:if test="Url != ''">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:if test="CssClass!=''">
							<i>
								<xsl:attribute name="class">
									<xsl:value-of select="CssClass"></xsl:value-of>
								</xsl:attribute>
							</i>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<a href="#" class="nav-link">
						<xsl:if test="Url != ''">
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="target">
							<xsl:value-of select="Target"></xsl:value-of>
						</xsl:attribute>
						<xsl:if test="CssClass!=''">
							<i>
								<xsl:attribute name="class">
									<xsl:value-of select="CssClass"></xsl:value-of>
								</xsl:attribute>
							</i>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:if test="count(Menu)>0">
				<ul class="dropdown-menu" role="menu">
					<xsl:apply-templates select="Menu" mode="Sub"></xsl:apply-templates>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>
	<xsl:template match="Menu" mode="Sub">
		<li>
			<a href="#" class="nav-link">
				<xsl:if test="Url != ''">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="CssClass!=''">
					<i>
						<xsl:attribute name="class">
							<xsl:value-of select="CssClass"></xsl:value-of>
						</xsl:attribute>
					</i>
				</xsl:if>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
			<xsl:if test="count(Menu)>0">
				<ul class="dropdown-menu" role="menu">
					<xsl:apply-templates select="Menu" mode="Sub"></xsl:apply-templates>
				</ul>
			</xsl:if>
		</li>
	</xsl:template>
</xsl:stylesheet>