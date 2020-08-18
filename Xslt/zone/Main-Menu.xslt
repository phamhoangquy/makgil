<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
        <ul class="nav-menu-primary">
            <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="Zone">
        <li>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text>active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="position()=1">
                <a href='/'>
                    <em class="mdi mdi-home"></em>
                </a>
            </xsl:if>
            <xsl:if test="count(Zone)>0">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">has-dropdown</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="count(Zone)>0 and IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">has-dropdown active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="position() !=1">
                <a class="nav-item">
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
                </a>
            </xsl:if>
            <xsl:if test="count(Zone)>0">
				<div class="toggle-mega-mobile">
					<em class="mdi mdi-chevron-down"></em>
				</div>
                <div class="mega-menu">
                    <ul class="dropdown-list">
                        <xsl:apply-templates select="Zone" mode="ZoneMenu2"></xsl:apply-templates>
                    </ul>
                </div>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="Zone" mode="ZoneMenu2">
        <li class="dropdown-item">
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">dropdown-item active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="count(Zone)>0">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">dropdown-item dropdown-item-has-dropdown</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="count(Zone)>0 and IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">dropdown-item dropdown-item-has-dropdown active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <div class="title-zone-2">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:value-of select="Target"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </a>
            </div>
            <xsl:if test="count(Zone)>0">
                <ul class="dropdown-list-2">
                    <xsl:apply-templates select="Zone" mode="ZoneMenu3"></xsl:apply-templates>
                </ul>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="Zone" mode="ZoneMenu3">
        <li class="dropdown-item-2">
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">dropdown-item-2 active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="count(Zone)>0 and IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">dropdown-item-2 active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <a >
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                    <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
