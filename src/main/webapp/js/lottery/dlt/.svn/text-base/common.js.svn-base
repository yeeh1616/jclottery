
$(document).ready(function () {

	var licenseId = $("#licenseId").val();
	
	// 开奖信息填充
	$("#preIssueCId").html(preIssue);
	$("#preBonusJcId").html(bonusJc);
	for ( var i = 0; i < 5; i++ ) {
		$('<span class="red_ballbg">'+preCode[i]+'</span>').appendTo($("#redCodeAId"));
	}
	for ( var i = 5; i < 7; i++ ) {
		$('<span class="blue_ballbg blue1">'+preCode[i]+'</span>').appendTo($("#redCodeAId"));
	}
	/*for ( var i = 0; i < bonusObj.length; i++ ) {
		$('<tr><td width="50">'+bonusObj[i].name+'</td><td width="50">'+
		  '<span class="red">'+bonusObj[i].regu.split("+")[0]+'</span> + <span class="blue">'+bonusObj[i].regu.split("+")[1]+'</span></td>'+
		  '<td width="55">'+bonusObj[i].winNum+'</td><td width="90">'+bonusObj[i].bonus+'</td></tr>').appendTo("#preBonusDetailId");
	}*/
	for ( var i = 0; i < issueCode.length; i++ ) {
		var cin = issueCode[i].code.split("-");
		
		$('<div class="kjm-l fl">'+issueCode[i].issue+'期</div>'+
	        '<div class="kjm-r fl">'+
	        '<b class="kjm-red">'+cin[0]+'</b>'+
	        '<b class="kjm-red">'+cin[1]+'</b>'+
	        '<b class="kjm-red">'+cin[2]+'</b>'+
	        '<b class="kjm-red">'+cin[3]+'</b>'+
	        '<b class="kjm-red">'+cin[4]+'</b>'+
	        '<b class="kjm-bule">'+cin[5]+'</b>'+
	        '<b class="kjm-bule">'+cin[6]+'</b>'+
	      '</div>').appendTo("#issueCodeAId");
	}
});

