<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <section class="news-display home-news">
            <div class="container-custom">
                <div class="container">
                    <h2 class="head-title">
                        <xsl:value-of disable-output-escaping="yes" select="/NewsList/ModuleTitle"></xsl:value-of>
                    </h2>
                    <div class="row">
                        <div class="col-lg-6">
                            <xsl:apply-templates select="/NewsList/News" mode='Big'></xsl:apply-templates>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <xsl:apply-templates select="/NewsList/News" mode='Small'></xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="News" mode='Big'>
        <xsl:if test="position()=1">
            <div class="figure-news big">
                <div class="figure-image shine">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
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
                    </a>
                </div>
                <div class="figcaption">
                    <time>
                        <em class="mdi mdi-clock-outline"></em>
                        <span>
                            <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                        </span>
                    </time>
                    <div class='title'>
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
                    </div>
                    <div class="caption">
                        <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                    </div>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="News" mode='Small'>
        <xsl:if test="position()> 1 and position() &lt; 6">
            <div class="col-12 col-md-6">
                <div class="figure-news">
                    <div class="figure-image opacity">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="Url"></xsl:value-of>
                            </xsl:attribute>
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
                        </a>
                    </div>
                    <div class="figcaption">
                        <time>
                            <em class="mdi mdi-clock-outline"></em>
                            <span>
                                <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                            </span>
                        </time>
                        <h3 class='title'>
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
                        </h3>
                    </div>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
