/**
 * 
 */
package com.jingc.busi.lottery.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.SwapStringInputStream;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;
import com.jingc.busi.copyorder.service.CopyOrderService;
import com.jingc.busi.freq.FreqPeriod;
import com.jingc.busi.freq.FreqPeriodFactory;
import com.jingc.busi.lottery.service.LotteryService;
import com.jingc.busi.membercenter.service.MemberCenterService;
import com.jingc.busi.util.member.FreqLicenseId;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: LotteryController.java</p>
 * <p>Desc: 投注Controller</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Controller
@RequestMapping("/lottery/")
public class LotteryController {
	
	@Resource private LotteryService lotteryService;
	@Resource private MemberCenterService memberCenterService;
	@Resource private CopyOrderService copyOrderService;
	
	private static Map<String, String> playMap = new Hashtable<String, String>();
	static {
		playMap.put("hhgg", "混合过关");
		playMap.put("spf", "胜平负");
		playMap.put("rqspf", "让球胜平负");
		playMap.put("bf", "比分");
		playMap.put("zjq", "总进球");
		playMap.put("bqc", "半全场");
		playMap.put("2x1", "2选1");
		
		playMap.put("sf", "胜负");
		playMap.put("rfsf", "让分胜负");
		playMap.put("sfc", "胜分差");
		playMap.put("dxf", "大小分");
		
		playMap.put("zxpt", "直选普通");
		playMap.put("zxzh", "直选组合");
		playMap.put("zxhz", "直选和值");
		playMap.put("zxdt", "直选胆拖");
		playMap.put("z3ds", "组3单式");
		playMap.put("z3fs", "组3复式");
		playMap.put("z3hz", "组3和值");
		playMap.put("z3dt", "组3胆拖");
		playMap.put("z6pt", "组6普通");
		playMap.put("z6hz", "组6和值");
		playMap.put("z6dt", "组6胆拖");
		
		playMap.put("pl5", "排列五");
		playMap.put("qxc", "七星彩");
	}
	
	/**
	 * 购彩大厅
	 * @return
	 */
	@RequestMapping("/halt.jhtml")
	public ModelAndView halt() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lottery/index");
		return mv;
	}

	@RequestMapping("/index.jhtml")
	public ModelAndView index(HttpSession session, HttpServletRequest request, Integer licenseId, String p, String issue, String betCode) {
		ModelAndView mv = new ModelAndView();
		
		// 是否允许进入投注界面
		boolean hasLicense = false;
		//List<StoreLicense> sls = this.lotteryService.getStoreLicenses(((Store)session.getAttribute("domain")).getStoreId());
		List<StoreLicense> sls = ((Store)session.getAttribute("domain")).getSls();
		if ( null == sls ) {
			sls = this.lotteryService.getStoreLicenses(((Store)session.getAttribute("domain")).getStoreId());
		}
		// 查询彩种的截止时间
		StoreLicense csl = null;
		for ( StoreLicense sl : sls ) {
			if ( licenseId.intValue() == sl.getLicenseId() ) {
				csl = sl;
				hasLicense = true;
				break;
			}			
			
		}
		
		if ( !hasLicense ) {
			throw new BaseException("[该彩种暂时不开放投注]");
		}
		//营业厅彩民分高频用户与传统彩
		Member mb = (Member)session.getAttribute("member");
		/** wangheping,如果是营业厅用户，需要判断是否是同一次登陆，再判断是传统彩与高频彩的区别*/
		if(mb != null){
			if (mb.getMemberFrom() == 5 ) {
				if(mb.getLevel().intValue()==1){//普通玩法用户
					if(licenseId.intValue() > 100){
						throw new BaseException("[营业厅普通玩法彩民不允许投注高频类游戏]");
					}
				}else{//高频玩法用户
					if(licenseId.intValue() < 100){
						throw new BaseException("[营业厅高频玩法彩民不允许投注非高频类游戏]");
					}
				}
			}
		}
		
		int aheadset = 0, coopAheadset = 0;	// 分钟
		// 设置提前截止时间
		if ( null != csl.getBuyAheadTime() && !"".equals(csl.getBuyAheadTime()) ) {
			aheadset = Integer.parseInt(csl.getBuyAheadTime());
		} else {
			try {
				StoreLicenseKey key = new StoreLicenseKey();
				key.setStoreId(-1);
				key.setLicenseId(licenseId);
				aheadset = Integer.parseInt(this.lotteryService.getStoreLicense(key).getBuyAheadTime());
			} catch ( Exception ex ) {
			}
		}
		if ( null != csl.getCoopAheadTime() && !"".equals(csl.getCoopAheadTime()) ) {
			coopAheadset = Integer.parseInt(csl.getCoopAheadTime());
		} else {
			try {
				StoreLicenseKey key = new StoreLicenseKey();
				key.setStoreId(-1);
				key.setLicenseId(licenseId);
				coopAheadset = Integer.parseInt(this.lotteryService.getStoreLicense(key).getCoopAheadTime());
			} catch ( Exception ex ) {
			}
		}
		/*if ( aheadset > 30 || aheadset < 0 ) {
			aheadset = 2;
		}*/
		mv.addObject("aheadtime", aheadset);
		coopAheadset += MergerOrder.COOP_COMM_AHEAD;
		mv.addObject("coopaheadtime", coopAheadset);
		
		String viewName = null;
		int swt = licenseId;
		if ( swt > 100 && swt < 200 ) {
			swt = FreqLicenseId.LICENSE_FREQ_SD11X5;
		}
		if ( swt > 500 && swt < 600 ) {
			swt = FreqLicenseId.LICENSE_FREQ_CQKL10;
		}
		if ( swt == Constants.LICENSE_LJY || swt == Constants.LICENSE_JSQWS ) {
			swt = Constants.LICENSE_QXC;
		}
		switch ( swt ) {
		case Constants.LICENSE_JCZQ:
			p = null == p ? "spf" : p;
			viewName = "lottery/guess/guessfootball/" + p;
			break;
		case Constants.LICENSE_JCLQ:
			p = null == p ? "sf" : p;
			viewName = "lottery/guess/guessbasketball/" + p;
			break;
		case Constants.LICENSE_SFGG:
			p = null == p ? "sfgg" : p;
			viewName = "lottery/bjSingleSchedule/" + p;
			break;
		case Constants.LICENSE_BJDC:
			p = null == p ? "spf" : p;
			viewName = "lottery/bjSingleSchedule/" + p;
			break;
		case Constants.LICENSE_PLS:
			if( p == null )
				p = "zxpt";
			mv.addObject("pl3PlayName", p.substring(0, 2));
			mv.addObject("pl3SubPlayName", p.substring(2));
			viewName = "lottery/pl3/" + p;
			break;
		case Constants.LICENSE_PLW:
			p = null == p ? "pl5" : p;
			mv.addObject("p", p);
			viewName = "lottery/pl5/" + p;
			break;
		case Constants.LICENSE_QXC:
			p = null == p ? "qxc" : p;
			mv.addObject("p", p);
			viewName = "lottery/qxc/" + p;
			break;
		case Constants.LICENSE_DLT:
			p = null == p ? "dlt" : p;
			viewName = "lottery/dlt/" + p;
			break;
		case Constants.LICENSE_14SFC:
			p = null == p ? "sfc" : p;
			viewName = "lottery/football/sfc/" + p;
			break;
		case Constants.LICENSE_R9:
			p = null == p ? "rxj" : p;
			viewName = "lottery/football/rxj/" + p;
			break;
		case Constants.LICENSE_4JQ:
			p = null == p ? "jqc" : p;
			viewName = "lottery/football/jqc/" + p;
			break;
		case Constants.LICENSE_6CBQ:
			p = null == p ? "bqc" : p;
			viewName = "lottery/football/bqc/" + p;
			break;
		case FreqLicenseId.LICENSE_FREQ_HNXYSC:
			p = null == p ? "q1" : p;
			mv.addObject("freqPlayName", p.substring(0, 2));
			if( !p.equals("q1") ) {
				mv.addObject("freqSubPlayName", p.substring(2));
			} 
			viewName = "lottery/luckyracing/" + p;
			break;
		case FreqLicenseId.LICENSE_FREQ_JXSSC:
			p = null == p ? "5xzhx" : p;
			mv.addObject("freqPlayName", p.substring(0, 2));
			mv.addObject("freqSubPlayName", p.substring(2));
			viewName = "lottery/ssc/" + p;
			break;
		case FreqLicenseId.LICENSE_FREQ_SD11X5:
			p = null == p ? "r5pt" : p;
			mv.addObject("freqPlayName", p.substring(0, 2));
			mv.addObject("freqSubPlayName", p.substring(2));
			viewName = "lottery/11x5/" + p;
			break;
		case FreqLicenseId.LICENSE_FREQ_CQKL10:
			p = null == p ? "x3r3" : p;
			mv.addObject("freqPlayName", p.substring(0, 2));
			mv.addObject("freqSubPlayName", p.substring(2));
			viewName = "lottery/kl10/" + p;
			break;
		case Constants.LICENSE_SSQ:
			p = null == p ? "ssq" : p;
			viewName = "lottery/ssq/" + p;
			break;
		case Constants.LICENSE_3D:
			if( p == null )
				p = "zxpt";
			mv.addObject("pl3PlayName", p.substring(0, 2));
			mv.addObject("pl3SubPlayName", p.substring(2));
			viewName = "lottery/pl3/" + p;
			break;
		case Constants.LICENSE_QLC:
			p = null == p ? "qlc" : p;
			viewName = "lottery/qlc/" + p;
			break;
		case Constants.LICENSE_20X5:
			p = null == p ? "20x5" : p;
			viewName = "lottery/20x5/" + p;
			break;
		case Constants.LICENSE_FJ31X7:
			p = null == p ? "r7pt" : p;
			mv.addObject("p", p);
			viewName = "lottery/31x7/" + p;
			break;
		}
		
		// 普通数字彩设置追号期数到追号列表中 added at 2015/02/27
		if ( licenseId == Constants.LICENSE_DLT ||
				licenseId == Constants.LICENSE_PLS ||
				licenseId == Constants.LICENSE_PLW ||
				licenseId == Constants.LICENSE_QXC ||
				licenseId == Constants.LICENSE_LJY ||
				licenseId == Constants.LICENSE_20X5 ||
				licenseId == Constants.LICENSE_FJ31X7 ||
				licenseId == Constants.LICENSE_SSQ ||
				licenseId == Constants.LICENSE_3D ||
				licenseId == Constants.LICENSE_QLC) {
			List<Game> gameSaledList = this.lotteryService.getSaleGame2Chasing(licenseId, 50);
			mv.addObject("gameSaledList", gameSaledList);
		}
		
		// 彩种的提前截止时间
		int ahead = 0;
		
		if ( licenseId > 100 ) {	// 高频彩种定义大于100
			FreqPeriod fp = FreqPeriodFactory.getFreqPeriod(licenseId, aheadset);
			mv.addObject("fp", fp);
			mv.addObject("todayFmt", DateUtil.getDayNext("yyyyMMdd", 0));
			mv.addObject("tomorrowFmt", DateUtil.getDayNext("yyyyMMdd", 1));
			mv.addObject("stopTime", fp.getCurrentStopTime().split(","));
		}
		else if ( licenseId != Constants.LICENSE_JCZQ && licenseId != Constants.LICENSE_JCLQ && licenseId != Constants.LICENSE_SFGG && licenseId != Constants.LICENSE_BJDC) {
			// 足彩、数字彩查询当前期次
			int queryLicenseId = licenseId == Constants.LICENSE_R9 ? Constants.LICENSE_14SFC : licenseId;
			Game game = null;
			// 足彩查询当前期和预售期
			if ( queryLicenseId == Constants.LICENSE_14SFC || queryLicenseId == Constants.LICENSE_6CBQ || queryLicenseId == Constants.LICENSE_4JQ ) {
				List<Game> gameList = this.lotteryService.getSaleGame(queryLicenseId);
				Integer selIndex = 0;
				int len = gameList.size();
				if ( len == 0 ) {
					throw new BaseException("["+GameUtil.GAMESMAP.get(licenseId+"")+"当前期尚未开售]");
				}
				if ( null == issue ) {
					game = gameList.get(0);
					selIndex = 0;
				} else {
					if ( len > 1 ) {
					if ( gameList.get(1).getIssue().equals(issue) ) {
						game = gameList.get(1);
						selIndex = 1;
					} else if ( gameList.get(0).getIssue().equals(issue) ) {
						game = gameList.get(0);
						selIndex = 0;
					} else {
						if ( len > 2 ) {
							game = gameList.get(2);
						}
						selIndex = 2;
					}
					}
				}
				mv.addObject("selIndex", selIndex);
				mv.addObject("currIssue", gameList.get(0).getIssue());
				if ( len > 1 ) {
					mv.addObject("saleIssue1", gameList.get(1).getIssue());
				} else {
					mv.addObject("saleIssue1", "--");
				}
				if ( len > 2 ) {
					mv.addObject("saleIssue2", gameList.get(2).getIssue());
				} else {
					mv.addObject("saleIssue2", "--");
				}
			} else {
				game = this.lotteryService.getCurrentGame(queryLicenseId, ahead);
			}
			mv.addObject("game", game);
			mv.addObject("stopTime", getCurrentStopTime(game, aheadset).split(","));
			mv.addObject("coopStopTime", getCurrentStopTime(game, coopAheadset).split(","));// 合买截止时间
			// 当前期的截止时间
			mv.addObject("issueStopTime", getCurrentStopTime2(game, aheadset, coopAheadset));
			mv.addObject("currDay", DateUtil.getCurrDay());
		}
		
		mv.addObject("licenseId", licenseId);
		mv.addObject("p", p);
		mv.addObject("playName", playMap.get(p));
		mv.addObject("ndate", DateUtil.getDateFormat2());
		mv.addObject("licenseName", GameUtil.GAMESMAP.get(licenseId+""));
		
		if ( null != betCode ) {
			// 首页随机生成的投注码
			mv.addObject("betCode", betCode);
		}
		
		mv.setViewName(viewName);
		return mv;
	}
	
	/**
	 * 当前期次的截止时间
	 * @return
	 */
	private String getCurrentStopTime2(Game game, int ahead, int coopahead) {
		Date nextTime = DateUtil.getDate(game.getStopTime(), "yyyy-MM-dd HH:mm:ss");
		Calendar c = Calendar.getInstance();
		c.setTime(nextTime);
		c.add(Calendar.MINUTE, -ahead);
		Date date = c.getTime();
		game.setStopTime(DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", date));
		
		Calendar cc = Calendar.getInstance();
		cc.setTime(nextTime);
		cc.add(Calendar.MINUTE, -coopahead);
		Date cdate = cc.getTime();
		game.setReserved3(DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", cdate));
		return game.getStopTime();
	}
	
	/**
	 * 当前期次的截止时间
	 * @return
	 */
	private String getCurrentStopTime(Game game, int ahead) {
		Date nowTime = new Date();
		Date nextTime = DateUtil.getDate(game.getStopTime(), "yyyy-MM-dd HH:mm:ss");
		Calendar cc = Calendar.getInstance();
		cc.setTime(nextTime);
		cc.add(Calendar.MINUTE, -ahead);
		nextTime = cc.getTime();
		long endLTime = nextTime.getTime() - nowTime.getTime();
		int endHou = ((int)endLTime / 1000) / 60 / 60;
		int endMin = ((int)endLTime / 1000) / 60;
		if ( endMin > 60 ) {
			endMin = endMin % 60;
		}
		int endSec = ((int)endLTime / 1000) % 60;
		
		return String.format("%02d", endHou) + "," + String.format("%02d", endMin) + "," + String.format("%02d", endSec);
	}
	
	public void writeLog(String fileName, String msg) {
		File file = null;
		FileOutputStream fw = null;
		try {
			file = new File(fileName);
			if ( !file.exists() ) {
				file.getParentFile().mkdirs();
			}
			fw = new FileOutputStream(file, true);
			fw.write((DateUtil.getNowDateByFmt("yyyy-MM-dd HH:mm:ss.S")+" "+msg+"\n\n").getBytes());
		} catch ( Exception ex ) {
			
		} finally {
			try {
				fw.close();
			} catch (Exception e) {
			}
		}
	}
	
	public String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	} 
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/bet.jhtml")
	public ModelAndView bet(HttpSession session, HttpServletRequest request, LotteryOrder order, ModelMap modelmap) {
		// 是否允许进入投注界面
		boolean hasLicense = false;
		List<StoreLicense> sls = ((Store)session.getAttribute("domain")).getSls();
		if ( null == sls ) {
			sls = this.lotteryService.getStoreLicenses(((Store)session.getAttribute("domain")).getStoreId());
		}
		for ( StoreLicense sl : sls ) {
			if ( order.getLicenseId().intValue() == sl.getLicenseId() ) {
				hasLicense = true;
				order.setStoreLicense(sl);
				break;
			}			
			
		}
		if ( !hasLicense ) {
			throw new BaseException("[该彩种暂时不开放投注]");
		}
		
		//ModelAndView mv = new ModelAndView();
		Member mb = (Member)session.getAttribute("member");
		
		// 记录表单日志 begin
		Map<String, String[]> params = request.getParameterMap(); 
		String formString = " User-Agent:"+request.getHeader("User-Agent") + " storeId=" + mb.getStoreId() + " member=" + mb.getMemberName() + " host="+getRemortIP(request) + "\n";
        for (String key : params.keySet()) {  
            String[] values = params.get(key);  
            for (int i = 0; i < values.length; i++) {  
                String value = values[i];  
                formString += " "+key+"="+value + "";
            }  
        }  
        order.setReserved12(getRemortIP(request));
		String fileName = "/mnt/html/logs/lottery/orderForm/" + DateUtil.getNowDateByFmt("yyyyMMdd") + ".log";
		writeLog(fileName, formString);
		// 记录表单日志 end
        
		order.setMemberFrom(mb.getMemberFrom());	// 彩民来源		
		/** wangheping,如果是营业厅用户，需要判断是否是同一次登陆，再判断是传统彩与高频彩的区别*/
		if ( mb.getMemberFrom() == 5 ) {
			Member currMember = this.memberCenterService.getOneMember(mb.getId());
			if(currMember.getReserved1().equals(mb.getReserved1())){//首先判断是否是同一次登陆
				if(currMember.getLevel().intValue()==1){//普通玩法用户
					//方案暂存； wangheping 0529
					order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "");
					order.setFetchFlag("1"); // 营业厅单子变成已取票
				}else{//高频玩法，直接等待出票
					order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "");
				}
			}else{
				//强制退出登陆
				session.invalidate();
				//return new ModelAndView(new RedirectView("/"),modelmap); 
				throw new BaseException("[您的用户名已被店铺注销，请重新登陆！]");
			}
		}else{
			order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "");
		}
		order.setFetchFlag("1");
		if ( null == order.getBetFrom() ) {
			order.setBetFrom("3");
		}
		order.setBetType("1");
		//如果是营业厅用户，方案暂存； wangheping 0529
		//order.setBetState(mb.getMemberFrom()==5?LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "":LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "");
		//如果是营业厅用户，存入彩民的唯一标识码
		order.setReserved1(mb.getReserved1());
		
		order.setUserid(mb.getId());
		order.setUsername(mb.getMemberName());
		order.setStoreid(mb.getStoreId());
		this.lotteryService.bet(order);
		
		modelmap.put("username", order.getUsername());
		modelmap.put("id", order.getId());
		modelmap.put("betPrice", order.getBetPrice());
		modelmap.put("reserved10", order.getReserved10());
		modelmap.put("licenseId", order.getLicenseId());
		
		// 复制跟单
		if ( "1".equals(order.getReserved15()) ) {
			this.copyOrderService.copy(order);
		}
		
		//mv.setView(new RedirectView("/lottery/success.jhtml"),modelmap);
		return new ModelAndView(new RedirectView("/lottery/success.jhtml"),modelmap); 
	}
	
	@RequestMapping("/success.jhtml")
	public ModelAndView lotteryBuy(ModelAndView mv, String username, Integer id, Integer betPrice,
			String reserved10, Integer licenseId) {
		// 到投注成功页面
		LotteryOrder order = new LotteryOrder();
		order.setId(id);
		order.setBetPrice(betPrice);
		order.setReserved10(reserved10);
		order.setLicenseId(licenseId);
		try {
			username = new String(username.getBytes("iso-8859-1"), "utf-8");
		} catch (Exception e) {
		}
		order.setUsername(username);
		mv.addObject("order", order);
		mv.setViewName("/lottery/bet");
        return mv;
	}
	
	/**
	 * 奖金优化
	 * @param licenseId
	 * @param playId
	 * @param betCode
	 * @param passType
	 * @return
	 */
	@RequestMapping("/indexBonus.jhtml")
	public ModelAndView indexBonus(Integer licenseId, Integer playId, String betCode, String passType, String singCode) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("betCode", betCode);
		mv.addObject("passType", passType);
		mv.addObject("licenseId", licenseId);
		mv.addObject("playId", playId);
		mv.addObject("singCode", singCode);
		mv.setViewName("lottery/guess/bonus");
		return mv;
	}
	
	/**
	 * 在线过滤
	 * @param licenseId
	 * @param playId
	 * @param betCode
	 * @param passType
	 * @return
	 */
	@RequestMapping("/indexFilter.jhtml")
	public ModelAndView indexFilter(Integer licenseId, Integer playId, String betCode, String passType) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("betCode", betCode);
		mv.addObject("passType", passType);
		mv.addObject("licenseId", licenseId);
		mv.addObject("playId", playId);
		mv.addObject("playName", GameUtil.GAMESMAP.get(licenseId + "")+GameUtil.getGameName(licenseId, playId+"", 0));
		if ( licenseId == 21 ) {
			mv.setViewName("lottery/guess/filter");
		} else if ( licenseId == 9 ) {
			if ( playId == 1 || playId == 2 ) {
				mv.setViewName("lottery/guess/filter");
			} else {
				mv.setViewName("lottery/guess/filterhh");
			}
		} else if ( licenseId == 10 ) {
			mv.setViewName("lottery/guess/filterhh");
		}
		return mv;
	}
	
	
	/**
	 * 获取服务器时间，格式"yyyy-MM-dd HH:mm:ss"
	 * @return
	 */
	@RequestMapping("/getServerDateTime.jhtml")
	@ResponseBody
	public String getServerDateTime() {
		return DateUtil.getDateFormat2();
	}
	
	/**
	 * @param request
	 * @param response
	 */
	@RequestMapping("creatlnk.jhtml")
	public String creatLnk(HttpServletRequest request,HttpServletResponse response){
		String path = request.getContextPath();
    	String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    	String templateContent = "[InternetShortcut]" + "\n" + "URL= " +url + "\n";
    	templateContent += "IconFile=" +url+ "images/top_logo.ico\nIconIndex=0";
    	try {
    		String linkName = "cp020.com.url";
    		//Slw slw = getCurrSlw(request.getSession());
    		String realfilename = ((Store)request.getSession().getAttribute("domain")).getStoreName() + ".url";
    		if(null != realfilename){
    			linkName = realfilename;
    		}
    		
    		response.setHeader("Content-Type","application/x-msdownload");
    		response.setHeader("Content-Disposition", "attachment;filename=\"" +new String(linkName.getBytes("GBK"),"ISO8859_1")+ "\"");
            InputStream inStream = SwapStringInputStream.getStringStream(templateContent,null);
            FileCopyUtils.copy(inStream, response.getOutputStream());
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return null;
	}
	
}
