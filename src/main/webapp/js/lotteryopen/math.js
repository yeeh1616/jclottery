/**
 * <p>Desc:开奖信息</p>
 * <p>Author: wangheping</p>
 */
var pay_codes = games;
$(document).ready(function (){
	setIssues();//设置下拉列表的值
	setDesc(pay_codes[0]);
	$('#select1').bind('change',setPay);
});

/***设置下拉列表的值*/
function setIssues(){
	var sObj = $('#select1');
	if(sObj==null)
		return;
	for(var i=0;i<pay_codes.length;i++){
		$(sObj).attr("text",pay_codes[i].dateNum);
		$(sObj).attr("value",i); 
		var option = $('<option></option>').text(pay_codes[i].dateNum).val(i);
		sObj.append(option); 
	}	
}

/***内容填充***/
function setPay(){
	var objs = new Array();
	objs[0] = pay_codes[this.value];
	if(objs[0]==null)
		return;
	setDesc(objs[0]);
}

/***解析滚存奖池**/
function getPayPool(level){
	if(level==null)
		return "0";
	var results = level.split("::");
	if(results.length<2)
		return "0";
	return results[1];
}

/***统一号码格式**/
function covertCode(code){
	if(code==null)
		return code;
	if(license_type_id==1||
		license_type_id==2||
		license_type_id==3||
		license_type_id==4||
		license_type_id==11||
		license_type_id==12||
		license_type_id==13)
			return code;
	if(code.length==1)
		code = "0"+code;
	return code;	
}

/***内容填充***/
function setDesc(obj){
	if(obj==null)
		return;
	
	var dateNum = obj.dateNum;
	var code = obj.code;
	var date = obj.date;
	var money = obj.money;
	var level = obj.level;
	/****当前期***/
	/*var dateNumObj = $('#dateNum0_');
	if(dateNumObj != null)
		dateNumObj.html('第<select><option>'+dateNum+'</option></select>期开奖');
	*/	
	/***设置开奖时间***/
	var dateObj = $('#date0_');
	if(dateObj != null)
		dateObj.html('开奖时间：'+date);

	/***设置销售额***/
	var moneyObj = $('#money0_');
	if(moneyObj != null)
		moneyObj.html(numToCny(money));
		
	/***设置滚存奖池***/
	var poolObj = $('#pool0_');
	if(poolObj != null){
		var lenvel_val = getPayPool(level);
		try{
		  //lenvel_val = formatCurrency(lenvel_val);
		}catch(se){}
		poolObj.html(numToCny(lenvel_val));
	}

	/***设置开奖号码***/
	var codeObj = $('#code0_');
	if(codeObj!=null)
		codeObj.html(getCodes(code));
			
	/***设置开奖详情***/
	var payDescObj = $('#payDesc_');
	if(payDescObj!=null)
		payDescObj.html(getPayDesc(level));	
}

/***奖金格式转换***/
function numToCny(num){     
	if(num.indexOf('.')){
		return num;
	}else{
		num = num.replace(/,/g,'');
		var y = 0, w = 0, u = 0;
		var fn = parseInt(num, 10);
		y = parseInt(fn / 100000000, 10);
		w = parseInt((fn % 100000000) / 10000,10);
		u = (fn % 100000000) % 10000;
    return y + " 亿 " + w + " 万 " + u + " 元";     
	}
}
	
/***填充开奖号码**/
function getCodes(code){
	var allCodes = code.split(",");
	var redCode = allCodes[0].split("-");
	
	/*var blueCode = null;
	if(allCodes.length == 2)
			blueCode = allCodes[1].split("-");*/
	var codeCount = 1;
	//var buffer = new StringBuffer();
	var buffer = "";
	for(var codeIndex = 0; codeIndex < redCode.length; codeIndex++) { 
		var c = covertCode(redCode[codeIndex]);
		if(license_type_id==11&&codeIndex>redCode.length-2){
			buffer = buffer + ("<i class='blue'>"+c+"</i>");
		}else if(license_type_id==4&&codeIndex>redCode.length-3){
			buffer = buffer + ("<i class='blue'>"+c+"</i>");
		}else if(license_type_id==13&&codeIndex>redCode.length-2){
			buffer = buffer + ("<i class='blue'>"+c+"</i>");
		}else if(license_type_id==20&&codeIndex>redCode.length-2){
			buffer = buffer + ("<i class='blue'>"+redCode[codeIndex]+"</i>");
		}else{
			if(license_type_id==20){
				buffer = buffer + ("<i>"+redCode[codeIndex]+"</i>");
			}else{
				buffer = buffer + ("<i>"+c+"</i>");
			}
		}
		codeCount ++;
	}
	/*if(blueCode != null&&(license_type_id==185||license_type_id==186)){
		for(var codeIndex = 0; codeIndex < blueCode.length; codeIndex++) {
			var c = covertCode(blueCode[codeIndex]);
			buffer = buffer + ("<em>"+c+"</em>");
			codeCount ++;
		}
	}*/
	return buffer;
}

function getPayDesc(level){
	var buffer = "";
  var results = level.split("::");
  var payDesc = results[0];
  var levels = payDesc.split("|");
  buffer = buffer + ("		<tr><th width='30%'>奖项</th><th width='35%'>中奖注数</th><th width='35%'>中奖金额（元）</th></tr>");
	for(var i = 0; i < levels.length; i++) {
	  var lev = levels[i].split("`");
	  buffer = buffer + ("   <tr>");
	  buffer = buffer + ("     <td><span>"+converLevelDesc((i+1))+"</span></td>");
	  buffer = buffer + ("     <td><span>"+lev[0]+"</span></td>");
	  buffer = buffer + ("     <td><span>"+lev[1]+"</span></td>");
	  buffer = buffer + ("    </tr>");
	}
	return buffer;
}

/***utils 方法***/
var chn_level=['一','二','三','四','五','六','七','八','九'];
function converLevelDesc(index){
	var ss = chn_level[index-1]+"等奖";
	if(license_type_id==166&&index==7)
		ss = "欢乐奖";
	if(license_type_id==1||license_type_id==12){
		if(index==1)
			ss = "直选";
		else if(index==2)
			ss = "组选三";
		else if(index==3)
			ss = "组选六";
	}
	if(license_type_id==4){
		switch(index){
			case 1:{
				ss = "一等奖(基本)";
				break;
			}
			case 2:{
				ss = "一等奖(追加)";
				break;
			}
			case 3:{
				ss = "二等奖(基本)";
				break;
			}
			case 4:{
				ss = "二等奖(追加)";
				break;
			}
			case 5:{
				ss = "三等奖(基本)";
				break;
			}
			case 6:{
				ss = "三等奖(追加)";
				break;
			}
			case 7:{
				ss = "四等奖";
				break;
			}
			case 8:{
				ss = "四等奖(追加)";
				break;
			}
			case 9:{
				ss = "五等奖";
				break;
			}
			case 10:{
				ss = "五等奖(追加)";
				break;
			}
			case 11:{
				ss = "六等奖";
				break;
			}
			case 12:{
				ss = "六等奖(追加)";
				break;
			}
			case 13:{
				ss = "七等奖";
				break;
			}
			case 14:{
				ss = "七等奖";
				break;
			}
			case 15:{
				ss = "八等奖";
				break;
			}
			case 16:{
				ss = "12选2";
				break;
			}
		}
	}
		if(license_type_id==13){
		switch(index){
			case 1:{
				ss = "一等奖";
				break;
			}
			case 2:{
				ss = "二等奖";
				break;
			}
			case 3:{
				ss = "三等奖";
				break;
			}
			case 4:{
				ss = "四等奖";
				break;
			}
			case 5:{
				ss = "五等奖";
				break;
			}
			case 6:{
				ss = "六等奖";
				break;
			}
			case 7:{
				ss = "七等奖";
				break;
			}
			case 8:{
				ss = "特等奖";
				break;
			}
		}
	}
	return ss;
}