<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="cloose_touzhu">
<div class="wcloose_top">
            <div class="fs_bor" style="bottom: 223px;left:338px;"></div><div class="fs_sj" style="bottom: 228px;left:340px;"></div>
        <div class="wcloose_top_l fl">您选择了<span class="tw_red" id="betNumId">0</span>注，共 ￥ <span class="tw_red" id="betMoneyId">0</span> 元</div>
        <div class="wcloose_top_r fr"><a id="addToBetListBtnId" style="cursor:pointer;" class="w_tianjiabtn"></a><a id="clearAllSelBtnId" style="cursor:pointer;" class="w_qingkbtn">清空全部</a></div>
        <div class="clear"></div>
      </div>
  <div class="cloose_t cloose_t_wn">
          <div class="wcloose_cont">
        <div class="wcloose_contl cloose_touzhu_cont fl">
              <ul id="betListAreaId"></ul>
            </div>
        <div class="wcloose_contr fr">
              <input type="text" class="wcloose_text" id="radomSelDsId" value="1">
              <a id="radomSelDsBtnId" style="cursor:pointer;" class="w_jixuan">机选</a><a style="cursor:pointer;" id="clearBetListBtnId" class="w_shanchu">删除全部</a></div>
        <div class="clear"></div>
      </div>
        </div>
        <div class="qr_h">
    <div class="wcloose_bottom wcloose_bottom_wn">
              <li class="t_red">
            <input type="checkbox" class="wcloose_checkbox">
            追加投注</li>
              <li><p>倍投：</p>
            <div class="wcloose_toub">
            <a id="subMBtnId" style="cursor: pointer;" class="w_jiaf">-</a>
                  <input type="text" value="1" id="multipleId">
             <a style="cursor: pointer;" id="addMBtnId">+</a>
             </div>
            <p>倍</p></li>
              <li>注数：<span class="tw_red" id="totalBetNumId">0</span>注</li>
              <li>金额：<span class="tw_red" id="totalBetMoneyId">0</span>元</li>
               <li><div class="tijiao_rr fr"> <a href="javascript:void 0" id="lotteryFormBtnId" class="quer">确认提交</a></div></li>
              <div class="clear"></div>
            </div>
            </div>
        </div>