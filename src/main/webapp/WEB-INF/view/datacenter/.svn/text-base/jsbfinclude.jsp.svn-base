<%@ page language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../../../../cytxhome/css/oyx/lotCss.css" type="text/css"></link>

<script src="http://static.sporttery.cn/info/jslib/jq/jquery-1.7.min.js" type="text/javascript"></script>
<script src="http://static.sporttery.cn/info/jslib/jq/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../../cytxhome/css/oyx/fb_func.js"></script>
<div class="wrap">
	<div class="container">
		<div class="c_top">
			<div class="c_top_s FloatL" id="div_sel_competition">
				<span style="margin-left: 19px">赛事选择</span>
			</div>
			<div class="c_top_a FloatL" id="show_all">
				显示全部
			</div>
			<div class="c_top_zs FloatL">
				共
				<span id="match_total">0</span>场，已隐藏
				<span id="hidden_total">0</span>场
			</div>
			<div class="c_top_dx FloatL">
				<input id="fixture" name="fixture" type="checkbox" checked="checked" />
				未开赛
				<input id="playing" name="playing" type="checkbox" checked="checked" />
				进行中
				<input id="played" name="played" type="checkbox" checked="checked" />
				已结束
				<input id="other" name="other" type="checkbox" checked="checked" />
				其他
			</div>
			<div class="c_top_gn FloatR">
				<!--
				<div id="div_song" class="song FloatL"></div>
				-->
				<div id="div_set" class="introd FloatL"></div>
			</div>
			<input type="hidden" id="h_league_set" name="h_league_set" value="" />
			<input type="hidden" id="song_set" name="song_set" value="1" />
			<input type="hidden" id="m_pool_set" name="m_pool_set" value="had" />
			<input type="hidden" id="hide_matches" name="hide_matches" value="" />
			<input type="hidden" id="top_matches" name="top_matches" value="" />
			<input type="hidden" id="checked_matches" name="checked_matches"
				value="" />
		</div>
		<div class="c_tb">
			<table id="tbl_match_list" cellpadding="0" cellspacing="0" border="0"
				width="100%">
				<tr id="tr_title" class="t_top" bgcolor="#999999">
					<td width="79">
						赛事编号
					</td>
					<td width="60">
						赛事
					</td>
					<td width="99">
						比赛时间
					</td>
					<td width="40">
						状态
					</td>
					<td width="418">
						<span class="t_top_zd FloatL">主队排名</span><span
							class="t_top_z FloatL">主队</span><span class="t_top_bf FloatL">比分</span><span
							class="FloatL">客队</span><span class="t_top_kd FloatR">客队排名</span>
					</td>
					<td width="38">
						半场
					</td>
					<td width="44">
						天气
					</td>
					<td width="113">
						<div id="pool_set" class="t_top_rq">
							<div id="pool_show" style="padding-right: 10px">
								胜平负
							</div>
						</div>
					</td>
					<td width="65">
						数据
					</td>
					<td width="42">
						置顶
					</td>
				</tr>
			</table>
			<div class="c_notice">
				<div class="tb_weather_sunny FloatL" style="margin: 8px 7px 0 10px"></div>
				<div class="FloatL">
					天气
				</div>
				<div class="jinqiu FloatL"></div>
				<div class="FloatL">
					进球
				</div>
				<div class="dianqiu FloatL"></div>
				<div class="FloatL">
					点球
				</div>
				<div class="wlqiu FloatL"></div>
				<div class="FloatL">
					乌龙球
				</div>
				<div class="redpai FloatL"></div>
				<div class="FloatL">
					红牌
				</div>
				<div class="yellowpai FloatL"></div>
				<div class="FloatL">
					黄牌
				</div>
				<div class="c_nr FloatR">
					<span class="tb_bold">暂停</span>、
					<span class="tb_bold">取消</span>、
					<span class="tb_bold">推迟</span>：因场地或天气等原因比赛被迫暂停、取消或推迟开赛时间。详情请查看
					<a href="http://info.sporttery.cn/iframe/lottery_notice.php"
						target="_blank">销售公告</a>。
				</div>
			</div>
			<div class="c_noti">
				特别提醒：以上比分数据仅供参考，最终结果以“赛果开奖”公布内容为准。
			</div>
		</div>
	</div>
	<span id="flashsound"></span>

	<!--[if!IE]>让球胜平负弹出层开始<![endif]-->
	<div id="div_pool_set" class="rqspf" style="display: none">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><span id="had"
							style="margin-left: 15px">胜平负</span>
						</a>
					</div>
				</td>
			</tr>
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><span id="hhad"
							style="margin-left: 15px">让球胜平负</span>
						</a>
					</div>
				</td>
			</tr>
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><span id="crs"
							style="margin-left: 15px">比分</span>
						</a>
					</div>
				</td>
			</tr>
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><span id="hafu"
							style="margin-left: 15px">半全场</span>
						</a>
					</div>
				</td>
			</tr>
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><span id="ttg"
							style="margin-left: 15px">总进球</span>
						</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<!--[if!IE]>让球胜平负弹出层结束<![endif]-->

	<!--[if!IE]>设置弹出层开始<![endif]-->
	<div id="div_introd_set" class="introd_set" style="display: none">
		<table cellpadding="0" cellspacing="0" border="0">
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><input type="checkbox"
								id="goal_set" name="goal_set" checked="checked" />进球弹窗</a>
					</div>
				</td>
			</tr>
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><input type="checkbox"
								id="rank_set" name="rank_set" checked="checked" />球队排名</a>
					</div>
				</td>
			</tr>
			<tr height="25">
				<td>
					<div class="rq_a">
						<a href="javascript:void(0);"><input type="checkbox"
								id="red_set" name="red_set" checked="checked" />红牌显示</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<!--[if!IE]>设置弹出层结束<![endif]-->

	<!--[if!IE]>赛事选择按钮弹出层开始<![endif]-->
	<table id="div_sel_competitions" cellpadding="0" cellspacing="0"
		class="lsxz" style="display: none">
		<tr>
			<td>
				<div class="lsxz_bg">
					<span style="margin-left: 19px" onclick="close_competition();">赛事选择</span>
				</div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#f6f6f6">
				<div class="lsxz_div">
					<table cellpadding="0" cellspacing="0" border="0" id="tbl_leagues">
					</table>
					<div class="lsxz_button">
						<div id="choose_all" class="lsxz_b FloatL">
							<a href="javascript:void(0);" style="width: 69px; height: 27px;">全选</a>
						</div>
						<div id="opposite_all" class="lsxz_b FloatL"
							style="margin: 0 31px 0 30px">
							<a href="javascript:void(0);" style="width: 69px; height: 27px;">反选</a>
						</div>
						<div class="lsxz_b FloatL" onclick="close_competition();">
							<a href="javascript:void(0);" style="width: 69px; height: 27px;">关闭</a>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<!--[if!IE]>赛事选择按钮弹出层结束<![endif]-->

	<!--[if!IE]>比分经停弹出层开始<![endif]-->
	<div id="div_detail_show" class="bfjt" style="display: none">
		<div class="FloatL">
			<table id="tbl_match_detail" cellpadding="0" cellspacing="0"
				border="0">
			</table>
		</div>
		<div class="FloatL"></div>
	</div>
	<!--[if!IE]>比分经停弹出层结束<![endif]-->

	<!--[if!IE]>进球弹出层开始<![endif]-->
	<div id="div_goal_show" class="goal_div" style="display: none">
		<div class="FloatL">
			<table id="tbl_goal_info" cellpadding="0" cellspacing="0" border="0">
			</table>
		</div>
		<div class="FloatL"></div>
		<div class="goal_close tb_ff" onclick="close_goal_div();">
			[&times;]
		</div>
	</div>
	<div class="close_goal tb_ff" style="display: none"
		onclick="close_goal_div();">
		[&times;]
	</div>
	<!--[if!IE]>进球弹出层结束<![endif]-->


	<!--[if!IE]>选中赛事保留/隐藏弹出层开始<![endif]-->
	<div id="show_hide_set" class="xuanzhong" style="display: none">
		<div id="div_show_match" class="xuanzhong_div"
			style="margin-bottom: 6px">
			<a href="javascript:void(0);"><div style="margin-top: 10px">
					保留选中
				</div>
			</a>
		</div>
		<div id="div_hide_match" class="xuanzhong_div">
			<a href="javascript:void(0);"><div style="margin-top: 10px">
					隐藏选中
				</div>
			</a>
		</div>
	</div>
	<!--[if!IE]>选中赛事保留/隐藏弹出层结束<![endif]-->


</div>