<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="qyta">
	<div class="qytab">
	<a href="/lottery/index.jhtml?licenseId=${licenseId }&p=q1pt" <c:if test="${freqSubPlayName == 'pt' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'pt' }">class="qybut3"</c:if>>普通投注</a>
	</div>
    <div class="qytac"></div>
</div>