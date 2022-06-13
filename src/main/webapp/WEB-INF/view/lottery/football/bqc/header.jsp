<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="w_ggfs_t">
	<input type="radio" name="singleRadio" onclick="location.href='/lottery/index.jhtml?licenseId=7'" <c:if test="${p == 'bqc' }">checked</c:if>/>普通投注
	<input type="radio" name="singleRadio" onclick="location.href='/lottery/index.jhtml?licenseId=7&p=dssc'" <c:if test="${p == 'dssc' }">checked</c:if>/>单式上传
	<input type="radio" name="singleRadio" onclick="location.href='/lottery/index.jhtml?licenseId=7&p=xfhc'" <c:if test="${p == 'xfhc' }">checked</c:if>/>先发起后上传
	<input type="radio" name="singleRadio" onclick="location.href='/lottery/index.jhtml?licenseId=7&p=filter'" <c:if test="${p == 'filter' }">checked</c:if>/>缩水投注
	<input type="radio" name="singleRadio" onclick="location.href='/merger/index.jhtml?licenseId=${licenseId}'"/>参与合买
</div>