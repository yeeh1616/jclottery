﻿<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="tzym-pls">
<span>
<input type="radio" name="typesel" <c:if test="${p == 'r6pt' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=r6pt'">普通投注</span>
<span>
<input type="radio" name="typesel" <c:if test="${p == 'r6dt' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=r6dt'">胆拖投注</span>

</div>