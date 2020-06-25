$(document).ready(function () {
	swiperInit();
	toggleMobileMenu();
	mappingMenu();
	mappingContact();
	mappingSearch();

});
//Check if windows size large then 1024 then these function will be execute
if ($(window).width() > 1024) {
	const $menu = $(".searchbox");
	$(document).mouseup(e => {
		if (
			!$menu.is(e.target) && // if the target of the click isn't the container...
			$menu.has(e.target).length === 0
		) {
			// ... nor a descendant of the container
			$menu.removeClass("active");
		}
	});
}
// Remove when click outside the circle

function tabActive() {
	$(".tab-list-navigation li a").on("click", function () {
		$(this)
			.parents(".tab-list-navigation")
			.find("li")
			.removeClass("active");
		$(this)
			.parents("li")
			.addClass("active");

		var display = $(this).attr("data-type");
		$(".tab-item").removeClass("active");
		$("#" + display).addClass("active");
	});
}

function swiperInit() {


	var homerSwiper = new Swiper(".home-product-zone .swiper-container", {
		// Optional parameters
		speed: 1205,
		slidesPerView: 1,
		spaceBetween: 20,

		autoplay: {
			delay: 3000
		},
		navigation: {
			nextEl: '.nav-arrow-next',
			prevEl: '.nav-arrow-prev',
		},
		breakpointsInverse: true,
		breakpoints: {
			320: {
				slidesPerView: 1,

			},
			400: {
				slidesPerView: 2,

			},
			480: {
				slidesPerView: 3,

			},
			768: {
				slidesPerView: 4,

			},
			1025: {
				slidesPerView: 6,

			},
			1440: {
				slidesPerView: 8,

			},
		},

	});
	var homerSwiper = new Swiper(".home-banner .swiper-container", {
		// Optional parameters
		speed: 1205,
		slidesPerView: 1,
		autoplay: {
			delay: 3000
		},
		pagination: {
			el: ".home-banner-pagination",
			type: "bullets",
			clickable: "true"
		}
	});

	var swiper = new Swiper('.product-logo__slide .product-logo', {
		slidesPerView: 6,
		spaceBetween: 0,
		loop: true,
		speed: 1000,
		// autoplay: {
		// 	delay: 1000,
		// 	disableOnInteraction: false,
		// },
		navigation: {
			nextEl: '.product-logo__slide .swiper-button-next',
			prevEl: '.product-logo__slide .swiper-button-prev',
		},
		breakpointsInverse: true,
		breakpoints: {
			320: {
				slidesPerView: 1,

			},
			400: {
				slidesPerView: 1,

			},
			480: {
				slidesPerView: 2,

			},
			1025: {
				slidesPerView: 2,

			},
			1280: {
				slidesPerView: 6,

			},
		},
	})
}



function toggleMobileMenu() {

	$(".mobile-toggle").on("click", function () {
		$(".mobile-wrapper").toggleClass("active");
	});
}

function mappingMenu() {
	return new MappingListener({
		selector: ".nav-menu-primary",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".wrapper-bottom",
		desktopMethod: "appendTo",
		breakpoint: 1025
	}).watch();
}

function mappingContact() {
	return new MappingListener({
		selector: ".contact-wrapper",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".mail-wrapper",
		desktopMethod: "insertBefore",
		breakpoint: 1025
	}).watch();
}

function mappingSearch() {
	return new MappingListener({
		selector: ".search-wrapper",
		mobileWrapper: ".mobile-wrapper",
		mobileMethod: "appendTo",
		desktopWrapper: ".language-wrapper",
		desktopMethod: "insertBefore",
		breakpoint: 1025
	}).watch();
}
