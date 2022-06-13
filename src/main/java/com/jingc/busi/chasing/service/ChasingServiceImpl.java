/**
 * 
 */
package com.jingc.busi.chasing.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jingc.afc.cache.CacheUtil;
import com.jingc.afc.cache.classification.StoreInfoCache;
import com.jingc.afc.cache.classification.StoreInfoCache.SYS_TYPE;
import com.jingc.afc.exception.BaseException;
import com.jingc.afc.exception.JCException;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.HttpUtil;
import com.jingc.busi.common.mapper.ChasingOrderMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MemberMoneyLogMapper;
import com.jingc.busi.common.mapper.StoreLicenseMapper;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;
import com.jingc.busi.core.service.CommonService;
import com.jingc.busi.core.service.ICytxCommonOperationService;
import com.jingc.busi.core.service.ICytxCommonOperationService.UpdateStatisTypes;
import com.jingc.busi.freq.FreqPeriod;
import com.jingc.busi.freq.FreqPeriodFactory;
import com.jingc.busi.lottery.service.LotteryService;
import com.jingc.busi.store.service.StoreService;
import com.jingc.busi.util.member.ChasingOrderState;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.LotteryTicketState;
import com.jingc.busi.util.member.MemberState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.busi.util.member.StoreConstant;

/**
 * <p>File: ChasingServiceImpl.java</p>
 * <p>Desc: 追号业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("chasingService")
public class ChasingServiceImpl implements ChasingService {
	
	@Resource private ChasingOrderMapper chasingOrderMapper;
	@Resource private MemberMapper memberMapper;
	@Resource private MemberAccountMapper memberAccountMapper;
	@Resource private MemberMoneyLogMapper memberMoneyLogMapper;
	@Resource private StoreLicenseMapper storeLicenseMapper;
	@Resource private LotteryService lotteryService;
	@Resource private LotteryOrderMapper lotteryOrderMapper;
	@Resource private LotteryTicketMapper lotteryTicketMapper;
	
	@Resource private CommonService commonService;
	
	@Resource private ICytxCommonOperationService cytxcservice;
	@Resource private StoreService sservice;
	//@Resource private StoreMapper storeMapper;

	/**
	 * 追号
	 * 追号默认只在本地出票，具体行为有店主决定，系统不会默认中心代出
	 * 营业厅用户不允许下追号单
	 */
	@Override
	@Transactional
	public void chase(ChasingOrder order) {
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
		
		/*
		 * 判断用户状态及其账户状态
		 */
		Member member = this.memberMapper.selectByPrimaryKey(order.getUserid());
		if ( member.getState().intValue() != MemberState.MemberIDState.NORMAL ) {
			throw new BaseException("[用户状态异常，请您联系彩站]");
		}
		/* 营业厅用户不允许下追号单 */
		
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(order.getUserid());
		double amountUsed = this.commonService.getUsedMoney(ma);
		
		order.setOrderDate(DateUtil.getDateFormat2());
		order.setDoneIssue(0);
		order.setCancelIssue(0);
		order.setAddBonus(0d);
		String currIssue = null;
		if ( order.getLicenseId() > 100 ) {
			FreqPeriod fp = FreqPeriodFactory.getFreqPeriod(order.getLicenseId());
			currIssue =  fp.getCurrentIssue();
		} else {
			Game game = this.lotteryService.getCurrentGame(order.getLicenseId(), 0);
			currIssue = game.getIssue();
		}
		boolean exist = false;
		String[] issueMults = order.getIssueMult().split(",");
		for ( String issueMult : issueMults ) {
			String[] dd = issueMult.split("\\|");
			if ( currIssue.indexOf(dd[0]) > -1 ) {
				exist = true;
				break;
			}
		}
		if ( exist ) {
			order.setDoneIssue(1);
			order.setChasingState(ChasingOrderState.CHASING_STATE_EXECUTING + "");
		}
		this.chasingOrderMapper.insert(order);
		
		Integer orderId = (int)this.chasingOrderMapper.selectLastSeq();
		order.setId(orderId);
		
		List<LotteryOrder> list = this.createLotteryOrders(order, currIssue);
		Integer totalMoney = 0, totalIssue = 0;
		for ( LotteryOrder lo : list ) {
			totalIssue++;
			
			this.lotteryService.bet(lo);
			order.setBetNum(lo.getBetNum());
			totalMoney += lo.getBetPrice();
		}
		/*判断余额是否足够*/
		if ( totalMoney > amountUsed ) {
			throw new BaseException("[可用余额不够支付订单投注]");
		}
		// 更新注数和金额
		order.setId(orderId);
		order.setTotalIssue(totalIssue);
		order.setBetPrice(totalMoney);
		order.setBetNum(list.get(0).getBetNum());
		this.chasingOrderMapper.updateTotalMoney(order);
		
		/*记交易日志*/
		MemberMoneyLog mml = this.commonService.newInstanceMemberMoneyLog(order.getStoreid(), order.getUserid(), 
				(double)order.getBetPrice(), this.commonService.getUsedMoney(ma) - order.getBetPrice(), 
				MemberUtil.ACCESS_ACCOUNT_TYPE.OUTOFF, MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.LOTTERY, 
				MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.AFTER_NUMBER_BETTING, 
				order.getId()+"", "追号支付，订单："+orderId);
		this.memberMoneyLogMapper.insert(mml);
		
		this.commonService.operateMemberAccount(ma, totalMoney);
		int result = this.memberAccountMapper.updateAccount2Bet(ma);
		if ( 0 == result ) {
			throw new BaseException("[交易异常，请重新操作]");
		}
	}
	
	/**
	 * 移动端调用快捷追号，设置连续追x期，使用字段reserved1标示 added at 2015/06/30
	 */
	@Override
	@Transactional
	public void chase2mobile(ChasingOrder order) {
		if ( null == order.getReserved1() ) {
			throw new BaseException("[没有设置连续追号期数]");
		}
		int chaseNum = Integer.valueOf(order.getReserved1());
		StringBuilder issueMult = new StringBuilder();
		if ( order.getLicenseId() < 100 ) {
			List<Game> gameSaledList = this.lotteryService.getSaleGame2Chasing(order.getLicenseId(), chaseNum);
			int len = gameSaledList.size();
			if ( len < chaseNum ) {
				throw new BaseException("[最大可设置追"+len+"期]");
			}
			for ( int i = 0; i < chaseNum; i++ ) {
				Game g = gameSaledList.get(i);
				issueMult.append(g.getIssue() + "|" + order.getMultiple());
				if ( i < chaseNum - 1 ) {
					issueMult.append(",");	
				}
			}
		} else {
			// 高频期号
			/*int aheadset = 0;	// 分钟
			
			// 设置提前截止时间
			StoreLicenseKey key = new StoreLicenseKey();
			key.setStoreId(order.getStoreid());
			key.setLicenseId(order.getLicenseId());
			StoreLicense sl = this.lotteryService.getStoreLicense(key);
			if ( null != sl && null!= sl.getBuyAheadTime()) {
				aheadset = Integer.parseInt(sl.getBuyAheadTime());
			}*/ 
			FreqPeriod fp = FreqPeriodFactory.getFreqPeriod(order.getLicenseId());	
			long curIss = Long.valueOf(fp.getCurrentIssue());
			int max = fp.getTotalDayPeriod() - Integer.valueOf(fp.getCurrentIssue().substring(6)) + 1;
			if ( chaseNum <= max  ) {
				for ( int i = 0; i < chaseNum; i++ ) {
					issueMult.append(curIss + "|" + order.getMultiple());
					curIss++;
					if ( i < chaseNum - 1 ) {
						issueMult.append(",");	
					}
				}
			} else {
				if ( max + fp.getTotalDayPeriod() < chaseNum ) {
					throw new BaseException("超过最大期数，最多可追两天");
				}
				for ( int i = 0; i < max; i++ ) {
					issueMult.append(curIss + "|" + order.getMultiple());
					issueMult.append(",");	
					curIss++;
				}
				curIss = Long.valueOf(DateUtil.getDayNext("yyMMdd", 1)+"01");
				for ( int i = 0; i < chaseNum-max; i++ ) {
					issueMult.append(curIss + "|" + order.getMultiple());
					curIss++;
					if ( i < chaseNum - max - 1 ) {
						issueMult.append(",");	
					}
				}
			}
		}
		order.setIssueMult(issueMult.toString());
		this.chase(order);
	}
	
	/**
	 * 生成投注单列表，追号单->多条投注单
	 * @param order
	 * @return
	 */
	private List<LotteryOrder> createLotteryOrders(ChasingOrder order, String currIssue) {
		List<LotteryOrder> list = new ArrayList<LotteryOrder>();
		String[] issueMults = order.getIssueMult().split(",");
		
		
		String state = ChasingOrderState.CHASING_STATE_NO_EXECUTE + "";
		for ( String issueMult : issueMults ) {
			String[] dd = issueMult.split("\\|");
			LotteryOrder lo = new LotteryOrder();
			lo.setUserid(order.getUserid());
			lo.setUsername(order.getUsername());
			lo.setStoreid(order.getStoreid());
			lo.setLicenseId(order.getLicenseId());
			lo.setPlayType(order.getPlayType());
			lo.setPassType("");
			lo.setSingleFlag(order.getSingleFlag());
			lo.setOrderDate(DateUtil.getNowDateByFmt("yyyy-MM-dd HH:mm:ss"));
			lo.setBetCode(order.getBetCode());
			lo.setBetNum(order.getBetNum());
			lo.setMultiple(new Integer(dd[1]));
			lo.setBetPrice(lo.getBetNum()*lo.getMultiple());
			lo.setIssue(dd[0]);
			if ( currIssue.equals(lo.getIssue()) ) {
				// 判断店内自动出票 added at 2016/10/27
				int storeBusiModel = CacheUtil.getCache(order.getStoreid()).getBusiModel(); // 是否有人值守
				if ( storeBusiModel == 1 ) {
					//有人值守状态下，如果打开了自动店内出票，那置为店内出票等待出票
					boolean autoTicketFlag = this.sservice.getAutomaticTicketSign(order.getStoreid()).equalsIgnoreCase(StoreConstant.AUTO_TICKET_SGIN.YES);
					StoreLicenseKey key = new StoreLicenseKey();
					key.setStoreId(order.getStoreid());
					key.setLicenseId(order.getLicenseId());
					StoreLicense csl = this.storeLicenseMapper.selectByPrimaryKey(key);
					if( autoTicketFlag && "1".equals(csl.getReserved4()) ) {
						lo.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORTICKET);
						lo.setIsResultStatus(LotteryOrderState.IS_RESULT_STATUS_FALSE);
						lo.setAutoFlag(MemberUtil.AUTO_FLAG.NO + "");
						// 操作cache
						CacheUtil.resetStoreWaitPrintOrder(order.getStoreid(), true);
					} else {
						lo.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION+"");
						CacheUtil.setStoreWaitOrderNum(order.getStoreid(), 1, true);
					}
				} else {
					lo.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION+"");
					CacheUtil.setStoreWaitOrderNum(order.getStoreid(), 1, true);
				}
				
				try {
					//新版店主后台更改缓存对象
					StoreInfoCache.updateWaitNumByType(SYS_TYPE.O2O,lo.getStoreid(),StoreInfoCache.StoreWaitOrderNum.WAIT_NUM_NOTICKET_STORE,true);
					//更改统计（下单总金额）
					cytxcservice.cytxUpdateStatis(lo.getUserid(), lo.getUsername(), lo.getStoreid(), lo.getStoreName(),
							UpdateStatisTypes.MEMBER_BET, lo, lo.getBetPrice()+0d);
					
				} catch ( Exception ex ) {
					
				}
				state = ChasingOrderState.CHASING_STATE_EXECUTING + "";
			} else {
				lo.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"");
			}
			lo.setBetType(LotteryOrderState.BET_TYPE_CHASING);
			if ( null != order.getBetFrom() ) {
				lo.setBetFrom(order.getBetFrom());
			} else {
				lo.setBetFrom(LotteryOrderState.BET_FROM_WEB+"");
			}
			lo.setFetchFlag("1");
			lo.setPartnerNo(order.getId());	// 追号单ID
			lo.setZjFlag(order.getZjFlag());
			lo.setMemberFrom(1);
			
			list.add(lo);
		}
		order.setChasingState(state);
		return list;
	}
	
	/**
	 * 停止一期追号，钱退回彩金账户
	 * @param orderId，投注单ID，lottery_order表中的id
	 */
	@Transactional
	public void cancelOneIssueChasing(Integer orderId) {
		LotteryOrder order = this.lotteryOrderMapper.selectByPrimaryKey(orderId);
		double doneMoney = 0;
		int cancelIssue = 0;
		if ( !order.getBetState().equals(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"") ) {
			
		} else {
			// 更新状态
			doneMoney += order.getBetPrice();
			cancelIssue++;
			order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
			int result = this.lotteryOrderMapper.updateOldState2NewState(order.getId(),LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"", LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
			if ( result == 0 ) {
				throw new BaseException("[操作失败，数据状态已更新]");
			}
			this.lotteryTicketMapper.updateStateByOrderId(order.getId(), LotteryTicketState.TICKET_STATE_CANCEL+"");
			
			// 退款
			this.memberAccountMapper.updateAccount2Revaction(order.getUserid(), doneMoney);
			
			MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(order.getUserid());
			MemberMoneyLog mml = new MemberMoneyLog();
			mml.setMemberId(order.getUserid());
			mml.setStoreId(order.getStoreid());
			mml.setMoney(order.getBetPrice().doubleValue());
			double frozeM = 0;
			if ( null != ma.getFrozenAccount() ) {
				frozeM = ma.getFrozenAccount();
			}
			mml.setBalance(ma.getMoneyAccount() + ma.getGivenAccount() - frozeM);
			//mml.setBalance(ma.getMoneyAccount());
			mml.setType(MemberUtil.ACCESS_ACCOUNT_TYPE.INCOME);
			mml.setCategory(MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.REFUND);
			mml.setCategoryDetail(MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.CANCEL_ORDER_REFUND);
			mml.setRelationId(order.getId()+"");
			mml.setState(MemberUtil.STATE.MEMBER_MONEY_LOG_STATE_FINISH);
			mml.setCommont("追号撤单退款，订单："+orderId);
			mml.setCreateTime(DateUtil.getDateFormat2());
			this.memberMoneyLogMapper.insert(mml);
			
			// 更新订单状态完成追号
			//ChasingOrder updateObj = new ChasingOrder();
			//order.setId(order.getId());
			ChasingOrder o = this.chasingOrderMapper.selectByPrimaryKey(order.getPartnerNo());
			if ( o.getDoneIssue() + o.getCancelIssue() + cancelIssue == o.getTotalIssue() ) {
				int state = ChasingOrderState.CHASING_STATE_COMPLETE;
				o.setChasingState(state+"");
			}
			o.setDoneIssue(0);
			o.setCancelIssue(cancelIssue);
			this.chasingOrderMapper.updateByPrimaryKeySelective2(o);
		}
	}
	
	/**
	 * 取消追号，剩下的钱退回彩金账户
	 * @param orderId
	 */
	@Transactional
	public void cancelChasing(Integer orderId) {
		ChasingOrder order = this.chasingOrderMapper.selectByPrimaryKey(orderId);
		List<LotteryOrder> ols = this.lotteryOrderMapper.findChasingList(orderId);
		double doneMoney = 0;
		int cancelIssue = 0;
		for ( LotteryOrder o : ols ) {
			if ( !o.getBetState().equals(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"") ) {
				doneMoney += o.getBetPrice();
			} else {
				// 更新状态
				cancelIssue++;
				o.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
				this.lotteryOrderMapper.updateOrderState(o);
				this.lotteryTicketMapper.updateStateByOrderId(o.getId(), LotteryTicketState.TICKET_STATE_CANCEL+"");
				
			}
		}
		// 退款
		this.memberAccountMapper.updateAccount2Revaction(order.getUserid(), order.getBetPrice()-doneMoney);
		
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(order.getUserid());
		MemberMoneyLog mml = new MemberMoneyLog();
		mml.setMemberId(order.getUserid());
		mml.setStoreId(order.getStoreid());
		mml.setMoney(order.getBetPrice()-doneMoney);
		
		mml.setBalance(this.commonService.getUsedMoney(ma));
		//mml.setBalance(ma.getMoneyAccount());
		mml.setType(MemberUtil.ACCESS_ACCOUNT_TYPE.INCOME);
		mml.setCategory(MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.REFUND);
		mml.setCategoryDetail(MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.CANCEL_ORDER_REFUND);
		mml.setRelationId(order.getId()+"");
		mml.setState(MemberUtil.STATE.MEMBER_MONEY_LOG_STATE_FINISH);
		mml.setCommont("停止追号撤单退款，订单："+orderId);
		mml.setCreateTime(DateUtil.getDateFormat2());
		this.memberMoneyLogMapper.insert(mml);
		
		// 更新订单状态完成追号
		//ChasingOrder updateObj = new ChasingOrder();
		//order.setId(order.getId());
		int state = ChasingOrderState.CHASING_STATE_COMPLETE;
		order.setChasingState(state+"");
		order.setDoneIssue(0);
		order.setCancelIssue(cancelIssue);
		this.chasingOrderMapper.updateByPrimaryKeySelective2(order);
	}
}
