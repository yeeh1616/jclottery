<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.suny.com.cn/customer.tld" prefix="customertags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<c:set var="pageName" value="竞彩足球单式上传" scope="page"></c:set>
	<%@include file="../../../include/titlePage.jsp" %>
    
    </head>
    <!-----------------------------注意这个body里面有样式---------------------------->
    <body class="">
    
	<jsp:include page="../../../include/cytxlevel2header.jsp"></jsp:include>
<!--header end-->
<div id="betPanalId">
      <div class="common_w">
      <jsp:include page="../guessbasketballheader.jsp"></jsp:include>
    	<div class="sais_t"> </div>
    	<div class="sais_c">
         <div class="w_ggfs">
         	<div class="w_ggfs_t">请先选择玩法:<input type="radio" name="playTypeName" value="1" checked/>胜负<input type="radio" name="playTypeName" value="2"/>让分胜负<input type="radio" name="playTypeName" value="3"/>胜分差<input type="radio" name="playTypeName" value="4"/>大小分</div> 
            <div class="w_ggfs_c n_btop"><span class="w_peim ">1</span>选择场次<span class="w_changci" id="maxSelectId">最多可选择8场</span></div>
            <div id="dsSchDivId"></div>
             
            <div class="w_ggfs_c"><span class="w_peim">2</span>选择过关方式</div> 
            <div class="w_ggfsc_fxc" id="dsPassTId">
           		 <ul>
            		<li><input type="radio" name="dsPtName" value="2"/><a href="javascript:void 0">2串1</a></li>
                    <li><input type="radio" name="dsPtName" value="3"/><a href="javascript:void 0">3串1</a></li>
                    <li><input type="radio" name="dsPtName" value="4"/><a href="javascript:void 0">4串1</a></li>
                    <li><input type="radio" name="dsPtName" value="5"/><a href="javascript:void 0">5串1</a></li>
                    <li><input type="radio" name="dsPtName" value="6"/><a href="javascript:void 0">6串1</a></li>
                    <li><input type="radio" name="dsPtName" value="7"/><a href="javascript:void 0">7串1</a></li>
                    <li><input type="radio" name="dsPtName" value="8"/><a href="javascript:void 0">8串1</a></li>
                	<div class="clear"></div>
            	</ul>
            </div>

            <div class="w_ggfs_c"><span class="w_peim">3</span>选择文件</div> 
<div class="w_ggfsc_fx">
<div class="sc_btn">
 <span id="fileuplodid" style="display: none;" width="121" height="51"></span>
		            <span id="fileQueue" ></span>
<span>注：上述格式符必须与您将要上传的文本中的格式符一致。</span></div>  
<div class="ckgs">
<c:if test="${licenseId == 9}">
<a href="/playerintro/ds.jhtml" target="_blank">查看上传格式</a>
</c:if>
<c:if test="${licenseId == 10}">
<a href="/playerintro/lqds.jhtml" target="_blank">查看上传格式</a>
</c:if>
</div>
</div>
           <div class="w_ggfs_c"><span class="w_peim">4</span>确认提交</div> 
            <div class="w_ggfsc_fxc">
            <div class="jzsj">该方案截止时间：<span id="schemaStopTimeId">---------- --:--:--</span></div>
            	<p>我要购买倍<span class="tjjs"><a href="javascript:void 0" id="subMBtnId">-</a><input type="text" class="w_text" value="1" id="multipleId"/><a href="javascript:void 0" id="addMBtnId">+</a></span>您选择了：<b id="schudleSelId">0</b>场比赛、共<b id="betNumId">0</b>注、金额<span class="w_red" id="betMoneyId">0</span>元</p>
                <div class="qrfk w_anniu"><a href="javascript:void 0" id="lotteryFormBtnId">确认提交</a></div>
            </div> 
         </div> 
        </div>
    	
   
  </div>
</div>
<jsp:include page="../surepage.jsp"></jsp:include>
<jsp:include page="../../../include/footer.jsp"></jsp:include>
<jsp:include page="../../lotteryForm.jsp"></jsp:include>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>

</body>
</html>
