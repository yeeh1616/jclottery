<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>
<!-- 追号表单 -->
<form id="chasingBuyFormId" action="/chasing/chase.jhtml" method="post" target="_blank">
	<input type="hidden" id="licenseId" name="licenseId" value="${licenseId }"/>
	<input type="hidden" id="chsPlayerId" name="playType" value="${p }"/>
	<input type="hidden" name="singleFlag" value=""/>
	<input type="hidden" name="betCode" value=""/>
	<input type="hidden" name="betNum" value=""/>
	<input type="hidden" name="multiple" value=""/>
	<input type="hidden" name="betPrice" value=""/>
	<input type="hidden" name="chasingState" value="1"/>
	<input type="hidden" name="zjFlag" value="0"/>
	<input type="hidden" name="issueMult" value=""/>
	<input type="hidden" name="stopBonus" value=""/>
	<input type="hidden" name="winStop" value="0"/>
</form>
