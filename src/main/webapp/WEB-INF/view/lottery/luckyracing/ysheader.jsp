<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="qyta">
	<div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=ysq1" <c:if test="${freqSubPlayName == 'q1' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'q1' }">class="qybut3"</c:if>>前一直选</a></div>
    <div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=ysq2" <c:if test="${freqSubPlayName == 'q2' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'q2' }">class="qybut3"</c:if>>前二直选</a></div>
    <div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=ysq2dt" <c:if test="${freqSubPlayName == 'q2dt' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'q2dt' }">class="qybut3"</c:if>>前二胆拖</a></div>
    <div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=ysq3" <c:if test="${freqSubPlayName == 'q3' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'q3' }">class="qybut3"</c:if>>前三直选</a></div>
    <div class="qytab"><a href="/lottery/index.jhtml?licenseId=102&p=ysq3dt" <c:if test="${freqSubPlayName == 'q3dt' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'q3dt' }">class="qybut3"</c:if>>前三胆拖</a></div>
    
    <div class="qytac"><a href="/lottery/index.jhtml?licenseId=102&p=hmzs">号码走势</a> ｜ <a href="/lottery/index.jhtml?licenseId=102&p=ylsj">遗漏走势</a> ｜ <a href="/playerintro/xysc.jhtml">玩法介绍</a></div>
</div>