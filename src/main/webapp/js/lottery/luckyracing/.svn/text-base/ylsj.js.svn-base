$(document).ready(function () {
	$("a[name=type]").live("click",function(){
		$("a").removeClass("cur");
		$(this).addClass("cur");
		myAjax($(this).attr('id'), null);
	});
	myAjax("qyyl", null);
	
});

function myAjax(type, range){
	$.ajax( {
		type : "post",
		url : "/lottery/luckyracing/missingdata.jhtml",
		async : false,
		data : "type="+type+"&range="+range,
		dataType : "text",
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			return null;
		},
		success : function(data) {
			$("#ylsj").html(data);
			$("#ylsj").append("<script type=\"text/javascript\" src=\"/js/lottery/luckyracing/xysc_yl.js\"></script>")
		}
	});
}

function getChartdata(e){
	myAjax($(".cur").attr('id') || $(".cfont1").attr('id'), e);
}

