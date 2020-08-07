var siteRoot = "";
function AjaxLoadLazy(event,$button)
{
    event.preventDefault();
    let pageurl=$($button).attr("href"); 
    $.ajax({
        url: pageurl,
        data: { isajax: true },
        success: function (data) {
            //product list item
            $(".product-display").html($(data).find(".product-display").html());
            //product pager
            $(".productpager").remove();
            $(data).find(".productpager").insertAfter($(".product-display").parent());  
            //breadcrumb
            $(".global-breadcrumb").html($(data).find(".global-breadcrumb").html()); 
            //left-brand
            $(".left-brand").html($(data).filter(".left-brand").html());  
            let zoneId = $($button).data("id");
            $(".left-brand a").each(function(){ 
                $(this).attr("href",$(this).attr("href") +"?index=" + zoneId);   
            });
        },
    })
    if(pageurl != window.location)
    {
        window.history.pushState({ path: pageurl }, "", pageurl); 
    }
    return false;
} 