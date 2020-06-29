<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="form-hr">
			<div class="container-custom">
				<div class="container">
					<div class="card-title">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="/NewsList/ModuleTitle"></xsl:value-of>
						</h3>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="card-body">
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col">
												<xsl:text disable-output-escaping="yes">STT</xsl:text>
											</th>
											<th scope="col">Vị trí tuyển dụng </th>
											<th scope="col">Số lượng</th>
											<th scope="col">Khu vực</th>
											<th scope="col">Thời hạn</th>
										</tr>
									</thead>
									<tbody>
										<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>

									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="News">
		<tr>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</td>
			<td>
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
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="EndDate"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
