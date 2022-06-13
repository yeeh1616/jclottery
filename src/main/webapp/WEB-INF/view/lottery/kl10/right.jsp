<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
$(document).ready(function(){
	$('.qycodlBut').click(function(){
		var d = $('.stv').css('display');
		if(d=='none'){
			$('.stv').show();
			
		}else{
			$('.stv').hide();
		}
	});
});
</script>
<div class="qycodr">
        
        <div class="qycodrb">
        	<p class="qycodrbp1"><span class="qycodrbp1a">最新开奖</span>
        	<c:if test="${licenseId == 103}">
        	<a href="http://tubiao.cp020.com/cjw11x5_qs/view/11x5_jiben-5-11x5-11.html" target="_blank">图表走势>></a>
        	</c:if>
        	</p>
            <div class="qycodrba">
            	<ul class="qycodrbaul">
                	<li class="qycodrba2">期号</li>
                	<li class="qycodrba2">奖号</li>
                </ul>
                <div id="kjListAreaId"></div>
            	
            </div>
        </div>
        <!--右2最新开奖结束-->
        
    </div>