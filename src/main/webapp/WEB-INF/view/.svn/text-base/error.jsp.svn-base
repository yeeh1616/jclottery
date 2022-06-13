<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="错误页面" scope="page"></c:set>
<%@include file="./include/titlePage.jsp" %>
<link href="/css/haohao.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="./include/header.jsp"></jsp:include>
<div class="cuo_pic">
     <p class="fl e"><img src="/images/dadada.png" /></p>
     <div class="fl cuo_text">          
           <div class="te_1" style="margin-top:40px;">
                  <span>温馨提示:</span>
                  <!-- 打样公告 -->
                  <c:if test="${errorMsg == '[店铺已打烊,不能购彩]'}">
                  <script type="text/javascript" src="http://wangdian.cp020.com/www/data/store/STOREID_${domain.storeId }/INFO_CATEGORY/CLOSING_BULLETIN/closeing_bulletin.js"></script>
                  <script type="text/javascript">
					    document.write(CLOSING_BULLETIN[0].content);
					</script>
                  </c:if>
                  <c:if test="${errorMsg != '[店铺已打烊,不能购彩]'}">
                  ${errorMsg }
                  </c:if>
           </div>

     </div>
</div>
<div class="clear"></div>
<jsp:include page="./include/footer.jsp"></jsp:include>
</body>
</html>