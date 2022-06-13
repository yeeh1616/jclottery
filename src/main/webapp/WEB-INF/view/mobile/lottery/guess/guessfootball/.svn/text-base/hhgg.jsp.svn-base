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
<div data-role="page" id="hun"> 

  <div data-role="header" data-position="fixed" data-tap-toggle="false" data-id="top">
    <h1 ><a href="javascript:;" class="btn-slide active">${domain.storeName }-${playName }</a></h1>
    <jsp:include page="./header.jsp"></jsp:include>
    <div class="head-left"><a href="/" class="qx-icon" data-transition="slide" data-direction="reverse" >返回</a> </div>
    <div class="head-right"><a href="#" class="sm-icon" data-transition="slide" data-direction="reverse" ></a></div>
  </div>
  <!-- /header --> 
  <!--content -->
  <div data-role="content">
    <ul class="buy_jing hunh">
      
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
  
</div>

<!--------弹出---------------------------------------------------->
<div data-role="page" id="hun_zhan">
    <div id="ThisNo" style="display:none;"></div>
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <h1 id="h_race">
            比赛名
        </h1>
        <div class="head-left"><a href="#hun" class="qx-icon" data-transition="slide" data-direction="reverse">取消</a> </div>
    </div>
    <div data-role="content" id="wrapper_no_bottom" style="padding-bottom:10px;">
        <!--让球-->
        <div class="cans" id="div_rq"></div>
        <table id="table_sf" width="95%" border="0" cellpadding="0" cellspacing="0" class="table_0">
            <tbody>
                <tr>
                    <td width="10%" rowspan="1" style="background-color: #5bbdfb; color:#FFF; line-height:normal">非<br />让<br />球</td>
                    <td width="30%" bet="1-3" name="betN"><a href="#" t="主胜" v="3" class="ui-link">胜<span id="span_6_0">3.95</span></a></td>
                    <td width="30%" bet="1-1" name="betN"><a href="#" t="主平" v="1" class="ui-link">平<span id="span_6_1">4.10</span></a></td>
                    <td width="30%" bet="1-0" name="betN"><a href="#" t="主负" v="0" class="ui-link">负<span id="span_6_2">7.65</span></a></td>
                </tr>
            </tbody>
        </table>

        <div class="cans"></div>
        <table id="table_rq" width="95%" border="0" cellpadding="0" cellspacing="0" class="table_0">
            <tbody>
                <tr>
                    <td width="10%" rowspan="1" style="background-color: #7fda33; color: #FFF; line-height: normal">让<br />球</td>
                    <td width="30%" bet="2-3" name="betN"><a href="#" t="让球胜" v="3" class="ui-link">胜<span id="span_1_0">3.95</span></a></td>
                    <td width="30%" bet="2-1" name="betN"><a href="#" t="让球平" v="1" class="ui-link">平<span id="span_1_1">4.10</span></a></td>
                    <td width="30%" bet="2-0" name="betN"><a href="#" t="让球负" v="0" class="ui-link">负<span id="span_1_2">7.65</span></a></td>
                </tr>
            </tbody>
        </table>



        <!--比分------------------------------------------------------------>
        <div class="cans" id="div_bf">比分</div>
        <table id="table_bf" width="95%" border="0" cellpadding="0" cellspacing="0" class="table_0 bif">
            <tr>
                <td width="10%" rowspan="7" style="background: #5bbdfb; color: #FFF; line-height: normal">比<br />分</td>
                <td width="18%" bet="5-1" name="betN"><a href="#" ><div class="bf">1:0</div><div class="t_bottom" id="span_3_1">4.10</div></a></td>
                <td width="18%" bet="5-2" name="betN"><a href="#" ><div class="bf">2:0</div><div class="t_bottom" id="span_3_2">7.65</div></a></td>
                <td width="18%" bet="5-3" name="betN"><a href="#" ><div class="bf">2:1</div><div class="t_bottom" id="span_3_3">3.95</div></a></td>
                <td width="18%" bet="5-4" name="betN"><a href="#" ><div class="bf">3:0</div><div class="t_bottom" id="span_3_4">4.10</div></a></td>
                <td width="18%" bet="5-5" name="betN"><a href="#" ><div class="bf">3:1</div><div class="t_bottom" id="span_3_5">7.65</div></a></td>
            </tr>
            <tr>
                <td width="18%" bet="5-6" name="betN"><a href="#" ><div class="bf">3:2</div><div class="t_bottom" id="span_3_6">4.10</div></a></td>
                <td width="18%" bet="5-7" name="betN"><a href="#" ><div class="bf">4:0</div><div class="t_bottom" id="span_3_7">7.65</div></a></td>
                <td width="18%" bet="5-8" name="betN"><a href="#" ><div class="bf">4:1</div><div class="t_bottom" id="span_3_8">3.95</div></a></td>
                <td width="18%" bet="5-9" name="betN"><a href="#" ><div class="bf">4:2</div><div class="t_bottom" id="span_3_9">4.10</div></a></td>
                <td width="18%" bet="5-10" name="betN"><a href="#" ><div class="bf">5:0</div><div class="t_bottom" id="span_3_10">7.65</div></a></td>
            </tr>
            <tr>
                <td width="18%" bet="5-11" name="betN"><a href="#" ><div class="bf">5:1</div><div class="t_bottom" id="span_3_11">4.10</div></a></td>
                <td width="18%" bet="5-12" name="betN"><a href="#" ><div class="bf">5:2</div><div class="t_bottom" id="span_3_12">7.65</div></a></td>
                <td colspan="3" bet="5-0" name="betN"><a href="#" ><div class="bf">胜其他</div><div class="t_bottom" id="span_3_0">29.00</div></a></td>
            </tr>
            <tr>
                <td width="18%" bet="5-14" name="betN"><a href="#" ><div class="bf">0:0</div><div class="t_bottom" id="span_3_14">4.10</div></a></td>
                <td width="18%" bet="5-15" name="betN"><a href="#" ><div class="bf">1:1</div><div class="t_bottom" id="span_3_15">7.65</div></a></td>
                <td width="18%" bet="5-16" name="betN"><a href="#" ><div class="bf">2:2</div><div class="t_bottom" id="span_3_16">3.95</div></a></td>
                <td width="18%" bet="5-17" name="betN"><a href="#" ><div class="bf">3:3</div><div class="t_bottom" id="span_3_17">4.10</div></a></td>
                <td width="25%" bet="5-13" name="betN"><a href="#" ><div class="bf">平其他</div><div class="t_bottom" id="span_3_13">7.65</div></a></td>
            </tr>
            <tr>
                <td width="18%" bet="5-19" name="betN"><a href="#" ><div class="bf">0:1</div><div class="t_bottom" id="span_3_19">4.10</div></a></td>
                <td width="18%" bet="5-20" name="betN"><a href="#" ><div class="bf">0:2</div><div class="t_bottom" id="span_3_20">7.65</div></a></td>
                <td width="18%" bet="5-21" name="betN"><a href="#" ><div class="bf">1:2</div><div class="t_bottom" id="span_3_21">3.95</div></a></td>
                <td width="18%" bet="5-22" name="betN"><a href="#" ><div class="bf">0:3</div><div class="t_bottom" id="span_3_22">4.10</div></a></td>
                <td width="18%" bet="5-23" name="betN"><a href="#" ><div class="bf">1:3</div><div class="t_bottom" id="span_3_23">7.65</div></a></td>
            </tr>
            <tr>
                <td width="18%" bet="5-24" name="betN"><a href="#" ><div class="bf">2:3</div><div class="t_bottom" id="span_3_24">4.10</div></a></td>
                <td width="18%" bet="5-25" name="betN"><a href="#" ><div class="bf">0:4</div><div class="t_bottom" id="span_3_25">7.65</div></a></td>
                <td width="18%" bet="5-26" name="betN"><a href="#" ><div class="bf">1:4</div><div class="t_bottom" id="span_3_26">3.95</div></a></td>
                <td width="18%" bet="5-27" name="betN"><a href="#" ><div class="bf">2:4</div><div class="t_bottom" id="span_3_27">4.10</div></a></td>
                <td width="18%" bet="5-28" name="betN"><a href="#" ><div class="bf">0:5</div><div class="t_bottom" id="span_3_28">7.65</div></a></td>
            </tr>
            <tr>
                <td width="18%" bet="5-29" name="betN"><a href="#" ><div class="bf">1:5</div><div class="t_bottom" id="span_3_29">4.10</div></a></td>
                <td width="18%" bet="5-30" name="betN"><a href="#" ><div class="bf">2:5</div><div class="t_bottom" id="span_3_30">7.65</div></a></td>
                <td colspan="3" bet="5-18" name="betN"><a href="#" ><div class="bf">负其他</div><div class="t_bottom" id="span_3_18">600</div></a></td>
            </tr>
        </table>
        <!--总进球------------------------------------------------------------>
        <div class="cans" id="div_zong">总进球</div>
        <table id="table_zj" width="95%" border="0" cellpadding="0" cellspacing="0" class="table_0 bif">
            <tbody>
                <tr>
                    <td width="10%" rowspan="2" style="background-color: #7fda33; color: #FFF; line-height: normal">总<br />进<br />球</td>
                    <td width="22.5%" bet="3-0" name="betN"><a href="#" class="ui-link"><div class="zjq">0球</div><div id="span_2_0" class="t_bottom">4.10</div></a></td>
                    <td width="22.5%" bet="3-1" name="betN"><a href="#" class="ui-link"><div class="zjq">1球</div><div id="span_2_1" class="t_bottom">4.10</div></a></td>
                    <td width="22.5%" bet="3-2" name="betN"><a href="#" class="ui-link"><div class="zjq">2球</div><div id="span_2_2" class="t_bottom">4.10</div></a></td>
                    <td width="22.5%" bet="3-3" name="betN"><a href="#" class="ui-link"><div class="zjq">3球</div><div id="span_2_3" class="t_bottom">4.10</div></a></td>
                </tr>
                <tr>
                    <td width="22.5%" bet="3-4" name="betN"><a href="#" class="ui-link"><div class="zjq">4球</div><div class="t_bottom" id="span_2_4">4.10</div></a></td>
                    <td width="22.5%" bet="3-5" name="betN"><a href="#" class="ui-link"><div class="zjq">5球</div><div class="t_bottom" id="span_2_5">4.10</div></a></td>
                    <td width="22.5%" bet="3-6" name="betN"><a href="#" class="ui-link"><div class="zjq">6球</div><div class="t_bottom" id="span_2_6">4.10</div></a></td>
                    <td width="22.5%" bet="3-7" name="betN"><a href="#" class="ui-link"><div class="zjq">7+球</div><div class="t_bottom" id="span_2_7">4.10</div></a></td>
                </tr>
            </tbody>
        </table>
        <!--半全场------------------------------------------------------------>
        <div class="cans" id="div_bq">半全场</div>
        <table id="table_bq" width="95%" border="0" cellpadding="0" cellspacing="0" class="table_0 bif">
            <tbody>
                <tr>
                    <td width="10%" rowspan="3" style="background-color: #5bbdfb; color: #FFF; line-height: normal">半<br />全<br />场</td>
                    <td width="30%" bet="4-33" name="betN"><a href="#" class="ui-link"><div class="bqc">胜胜</div><div id="span_4_0" class="t_bottom">4.10</div></a></td>
                    <td width="30%" bet="4-31" name="betN"><a href="#" class="ui-link"><div class="bqc">胜平</div><div id="span_4_1" class="t_bottom">4.10</div></a></td>
                    <td width="30%" bet="4-30" name="betN"><a href="#" class="ui-link"><div class="bqc">胜负</div><div id="span_4_2" class="t_bottom">4.10</div></a></td>
                </tr>
                <tr>
                    <td bet="4-13" name="betN"><a href="#" class="ui-link"><div class="bqc">平胜</div><div id="span_4_3" class="t_bottom">4.10</div></a></td>
                    <td bet="4-11" name="betN"><a href="#" class="ui-link"><div class="bqc">平平</div><div id="span_4_4" class="t_bottom">4.10</div></a></td>
                    <td bet="4-10" name="betN"><a href="#" class="ui-link"><div class="bqc">平负</div><div id="span_4_5" class="t_bottom">4.10</div></a></td>
                </tr>
                <tr>

                    <td bet="4-03" name="betN"><a href="#" class="ui-link"><div class="bqc">负胜</div><div id="span_4_6" class="t_bottom">4.10</div></a></td>
                    <td bet="4-01" name="betN"><a href="#" class="ui-link"><div class="bqc">负平</div><div id="span_4_7" class="t_bottom">4.10</div></a></td>
                    <td bet="4-00" name="betN"><a href="#" class="ui-link"><div class="bqc">负负</div><div id="span_4_8" class="t_bottom">4.10</div></a></td>
                </tr>
            </tbody>
        </table>
        <div class="f_hun_button">
            <div data-theme="b"> <a href="#hun" data-role="button" data-inline="true" data-rel="back" data-theme="a">取消</a> <a href="#" data-role="button" data-rel="back" data-inline="true" data-theme="c">确定</a> </div>
            <div class="clear"></div><!---->
        </div>
    </div>
</div>
<!--------弹出 end----->
</body>
</html>