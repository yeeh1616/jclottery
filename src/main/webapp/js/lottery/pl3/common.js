
$(document).ready(function () {
	// 追加隐藏
	$("#dltZjAreaId").hide();
	
	try {
		// 开奖信息填充
		$("#preIssueCId").html(preIssue);
		//$("#preBonusJcId").html(bonusJc);
		for ( var i = 0; i < 3; i++ ) {
			$('<span class="red_ballbg">'+preCode[i]+'</span>').appendTo($("#redCodeAId"));
		}
		
		for ( var i = 0; i < issueCode.length; i++ ) {
			var cin = issueCode[i].code.split("-");
			
			$('<div class="kjm-l fl">'+issueCode[i].issue+'期</div>'+
		        '<div class="kjm-r fl">'+
		        '<b class="kjm-red">'+cin[0]+'</b>'+
		        '<b class="kjm-red">'+cin[1]+'</b>'+
		        '<b class="kjm-red">'+cin[2]+'</b>'+
		      '</div>').appendTo("#issueCodeAId");
		}
	}catch ( ex ) {}
});

