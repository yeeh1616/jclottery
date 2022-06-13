$(document).ready(function (){
	//------新闻按钮(start)------
	$("#jcNewsBtn").click(function(){
		$("#jcNewsArea").css('display','block'); 
		$("#szcNewsArea").css('display','none'); 
		$("#zcNewsArea").css('display','none'); 
		
		$("#jcNewsBtn").css('color','#cf3032'); //#cf3032
		$("#szcNewsBtn").css('color','#565656');
		$("#zcNewsBtn").css('color','#565656');
	});
	$("#szcNewsBtn").click(function(){
		$("#jcNewsArea").css('display','none'); 
		$("#szcNewsArea").css('display','block'); 
		$("#zcNewsArea").css('display','none');
		
		$("#jcNewsBtn").css('color','#565656'); //#cf3032
		$("#szcNewsBtn").css('color','#cf3032');
		$("#zcNewsBtn").css('color','#565656');
	});
	$("#zcNewsBtn").click(function(){
		$("#jcNewsArea").css('display','none'); 
		$("#szcNewsArea").css('display','none'); 
		$("#zcNewsArea").css('display','block');
		
		$("#jcNewsBtn").css('color','#565656'); //#cf3032
		$("#szcNewsBtn").css('color','#565656');//jcExpertNewsBtn
		$("#zcNewsBtn").css('color','#cf3032');
	});
	//------新闻按钮(end)------
	
	//------专家彩民按钮（start）------
	$("#jcExpertNewsBtn").click(function(){
		
		$("#jcExpertNewsArea").css('display','block'); 
		$("#szcExpertNewsArea").css('display','none'); 
		$("#zcExpertNewsArea").css('display','none'); 
		
		/*$("#jcExpertNewsBtn").css('background','#e33b3d');
		$("#jcExpertNewsBtn span:first-child").css('color','#FFFFFF');
		$("#szcExpertNewsBtn").css('background','#ebebeb').children('a').css('color','#565656');
		$("#szcExpertNewsBtn span:first-child").css('color','#565656');
		$("#zcExpertNewsBtn").css('background','#ebebeb').children('a').css('color','#565656');
		$("#zcExpertNewsBtn span:first-child").css('color','#565656');*/
	});
	$("#szcExpertNewsBtn").click(function(){
		
		$("#jcExpertNewsArea").css('display','none'); 
		$("#szcExpertNewsArea").css('display','block'); 
		$("#zcExpertNewsArea").css('display','none'); 
	});
	$("#zcExpertNewsBtn").click(function(){
		
		$("#jcExpertNewsArea").css('display','none'); 
		$("#szcExpertNewsArea").css('display','none'); 
		$("#zcExpertNewsArea").css('display','block'); 
	});
	
	//color
	$("#jcExpertNewsBtn").click(function(){
		
		$("#jcExpertNewsBtn").css('color','#cf3032'); //#cf3032
		$("#szcExpertNewsBtn").css('color','#565656');
		$("#zcExpertNewsBtn").css('color','#565656');
	});
	$("#szcExpertNewsBtn").click(function(){
		
		$("#jcExpertNewsBtn").css('color','#565656'); //#cf3032
		$("#szcExpertNewsBtn").css('color','#cf3032');
		$("#zcExpertNewsBtn").css('color','#565656');
	});
	$("#zcExpertNewsBtn").click(function(){
		
		$("#jcExpertNewsBtn").css('color','#565656'); //#cf3032
		$("#szcExpertNewsBtn").css('color','#565656');//jcExpertNewsBtn
		$("#zcExpertNewsBtn").css('color','#cf3032');
	});
	//------专家彩民按钮（end）------
});