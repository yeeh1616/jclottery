/**
 * Author: Warren
 * http://www.wglong.com
 * 
 */


(function($){
	$.fn.warrenTabs=function(){
		
		$(this).find("input").click(function(){
			$(this).siblings("input").removeClass("active").end().addClass("active").siblings("div").css("display","none").eq($(this).index()).css("display","block");
		});
	
	}
	
	})(jQuery);