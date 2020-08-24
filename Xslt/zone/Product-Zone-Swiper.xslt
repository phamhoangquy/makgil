<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <section class="home-product-zone">
            <div class="container-custom">
                <div class="container">
                    <div class="nav-arrow-prev">
                        <em class="mdi mdi-arrow-left"></em>
                    </div>
                    <div class="nav-arrow-next">
                        <em class="mdi mdi-arrow-right"></em>
                    </div>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="Zone">
        <xsl:apply-templates select="Zone" mode='Sub'></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="Zone" mode='Sub'>
        <div class="swiper-slide">
            <div class="figure-product-zone">
                <div class="figure-image zoom-in">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <img class="lazyload">
                            <xsl:attribute name="data-src">
                                <xsl:value-of select="ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="figcaption">
                    <h2>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="Url"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                        </a>
                    </h2>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
