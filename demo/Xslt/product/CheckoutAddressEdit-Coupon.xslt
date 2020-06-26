<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="checkout-title">
			<h3><span class="fas fa-shopping-cart"></span><span>Sử dụng mã giảm giá</span></h3>
		</div>

		<div class="coupon-info">
			<xsl:choose>
				<xsl:when test="/CheckoutAddress/CouponCode!=''">
					<span class="code">
						<xsl:value-of select="/CheckoutAddress/CouponCode"></xsl:value-of>
					</span>
					<span class="title">
						<xsl:value-of select="/CheckoutAddress/CouponTitle"></xsl:value-of>
					</span>
					<input type="button" onclick="AjaxCart.removecoupon();return false;" class="remove" value=""
						runat="server" />
				</xsl:when>
				<xsl:otherwise>
					<div class="form-group">
						<input type="text" id="couponCode" autocomplete="off" max-length="20"
							placeholder="Nhập mã giảm giá">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="/CheckoutAddress/plCoupon"></xsl:value-of>
						</xsl:attribute>
						</input>
						<button class="btn-submitcoupon" onclick="AjaxCart.applycoupon();return false;">
							Áp Dụng
						</button>
						<span class="coupon-apply-error"></span>
					</div>
					<div class="desc">
						<i>Sau khi áp dụng, Mã giảm giá có thể không dùng được trong vòng 15 phút.</i>
						<p>Trong quá trình thanh toán, Cello sẽ tạm khóa mã giảm giá của quý khách để đảm bảo phiên
							giao dịch được ổn định.</p>
						<p>Mã giảm giá sẽ được mở lại ngay khi phiên giao dịch kết thúc</p>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>

	</xsl:template>

</xsl:stylesheet>