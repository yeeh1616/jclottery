<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page import="com.jingc.busi.common.table.Store,java.util.*"%>
<title>${domain.storeName}-${parentName}-${pageScope.pageName}-体育彩票-足彩-竞彩-足球彩票-体彩</title>
<meta name="Keywords" content="${domain.storeName},${parentName},足彩,体彩,彩票,体育彩票,足球彩票,竞彩,实体店安全购彩">
<meta name="Description" content="${domain.storeName},${parentName},平台提供足彩、体彩、足球彩票、体育彩票、竞彩、福彩等国家合法彩票的购买合买服务。是一家服务于实体店彩民的安全的彩票合买代购交易平台。">
<%
 String inviCode = null;
 boolean beHLwUnion = false;//葫芦娃联盟店
 String[] arr = new String[]{"4123","4233"};
 if ( null != session.getAttribute("domain") ) {
 		Integer storeId = ((Store)session.getAttribute("domain")).getStoreId();
  	inviCode = Integer.toOctalString(storeId);
  	
  	beHLwUnion = Arrays.asList(arr).contains(storeId + "");
 }
%>
<c:set var="beHLwUnion" value="<%=beHLwUnion%>" scope="request"></c:set>
<script>
	var inviCode = "<%=inviCode%>";
</script>

<c:if test="${!beHLwUnion}">
<link rel="shortcut icon" href="${pageConfigs.web_ico_path}" />
</c:if>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>

<script src="/cytxhome/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/cytxhome/js/inputmail.js"></script>
<script src="/cytxhome/js/custom.js"></script>

<script type="text/javascript" src="/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="/js/common/base.js"></script>
