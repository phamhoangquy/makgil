<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="container-custom brand-detail-section">
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-3">
						<div class="main-auto-scroll-nav">
							<div class="side-navigation-wrapper brand-detail-custom">
								<div class="title-wrapper">
									<h2>
										<xsl:value-of disable-output-escaping="yes" select="/ManufacturerDetail/ModuleTitle" />
									</h2>
								</div>
								<ul class="side-navigation">
									<xsl:choose>
										<xsl:when test="count(/ManufacturerDetail//Zone[IsActive = 'True']) > 0 ">
											<xsl:apply-templates select="/ManufacturerDetail/Zone" mode="Only"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="/ManufacturerDetail/Zone"/>
										</xsl:otherwise>
									</xsl:choose>
								</ul>
							</div>
							<div class="side-navigation-wrapper brand-detail-custom">
								<div class="title-wrapper">
									<h2>
										Thương hiệu khác
									</h2>
								</div>
								<ul class="side-navigation">
									<xsl:apply-templates select="/ManufacturerDetail/ManufacturerOther"/>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-9">
						<section class="product-display">
							<h2 class="head-title">
								<xsl:value-of disable-output-escaping="yes" select="/ManufacturerDetail/Title"></xsl:value-of>
							</h2>
							<div class="row">
								<xsl:apply-templates select="/ManufacturerDetail/Product" />
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ManufacturerOther">
		<li class="drop-down">
			<div class="title">
				<a >
					<xsl:attribute name="href">
						<xsl:value-of select="Url" />
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" />
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="Title" />
				</a>
			</div>
		</li>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:if test="Depth='1'">
			<li class="drop-down">
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="count(Zone) &gt; 0">
					<xsl:if test="(IsActive = 'True') or (count(.//Zone[IsActive = 'True']) > 0 )">
						<xsl:attribute name="class">
							<xsl:text>active open</xsl:text>
						</xsl:attribute>
					</xsl:if>
					<div class="title">
						<a href="javascript:void(0)" class="manufacturer-index">
							<xsl:attribute name="tab-index">
								<xsl:value-of select="ZoneId" />
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" />
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title" />
						</a>
						<em class="lnr lnr-chevron-down" />
					</div>
					<ul class="nav-sub">
						<xsl:apply-templates select="Zone" mode="Child" />
					</ul>
				</xsl:if>
				<xsl:if test="count(Zone) &lt; 1">
					<div class="title">
						<a href="javascript:void(0)" class="manufacturer-index">
							<xsl:attribute name="tab-index">
								<xsl:value-of select="ZoneId" />
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" />
								<xsl:value-of select="IsActive" />
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title" />
						</a>
					</div>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Only">
		<xsl:if test="Depth='1' and (IsActive = 'True') or (count(.//Zone[IsActive = 'True']) > 0)">
			<li class="drop-down">
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="count(Zone) &gt; 0">
					<xsl:if test="(IsActive = 'True') or (count(.//Zone[IsActive = 'True']) > 0 )">
						<xsl:attribute name="class">
							<xsl:text>active open</xsl:text>
						</xsl:attribute>
					</xsl:if>
					<div class="title">
						<a href="javascript:void(0)" class="manufacturer-index">
							<xsl:attribute name="tab-index">
								<xsl:value-of select="ZoneId" />
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" />
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title" />
						</a>
						<em class="lnr lnr-chevron-down" />
					</div>
					<ul class="nav-sub">
						<xsl:apply-templates select="Zone" mode="Child" />
					</ul>
				</xsl:if>
				<xsl:if test="count(Zone) &lt; 1">
					<div class="title">
						<a href="javascript:void(0)" class="manufacturer-index">
							<xsl:attribute name="tab-index">
								<xsl:value-of select="ZoneId" />
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" />
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title" />
						</a>
					</div>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Child">
		<xsl:if test="Depth='2' and ProductCount > 0">
			<li>
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">drop-down-2</xsl:text>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="count(Zone) &gt; 0 and ProductCount > 0  ">
						<xsl:if test="IsActive='true'">
							<xsl:attribute name="class">
								<xsl:text>drop-down-2 active open</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<div class="title-2">
							<a href="javascript:void(0)" class="manufacturer-index">
								<xsl:attribute name="tab-index">
									<xsl:value-of select="ZoneId" />
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title" />
								</xsl:attribute>
								<xsl:value-of disable-output-escaping="yes" select="Title" />
							</a>
							<em class="lnr lnr-chevron-down" />
						</div>
						<ul class="nav-sub-2">
							<xsl:apply-templates select="Zone" mode="Child2" />
						</ul>
					</xsl:when>
					<xsl:otherwise>
						<div class="title-2">
							<a href="javascript:void(0)" class="manufacturer-index">
								<xsl:attribute name="tab-index">
									<xsl:value-of select="ZoneId" />
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title" />
								</xsl:attribute>
								<xsl:value-of disable-output-escaping="yes" select="Title" />
							</a>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Zone" mode="Child2">
		<xsl:if test="Depth='3'  and ProductCount > 0">
			<li>
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<a href="javascript:void(0)" class="manufacturer-index">
					<xsl:attribute name="tab-index">
						<xsl:value-of select="ZoneId" />
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" />
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="Title" />
				</a>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-6 col-sm-6 col-md-4 col-lg-3">
			<div class="figure-product">
				<div class="figure-image zoom-in">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url" />
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" />
						</xsl:attribute>
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl" />
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title" />
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="overlay-text">
					<div class="bottom-wrapper">
						<h2>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url" />
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title" />
								</xsl:attribute>
								<xsl:value-of disable-output-escaping="yes" select="Title" />
								<xsl:value-of select="EditLink" disable-output-escaping="yes" />
							</a>
						</h2>
						<a class="btn btn-arrow">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" />
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" />
							</xsl:attribute>
							<em class="mdi mdi-arrow-right" />
						</a>
					</div>
				</div>
				<div class="figcaption">
					<h2>
						<xsl:value-of disable-output-escaping="yes" select="Title" />
					</h2>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
