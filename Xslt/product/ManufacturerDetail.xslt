<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="container-custom">
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-3">
						<div class="side-navigation-wrapper brand-detail-custom">
							<div class="title-wrapper">
								<h2>
									<xsl:value-of disable-output-escaping="yes"
										select="/ManufacturerDetail/ModuleTitle"></xsl:value-of>
								</h2>
							</div>
							<ul class="side-navigation">
								<xsl:apply-templates select="/ManufacturerDetail/Zone"></xsl:apply-templates>
							</ul>
						</div>
					</div>
					<div class="col-12 col-lg-9">
						<section class="product-display">
							<h2 class="head-title">
								<!--<xsl:value-of disable-output-escaping="yes" select="/ManufacturerDetail/ZoneTitle"></xsl:value-of>-->
							</h2>
							<div class="row">
								<xsl:apply-templates select="/ManufacturerDetail/Product"></xsl:apply-templates>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
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


	<xsl:template match="Product">
		<div class="col-12 col-sm-6 col-md-4 col-lg-3">
			<div class="figure-product">
				<div class="figure-image zoom-in">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
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
				<div class="overlay-text">
					<div class="bottom-wrapper">
						<h2>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
							</a>

						</h2><a class="btn btn-arrow">

							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<em class="mdi mdi-arrow-right"></em>
						</a>
					</div>
				</div>
				<div class="figcaption">
					<h2>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</h2>
				</div>
			</div>
		</div>
	</xsl:template>


</xsl:stylesheet>
