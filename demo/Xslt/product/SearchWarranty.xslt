<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="search-results">
			<xsl:if test="count(/WarrantyList/WarrantyItem) > 0">

				<h4>Kết quả tra cứu</h4>
				<div class="result-wrapper">
					<div class="info table">
						<div class="tr">
							<span class="fieldname">Tên khách hàng</span>
							<span class="value">
								<xsl:value-of select="/WarrantyList/FullName" />
							</span>
						</div>
						<div class="tr">
							<span class="fieldname">Số điện thoại</span>
							<span class="value">
								<xsl:value-of select="/WarrantyList/Phone" />
							</span>
						</div>
					</div>
					<xsl:apply-templates select="/WarrantyList/WarrantyItem"></xsl:apply-templates>
				</div>
			</xsl:if>
			<h4>Không tìm thấy dữ liệu phù hợp</h4>
		</div>
	</xsl:template>

	<xsl:template match="WarrantyItem">
		<div class="product table">
		<div class="tr">
			<span class="fieldname">Sản phẩm</span>
			<span class="value">
				<xsl:value-of select="Title"></xsl:value-of>
			</span>
		</div>
		<div class="tr">
			<span class="fieldname">Số Seri</span>
			<span class="value">
				<xsl:value-of select="Seri"></xsl:value-of>
			</span>
		</div>
		<div class="tr">
			<span class="fieldname">Ngày Mua</span>
			<span class="value">
				<xsl:value-of select="DateStart"></xsl:value-of></span>
		</div>
		<div class="tr">
			<span class="fieldname">Ngày hết hạn</span>
			<span class="value">
				<xsl:value-of select="DateEnd"></xsl:value-of></span>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet>
