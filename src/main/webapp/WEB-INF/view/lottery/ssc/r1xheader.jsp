﻿<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="qyta">
	<div class="qytab"><a href="/lottery/index.jhtml?licenseId=103&p=r1x" <c:if test="${freqSubPlayName == 'x' }">class="qybut4"</c:if><c:if test="${freqSubPlayName != 'x' }">class="qybut3"</c:if>>任选一</a></div>
    <div class="qytac"><a href="#">选号攻略</a> ｜ <a href="#">号码走势</a> ｜ <a href="#">遗漏走势</a> ｜ <a href="#">奖金对照</a> ｜ <a href="#">玩法介绍</a></div>
</div>