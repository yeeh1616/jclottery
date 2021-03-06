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
 * <p>Desc: ??????????????????</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: ????????????????????????????????????????????????</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          ??????????????? ??????????????????</p>
 * @see     ?????????1
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
	 * ??????
	 * ?????????????????????????????????????????????????????????????????????????????????????????????
	 * ????????????????????????????????????
	 */
	@Override
	@Transactional
	public void chase(ChasingOrder order) {
		/*if(!CacheUtil.getStoreOpenState(order.getStoreid()).equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString())){
			throw new JCException("101600","[???????????????,????????????]");
		}*/
		
		/*Store cacheStore = (Store)StoreInfoCache.getInfoObject(SYS_TYPE.O2O,order.getStoreid(), StoreInfoCache.TYPE_STORE_INFO);
		if (!cacheStore.getOpeningState().equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString()) ) {
			throw new JCException("101600","[???????????????,????????????]");
		}*/
		if((!CacheUtil.getStoreOpenState(order.getStoreid()).equalsIgnoreCase(MemberUtil.STATE.STORE_OPENNINGSTATE_OPEN.toString())) ){
			String info = "[???????????????,????????????]";
			try {
				info = HttpUtil.doGet("http://wangdian.cp020.com/www/data/store/STOREID_"+order.getStoreid()+"/INFO_CATEGORY/CLOSING_BULLETIN/closeing_bulletin.js", "utf-8");
				info = info.substring(info.indexOf("content") + 10, info.indexOf("}];")-1);
			} catch (Exception e) {
			}
			throw new JCException("101600",info);
		}
		
		/*
		 * ????????????????????????????????????
		 */
		Member member = this.memberMapper.selectByPrimaryKey(order.getUserid());
		if ( member.getState().intValue() != MemberState.MemberIDState.NORMAL ) {
			throw new BaseException("[???????????????????????????????????????]");
		}
		/* ???????????????????????????????????? */
		
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
		/*????????????????????????*/
		if ( totalMoney > amountUsed ) {
			throw new BaseException("[????????????????????????????????????]");
		}
		// ?????????????????????
		order.setId(orderId);
		order.setTotalIssue(totalIssue);
		order.setBetPrice(totalMoney);
		order.setBetNum(list.get(0).getBetNum());
		this.chasingOrderMapper.updateTotalMoney(order);
		
		/*???????????????*/
		MemberMoneyLog mml = this.commonService.newInstanceMemberMoneyLog(order.getStoreid(), order.getUserid(), 
				(double)order.getBetPrice(), this.commonService.getUsedMoney(ma) - order.getBetPrice(), 
				MemberUtil.ACCESS_ACCOUNT_TYPE.OUTOFF, MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.LOTTERY, 
				MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.AFTER_NUMBER_BETTING, 
				order.getId()+"", "????????????????????????"+orderId);
		this.memberMoneyLogMapper.insert(mml);
		
		this.commonService.operateMemberAccount(ma, totalMoney);
		int result = this.memberAccountMapper.updateAccount2Bet(ma);
		if ( 0 == result ) {
			throw new BaseException("[??????????????????????????????]");
		}
	}
	
	/**
	 * ?????????????????????????????????????????????x??????????????????reserved1?????? added at 2015/06/30
	 */
	@Override
	@Transactional
	public void chase2mobile(ChasingOrder order) {
		if ( null == order.getReserved1() ) {
			throw new BaseException("[??????????????????????????????]");
		}
		int chaseNum = Integer.valueOf(order.getReserved1());
		StringBuilder issueMult = new StringBuilder();
		if ( order.getLicenseId() < 100 ) {
			List<Game> gameSaledList = this.lotteryService.getSaleGame2Chasing(order.getLicenseId(), chaseNum);
			int len = gameSaledList.size();
			if ( len < chaseNum ) {
				throw new BaseException("[??????????????????"+len+"???]");
			}
			for ( int i = 0; i < chaseNum; i++ ) {
				Game g = gameSaledList.get(i);
				issueMult.append(g.getIssue() + "|" + order.getMultiple());
				if ( i < chaseNum - 1 ) {
					issueMult.append(",");	
				}
			}
		} else {
			// ????????????
			/*int aheadset = 0;	// ??????
			
			// ????????????????????????
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
					throw new BaseException("???????????????????????????????????????");
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
	 * ?????????????????????????????????->???????????????
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
				// ???????????????????????? added at 2016/10/27
				int storeBusiModel = CacheUtil.getCache(order.getStoreid()).getBusiModel(); // ??????????????????
				if ( storeBusiModel == 1 ) {
					//?????????????????????????????????????????????????????????????????????????????????????????????
					boolean autoTicketFlag = this.sservice.getAutomaticTicketSign(order.getStoreid()).equalsIgnoreCase(StoreConstant.AUTO_TICKET_SGIN.YES);
					StoreLicenseKey key = new StoreLicenseKey();
					key.setStoreId(order.getStoreid());
					key.setLicenseId(order.getLicenseId());
					StoreLicense csl = this.storeLicenseMapper.selectByPrimaryKey(key);
					if( autoTicketFlag && "1".equals(csl.getReserved4()) ) {
						lo.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORTICKET);
						lo.setIsResultStatus(LotteryOrderState.IS_RESULT_STATUS_FALSE);
						lo.setAutoFlag(MemberUtil.AUTO_FLAG.NO + "");
						// ??????cache
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
					//????????????????????????????????????
					StoreInfoCache.updateWaitNumByType(SYS_TYPE.O2O,lo.getStoreid(),StoreInfoCache.StoreWaitOrderNum.WAIT_NUM_NOTICKET_STORE,true);
					//?????????????????????????????????
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
			lo.setPartnerNo(order.getId());	// ?????????ID
			lo.setZjFlag(order.getZjFlag());
			lo.setMemberFrom(1);
			
			list.add(lo);
		}
		order.setChasingState(state);
		return list;
	}
	
	/**
	 * ??????????????????????????????????????????
	 * @param orderId????????????ID???lottery_order?????????id
	 */
	@Transactional
	public void cancelOneIssueChasing(Integer orderId) {
		LotteryOrder order = this.lotteryOrderMapper.selectByPrimaryKey(orderId);
		double doneMoney = 0;
		int cancelIssue = 0;
		if ( !order.getBetState().equals(LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"") ) {
			
		} else {
			// ????????????
			doneMoney += order.getBetPrice();
			cancelIssue++;
			order.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
			int result = this.lotteryOrderMapper.updateOldState2NewState(order.getId(),LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS+"", LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
			if ( result == 0 ) {
				throw new BaseException("[????????????????????????????????????]");
			}
			this.lotteryTicketMapper.updateStateByOrderId(order.getId(), LotteryTicketState.TICKET_STATE_CANCEL+"");
			
			// ??????
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
			mml.setCommont("??????????????????????????????"+orderId);
			mml.setCreateTime(DateUtil.getDateFormat2());
			this.memberMoneyLogMapper.insert(mml);
			
			// ??????????????????????????????
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
	 * ?????????????????????????????????????????????
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
				// ????????????
				cancelIssue++;
				o.setBetState(LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL+"");
				this.lotteryOrderMapper.updateOrderState(o);
				this.lotteryTicketMapper.updateStateByOrderId(o.getId(), LotteryTicketState.TICKET_STATE_CANCEL+"");
				
			}
		}
		// ??????
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
		mml.setCommont("????????????????????????????????????"+orderId);
		mml.setCreateTime(DateUtil.getDateFormat2());
		this.memberMoneyLogMapper.insert(mml);
		
		// ??????????????????????????????
		//ChasingOrder updateObj = new ChasingOrder();
		//order.setId(order.getId());
		int state = ChasingOrderState.CHASING_STATE_COMPLETE;
		order.setChasingState(state+"");
		order.setDoneIssue(0);
		order.setCancelIssue(cancelIssue);
		this.chasingOrderMapper.updateByPrimaryKeySelective2(order);
	}
}
