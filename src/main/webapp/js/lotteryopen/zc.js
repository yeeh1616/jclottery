/**
 * <p>Desc:开奖信息</p>
 * <p>Author: wangheping</p>
 */
var pay_codes = games;
$(document).ready(function (){
	setIssues();//设置期号
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

/***内容填充***/
function setDesc(obj){
	if(obj==null)
		return;
	
	var dateNum = obj.dateNum;
	var code = obj.code;
	var date = obj.date;
	var money = obj.money;
	var level = obj.level;
	var nextPool = obj.nextPool;
	
		/****当前期***/
	var dateNumObj = $('#dateNum0_');
	if(dateNumObj != null)
		dateNumObj.html(dateNum);
		
	/***设置开奖时间***/
	var dateObj = $('#date0_');
	if(dateObj!=null)
		dateObj.html('开奖时间：' + date);

	/***销售额***/
	var temp_money = money.split("|");	
	var moneyObj = $('#money0_');
	if(moneyObj != null)
		moneyObj.html(numToCny(temp_money[0]));
	
	
	/***销售额***/
	/*var total_money = new Array();
	var temp_money = money.split("|");
	for(var ii=0;ii<temp_money.length;ii++){
		total_money.push(temp_money[ii]+"元");
		alert(temp_money[ii]);
	}*/
	
	/***滚存奖池***/
	var lenvel_val = '0';
	if(level != null){
		var results = level.split("::");
		if(results.length<2){
			lenvel_val = "0";
		}else{
			lenvel_val = results[1];
		}
	}
	try{
	  lenvel_val = decimalFormat(lenvel_val);
	}catch(se){}
	$('#pool0_').html(lenvel_val);
	/***设置开奖号码***/
	var codeObj = $('#code0_');
	if(codeObj!=null)
		codeObj.html(getCodes(code));
			
	/***设置开奖详情***/
	var payDescObj = $('#payDesc_');
	if(payDescObj!=null)
		payDescObj.html(getPayDesc(level));	
	
	/**对阵信息**/
	var duizhenObj = $('#dzxx');
	duizhenObj.html(duizhen(code,dateNum));
}

/***奖金格式转换***/
function numToCny(num){     
	num = num.replace(/,/g,'');
	var y = 0, w = 0, u = 0;
	var fn = parseInt(num, 10);
	y = parseInt(fn / 100000000, 10);
	w = parseInt((fn % 100000000) / 10000,10);
	u = (fn % 100000000) % 10000;
    return y +" 亿 " + w + " 万 " + u + " 元";     
}

function getCodes(code){
 	var buffer = "";
	var allCodes = code.split(",");
	for(var i=0;i<allCodes.length;i++){
		var code_ = allCodes[i].split('::');
		buffer = buffer+"<i>"+code_[1]+"</i>";
	}
	return buffer;
}



/*
function getCodes(code , total_money , lenvel_val , nextPool){
 	var buffer = "<tr>";
 	buffer = buffer + "<td width='25%' height='28' align='center' style='background:url(images/jt.png) no-repeat bottom right #d1ebf8;'><span>序号</span></td>";
 	buffer = buffer + "<td width='50%' height='28' align='center' style='background:url(images/jt.png) no-repeat bottom right #d1ebf8;'><span>对阵</span></td>";
 	buffer = buffer + "<td width='25%' height='28' align='center' style='background:url(images/jt.png) no-repeat bottom right #d1ebf8;'><span>彩果</span></td>";
 	buffer = buffer + "</tr>";
	var allCodes = code.split(",");
	for(var i=0;i<allCodes.length;i++){
		var code_ = allCodes[i].split('::');
		buffer = buffer + "<tr>";
		buffer = buffer + "<td width='36' height='28' align='center' bgcolor='#ffffec'><span>"+(i+1)+"</span></td>";
		buffer = buffer + "<td width='36' height='28' align='center' bgcolor='#ffffec'><span>"+(code_[0])+"</span></td>";
		buffer = buffer + "<td width='36' height='28' align='center' bgcolor='#ffffec'><span>"+code_[1]+"</span></td>";
		buffer = buffer + "</tr>";
	}
	buffer = buffer + "<tr>";
	buffer = buffer + "<td height='28' colspan='15' align='center' bgcolor='#f9f9f9' style='color:#52311a'>本期足彩销量：<span class='yuan'>"+(total_money.join('&nbsp;|&nbsp;'))+"</span> 元";
	buffer = buffer + "<span style='padding:0 20px 0 20px'>";
	buffer = buffer + "奖池滚存：<span class='yuan'>"+(nextPool)+"</span>元</td>";
	//buffer = buffer + "<span style="padding:0 20px 0 20px">";
	buffer = buffer + "</tr>";
	
 return buffer;
}
*/
/*
 * 对阵表格
 */
function duizhen(code,dateNum){
	var allCodes = code.split(",");
	var cods = new Array();
	
	if(allCodes!=null){
		for(var ii = 0;ii<allCodes.length;ii++){
			cods[ii] = allCodes[ii].split('::');
			if(allCodes.length == 12 || allCodes.length == 14){
				cods[ii][0] = cods[ii][0].substr(0, cods[ii][0].indexOf('&'));
			}else{
				cods[ii][0] = cods[ii][0].substr(0, cods[ii][0].indexOf('('));
			}
		}
	}
	var str = "";
	if(cods.length == 12){
		str = "六场半全";
	}else if(cods.length == 14){
		str = "胜负彩";
	}else{
		str = "4场进球";
	}
	buffer = "";
	buffer += "<tr>";
	buffer += "	<th colspan="+cods.length+"> <div class='w_cq fl'>&nbsp;"+str+"&nbsp;第<span>"+dateNum+"</span>期</div>";
	buffer += "		<div class='clear'></div>";
	buffer += "	</th>";
	buffer += "</tr>";
	buffer += "<tr>";
	//6场半全场
	if(cods.length == 12){
		for(var i = 0;i<cods.length;i+=2){
			buffer += "	<td colspan='2' class='w_dn'><span>"+cods[i][0]+"</span></td>";
		}
	}
	//胜负彩
	if(cods.length == 14 || cods.length == 8){
		for(var i = 0;i<cods.length;i++){
			buffer += "	<td class='w_dn w_rx'><span>"+cods[i][0]+"</span></td>";
		}
	}
	buffer += "</tr>";
	//6场半全场
	if(cods.length == 12){
		buffer += "<tr>";
		for(var j=0;j<6;j++){
			buffer += "	<td width='8%'>半</td>";
			buffer += "	<td width='8%'>全</td>";
		}
		buffer += "</tr>";
	}
	buffer += "<tr>";
	//6场半全场
	if(cods.length == 12){
		for(var k=0;k<cods.length;k++){
			buffer += "<td class='w_cs'>"+cods[k][1]+"</td>";
		}
	}
	//胜负彩
	if(cods.length == 14 || cods.length == 8){
		for(var k=0;k<cods.length;k++){
			buffer += "<td class='w_cs' width='7%'>"+cods[k][1]+"</td>";
		}
	}
	buffer += "</tr>";
	return buffer;	
}

function getPayDesc(level){
  var buffer = "<tr>";
  buffer = buffer + "<th width='30%''>奖项</th>";
  buffer = buffer + "<th width='35%'>中奖注数</th>";
  buffer = buffer + "<th width='35%''>中奖金额（元）</th>";
  buffer = buffer + "</tr>";
  
  var results = level.split("::");
  var payDesc = results[0];
  var levels = payDesc.split("|");
	for(var i = 0; i < levels.length; i++) {
		var lev = levels[i].split("`");
		buffer = buffer + ("   <tr>");
	  buffer = buffer + ("     <td>"+converLevelDesc((i+1))+"</td>");
	  buffer = buffer + ("     <td>"+lev[0]+"</td>");
	  buffer = buffer + ("     <td>"+(lev[1])+"</td>");	  
	  buffer = buffer + ("    </tr>");
	}
	
	return buffer;
}

/***utils 方法***/
var levelMap = ['一','二','三','四'];
function converLevelDesc(index){
	var ss = levelMap[index-1]+"等奖";
	if(license_type_id==5&&index==3)
		ss = "任选九场";
	return ss;
}