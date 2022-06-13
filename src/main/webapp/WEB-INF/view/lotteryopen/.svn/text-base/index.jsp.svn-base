<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="彩票开奖" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="common_w" id="haltAreaId">
  <div class="hall-top" style="margin-bottom: 10px;">
    <div class="sitepath fl"> 您当前的位置：<a href="/">彩票首页</a> > 彩票开奖 </div>
  </div><div class="open_plant">
  <h1>数字彩票开奖</h1>
  <table class="open_table">
  <tr>  
  <th width="7%">彩种</th>
  <th width="7%">期次</th>
  <th width="12%">开奖时间</th>
  <th width="31%">开奖号码</th>
  <th width="9%">滚存</th>
  <th width="8%">开奖日期</th>
  <th width="8%">开奖详情</th>
  <th width="8%">走势</th>
  <th width="10%">投注</th>
  </tr>
  <tbody id="mathLotteryAreaId">
  </tbody>
  </table>
  </div>
 <!------------------------------------------------------------------------------------------------------> 
 <div class="open_plant">
  <h1>竞技彩票开奖</h1>
  <table class="open_table">
  
  <tr>
  <th width="7%">彩种</th>
  <th width="7%">期次</th>
  <th width="12%">开奖时间</th>
  <th width="34%">开奖号码</th>
  <th width="10%">滚存</th>
  <th width="10%">开奖日期</th>
  <th width="10%">开奖详情</th>
  <th width="10%">投注</th>
  </tr>
  <tbody id="guessLotteryAreaId">
  </tbody>
   <!--竞彩足球 -->
  <tr>
  <td><a href="#">竞彩足球</a></td>
  <td>--</td>
  <td>--</td>
    <td class="jzulan">
  </td>
  <td class="red"></td>
  <td></td>
  <td><a href="/lotteryopen/jc.jhtml" target="_blank">开奖详情</a></td>
  <td><a class="tz_button" href="/lottery/index.jhtml?licenseId=9&p=spf" target="_blank">投注</a></td>
  </tr>
  <!--竞彩足球 end-->
  <!--竞彩篮球 -->
  <tr>
  <td><a href="#">竞彩篮球</a></td>
  <td>--</td>
  <td>--</td>
    <td class="jzulan">
  </td>
  <td class="red"></td>
  <td></td>
  <td><a href="/lotteryopen/jclq.jhtml" target="_blank">开奖详情</a></td>
  <td><a class="tz_button" href="/lottery/index.jhtml?licenseId=10&p=sf" target="_blank">投注</a></td>
  </tr>
  <!--竞彩篮球 end-->
  <!-- 胜负过关 zh -->
  <tr>
  <td><a href="#">胜负过关</a></td>
  <td>--</td>
  <td>--</td>
  <td class="jzulan"></td>
  <td class="red"></td>
  <td></td>
  <td><a href="/lotteryopen/sfgg.jhtml" target="_blank">开奖详情</a></td>
  <td><a class="tz_button" href="/lottery/index.jhtml?licenseId=21" target="_blank">投注</a></td>
  </tr>
  <!-- 胜负过关 end zh -->
  <!-- 北京单场 zh -->
  <tr>
  <td><a href="#">北京单场</a></td>
  <td>--</td>
  <td>--</td>
  <td class="jzulan"></td>
  <td class="red"></td>
  <td></td>
  <td><a href="/lotteryopen/bjdc.jhtml" target="_blank">开奖详情</a></td>
  <td><a class="tz_button" href="/lottery/index.jhtml?licenseId=22" target="_blank">投注</a></td>
  </tr>
  <!-- 胜负过关 end zh -->

  </table>
  </div>
</div>
<!------------------------------------------------------------------------------------------------------>
<script type="text/javascript" src="http://${domain.collectionHost}/global/open/index.js"></script>
<script type="text/javascript">
  $(function(){
	  var mathlottery = '';
	  var gstr = '';
	  for ( var i = 0; i < homeOpen.length; i++ ) {
		  	var opens = homeOpen[i].result.split("-");
			if ( homeOpen[i].license == '1' || homeOpen[i].license == '2' || homeOpen[i].license == '3' || homeOpen[i].license == '12' || homeOpen[i].license == '24' ) {
				mathlottery += '<tr>'+
					  '<td><a href="/lotteryopen/ps.jhtml">'+homeOpen[i].game_name+'</a></td>'+
					  '<td>'+homeOpen[i].event+'期</td>'+
					  '<td>'+homeOpen[i].openPayTime+'</td>'+
					  '<td class="ret">';
				  for ( var j = 0; j < opens.length; j++ ) {
						mathlottery += '<i>'+opens[j]+'</i>';
				  }
				  var ourl = "ps.jhtml", ourl2 = "ps_index.jhtml";
				  if ( homeOpen[i].license == '2' ) {
					  ourl = "pw.jhtml";
					  ourl2 = "pw_index.jhtml";
				  } else if ( homeOpen[i].license == '3' ) {
					  ourl = "qx.jhtml";
					  ourl2 = "qx_index.jhtml";
				  } else if ( homeOpen[i].license == '12' ) {
					  ourl = "f3d.jhtml";
					  ourl2 = "f3d_index.jhtml";
				  }
				  mathlottery	+=  '</td>'+
					  '<td class="red">'+homeOpen[i].nextPool+' 元</td>'+
					  '<td>'+homeOpen[i].dateDesc+'</td>'+
					  '<td><a target="_blank" href="/lotteryopen/'+ourl+'">开奖详情</a></td>'+
					  '<td><a target="_blank" href="/chart/'+ourl2+'">走势图表</a></td>'+
					  '<td><a target="_blank" href="/lottery/index.jhtml?licenseId='+homeOpen[i].license+'" class="tz_button">投注</a></td>'+
					  '</tr>';
			}
			if ( homeOpen[i].license == '4' ) {
				mathlottery += '<tr>'+
					  '<td><a href="/lotteryopen/ps.jhtml">'+homeOpen[i].game_name+'</a></td>'+
					  '<td>'+homeOpen[i].event+'期</td>'+
					  '<td>'+homeOpen[i].openPayTime+'</td>'+
					  '<td class="ret">';
				  for ( var j = 0; j < 5; j++ ) {
						mathlottery += '<i>'+opens[j]+'</i>';
				  }
				  for ( var j = 5; j < 7; j++ ) {
						mathlottery += '<i class="blue">'+opens[j]+'</i>';
				  }
				  mathlottery	+=  '</td>'+
					  '<td class="red">'+homeOpen[i].nextPool+' 元</td>'+
					  '<td>'+homeOpen[i].dateDesc+'</td>'+
					  '<td><a target="_blank" href="/lotteryopen/dlt.jhtml">开奖详情</a></td>'+
					  '<td><a target="_blank" href="/chart/dlt_index.jhtml">走势图表</a></td>'+
					  '<td><a target="_blank" href="/lottery/index.jhtml?licenseId='+homeOpen[i].license+'" class="tz_button">投注</a></td>'+
					  '</tr>';
			}
			if ( homeOpen[i].license == '11' ) {
				mathlottery += '<tr>'+
					  '<td><a href="/lotteryopen/ps.jhtml">'+homeOpen[i].game_name+'</a></td>'+
					  '<td>'+homeOpen[i].event+'期</td>'+
					  '<td>'+homeOpen[i].openPayTime+'</td>'+
					  '<td class="ret">';
				  for ( var j = 0; j < 6; j++ ) {
						mathlottery += '<i>'+opens[j]+'</i>';
				  }
				  for ( var j = 6; j < 7; j++ ) {
						mathlottery += '<i class="blue">'+opens[j]+'</i>';
				  }
				  mathlottery	+=  '</td>'+
					  '<td class="red">'+homeOpen[i].nextPool+' 元</td>'+
					  '<td>'+homeOpen[i].dateDesc+'</td>'+
					  '<td><a target="_blank" href="/lotteryopen/ssq.jhtml">开奖详情</a></td>'+
					  '<td><a target="_blank" href="/chart/ssq_index.jhtml">走势图表</a></td>'+
					  '<td><a target="_blank" href="/lottery/index.jhtml?licenseId='+homeOpen[i].license+'" class="tz_button">投注</a></td>'+
					  '</tr>';
			}
			if ( homeOpen[i].license == '13' ) {
				mathlottery += '<tr>'+
					  '<td><a href="/lotteryopen/ps.jhtml">'+homeOpen[i].game_name+'</a></td>'+
					  '<td>'+homeOpen[i].event+'期</td>'+
					  '<td>'+homeOpen[i].openPayTime+'</td>'+
					  '<td class="ret">';
				  for ( var j = 0; j < 7; j++ ) {
						mathlottery += '<i>'+opens[j]+'</i>';
				  }
				  for ( var j = 7; j < 8; j++ ) {
						mathlottery += '<i class="blue">'+opens[j]+'</i>';
				  }
				  mathlottery	+=  '</td>'+
					  '<td class="red">'+homeOpen[i].nextPool+' 元</td>'+
					  '<td>'+homeOpen[i].dateDesc+'</td>'+
					  '<td><a target="_blank" href="/lotteryopen/qlc.jhtml">开奖详情</a></td>'+
					  '<td><a target="_blank" href="/chart/qlc_index.jhtml">走势图表</a></td>'+
					  '<td><a target="_blank" href="/lottery/index.jhtml?licenseId='+homeOpen[i].license+'" class="tz_button">投注</a></td>'+
					  '</tr>';
			}
			if ( homeOpen[i].license == '20' ) {
				mathlottery += '<tr>'+
					  '<td><a href="/lotteryopen/ps.jhtml">'+homeOpen[i].game_name+'</a></td>'+
					  '<td>'+homeOpen[i].event+'期</td>'+
					  '<td>'+homeOpen[i].openPayTime+'</td>'+
					  '<td class="ret">';
				  for ( var j = 0; j < 6; j++ ) {
						mathlottery += '<i>'+opens[j]+'</i>';
				  }
				  for ( var j = 6; j < 7; j++ ) {
						mathlottery += '<i class="blue">'+opens[j]+'</i>';
				  }
				  mathlottery	+=  '</td>'+
					  '<td class="red">'+homeOpen[i].nextPool+' 元</td>'+
					  '<td>'+homeOpen[i].dateDesc+'</td>'+
					  '<td><a target="_blank" href="/lotteryopen/tc61.jhtml">开奖详情</a></td>'+
					  '<td><a target="_blank" href="/chart/qx_index.jhtml">走势图表</a></td>'+
					  '<td><a target="_blank" href="/lottery/index.jhtml?licenseId='+homeOpen[i].license+'" class="tz_button">投注</a></td>'+
					  '</tr>';
			}
			if ( homeOpen[i].license == '5' || homeOpen[i].license == '7' || homeOpen[i].license == '8'  ) {
				gstr += '<tr>'+
					  '<td><a href="/lotteryopen/ps.jhtml">'+homeOpen[i].game_name+'</a></td>'+
					  '<td>'+homeOpen[i].event+'期</td>'+
					  '<td>'+homeOpen[i].openPayTime+'</td>'+
					  '<td class="open_jc">';
				  for ( var j = 0; j < opens.length; j++ ) {
					  gstr += '<i>'+opens[j]+'</i>';
				  }
				  var ourl = "sfc.jhtml";
				  if ( homeOpen[i].license == '7' ) {
					  ourl = "bqc.jhtml";
				  } else if ( homeOpen[i].license == '8' ) {
					  ourl = "jqc.jhtml";
				  }
				  gstr	+=  '</td>'+
					  '<td class="red">'+homeOpen[i].nextPool+' 元</td>'+
					  '<td>不定期</td>'+
					  '<td><a target="_blank" href="/lotteryopen/'+ourl+'">开奖详情</a></td>'+
					  '<td><a target="_blank" href="/lottery/index.jhtml?licenseId='+homeOpen[i].license+'" class="tz_button">投注</a></td>'+
					  '</tr>';
			}
	  }
	  $(mathlottery).appendTo($("#mathLotteryAreaId"));
	  $(gstr).appendTo($("#guessLotteryAreaId"));
  });
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>