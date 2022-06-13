<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="pageName" value="走势图-体彩双色球走势图" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/chart/openflash.js?p=3"></script>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="zou_pic">
 <div class="zou_pic_nav">
        <h3 class="fl">双色球</h3>
        <ul class="fl">
						<li><a href="/chart/ssq_index.jhtml">开奖分布图</a></li>     
						<li><a href="/chart/ssq_jou.jhtml">奇偶分析图</a></li>        
						<li><a href="/chart/ssq_ys.jhtml">余数走势图</a></li>        
						<li><a href="/chart/ssq_hq.jhtml">红球走势图</a></li>       
						<li class="hover"><a href="/chart/ssq_lq.jhtml">蓝球走势图</a></li>  
        </ul>        
        <div class="clear"></div>
        <div id="flashcontent" class="zou_text" style="padding:3px;PADDING:0px;overflow-y:hidden;OVERFLOW:auto;text-align:center">
        </div>       
  </div>             
</div>               
<div class="clear" style="height:10px"></div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"> 
	OpenFlash('166','lqfb');
</script>
</html>
