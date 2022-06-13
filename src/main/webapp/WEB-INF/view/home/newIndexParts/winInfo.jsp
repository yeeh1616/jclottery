<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--中奖信息-->
    <div class="tab zxzj">
      <div class="tabList">
        <ul>
          <li class="cur">中奖排行</li>
          <li>最新中奖</li>
        </ul>
      </div>
      <div class="tabCon paih_h">
        <div class="cur paih">
          <dl class="zxzj_cont" id="index_right_zjph"></dl>
        </div>
        <div class="paih" >
          <dl class="zxzj_cont" id='index_right_zxzj'></dl>
        </div>
      </div>
    </div>
    <!--中奖信息 end-->