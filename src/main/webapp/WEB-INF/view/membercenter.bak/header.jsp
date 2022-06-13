<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<table width="100%" height="100%" border="0" bgcolor="#becfd7" cellspacing="1" cellpadding="0">
	<tr>
		<td style="padding:0 5px 0 5px;text-align:left;height:30px;background:#FFFFFF">
			现金余额(C)：<font style="font-weight:bold;color:#de5555;">
				<fmt:formatNumber value="${mones[0]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>&nbsp;元</font>
		</td>
		<td style="padding:0 5px 0 5px;text-align:left;height:30px;background:#FFFFFF">
			红包余额(R)：<font style="font-weight:bold;color:#de5555;">
				<fmt:formatNumber value="${mones[1]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>&nbsp;元</font>
		</td>
		<td style="padding:0 5px 0 5px;text-align:left;height:30px;background:#FFFFFF">
			冻结余额(F)：<font style="font-weight:bold;color:#de5555;">
				<fmt:formatNumber value="${mones[2]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>&nbsp;元</font>
		</td>
		<td colspan="2" style="padding:0 5px 0 5px;text-align:left;height:30px;width:180px;background:#FFFFFF">
			账户余额： = C + R <font style="font-weight:bold;color:#de5555;">
				(<fmt:formatNumber value="${mones[0] + mones[1]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>&nbsp;元)</font>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="padding:0 5px 0 5px;text-align:left;height:30px;background:#FFFFFF">
			可投注余额：= C + R - F <font style="font-weight:bold;color:#de5555;">
				(<fmt:formatNumber value="${mones[0] + mones[1] - mones[2]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>&nbsp;元)</font>
		</td>
		<td colspan="2" style="padding:0 5px 0 5px;text-align:left;height:30px;background:#FFFFFF">
			可取款余额：= C - F <font style="font-weight:bold;color:#de5555;">
				(<fmt:formatNumber value="${mones[0] - mones[2]}" pattern="#,###.##" minFractionDigits="2"></fmt:formatNumber>&nbsp;元)</font>
		</td>
	</tr>
</table>
       