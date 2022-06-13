<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>${domain.storeName }-${playName }</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/mobile/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" type="text/css" href="/mobile/css/base.css">
<script src="/mobile/js/jquery.js"></script>
<script src="/mobile/js/jquery.mobile-1.4.5.min.js"></script>

</head>
<body>
<div data-role="page" id="pai3_zu3_dan"> 

  <div data-role="header" data-position="fixed" data-tap-toggle="false" data-id="top">
    <h1 ><a href="javascript:;" class="btn-slide active">${domain.storeName }-${playName }</a></h1>
    <jsp:include page="./header.jsp"></jsp:include>
    <div class="head-left"><a href="/" class="qx-icon" data-transition="slide" data-direction="reverse" >返回</a> </div>
    <div class="head-right"><a href="#" class="sm-icon" data-transition="slide" data-direction="reverse" ></a></div>
  </div>
  <!-- /header --> 
  <!--content -->
  <div data-role="content" style=" padding:0;">
    <ul class="buy_jing">
      
    </ul>
  </div>
  <!-- /content --> 
  <!--底部按钮-->
  <div data-role="footer" class="footer" data-position="fixed" data-tap-toggle="false">
  	<div id="divze" class="ze">
	<span>已选中<b id="schNumId">0</b>场比赛</span>
	</div>
    <div class="qk-button"><a href="#">清空</a></div>
    <div class="qd-button"><a href="#">确定</a></div>
    <div class="clear"></div>
  </div>
  
  <!-- 弹出-->
  <div data-role="popup" id="sfc" data-position-to="window" data-overlay-theme="b" class="tc-common">
    <div class="tan_top"></div>
    <div style=" padding-bottom:10px;">
      <div class="cans">竞猜主队在上半场和全场比赛（不含加时赛和点球大战）的胜平负结果</div>
      <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table_0 half_t">
        <tr>
          <td width="33%" name="betN" bet="33"><a href="#"><div id="div_Content_0" >胜胜</div><div id="div_choose_0">3.95</div></a></td>
          <td width="33%" name="betN" bet="31"><a href="#"><div id="div_Content_1" >胜平</div><div id="div_choose_1">4.10</div></a></td>
          <td width="34%" name="betN" bet="30"><a href="#"><div id="div_Content_2" >胜负</div><div id="div_choose_2">7.65</div></a></td>
        </tr>                                                                                                               
        <tr>                                                                                                              
          <td width="33%" name="betN" bet="13"><a href="#"><div id="div_Content_3" >平胜</div><div id="div_choose_3">3.95</div></a></td>
          <td width="33%" name="betN" bet="11"><a href="#"><div id="div_Content_4" >平平</div><div id="div_choose_4">4.10</div></a></td>
          <td width="34%" name="betN" bet="10"><a href="#"><div id="div_Content_5" >平负</div><div id="div_choose_5">7.65</div></a></td>
        </tr>                                                                                                               
        <tr>                                                                                                               
          <td width="33%" name="betN" bet="03"><a href="#"><div id="div_Content_6" >负胜</div><div id="div_choose_6">3.95</div></a></td>
          <td width="33%" name="betN" bet="01"><a href="#"><div id="div_Content_7" >负平</div><div id="div_choose_7">4.10</div></a></td>
          <td width="34%" name="betN" bet="00"><a href="#"><div id="div_Content_8" >负负</div><div id="div_choose_8">7.65</div></a></td>
        </tr>
      </table>
    </div>
    <div class="clear"></div>
    <div data-theme="b"> <a href="#" data-role="button" data-inline="true" data-rel="back" data-theme="a">取消</a> <a href="#" data-role="button" data-inline="true" data-rel="back"  data-theme="c">确定</a> </div>
  </div>
  <span id="ThisNo" style="display:none;"></span>
  <!-- 弹出 end--> 
  <!--<div class="ui-loader ui-corner-all ui-body-a ui-loader-verbose ui-loader-textonly">
	<span class="ui-icon-loading"></span>
	<h1>最少选择2场比赛</h1>
  </div>-->
  <!-- 底部按钮 end --> 
</div>
</body>
</html>