<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="tap-cello-thuonghieu-ct">
			<div class="container">
				<div class="cello-navTab">
					<div class="cello-mbTab">Danh sách</div>
					<ul class="cello-tabList">
						<xsl:apply-templates select="/ManufacturerDetail/Zone" mode="Cate"></xsl:apply-templates>
					</ul>
				</div>
			</div>
		</section>
		<section class="cello-thuonghieu-ct">
			<div class="container">
				<!-- <div class="filter-nav"><div class="select"><div class="select-show"><span>Tính năng</span></div><div class="select-list"><div class="select-item">test</div><div class="select-item">test2</div></div></div><div class="select"><div class="select-show"><span>Giá</span></div><div class="select-list"><div class="select-item">test</div><div class="select-item">test2</div></div></div><div class="select"><div class="select-show"><span>Sắp xếp theo</span></div><div class="select-list"><div class="select-item">Nổi bật</div><div class="select-item">Giá từ thấp đến cao</div><div class="select-item">Giá từ cao đến thấp</div></div></div></div> -->
				<div class="cello-tabContent">
					<div class="row list-item no-gutters active" cello-tabContent="1">
						<xsl:apply-templates select="/ManufacturerDetail/Product" />
						<xsl:if test="/ManufacturerDetail/TotalPage>1">
							<div class="col-12">
								<div class="cello-viewMore">
									<a href="#" data-next="2" class="ajaxbrandviewmore btn-loadmore">
										<xsl:attribute name="href">
											<xsl:value-of select="/ManufacturerDetail/UrlOutPagenumber"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="data-manufacturerid">
											<xsl:value-of select="/ManufacturerDetail/ManufacturerId"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="data-zoneid">
											<xsl:value-of select="/ManufacturerDetail/ZoneId"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="data-totalpages">
											<xsl:value-of select="/ManufacturerDetail/TotalPage"></xsl:value-of>
										</xsl:attribute>
										<xsl:text>Xem thêm</xsl:text>
									</a>
								</div>
							</div>
						</xsl:if>
					</div>
					<xsl:apply-templates select="/ManufacturerDetail/Zone"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone" mode="Cate">
		<li class="item">
			<xsl:attribute name="tab-index">
				<xsl:value-of select="ZoneId"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="cello-tabItem">
				<xsl:value-of select="position() + 1"></xsl:value-of>
			</xsl:attribute>
			<!-- 			<xsl:if test="position() = 1"><xsl:attribute name="class"><xsl:text>item active</xsl:text></xsl:attribute></xsl:if> -->
			<div class="img">
				<img alt="">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<!-- <xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute> -->
				</img>
			</div>
			<p>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</p>
		</li>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="row list-item no-gutters" cello-tabContent="1">
			<xsl:attribute name="cello-tabContent">
				<xsl:value-of select="position() + 1" />
			</xsl:attribute>
			<!-- <xsl:if test="position() = 1"><xsl:attribute name="class"><xsl:text>row list-item no-gutters active</xsl:text></xsl:attribute></xsl:if> -->
			<xsl:apply-templates select="Product"></xsl:apply-templates>
			<xsl:if test="TotalPage>1">
				<div class="col-12">
					<div class="cello-viewMore">
						<a href="#" data-next="2" class="ajaxbrandviewmore btn-loadmore">
							<xsl:attribute name="href">
								<xsl:value-of select="UrlOutPagenumber"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-manufacturerid">
								<xsl:value-of select="/ManufacturerDetail/ManufacturerId"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-zoneid">
								<xsl:value-of select="ZoneId"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-totalpages">
								<xsl:value-of select="TotalPage"></xsl:value-of>
							</xsl:attribute>
							<xsl:text>Xem thêm</xsl:text>
						</a>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="Product">
		<div class="col-xl-item col-6 col-sm-4 col-lg-3 productItem">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<div class="top-item">
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
					<xsl:if test="OldPrice!=0">
						<div class="pro">
							<span>
								<xsl:text disable-output-escaping="yes">-</xsl:text>
								<xsl:value-of select="Percent" disable-output-escaping="yes"></xsl:value-of>
								<xsl:text disable-output-escaping="yes">%</xsl:text>
							</span>
						</div>
					</xsl:if>
					<xsl:if test="PromotionCatalogText != ''">
						<div class="gift">
							<em class="fas fa-gift"></em>
							<span>Quà tặng</span>
						</div>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 4) mod 2 = 1">
							<div class="status stt-1">
								<span>New</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 8) mod 2 = 1">
							<div class="status stt-2">
								<span>Sắp có hàng</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 16) mod 2 = 1">
							<div class="status stt-3">
								<span>Like new</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 32) mod 2 = 1">
							<div class="status stt-4">
								<span>Hàng 99%</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 64) mod 2 = 1">
							<div class="status stt-5">
								<span>Hàng demo</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 1024) mod 2 = 1">
							<div class="status stt-5">
								<span>Pre-Order</span>
							</div>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 128) mod 2 = 1">
							<div class="sale sl-1">
								<span>Sale cực sốc</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 256) mod 2 = 1">
							<div class="sale sl-2">
								<span>Loa di động</span>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 512) mod 2 = 1">
							<div class="sale sl-3">
								<span>Bán chạy</span>
							</div>
						</xsl:when>
					</xsl:choose>
				</div>
				<div class="bottom-item">
					<!-- <div class="color"><xsl:apply-templates select="ProductColorImage"></xsl:apply-templates></div> -->
					<div class="name">
						<h5>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h5>
					</div>
					<div class="price">
						<div class="old">
							<span>
								<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
						<div class="new">
							<span>
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</span>
						</div>
					</div>
				</div>
			</a>
			<xsl:if test="PromotionCatalogText != ''">
				<div class="gift-detail">
					<div class="detail-wrapper">
						<div class="detail-title">
							<h5>Quà tặng kèm</h5>
							<div class="detail-close">
								<em class="mdi mdi-close"></em>
							</div>
						</div>
						<div class="detail-info">
							<xsl:value-of select="PromotionCatalogText" disable-output-escaping="yes" />
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="ProductColorImage">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="ProductUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="color-item">
				<xsl:if test="position() = 1">
					<xsl:attribute name="class">
						<xsl:text>color-item active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<img>
				<xsl:attribute name="src">
					<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="ProductTitle"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</a>
	</xsl:template>
</xsl:stylesheet>