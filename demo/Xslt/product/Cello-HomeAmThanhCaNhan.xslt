<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone" />



	</xsl:template>
	<xsl:template match="Zone">

		<div class="content row no-gutters">
			<div class="left-content col-lg-4 col-xl-3">
				<div class="title" bg-img="/Data/Sites/1/skins/default/img/home/bg-2.png">
					<h4>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h4>
				</div>

				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="Manufacturer" />
					</div>
					<div class="swiper-next">
						<em class="lnr lnr-chevron-down"></em>
					</div>
				</div>
			</div>
			<div class="right-content col-lg-8 col-xl-9">
				<div class="title">
					<a href="javascript:void(0)">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" />
						</xsl:attribute>
						Xem tất cả<em class="lnr lnr-arrow-right"></em>
					</a>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">

						<xsl:apply-templates select="Product" />
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="swiper-slide">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url" />
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" />
				</xsl:attribute>
				<figure>
					<div class="img">
						<img src="/Data/Sites/1/skins/default/img/home/item-3.png" alt="">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl" />
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title" />
						</xsl:attribute>
						</img>

					</div>
					<figcaption>
						<div class="name">
							<h5>
								<xsl:value-of select="Title" />
							</h5>
						</div>
						<div class="price">
							<p>
								<xsl:value-of select="Price" />
							</p>
						</div>
					</figcaption>
				</figure>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="Manufacturer">
		<div class="swiper-slide">
			<div class="item">
				<a href="javascript:void(0)">
					<xsl:attribute name="href">
						<xsl:value-of select="Url" />
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" />
					</xsl:attribute>
					<img src="/Data/Sites/1/skins/default/img/home/2.png" alt="">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl" />
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" />
					</xsl:attribute>
					</img>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>