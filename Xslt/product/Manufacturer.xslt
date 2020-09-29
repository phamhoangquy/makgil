<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="left-brand">
      <div class="card-title">
        <h2>
          <!--THƯƠNG HIỆU-->
          <xsl:value-of select ="/ManufacturerList/ModuleTitle" ></xsl:value-of>
        </h2>
      </div>
      <div class="content">
        <ul>
          <!--<li>
            <a href="">Alloy electric</a>
          </li>
          <li>
            <a href="">Atx appletan</a>
          </li>
          <li>
            <a href="">Autrol</a>
          </li>
          <li>
            <a href="">Belzona</a>
          </li>
          <li>
            <a href="">Daehan sensor</a>
          </li>
          <li>
            <a href="">Drastar</a>
          </li>
          <li>
            <a href="">lec</a>
          </li>
          <li>
            <a href="">Kaval valve</a>
          </li>
          <li>
            <a href="">O.erre</a>
          </li>
          <li>
            <a href="">Omet              </a>
          </li>-->
          <xsl:apply-templates select="/ManufacturerList/Manufacturer"></xsl:apply-templates>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Manufacturer">
    <li>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
          <xsl:text>?index=</xsl:text>
        <xsl:value-of select="/ManufacturerList/ZoneId"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a> 
    </li>
  </xsl:template>

</xsl:stylesheet>