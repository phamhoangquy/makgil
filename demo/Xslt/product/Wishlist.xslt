<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/ShoppingCart/CartItem)>0">
      <section class="wishlist clearfix">
        <div class="row">
          <xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
        </div>
      </section>
    </xsl:if>
  </xsl:template>

  <xsl:template match="CartItem">
    <article class="col-6 col-sm-4 col-md-3">
      <div class="product-col">
        <figure>
          <xsl:if test="floor(ShowOption div 1) mod 2 = 1">
            <div class="promotion sale">
              <xsl:text>NEW</xsl:text>
            </div>
          </xsl:if>
          <xsl:if test="floor(ShowOption div 2) mod 2 = 1">
            <div class="promotion sale">
              <xsl:text>SALE</xsl:text>
            </div>
          </xsl:if>
          <div class="product-popup">
            <a class="btn-viewdetail">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:apply-templates select="/ShoppingCart/DetailText"></xsl:apply-templates>
			  <span>Chi tiết</span>
            </a>
            <xsl:choose>
				<xsl:when test="StockQuantity =0">
					<a href="#!"  class="hvr-shutter-out-horizontal btn-buy btn-soldout">
					  <span>
					  Hết hàng
					  </span>
					</a>
				</xsl:when>
				<xsl:otherwise>
				<a href="#!" class="btn-buy" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
					<xsl:attribute name="data-productid">
					  <xsl:value-of select="ProductId"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="/ProductList/BuyText"></xsl:value-of>
					<span>Mua hàng</span>
				  </a>
				</xsl:otherwise>
			</xsl:choose>
			 <a href="#" title="So sánh" class="compare btn_compare">
				<xsl:attribute name="data-productid">
				  <xsl:value-of select="ProductId"></xsl:value-of>
				</xsl:attribute>
				<xsl:if test="AddedCompare='true'">
				  <xsl:attribute name="class">
					<xsl:text>compare btn_compare active</xsl:text>
				  </xsl:attribute>
				</xsl:if>
				<xsl:text>So sánh</xsl:text>
			  </a>
			<xsl:if test="TextPlus!=''">
				<div class="text-discount">
					<xsl:value-of select="TextPlus"></xsl:value-of>
				</div>
			</xsl:if>
          </div>
          <a class="product-img">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
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
          <figcaption>
            <div class="product-color">
              <xsl:apply-templates select="ProductListColors"></xsl:apply-templates>
            </div>
            <div class="product-brand">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="ManufacturerURL"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Manufacturer" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </div>
            <h3 class="product-name">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
            <div class="product-kind">
              <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="product-price clearfix">
              <xsl:choose>
                <xsl:when test="Price!=''">
                  <div class="new">
                    <xsl:value-of select="Price"></xsl:value-of>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="new">
                    <xsl:value-of select="/ShoppingCart/ContactText" disable-output-escaping="yes"></xsl:value-of>
                  </div>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:if test="OldPrice != ''">
                <div class="old">
                  <xsl:value-of select="OldPrice"></xsl:value-of>
                </div>
              </xsl:if>
            </div>
          </figcaption>
        </figure>
      </div>
    </article>
  </xsl:template>

  <xsl:template match="ProductListColors">
    <xsl:if test="ColorCode != ''">
      <div class="color">
        <xsl:attribute name="style">
          <xsl:text>background-color:</xsl:text>
          <xsl:value-of select="ColorCode"></xsl:value-of>
          <xsl:text>;display:block;</xsl:text>
        </xsl:attribute>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Quantities">
    <option>
      <xsl:attribute name="value">
        <xsl:value-of select="Quantity"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Quantity"></xsl:value-of>
    </option>
  </xsl:template>

  <xsl:template match="Attributes">
    <div class="productsize">
      <xsl:value-of select="Title"></xsl:value-of>
      <xsl:text>: </xsl:text>
      <strong>
        <xsl:apply-templates select="Options"></xsl:apply-templates>
      </strong>
    </div>
  </xsl:template>

  <xsl:template match="Options">
    <xsl:if test="IsActive='true'">
      <xsl:value-of select="Title"></xsl:value-of>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
