/**
 * <p>Desc:竞彩足球单式上传页面控制</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/5/25 Version 1.0
 */

var dateUtils = new DateUtils();

$(document).ready(function () {
	loadDsSch();
	
	$("input[type=radio][name=playTypeName]").click(function(){
		loadDsSch();
	});
	
	// 合买暂时不支持
	//$("input[type=radio][name=buyType][value=3]").attr("disabled", "disabled");
	
	// 加载事件
	$("#dsSchDivId").find("input[type=checkbox]").live('click',function(){
		// 显示第一次比赛的截止时间
		if ( $("#dsSchDivId").find("input[type=checkbox]:checked").length > 0 ) {
			var stopTime = $("#dsSchDivId").find("input[type=checkbox]:checked").eq(0).attr("stoptime");
			$("#schemaStopTimeId").html(stopTime);
			
			var licenseId = parseInt($("#licenseId").val());
			var playType = parseInt($("input[type=radio][name=playTypeName]:checked").val());
			var guess = new Guess(licenseId, playType);
			// 显示过关方式
			var clen = $("#dsSchDivId").find("input[type=checkbox]:checked").length;
			var maxLen = guess.getMaxPassNum();
			if ( clen > maxLen ) {
				clen = maxLen;
				//layer.alert("最多可选择"+maxLen+"场投注！",0);
				//return false;
			}
			$("#dsPassTId").find("input[type=radio]").each(function(index){
				if ( parseInt($(this).val()) <= clen ) {
					$(this).parent().show();
					if ( parseInt($(this).val()) == clen ) {
						//$(this).removeAttr("disabled");
						$(this).click();
						$(this).attr("checked", "checked");
					} else {
						//$(this).attr("disabled", "disabled");
					}
				} else {
					$(this).parent().hide();
				}
			});
		} else {
			$("#schemaStopTimeId").html("--");
		}
		$("#schudleSelId").html($("#dsSchDivId").find("input[type=checkbox]:checked").length);
	});
	ajaxFileUpload();
	
});

//装载单式上传赛程 added at 2015/03/10
function loadDsSch() {
	$("#dsSchDivId").empty();
	var date = "";
	var dv = "";
	var zz = "";
	var html = "";
	var ndate = $("#ndateValId").val();
	
	var licenseId = $("#licenseId").val();
	var playType = parseInt($("input[type=radio][name=playTypeName]:checked").val());
	{
		var g = new Guess(parseInt(licenseId), playType);
		$("#maxSelectId").html("最多可选择"+g.getMaxPassNum()+"场");
	}
	var counterMap = new Hashtable();
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		if ( playType == 1 ) {
			if (  obj.spfggodds == 'null' ) {
				continue;
			}
		} else if ( playType == 2 ) {
			if (  obj.rqspfggodds == 'null' ) {
				continue;
			}
		} else if ( playType == 3 ) {
			if (  obj.zjqggodds == 'null' ) {
				continue;
			}
		} else if ( playType == 4 ) {
			if (  obj.zjqggodds == 'null' ) {
				continue;
			}
		} else if ( playType == 5 ) {
			if (  obj.bfodds == 'null' ) {
				continue;
			}
		}
		date = schedules[i].id.substring(0,8);
		
		if ( dateUtils.formatGuessDate(schedules[i].stoptime, $("#aheadTimeId").val()) > ndate ) {
			if ( counterMap.get(date) != 'undefined' ) {
				counterMap.put(date, parseInt(counterMap.get(date))+1);
			} else {
				counterMap.put(date, 1);
			}
		} 
	}
	date = "";
	for ( var ii = 0; ii < schedules.length; ii++ ) {
		if ( dateUtils.formatGuessDate(schedules[ii].stoptime, $("#aheadTimeId").val()) <= ndate ) {
			continue;
		}
		var obj = schedules[ii];
		// 如果过关赔率没有，不生成
		if ( licenseId == "9" ) {
			if ( playType == 1 ) {
				if (  obj.spfggodds == 'null' ) {
					continue;
				}
			} else if ( playType == 2 ) {
				if (  obj.rqspfggodds == 'null' ) {
					continue;
				}
			} else if ( playType == 3 ) {
				if (  obj.zjqggodds == 'null' ) {
					continue;
				}
			} else if ( playType == 4 ) {
				if (  obj.zjqggodds == 'null' ) {
					continue;
				}
			} else if ( playType == 5 ) {
				if (  obj.bfodds == 'null' ) {
					continue;
				}
			}
		} else if ( licenseId == "10" ) {
			if ( playType == 1 ) {
				if (  obj.sfggodds == 'null' ) {
					continue;
				}
			} else if ( playType == 2 ) {
				if (  obj.rfsfggodds == 'null' ) {
					continue;
				}
			} else if ( playType == 3 ) {
				if (  obj.sfcodds == 'null' ) {
					continue;
				}
			} else if ( playType == 4 ) {
				if (  obj.dxfggodds == 'null' ) {
					continue;
				}
			} 
		} 
		var hostn = obj.hostname;
		if ( hostn.length > 3 ) {
			hostn = hostn.substring(0,3);
		}
		var guestn = obj.guestname;
		if ( guestn.length > 3 ) {
			guestn = guestn.substring(0,3);
		}
		if ( licenseId == "10" ) {
			var tmphost = hostn;
			hostn = guestn;
			guestn = tmphost;
		}
		var stopTime = dateUtils.formatGuessDate(obj.stoptime,$("#aheadTimeId").val());
		if ( date == "" ) {
			date = obj.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			dv = dd  + " " + dateUtils.getWeekDay(dd);
			var zz = dateUtils.getWeekDay(dd);
			html += '<div class="w_ggfs_t"><span>'+dd+'</span><span>'+zz+'(截止时间：'+stopTime+')</span><span>'+counterMap.get(date)+'场比赛可投注</span></div> ' +
				'<div class="w_ggfsc_fx"><ul>';
			
		}
		if ( date == obj.id.substring(0,8) ) {
			html += '<li><a href="javascript:void 0"><input id="'+obj.id+'" type="checkbox" stoptime="'+stopTime+'"/><span>'+obj.id.substring(8)+'</span><span>'+hostn+''+getAheadTime(obj.stoptime.substring(11,16))+'</span><span>'+guestn+'</span></a></li>';
		} else {
			html += '<div class="clear"></div></ul></div>';
			
			date = obj.id.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			dv = dd  + " " + dateUtils.getWeekDay(dd);
			var zz = dateUtils.getWeekDay(dd);
			
			html += '<div class="w_ggfs_t"><span>'+dd+'</span><span>'+zz+'(截止时间：'+stopTime+')</span><span>'+counterMap.get(date)+'场比赛可投注</span></div> ' +
			'<div class="w_ggfsc_fx"><ul>';
			
			html += '<li><a href="javascript:void 0"><input id="'+obj.id+'" type="checkbox" stoptime="'+stopTime+'"/><span>'+obj.id.substring(8)+'</span><span>'+hostn+''+getAheadTime(obj.stoptime.substring(11,16))+'</span><span>'+guestn+'</span></a></li>';
			
		}
	}
	html += '<div class="clear"></div></ul></div>';
	$(html).appendTo($("#dsSchDivId"));
	
	// 隐藏过关方式
	$("#dsPassTId").find("input[type=radio]").parent().hide();
	
}

function ajaxFileUpload() {
	$("#fileuplodid").uploadify({
		'uploader' :'/js/lottery/upload/uploadify.swf?random=' + (new Date()).getTime(),//flash文件位置，注意路径 
		'script':'/lottery/singleUpload.do',//后台处理的请求
		'cancelImg' :'/js/lottery/upload/images/cancel.png',//取消按钮图片
		'folder': '',
		'fileDataName' : 'file',
		'buttonImg' : '/cytxhome/images/sc_button.jpg',
		'width':121,
		'height':51,
		'multi': false,// 设置单文件上传或多文件上传
		'queueID' : "fileQueue",
		'displayData': 'speed',
		'method' : 'POST',
		'scriptData' : {"licenseId":$('#licenseId').val(),"playId":$('input[type=radio][name=playTypeName]:checked').val(),"passNum":$("#dsPassTId").find("input[type=radio]:checked").val(),"schNum":$("#dsSchDivId").find("input[type=checkbox]:checked").length},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
		onSelect: function (event, queueID, fileObj){//动态加载上传组件的参数
			$("#fileuplodid").uploadifySettings('scriptData',{"licenseId":$("#licenseId").val(),"playId":$('input[type=radio][name=playTypeName]:checked').val(),"passNum":$("#dsPassTId").find("input[type=radio]:checked").val(),"schNum":$("#dsSchDivId").find("input[type=checkbox]:checked").length});
		},
		onError: function (event, queueID ,fileObj, errorObj) {
			layer.alert("服务端号码验证失败！",0);
			return false;
		},
		onComplete: function (event, queueID ,fileObj, response, data) {
			eval( "var bet = " + response + ";" );
			if( bet.errCode == 0 ){
				layer.alert(bet.message,0);
				return false;
			}
			var mult = $("#multipleId").val();
			if ( !isNaN(mult) ) {
				mult = parseInt(mult);
			} else {
				mult = 1;
			}
			$("#betMoneyId").html(bet.betNum * 2 * mult);
			$("#betNumId").html(bet.betNum);
			$("#fileNameId").val(bet.fileName);
			$("#dsfileNameId").val(bet.fileName);
			$("input[type=hidden][name=passType]").val($("#dsPassTId").find("input[type=radio]:checked").val()+"c1");
			
			layer.alert("文件上传成功，总共上传"+bet.betNum+"注",0);
		}
	});
}