<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<!--Copy từ ProductDetail.xslt-->
		<xsl:if test="count(/ProductDetail/ProductSamePrice)>0">
			<div class="product-same-price">
				<xsl:apply-templates select="/ProductDetail/ProductSamePrice"></xsl:apply-templates>
			</div>
		</xsl:if>
		<xsl:if test="count(/ProductDetail/Specifications)>0 or /ProductDetail/Description != ''">
			<div class="product-specifications">
				<xsl:choose>
					<xsl:when test="count(/ProductDetail/Specifications)>0">
						<table>
							<xsl:choose>
								<xsl:when test="count(/ProductDetail/GroupSpecs)>0">
									<xsl:apply-templates select="/ProductDetail/GroupSpecs"></xsl:apply-templates>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="/ProductDetail/Specifications"></xsl:apply-templates>
								</xsl:otherwise>
							</xsl:choose>
						</table>
					</xsl:when>
					<xsl:when test="/ProductDetail/Description != ''">
						<div class="product-description">
							<div class="content">
								<xsl:value-of select="/ProductDetail/Description" disable-output-escaping="yes"></xsl:value-of>
							</div>
						</div>
					</xsl:when>
				</xsl:choose>
			</div>
		</xsl:if>
		<xsl:if test="count(/ProductDetail/ProductImages)>0">
			<div class="ajaxproductslider">
				<div class="swiper-container bigImages">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/ProductDetail/ProductImages" mode="_BigImages">
						</xsl:apply-templates>
					</div>
				</div>
				<div class="swiper-container thumbImages">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/ProductDetail/ProductImages" mode="_ThumbImages">
						</xsl:apply-templates>
					</div>
				</div>
			</div>
		</xsl:if>

			<div class="tr quantity">
			  <xsl:if test="/ProductDetail/OutStock != 'true' ">
					<span>Số lượng</span>
					<span>
						<span class="decrease">-</span>
						<!-- <input id="number" type="text" value="1" /> -->
						<input value="1" id="number">
						<xsl:attribute name="name">
							<xsl:text>addtocart_</xsl:text>
							<xsl:value-of select="/ProductDetail/ProductId"
								disable-output-escaping="yes"></xsl:value-of>
							<xsl:text>.EnteredQuantity</xsl:text>
						</xsl:attribute>
						</input>
						<span class="increase">+</span>
					</span>
        </xsl:if>
			</div>
		   <div class="productButton">
      <xsl:if test="/ProductDetail/OutStock != 'true'">
        <xsl:choose>
          <xsl:when test="/ProductDetail/PreOrder = 'true'">
            <a class="btnBuy btn-addtocart" href="javascript:void(0)"
              onclick="AjaxCart.addproducttocart_details(this); return false;">
              <xsl:attribute name="data-productid">
                <xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
              </xsl:attribute>Đặt Hàng Trước
            </a>
          </xsl:when>
          <xsl:otherwise>
            <a class="btnBuy btn-addtocart" href="javascript:void(0)"
              onclick="AjaxCart.addproducttocart_details(this); return false;">
              <xsl:attribute name="data-productid">
                <xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
              </xsl:attribute>Mua ngay
            </a>
            <xsl:if test="/ProductDetail/EnableTraGop = 'true'">
              <a class="btnBuy btn-addtocart" href="javascript:void(0)"
                onclick="AjaxCart.addproducttocart_details(this); return false;">
                <xsl:attribute name="data-productid">
                  <xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
                </xsl:attribute>Mua trả góp
              </a>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </div>
    <div class="tr status">
			<span>Tình trạng</span>
			<xsl:if test="/ProductDetail/OutStock != 'true' ">
				<span>Còn hàng</span>
			</xsl:if>
			<xsl:if test="/ProductDetail/OutStock = 'true' ">
				<span>Hết hàng</span>
			</xsl:if>
		</div>

	</xsl:template>

	<xsl:template match="GroupSpecs">
		<tr class="title">
			<td colspan="2">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</td>
		</tr>
		<xsl:apply-templates select="/ProductDetail/Specifications" mode="Group">
			<xsl:with-param name="GroupName" select="Title"></xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="Specifications" mode="Group">
		<xsl:param name="GroupName"></xsl:param>
		<xsl:if test="$GroupName=Group">
			<tr>
				<xsl:attribute name="data-title">
					<xsl:value-of select="$GroupName"></xsl:value-of>
				</xsl:attribute>
				<td>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</td>
				<td>
					<xsl:value-of select="Value" disable-output-escaping="yes"></xsl:value-of>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Specifications">
		<tr>
			<td>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of select="Value" disable-output-escaping="yes"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="ProductSamePrice">
		<div class="item">
			<div class="product-col">
				<figure>
					<div class="product-img">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="target">
								<xsl:value-of select="Target"></xsl:value-of>
							</xsl:attribute>
							<img class="lazy"
								src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7">
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl320"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</a>
					</div>
					<figcaption>
						<h2 class="product-name">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="target">
									<xsl:value-of select="Target"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select="Title"></xsl:value-of>
							</a>
						</h2>
						<div class="product-price">
							<div class="new">
								<xsl:choose>
									<xsl:when test="Price!=''">
										<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Giá: Liên hệ</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<xsl:if test="OldPrice != ''">
								<div class="old">
									<xsl:value-of select="OldPrice"></xsl:value-of>
								</div>
							</xsl:if>
						</div>
						<!--<div class="product-rating">
              <select class="bar-rating">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5" selected="selected">5</option>
              </select>
              <span>70 đánh giá</span>
            </div>-->
						<xsl:if test="CompiledMeta!=''">
							<div class="product-des">
								<xsl:value-of select="CompiledMeta" disable-output-escaping="yes"></xsl:value-of>
							</div>
						</xsl:if>
						<a rel="nofollow" class="compare-button link-compare">
							<xsl:attribute name="href">
								<xsl:value-of select="CompareListUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:text>So sánh chi tiết</xsl:text>
						</a>
					</figcaption>
				</figure>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductImages" mode="_ThumbImages">
		<div class="swiper-slide">
			<div class="item">
				<div class="product-img">
					<img>
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
	</xsl:template>

	<xsl:template match="ProductImages" mode="_BigImages">
		<div class="swiper-slide">
			<div class="item">
				<a class="product-img fancybox" data-fancybox="">
					<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img id="img_01">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="data-zoom-image">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</a>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
