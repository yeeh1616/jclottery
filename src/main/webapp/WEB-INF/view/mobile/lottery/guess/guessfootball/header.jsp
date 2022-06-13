<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="hidden" id="ndateValId" value="${ndate }"/>
<input type="hidden" id="aheadTimeId" value="${aheadtime }"/>
<script type="text/javascript" src="/js/lottery/common/Hashtable.js"></script>
<script type="text/javascript" src="/js/lottery/common/DateUtils.js"></script>
<script type="text/javascript" src="/mobile/js/lottery/guess/guessfootball/common.js"></script>
<script type="text/javascript" src="/mobile/js/lottery/guess/guessfootball/${p }.js"></script>
  <script type="text/javascript"> 
$(document).ready(function(){ 
$(".btn-slide").click(function(){ 
$("#panel").slideToggle("fast"); 
$(this).toggleClass("active"); return true; 
}); 

}); 
</script>
 <div style="display: none;" class="three_line" id="panel">
   <ul id="ul_title">
     <li id="li_title_1" <c:if test="${p == 'spf' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=spf">胜负平</a></li>
     <li id="li_title_2" <c:if test="${p == 'rqspf' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=rqspf">让球胜平负</a></li>
     <li id="li_title_3" <c:if test="${p == 'bf' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=bf">比分</a></li>
     <div class=" clear"></div>
     <li id="li_title_4" <c:if test="${p == 'zjq' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=zjq">总进球</a></li>
     <li id="li_title_5" <c:if test="${p == 'bqc' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=bqc">半全场</a></li>
     <li id="li_title_6" <c:if test="${p == 'hhgg' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=hhgg">混合过关</a></li>
     <div class=" clear"></div>
     <li  id="li_title_7" <c:if test="${p == '2x1' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=2x1">2选1</a></li>
     <li  id="li_title_8" <c:if test="${p == 'hhdg' }">class="xz"</c:if>><a data-transition="none" rel="external" href="/lottery/index.jhtml?licenseId=9&p=hhdg">单关投注</a></li>
     <div class=" clear"></div>
   </ul>
 </div>
    