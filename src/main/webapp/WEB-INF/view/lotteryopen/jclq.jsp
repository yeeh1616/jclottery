<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="彩票开奖-竞彩篮球开奖" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link rel="stylesheet" type="text/css" href="/newhome/css/global.css" />
<link rel="stylesheet" type="text/css" href="/newhome/css/fblottery.css" />
<script>
	function doChange(){
		$("#form1").submit();
	}
</script>
</head>
<body>
<div class="jc-warp">	
	<!--head strat-->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script type="text/javascript" src="http://101.200.213.247:9380/global/open/10/${currDate}.js"></script>
	<script type="text/javascript" src="/js/lotteryopen/jclq.js"></script>
    <!--head end-->
	
    <!--fb-warp start-->
	<div class="fb-warp">
    	<div class="fb-title">
    		<form id="form1" name="form1" method="post" action="/lotteryopen/jclq.jhtml">
        	<div class="event-query">
            	<span class="fb-tit">赛事回查</span>
                <select class="fb-sel" name="currDate" id="currDate" onchange="doChange();">
                	<c:forEach var="obj" items="${beforeWeek}">
                	 <option value="${obj[1]}" <c:if test="${obj[1] eq currDate}">selected</c:if>>${obj[0]}</option>
                	</c:forEach>
                </select>
            </div>
         </form>
        	<h3><em></em><span>竞彩篮球开奖</span></h3>
        </div>
        <table width="0" border="0" cellspacing="0" cellpadding="0" class="fb-tab01" id="contentDetail_">
          <tr>
            <th><div class="c0">编号</div></th>
            <th><div class="c1">赛事</div></th>
            <th><div class="c2">比赛时间</div></th>
            <th><div class="c3">客队</div></th>
            <th><div class="c4">让分</div></th>
            <th><div class="c5">主队</div></th>
            <th><div class="c6">终场比分</div></th>
            <th>
            	<div class="c7">
                	<p>胜负</p>
                </div>
            </th>
            <th>
            	<div class="c8">
                	<p>让分胜负</p>
                </div>
            </th>
            <th>
            	<div style="width:57px">
                	<p>胜分差</p>
                </div>
            </th>
            <th>
            	<div style="width:177px">
                	<p>大小分</p>
                </div>
            </th>
          </tr>
          <tr><td colspan="20" style="height:0px; line-height:0px; font-size:0px; overflow:hidden; border:none;">&nbsp;</td></tr>
          <tr><td colspan="20">
          	 开奖数据仅供参考，一切以官方发布数据为准。<a href="http://info.sporttery.cn/basketball/match_result.php" target="blank"><u>查看官方开奖数据</u></a>
          	 	</td>
          </tr>
        </table>
    </div>
    <!--fb-warp end-->
    
    <!--foot strat-->
   <jsp:include page="../include/footer.jsp"></jsp:include>
    <!--foot end-->
</div>  
</body>
</html>