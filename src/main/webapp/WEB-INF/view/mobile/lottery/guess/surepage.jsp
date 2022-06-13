<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 确认界面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>确认</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/mobile/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" type="text/css" href="/mobile/css/base.css">

<script src="/mobile/js/jquery.js"></script>
<script src="/mobile/js/jquery.mobile-1.4.5.min.js"></script>

</head>
<body>

<!-- Index Page -->
<div data-role="page" id="out_tickets">
<input type="hidden" id="betCodeId" value="${betCode }"/>
<!-- common JS -->
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/CombAlgorithm.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>

<!-- DATA JS -->
<script type="text/javascript" src="/data/lottery/guess/guessFootballSchedules.js?time=new Date().getTime()"></script>

<!-- GuessFootball JS -->
<script type="text/javascript" src="/js/lottery/guess/GuessFootballSchedule.js"></script>
<script type="text/javascript" src="/js/lottery/guess/Guess.js"></script>

<script type="text/javascript" src="/mobile/js/lottery/guess/sure.js"></script>
  <div data-role="header" data-position="fixed" data-tap-toggle="false" data-id="top">
    <h1>${domain.storeName }-确认订单</h1>
    <div class="head-left"><a href="/" class="qx-icon" data-transition="slide" data-direction="reverse" data-rel="popup">购彩大厅</a> </div>
  </div>
  
  <div data-role="popup" id="dialogAgain" data-overlay-theme="a" data-position-to="window">
      <div data-role="header" data-theme="a">
          <!--  <h1>是否返回?</h1> -->
      </div>
      <div data-role="content" data-theme="d">
          
          <p id="p_return">返回将清空所有已选的号码</p>
          <div style="text-align:center">
            <a href="#" data-ajax="false" data-role="button" data-inline="true" data-theme="c">是</a>
          <a href="#" data-role="button" data-inline="true" data-rel="back" data-theme="a">否</a>
        </div>
      </div>
  </div>
  
  <div data-role="popup" id="dialog" data-overlay-theme="a" data-position-to="window">
      <div data-role="header" data-theme="a">
          <!--  <h1>是否付款?</h1> -->
      </div>
      <div data-role="content" data-theme="d">
          
          <p id="p_pay"></p>
          <div style="text-align:center">
            <a href="#" data-role="button" data-inline="true" data-theme="c">是</a>
          <a href="#" data-role="button" data-inline="true" data-rel="back" data-theme="a">否</a>
      </div>
      </div>
  </div>
  
  <!-- /header --> 
  <!--content -->
  <div data-role="content" id="wrapper_out_ticket">
    <div class=" cp_button">
      <ul>
        <li style="margin-left: 3.2em;"><a href="#" class="zx" >+添加赛事</a></li>
        <li><a href="#" class="qk" >清空列表</a></li>
        <div class="clear"></div>
      </ul>
    </div>
    <div class="cp_bg">
      <div class="cpj"><img src="/mobile/images/chup_top.png" ></div>
      <div class="cp_list">
        <ul id="ul_list">
          
        </ul>
      </div>
      <div class="cpd"><img src="/mobile/images/chup_bottom.png" >
      <div id="betTypeWaring" style="text-align:center; color:#998e71; font-size:14px;">请选择投注方式！</div>
      </div>
    </div>
  </div>
  <!-- /content --> 
  <!--底部按钮-->
  <div class="bottom_bei">
  <div class="chuans"><a id="betTypeBtn" data-transition="slideup" data-rel="popup" href="#chuanh" > 请选择投注方式<span class="red">（必选）</span></a> </div>
    <div class="bottom_bei_right">
      <div class="lx_buy">投</div>
      <input type="text" placeholder="" value="1" id="inputValue">
      <div class="fl">倍</div>
      <div class="clear"></div>
    </div>
  </div>
  <div data-role="footer" class="footer" data-position="fixed" data-tap-toggle="false" data-id="buy_foot">
    <div class="ze" id="divze"><span>共0元</span><br/>
      0注1倍 </div>
    <div class="qd-button"><a id="fukuanPop" data-transition="slide" data-rel="popup" href="#dialog">付款</a></div>
    <div class="clear"></div>
  </div>
  <!-- 底部按钮 end --> 
    <!-- 弹出-->
<div data-role="popup" id="chuanh" data-position-to="windows" data-overlay-theme="b" class="tc-common">
    <div class="tan_top">投注方式</div>
    <div class="chuan_list">
            <div id="U_2_1" class="chuans" ><a href="#">2串1</a> </div>
              <div id="U_3_1" class="chuans"><a href="#">3串1</a> </div>
                <div id="U_4_1" class="chuans"><a href="#">4串1</a> </div>
                  <div id="U_5_1" class="chuans"><a href="#">5串1</a> </div>
                    <div id="U_6_1" class="chuans"><a href="#">6串1</a> </div>
                     <div id="U_7_1" class="chuans"><a href="#">7串1</a> </div>
                    <div id="U_8_1" class="chuans"><a href="#">8串1</a> </div>
                    <div class="clear"></div>
    </div>
      <div style=" text-align:left; color:#2167bc;margin-left: 13px;">更多玩法</div>
     <div class="chuan_list">
            <div id="D_3_3" class="chuans"><a href="#">3串3</a> </div>
              <div id="D_3_4" class="chuans"><a href="#">3串4</a> </div>
                <div id="D_4_4" class="chuans"><a href="#">4串4</a> </div>
                  <div id="D_4_5" class="chuans"><a href="#">4串5</a> </div>
                <div id="D_4_6" class="chuans"><a href="#">4串6</a> </div>
                <div id="D_4_11" class="chuans"><a href="#">4串11</a> </div>
                <div id="D_5_5" class="chuans"><a href="#">5串5</a> </div>
                <div id="D_5_6" class="chuans"><a href="#">5串6</a> </div>
                <div id="D_5_10" class="chuans"><a href="#">5串10</a> </div>
                <div id="D_5_16" class="chuans"><a href="#">5串16</a> </div>
                <div id="D_5_20" class="chuans"><a href="#">5串20</a> </div>
                <div id="D_5_26" class="chuans"><a href="#">5串26</a> </div>
                <div id="D_6_6" class="chuans"><a href="#">6串6</a> </div>
                  <div id="D_6_7" class="chuans"><a href="#">6串7</a> </div>
                    <div id="D_6_15" class="chuans"><a href="#">6串15</a> </div>
                                <div id="D_6_20" class="chuans"><a href="#">6串20</a> </div>
                <div id="D_6_22" class="chuans"><a href="#">6串22</a> </div>
                  <div id="D_6_35" class="chuans"><a href="#">6串35</a> </div>
                    <div id="D_6_42" class="chuans"><a href="#">6串42</a> </div>
                                <div id="D_6_50" class="chuans"><a data-rel="popup" href="#">6串50</a> </div>                     
                                <div id="D_6_57" class="chuans"><a href="#">6串57</a> </div>
                      <div id="D_7_7" class="chuans"><a href="#">7串7</a> </div>
                       <div id="D_7_8" class="chuans"><a href="#">7串8</a> </div>
                        <div id="D_7_21" class="chuans"><a href="#">7串21</a> </div>
                         <div id="D_7_35" class="chuans"><a href="#">7串35</a> </div>
                          <div id="D_7_120" class="chuans"><a href="#">7串120</a> </div>
                           <div id="D_8_8" class="chuans"><a href="#">8串8</a> </div>
                            <div id="D_8_9" class="chuans gray"><a href="#">8串9</a> </div>
                             <div id="D_8_28" class="chuans"><a href="#">8串28</a> </div>
                              <div id="D_8_56" class="chuans"><a href="#">8串56</a> </div>
                               <div id="D_8_70" class="chuans"><a href="#">8串70</a> </div>
                                <div id="D_8_247" class="chuans"><a href="#">8串247</a> </div>
                  <div class="clear"></div>
    </div>      
    <div class="clear"></div>
        <div data-theme="b"> <a href="#" data-role="button" data-inline="true" data-rel="back" data-theme="a">取消</a> <a href="#" data-role="button" data-inline="true"  data-theme="c" data-rel="back">确定</a> </div>
  </div>
    <!-- 弹出 end -->
</div>



</body>
</html>