<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="前三组选-11运夺金" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>

<script>
</script>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<jsp:include page="./header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/omit/omit.js"></script>
<script type="text/javascript" src="/js/lottery/11x5/x3q3zxpt.js"></script>
<jsp:include page="./x3header.jsp"></jsp:include>

<div class="qycod">
	<div class="qycodl">
    	<div class="qycodla">
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