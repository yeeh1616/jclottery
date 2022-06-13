//控制可买详情方案进度进度条
$(document).ready(function (){
	
	var isMeetTheTopOfMergerNumber = $("#isMeetTheTopOfMergerNumber").val() == "true";
	var stateOfTickets = parseInt($("#stateOfTickets").val());
	
	if(isMeetTheTopOfMergerNumber && stateOfTickets < 8){//满员
		//$("#imgOfProcess02").attr("src","/images/chkan/images/jindu4_03.jpg"); 
		//$("#imgOfProcess03").attr("src","/images/chkan/jindu2.png"); 
		point02();
		$("#prizeResult01").removeClass();
		$("#prizeResult02").removeClass();
	}else if(isMeetTheTopOfMergerNumber && stateOfTickets==8){//出票
		point02();
		point03();
		$("#prizeResult01").removeClass();
		$("#prizeResult02").removeClass();
		$("#prizeResult03").removeClass();
	}else if(isMeetTheTopOfMergerNumber && stateOfTickets==9){//预计开奖
		point02();
		point03();
		$("#prizeResult01").removeClass();
		$("#prizeResult02").removeClass();
		$("#prizeResult03").removeClass();
	}else if(isMeetTheTopOfMergerNumber && stateOfTickets==10){//10--中奖，11--未中奖
		point02();
		point03();
		point04();
		point05();
		$("#prizeResult01").removeClass();
		$("#prizeResult02").removeClass();
		$("#prizeResult03").removeClass();
		$("#prizeResult04").removeClass();
		$("#prizeResult05").removeClass("fq1");
		//$("#prizeResult05").addClass("dengdai");
		setPrizeResult01("中奖");
	}else if(isMeetTheTopOfMergerNumber && stateOfTickets==11){//10--中奖，11--未中奖
		point02();
		point03();
		point04();
		hiddenPoint05();
		$("#prizeResult01").removeClass();
		$("#prizeResult02").removeClass();
		$("#prizeResult03").removeClass();
		$("#prizeResult04").removeClass();
		setPrizeResult04("未中奖");
		setPrizeResult05("");
	}else if(isMeetTheTopOfMergerNumber && stateOfTickets==13){//13--已兑奖
		point02();
		point03();
		point04();
		point05();
		$("#prizeResult01").removeClass();
		$("#prizeResult02").removeClass();
		$("#prizeResult03").removeClass();
		$("#prizeResult04").removeClass();
		$("#prizeResult05").removeClass("fq1");
		//$("#prizeResult05").addClass("dengdai");
		setPrizeResult04("中奖");
		setPrizeResult05("已兑奖");
	}else if(!isMeetTheTopOfMergerNumber && stateOfTickets < 8){
		$("#prizeResult01").removeClass();
	}
	
	function point02(){
		$("#imgOfProcess02").attr("src","/images/chkan/images/jindu4_03.jpg"); 
		$("#imgOfProcess03").attr("src","/images/chkan/jindu2.png");
	}
	function point03(){
		$("#imgOfProcess04").attr("src","/images/chkan/images/jindu4_03.jpg"); 
		$("#imgOfProcess05").attr("src","/images/chkan/jindu2.png");
	}
	function point04(){
		$("#imgOfProcess06").attr("src","/images/chkan/images/jindu4_03.jpg"); 
		$("#imgOfProcess07").attr("src","/images/chkan/jindu2.png");
	}
	function point05(){
		$("#imgOfProcess08").attr("src","/images/chkan/images/jindu4_03.jpg"); 
		$("#imgOfProcess09").attr("src","/images/chkan/jindu2.png");
	}
	function hiddenPoint05(){
		$("#backgroundProcess08").css({"visibility":"hidden"}); 
		$("#backgroundProcess09").css({"visibility":"hidden"});
	}
	function setPrizeResult04(prizeResult){
		$("#prizeResult04").text(prizeResult);
	}
	function setPrizeResult05(prizeResult){
		$("#prizeResult05").text(prizeResult);
	}
})