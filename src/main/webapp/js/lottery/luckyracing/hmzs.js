$(document).ready(function () {
	$("a[name=type]").live("click",function(){
		$("a").removeClass("cur");
		$(this).addClass("cur");
		myAjax($(this).attr('id'), null);
	});
	myAjax("zhzs_sx", null);
	
	$("#sel-range").live("change",function(){
		myAjax($(".cur").attr('id'), $(this).val());
	});
});

function myAjax(type, range){
	$.ajax( {
		type : "post",
		url : "/lottery/luckyracing/numbertrend.jhtml",
		async : false,
		data : "type="+type+"&range="+range,
		dataType : "text",
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			return null;
		},
		success : function(data) {
			$("#hmzs").html(data);
		}
	});
}
