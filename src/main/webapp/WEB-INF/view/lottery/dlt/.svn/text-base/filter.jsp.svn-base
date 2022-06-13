<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="大乐透" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/dlt.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../../include/cytxlevel2header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/DltFilter.js"></script>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>
<script type="text/javascript" src="/js/lottery/dlt/filter.js"></script>

<div class="common_w" id="betPanalId">  
	<jsp:include page="./header.jsp"></jsp:include>
<div class="sais_t"></div>
<div class="jiangjin">
<!--大乐透-->
<div class="jiangjin_l">

<link rel="stylesheet" type="text/css" href="http://img.78500.cn/78500/topnav/global2.css" />
<link rel="stylesheet" type="text/css" href="http://img.78500.cn/78500/tools/tool.css" />
<table class="ss-box" style="width:750px;">
<tbody class="ss-tj">
<tr>
<td colspan="2" >
<div class="ss-tj-p5-top" style="height:230px;">
<ul class="list">
<li class="bold color-blue"><b>1、请选择基本号码和胆码</b></li>
<li><span class="color-red">基本号码在5个号码以上，前区胆码为0至4之间，后区胆码为0至1之间</span></li>
</ul> 
<ul class="list ss-tj-ban" id="td_red" style="width:420px;">
<li style="height:120px;">
<ul class="nub">
<li><input class="greybutton" type="button" value="01" name="h" /> </li>
<li><input class="greybutton" type="button" value="02" name="h" /> </li>
<li><input class="greybutton" type="button" value="03" name="h" /> </li>
<li><input class="greybutton" type="button" value="04" name="h" /> </li>
<li><input class="greybutton" type="button" value="05" name="h" /> </li>
<li><input class="greybutton" type="button" value="06" name="h" /> </li>
<li><input class="greybutton" type="button" value="07" name="h" /> </li>
<li><input class="greybutton" type="button" value="08" name="h" /> </li>
<li><input class="greybutton" type="button" value="09" name="h" /> </li>
<li><input class="greybutton" type="button" value="10" name="h" /> </li>
<li><input class="greybutton" type="button" value="11" name="h" /> </li>
<li><input class="greybutton" type="button" value="12" name="h" /> </li>
<li><input class="greybutton" type="button" value="13" name="h" /> </li>
<li><input class="greybutton" type="button" value="14" name="h" /> </li>
<li><input class="greybutton" type="button" value="15" name="h" /> </li>
<li><input class="greybutton" type="button" value="16" name="h" /> </li>
<li><input class="greybutton" type="button" value="17" name="h" /> </li>
<li><input class="greybutton" type="button" value="18" name="h" /> </li>
<li><input class="greybutton" type="button" value="19" name="h" /> </li>
<li><input class="greybutton" type="button" value="20" name="h" /> </li>
<li><input class="greybutton" type="button" value="21" name="h" /> </li>
<li><input class="greybutton" type="button" value="22" name="h" /> </li>
<li><input class="greybutton" type="button" value="23" name="h" /> </li>
<li><input class="greybutton" type="button" value="24" name="h" /> </li>
<li><input class="greybutton" type="button" value="25" name="h" /> </li>
<li><input class="greybutton" type="button" value="26" name="h" /> </li>
<li><input class="greybutton" type="button" value="27" name="h" /> </li>
<li><input class="greybutton" type="button" value="28" name="h" /> </li>
<li><input class="greybutton" type="button" value="29" name="h" /> </li>
<li><input class="greybutton" type="button" value="30" name="h" /> </li>
<li><input class="greybutton" type="button" value="31" name="h" /> </li>
<li><input class="greybutton" type="button" value="32" name="h" /> </li>
<li><input class="greybutton" type="button" value="33" name="h" /> </li>
<li><input class="greybutton" type="button" value="34" name="h" /> </li>
<li><input class="greybutton" type="button" value="35" name="h" /> </li>

</ul>
</li>
<div class="clear"></div>
<li><input type="radio" value="0" name="qqselect" id="qqselect0" checked="checked" />
<label for="qqselect0">前区号码：
<input type="text" name="qhm" class="term-input4" id="qhm" style="width:140px;" readonly="readonly" />
</label>
<input type="radio" value="1" name="qqselect" id="qqselect1"/>
<label for="qqselect1">前区胆码：
<input type="text" name="qdm" id="qdm" style="width:60px;" class="term-input2" readonly="readonly" />
</label>
</li>
<div class="clear"></div>
</ul>
<ul class="list ss-tj-ban" id="td_red" style="width:270px;">
<li style="height:120px;width:180px;">
<ul class="nub">
<li><input class="greybutton" type="button" value="01" name="d" /> </li>
<li><input class="greybutton" type="button" value="02" name="d" /> </li>
<li><input class="greybutton" type="button" value="03" name="d" /> </li>
<li><input class="greybutton" type="button" value="04" name="d" /> </li>
<li><input class="greybutton" type="button" value="05" name="d" /> </li>
<li><input class="greybutton" type="button" value="06" name="d" /> </li>
<li><input class="greybutton" type="button" value="07" name="d" /> </li>
<li><input class="greybutton" type="button" value="08" name="d" /> </li>
<li><input class="greybutton" type="button" value="09" name="d" /> </li>
<li><input class="greybutton" type="button" value="10" name="d" /> </li>
<li><input class="greybutton" type="button" value="11" name="d" /> </li>
<li><input class="greybutton" type="button" value="12" name="d" /> </li>
</ul>
</li>
<div class="clear"></div>
<li style="height:25px;"> 	
<input type="radio" value="0"  name="selecthqm" id="selecthqm1" checked="checked"/>
<label for="selecthqm1">后区号码：
<input type="text" name="hhm" id="hhm" style="width:40px;" class="term-input4" readonly="readonly" value="" />
</label>
<input type="radio" value="1"  name="selecthqm" id="selecthqm2"/>
<label for="selecthqm2">后区胆码：
<input type="text" name="hdm" id="hdm" style="width:20px;" class="term-input2" readonly="readonly" value="" />
</label>
</li>
</ul>
</div>
<div class="clear"></div>
<div class="ss-tj-p5-top" style="height:420px;">
<table class="ss-dlt-little-box">
<tbody>
<tr><td colspan="2" class="bold color-blue"><b>2、请选择前区缩水条件</b></td></tr>
<tr>
<td class="ss-dlt-title">AC值：</td>
<td>
<ul class="list">
<li>
<input name="ac" type="checkbox" value="0" id="ac0"/><label for="ac0">0</label>
<input name="ac" type="checkbox" value="1" id="ac1"/><label for="ac1">1</label>
<input name="ac" type="checkbox" value="2" id="ac2"/><label for="ac2">2</label>
<input name="ac" type="checkbox" value="3" id="ac3"/><label for="ac3">3</label>
<input name="ac" type="checkbox" value="4" id="ac4"/><label for="ac4">4</label>

<input name="ac" type="checkbox" value="5" id="ac5"/><label for="ac5">5</label>
<input name="ac" type="checkbox" value="6" id="ac6"/><label for="ac6">6</label>
<input name="ac" type="checkbox" value="7" id="ac7"/><label for="ac7">7</label>
<input name="ac" type="checkbox" value="8" id="ac8"/><label for="ac8">8</label>
<input name="ac" type="checkbox" value="9" id="ac9"/><label for="ac9">9</label>
</li>
</ul>
</td>
</tr>
<tr>
<td class="ss-dlt-title">首位号码的奇偶值：</td>
<td>
<ul class="list"><li>
<input name="bjo" type="radio" value="1" id="bjo1" /><label for="bjo1">奇数</label>
<input name="bjo" type="radio" value="2" id="bjo2" /><label for="bjo2">偶数</label>
<input name="bjo" type="radio" value="0" id="bjo3" /><label for="bjo3">不限</label>
<span class="hui">(即开奖号码中的最小号码)</span></li></ul>
</td>
</tr>
<tr>
<td class="ss-dlt-title">末位号码的奇偶值：</td>
<td>
<ul class="list"><li>
<input name="ejo" type="radio" value="1" id="ejo1" /><label for="ejo1">奇数</label>
<input name="ejo" type="radio" value="2" id="ejo2" /><label for="ejo2">偶数</label>
<input name="ejo" type="radio" value="0" id="ejo3" /><label for="ejo3">不限</label>
<span class="hui">(即开奖号码中的最大号码)</span></li></ul>
</td>
</tr>
<tr>
<td class="ss-dlt-title">和值：</td>
<td>
<ul class="list"><li>
<input type="text" name="bhz" id="bhz" maxlength="3" class='term-input2' value="21"/> 至 
<input type="text" name="ehz" id="ehz"  maxlength="3" class="term-input2" value="195"/>
<span class="hui"></span></li></ul>
</td>
</tr>
<tr>
<td class="ss-dlt-title">奇偶比：</td>
<td>
<ul class="list"><li>
<input name="job" type="checkbox" value="0:5" id="job1" /><label for="job1">0:5</label>
<input name="job" type="checkbox" value="1:4" id="job2" /><label for="job2">1:4</label>
<input name="job" type="checkbox" value="2:3" id="job3" /><label for="job3">2:3</label>

<input name="job" type="checkbox" value="3:2" id="job4" /><label for="job4">3:2</label>
<input name="job" type="checkbox" value="4:1" id="job5" /><label for="job5">4:1</label>
<input name="job" type="checkbox" value="5:0" id="job6" /><label for="job6">5:0</label></li></ul>
</td>
</tr>
<tr>
<td class="ss-dlt-title">大小比：</td>
<td>
<ul class="list"><li>
<input name="dxb" type="checkbox" value="0:5" id="dxb1" /><label for="dxb1">0:5</label>

<input name="dxb" type="checkbox" value="1:4" id="dxb2" /><label for="dxb2">1:4</label>
<input name="dxb" type="checkbox" value="2:3" id="dxb3" /><label for="dxb3">2:3</label>
<input name="dxb" type="checkbox" value="3:2" id="dxb4" /><label for="dxb4">3:2</label>
<input name="dxb" type="checkbox" value="4:1" id="dxb5" /><label for="dxb5">4:1</label>
<input name="dxb" type="checkbox" value="5:0" id="dxb6" /><label for="dxb6">5:0</label><span class="hui">(约定17以上为大)</span></li></ul>

</td>
</tr> 
<tr>
<td class="ss-dlt-title">质合比：</td>
<td><ul class="list"><li>
<input name="zhb" type="checkbox" value="0:5" id="zhb1" /><label for="zhb1">0:5</label>
<input name="zhb" type="checkbox" value="1:4" id="zhb2" /><label for="zhb2">1:4</label>
<input name="zhb" type="checkbox" value="2:3" id="zhb3" /><label for="zhb3">2:3</label>
<input name="zhb" type="checkbox" value="3:2" id="zhb4" /><label for="zhb4">3:2</label>
<input name="zhb" type="checkbox" value="4:1" id="zhb5" /><label for="zhb5">4:1</label>

<input name="zhb" type="checkbox" value="5:0" id="zhb6" /><label for="zhb6">5:0</label></li></ul>
</td></tr>
<tr><td class="ss-dlt-title">

连号组数：</td><td><ul class="list"><li>
<input name="lh" type="checkbox" value="0" id="lh0"/><label for="lh0">无连号</label>
<input name="lh" type="checkbox" value="1" id="lh1"/><label for="lh1">1连号</label>
<input name="lh" type="checkbox" value="2" id="lh2"/><label for="lh2">2连号</label>

<input name="lh" type="checkbox" value="3" id="lh3"/><label for="lh3">3连号</label>
<input name="lh" type="checkbox" value="4" id="lh4"/><label for="lh4">4连号</label>
</li></ul>
</td></tr>
<tr><td class="ss-dlt-title">
尾数不相同的号码：</td><td><ul class="list"><li>
<input name="ws" type="checkbox" value="2" id="ws2" /><label for="ws2">2</label>
<input name="ws" type="checkbox" value="3" id="ws3" /><label for="ws3">3</label>
<input name="ws" type="checkbox" value="4" id="ws4" /><label for="ws4">4</label>
<input name="ws" type="checkbox" value="5" id="ws5" /><label for="ws5">5</label></li></ul>
</td></tr></tbody></table>

<table class="ss-dlt-little-box"><tbody>
<tr><td colspan="2" class="bold color-blue"><b>3、请选择后区缩水条件</b></td></tr>
<tr><td class="ss-dlt-title">首位号码的奇偶值：</td>
<td>
<ul class="list"><li>
<input name="hbjo" type="radio" value="1" id=h"hbjo4" /><label for="hbjo4">奇数</label>
<input name="hbjo" type="radio" value="2" id="hbjo5" /><label for="hbjo5">偶数</label>
<input name="hbjo" type="radio" value="0" id="hbjo6" /><label for="hbjo6">不限</label>
</li></ul>
</td>
</tr>

<tr><td class="ss-dlt-title">末位号码的奇偶值：</td>
<td><ul class="list"><li>
<input name="hejo" type="radio" value="1" id="hejo4" /><label for="hejo4">奇数</label>

<input name="hejo" type="radio" value="2" id="hejo5" /><label for="hejo5">偶数</label>
<input name="hejo" type="radio" value="0" id="hejo6" /><label for="hejo6">不限</label>
</li></ul>            <tr><td class="ss-dlt-title">和值：</td>
<td><ul class="list"><li>
<input type="text" name="hbhz" id="hbhz" value="3" maxlength="3" style="width:60px;" class="term-input2" />至
<input type="text" name="hehz" id="hehz" value="23" maxlength="3" style="width:60px;" class="term-input2" />
<span class="hui"></span> </li>
</li></ul>
<tr><td class="ss-dlt-title">奇偶比：</td>
<td><ul class="list"><li>
<input name="hjob" type="checkbox" value="0:2" id="hjob1" /><label for="hjob1">0:2</label>
<input name="hjob" type="checkbox" value="1:1" id="hjob2" /><label for="hjob2">1:1</label>
<input name="hjob" type="checkbox" value="2:0" id="hjob3" /><label for="hjob3">2:0</label>
</li></ul>            <tr><td class="ss-dlt-title">大小比：</td>
<td><ul class="list"><li>
<input name="hdxb" type="checkbox" value="0:2" id="hdxb1" /><label for="hdxb1">0:2</label>

<input name="hdxb" type="checkbox" value="1:1" id="hdxb2" /><label for="hdxb2">1:1</label>
<input name="hdxb" type="checkbox" value="2:0" id="hdxb3" /><label for="hdxb3">2:0</label>
</li></ul>            <tr><td class="ss-dlt-title">质合比：</td>
<td><ul class="list"><li>
<input name="hzhb" type="checkbox" value="0:2" id="hzhb1" /><label for="hzhb1">0:2</label>
<input name="hzhb" type="checkbox" value="1:1" id="hzhb2" /><label for="hzhb2">1:1</label>

<input name="hzhb" type="checkbox" value="2:0" id="hzhb3" /><label for="hzhb3">2:0</label>
</li></ul>            <tr><td class="ss-dlt-title">连号组数：</td>
<td><ul class="list"><li>
<input name="hlh" type="checkbox" value="0" id="hlh0"/><label for="hlh0">无连号</label>
<input name="hlh" type="checkbox" value="1" id="hlh1"/><label for="hlh1">1连号</label>
</li></ul></td></tr></tbody></table></table>
<div class="tools-but-h" style="width:748px;">
<input type="button" name="start" class="tools-buttop2" id="fltBtnId"/>
</div>

<div class="clear"></div>
<div class="cloose_touzhu">
     <div class="wcloose_top" style="display:none;">
            <div class="fs_bor" style="bottom: 223px;left:338px;"></div><div class="fs_sj" style="bottom: 228px;left:340px;"></div>
        <div class="wcloose_top_l fl">您选择了<span class="tw_red" id="redBallNumId">0</span>个<span class="tw_red">红球</span>，<span class="tw_blue" id="blueBallNumId">0</span>个<span class="tw_blue">蓝球</span>，共<b id="betNumId">0</b> 注，共 ￥ <b id="betMoneyId">0</b> 元</div>
        <div class="wcloose_top_r fr"><a href="javascript:void 0" class="w_tianjiabtn" id="addToBetListBtnId"></a><a href="javascript:void 0" class="w_qingkbtn" id="clearAllSelBtnId">清空全部</a></div>
        <div class="clear"></div>
      </div>
  
  	  <jsp:include page="./left.jsp"></jsp:include>
        
</div>
</div>
<!--大乐透 end-->
<jsp:include page="./right.jsp"></jsp:include>
</div> 
<div class="clear"></div> 
</div>
<jsp:include page="./surepage.jsp"></jsp:include>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>