/**
 * <p>Desc:北单胜平负单式上传页面控制</p>
 * <p>Author: luochang</p>
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p>
 * Added by Luochang at 2015/09/09 Version 1.0
 */

var dateUtils = new DateUtils();
var guess = new SingleSchedule(4);
$(document).ready(function () {
	loadDsSch();
	
	// 加载事件
	$("#dsSchDivId").find("input[type=checkbox]").live('click',function(){
		// 显示第一次比赛的截止时间
		if ( $("#dsSchDivId").find("input[type=checkbox]:checked").length > 0 ) {
			var stopTime = $("#dsSchDivId").find("input[type=checkbox]:checked").eq(0).attr("stoptime");
			$("#schemaStopTimeId").html(stopTime);
			
			// 显示过关方式
			var clen = $("#dsSchDivId").find("input[type=checkbox]:checked").length;
			var maxLen = 6;
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
		} else {
			$("#schemaStopTimeId").html("--");
		}
		$("#schudleSelId").html($("#dsSchDivId").find("input[type=checkbox]:checked").length);
	});
	ajaxFileUpload();
	
	// 进入投注确认页
	$("#lotteryFormBtnId").click(function(){
		if ( $("#betMoneyId").html() != "0" ) {
			// 查询余额
			$.ajax({
			    type: "post",
			    url: "/common/getAccountUsable.json",
			    async: false,
			    dataType: "json",
			    error: function(xMLHttpRequest, textStatus, errorThrown){
				},
			    success: function (data){
					if ( data == '-1' ) {
						// 登录
						$(".openlogin").click();
					} else {
						var pay = parseFloat($("#betMoneyId").html());
						/*var balance = parseFloat(data);
						if ( pay > balance ) {
							layer.alert("余额不足，请您先充值！",0);
						} else {*/
							$("#betPanalId").hide();
							$("#surePanalId").show();
							
							$("#showBalDivId").html(formatCurrency(data)+"元");// 余额显示
							var passString = "";
							$("#sureSchPanalId").empty();
							if ( $("#pageNameId").val().indexOf("dssc") == -1 ) { // 单式上传
								// 填充数据
								var html = '<tr>'+
								    '<th width="15%">赛事编号</th>'+
								    '<th width="25%">主队 VS 客队</th>'+
								    '<th width="52%">投注内容</th>'+
								    '<th width="8%">胆</th>'+
								  '</tr>';	// 头部
								$("#betSelAreaId").find("tr").each(function(index){
									html += '<tr>'+
									    '<td>'+$(this).children().eq(0).html()+'</td>'+
									    '<td>'+$(this).children().eq(1).html()+'</td><td>';
									$(this).children().eq(2).children().each(function(index){
										html += '<i>'+$(this).html()+'</i>';
									});
									html += '</td>';
									if ( $(this).find("input[type=checkbox]:checked").length > 0 ) {
										html += '<td>胆</td></tr>';
									} else {
										html += '<td></td></tr>';
									}
								});
								$(html).appendTo($("#sureSchPanalId"));
								$("#passAreaId").find("input[type=checkbox]:checked").each(function(index){
									var selected = parseInt($("#schudleSelId").html());
									var cLen = parseInt($(this).val().split("c")[0]);
									if ( cLen <= selected ) {
										passString += $(this).val() + ",";
									}
								});
								passString = passString.substring(0, passString.length - 1);
							} else {
								$('<tr><td align=left><font color=red>*方案为文件上传</font></td></tr>').appendTo($("#sureSchPanalId"));
								$("#passShowId").html($("input[type=radio][name=dsPtName]:checked").val()+"串1");
							}
							
							if ( "" != passString ) {
								$("#passShowId").html(passString.replaceAll("c", "串"));
							}
							
							var multiple = $("#multipleId").val();
							
							$("#sureBetNumId").html(parseInt($("#betMoneyId").html())/parseInt(multiple)/2+"注");
							$("#sureMultipleId").html(multiple + "倍");
							$("#sureBetMoneyId").html($("#betMoneyId").html()+"元");
							
							$("input[name=buyType]").eq(0).click();
						//}
						
					}
			    }
			});
			
		} else {
			layer.alert("请先投注！",0);
		}
	});
	
	$("#returnModId").click(function(){
		$("#betPanalId").show();
		$("#surePanalId").hide();
	});
	
	$("#sureBetBtnId").click(function(){
		if ( !$("#agreeChkId").attr("checked") ) {
			layer.alert("请同意彩店与彩民交易协议！",0);
			return false;
		}
		// 先判断余额，如果未登录，先登录
		$.ajax({
		    type: "post",
		    url: "/common/getAccountUsable.json",
		    async: false,
		    //data: "licenseId=" + licenseId,
		    dataType: "json",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
			},
		    success: function (data){
				if ( data == '-1' ) {
					// 尚未登录
					$(".openlogin").click();
				} else {
					// 判断余额是否足够
					var pay = parseFloat($("#betMoneyId").html());
					var oo = $("input[name=buyType]:checked").val();
					var balance = parseFloat(data);
					if ( (pay > balance) && oo == "1") {
						layer.alert("余额不足，请您先充值！",0);
					} else {
						if ( oo == "1" ) {
							if ( $("#pageNameId").val() == "bqcdssc" ) { // 单式上传
								dsscFormSubmit();
							} else {
								formSubmit();
							}
						} else if ( oo == "3" ) {
							if ( $("#pageNameId").val() == "bqcdssc" ) { // 单式上传
								hem.dsSubmitForm();
							} else {
								hem.submitForm();
							}
						}
						$("#loginCloseBtnId").click();
						$("#returnModId").click();
					}
				}
		    }
		});
		
	});
	
	// 倍数控制事件 begin
	$("#multipleId").keydown(function(event){
		if ( ((event.keyCode > 47 && event.keyCode < 58) || (event.keyCode > 95 && event.keyCode < 106)) || event.keyCode == 8) {
			return true;
		} else {
			return false;
		}
	});
	$("#multipleId").keyup(function(event){
		if ( $(this).val() != "" ) {
			$(this).val($(this).val().replace(/\D/g,''));
			calculate();
		}
	});
	$("#subMBtnId").click(function(){
		var v = $("#multipleId").val();
		if ( parseInt(v) > 1 ) {
			$("#multipleId").val(parseInt(v)-1);
			calculate();
		}
	});
	$("#addMBtnId").click(function(){
		var v = $("#multipleId").val();
		$("#multipleId").val(parseInt(v)+1);
		calculate();
	});
	// 倍数控制事件 end
});

function calculate() {
	var betNum = parseInt($("#betNumId").html());
	var mult = parseInt($("#multipleId").val());
	$("#betMoneyId").html(betNum * 2 * mult);
}

function dsscFormSubmit() {
	var form = $("#singleFormId");
	$(form).find("input[name=playId]").val("4");
	// 对阵编号
	var sch = "";
	// 截止时间
	var stopTime = "";
	// 让球数
	var rqs = "";
	$("#dsSchDivId").find("input[type=checkbox]:checked").each(function(index){
		sch += $(this).attr("id") + ",";
	});
	sch = sch.substring(0, sch.length-1);
	$(form).find("input[name=schs]").val(sch);
	$(form).find("input[name=stopTime]").val(stopTime);
	$(form).find("input[name=rqs]").val(rqs);
	
	var mult = $("#multipleId").val();
	if ( isNaN(mult) ) {
		mult = 1;
	}
	$(form).find("input[name=multiple]").val(mult);
	
	// 过关方式
	$("#singleFormId").submit();
}

//装载单式上传赛程 added at 2015/03/10
function loadDsSch() {
	$("#issueSId").html("当前期"+schedules[0].issue);
	$("input[name=issue]").val(schedules[0].issue);
	guess.init(schedules);
	
	$("#dsSchDivId").empty();
	var date = "";
	var dv = "";
	var zz = "";
	var html = "";
	var ndate = $("#ndateValId").val();
	var counterMap = new Hashtable();
	for ( var i = 0; i < schedules.length; i++ ) {
		var obj = schedules[i];
		date = schedules[i].uuid.substring(0,8);
		if ( dateUtils.formatGuessDate(schedules[i].betEndTime, $("#aheadTimeId").val()) > ndate ) {
			if ( counterMap.get(date) != 'undefined' ) {
				counterMap.put(date, parseInt(counterMap.get(date))+1);
			} else {
				counterMap.put(date, 1);
			}
		} 
	}
	date = "";
	for ( var ii = 0; ii < schedules.length; ii++ ) {
		if ( dateUtils.formatGuessDate(schedules[ii].betEndTime, $("#aheadTimeId").val()) <= ndate ) {
			continue;
		}
		var obj = schedules[ii];
		// 如果过关赔率没有，不生成
		var hostn = obj.hostTeam;
		if ( hostn.length > 3 ) {
			hostn = hostn.substring(0,3);
		}
		var guestn = obj.guestTeam;
		if ( guestn.length > 3 ) {
			guestn = guestn.substring(0,3);
		}
		var stopTime = dateUtils.formatGuessDate(obj.betEndTime,$("#aheadTimeId").val());
		if ( date == "" ) {
			date = obj.uuid.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			dv = dd  + " " + dateUtils.getWeekDay(dd);
			var zz = dateUtils.getWeekDay(dd);
			html += '<div class="w_ggfs_t"><span>'+dd+'</span><span>'+zz+'(截止时间：'+stopTime+')</span><span>'+counterMap.get(date)+'场比赛可投注</span></div> ' +
				'<div class="w_ggfsc_fx"><ul>';
			
		}
		if ( date == obj.uuid.substring(0,8) ) {
			html += '<li><a href="javascript:void 0"><input id="'+obj.uuid+'" type="checkbox" stoptime="'+stopTime+'"/><span>'+obj.uuid.substring(8)+'</span><span>'+hostn+''+getAheadTime(obj.betEndTime.substring(11,16))+'</span><span>'+guestn+'</span></a></li>';
		} else {
			html += '<div class="clear"></div></ul></div>';
			
			date = obj.uuid.substring(0,8);
			var dd = date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6);
			dv = dd  + " " + dateUtils.getWeekDay(dd);
			var zz = dateUtils.getWeekDay(dd);
			
			html += '<div class="w_ggfs_t"><span>'+dd+'</span><span>'+zz+'(截止时间：'+stopTime+')</span><span>'+counterMap.get(date)+'场比赛可投注</span></div> ' +
			'<div class="w_ggfsc_fx"><ul>';
			
			html += '<li><a href="javascript:void 0"><input id="'+obj.uuid+'" type="checkbox" stoptime="'+stopTime+'"/><span>'+obj.uuid.substring(8)+'</span><span>'+hostn+''+getAheadTime(obj.betEndTime.substring(11,16))+'</span><span>'+guestn+'</span></a></li>';
			
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
		'scriptData' : {"licenseId":$('#licenseId').val(),"playId":"4","passNum":$("#dsPassTId").find("input[type=radio]:checked").val(),"schNum":$("#dsSchDivId").find("input[type=checkbox]:checked").length},
		'auto' : true,
		'fileDesc' : '*.txt',//上传文件类型说明
		'fileExt' : '*.txt',
		'sizeLimit' : 1024 * 1024 * 1024 * 10, //上传文件大小限制为5m
		onSelect: function (event, queueID, fileObj){//动态加载上传组件的参数
			$("#fileuplodid").uploadifySettings('scriptData',{"licenseId":$("#licenseId").val(),"playId":"4","passNum":$("#dsPassTId").find("input[type=radio]:checked").val(),"schNum":$("#dsSchDivId").find("input[type=checkbox]:checked").length});
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