<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />
  <xsl:template match="/">
    <section class="cello-spNav">
      <div class="container">
        <div class="swiper-container">
          <div class="swiper-wrapper">
            <xsl:apply-templates select="/ManufacturerList/Manufacturer"></xsl:apply-templates>
            <div class="swiper-slide">
              <a href="/thuong-hieu">
                <span>Xem thêm</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>
  <xsl:template match="Manufacturer">
    <xsl:if test="position()  &lt; 8">
      <div class="swiper-slide">
        <a href="javascript:void(0)">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <img src="./img/home/sub-6.png" alt="">
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
          </img>
        </a>
      </div>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
