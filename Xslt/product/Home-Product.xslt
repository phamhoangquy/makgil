<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <setion class="product-section home-product">
            <div class="container-custom">
                <div class="container">
                    <div class="card-title">
                        <h3>
                            <xsl:value-of disable-output-escaping="yes" select="/ProductList/ModuleTitle"></xsl:value-of>
                        </h3>
                    </div>
                    <div class="row">
                        <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
                    </div>
                </div>
            </div>
        </setion>
    </xsl:template>
    <xsl:template match="Product">
        <div class="col-w-5">
            <div class="figure-product">
                <div class="figure-image zoom-in">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <img class="lazyload" src="/Data/Sites/1/media/default.jpg">
                            <xsl:attribute name="data-src">
                                <xsl:value-of select="ThumbnailUrl"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="overlay-text">
                    <div class="bottom-wrapper">
                        <h2>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="Url"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name="title">
                                    <xsl:value-of select="Title"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                            </a>
                        </h2>
                        <a class="btn btn-arrow">
                            <xsl:attribute name="href">
                                <xsl:value-of select="Url"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <em class="mdi mdi-arrow-right"></em>
                        </a>
                    </div>
                </div>
                <div class="figcaption">
                    <h2>
                        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                    </h2>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
