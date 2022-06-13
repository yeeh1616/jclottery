<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<c:set var="pageName" value="${licenseName}" scope="page"></c:set>
<%@include file="../../../include/titlePage.jsp" %>
<link href="/css/singleupload.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../../../include/cytxlevel2header.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/dlt/dssc.js"></script>
<script type="text/javascript" src="/js/merger/Merger.js" ></script>
<script type="text/javascript" src="/js/lottery/dlt/formBuy.js"></script>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
<input type="hidden" id="dsPlayId" value="1"/>
<div class="common_w" id="betPanalId">  
	<div class="jz_top">
				<div class="jz_tz fl">
					<div class="halfball-logo"></div>
				</div>
				<jsp:include page="../header.jsp" />
				<div class="small_fb"></div>
			</div>
	<div class="sais_t"> </div>
    <div class="sais_c">
         <div class="w_ggfs">
         <jsp:include page="./header.jsp"></jsp:include>
				<div class="w_ggfs_c"><span class="w_peim">1</span>选择文件</div> 
				<div class="w_ggfsc_fx">
				<div class="sc_btn">
				 <span id="fileuplodid" style="display: none;" width="121" height="51"></span>
						            <span id="fileQueue" ></span>
				<span>注：上述格式符必须与您将要上传的文本中的格式符一致。</span></div>   
				<div class="ckgs"><a href="/playerintro/jinqiucai.jhtml" target="_blank">查看上传格式</a></div>
				</div>
				           <div class="w_ggfs_c"><span class="w_peim">2</span>确认提交</div> 
				            <div class="w_ggfsc_fxc">
				            <div class="jzsj">该方案截止时间：<span>${fn:substring(game.stopTime,0,16)}</span></div>
				            	<p>我要购买倍<span class="tjjs"><a href="javascript:void 0" id="subMBtnId">-</a>
				            	<input type="text" class="w_text" value="1" id="multipleId"/>
				            	<a href="javascript:void 0" id="addMBtnId">+</a></span>您选择了：共<b id="totalBetNumId">0</b>注、金额<span class="w_red" id="totalBetMoneyId">0</span>元</p>
				                <div class="qrfk w_anniu">
				                <c:choose>
	                				<c:when test="${game.state=='2'}">
					                <a href="javascript:void 0" class="quer" id="lotteryFormBtnId">确认提交</a>
					                </c:when>
				                	<c:otherwise>
					                    <p style="color:#cf1313">当前期中心未开售</p>
					                </c:otherwise>
								</c:choose>
				                </div>
				            </div> 
         </div> 
        </div>

<div class="clear"></div> 
</div>

<jsp:include page="../../lotteryForm.jsp"></jsp:include>
<script type="text/javascript" src="/js/common/tips.js"></script>
<jsp:include page="../../dlt/surepage.jsp"></jsp:include>
<jsp:include page="../../../include/footer.jsp"></jsp:include>
</body>
</html>
