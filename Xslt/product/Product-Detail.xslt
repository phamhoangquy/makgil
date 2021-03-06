<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="product-detail">
			<div class="container-custom">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="swiper-product-wrapper">
								<div class="swiper-product-thumbs">
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<xsl:if test="count(/ProductDetail/ProductImages)>0">
												<xsl:apply-templates select="/ProductDetail/ProductImages">
												</xsl:apply-templates>
											</xsl:if>

										</div>
									</div>
									<div class="product-thumb-prev"><em class="lnr lnr-chevron-up"></em></div>
									<div class="product-thumb-next"><em class="lnr lnr-chevron-down"> </em></div>
								</div>
								<div class="swiper-product-main">
									<div class="swiper-container">
										<div class="swiper-wrapper">
											<xsl:if test="count(/ProductDetail/ProductImages)>0">
												<xsl:apply-templates select="/ProductDetail/ProductImages">
												</xsl:apply-templates>
											</xsl:if>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="pro-detail">
								<h1 class="pro-name">
									<a>
										<xsl:attribute name="href">
											<xsl:value-of select="Url"></xsl:value-of>
										</xsl:attribute>
										<xsl:attribute name="title">
											<xsl:value-of select="Title"></xsl:value-of>
										</xsl:attribute>
										<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/Title">
										</xsl:value-of>
										<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes">
										</xsl:value-of>
									</a>

								</h1>
								<div class="pro-content">
									<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/BriefContent">
									</xsl:value-of>
								</div>
								<div class="pro-desc">
									<xsl:value-of disable-output-escaping="yes" select="/ProductDetail/FullContent">
									</xsl:value-of>
								</div>
								<div class="pro-price">
									<ul>
										<li>
											<a>Giá</a>
											<div class="button">
												<a href="/lien-he">
													<span>Liên hệ</span>
													<em class="mdi mdi-phone"></em></a>
											</div>
										</li>
										<li>
											<div class="support-zalo">
												<div class="img img-hover"><img
														src="/Data/Sites/1/skins/default/img/v-2/zalo.png"></img></div>
												<ul class="list-icon-share">
													<li>
														<a href="https://zalo.me/0902988005">
															<div class="img"><img
																	src="/Data/Sites/1/skins/default/img/v-2/zalo.png"></img>
															</div>
															<span>Sale 1</span>
														</a>
													</li>
													<li>
														<a href="https://zalo.me/0902949401">
															<div class="img"><img
																	src="/Data/Sites/1/skins/default/img/v-2/zalo.png"></img>
															</div>
															<span>Sale 2</span>
														</a>
													</li>
													<li>
														<a href="https://zalo.me/0932798882">
															<div class="img"><img
																	src="/Data/Sites/1/skins/default/img/v-2/zalo.png"></img>
															</div>
															<span>Sale 3</span>
														</a>
													</li>
												</ul>
											</div>
										</li>
										<li>
											<div class="support-skype">
												<div class="img img-hover"><img
														src="/Data/Sites/1/skins/default/img/v-2/skype.png"></img></div>
												<ul class="list-icon-share">
													<li>
														<a href="skype:liembui95.lb@gmail.com?chat">
															<div class="img"><img
																	src="/Data/Sites/1/skins/default/img/v-2/skype.png"></img>
															</div>
															<span>Sale 1</span>
														</a>
													</li>
													<li>
														<a href="skype:tinhdv@makgil.com?chat">
															<div class="img"><img
																	src="/Data/Sites/1/skins/default/img/v-2/skype.png"></img>
															</div>
															<span>Sale 2</span>
														</a>
													</li>
													<li>
														<a href="skype:nhathoangchau@hotmail.com?chat">
															<div class="img"><img
																	src="/Data/Sites/1/skins/default/img/v-2/skype.png"></img>
															</div>
															<span>Sale 3</span>
														</a>
													</li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
								<div class="social-network-share">
									<div class="icon">
										<a class="facebook" target="_blank">
											<xsl:attribute name='href'>
												<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
												<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
											</xsl:attribute>
											<em class="fab fa-facebook-f"></em>
										</a>
										<a class="twitter" target="_blank">
											<xsl:attribute name='href'>
												<xsl:text>https://twitter.com/intent/tweet?text=</xsl:text>
												<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
											</xsl:attribute>
											<em class="fab fa-twitter"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="product-description">
			<div class="container-custom">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="tab-panels">
								<ul class="tab-navigation">
									<li> <a href="javascript:void(0)" data-type="product-tab-1">Thông số kỹ thuật </a><a
											href="javascript:void(0)" data-type="product-tab-2">Tài liệu kỹ thuật </a><a
											href="javascript:void(0)" data-type="product-tab-3">Đánh giá</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="tab-wrapper">
						<xsl:apply-templates select="/ProductDetail/ProductAttributes"></xsl:apply-templates>
						<div class="tab-item" id="product-tab-3">
							<div class="product--description product-detail-commment">
								<!-- <div class="col-lg-6">
										<div class="description">
											<div class="content">
												<p>Chuyên dụng cho dụng cụ đo áp suất CE EMC (EN50081-2, EN50082-2)</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="pro-img">
											<div class="img"><img src="./img/sp-chi-tiet/pro-img-descript.png" alt="">
											</div>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="button">
											<button>Xem thêm<em class="lnr lnr-chevron-down"></em></button>
										</div>
									</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<xsl:if test="count(/ProductDetail/ProductOther) > 0">
			<section class="other-product">
				<div class="container-custom">
					<div class="container">
						<h2 class="head-title">
							<xsl:text>Sản phẩm liên quan </xsl:text>
						</h2>
						<div class="other-product-wrapper">
							<div class="nav-arrow-prev"><em class="mdi mdi-arrow-left"></em></div>
							<div class="nav-arrow-next"><em class="mdi mdi-arrow-right"></em></div>
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="/ProductDetail/ProductOther" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>


	<xsl:template match="ManufacturerOther">

	</xsl:template>
	<xsl:template match="ProductAttributes">
		<xsl:if test="position()=1">

			<div class="tab-item active" id="product-tab-1">
				<div class="product-detail-wrapper">
					<div class="product--description">
						<article>
							<div class="fullcontent">
								<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>

							</div>
							<div class="col-lg-12">
								<div class="btn-wrapper-center">
									<div class="btn-view-more">
										<span class='view-more-text'>Xem thêm</span>
										<span class='view-less-text'>Thu gọn</span>
										<em class="lnr lnr-chevron-down"></em>
									</div>
								</div>
							</div>
						</article>

					</div>
				</div>

			</div>
		</xsl:if>
		<xsl:if test="position()=2">
			<div class="tab-item" id="product-tab-2">
				<div class="product-detail-wrapper">
					<div class="product--description">
						<article>
							<div class="fullcontent">
								<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>

							</div>
							<div class="col-lg-12">
								<div class="btn-wrapper-center">
									<div class="btn-view-more">
										<span>Xem thêm</span>
										<em class="lnr lnr-chevron-down"></em>
									</div>
								</div>
							</div>
						</article>

					</div>
				</div>
			</div>
		</xsl:if>

	</xsl:template>
	<xsl:template match="ProductImages">
		<div class="swiper-slide">
			<div class="wrapper"><img>
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<div class="figure-product">
				<div class="figure-image zoom-in">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="overlay-text">
					<div class="bottom-wrapper">
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
					<h3 class='title'>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
