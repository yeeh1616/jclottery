var football = new Football();
$(document).ready(function () {
	$("#lotteryFormBtnId").click(function(){
		if ( $("#betNumId").html() != '0' ) {
			var fCode = "";
			var idex = 1;
			$("#zcSchAreaId tr[id^=body_tr_]").each(function(index,item){				
				if ( schNum == 9 ) {
					fCode += idex + ":";
					if ( $(item).find(".active").length > 0 ) {
						$(item).find(".active").each(function(index,v){
							fCode += $(v).find('a').html();
						});
					} else {
						fCode += "#";
					}
					if ( $(this).find("input[type=checkbox]:checked").length == 1 ) {
						fCode += "`0";
					} else {
						fCode += "`1";
					}
					idex++;
				} else {
					if ( $(this).find(".active").length > 0 ) {
						$(this).find(".active").each(function(index,v){
							fCode += $(v).find('a').html();
						});
					} 
				}
				fCode += ",";
			});
			fCode = fCode.substring(0, fCode.length - 1);
			var licenseId = $("#licenseId").val();
			var orderId = $("#orderId").val();
			$.ajax({
			    type: "post",
			    url: "/lottery/frsFsUpload.do",
			    async: false,
			    dataType: "json",
			    data: "licenseId="+licenseId+"&betCode="+fCode+"&orderId="+orderId,
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if( data.errCode == 0 ){
						layer.alert(data.message,0);
						return false;
					}
					alert("号码上传成功！");
				}
			});
		}
	});
});
function calc() {
	var index = 0;
	var trs = $("#zcSchAreaId tr[id^=body_tr_]");
	for ( var i = 0; i < trs.length; i++ ) {
		if ($(trs[i]).find(".active").length > 0 ) {
			index++;
		}
	}
	var betNum = 0;
	if ( index == trs.length ) {
		var betArray = new Array();
		for ( var i = 0; i < trs.length; i++ ) {
			var subArray = new Array();
			if ($(trs[i]).find(".active").length > 0 ) {
				$(trs[i]).find(".active").each(function(i){
					subArray.push($(this).find('a').html());
				});
				
				betArray.push(subArray);
			}
		}
		betNum = football.calcBetNum(betArray);
	}
	$("#betNumId").html(betNum);
	$("#betMoneyId").html(betNum*2);
}

