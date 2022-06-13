<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="qyta">
	<div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=q3zx" <c:if test="${freqSubPlayName == 'zx' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'zx' }">class="qybut3"</c:if>>前三直选</a></div>
    <div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=q3fs" <c:if test="${freqSubPlayName == 'fs' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'fs' }">class="qybut3"</c:if>>复式投注</a></div>
    <div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=q3dt" <c:if test="${freqSubPlayName == 'dt' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'dt' }">class="qybut3"</c:if>>胆拖投注</a></div>
    <div class="qytac"><a href="/lottery/index.jhtml?licenseId=102&p=hmzs">号码走势</a> ｜ <a href="/lottery/index.jhtml?licenseId=102&p=ylsj">遗漏走势</a> ｜ <a href="/playerintro/xysc.jhtml">玩法介绍</a></div>
</div>