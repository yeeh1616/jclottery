 /**对电子邮件的验证**/
function isEmail(obj){
   var myreg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   if(!myreg.test(obj)){
       return false;
   }
   return true;
 }
/**数字验证**/
function isFloat(str) {
	var ch=str.charAt(0);
	if( ch == "." ) return false;
    for (var i=0; i < str.length; i++)
		{	ch=str.charAt(i);
			if ((ch != ".") && (ch != "0") && (ch != "1") && (ch != "2") && (ch != "3") && (ch != "4") && (ch != "5") && (ch != "6") && (ch != "7") && (ch != "8") && (ch != "9"))
				return false;
		}
    return true;
}

/**银行卡校验**/
function bankCard(str) {
	var ch=str.charAt(0);
	if( ch == "." ) return false;
    for (var i=0; i < str.length; i++)
		{	ch=str.charAt(i);
			if ((ch != " ") && (ch != "0") && (ch != "1") && (ch != "2") && (ch != "3") && (ch != "4") && (ch != "5") && (ch != "6") && (ch != "7") && (ch != "8") && (ch != "9"))
				return false;
		}
    return true;
}

/*
*钱的验证，精确到分
*/
function checkMoney(str){
 var array_money = str.split(".");
 if(array_money.length>1){
 	var moneyFen = array_money[1];
 	if(moneyFen.length>2)
 		//alert("金额异常");
 		return false;
 	else
 		return true;
 }else{
 	 return true;
 	}
}

/*
*身份证号码
*/
function checkCard(num_){
	if (num_.length == 0){
		return false;
	}else{
    var reg	= new RegExp(/^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(?:\d|x|X)?$/);
		if (!reg.test(num_)){
			return false;
		}else{
	    return true;
		}
	}
}

/**
 * 将数值四舍五入(保留2位小数)后格式化成金额形式
 *
 * @param num 数值(Number或者String)
 * @return 金额格式的字符串,如'1,234,567.45'
 * @type String
 */
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num))
    num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    cents = num%100;
    num = Math.floor(num/100).toString();
    if(cents<10)
    cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
    num = num.substring(0,num.length-(4*i+3))+','+
    num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num + '.' + cents);
}

String.prototype.replaceAll = function(s1,s2){   
	return this.replace(new RegExp(s1,"gm"),s2);   
}

String.prototype.trim = function(){   
	return this.replace(/(^\s*)|(\s*$)/g, "");     
}

/**
 * 确认框
 * @param popupTitle 确认框标题
 * @param popupText  确认框内容
 * @param showCancel 是否显示取消按钮
 * @param callback 按钮回调函数
 * @return
 */
function popupConfirm(popupTitle,popupText,showCancel,callback/*,confirmText,cancelText,closeFn*/){
	//typeof(popupTitle) != "undefined"
	$("#popupTitle").html(popupTitle);
	$("#popupText").html(popupText);
	if(!showCancel){
		$("#cancelBtn").hide();
	}else{
		$("#cancelBtn").show();
	}
	/*if(confirmText){
		$("#confirmBtn").html(confirmText);
	}else{
		$("#confirmBtn").html("确认");
	}*/
	/*if(cancelText){
		$("#cancelBtn").html(cancelText);
	}else{
		$("#cancelBtn").html("取消");
	}*/
	$.blockUI({
		message: $("#popupConfirm"),
    css: {
        width: $("#popupConfirm").width() + 'px',
        height: $("#popupConfirm").height() + 'px',
        left: ($(window).width() - $("#popupConfirm").width()) / 2 + 'px',
        top: ($(window).height() - $("#popupConfirm").height()) / 2 + 'px',
        border: 'none',
        cursor: 'default'
    }
	});
	$("#confirmBtn").unbind("click");
	$("#confirmBtn").click(function(){
		if(callback){
			callback();
		}else{
			$.unblockUI();
		}
	});
	$("#popupConfirmClose").unbind("click");
	/*$("#popupConfirmClose").click(function (){
		if(closeFn){
			closeFn();
		}else{
			$.unblockUI();
		}
	});*/
}