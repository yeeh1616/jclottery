
$(document).ready(function () {
	$("#dltZjAreaId").hide();
	
	var licenseId = $("#licenseId").val();
	
	// 开奖信息填充
	$("#preIssueCId").html(preIssue);
	$("#preBonusJcId").html(bonusJc);
	for ( var i = 0; i < 7; i++ ) {
		$('<span class="red_ballbg">'+preCode[i]+'</span>').appendTo($("#redCodeAId"));
	}
	for ( var i = 7; i < 8; i++ ) {
		$('<span class="blue_ballbg blue1">'+preCode[i]+'</span>').appendTo($("#redCodeAId"));
	}
	
	for ( var i = 0; i < issueCode.length; i++ ) {
		var cin = issueCode[i].code.split("-");
		
		$('<div class="kjm-l fl">'+issueCode[i].issue+'期</div>'+
	        '<div class="kjm-r fl">'+
	        '<b class="kjm-red">'+cin[0]+'</b>'+
	        '<b class="kjm-red">'+cin[1]+'</b>'+
	        '<b class="kjm-red">'+cin[2]+'</b>'+
	        '<b class="kjm-red">'+cin[3]+'</b>'+
	        '<b class="kjm-red">'+cin[4]+'</b>'+
	        '<b class="kjm-red">'+cin[5]+'</b>'+
	        '<b class="kjm-red">'+cin[6]+'</b>'+
	        '<b class="kjm-bule">'+cin[7]+'</b>'+
	      '</div>').appendTo("#issueCodeAId");
	}
});

