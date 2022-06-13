<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="五星直选-江西时时彩" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>

<script>
</script>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<jsp:include page="./header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>
<script type="text/javascript" src="/js/lottery/ssc/5xzhx.js"></script>
<jsp:include page="./5xheader.jsp"></jsp:include>

<div class="qycod">
	<div class="qycodl">
    	<div class="qycodla">
        	<div class="qycodlaTit" style="display:none">
            	<span class="sscAg">玩法提示：从五位各选1个或多个号码，选号与开奖号码按位一致即中奖<em class="red">11.6</em>万元</span>
                <span class="qycodlaTitp1"><a href="#">选号实例</a></span>
                <div class="sscAf">
                	<p>选号：3 4 5</p>
                	<p>开奖：1 2 3 4 5</p>
                	<p>中奖：1160元</p>
                </div>
            </div>
            <div class="qycodlBut"><span class="sscAe">----------------　从万、千、百、十、个位各选1个或多个号码　----------------</span><span class="sscAea">----------------　[ 帮助区 ]　---------------</span></div>
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