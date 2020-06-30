$(document).ready(function () {
	swiperInit();
	toggleMobileMenu();
	mappingMenu();
	mappingContact();
	mappingSearch();
	setBackground();
	sideNavigation();
	tabActive();
	watchMore();
	// toggleSupport()
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

function sideNavigation() {
	// let trigger = $('.side-navigation-wrapper .side-navigation .title em');
	// let close = $('.side-navigation-wrapper .side-navigation  .nav-sub');
	// let parent = $('.side-navigation-wrapper .side-navigation  li');
	// trigger.on('click', function (e) {
	// 	e.preventDefault();
	// 	if (!$(this).parent().parent().hasClass("open")) {
	// 		close.slideUp();
	// 		$(this).parent().next().slideToggle();
	// 		parent.removeClass('open')
	// 		$(this).parents('li').addClass('open')
	// 	} else {
	// 		$(this).parent().next().slideToggle();
	// 		parent.removeClass('open')
	// 	}
	// })
}

function tabActive() {
	$(".tab-navigation li a").on("click", function () {
		$(this)
			.parents(".tab-navigation")
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
			delay: 2000
		},
		navigation: {
			nextEl: '.home-product-zone .nav-arrow-next',
			prevEl: '.home-product-zone .nav-arrow-prev',
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


	var productThumbs = new Swiper(
		".swiper-product-thumbs  .swiper-container", {
			spaceBetween: 10,
			freeMode: false,
			breakpointsInverse: true,
			breakpoints: {
				320: {
					slidesPerView: 1.5,
					direction: "horizontal",
					spaceBetween: 10
				},
				576: {
					slidesPerView: 3.5,
					direction: "horizontal",
					spaceBetween: 10
				},
				1025: {
					slidesPerView: 4,
					direction: "vertical"
				},
				1440: {
					slidesPerView: 4,
					direction: "vertical"
				}
			},
			centeredSlides: true,
			direction: "vertical",
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
			navigation: {
				nextEl: ".product-thumb-next",
				prevEl: ".product-thumb-prev"
			}
		}
	);

	var productMain = new Swiper(".swiper-product-main .swiper-container", {
		slidesPerView: 1,
		centeredSlides: true,
		effect: "fade",
		fadeEffect: {
			crossFade: true
		},
		speed: 750,
		loop: false,
		thumbs: {
			swiper: productThumbs
		}
	});

	var brandSwiper = new Swiper(".brand-display .swiper-container", {
		// Optional parameters
		speed: 1000,

		autoplay: {
			delay: 2000
		},
		navigation: {
			nextEl: '.brand-display .nav-arrow-next',
			prevEl: '.brand-display .nav-arrow-prev',
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
				slidesPerView: 2,

			},
			768: {
				slidesPerView: 4,

			},
			1025: {
				slidesPerView: 4,

			},
			1440: {
				slidesPerView: 6,

			},
		},

	});

		var otherProduct = new Swiper(".other-product .swiper-container", {
			// Optional parameters
			speed: 1000,
			autoplay: {
				delay: 2000
			},
			navigation: {
				nextEl: '.other-product .nav-arrow-next',
				prevEl: '.other-product .nav-arrow-prev',
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
					slidesPerView: 2,

				},
				768: {
					slidesPerView: 3,

				},
				1025: {
					slidesPerView: 4,

				},
				1440: {
					slidesPerView: 5,

				},
			},

		});



	var aboutSwiper = new Swiper(".about-3 .swiper-container", {
		// Optional parameters
		speed: 1000,
		slidesPerView: 1,
		spaceBetween: 20,

		autoplay: {
			delay: 2000
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

function watchMore() {

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

function setBackground() {
	$("[setBackground]").each(function () {
		var background = $(this).attr("setBackground");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center",
		});
	});
	$("[setBackgroundRepeat]").each(function () {
		var background = $(this).attr("setBackgroundRepeat");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat",
		});
	});
}
