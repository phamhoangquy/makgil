<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <ul class="language-list">
      <xsl:apply-templates select="/LanguageList/Language">

      </xsl:apply-templates>
    </ul>
  </xsl:template>
  <xsl:template match="Language">
        <li>
        <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
        </a>
        </li>
  </xsl:template>

</xsl:stylesheet>