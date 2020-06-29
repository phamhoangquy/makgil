<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="news-detail">
			<div class="container-custom">
				<div class="container">
					<div class="row">
						<div class="col-lg-9">
							<div class="card-title">
								<h1>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title">
									</xsl:value-of>
									<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes">
									</xsl:value-of>
								</h1>
								<div class="bottom-wrapper-news-detail">
									<time>
										<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/CreatedDate"></xsl:value-of>
									</time>
									<div class="social-network-share">
										<div class="icon">
											<a class="facebook" target="_blank">
												<xsl:attribute name='href'>
													<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
													<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
												</xsl:attribute>
												<em class="fab fa-facebook-f"></em>
											</a>
											<a class="twitter" target="_blank">
												<xsl:attribute name='href'>
													<xsl:text>https://twitter.com/intent/tweet?text=</xsl:text>
													<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
												</xsl:attribute>
												<em class="fab fa-twitter"></em>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="fullcontent">


								<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent">
								</xsl:value-of>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="right-news">
								<div class="card-title">
									<h3>VỊ TRÍ KHÁC</h3>
								</div>
								<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>


							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="NewsOther">
		<div class="card-body">
			<div class="img">
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
			<div class="content">
				<time>
					<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
				</time><a class="lcl lcl-2">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</a>


				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
