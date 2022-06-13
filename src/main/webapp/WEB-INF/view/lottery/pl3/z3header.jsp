<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="tzym-pls">
<span>
<input type="radio" name="typesel" <c:if test="${pl3SubPlayName == 'ds' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=z3ds'" checked="">单式</span>
<span>
<input type="radio" name="typesel" <c:if test="${pl3SubPlayName == 'fs' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=z3fs'">复式</span>
<span>
<input type="radio" name="typesel" <c:if test="${pl3SubPlayName == 'dt' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=z3dt'">胆拖</span>
<span>
<input type="radio" name="typesel" <c:if test="${pl3SubPlayName == 'hz' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=z3hz'">和值</span>
<span>
<input type="radio" name="typesel" <c:if test="${p == 'z3dssc' }">checked</c:if> onclick="location.href='/lottery/index.jhtml?licenseId=${licenseId}&p=z3dssc'">单式上传</span>
</div>