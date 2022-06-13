	/**
	 * 弹出页面弹出层 @Copy
	 */
	function popupDiv(div_id) {
		var div_obj = $("#"+div_id);
		var windowWidth = document.documentElement.clientWidth;    
		var windowHeight = document.documentElement.clientHeight;    
		var popupHeight = div_obj.height();    
		var popupWidth = div_obj.width(); 
		//添加并显示遮罩层
		$("<div id='mask'></div>").addClass("mask")
                              .width(windowWidth * 0.99)
                              .height(windowHeight * 0.99)
                              .click(function() {hideDiv(div_id); })
                              .appendTo("body")
                              .fadeIn(200);
		div_obj.css({"position": "absolute"}).animate({left: windowWidth/2-popupWidth/2, top: windowHeight/3-popupHeight/2, opacity: "show" }, "slow");
	}
	/**
	 * 关闭页面弹出层 @Copy
	 */
	function hideDiv(div_id) {
		$("#mask").remove();
		$("#" + div_id).animate({left: 0, top: 0, opacity: "hide" }, "slow");
	}
	
	//--------------------------------------------------------------------------------
	
	/**
	 * 解析投注号码 @Author zh
	 */
	function dispose(text){
		var roughly = text.split('\n');
		var textList = new Array();
		var index = 0;
		//去除集合中的空白行
		for(var i = 0; i < roughly.length; i++){
			if(roughly[i] != null && roughly[i].length > 0){
				textList[index] = roughly[i];
				index++;
			}
		}
		var resultList = new Array();//定义返回结果集 数字类型
		for(var i = 0; i < textList.length; i++){
			var temp = textList[i].match(/[0-9]+/g);
			var ints = new Array();
			for(var j = 0; j < temp.length; j++){
				ints[j] = parseInt(temp[j]);
			}
			resultList[i] = ints;
		}
		return resultList;
	}
	
	/**
	 * 根据彩种处理投注信息-中心方法 @Author zh
	 */
	function center(licenseId){
		var list = dispose(document.getElementById('inputText').value);//处理页面输入区文本内容
		gd11x5(list);//11选5
	}
	
	/**
	 * 广东11选5 每个彩种对应一个方法 @Author zh
	 */
	function gd11x5(list){
		//var html = "";
		var message = document.getElementById('message');
		var result = document.getElementById('betListAreaId');
		message.innerHTML = "&nbsp;";
		var playType = $("#lotteryBuyFormId").find("input[name=playType]").val();
		var len = 5;
		for(var i = 0; i < list.length; i++){
			var row = list[i];
			var temp = row.concat();//复制数组
			temp.sort();//升序排序
			for(var k = 0; k < temp.length; k++){
				if(temp[k] == temp[k+1]){
					message.innerHTML = "<span>错误提示：</span>投注号码重复! 请检查第<span>"+(i+1)+"</span>条投注内容~";
					return;
				}
			}
			if ( playType.indexOf('2') > -1 ) {
				len = 2;
			} else if ( playType.indexOf('3') > -1 ) {
				len = 3;
			} else if ( playType.indexOf('4') > -1 ) {
				len = 4;
			} else if ( playType.indexOf('6') > -1 ) {
				len = 6;
			} else if ( playType.indexOf('7') > -1 ) {
				len = 7;
			} else if ( playType.indexOf('8') > -1 ) {
				len = 8;
			}
			if(row.length == len){
				var betCode = "";
				for(var j = 0; j < len; j++){
					if(row[j] >= 1 && row[j] <= 11){
						betCode += row[j]<10?"0"+row[j]:""+row[j];
						betCode += j==len-1?"":",";
					}else{
						message.innerHTML = "<span>错误提示：</span>投注号码有误! 请检查第<span>"+(i+1)+"</span>条投注内容~";
						return;
					}
				}
				var betNum = 1;
				var dansFs = "任"+len+"单式";
				$('<li betNum='+betNum+' betCode='+betCode+'><span class="qyspa">'+
						'<input name="" type="checkbox" value="" class="qycodlclia" />'+
						'［'+dansFs+'  '+betNum+'注］</span><span class="redd">'+betCode+'</span><span class="qyspb">'+
						'<a style="cursor:pointer" onclick="$(this).parent().parent().remove();calculteAll();">删除</a></span>'+
						'</li>').appendTo($("#betListAreaId"));
				calculteAll();
			}else{
				message.innerHTML = "<span>错误提示：</span>投注项长度有误! 请检查第<span>"+(i+1)+"</span>条投注内容~";
				return;
			}
		}
		//result.innerHTML = html;
		hideDiv('handworkInput');
	}
