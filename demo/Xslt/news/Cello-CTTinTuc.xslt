<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<time class="createdDate">
						<span class="far fa-calendar"></span>
						<span>
							<xsl:value-of select="/NewsDetail/CreatedDate" disable-output-escaping="yes"></xsl:value-of>
						</span>
					</time>
				</div>
				<div class="col-lg-8">
					<h1 class="title">
						<xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
						<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h1>
					<div class="briefContent">
						<xsl:value-of select="/NewsDetail/BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="fullContent">
						<xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
					</div>

					<div class="socialShare">
						<a class="facebook" target="_blank">
							<xsl:attribute name="href">
								<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
								<xsl:value-of select="/NewsDetail/FullUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<span class="fab fa-facebook-f"></span>
							<span>Share On Facebook</span>
						</a>
						<a class="twitter" target="_blank">
							<xsl:attribute name="href">
								<xsl:text>https://twitter.com/home?status=</xsl:text><xsl:value-of select="/NewsDetail/FullUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<span class="fab fa-twitter"></span>
							<span>Tweet it</span>
						</a>
						<a class="pinterest" target="_blank">
							<xsl:attribute name="href">
								<xsl:text disable-output-escaping="yes">https://pinterest.com/pin/create/button/?url=&amp;media=&amp;description=</xsl:text><xsl:value-of select="/NewsDetail/FullUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<span class="fab fa-pinterest"></span>
						</a>
						<a class="google" target="_blank">
							<xsl:attribute name="href">
								<xsl:text>https://plus.google.com/share?url=</xsl:text><xsl:value-of select="/NewsDetail/FullUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<span class="fab fa-google-plus-g"></span>
						</a>
						<a class="envelope" target="_blank">
							<xsl:attribute name="href">
								<xsl:text>mailto:?</xsl:text><xsl:value-of select="/NewsDetail/FullUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<span class="fa fa-envelope"></span>
						</a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="otherNews">
						<h2>Tin tức khác</h2>
						<ul>
							<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsOther">
		<xsl:if test="position()&lt;4">
			
		<li class="item">
			<div class="img">
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
			<a class="caption">
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<time class="createdDate">
					<span class="far fa-calendar"></span>
					<span>
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
					</span>
				</time>
				<h4>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h4>
			</a>
		</li>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
