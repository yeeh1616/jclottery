<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/js/lottery/handwork.js"></script>
<style type="text/css">
/*--弹出层--*/
.lr_layer {
	width: 590px;
	height: 305px;
	background:#F5F5F5;
	box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.2);
	border-radius: 7px;
	margin: 100px auto;
}
.lr_layer_top {
	height: 36px;
	line-height: 36px;
	background: #0987DF;
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	padding-left: 15px;
	padding-right: 15px;
	color: #fff;
}
.lr_layer_top a {
	color: #fff !important;
	font-size:13px;
	font-weight:bold;
}
.lr_btn_n {
	width:99px;
	height: 30px;
	display: block;
	margin: auto;
	text-align: center;
	line-height: 30px;
	color: #fff !important;
	background: #F55100;
	font-size: 14px;
	border-radius: 3px;
	margin-top: 215px;
}
.lr_btn_n:hover{color: #fff !important;}
.dlt_wby {
	width: 547px;
	height: 140px;
	padding: 5px;
	border: 1px solid #7EA5D7;
	line-height: 22px;
	color:#999;
	resize: none;
}
.lr_cont {
	margin-top:5px;
}
.lr_tsxx{color:#716F6F;margin-top:3px;padding-left: 15px;}
.lr_tsxx span{color: #DE5658;
font-weight: bold;

m}
/*弹层结束*/
</style>
<div id="handworkInput" class="lr_layer" style="display: none">
  <div class="lr_layer_top">
    <h3 class="fl">手工录入</h3>
    <a href="#" class="fr" onclick="hideDiv('handworkInput');">╳</a>
    <div class="clear"></div>
    <p class="lr_tsxx" id="message">&nbsp;</p>
    <div class="lr_cont">
      <textarea id="inputText" class="dlt_wby" onclick="if(value==defaultValue){value='';this.style.color='#000'}" 	onblur="if(!value){value=defaultValue;this.style.color='#999'}">
		每注之间必须以"回车"区分 参考格式：
			01,02,03,04,05
			04|05|06|07|08
			02-03-04-05-06
			03 04 05 06 07
		备注：号码之间可以使用任意"非数字"符号代替
      </textarea>
    </div>
  </div>
  <a href="#" class="lr_btn_n" onclick="center(${licenseId});">确定</a>
</div>