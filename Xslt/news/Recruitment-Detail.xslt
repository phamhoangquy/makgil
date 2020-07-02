<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="hr-detail">
			<div class="container-custom">
				<div class="container">
					<div class="row">
						<div class="col-lg-9">
							<div class="card-title">
								<h1>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title">
									</xsl:value-of>
									<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes">
									</xsl:value-of>
								</h1>
								<time>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/CreatedDate">
									</xsl:value-of>
								</time>
							</div>
							<div class="card-body">
								<xsl:if test="count(/NewsDetail/NewsAttributes)>0">
									<div class="table-striped-detail-wrapper">

										<table class="table table-striped">
											<tbody>

												<xsl:apply-templates select="/NewsDetail/NewsAttributes">
												</xsl:apply-templates>
											</tbody>
										</table>
									</div>
								</xsl:if>
								<div class="fullcontent">
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent">
									</xsl:value-of>

								</div>
								<div class="apply-form">
									<div class="btn  button-apply"> <a href="javascript:void(0)">Ứng tuyển ngay</a>
									</div>
									<div class="btn  button-download"><a target="_blank">
											<xsl:attribute name="href">
												<xsl:value-of select="/NewsDetail/FileUrl"></xsl:value-of>
											</xsl:attribute>
											<xsl:text disable-output-escaping="yes">Tải mẫu đơn xin việc</xsl:text>
										</a>
									</div>
								</div>
								<div class="form-apply">
									<iframe>
										<xsl:attribute name="src">
											<xsl:value-of select="/NewsDetail/ApplyUrl"></xsl:value-of>
										</xsl:attribute>
									</iframe>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="right-hr-detail">
								<div class="card-title">
									<h2>VỊ TRÍ KHÁC</h2>
								</div>
								<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>


							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<tr>
			<th scope="row">
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</th>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="content">
			<time>
				<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
			</time>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
