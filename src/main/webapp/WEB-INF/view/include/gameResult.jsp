<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<div class="side-lwinner">
<h3 class="c-title"><span>最新开奖</span></h3>	
  <div class="late-win-open">
  	 <c:if test="${fn:indexOf(resultMap.storeLicenses, '1,') > -1 }">
  	 <div class="award-list">
      	<p>
          	<span class="period">排列三<em>${resultMap['1'].issue}</em>期</span>
              <span class="date">${resultMap['1'].bonus_date}</span>
          </p>
          <div class="ball-num">
              <ul class="ball-list-small clearfix">
              	<c:forEach var="code" items="${resultMap['1'].code_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<c:forEach var="code" items="${resultMap['1'].code_list[0]}">
									         <li class="ball-red"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
									<c:when test="${status.index == 1}">
										<c:forEach var="code" items="${resultMap['1'].code_list[1]}">
									        <li class="ball-blue ml6"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>	
              </ul>
              <!--<p class="ball-buy"><a href="#" class="btn-red-small">购买</a></p>-->
          </div>
      </div>
     </c:if>
     
      <c:if test="${fn:indexOf(resultMap.storeLicenses, '2,') > -1 }"><!--排列五--> 
      <div class="award-list award-list-hover">
      	<p>
          	<span class="period">排列五<em>${resultMap['2'].issue}</em>期</span>
              <span class="date">${resultMap['2'].bonus_date}</span>
          </p>
          <div class="ball-num">
              <ul class="ball-list-small clearfix">
                 <c:forEach var="code" items="${resultMap['2'].code_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<c:forEach var="code" items="${resultMap['2'].code_list[0]}">
									       <li class="ball-red"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
									<c:when test="${status.index == 1}">
										<c:forEach var="code" items="${resultMap['2'].code_list[1]}">
									        <li class="ball-blue ml6"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>	
              </ul>
              <!--<p class="ball-buy"><a href="#" class="btn-red-small">购买</a></p>-->
          </div>
      </div>	
      </c:if>
      
      <c:if test="${fn:indexOf(resultMap.storeLicenses, '3,') > -1 }"><!--七星彩-->
      <div class="award-list">
      	<p>
          	<span class="period">七星彩<em>${resultMap['3'].issue}</em>期</span>
              <span class="date">${resultMap['3'].bonus_date}</span>
          </p>
          <div class="ball-num">
              <ul class="ball-list-small clearfix">
                  	<c:forEach var="code" items="${resultMap['3'].code_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<c:forEach var="code" items="${resultMap['3'].code_list[0]}">
									        <li class="ball-red"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
									<c:when test="${status.index == 1}">
										<c:forEach var="code" items="${resultMap['3'].code_list[1]}">
									         <li class="ball-blue ml6"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>	
              </ul>
              <p class="ball-buy"><a href="#" class="btn-red-small">购买</a></p>
          </div>
      </div>
      </c:if>
	    
	    <c:if test="${fn:indexOf(resultMap.storeLicenses, '4,') > -1 }"><!--大乐透-->
      <div class="award-list">
      	<p>
          	<span class="period">大乐透<em>${resultMap['4'].issue}</em>期</span>
              <span class="date">${resultMap['4'].bonus_date}</span>
          </p>
          <div class="ball-num">
              <ul class="ball-list-small clearfix">
                  <c:forEach var="code" items="${resultMap['4'].code_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<c:forEach var="code" items="${resultMap['4'].code_list[0]}">
									        <li class="ball-red"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
									<c:when test="${status.index == 1}">
										<c:forEach var="code" items="${resultMap['4'].code_list[1]}">
									        <li class="ball-blue"><span><c:out value="${code}"/></span></li>
									    </c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>	
              </ul>
              <p class="ball-buy"><a href="#" class="btn-red-small">购买</a></p>
          </div>
      </div>
      </c:if>
	    
	    <c:if test="${fn:indexOf(resultMap.storeLicenses, '5,') > -1 }"><!--胜负彩-->
      <div class="award-list award-list-last">
      	<p>
          	<span class="period">胜负彩<em>${resultMap['5'].issue}</em>期</span>
              <span class="date">${resultMap['5'].bonus_date}</span>
          </p>
          <div class="ball-num">
              <ul class="ball-list-numlong clearfix">
              	<c:forEach var="code" items="${resultMap['5'].code_list}" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<c:forEach var="code" items="${resultMap['5'].code_list[0]}">
									        <li><c:out value="${code}"/></li>
									    </c:forEach>
									</c:when>
									<c:when test="${status.index == 1}">
										<c:forEach var="code" items="${resultMap['5'].code_list[1]}">
									        <li><c:out value="${code}"/></li>
									    </c:forEach>
									</c:when>
								</c:choose>
							</c:forEach>	
              </ul>
          </div>
      </div>	
      </c:if>
  </div>
</div>