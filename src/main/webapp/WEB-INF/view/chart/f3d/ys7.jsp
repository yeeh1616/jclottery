<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="pageName" value="走势图-体彩福彩3D走势图" scope="page"></c:set>
<%@include file="../../include/titlePage.jsp" %>
<link href="/css/layout_hao.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/chart/openflash.js?p=3"></script>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="zou_pic">
 <div class="zou_pic_nav">
        <h3 class="fl">福彩3D</h3>
        <ul class="fl">
						<li><a href="/chart/f3d_index.jhtml">开奖分布图</a></li>     
						<li><a href="/chart/f3d_kd.jhtml">跨度分析图</a></li>        
						<li><a href="/chart/f3d_zx.jhtml">组选分析图</a></li> 
						<li><a href="/chart/f3d_wx.jhtml">五行分布图</a></li> 
						<li><a href="/chart/f3d_dx.jhtml">大小分析图</a></li> 
						<li><a href="/chart/f3d_dzx.jhtml">大中小分析图</a></li> 
						<li><a href="/chart/f3d_jou.jhtml">奇偶分析图</a></li> 
						<li><a href="/chart/f3d_zot.jhtml">012路分析图</a></li> 
						<li><a href="/chart/f3d_wh.jhtml">位和分析图</a></li> 
						<li><a href="/chart/f3d_ys5.jhtml">余数5走势图</a></li> 
						<li class="hover"><a href="/chart/f3d_ys7.jhtml">余数7走势图</a></li> 
						<li><a href="/chart/f3d_hz.jhtml">和值分析图</a></li> 
						<li><a href="/chart/f3d_zh.jhtml">质合分析图</a></li> 
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
	OpenFlash('167','ys7fb');
</script>
</html>
