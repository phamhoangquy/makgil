<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="position()=1">

			<section class="about">
				<div class="container-custom">
					<div class="container">
						<xsl:apply-templates select="News" mode='News-1'></xsl:apply-templates>


					</div>
				</div>
			</section>
		</xsl:if>
		<xsl:if test="position()=2">

			<section class="about-2">
				<xsl:attribute name="setBackground">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<div class="container-custom">
					<div class="container">
						<div class="row">
							<xsl:apply-templates select="News" mode='News-2'></xsl:apply-templates>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>

	</xsl:template>
	<xsl:template match="News" mode='News-1'>

		<div class="row">
			<div class="col-lg-6">
				<div class="wrapper">
					<div class="card-title">
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
					</div>
					<div class="over-flow-scollbar">
						<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card-img">
					<div class="img"><img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
				</div>
			</div>
		</div>

	</xsl:template>
	<xsl:template match="News" mode='News-2'>

		<div class="col-12 col-md-6">
			<div class="cards">
				<div class="card-title">
					<div class="image-wrapper">
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<h2>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h2>
				</div>
				<div class="content">
					<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
				</div>
			</div>
		</div>

	</xsl:template>
</xsl:stylesheet>
