/**
 * 
 */
package com.jingc.busi.merger.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

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
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MemberMoneyLogMapper;
import com.jingc.busi.common.mapper.MergerCustomLogMapper;
import com.jingc.busi.common.mapper.MergerCustomMapper;
import com.jingc.busi.common.mapper.MergerJoinMapper;
import com.jingc.busi.common.mapper.MergerOrderMapper;
import com.jingc.busi.common.mapper.StoreLicenseMapper;
import com.jingc.busi.common.mapper.StoreMapper;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MergerCustom;
import com.jingc.busi.common.table.MergerCustomLog;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;
import com.jingc.busi.core.service.CommonService;
import com.jingc.busi.freq.FreqPeriod;
import com.jingc.busi.freq.FreqPeriodFactory;
import com.jingc.busi.lottery.service.LotteryService;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.GuessTicketComparable;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitorFactory;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.LotteryTicketState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: MergerServiceImpl.java</p>
 * <p>Desc: 合买业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("mergerService")
public class MergerServiceImpl implements MergerService {
	
	@Resource private MemberMapper memberMapper;
	@Resource private MemberAccountMapper memberAccountMapper;
	@Resource private MergerOrderMapper mergerOrderMapper;
	@Resource private LotteryOrderMapper lotteryOrderMapper;
	@Resource private LotteryTicketMapper lotteryTicketMapper;
	@Resource private StoreMapper storeMapper;
	@Resource private MemberMoneyLogMapper memberMoneyLogMapper;
	@Resource private MergerJoinMapper mergerJoinMapper;
	@Resource private StoreLicenseMapper storeLicenseMapper;
	@Resource private MergerCustomMapper mergerCustomMapper;	// 跟单信息表
	@Resource private MergerCustomLogMapper mergerCustomLogMapper; // 跟单记录
	
	@Resource private LotteryService lotteryService;
	@Resource private CommonService commonService;
	
	/**
	 * 1、判断剩余份数是否足够
	 * 2、生成一条参与合买记录
	 * 3、更新合买表已够买份数
	 * 4、不是保底的参与记录交易日志
	 * 如果方案未上传，不能购买超过80%
	 * 
	 * <notice> 同一条订单同时只允许一个人参与合买  modified by luochang at 2015/03/25 </notice>
	 */
	@Override
	@Transactional
	public void joinMerger(MergerJoin mj, boolean isEndJoin) {
		MergerOrder order = this.mergerOrderMapper.selectByPrimaryKey(mj.getOrderId());
		if ( (MergerOrder.STATE_REMOVED+"").equals(order.getState()) ) {
			throw new BaseException("订单已撤销");
		}
		if ( mj.getJoinNum() < 1 ) {
			throw new BaseException("参与份数错误");
		}
		if ( order.getStoreid().intValue() != mj.getStoreid() ) {
			throw new BaseException("您不是该店铺的彩民，不能参与合买");
		}
		if ( null != order.getReserved2() ) {
			Date nt = new Date(); 
			String stopTime = order.getReserved2();
			if ( stopTime.length() == 16 ) {
				stopTime = stopTime + ":00"; 
			}
			Date st = DateUtil.getDate(stopTime, "yyyy-MM-dd HH:mm:ss");
			if ( st.getTime() - nt.getTime() < 0 ) {
				throw new BaseException("已到方案截止时间，不能参与合买");
			}
		}
		LotteryOrder lo = this.lotteryOrderMapper.selectByPartnerNo(order.getId());
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(mj.getJoinUserid());
		// 发起人账户可用资金
		double amountUsed = this.commonService.getUsedMoney(ma);//ma.getMoneyAccount() + ma.getGivenAccount() - ma.getFrozenAccount();
		int perMoney = lo.getBetPrice() / order.getTotalNum();
		// 认购的总额加上保底的总额是否足够发起订单
		if ( perMoney * mj.getJoinNum() > amountUsed ) {
			throw new BaseException("账户可用资金不够发起订单");
		}
		int buyNumForUpdate = order.getBuyNum() + mj.getJoinNum();
		if ( buyNumForUpdate > order.getTotalNum() ) {
			throw new BaseException("购买份数大于订单总份数");
		}
		mj.setJoinDate(DateUtil.getDateFormat2());
		this.mergerJoinMapper.insert(mj);
		
		String state = MergerOrder.STATE_NO_FILLED + "";
		int result = this.mergerOrderMapper.updateBuyNumAndState(mj.getOrderId(), buyNumForUpdate, order.getBuyNum(), state, MergerOrder.STATE_NO_FILLED + "");
		if ( 0 == result ) {
			throw new BaseException("合买已到不可购买状态");
		}
		logTx(mj.getJoinUserid(), order, perMoney * mj.getJoinNum(), "参与合买支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+order.getId()+">"+mj.getOrderId()+"</a>");
	}

	/**
	 * 1、发起人发起的同时发起人认购的份数也加入到参与表中
	 * 2、到时间合买不够份数，扣除发起人保底的份数时候，除了把钱返还给发起人之外，还需把实际的保底份数加入到合买参与表中
	 * 3、分配奖金的时候都是从参与表中分配
	 * 4、生成订单的同时生成投注单
	 * 5、发起人记录保底的交易记录
	 */
	@Override
	@Transactional
	public void merger(MergerOrder order) {
		/*if(!CacheUtil.getStoreOpenState(order.getStoreid()).equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString())){
			throw new JCException("101600","[店铺已打烊,不能购彩]");
		}*/
		
		/*Store cacheStore = (Store)StoreInfoCache.getInfoObject(SYS_TYPE.O2O,order.getStoreid(), StoreInfoCache.TYPE_STORE_INFO);
		if (!cacheStore.getOpeningState().equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString()) ) {
			throw new JCException("101600","[店铺已打烊,不能购彩]");
		}*/
		
		if((!CacheUtil.getStoreOpenState(order.getStoreid()).equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString())) ){
			String info = "[店铺已打烊,不能购彩]";
			try {
				info = HttpUtil.doGet("http://wangdian.cp020.com/www/data/store/STOREID_"+order.getStoreid()+"/INFO_CATEGORY/CLOSING_BULLETIN/closeing_bulletin.js", "utf-8");
				info = info.substring(info.indexOf("content") + 10, info.indexOf("}];")-1);
			} catch (Exception e) {
			}
			throw new JCException("101600",info);
		}
		
		if ( order.getLaunchNum() < 0 ) {
			throw new BaseException("发起份数不能为负数");
		}
		if ( null != order.getInsNum() && order.getInsNum() < 0 ) {
			throw new BaseException("保底份数不能为负数");
		}
		if ( order.getLaunchNum().intValue() > order.getTotalNum() ) {
			throw new BaseException("认购份数大于总份数");
		}
		// 先拆单，算出总金额
		/*查询最大倍数*/
		Store store = this.storeMapper.selectByPrimaryKey(order.getStoreid());
		if ( null == store.getSplitMul() || 0 == store.getSplitMul() ) {
			LotteryServiceImpl.maxMultiple.set(99);
		} else {
			LotteryServiceImpl.maxMultiple.set(store.getSplitMul());
		}
		/*福彩50倍*/
		if ( order.getLicenseId() == 11 || order.getLicenseId() == 12 || order.getLicenseId() == 13 ) {
			LotteryServiceImpl.maxMultiple.set(50);
		}
		/* 非竞彩票从数据库中查询截止时间 modified at 2015/04/19 */
		if ( order.getLicenseId() != Constants.LICENSE_JCZQ && order.getLicenseId() != Constants.LICENSE_JCLQ && order.getLicenseId() != Constants.LICENSE_SFGG
				&& order.getLicenseId() != Constants.LICENSE_BJDC) {
			String stopTime = null;
			if ( order.getLicenseId() < 100 ) {
				Integer licenseId = order.getLicenseId();
				if ( licenseId == Constants.LICENSE_R9 ) {
					licenseId = Constants.LICENSE_14SFC;
				}
				Game g = this.lotteryService.getOneGame(licenseId, order.getIssue());
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
			order.setReserved8(stopTime);
		} else {
			order.setReserved8("");
		}
		
		order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"");
		List<LotteryTicket> tickets = TicketSplitorFactory.getTicketSplitor(order.getLicenseId()).split(order);
		/*竞彩彩票排序*/
		if ( order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ ) {
			Collections.sort(tickets, new GuessTicketComparable());
		}
		/*重新计算订单注数及其金额*/
		int totalNum = 0;
		int totalMoney = 0;
		List<String> stopArray = new ArrayList<String>();
		for (LotteryTicket ticket : tickets) {
			totalNum += ticket.getBetNum();
			totalMoney += ticket.getBetPrice();
			stopArray.add(ticket.getStopTime());
		}
		// 每一份的钱
		if ( totalMoney % order.getTotalNum() != 0 ) {
			throw new BaseException("总份数跟总金额不成倍数关系");
		}
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(order.getUserid());
		// 发起人账户可用资金
		double amountUsed = this.commonService.getUsedMoney(ma);//ma.getMoneyAccount() + ma.getGivenAccount() - ma.getFrozenAccount();
		int perMoney = totalMoney / order.getTotalNum();
		
		if ( null == order.getLaunchNum() ) {
			order.setLaunchNum(0);
		}
		if ( null == order.getInsNum() ) {
			order.setInsNum(0);
		}
		// 认购的总额加上保底的总额是否足够发起订单
		if ( (perMoney * order.getLaunchNum() + perMoney * order.getInsNum()) > amountUsed ) {
			throw new BaseException("账户可用资金不够发起订单");
		}
		if ( order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ ) {
			Collections.sort(stopArray);
		}
		String stTime = stopArray.get(0);
		{
			// 截止时间判断
			if ( stTime.length() == 16 ) {
				stTime += ":00";
			} else if ( stTime.length() == 15 ) {
				String[] ssT = stTime.split(":");
				stTime = ssT[0] + ":0" + ssT[1]+":00";
			} 
			order.setReserved13(stTime);
			int aheadset = 0;	// 分钟
			StoreLicenseKey key = new StoreLicenseKey();
			key.setStoreId(order.getStoreid());
			key.setLicenseId(order.getLicenseId());
			StoreLicense csl = this.storeLicenseMapper.selectByPrimaryKey(key);
			// 设置合买提前截止时间
			if ( null != csl.getCoopAheadTime() && !"".equals(csl.getCoopAheadTime()) ) {
				aheadset = Integer.parseInt(csl.getCoopAheadTime());
			} else {
				try {
					key.setStoreId(-1);
					key.setLicenseId(order.getLicenseId());
					aheadset = Integer.parseInt(this.storeLicenseMapper.selectByPrimaryKey(key).getCoopAheadTime());
				} catch ( Exception ex ) {
				}
			}
			Date date = null;
			// 加上提前截止时间 at 2015/04/01
			if ( order.getLicenseId() > 100 ) {
				date = DateUtil.getDate(stTime, "yyyy-MM-dd HH:mm:ss");
			} else {
				date = DateUtil.getDayMiniteBefore("yyyy-MM-dd HH:mm:ss", stTime, aheadset+MergerOrder.COOP_COMM_AHEAD);
			}
			if ( date.before(new Date()) ) {
				throw new BaseException("您选择的方案已不能发起合买，请重新选择方案");
			}
			stTime = DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", date);
			
		}
		order.setReserved2(stTime);// 订单的截止时间
		order.setBuyNum(order.getLaunchNum());
		order.setState(MergerOrder.STATE_NO_FILLED+"");
		if ( order.getLaunchNum() == order.getTotalNum() ) {
			//order.setState(MergerOrder.STATE_FILLED+"");
		}
		this.mergerOrderMapper.insert(order);
		int orderId = (int)this.mergerOrderMapper.selectLastSeq();
		order.setId(orderId);
		
		// 保底交易日志
		if ( order.getInsNum() > 0 ) {
			logTx(order.getUserid(), order, order.getInsNum()*perMoney, "合买保底支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+orderId+">"+orderId+"</a>");
		}
		
		// 生成合买参与记录
		if ( order.getLaunchNum() > 0 ) {
			MergerJoin mj = this.commonService.newInstanceMergerJoin(order.getUserid(), order.getUsername(), 
					orderId, order.getLaunchNum(), (double)perMoney * order.getLaunchNum());
			int result = this.mergerJoinMapper.insert(mj);
			if ( 0 == result ) {
				throw new BaseException("生成参与合买信息失败");
			}
			logTx(order.getUserid(), order, order.getLaunchNum()*perMoney, "参与合买支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+orderId+">"+orderId+"</a>");
		}
		
		order.setPartnerNo(orderId);
		order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"");
		//order.setBetNum(totalNum);
		order.setBetPrice(totalMoney);
		order.setTicketTotalNum(tickets.size());	// 订单总票数
		order.setOrderDate(DateUtil.getDateFormat2());
		order.setReserved2(null);// 订单的截止时间
		//订单的出票中心归属,wanghpgary 141126
		String reserved4 = store.getReserved3();
		String reserved8 = store.getReserved5();
		order.setReserved4(reserved4);
		order.setReserved8(reserved8);//出票中心唯一标识
		
		order.setSchInfo(null);
		order.setReserved5(null);
		// 插入代购订单表
		this.lotteryOrderMapper.insert(order);
		int oId = (int)this.lotteryOrderMapper.selectLastSeq();
		order.setReserved19(oId+"");
		
		int startpos = 1, endpos = 1, tlen = tickets.size();
		String playType = tickets.get(0).getPlayType().split("-")[0];
		String printFiles = "";
		/*彩票加入订单号和序号*/
		int seq = 1;
		for ( LotteryTicket ticket : tickets ) {
			ticket.setOrderId(oId);
			ticket.setTicketId(seq++);
			//订单的出票中心归属,wanghpgary 141126
			ticket.setReserved4(reserved4);
			ticket.setReserved8(reserved8);//出票中心唯一标识
			ticket.setReserved2(this.commonService.createTicketUniIndex(oId, ticket.getTicketId()));
			
			if ( !playType.equals(ticket.getPlayType().split("-")[0]) || (endpos - startpos > LotteryServiceImpl.SIM_FILE_MAX) ) {
				printFiles += ticket.getUsername()+"_"+oId+"_"+
						GameUtil.getGameName(ticket.getLicenseId(), playType, 2)+"_"+startpos+"_"+(endpos-1)+"_"+playType+".txt,";
				startpos = endpos;
				playType = ticket.getPlayType().split("-")[0];
			}
			
			if ( endpos == tlen ) {
				printFiles += ticket.getUsername()+"_"+oId+"_"+
				GameUtil.getGameName(ticket.getLicenseId(), playType, 2)+"_"+startpos+"_"+endpos+"_"+playType+".txt,";
			}
			endpos++;
		}
		
		/*彩票入库*/
		this.lotteryTicketMapper.insertBatch(tickets);
		
		order.setReserved20((perMoney * order.getLaunchNum() + perMoney * order.getInsNum()) + "");//消费金额，回显使用
		
		// 自动跟单操作
		customed(order);
		{
			LotteryOrder updateObj = new LotteryOrder();
			updateObj.setReserved14(printFiles.substring(0, printFiles.length()-1));
			updateObj.setId(oId);
			this.lotteryOrderMapper.setSimFiles(updateObj);
		} 
	}
	
	/**
	 * 跟单
	 */
	@Transactional
	private void customed(MergerOrder order) {
	
		// 查询定制的跟单信息
		List<MergerCustom> list = this.mergerCustomMapper.selectList2Order(order.getUserid(), order.getLicenseId());
		int lastNum = order.getTotalNum() - order.getLaunchNum();
		for ( MergerCustom c : list ) {
			if ( lastNum == 0 ) {
				break;
			}
			int money = 0;
			if ( c.getCustomMode() == 1 ) {
				money = c.getFixedCusMoney().intValue();
			} else {
				money = (int)(order.getTotalNum().doubleValue() * c.getCusProp());
				if ( money == 0 ) {
					money = 1;
				}
			}
			if ( lastNum < money ) {
				money = lastNum;
			}
			MemberAccount m = this.memberAccountMapper.selectByPrimaryKey(c.getCustomizingMemberId());
			double mUsed = this.commonService.getUsedMoney(m);
			if ( money > mUsed ) {
				// 生成跟单日志
				{
					MergerCustomLog log = new MergerCustomLog();
					log.setCustomId(c.getId());
					log.setMemberId(c.getCustomizingMemberId());
					log.setOrderId(order.getId());
					log.setStoreId(order.getStoreid());
					log.setLicenseId(order.getLicenseId());
					log.setIssue(order.getIssue());
					log.setMoney(money*1d);
					log.setOrdDate(DateUtil.getDateFormat2());
					log.setState(2);
					log.setMemo("跟单失败，账户可用金额不足，可用金额："+mUsed+"，单号：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+order.getId()+">"+order.getId()+"</a>");
					this.mergerCustomLogMapper.insert(log);
				}
				continue;// 跟单失败
			}
			// 生成合买参与记录
			{
				MergerJoin mj = this.commonService.newInstanceMergerJoin(c.getCustomizingMemberId(), this.memberMapper.selectByPrimaryKey(c.getCustomizingMemberId()).getMemberName(), 
						order.getId(), money, money*1d);
				int result = this.mergerJoinMapper.insert(mj);
				if ( 0 == result ) {
					throw new BaseException("生成参与合买信息失败");
				}
				logTx(c.getCustomizingMemberId(), order, money, "跟单支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+order.getId()+">"+order.getId()+"</a>");
			}
			// 生成跟单日志
			{
				MergerCustomLog log = new MergerCustomLog();
				log.setCustomId(c.getId());
				log.setMemberId(c.getCustomizingMemberId());
				log.setOrderId(order.getId());
				log.setStoreId(order.getStoreid());
				log.setLicenseId(order.getLicenseId());
				log.setIssue(order.getIssue());
				log.setMoney(money*1d);
				log.setOrdDate(DateUtil.getDateFormat2());
				log.setState(1);
				log.setMemo("跟单成功，单号：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+order.getId()+">"+order.getId()+"</a>");
				this.mergerCustomLogMapper.insert(log);
			}
			lastNum = lastNum - money;
		}
		
		if ( lastNum < order.getTotalNum().intValue() - order.getLaunchNum() ) {
			String state = order.getState();
			// 有跟单，更新状态和进度
			if ( lastNum == 0 ) {
				// 满员
				//state = MergerOrder.STATE_FILLED + "";
				if ( order.getInsNum() > 0 ) {
					//logTx2(order.getUserid(), order, order.getInsNum(), "合买100%保底资金退回，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+order.getId()+">"+order.getId()+"</a>");
				}
			}
			this.mergerOrderMapper.updateBuyNumAndState(order.getId(), order.getTotalNum()-lastNum, order.getBuyNum(), state, MergerOrder.STATE_NO_FILLED+"");
		}
	
	}
	
	/**
	 * 先发起，后上传
	 */
	@Override
	@Transactional
	public void frsupmerge(MergerOrder order) {
		/* 校验：倍数，期号，号码 */
		if ( order.getLaunchNum() < 0 ) {
			throw new BaseException("发起份数不能为负数");
		}
		if ( null != order.getInsNum() && order.getInsNum() < 0 ) {
			throw new BaseException("保底份数不能为负数");
		}
		
		/* 非竞彩票从数据库中查询截止时间 modified at 2015/04/19 */
		if ( order.getLicenseId() != Constants.LICENSE_JCZQ && order.getLicenseId() != Constants.LICENSE_JCLQ ) {
			Integer queryLicenseId = order.getLicenseId();
			if ( queryLicenseId == Constants.LICENSE_R9 ) {
				queryLicenseId = Constants.LICENSE_14SFC;
			}
			Game g = this.lotteryService.getOneGame(queryLicenseId, order.getIssue());
			order.setReserved3(g.getStopTime());// 出票截止时间
			order.setReserved13(g.getStopTime());
			
			String stTime = order.getReserved3();
			// 截止时间判断
			if ( stTime.length() == 16 ) {
				stTime += ":00";
			} else if ( stTime.length() == 15 ) {
				String[] ssT = stTime.split(":");
				stTime = ssT[0] + ":0" + ssT[1]+":00";
			} 
			int aheadset = 0;	// 分钟
			StoreLicenseKey key = new StoreLicenseKey();
			key.setStoreId(order.getStoreid());
			key.setLicenseId(order.getLicenseId());
			StoreLicense csl = this.storeLicenseMapper.selectByPrimaryKey(key);
			// 设置合买提前截止时间
			if ( null != csl.getBuyAheadTime() && !"".equals(csl.getCoopAheadTime()) ) {
				aheadset = Integer.parseInt(csl.getCoopAheadTime());
			} else {
				try {
					key.setStoreId(-1);
					key.setLicenseId(order.getLicenseId());
					aheadset = Integer.parseInt(this.storeLicenseMapper.selectByPrimaryKey(key).getCoopAheadTime());
				} catch ( Exception ex ) {
				}
			}
			Date date = null;
			// 加上提前截止时间 at 2015/04/01
			if ( order.getLicenseId() > 100 ) {
				date = DateUtil.getDate(stTime, "yyyy-MM-dd HH:mm:ss");
			} else {
				date = DateUtil.getDayMiniteBefore("yyyy-MM-dd HH:mm:ss", stTime, aheadset+MergerOrder.COOP_COMM_AHEAD);
			}
			if ( date.before(new Date()) ) {
				throw new BaseException("您选择的方案已不能发起合买，请重新选择方案");
			}
			stTime = DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", date);
			order.setReserved2(stTime);
		}
		
		order.setReserved1(DateUtil.getDateFormat2());
		int totalMoney = order.getBetNum() * order.getMultiple() * 2;
		order.setBetPrice(totalMoney);
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(order.getUserid());
		// 发起人账户可用资金
		double amountUsed = this.commonService.getUsedMoney(ma);//ma.getMoneyAccount() + ma.getGivenAccount() - ma.getFrozenAccount();
		if ( totalMoney % order.getTotalNum() != 0 ) {
			throw new BaseException("总份数跟总金额不成倍数关系");
		}
		int perMoney = totalMoney / order.getTotalNum();
		// 认购的总额加上保底的总额是否足够发起订单
		if ( perMoney * order.getLaunchNum() + perMoney * order.getInsNum() > amountUsed ) {
			throw new BaseException("账户可用资金不够发起订单");
		}
		if ( null == order.getLaunchNum() ) {
			order.setLaunchNum(0);
		}
		if ( null == order.getInsNum() ) {
			order.setInsNum(0);
		}
		
		order.setBuyNum(order.getLaunchNum());
		order.setState(MergerOrder.STATE_NO_FILLED+"");
		this.mergerOrderMapper.insert(order);
		int orderId = (int)this.mergerOrderMapper.selectLastSeq();
		order.setId(orderId);
		
		// 保底交易日志
		if ( order.getInsNum() > 0 ) {
			logTx(order.getUserid(), order, order.getInsNum()*perMoney, "合买保底支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+orderId+">"+orderId+"</a>");
		}
		
		// 生成合买参与记录
		if ( order.getLaunchNum() > 0 ) {
			MergerJoin mj = this.commonService.newInstanceMergerJoin(order.getUserid(), order.getUsername(), 
					orderId, order.getLaunchNum(), (double)perMoney * order.getLaunchNum());
			int result = this.mergerJoinMapper.insert(mj);
			if ( 0 == result ) {
				throw new BaseException("生成参与合买信息失败");
			}
			logTx(order.getUserid(), order, order.getLaunchNum()*perMoney, "参与合买支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+orderId+">"+orderId+"</a>");
		}
		
		order.setPartnerNo(orderId);
		order.setBetCode("");
		order.setBetType("3");
		
		if ( null == order.getBetFrom() ) {
			order.setBetFrom("1");
		}
		order.setSingleFlag("1");
		order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"");
		order.setBetPrice(totalMoney);
		order.setTicketTotalNum(0);	// 订单总票数
		order.setOrderDate(DateUtil.getDateFormat2());
		order.setReserved2(null);// 订单的截止时间
		//订单的出票中心归属
		Store store = this.storeMapper.selectByPrimaryKey(order.getStoreid());
		String reserved4 = store.getReserved3();
		String reserved8 = store.getReserved5();
		order.setReserved4(reserved4);
		order.setReserved8(reserved8);//出票中心唯一标识
		
		order.setSchInfo(null);
		order.setReserved5(null);
		// 插入代购订单表
		this.lotteryOrderMapper.insert(order);
		order.setReserved20((perMoney * order.getLaunchNum() + perMoney * order.getInsNum()) + "");//消费金额，回显使用
		
		// 自动跟单操作
		customed(order);
	}
	
	 /**
     * 追加保底
     */
	@Transactional
	public void appendIns(Member mb, Integer orderId, Integer insNum) {
		MergerOrder mo = this.mergerOrderMapper.selectByPrimaryKey(orderId);
		if ( mo.getUserid().intValue() != mb.getId() ) {
			throw new BaseException("[不是发起人，不能追加保底]");
		}
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(mo.getUserid());
		// 发起人账户可用资金
		double amountUsed = this.commonService.getUsedMoney(ma);
		if ( amountUsed < insNum ) {
			throw new BaseException("账户可用资金不够追加保底");
		}
		if ( insNum > (mo.getTotalNum() - mo.getInsNum() - mo.getBuyNum()) ) {
			throw new BaseException("保底份数不能大于剩余份数");
		}
		mo.setInsNum(insNum);
		int result = this.mergerOrderMapper.updateInsNum(mo);
		if ( result == 0 ) {
			throw new BaseException("追加保底失败");
		}
		logTx(mo.getUserid(), mo, insNum, "追加保底支付，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+mo.getId()+">"+mo.getId()+"</a>");
	}
	
	/**
	 * 在合买未满员之前撤销合买单
	 * @param orderId，合买单ID
	 */
	@Transactional
	public void cancelOrder(Member mb, Integer orderId) {
		MergerOrder mo = this.mergerOrderMapper.selectByPrimaryKey(orderId);
		if ( mo.getUserid().intValue() != mb.getId() ) {
			throw new BaseException("[不是发起人，不能撤销订单]");
		}
		if ( (mo.getInsNum() + mo.getBuyNum().intValue()) >= mo.getTotalNum().intValue() ) {
			throw new BaseException("[订单达到出票状态，不可撤销]");
		}
		//更改合买订单撤单状态
		int result = this.mergerOrderMapper.updateState(orderId, "3", "1");
		if ( 0 == result ) {
			throw new BaseException("订单已满员或已撤销");
		}
		if ( mo.getInsNum() > 0 ) {
			logTx2(mo.getUserid(),MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.REFUND,mo, mo.getInsNum(), "合买撤单保底资金退回，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+mo.getId()+">"+mo.getId()+"</a>");
		}
		// 参与人认购
		List<MergerJoin> mjs = this.mergerJoinMapper.selectOrderList(mo.getId());
		for ( MergerJoin mj : mjs ) {
			logTx2(mj.getJoinUserid(), MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.REFUND, mo,  mj.getJoinNum(), "合买撤单参与资金退回，订单：<a href=/merger/mergerOrderDetails.jhtml?mergerOrderId="+mo.getId()+">"+mo.getId()+"</a>");
		}
		
		// 订单的状态和彩票的状态也修改
		LotteryOrder lo = this.lotteryOrderMapper.selectByPartnerNo(orderId);
		lo.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
		this.lotteryOrderMapper.updateOrderState(lo);
		this.lotteryTicketMapper.orderCancellation(LotteryTicketState.TICKET_STATE_CANCEL, lo.getId());
	}
	
	/**
	 * 交易日志
	 * @param order
	 * @param totalMoney
	 * @param coment
	 */
	private void logTx2(Integer userId, int tx, MergerOrder order, double totalMoney, String coment) {
		/*记交易日志*/
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(userId);
		Integer storeId = null;
		String relationId = null;
		if ( null != order ) {
			storeId = order.getStoreid();
			relationId = order.getId()+"";
		} 
		MemberMoneyLog mml = this.commonService.newInstanceMemberMoneyLog(storeId, userId, 
				(double)totalMoney, this.commonService.getUsedMoney(ma) + totalMoney, 
				MemberUtil.ACCESS_ACCOUNT_TYPE.INCOME, tx, MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.BONUS_FRIST, 
				relationId, coment);;
		this.memberMoneyLogMapper.insert(mml);
		
		this.memberAccountMapper.updateAccount2Revaction(userId, totalMoney);
		
	}
	
	/**
	 * 交易日志
	 * @param order
	 * @param totalMoney
	 * @param coment
	 */
	private void logTx(Integer userId, MergerOrder order, int totalMoney, String coment) {
		/*记交易日志*/
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(userId);
		MemberMoneyLog mml = this.commonService.newInstanceMemberMoneyLog(order.getStoreid(), userId, 
				(double)totalMoney, this.commonService.getUsedMoney(ma) - totalMoney, MemberUtil.ACCESS_ACCOUNT_TYPE.OUTOFF, 
				MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.LOTTERY, MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.TO_BET, 
				order.getId()+"", coment);;
		int result = this.memberMoneyLogMapper.insert(mml);
		if ( 0 == result ) {
			throw new BaseException("[写入交易日志失败]");
		}
		
		this.commonService.operateMemberAccount(ma, totalMoney);
		result = this.memberAccountMapper.updateAccount2Bet(ma);
		if ( 0 == result ) {
			throw new BaseException("[交易异常，请重新操作]");
		}
	}
}
