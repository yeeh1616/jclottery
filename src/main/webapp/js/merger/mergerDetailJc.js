var dateUtils = new DateUtils();
$(document).ready(function (){
	$("#fsscBtnId").click(function (){
		var title ='请选择';
		var lic = $("#licenseId").val();
		var orderId = $("#orderId").val();
		var p = "fsschhgg";
		var pt = $("#playTypeId").val();
		if ( pt == "1" ) {
			p = "fsscspf";
		} else if ( pt == "2" ) {
			p = "fsscrqspf";
		} else if ( pt == "3" ) {
			p = "fssczjq";
		} else if ( pt == "4" ) {
			p = "fsscbqc";
		} else if ( pt == "5" ) {
			p = "fsscbf";
		}
		var url = "/lottery/index.jhtml?licenseId="+lic+"&p="+p+"&orderId="+orderId;
		$.layer({
		    type: 2,
		    maxmin: true,
		    shadeClose: true,
		    title: title,
		    fix : false,
		    shade: [0.1,'#000'],
		    offset: ['20px',''],
		    area: ['986px', ($(window).height() - 90) +'px'],
		    iframe: {src:url},
		    end: function(index){
		    	location.reload();
		    	layer.close(index);
		    }
		}); 
	});
	// 加载赛事信息
	loadDsSch();
	$("#dsSchDivId").find("input[type=checkbox]").live('click',function(){
		// 显示第一次比赛的截止时间
		if ( $("#dsSchDivId").find("input[type=checkbox]:checked").length > 0 ) {
			var licenseId = parseInt($("#licenseId").val());
			var playType = parseInt($("#playTypeId").val());
			var guess = new Guess(licenseId, playType);
			// 显示过关方式
			var clen = $("#dsSchDivId").find("input[type=checkbox]:checked").length;
			var maxLen = guess.getMaxPassNum();
			if ( clen > maxLen ) {
				clen = maxLen;
			}
			$("#dsPassTId").find("input[type=radio]").each(function(index){
				if ( parseInt($(this).val()) <= clen ) {
					$(this).parent().show();
					if ( parseInt($(this).val()) == clen ) {
						$(this).click();
						$(this).attr("checked", "checked");
					} else {
					}
				} else {
					$(this).parent().hide();
				}
			});
		} 
	});
	$("#fileuplodid").uploadify({
		'uploader' :'/js/lottery/upload/uploadify.swf?random=' + (new Date()).getTime(),//flash文件位置，注意路径 
		'script':'/lottery/frsSingleFstUpload.do',//后台处理的请求
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
		'scriptData' : {"orderId":$('#mergerOrderId').val(),"licenseId":$('#licenseId').val()},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
		onSelect: function (event, queueID, fileObj){//动态加载上传组件的参数
			// 对阵编号
			var sch = "";
			$("#dsSchDivId").find("input[type=checkbox]:checked").each(function(index){
				sch += $(this).attr("id") + ",";
			});
			var ps = $("#dsPassTId").find("input[type=radio]:checked").val()+"c1";
			$("#fileuplodid").uploadifySettings('scriptData',{"orderId":$('#mergerOrderId').val(),"licenseId":$("#licenseId").val(),"schs":sch,"passType":ps,"playId":$("#dplayId").val()});
		},
		onError: function (event, queueID ,fileObj, errorObj) {
			alert("文件上传失败");
			return false;
		},
		onComplete: function (event, queueID ,fileObj, response, data) {
			eval( "var bet = " + response + ";" );
			if ( bet.errCode == 1 ) {
				alert("文件上传成功!");
				location.reload();
			} else {
				layer.alert(bet.message,0);
			}
		}
	});
})

function loadDsSch() {
	$("#dsSchDivId").empty();
	var date = "";
	var dv = "";
	var zz = "";
	var html = "";
	var ndate = $("#ndateValId").val();
	
	var licenseId = $("#licenseId").val();
	var playType = parseInt($("#playTypeId").val());
	
	var counterMap = new Hashtable();
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
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