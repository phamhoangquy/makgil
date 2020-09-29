<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <section class="brand-display">
            <div class="container-custom">
                <div class="container">
                    <h2 class="head-title">
                        <xsl:value-of disable-output-escaping="yes" select="/BannerList/ModuleTitle"></xsl:value-of>
                    </h2>
                    <div class="brand-swiper-wrapper">
                        <div class="nav-arrow-prev">
                            <em class="mdi mdi-arrow-left"></em>
                        </div>
                        <div class="nav-arrow-next">
                            <em class="mdi mdi-arrow-right"></em>
                        </div>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="Banner">
        <div class="swiper-slide">
            <div class="wrapper zoom-in">
                <a>
                    <xsl:if test="Url !=''">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                        <img class="lazyload" src="/Data/Sites/1/media/default.jpg">
                            <xsl:attribute name="data-src">
                                <xsl:value-of select="ImageUrl"></xsl:value-of>
                            </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                    </img>
                    <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                </a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
