<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="nav" mapTo="#list-nav">
			<xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
		</div>
	</xsl:template>


	<xsl:template match="Zone" mode="Zone1">
		<div class="nav-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>nav-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			
			<a class="nav-link load-manu">
			<xsl:attribute name="data-id">
				<xsl:value-of select="ZoneId" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
				<xsl:if test="position()=last() or position()=last()-1">

				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				</xsl:if>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
			</a>
			<xsl:if test="count(Zone) > 0">
				<div class="cello-mega">
					<div class="row close-close">
					<div class="col-12">
						<div class="mdi mdi-close"></div>
					</div>
					</div>
					<div class="row">
						<div class="col-lg-9">
							<div class="mega-list">
								<div class="list-item">
									<xsl:apply-templates select="Zone" mode="Mega-Tab"></xsl:apply-templates>
								</div>
								<div class="list-brand">
									<xsl:apply-templates select="Zone" mode="Mega-Content"></xsl:apply-templates>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="mega-img">
								<img>
								<xsl:attribute name="src">
									<xsl:value-of select="SecondImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
						</div>
					</div>
				</div>
			</xsl:if>

		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Mega-Tab">
		<div class="item">
			<xsl:attribute name="data-item">
				<xsl:text>data-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<!-- <xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text>item active</xsl:text>
				</xsl:attribute>
			</xsl:if> -->
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Mega-Content">
		<div class="brand-item">
			<xsl:attribute name="data-brand">
				<xsl:text>data-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text>brand-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>

		</div>
	</xsl:template>
</xsl:stylesheet>
