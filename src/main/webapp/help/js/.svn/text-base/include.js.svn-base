
$(function(){
	var localUrl = location.href;
	localUrl = localUrl.replace('http:\//','');
	var arrUrl = localUrl.split('\/');
	$(".header_top").remove();
	$(".common_w").parent().remove();
	var headHtml=$(
			"<div>"
			+"<iframe id='topIframe' src='' width='100%' height='95' frameborder='0' marginwidth='0' marginheight='0' scrolling='no'></iframe>" 
		    +"</div>"
			);
	$(".layout").before(headHtml);
	var footHtml=$(
			"<div>"
			+"<iframe id='footerIframe' src='' width='100%' height='305' frameborder='0' marginwidth='0' marginheight='0' scrolling='no'></iframe>" 
			+"</div>"
			);
	$(".footer_bg").replaceAll(footHtml);
	var topUrl = "/chart/top.jhtml";
	$("#topIframe").attr("src",topUrl);
	
	var footerUrl = "/chart/footer.jhtml";
	$("#footerIframe").attr("src",footerUrl);
});
