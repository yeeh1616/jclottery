<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css" rel="stylesheet" href="/css/style1.css"/>
<script type="text/javascript" src="/js/lottery/upload/swfobject.js?time=new Date().getTime()"></script>
<script type="text/javascript" src="/js/lottery/upload/jquery.uploadify.v2.1.4.js?time=new Date().getTime()"></script>
<input id="radomBetCodeId" type="hidden" value="${betCode }"/>
<div id="bet_buy_btn"></div>
<div id="bet_buy">
	<div class="content">
		<div class="touZhuQueRen">
			<div class="header2" style="height: 58px">
				<div class="tongji">
					<span id="shedan"><h1>
							已选
							<b id="schudleSelId">0</b>场
						</h1>
						<a style="cursor:pointer">［设胆］</a>
					</span>
					<div class="showtongji">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td width="45" height="34" align="center" bgcolor="#f0efef">
									序号
								</td>
								<td width="116" align="center" bgcolor="#f0efef">
									<c:choose>
										<c:when test="${licenseId == 10}">
											客队  VS  主队
										</c:when>
										<c:otherwise>
											主队  VS  客队
										</c:otherwise>
									</c:choose>
								</td>
								<td width="100" align="center" bgcolor="#f0efef">
									投注内容
								</td>
								<td width="40" align="center" bgcolor="#f0efef">
									设胆
								</td>
								<td width="40" align="center" bgcolor="#f0efef">
									全清
								</td>
							</tr>
							<tbody id="betSelAreaId"></tbody>
							
							<tr>
								<td height="35" colspan="5" bgcolor="#FFFFFF">
									<table width="95%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td>
												方案为
												<b style="color: #000" id="playNameBId">${playName }</b> 玩法
											</td>
											<td align="right">
												<div class="close">
													隐藏
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>

					</div>



				</div>
				<div class="tzfs" id="passAreaId">


					<div style="float: left; widht: 270px">
						过关方式
						<input name="" type="checkbox" value="2c1" />
						<a>2串1</a>
						<input name="" type="checkbox" value="3c1" />
						<a>3串1</a>
						<input name="" type="checkbox" value="4c1" />
						<a>4串1</a>
						<input name="" type="checkbox" value="5c1" />
						<a>5串1</a>
						<input name="" type="checkbox" value="6c1" />
						<a>6串1</a>
						
					</div>
					<div id="showMethod">
						<div class="ck">
							更多过关
							<img src="/images/more.gif" width="12" height="12" />
						</div>

						<div class="sdmethod" id="sdmethod">
							<table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									<td height="30" bgcolor="#f0efef">
										<table width="100%" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td>
													请选择过关方式
												</td>
												<td align="right" class="close2">
													隐藏
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td height="30" bgcolor="#FFFFFF">
										<input name="" type="checkbox" value="7c1" />
										<a>7串1</a>
										<input name="" type="checkbox" value="8c1" />
										<a>8串1</a>
									</td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF">
										<input type="checkbox" value="3c3" />
										<a>3串3</a>
										<input type="checkbox" value="3c4" />
										<a>3串4</a><br>
										<input type="checkbox" value="4c4" />
										<a>4串4</a>
										<input type="checkbox" value="4c5" />
										<a>4串5</a>
										<input type="checkbox" value="4c6" />
										<a>4串6</a>
										<input type="checkbox" value="4c11" />
										<a>4串11</a>
										<input type="checkbox" value="5c5" />
										<a>5串5</a>
										<input type="checkbox" value="5c6" />
										<a>5串6</a><br>
										<input type="checkbox" value="5c10" />
										<a>5串10</a>
										<input type="checkbox" value="5c16" />
										<a>5串16</a>
										<input type="checkbox" value="5c20" />
										<a>5串20</a>
										<input type="checkbox" value="5c26" />
										<a>5串26</a><br>
										<input type="checkbox" value="6c6" />
										<a>6串6</a>
										<input type="checkbox" value="6c7" />
										<a>6串7</a>
										<input type="checkbox" value="6c15" />
										<a>6串15</a>
										<input type="checkbox" value="6c20" />
										<a>6串20</a>
										<input type="checkbox" value="6c22" />
										<a>6串22</a>
										<input type="checkbox" value="6c35" />
										<a>6串35</a>
										<input type="checkbox" value="6c42" />
										<a>6串42</a>
										<input type="checkbox" value="6c50" />
										<a>6串50</a>
										<input type="checkbox" value="6c57" />
										<a>6串57</a><br>
										<input type="checkbox" value="7c7" />
										<a>7串7</a>
										<input type="checkbox" value="7c8" />
										<a>7串8</a>
										<input type="checkbox" value="7c21" />
										<a>7串21</a>
										<input type="checkbox" value="7c35" />
										<a>7串35</a>
										<input type="checkbox" value="7c120" />
										<a>7串120</a><br>
										<input type="checkbox" value="8c8" />
										<a>8串8</a>
										<input type="checkbox" value="8c9" />
										<a>8串9</a>
										<input type="checkbox" value="8c28" />
										<a>8串28</a>
										<input type="checkbox" value="8c56" />
										<a>8串56</a>
										<input type="checkbox" value="8c70" />
										<a>8串70</a>
										<input type="checkbox" value="8c247" />
										<a>8串247</a>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div style="clear: both"></div>

					<font>投注倍数</font>
					<span> <img id="subMBtnId" src="/images/jj.png" width="20" height="19"
							style="cursor: pointer" /> 
							<b ><input id="multipleId" style="width:50px;text-align:center;border:none" type="text" value="1"/></b> 
							<img src="/images/jj-02.png"
							width="20" height="19" style="cursor: pointer" id="addMBtnId"/>
					</span>
					<font> 金额<b style="color: #e99652" id="betMoneyId">0</b>元 理论最高奖金<b
						style="color: #e99652" id="highestBonusId">0.00</b>元 <a style="cursor:pointer" id="lookBonusBtnId">明细</a>
					</font>
				</div>

				<div class="buy">
					<ul class="layer_notice layer_pageContent" style="display: none;">
		            <li><span>在比赛截止时间30分钟以内（含30分钟），</span></li>
		            <li><span>该方案的已认购份数加方案保底份数之和</span></li>
		            <li><span>仍未满员 ，则系统按合买方案流单处理。</span></li>
		            </ul>
			        
					<b><a style="cursor:pointer" id="bonusBtnId">奖金优化</a>
					<a style="cursor:pointer" id="filterBtnId">在线过滤</a>
					</b>
					
					<a style="cursor:pointer" id="lotteryFormBtnId" class="qren"><img src="/images/buy.png" width="101" height="37" />
					</a>
					<a style="cursor:pointer" id="mergerFormBtnId" class="qren"><img src="/images/buy.jpg" width="101" height="37" />
					</a>
					<span class="yangbb">合买说明<a name ="tipsInBetBuy" href=" javascript:void(0)" value="0" class="yangb_n"><img src="/images/goucai/wenhao1.png" width="18" height="18"></a></span>
				</div>	
			</div>
		</div>
	</div>
</div>

<!-- 单式上传begin -->
<div class="banxin" id="singleUploadDivId" style="display:none">
<div class="ds_con2">
		<!--<div class="ds_con21">
			<div class="ds_con21_l">让球胜平负单式上传<input type="radio"/> 选择场次<input type="radio"/>上传已包含场次的文本 </div>
			<div class="ds_con21_r">
			<div class="zhishi" style="display:none"> 以下格式可直接到第二步：<br />1001:[3]/1002:[2]/1003:[0]/2004:[3]/2005:[1]<br />
					1001→3,1002→1,1003→0,2004→3,2005→1<br />
					使用彩通天下在线过滤、过滤软件保存的文本即为上述格式。           
			</div>
			<img src="/images/newnew.png" width="13" height="13" />
<input type="radio"/> 先发起后上传<input type="radio"/>其他格式上传 <img src="/images/newnew.png" width="13" height="13" /></div>
			<div class="clear"></div>
		</div>-->
		<div class="ds_con22">
			<div class="ds_con22_l">第一步 选择场次</div>
			<!--<div class="ds_con22_r"><span>显示已截止对阵</span>（最多可选15场，下面所示的时间为开赛时间）</div>-->
			<div class="clear"></div>
		</div>
		<!-- 赛程 begin -->
		<div id="dsSchDivId">
			
		</div>
		<!-- 赛程end -->
		
		<div class="ds_con24">
			<div class="ds_con24_l">
				<div class="ds_con24_l_t">第二步 选择过关方式</div>
				<div class="ds_con24_l_c">
					<div class="ds_con24_l_c1">
					该方案截止时间：<span id="schemaStopTimeId">--</span>
				</div>
				<div class="ds_con24_l_c2" id="dsPassTId">
					<span><input name="dsPtName" type="radio" value="2"/>2串1</span>
					<span><input name="dsPtName" type="radio" value="3"/>3串1</span>
					<span><input name="dsPtName" type="radio" value="4"/>4串1</span>
					<span><input name="dsPtName" type="radio" value="5"/>5串1</span>
					<span><input name="dsPtName" type="radio" value="6"/>6串1</span>
					<span><input name="dsPtName" type="radio" value="7"/>7串1</span>
					<span><input name="dsPtName" type="radio" value="8"/>8串1</span>
					<div class="clear"></div>
				</div>
				<p>倍数<input type="text" value="1" class="text" id="dsMultipleId"/> 倍</p>
				</div>
			</div>
			<div class="ds_con24_r">
				<div class="ds_con24_r_t">第三步 上传方案并购买</div>
				<div class="ds_con24_r_c">
					<div class="ds_con24_r_cl">上传方案</div>
					<!--<div class="ds_con24_r_cr">
					<p>格式转化符：胜→3 平→1 负→0 <span>修改</span></p>
					<p style="color:#aeaeae;">注：上述格式符必须与您将要上传的文本中的格式符一致。</p>
					<p> <input type="button" value="选择文件" />未选择文件<span>查看标准格式样本</span></p>
					</div>-->
					<div class="ds_con24_r_cr">
						<c:if test="${licenseId == 9}">
						<p><a href="/playerintro/ds.jhtml" target="_blank"><span>查看标准格式样本</span></a></p>
						</c:if>
						<c:if test="${licenseId == 10}">
						<p><a href="/playerintro/lqds.jhtml" target="_blank"><span>查看标准格式样本</span></a></p>
						</c:if>
						<p style="color:#aeaeae;">注：上述格式符必须与您将要上传的文本中的格式符一致。</p>
			            <span id="fileuplodid" width="101" height="31"></span>
			            <span id="fileQueue" ></span>
			            <p>您选择<span class="red" id="betDsNumId">0</span>注，金额<span class="red" id="betDsMoneyId">0</span>元</p>
			         </div> 
					<div class="clear"></div>
				<div class="ds_con24_r_cc">
					<div class="ds_con24_r_ccl">确认购买</div>
					<div class="ds_con24_r_ccr">
					<!--<p>您尚未登录，请先<a href="#">登录</a></p>
					<p >我已阅读并同意<a href="#">《用户合买代购协议》</a></p>-->
					<p> <input id="mergerAgreeId" type="checkbox" checked/>我已阅读并同意网站<a href="#">《竞彩投注风险须知》</a></p>
					<a href="javascript:void 0" id="singleBuyBtnId"><input type="button" value="确认代购" class="btn1"/></a>
					<!--<a href="#"><input type="button" value="发起合买" class="btn2"/></a>-->
					</div>
					<div class="clear"></div>
				</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!-- 单式上传end -->

<div class="guestFootBallMessage">
    	  <span><b>竞彩投注提示：</b><span><br />
        <span>1、让球(让分)只适合“竞彩足球让球胜平负”玩法与“竞彩让分胜负”玩法,“+”为客让主，“-”为主让客。</span><br />
        <span>2、页面中过关投注固定奖金仅供参考，实际奖金以出票时刻奖金为准。投注区显示的中奖金额=每1元对应中奖奖金。</span><br />
        <span>3、过关投注完场显示的奖金仅指比赛截止投注时最终变化的过关奖金，仅供参考，派奖奖金以方案详情中最终出票时刻的奖金为准。</span><br />
        <span>4、单关投注，单注最高奖金限额为500万元；2或3场过关投注，单注最高奖金限额为20万元；4或5场过关投注，单注最高奖金限额为50万元；6场过关投注，单注最高奖金限额100万元。</span><br />
        <span>5、单注彩票保底奖金：如果单注奖金不足2元，则补足至2元。</span><br />
				<!--<span>6、竞彩足球可出票时间：周一 ～ 周五 9:00-24:00 周六/日 9:00 - 次日01:00。</span><br />
				<span>7、世界杯期间竞彩销售时间安排请遵循官方通告。</span><br />-->
</div>
<jsp:include page="../lotteryForm.jsp"></jsp:include>
<script type="text/javascript" src="/js/common/tips.js"></script>