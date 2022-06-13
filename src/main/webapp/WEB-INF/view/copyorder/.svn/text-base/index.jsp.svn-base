<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="账户中心-中奖记录" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<link href="/css/style3.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.w_hrb {
	width: 802px;
	height:101px;
	margin-bottom: 10px;
	margin: auto;
	margin-top: 17px;
	background:url(/images/bangdan.png);
}
.w_hrbr {
	width: 642px;
	padding-top: 5px;
	margin-top:12px;
	color:#744a2e;
}
.w_hrbr li {
	display: block !important;
	width:100px !important;
	float: left !important;
	border-bottom: none !important;
	padding-left: 0px !important;
}
.w_hrbr li a {
	display: block !important;
	width: 93px !important;
	color:#744a2e !important;
	text-align: left;
	padding-left: 20px !important;
	padding-right:0px !important;
	float: left;
	height: 30px;
	line-height: 30px;
	font-size: 12px;
	font-weight: bold;
	background:none !important;
}
</style>

<style type="text/css">
.show_mergerCustomDiv {
    background-color: #fff;
    border: 1px solid #cccccc;
    height: 137px;
    margin-left:8px;
    margin-top: 8px;
    width: 653px;
}
body {
	margin: 0;
	padding: 0;
	list-style: none;
	font-size: 12px;
	font-family: "宋体";
	color:#565656;
	background-color:#f7f7f7;
}
div, html, body, ul, li, ol, dl, dd, dt, p, h1, h2, h3, h4, h5, h6, form, fieldset, legend, img, span {
	margin:0;
	padding:0;
}
img {
	border:0;
}
ul, li {
	list-style:none;
}
input {
	padding-top:0;
	padding-bottom:0;
	cursor:pointer;
}
select, input, img {

}
a {
	text-decoration:none;
	cursor:pointer;
	color:#565656;
}
a:hover {
	color:#cf3032 !important;
	text-decoration:none;
}
.clear {
	clear:both;
}
.fl {
	float:left;
}
.fr {
	float:right;
}
.common_w{width:980px;margin:0 auto;}
/**/

.follow_list {
position: absolute;
z-index: 9999991;
background: #fff;
height: 457px;
width: 782px;
border: 3px solid #a4a4a4;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
-webkit-box-shadow: 0 0 10px rgba(0,0,0,0.4);
-moz-box-shadow: 0 0 10px rgba(0,0,0,0.4);
box-shadow: 0 0 10px rgba(0,0,0,0.4);
font-family: "Microsoft yahei", Arial;
left: 50%;
margin-left: -384px;
top: 20px;
}
.follow_list h2 {
color: #2b2b2b;
padding: 8px 0 3px 18px;
height:30px;
line-height:30px;
}
.follow_list h2 span{width: 62px;
min-width: 62px;
margin-right: 18px;
text-align: center;
white-space: nowrap;
float: left;
height: 21px;
display: inline-block;
font: 700 16px/21px '微软雅黑';
}
.follow_list .dengji img{margin-top:3px;margin-left:2px;}
.f_cont_l a{width:100px;height:80px;background:url(images/peiliewu.png) no-repeat center center;display:block;}
.f_cont_r{width:680px;}
.f_cont_r li{width:164px;height:31px;text-align:center;line-height:31px;margin-right:5px;float:left;margin-bottom:10px;}
.f_cont_r_top .shen{background:#ededed;border-bottom:1p solid #e5e5e5;color:#717172;}
.f_cont_r_top .qian{background:#f6f6f6;color:#717172;}
.f_cont_r_top .qian a{width:115px;height:27px;background:#ff882c;line-height:27px;text-align:center;color:#fff !important;display:block;border-radius:3px;margin-left:28px;}
.f_cont_r_top .red{color:#e64949;}
.f_cont_r_top .blue{color:#1e50a2;}
.f_cont_r_ct{margin-top:10px;padding-left:10px;}
.f_cont_r_ct li{width:138px;height:31px;background:#f3f3f3;border:1px solid #e5e5e5;line-height:;31px;text-align:center;color:#717172;}
.f_cont_r_ct .current{width:138px;height:31px;background:#BC0F0F;border:1px solid #e5e5e5;line-height:;31px;text-align:center;color:#FFFFFF !important;}
.f_cont_r_ct .current a{color:#FFFFFF;}
.f_cont_gendan{width:633px;background:#fff7eb;padding:10px;color:#cd9964;}
.f_cont_gendan h3 img{ vertical-align:-2px;margin-right:5px;}
.f_cont_gendan p{color:#cd9964;line-height:20px;}
.f_text{width:65px;height:20px;border:1px solid #7c7c7c;text-align:center;}
.f_cont_rengou p{height:40px;line-height:40px;}
.f_cont_rengou span{width:94px;display:inline-block;text-align:right;font-weight:bold;}
.f_cont_jin{width:655px;height:51px;background:#f6f6f6;line-height:51px;margin-left:7px;}
.f_cont_jin_l{margin-left:25px;font-weight:bold;font-sixe:14px;font-family: "宋体";color:#2b2b2b;}
.f_cont_jin_l span{color:#e24949;margin-left:5px;margin-right:5px;}
.f_cont_jin_r a{width:90px;height:30px;background:#bc0f0f;text-align:center;color:#fff !important;line-height:30px;display:block;border-radius:3px;margin-right:30px;margin-top:10px;}
.f_cont_ff{text-align:right;margin-right:50px;margin-top:10px;}
.f_cont_ff input{ vertical-align:-3px;}
.f_cont_ff a{color:#1e50a2;}

/*20160314定制跟单*/
.new_dzhi {
	padding-left: 20px;
	line-height: 32px;
	margin-top: 6px;
}
.new_input {
	vertical-align: -3px;
	margin-right: 5px;
}
.new_dzhi1 {
	width: 693px;
	height: 262px;
	background: #fff;
	border-radius: 4px;
}
.new_dzhi_top {
	background-color: #fff;
	border: 1px solid #cccccc;
	height: 152px;
	margin-left: 19px;
	margin-top: 23px;
	width: 653px;}
.now_dzh {
	margin-top: 13px !important;
}
.f_cont_jin_r a:hover{color:#fff !important;}
/*20160314定制跟单end*/
</style>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>


<script type="text/javascript" src="/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/js/copyorder/index.js"></script>

<div class="common_w" id="haltAreaId">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 复制跟单  </div>
  </div>
<div class="memberbox ">
  	<%@include file="menu.jsp" %>
	 <div class="bdtj fl">
	 <div class="w_hrb">
	
    <div class="w_hrbr fr">
    	<ul id="mingrenbangId">
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="mrcont" >
		  <div class="con-top">
		  
		  <div class="clear"></div>
		  	<div class="con-top_l" ><span>可复制方案列表</span></div>
			
			<div class="con-top_r"><input type="text" value="按发起人昵称搜索" name="searchName" id="searchNameId"/>
			<a style="cursor:pointer" name="search" id="searchId"><img src="/images/sousuo_03.jpg" width="24" height="25" /></a></div>
		  </div>
		
<table width="801" border="0" cellspacing="0" cellpadding="0" bgcolor="#fff" class="biaoge">
	<tbody><tr>
		<td width="45" height="32" class="biaoge1">方案编号</td>
		<td width="60" class="biaoge1">发起人</td>
		<td width="87" class="biaoge1">方案描述</td>
		<td width="87" class="biaoge1">发起时间</td>
		<td width="87" class="biaoge1">截止时间</td>
		<td width="63" class="biaoge1">彩种 </td>
		<td width="62" class="biaoge1">方案倍数</td>
		<td width="62" class="biaoge1">方案金额</td>
		<td width="62" class="biaoge1">提成比例</td>
		<td width="93" class="biaoge1">认购倍数</td>
		<td width="49" class="biaoge1">跟单人数</td>
		<td width="49" class="biaoge1"> 操作</td>
	</tr>
			<c:forEach var="list" items="${pagination.list}" varStatus="varStatus">
			<tr>
				<c:choose>
					<c:when test="${varStatus.count%2==0}">
						<tr class="biaogeColor">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
				<td height="30" class=" biaoge4">${list.id}</td><!-- 序号 -->
				<td>${fn:substring(list.username,0,2)}***</td><!-- 发起人 -->
				<td>${list.reserved20}</td>
				<td>${list.orderDate}</td><!-- 发起时间 -->
				<td>${list.reserved13}</td><!-- 截止时间 -->
				<td>${list.licenseName}</td><!-- 彩种 -->
				<td>${list.multiple}</td><!-- 方案倍数 -->
				<td>${list.betPrice}元</td><!-- 方案金额 -->
			  	<td>${list.reserved16*100}%</td>
			    <td>
					<input type="text" class="text" value="${list.multiple}" name="multiple" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				</td><!-- 认购份 -->
				<td><font color=red>${list.reserved19 }</font></td>
	    		<td class=" biaoge3 color">
	    			<input type="button" name="custom" value="定制" class="btn" userid="${list.userid }" licenseId="${list.licenseId }" />
	    			<input type="button" name="mergerjoin" value="复制" class="btn" orderId="${list.id}" betNum="${list.betNum}"/>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="mrtop1">
			<div class="clear"></div>
			<div class="page2">
			<form id="reportForm" name="reportForm" action="/copyorder/index.jhtml" method="post">
		  		<input type="hidden" name="licenseId" value="${param.licenseId}" />
		  		<input type="hidden" name="username" value="${param.username}" />
		  	</form>
				<customertags:paging formId="reportForm" pageNo="${pagination.pageNo}" count="${pagination.totalCount}" pageSize="${pagination.pageSize}" />
			</div>
		</div>

	    	<div class="clear"></div>
		</div>
        </div>
<div class="clear"></div>
</div>
</div>

<div class="f_cont layer_pageContent" id="orPanelId" style="display:none;">
    <div class="new_dzhi1 fl">
      <div class="f_cont_r_c new_dzhi_top style="display: block;">
        <div class="f_cont_gendan">
          <h3><img width="16" height="16" src="/images/tanhao.png"/>定制提示：</h3>
          <p>1.默认复制原始方案，包括倍数。</p>
          <p>2.设置以下条件之后，先根据条件判断是否跟单及跟单倍数。</p>
        </div>
        <div class="new_dzhi">
          <!--<p><input type="checkbox"/><span>每次跟单倍金额的</span>
            <input type="text" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" name="money" value="10" class="f_text"/>
                      倍</p>-->
          <p><input type="checkbox" class="new_input" id="dbSetId"/><span>金额低于</span>
            <input type="text" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" id="dbMoneyId" value="10" class="f_text"/>
                      元跟单<input type="text" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" id="dbMultId" value="10" class="f_text"/>
                      倍</p>
          <p><input type="checkbox" class="new_input" id="gdSetId"/><span>当金额大于</span>
            <input type="text" onafterpaste="this.value=this.value.replace(/\D/g,'')" onkeyup="this.value=this.value.replace(/\D/g,'')" id="gdMoneyId" value="10000" class="f_text"/>
                      元放弃跟单</p>
        </div>
      </div>
      <div class="f_cont_jin">
          <div class="f_cont_jin_r fr">
	          <a id="cusBtnId" licenseId="" customedId="">立即定制</a>
          </div>
          <div class="clear"></div>
        </div>
    </div>
  </div>

<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/datepicker4/WdatePicker.js"></script>
<script type="text/javascript" src="http://collection.cp020.com/homePage/copyCelebrity.do?storeId=${domain.storeId }"></script>
<script type="text/javascript">
$(document).ready(function () {
	for ( var i = 0; i < cels.length; i++ ) {
		if ( cels[i].bonus > 0 ) {
			var len = cels[i].name.length;
			if ( len > 2 ) {
				len = 2;
			}
			$('<li><a uri="/copyorder/index.jhtml">'+cels[i].name.substring(0,len)+'**** </a></li>').appendTo($("#mingrenbangId"));
		}
	}
	$('<div class="clear"></div>').appendTo($("#mingrenbangId"));
});
</script>
</body>
</html>
