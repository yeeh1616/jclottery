<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="二星和值-江西时时彩" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>

<script>
</script>
<style type="text/css">
.qyconQsyHz{width:450px; float:left; margin-left:0px; _margin-left:5px; padding:0; list-style-type:none; display:block}
.qyconQsyHz li{position:relative; float:left; width:27px; overflow:hidden; margin-left:8px; _margin-left:4px}
.qyconQsyHz li p{text-align:center}
</style>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<jsp:include page="./header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/ssc/2xhz.js"></script>
<jsp:include page="./2xheader.jsp"></jsp:include>

<div class="qycod">
	<div class="qycodl">
    	<div class="qycodla">
        	<div class="qycodlaTit" style="display:none">
            	<span class="sscAg">玩法提示：择1个和值投注，所选和值与开奖号码后两位和值一致即中奖116元<em class="red">11.6</em>万元</span>
                <span class="qycodlaTitp1"><a href="#">选号实例</a></span>
                <div class="sscAf">
                	<p>选号：3 4 5</p>
                	<p>开奖：1 2 3 4 5</p>
                	<p>中奖：1160元</p>
                </div>
            </div>
            <div class="qycodlBut"><span class="sscAe">----------------至少选1个号码　----------------</span><span class="sscAea">----------------　[ 帮助区 ]　---------------</span></div>
            <div class="qycondlCon" id="betAreaId">
               
            </div>
        </div>
		<jsp:include page="../luckyracing/left.jsp"></jsp:include>        
    </div>
    <!--左侧结束-->
    <jsp:include page="./right.jsp"></jsp:include>
</div>

<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>