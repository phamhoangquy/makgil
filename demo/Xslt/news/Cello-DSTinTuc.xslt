<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="container">
			<div class="cello-title">
				<h2>
					<xsl:value-of select="/NewsList/ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
				</h2>
			</div>
			<div class="news-list">
				<div class="top-news">
					<div class="row">
						<xsl:apply-templates select="/NewsList/News" mode="Big"></xsl:apply-templates>
					</div>
				</div>
				<div class="part-news">
					<div class="row">
						<xsl:apply-templates select="/NewsList/News" mode="Small"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="Big">
		<xsl:if test="position()=1 or position()=2">
			<div class="col-md-6 item">
				<a >
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<figure>
						<div class="img"><img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
						<figcaption>
							<div class="time"><em class="far fa-calendar"></em>
								<time>
									<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
								</time>
							</div>
							<div class="title">
								<h3>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</div>
						</figcaption>
					</figure>
				</a>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="News" mode="Small">
		<xsl:if test="position()>2">
			<div class="col-sm-6 col-md-4 col-lg-3 item">
				<a >
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<figure>
						<div class="img"><img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
						<figcaption>
							<div class="time"><em class="far fa-calendar"></em>
								<time>
									<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
								</time>
							</div>
							<div class="title">
								<h3>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</div>
						</figcaption>
					</figure>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
