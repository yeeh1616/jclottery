/**
 * 
 */
package com.jingc.busi.lottery.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jingc.afc.cache.CacheUtil;
import com.jingc.afc.cache.classification.StoreInfoCache;
import com.jingc.afc.cache.classification.StoreInfoCache.SYS_TYPE;
import com.jingc.afc.exception.BaseException;
import com.jingc.afc.exception.JCException;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.HttpUtil;
import com.jingc.busi.common.mapper.GameMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MemberMoneyLogMapper;
import com.jingc.busi.common.mapper.StoreAccountMapper;
import com.jingc.busi.common.mapper.StoreLicenseMapper;
import com.jingc.busi.common.mapper.StoreMapper;
import com.jingc.busi.common.mapper.StoreMoneyLogMapper;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreAccount;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;
import com.jingc.busi.common.table.StoreMoneyLog;
import com.jingc.busi.core.service.CommonService;
import com.jingc.busi.core.service.ICytxCommonOperationService;
import com.jingc.busi.core.service.ICytxCommonOperationService.UpdateStatisTypes;
import com.jingc.busi.freq.FreqPeriod;
import com.jingc.busi.freq.FreqPeriodFactory;
import com.jingc.busi.lottery.service.split.BjDcTicketSplitor;
import com.jingc.busi.lottery.service.split.C11x5TicketSplitor;
import com.jingc.busi.lottery.service.split.C20x5TicketSplitor;
import com.jingc.busi.lottery.service.split.DltTicketSplitor;
import com.jingc.busi.lottery.service.split.Fj31x7TicketSplitor;
import com.jingc.busi.lottery.service.split.FootballSfcTicketSplitor;
import com.jingc.busi.lottery.service.split.GuessFootballTicketSplitor;
import com.jingc.busi.lottery.service.split.Kl10TicketSplitor;
import com.jingc.busi.lottery.service.split.LuckyRacingTicketSplitor;
import com.jingc.busi.lottery.service.split.Pl3TicketSplitor;
import com.jingc.busi.lottery.service.split.Pl5TicketSplitor;
import com.jingc.busi.lottery.service.split.QlcTicketSplitor;
import com.jingc.busi.lottery.service.split.QxcTicketSplitor;
import com.jingc.busi.lottery.service.split.SfGgTicketSplitor;
import com.jingc.busi.lottery.service.split.SscTicketSplitor;
import com.jingc.busi.lottery.service.split.SsqTicketSplitor;
import com.jingc.busi.lottery.service.split.TicketMergedUtil;
import com.jingc.busi.lottery.service.validator.DltCodeValidator;
import com.jingc.busi.lottery.service.validator.PlsCodeValidator;
import com.jingc.busi.store.service.StoreService;
import com.jingc.busi.util.member.FreqLicenseId;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.MemberConstant;
import com.jingc.busi.util.member.MemberState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.busi.util.member.StoreConstant;
import com.jingc.common.util.CommonUtil;
import com.jingc.common.util.PropertiesTool;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: LotteryServiceImpl.java</p>
 * <p>Desc: 彩票业务逻辑实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-2-28
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("lotteryService")
public class LotteryServiceImpl implements LotteryService {
	
	public static final int SIM_FILE_MAX = 1000;	// 速打线客户端一个包最大票数
	
	public static ThreadLocal<Integer> maxMultiple = new ThreadLocal<Integer>(); //  出票的最大倍数，每个店铺有可能不一样

	@Resource private MemberAccountMapper memberAccountMapper;
	@Resource private LotteryOrderMapper lotteryOrderMapper;
	@Resource private LotteryTicketMapper lotteryTicketMapper;
	@Resource private MemberMoneyLogMapper memberMoneyLogMapper;
	@Resource private StoreMapper storeMapper;
	@Resource private GameMapper gameMapper;
	@Resource private StoreLicenseMapper storeLicenseMapper;
	@Resource private StoreAccountMapper storeAccountMapper;
	@Resource private StoreMoneyLogMapper storeMoneyLogMapper;
	@Resource private MemberMapper memberMapper;
	@Resource private StoreService sservice;
	@Resource private CommonService commonService;
	
	@Resource private ICytxCommonOperationService cytxcservice;
	
	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	
	/**
	 * 按游戏类别得到当前期的游戏
	 */
	public Game getCurrentGame(Integer licenseId, Integer aheadTime){
		String newStopTime = df.format(new Date(new Date().getTime() + aheadTime * 60 * 1000));
		Game game = new Game();
		game.setLicenseId(licenseId);
		game.setStopTime(newStopTime);
		return this.gameMapper.getCurrentGame(game);
	}
	
	/**
	 * 足彩，数字彩上期期次，通过彩种，期号查询
	 */
	public Game getOneGame(Integer licenseId, String issue) {
		Game game = new Game();
		game.setLicenseId(licenseId);
		game.setIssue(issue);
		return this.gameMapper.getGame2Calc(game);
	}
	
	/**
	 * 查询预售期
	 */
	public List<Game> getSaleGame(Integer licenseId) {
		String newStopTime = df.format(new Date());
		return this.gameMapper.getSaleGame(licenseId, newStopTime);
	}
	
	/**
	 * 查询预售期（追号期数）
	 */
	public List<Game> getSaleGame2Chasing(Integer licenseId, Integer issueNum) {
		String newStopTime = df.format(new Date());
		return this.gameMapper.getSaleGame2Chasing(licenseId, newStopTime, issueNum);
	}
	
	/**
	 * 足彩，数字彩上期期次
	 */
	public Game getPreGame(Integer licenseId) {
		Game query = new Game();
		query.setLicenseId(licenseId);
		String newStopTime = df.format(new Date());
		query.setStopTime(newStopTime);
		return this.gameMapper.getPreGame(query);
	}
	
	/**
	 * 获取店铺销售彩种列表
	 */
	public List<StoreLicense> getStoreLicenses(Integer storeId) {
		return this.storeLicenseMapper.getStoreLicense(storeId);
	}
	
	/**
	 * 获取店铺某一彩种的配置信息
	 */
	public StoreLicense getStoreLicense(StoreLicenseKey key) {
		return this.storeLicenseMapper.selectByPrimaryKey(key);
	}
	
	/**
	 * 截止购彩时间判断 added by wangheping
	 * @param order
	 * @param stopTime
	 */
	private void validateDateOut(LotteryOrder order, String stopTime) {
		/*
		 * 周二到周六，截止指时间位于凌晨0点到早上8点55的，在8点55之前不能投注
			        周日和周一，截止指时间位于凌晨1点到早上8点55的，在8点55之前不能投注
		 */
		if(order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ){
			int weekDay = CommonUtil.getWeekDay(stopTime);//第一个票截止时间是星期几
			try{
				Calendar c = Calendar.getInstance();
				Date endTime = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(stopTime);
				c.setTime(endTime);
				c.set(Calendar.HOUR_OF_DAY, 0);
		        c.set(Calendar.MINUTE, 0);
		        c.set(Calendar.SECOND, 0);
		        c.set(Calendar.MILLISECOND, 0);       
		        Date zeroDate = c.getTime(); //第一张票截止 天 的0时
		        
		        c = Calendar.getInstance();
		        c.setTime(endTime);
		        c.set(Calendar.HOUR_OF_DAY,  1);
		        c.set(Calendar.MINUTE, 0);
		        c.set(Calendar.SECOND, 0);
		        c.set(Calendar.MILLISECOND, 0);       
		        Date oneDate = c.getTime();//第一张票截止 天 的1时
		        
		        c = Calendar.getInstance();
		        c.setTime(endTime);
		        c.set(Calendar.HOUR_OF_DAY,  8);
		        c.set(Calendar.MINUTE, 52);
		        c.set(Calendar.SECOND, 0);
		        c.set(Calendar.MILLISECOND, 0);       
		        Date eightDate = c.getTime();//第一张票截止 天 的8点52
		        
		        c = Calendar.getInstance();
		        c.setTime(endTime);
		        c.set(Calendar.HOUR_OF_DAY,  7);
		        c.set(Calendar.MINUTE, 27);
		        c.set(Calendar.SECOND, 0);
		        c.set(Calendar.MILLISECOND, 0);       
		        Date sevenDate = c.getTime();//第一张票截止 天 的7点27
		        
		        //System.out.println(weekDay+";"+oneDate+";"+zeroDate+";"+endTime+";"+eightDate);
		        if(order.getLicenseId() == Constants.LICENSE_JCZQ){
		        	if(weekDay == 1 || weekDay == 7){
						if(new Date().after(oneDate) && endTime.before(eightDate)){//时 间大于1时,小于早上8点52
							throw new JCException("101602", "[请8点52分以后投注]");
						}
					}else{
						if(new Date().after(zeroDate) && endTime.before(eightDate)){//时 间大于0时,小于早上8点52
							throw new JCException("101602", "[请8点52分以后投注]");
						}
					}
		        }else{
		        	if(weekDay == 1 || weekDay == 7){
						if(new Date().after(oneDate) && endTime.before(eightDate)){//时 间大于1时,小于早上8点52
							throw new JCException("101602", "[请8点52分以后投注]");
						}
					}else if(weekDay == 3 || weekDay == 4){
						if(new Date().after(zeroDate) && endTime.before(sevenDate)){//时 间大于0时,小于早上7点27
							throw new JCException("101602", "[请7点27以后投注]");
						}
					}else{
						if(new Date().after(zeroDate) && endTime.before(eightDate)){//时 间大于0时,小于早上8点52
							throw new JCException("101602", "[请8点55分以后投注]");
						}
					}
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	}
	
	private void validate(LotteryOrder order) {
		if((!CacheUtil.getStoreOpenState(order.getStoreid()).equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString())) ){
			String info = "[店铺已打烊,不能购彩]";
			try {
				PropertiesTool pt = new PropertiesTool("/jc.properties");
				String storeHost = pt.getValue("storeHost") == null ? "" : pt.getValue("storeHost");
				if(storeHost == null) storeHost = "wangdian.cp020.com";
				info = HttpUtil.doGet("http://"+storeHost+"/www/data/store/STOREID_"+order.getStoreid()+"/INFO_CATEGORY/CLOSING_BULLETIN/closeing_bulletin.js", "utf-8");
				info = info.substring(info.indexOf("content") + 10, info.indexOf("}];")-1);
			} catch (Exception e) {
			}
			throw new JCException("101600",info);
		}
		
		// 号码校验
		if ( !CodeValidatorFactory.validate(order) ) {
			throw new JCException("101601", "[投注号码格式有误]");
		}
		// 非竞彩代购校验期号是否当前期
		if ( order.getLicenseId() != Constants.LICENSE_JCZQ
				&& order.getLicenseId() != Constants.LICENSE_JCLQ && order.getLicenseId() != Constants.LICENSE_SFGG
				&& order.getLicenseId() != Constants.LICENSE_BJDC) {
			String stopTime = null;
			if ( order.getLicenseId() < 100 ) {
				Integer licenseId = order.getLicenseId();
				if ( licenseId == Constants.LICENSE_R9 ) {
					licenseId = Constants.LICENSE_14SFC;
				}
				Game g = this.getOneGame(licenseId, order.getIssue());
				if ( null == g ) {
					throw new JCException("101602", "[投注期号不存在]");
				}
				stopTime = g.getStopTime();
			} else {
				FreqPeriod fp = FreqPeriodFactory.getFreqPeriod(order.getLicenseId(), 0);
				stopTime = fp.getIssueStopTime(order.getIssue());
			}
			
			Date now = new Date();
			Date sdt = DateUtil.getDate(stopTime, "yyyy-MM-dd HH:mm:ss");
			if ( sdt.before(now) ) {
				throw new JCException("101602", "[投注期号["+order.getIssue()+"]已过期]");
			}
			
			order.setReserved8(stopTime);//只是暂时用来存储截止时间（拆单，生成票后用来存储中心唯一标识）
		}
	}
	
	/**
	 * 投注接口实现，android，IOS，浏览器的投注皆调此方法
	 */
	@Override
	@Transactional
	public void bet(LotteryOrder order) {
		validate(order);
		
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(order.getUserid());
		
		/* 只有代购判断 */
		if ( order.getBetType().equals(LotteryOrderState.BET_TYPE_BUY ) ) {
			/*
			 * 判断用户状态及其账户状态
			 */
			Member member = this.memberMapper.selectByPrimaryKey(order.getUserid());
			if ( member.getState().intValue() != MemberState.MemberIDState.NORMAL ) {
				throw new JCException("101603", "[用户状态异常，请您联系彩站]");
			}
			if ( ma.getState().intValue() != MemberState.MemberAccountState.AVAILABLE ) {
				throw new JCException("101604", "[账户已被锁定，请您联系彩站]");
			}
		}
		
		double amountUsed = commonService.getUsedMoney(ma);
		
		/*查询最大倍数*/
		Store store = this.storeMapper.selectByPrimaryKey(order.getStoreid());
		//TODO
		String reserved4 = store.getReserved3();
		String reserved8 = store.getReserved5();
		if ( null == store.getSplitMul() || 1 >  store.getSplitMul() || 99 <  store.getSplitMul() ) {
			maxMultiple.set(99);
		} else {
			maxMultiple.set(store.getSplitMul());
		}
		/*福彩50倍*/
		if ( order.getLicenseId() == 11 || order.getLicenseId() == 12 || order.getLicenseId() == 13 ) {
			maxMultiple.set(50);
		}
		
		int storeBusiModel = CacheUtil.getCache(order.getStoreid()).getBusiModel(); // 是否有人值守
		
		/* 只有代购判断 */
		if ( order.getBetType().equals(LotteryOrderState.BET_TYPE_BUY ) ) {
			// 判断店铺状态 有人值守
			if ( storeBusiModel == 1 ) {
				//有人值守状态下，如果打开了自动店内出票，那置为店内出票等待出票  作废
				/*boolean autoTicketFlag = this.sservice.getAutomaticTicketSign(order.getStoreid()).equalsIgnoreCase(StoreConstant.AUTO_TICKET_SGIN.YES);
				boolean fcFlag = order.getLicenseId() == 11 || order.getLicenseId() == 12 || order.getLicenseId() == 13;
				if( autoTicketFlag && !fcFlag ) {
					order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORTICKET);
					order.setIsResultStatus(LotteryOrderState.IS_RESULT_STATUS_FALSE);
					order.setAutoFlag(MemberUtil.AUTO_FLAG.NO + "");
					
					// 操作cache
					CacheUtil.resetStoreWaitPrintOrder(order.getStoreid(), true);
				}*/
			} else {
				// 营业厅彩票
				if ( (LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "").equals(order.getBetState()) ) {
				}
				// 高频彩票直接由中心代出票  彩种编号100-200为高频编码 ,这个地方的描述有毛病吧？？
				//无人值守只要竞彩足球，胜负彩，任选九
				else if (  (storeBusiModel == 2 )
						&& noPersionCheck(order,reserved4,reserved8 ) && order.getBetType().equals(LotteryOrderState.BET_TYPE_BUY )) {
					order.setIsResultStatus(1);
					order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_INTHEDRAWER + "");// 订单出票中
				}
			}
		}
		/*
		 *	added for 提前截止时间，生成彩票时使用（构造函数）  at 2015/04/01
		 */
		{
			int aheadset = 0;	// 分钟
			//StoreLicense csl = this.storeLicenseMapper.selectByPrimaryKey(key);
			//StoreLicense csl = order.getStoreLicense();
			
			StoreLicenseKey key = new StoreLicenseKey();
			key.setStoreId(order.getStoreid());
			key.setLicenseId(order.getLicenseId());
			StoreLicense csl = this.storeLicenseMapper.selectByPrimaryKey(key);
			//店铺关闭了彩种
			if ( null != csl.getReserved3() && "0".equals(csl.getReserved3())) {
				throw new JCException("101600","[该彩种已经关闭投注,不能购彩]");
			}
			// 设置提前截止时间
			if ( null != csl.getBuyAheadTime() && !"".equals(csl.getBuyAheadTime()) && (storeBusiModel == 1 ) ) {
				aheadset = Integer.parseInt(csl.getBuyAheadTime());
			} else {
				try {
					StoreLicenseKey key2 = new StoreLicenseKey();
					key2.setStoreId(-1);
					key2.setLicenseId(order.getLicenseId());
					aheadset = Integer.parseInt(this.getStoreLicense(key2).getBuyAheadTime());
				} catch ( Exception ex ) {
				}
			}
			order.setAheadTime(aheadset);
			
			// 判断店内自动出票 added at 2016/10/27
			if ( storeBusiModel == 1 ) {
				//有人值守状态下，如果打开了自动店内出票，那置为店内出票等待出票
				boolean autoTicketFlag = this.sservice.getAutomaticTicketSign(order.getStoreid()).equalsIgnoreCase(StoreConstant.AUTO_TICKET_SGIN.YES);
				if( autoTicketFlag && "1".equals(csl.getReserved4()) && order.getBetType().equals(LotteryOrderState.BET_TYPE_BUY ) ) {
					order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORTICKET);
					order.setIsResultStatus(LotteryOrderState.IS_RESULT_STATUS_FALSE);
					order.setAutoFlag(MemberUtil.AUTO_FLAG.NO + "");
					
					// 操作cache
					CacheUtil.resetStoreWaitPrintOrder(order.getStoreid(), true);
				}
			}
		}
		
		/*拆单*/
		List<LotteryTicket> tickets = TicketSplitorFactory.getTicketSplitor(order.getLicenseId()).split(order);
		/*竞彩彩票排序*/
		if ( order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ ) {
			tickets = TicketMergedUtil.merge(order, tickets);
			Collections.sort(tickets, new GuessTicketComparable());
		}
		/*重新计算订单注数及其金额*/
		int totalNum = 0;
		int totalMoney = 0;
		//double bonus = 0;
		
		/*modified for 第一张票的截止时间 at 2015/05/05*/
		List<String> stopArray = new ArrayList<String>();
		for (LotteryTicket ticket : tickets) {
			totalNum += ticket.getBetNum();
			totalMoney += ticket.getBetPrice();
			stopArray.add(ticket.getStopTime());
			
			/*if ( order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ ) {
				try {
					bonus += Double.valueOf(ticket.getReserved17());
				} catch ( Exception e ) {}
			}*/
		}
		/*if ( (order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ) && "0".equals(order.getSingleFlag()) ) {
			order.setTheoryBonus(bonus);
		}*/
		
		Collections.sort(stopArray);
		order.setReserved13(stopArray.get(0));// 订单的截止时间
		//无人值守，判断中心接单的时间，根据订单的截止时间判断
		if (  (storeBusiModel == 2 )
				&& noPersionCheck(order,reserved4,reserved8)/*((order.getLicenseId() == Constants.LICENSE_JCZQ && !("10").equals(order.getPlayType())) 
						|| order.getLicenseId() == Constants.LICENSE_14SFC 
						|| order.getLicenseId() == Constants.LICENSE_R9)*/) {
			validateDateOut(order, stopArray.get(0));
		}
		order.setBetPrice(totalMoney);
		order.setTicketTotalNum(tickets.size());	// 订单总票数
		order.setOrderDate(DateUtil.getDateFormat2());
		
		//String reserved4 = store.getReserved3();
		//String reserved8 = store.getReserved5();
		order.setReserved4(reserved4);
		order.setReserved8(reserved8);//出票中心唯一标识
		
		/*订单入库*/
		order.setSchInfo(null);
		order.setReserved5(null);
		
		this.lotteryOrderMapper.insert(order);
		order.setId((int)this.lotteryOrderMapper.selectLastSeq());
		
		/* 只有代购判断 */
		if ( order.getBetType().equals(LotteryOrderState.BET_TYPE_BUY ) ) {
			// 判断店铺状态 有人值守
			if ( storeBusiModel == 1 ) {
			} else {
				// 营业厅彩票
				if ( (LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "").equals(order.getBetState()) ) {
				}
				// 高频彩票直接由中心代出票  彩种编号100-200为高频编码
				else if (  (storeBusiModel == 2 )
						&& noPersionCheck(order,reserved4,reserved8)/*((order.getLicenseId() == Constants.LICENSE_JCZQ && !("10").equals(order.getPlayType())) 
								|| order.getLicenseId() == Constants.LICENSE_14SFC 
								|| order.getLicenseId() == Constants.LICENSE_R9)*/) {
					StoreAccount sa = this.storeAccountMapper.selectByPrimaryKey(order.getStoreid());
					double frozeM = sa.getFrozenAccount();
					if ( frozeM < 0 ) {
						throw new BaseException("[店铺资金账户异常，请联系店铺]");
					}
					double saBalance = sa.getPrintAccount() + sa.getGiveAccount() - frozeM;
					/* 店铺账户不够支付中心 */
					if ( totalMoney > saBalance ) {
						throw new JCException("101607","[店铺出票款不足，为了保证及时出票，请联系店主及时充值到出票中心]");
					}
					
					// 扣店主账户款
					StoreAccount updateSa = new StoreAccount();
					updateSa.setStoreId(sa.getStoreId());
					updateSa.setVision(sa.getVision());
					/*扣款 ,先扣除红包，再扣除账户余额*/
					if ( sa.getGiveAccount() > totalMoney ) {
						/*只扣红包*/
						updateSa.setGiveAccount(sa.getGiveAccount()-totalMoney);
					} else {
						/*扣完红包，再扣账户余额*/
						double ownPay = (double)totalMoney - sa.getGiveAccount();
						updateSa.setGiveAccount(0d);
						updateSa.setPrintAccount(sa.getPrintAccount()-ownPay);
					}
					
					/*记交易日志*/
					StoreMoneyLog mml = this.commonService.newInstanceStoreMoneyLog(order.getStoreid(), (double)totalMoney, 
							sa.getPrintAccount() + sa.getGiveAccount() - totalMoney - frozeM, MemberUtil.ACCESS_ACCOUNT_TYPE.OUTOFF, 
							StoreConstant.STORE_ACCOUNT_CHANGE_TYPE.DEBIT, StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.DEBIT_BEHALF_TICKET, 
							order.getId()+"", "中心代出票扣款，订单："+order.getId());
					this.storeMoneyLogMapper.insert(mml);
					
					int result = this.storeAccountMapper.updateStoreAccountByStoreIdAndVision(updateSa);
					if ( 0 == result ) {
						throw new JCException("101605", "[交易异常，请重新操作]");
					}
				}
			}
			/*判断余额是否足够*/
			if ( totalMoney > amountUsed ) {
				throw new JCException("101606", "[可用余额不够支付订单，请先充值]");
			}
		}
		
		/*彩票加入订单号和序号,彩票入库*/
		int seq = 1;
		int startpos = 1, endpos = 1, tlen = tickets.size();
		String playType = tickets.get(0).getPlayType().split("-")[0];
		String printFiles = "";
		for ( LotteryTicket ticket : tickets ) {
			//彩票所属出票中心-ZLP
			ticket.setReserved4(reserved4);
			ticket.setReserved8(reserved8);//出票中心唯一标识
			ticket.setOrderId(order.getId());
			ticket.setTicketId(seq++);
			ticket.setReserved2(this.commonService.createTicketUniIndex(order.getId(), ticket.getTicketId()));
			if ( !playType.equals(ticket.getPlayType().split("-")[0]) || (endpos - startpos >= SIM_FILE_MAX) ) {
				printFiles += ticket.getUsername()+"_"+order.getId()+"_"+
						GameUtil.getGameName(ticket.getLicenseId(), playType, 2)+"_"+startpos+"_"+(endpos-1)+"_"+playType+".txt,";
				startpos = endpos;
				playType = ticket.getPlayType().split("-")[0];
			}
			if ( endpos == tlen ) {
				printFiles += ticket.getUsername()+"_"+order.getId()+"_"+
				GameUtil.getGameName(ticket.getLicenseId(), playType, 2)+"_"+startpos+"_"+endpos+"_"+playType+".txt,";
			}
			endpos++;
			
		}
		this.lotteryTicketMapper.insertBatch(tickets);
		order.setReserved14(printFiles.substring(0, printFiles.length()-1));// 打印文件列表\
		if ( order.getReserved14().length() > 250 ) {
			order.setReserved14(order.getReserved14().substring(0, 250));
		}
		this.lotteryOrderMapper.setSimFiles(order);
		
		/* 只有代购扣款，追号、合买在追号/合买中扣 */
		if ( order.getBetType().equals(LotteryOrderState.BET_TYPE_BUY ) ) {
			/*记交易日志*/
			MemberMoneyLog mml = this.commonService.newInstanceMemberMoneyLog(order.getStoreid(), 
					order.getUserid(), (double)totalMoney, this.commonService.getUsedMoney(ma) - totalMoney, 
					MemberUtil.ACCESS_ACCOUNT_TYPE.OUTOFF, MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.LOTTERY, 
					MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.PURCHASING_BETTING, order.getId()+"", 
					"代购支付，订单：<a href=/memberCenterNew/orderDetail.jhtml?orderId="+order.getId()+"&LicenseId="+order.getLicenseId()+">"+order.getId()+"</a>");
			this.memberMoneyLogMapper.insert(mml);
			
			this.commonService.operateMemberAccount(ma, totalMoney);
			int result = this.memberAccountMapper.updateAccount2Bet(ma);
			if ( 0 == result ) {
				throw new JCException("101605", "[交易异常，请重新操作]");
			}
			
			// 未出票订单
			if ( LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION.equals(order.getBetState()) ) {
				CacheUtil.setStoreWaitOrderNum(order.getStoreid(), 1, true);
				try {
					//新版店主后台更改缓存对象
					int updateCacheType = order.getMemberFrom().intValue() == MemberConstant.REGISTER_FROM.BOFFICE.intValue() ?
							StoreInfoCache.StoreWaitOrderNum.WAIT_NUM_NOTICKET_BHALL:StoreInfoCache.StoreWaitOrderNum.WAIT_NUM_NOTICKET_STORE;		
					//新版店主后台更改缓存对象
					StoreInfoCache.updateWaitNumByType(SYS_TYPE.O2O,order.getStoreid(),updateCacheType,true);
					
					if(updateCacheType == 1){//只有网店用户才做统计
						Store st = storeMapper.selectByPrimaryKey(order.getStoreid());//获取店铺信息(统计时需要店铺名称)。
						//更改统计（下单总金额）
						cytxcservice.cytxUpdateStatis(order.getUserid(), order.getUsername(), order.getStoreid(), st.getStoreName(),
								UpdateStatisTypes.MEMBER_BET, order, totalMoney+0d);
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		// 被复制方案更新复制次数
		if ( "1".equals(order.getReserved17()) ) {
			LotteryOrder copyedOrder = this.lotteryOrderMapper.selectByPrimaryKey(Integer.valueOf(order.getReserved18()));
			if ( null == copyedOrder.getReserved19() ) {
				copyedOrder.setReserved19("1");
			} else {
				copyedOrder.setReserved19((Integer.valueOf(order.getReserved19())+1)+"");
			}
			this.lotteryOrderMapper.addCopyNum(copyedOrder);
		}
		
		// 投注统计
		this.commonService.setStatisticsInfo(order);
	}
	
	/**
	 * 数字彩种复制号码投注到当前期
	 */
	@Override
	@Transactional
	public void copyMathOrder2Bet(Member m, Integer orderId, Integer multiple) {
		LotteryOrder order = this.lotteryOrderMapper.selectByPrimaryKey(orderId);
		if ( m.getId().intValue() != order.getUserid() ) {
			throw new BaseException("[参数错误，订单号不存在]");
		}
		if ( null != multiple && multiple > 0 ) {
			order.setMultiple(multiple);	
		}
		
		Game g = this.getCurrentGame(order.getLicenseId(), 0);
		order.setIssue(g.getIssue());
		order.setBetState("2");
		order.setBetType("1");
		order.setReserved18(orderId+"");// 被复制方案号
		order.setInitBonus(0d);
		order.setFiniBonus(0d);
		
		this.bet(order);
	}
	
	/**
	 * <p>Desc: 彩票拆分</p>
	 */
	public static abstract class TicketSplitor {
		
		protected int singleTicketLimit = 5;	// 单式票一票5注
		
		/**
		 * 拆票方法
		 * @param order，投注单
		 * @param maxMultiple，最大倍数，店主设置，不设置的情况下体彩彩种99，福彩50
		 * @return 彩票列表
		 */
		public abstract List<LotteryTicket> split(LotteryOrder order);
		
		/**
		 * 生成单式票
		 * @param order,订单
		 * @param retList，返回list
		 * @param singleList，单式串列表
		 * @param singleTicketLimit，一注的最大注数
		 * @param listIndex，索引
		 */
		public void createSingleTicket(LotteryOrder order, List<LotteryTicket> retList, List<String> singleList, int loop, int singleTicketLimit, int listIndex, String playType) {
			int maxMult = maxMultiple.get();
			int multiple = order.getMultiple();
			
			String singleCode = "";
			for ( int j = 0; j < loop; j++ ) {
				singleCode += singleList.get(listIndex * singleTicketLimit + j) + ";";
			}
			singleCode = singleCode.substring(0, singleCode.length() - 1);
			
			// 拆分倍数
			int multLoop = multiple / maxMult;
			int multMod = multiple % maxMult;
			for ( int j = 0; j < multLoop; j++ ) {
				// 生成一张票
				retList.add(new LotteryTicket(order, playType, singleCode, loop, null, maxMult));
			}
			if ( multMod != 0 ) {
				// 生成一张票
				retList.add(new LotteryTicket(order, playType, singleCode, loop, null, multMod));
			}
		}
		
		/**
		 * 生成复式票
		 * @param order
		 * @param retList
		 * @param complex
		 * @param betNum
		 * @param playType
		 */
		public void createComplexTicket(LotteryOrder order, List<LotteryTicket> retList, String complex, int betNum, String playType) {
			int multiple = order.getMultiple();
			
			int _maxMult = maxMultiple.get();
			while ( _maxMult > 0 ) {
				if ( betNum * _maxMult * 2 <= 20000 ) {
					break;
				}
				_maxMult--;
			}
			if ( _maxMult >= multiple ) {
				// 生成一张票
				retList.add(new LotteryTicket(order, playType, complex, betNum, null, multiple));
			} else {
				int loop =  multiple / _maxMult ;
				int mod = multiple % _maxMult;
				for ( int i = 0; i < loop; i++ ) {
					// 生成一张票
					retList.add(new LotteryTicket(order, playType, complex, betNum, null, _maxMult));
				}
				if ( mod != 0 ) {
					// 生成一张票
					retList.add(new LotteryTicket(order, playType, complex, betNum, null, mod));
				}
			}
		}
		
		/**
		 * 数字判断方法
		 * @param sn
		 * @return
		 */
		public boolean isNumber(String sn) {
			boolean number = true;
			try {
				Integer.parseInt(sn);
			} catch ( Exception ex ) {
				number = false;
			}
			return number;
		}
		
		/**
		 * 数字彩（排3，排5，七星彩，3D）排列型单式/复式判断
		 * @param betCode,格式：12,3,34
		 * @return
		 */
		public boolean isNumberArrangleDsString(String betCode) {
			boolean result = true;
			String[] codes = betCode.split(",");
			for ( String code : codes ) {
				if ( !isNumber(code) ) {
					throw new BaseException("存在非法号码");
				}
				if ( code.length() > 1 ) {
					result = false;
					break;
				}
			}
			return result;
		}
		
		/**
		 * 数字彩排列型单式/复式判断
		 * @param betCode,格式：1,2|3|3,4
		 * @return
		 */
		public boolean isNumberArrangleDsString2(String betCode) {
			boolean result = true;
			String[] codes = betCode.split("\\|");
			for ( String code : codes ) {
				if ( code.split(",").length > 1 ) {
					result = false;
					break;
				}
			}
			return result;
		}
		
		/**
		 * 数字彩（排3，排5，七星彩，3D）排列型注数计算
		 * @param betCode,格式：12,3,34
		 * @return
		 */
		public int calcNumberArrangleDsString(String betCode) {
			int result = 1;
			String[] codes = betCode.split(",");
			for ( String code : codes ) {
				result *= code.length();
			}
			return result;
		}
		
		/**
		 * 数字彩（排3，排5，七星彩，3D）排列型注数计算
		 * @param betCode,格式：12,3,34
		 * @return
		 */
		public int calcNumberArrangleDsString2(String betCode) {
			int result = 1;
			String[] codes = betCode.split("\\|");
			for ( String code : codes ) {
				result *= code.split(",").length;
			}
			return result;
		}
	}
	
	/**
	 * <p>Desc: 号码校验器</p>
	 */
	public static abstract class CodeValidator {
		
		public abstract boolean valiedate(LotteryOrder order);
		
		/**
		 * 重新排序
		 * @param betCode
		 * @return
		 */
		public String sortBetCode(String betCode) {
			String[] splitCode = betCode.split(",");
			Arrays.sort(splitCode);
			String retObj = "";
			for ( String s : splitCode) {
				retObj += s + ",";
			}
			retObj = retObj.substring(0, retObj.length() - 1);
			return retObj;
		}
		
		/**
		 * 排列型(玩法)数字彩号码校验,0-9号码
		 * @param order
		 * @param len, 排三值为3，排五值为5，七星彩值为7
		 * @return
		 */
		public boolean validateNumberArrangle(LotteryOrder order, int len) {
			String[] betCodes = order.getBetCode().split(";");
			for ( String betCode : betCodes ) {
				String[] codes = betCode.split(",");
				if ( codes.length != len ) 
					return false;
				for ( String code : codes ) {
					char[] chs = code.toCharArray();
					for ( char c : chs ) {
						if ( c < 48 || c > 57 ) 
							return false;
					}
				}
			}
			return true;
		}
		
		/**
		 * 判断字符串是否为数字
		 * @param string
		 * @return
		 */
		public boolean isNumber(String string) {
			boolean retObj = true;
			try {
				Integer.parseInt(string);
			} catch ( Exception ex ) {
				retObj = false;
			}
			return retObj;
		}
	}
	
	/**
	 * <p>Desc: 号码校验工厂</p>
	 */
	public static class CodeValidatorFactory {
		private static Map<Integer, CodeValidator> map = new ConcurrentHashMap<Integer, CodeValidator>();
		static {
			map.put(Constants.LICENSE_DLT, new DltCodeValidator());
			map.put(Constants.LICENSE_PLS, new PlsCodeValidator());
		}
		
		public static boolean validate(LotteryOrder order) {
			boolean result = true;
			CodeValidator cv = map.get(order.getLicenseId());
			if ( null != cv ) {
				result = cv.valiedate(order);
			}
			return result;
		}
	}
	
	/**
	 * <p>Desc: 彩票拆分工厂</p>
	 */
	public static class TicketSplitorFactory {
		private static Map<Integer, TicketSplitor> map = new ConcurrentHashMap<Integer, TicketSplitor>();
		static {
			TicketSplitor pl3Ts = new Pl3TicketSplitor();
			map.put(Constants.LICENSE_PLS, pl3Ts);
			map.put(Constants.LICENSE_PLW, new Pl5TicketSplitor());
			map.put(Constants.LICENSE_QXC, new QxcTicketSplitor());
			map.put(Constants.LICENSE_LJY, new QxcTicketSplitor());
			map.put(Constants.LICENSE_20X5, new C20x5TicketSplitor());
			map.put(Constants.LICENSE_DLT, new DltTicketSplitor());
			TicketSplitor zcTs = new FootballSfcTicketSplitor();
			map.put(Constants.LICENSE_14SFC, zcTs);
			map.put(Constants.LICENSE_R9, zcTs);
			map.put(Constants.LICENSE_6CBQ, zcTs);
			map.put(Constants.LICENSE_4JQ, zcTs);
			TicketSplitor guessTs = new GuessFootballTicketSplitor();
			map.put(Constants.LICENSE_JCZQ, guessTs);
			map.put(Constants.LICENSE_JCLQ, guessTs);
			map.put(Constants.LICENSE_SFGG, new SfGgTicketSplitor());
			map.put(Constants.LICENSE_BJDC, new BjDcTicketSplitor());
			map.put(Constants.LICENSE_SSQ, new SsqTicketSplitor());
			map.put(Constants.LICENSE_3D, pl3Ts);
			map.put(Constants.LICENSE_QLC, new QlcTicketSplitor());
			map.put(FreqLicenseId.LICENSE_FREQ_SD11X5, new C11x5TicketSplitor());	// 所有的11选5都转换成101
			map.put(FreqLicenseId.LICENSE_FREQ_HNXYSC, new LuckyRacingTicketSplitor());
			map.put(FreqLicenseId.LICENSE_FREQ_JXSSC, new SscTicketSplitor());
			
			map.put(Constants.LICENSE_FJ31X7, new Fj31x7TicketSplitor());
			
			map.put(FreqLicenseId.LICENSE_FREQ_CQKL10, new Kl10TicketSplitor());	
		}
		
		/**
		 * 取得对应彩种的拆分器
		 * @param licenseId
		 * @return
		 */
		public static TicketSplitor getTicketSplitor(Integer licenseId) {
			if ( licenseId > 100 && licenseId < 200 ) {
				licenseId = FreqLicenseId.LICENSE_FREQ_SD11X5;	// 11选5的彩种都使用山东11选5拆分
			}
			if ( licenseId > 500 && licenseId < 600 ) {
				licenseId = FreqLicenseId.LICENSE_FREQ_CQKL10;	
			}
			return map.get(licenseId);
		}
	}
	
	/**
	 * <p>Desc: 竞彩彩票排序</p>
	 */
	public static class GuessTicketComparable implements Comparator<LotteryTicket> {
		// 对象的排序方式[升、降]   
	    public static boolean sortASC = true;   
	  
		@Override
		public int compare(LotteryTicket lt1, LotteryTicket lt2) {
			int result = 0;   
			String type1 = (String)lt1.getPlayType();   
	        String type2 = (String)lt2.getPlayType(); 
	        if(sortASC){   
	            result = type1.compareTo(type2);   
	        }else{   
	        	result = -type1.compareTo(type2);   
	        }   
	        return result;   
		}   
	}
	
	private boolean noPersionCheck(LotteryOrder order,String reserved4,String reserved8){
		//陕西中心
		if ("4199".equals(reserved4) && "10030".equals(reserved8) &&
			((order.getLicenseId().intValue() == 9 && !("10").equals(order.getPlayType())) || 
			 order.getLicenseId().intValue() == 5 || 
			 order.getLicenseId().intValue() == 6)) {
			return true;
		}
		//体彩全彩种中心
		if ("4434".equals(reserved4) && "10031".equals(reserved8) &&
				(order.getLicenseId().intValue() == 1 || 
				order.getLicenseId().intValue() == 2 || 
				order.getLicenseId().intValue() == 3 || 
				order.getLicenseId().intValue() == 4 || 
				order.getLicenseId().intValue() == 5 || 
				order.getLicenseId().intValue() == 6 || 
				order.getLicenseId().intValue() == 7 || 
				order.getLicenseId().intValue() == 8 || 
				(order.getLicenseId().intValue() == 9  && !("10").equals(order.getPlayType()))|| 
				order.getLicenseId().intValue() == 10)) {
				return true;//中心暂不支持该彩种
			}else{
				return false;
			}
	}
}
