$(document).ready(function () {
	$.ajax( {
		type : "post",
		url : "/lottery/luckyracing/lskj.jhtml",
		async : false,
		dataType : "text",
		error : function(xMLHttpRequest, textStatus, errorThrown) {
			return null;
		},
		success : function(data) {
			$("#lskj").html(data);
		}
	});
});

