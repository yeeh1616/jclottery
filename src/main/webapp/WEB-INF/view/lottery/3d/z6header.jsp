<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="zhi_pic_1">
        <ul>
             <li <c:if test="${pl3SubPlayName == 'pt' }">class="pu_1"</c:if> ><a href="/lottery/index.jhtml?licenseId=12&p=z6pt">普通投注</a></li>
                <li <c:if test="${pl3SubPlayName == 'dt' }">class="pu_1"</c:if>><a href="/lottery/index.jhtml?licenseId=12&p=z6dt">胆拖</a></li>
                <li <c:if test="${pl3SubPlayName == 'hz' }">class="pu_1"</c:if>><a href="/lottery/index.jhtml?licenseId=12&p=z6hz">和值</a></li>
                <!--<li <c:if test="${pl3SubPlayName == 'kd' }">class="pu_1"</c:if>><a href="/lottery/index.jhtml?licenseId=1&p=zxpt">跨度</a></li>
                <li <c:if test="${pl3SubPlayName == 'ds' }">class="pu_1"</c:if>><a href="/lottery/index.jhtml?licenseId=1&p=zxpt">单式上传</a></li>-->
           </ul>
            <!--<span class="fr">限号列表</span>-->
</div>