$(document).ready(function() {
	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(Init);
	Init();
	function Init() {
		$("input[type='checkbox']").addClass("filled-in");
		$(".cmstable tr td input[type='checkbox']").each(function() {
			var forLabel = $(this).attr("id");
			$(this).after(
				"<label class='mb-0'" + " for=" + forLabel + "/>" + "</label>"
			);
		});

		$(".admin-bannerlist .aspcheckboxlist label.mb-0").remove();

		$(".riTextBox").addClass("form-control");
		$(".form-checkbox").each(function() {
			$(this)
				.find("span")
				.append($(this).find("label"));
		});
	}

	$(".treeview > a").click(function(e) {
		e.preventDefault();
		$(this)
			.next()
			.slideToggle();
		$(this)
			.parent()
			.toggleClass("menu-open");
		$(this)
			.parent(".treeview")
			.siblings()
			.removeClass("menu-open");
		$(this)
			.parent(".treeview")
			.siblings()
			.find(".treeview-menu")
			.slideUp();
	});
	$("select.aspNetDisabled").addClass("form-control");
	$(".nav-pills li a").each(function() {
		if (!$(this).hasClass("nav-link")) {
			$(this).addClass("nav-link");
		}
	});
	$(".nav-pills li a")
		.first()
		.addClass("active");
});
