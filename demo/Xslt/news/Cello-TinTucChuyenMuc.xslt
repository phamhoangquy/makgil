<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<!-- <div class="container"> -->
			<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
		<!-- </div> -->
	</xsl:template>

	<xsl:template match="Zone">
		<xsl:choose>
			<xsl:when test="position()=1">
				<div class="news-list news-2">
					<div class="row">
						<div class="col-12">
							<div class="list-title">
								<h2>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									Xem tất cả
								</a>
							</div>
						</div>
						<div class="col-12">
							<div class="content">
								<xsl:apply-templates select="News" mode="News1"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>

			<xsl:when test="position()=2">
				<div class="news-list news-3">
					<div class="row">
						<div class="col-12">
							<div class="list-title">
								<h2>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									Xem tất cả
								</a>
							</div>
						</div>
						<div class="col-12">
							<div class="content">
								<div class="row">
									<xsl:apply-templates select="News" mode="News2"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>

			<xsl:when test="position()=3">
				<div class="news-list news-2 hot-list">
					<div class="row">
						<div class="col-12">
							<div class="list-title">
								<h2>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									Xem tất cả
								</a>
							</div>
						</div>
						<div class="col-12">
							<div class="content">
								<div class="part-news">
									<div class="row">
										<xsl:apply-templates select="News" mode="News3"></xsl:apply-templates>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>

			<xsl:when test="position()=4">
				<div class="news-list news-2">
					<div class="row">
						<div class="col-12">
							<div class="list-title">
								<h2>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									Xem tất cả
								</a>
							</div>
						</div>
						<div class="col-12">
							<div class="content">
								<xsl:apply-templates select="News" mode="News4"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>

			<xsl:when test="position()=5">
				<div class="news-list news-3">
					<div class="row">
						<div class="col-12">
							<div class="list-title">
								<h2>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h2>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									Xem tất cả
								</a>
							</div>
						</div>
						<div class="col-12">
							<div class="content">
								<div class="row">
									<xsl:apply-templates select="News" mode="News2"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="News" mode="News1">
		<xsl:if test="position()>0 and position()&lt;7">
			<xsl:if test="position()=1">
				<xsl:text disable-output-escaping="yes">&lt;div class="top-news"&gt;&lt;div class="row"&gt;</xsl:text>
				<div class="col-md-6 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="position()=2">
				<div class="col-md-6 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
			</xsl:if>

			<xsl:if test="position()=3">
				<xsl:text disable-output-escaping="yes">&lt;div class="part-news"&gt;&lt;div class="row"&gt;</xsl:text>
				<div class="col-sm-6 col-lg-3 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="position()>3 and position()&lt;6">
				<div class="col-sm-6 col-lg-3 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="position()=6 or position()=last()">
				<div class="col-sm-6 col-lg-3 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="News" mode="News2">
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-6 top-news"&gt;</xsl:text>
		</xsl:if>

		<xsl:if test="position()=2">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-6 part-news"&gt;</xsl:text>
		</xsl:if>

		<xsl:if test="position()>0 and position()&lt;5">
			<div class="news-item">
				<a  class="item">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<figure>
						<div class="img"><img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
						<figcaption>
							<div class="time"><em class="far fa-calendar"></em>
								<time>
									<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
								</time>
							</div>
							<div class="title">
								<h3>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</div>
						</figcaption>
					</figure>
				</a>
			</div>
		</xsl:if>

		<xsl:if test="position()=4 or position()=1">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="News" mode="News3">
		<xsl:if test="position()>0 and position()&lt;4">
			<div class="col-md-4 news-item">
				<a  class="item">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<figure>
						<div class="img"><img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
						<figcaption>
							<div class="title">
								<h3>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</div>
						</figcaption>
					</figure>
				</a>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="News" mode="News4">
		<xsl:if test="position()>0 and position()&lt;7">
			<xsl:if test="position()=1">
				<xsl:text disable-output-escaping="yes">&lt;div class="top-news"&gt;&lt;div class="row"&gt;</xsl:text>
				<div class="col-md-6 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="position()=2">
				<div class="col-md-6 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
			</xsl:if>

			<xsl:if test="position()=3">
				<xsl:text disable-output-escaping="yes">&lt;div class="part-news"&gt;&lt;div class="row"&gt;</xsl:text>
				<div class="col-sm-6 col-lg-3 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="position()>3 and position()&lt;6">
				<div class="col-sm-6 col-lg-3 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="position()=6 or position()=last()">
				<div class="col-sm-6 col-lg-3 news-item">
					<a class="item">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<figure>
							<div class="img"><img>
								<xsl:attribute name="src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								</img>
							</div>
							<figcaption>
								<div class="time"><em class="far fa-calendar"></em>
									<time>
										<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
									</time>
								</div>
								<div class="title">
									<h3>
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</h3>
								</div>
							</figcaption>
						</figure>
					</a>
				</div>
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="News" mode="News5">
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-6 top-news"&gt;</xsl:text>
		</xsl:if>

		<xsl:if test="position()=2">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-6 part-news"&gt;</xsl:text>
		</xsl:if>

		<xsl:if test="position()>0 and position()&lt;5">
			<div class="news-item">
				<a  class="item">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<figure>
						<div class="img"><img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
						<figcaption>
							<div class="time"><em class="far fa-calendar"></em>
								<time>
									<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
								</time>
							</div>
							<div class="title">
								<h3>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</div>
						</figcaption>
					</figure>
				</a>
			</div>
		</xsl:if>

		<xsl:if test="position()=4 or position()=1">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
