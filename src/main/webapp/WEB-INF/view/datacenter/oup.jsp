<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="足彩数据-欧洲赔率" scope="page"></c:set>
<%@include file="../include/titlePage.jsp" %>
<link rel="stylesheet" type="text/css" href="/newhome/css/global.css" />
<link rel="stylesheet" type="text/css" href="/newhome/css/fblottery.css" />
</head>
<body>
<div>	
	<!--head strat-->
	<jsp:include page="../include/header.jsp"></jsp:include>
    <!--head end-->
	
    <!--fb-warp start-->
	 <div class="common_w" style="z-index: 999;" id="dataDivId">
	 ${fileHtml }
    </div>
    <!--fb-warp end-->
    <input type="hidden" id="schudlesNo" value="${param.schudlesNo }"/>
    <!--foot strat-->
   <jsp:include page="../include/footer.jsp"></jsp:include>
    <!--foot end-->
</div>  

</body>
</html>