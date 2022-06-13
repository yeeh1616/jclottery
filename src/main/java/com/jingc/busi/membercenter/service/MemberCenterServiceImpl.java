/**
 * 
 */
package com.jingc.busi.membercenter.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jingc.afc.cache.CacheUtil;
import com.jingc.afc.cache.classification.StoreInfoCache;
import com.jingc.afc.cache.classification.StoreInfoCache.SYS_TYPE;
import com.jingc.afc.cache.classification.StoreInfoCache.StoreWaitOrderNum;
import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.RandomTool;
import com.jingc.busi.common.mapper.ChasingOrderMapper;
import com.jingc.busi.common.mapper.DebitMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberBankInfoMapper;
import com.jingc.busi.common.mapper.MemberDrowMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.mapper.MemberMessageMapper;
import com.jingc.busi.common.mapper.MemberMoneyLogMapper;
import com.jingc.busi.common.mapper.MemberPayLogMapper;
import com.jingc.busi.common.mapper.MemberWithdrawMapper;
import com.jingc.busi.common.mapper.MergerCustomLogMapper;
import com.jingc.busi.common.mapper.MergerCustomMapper;
import com.jingc.busi.common.mapper.NewsInfoMapper;
import com.jingc.busi.common.mapper.StoreAccountMapper;
import com.jingc.busi.common.mapper.StoreLicenseMapper;
import com.jingc.busi.common.mapper.StoreMapper;
import com.jingc.busi.common.mapper.StoreMoneyCzLogMapper;
import com.jingc.busi.common.mapper.StoreMoneyCzYpLogMapper;
import com.jingc.busi.common.mapper.StoreReceivMapper;
import com.jingc.busi.common.mapper.StoreYeepayMapper;
import com.jingc.busi.common.table.ChasingOrder;
import com.jingc.busi.common.table.Debit;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberBankInfo;
import com.jingc.busi.common.table.MemberDrow;
import com.jingc.busi.common.table.MemberMessage;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MemberPayLog;
import com.jingc.busi.common.table.MemberWithdraw;
import com.jingc.busi.common.table.MergerCustom;
import com.jingc.busi.common.table.MergerCustomLog;
import com.jingc.busi.common.table.NewsInfo;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreAccount;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreMoneyCzLog;
import com.jingc.busi.common.table.StoreMoneyCzYpLog;
import com.jingc.busi.common.table.StoreReceiv;
import com.jingc.busi.common.table.StoreUser;
import com.jingc.busi.common.table.StoreYeepay;
import com.jingc.busi.login.service.LoginService;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.LotteryTicketState;
import com.jingc.busi.util.member.MemberState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.busi.util.member.MemberUtil.ACCESS_ACCOUNT_TYPE;
import com.jingc.busi.util.member.MemberUtil.STATE;
import com.jingc.busi.util.member.StoreConstant;
import com.jingc.busi.util.member.StoreNewsType;
import com.jingc.common.util.PropertiesTool;
import com.jingc.constant.util.GameUtil;
import com.jingc.file.util.FileUtil;
import com.sft.form.ReturnForm;
import com.sft.service.SftService;
import com.yeepay.zgt.utils.YeePayBase;
import com.zh.heepay.common.Heepay;

/**
 * <p>File: MemberCenterServiceImpl.java</p>
 * <p>Desc: 个人中心业务（充值、取款、安全设置、购彩查询等）实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("memberCenterService")
public class MemberCenterServiceImpl implements MemberCenterService {
	@Resource
	private LotteryOrderMapper lotteryordermapper;
	@Resource
    private LotteryTicketMapper lotteryticketmapper;
	
	/** 店铺可销售彩票种类表*/
	@Resource
	private StoreLicenseMapper storeLicenseMapper;
	
	/** 彩民信息表*/
	@Resource
	private MemberMapper memberMapper;
	
	/** 店铺收款银行账户*/
	@Resource
	private StoreReceivMapper storeReceivMapper;
	
	/** 店铺信息表*/
	@Resource
	private StoreMapper storeMapper;
	
	/** 彩民账户信息表*/
	@Resource
	private MemberAccountMapper memberAccountMapper;
	
	/** 彩民提款单信息表*/
	@Resource
	private MemberDrowMapper memberDrowMapper;
	
	/** 彩民资金流水表*/
	@Resource
	private MemberMoneyLogMapper memberMoneyLogMapper;
	
	/** 彩民网络充值表*/
	@Resource
	private MemberPayLogMapper memberPayLogMapper;
	
	/** 彩民欠款*/
	@Resource
	private DebitMapper debitMapper;
	
	/** 站内信*/
	@Resource
	private MemberMessageMapper memberMessageMapper;
	
	/** 新闻*/
	@Resource
	private NewsInfoMapper newsinfomapper;
	
	/** 追号记录*/
	@Resource
    private	ChasingOrderMapper  chasingOrderMapper; 
	
	/** 跟单记录*/
	@Resource
	private MergerCustomMapper mergerCustomMapper;
	
	/** 跟单记录*/
	@Resource
	private MergerCustomLogMapper mergerCustomLogMapper;
	
	/** 取款记录*/
	@Resource
	private MemberWithdrawMapper memberWithdrawMapper;
	
	/**
	 * 彩民盛付通充值记录的银行卡信息
	 */
	@Resource private MemberBankInfoMapper mbiMapper;
	
	
	@Resource
	private LoginService loginService;
	
	
	/** 店铺资金账户*/
	@Resource
	private StoreAccountMapper saMapper;
	
	/** 店铺资金日志账户,汇付宝*/
	@Resource
	private StoreMoneyCzLogMapper smclogMapper;
	
	/** 店铺资金日志账户，易宝*/
	@Resource
	private StoreMoneyCzYpLogMapper smclogYpMapper;
	
	/** 店铺易宝账户**/
	@Resource
	private StoreYeepayMapper storeyeepayMapper;
	/**
	 * author wangheping
	 * 获取用户方案列表
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	@Override
	public Pagination getOrderByMemberAndGameType(LotteryOrder param, Integer pageNo, Integer pageSize){
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.lotteryordermapper.getMemberOrderCount(param);
		pagination.setTotalCount(count);
		List<LotteryOrder> list = this.lotteryordermapper.getMemberOrderList(param, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	/**
	 * 查询取款信息 
	 * @param memberId
	 * @return
	 */
	public List<MemberWithdraw> drawInfo( Integer memberId){
		List<MemberWithdraw> list= this.memberWithdrawMapper.selectBymemberId(memberId);
		return list;
	}
	
	public MemberWithdraw drawInfoOne(Integer memberId) {
		MemberWithdraw mw = new MemberWithdraw();
		mw.setMemberId(memberId);
		mw.setAccountType(MemberUtil.ACCOUNT_TYPE_Y);
		mw = this.memberWithdrawMapper.selectByDraw(mw);
		return mw;
	}
	
	/**
	 * 查询账户信息 
	 * @param memberId
	 * @return
	 */
	public MemberWithdraw drawInfoById( Integer id){
		if(id == null){
			throw new BaseException("参数错误！");
		}
		MemberWithdraw list= this.memberWithdrawMapper.selectByPrimaryKey(id);
		return list;
	}
	/**
	 * 修改取款账户
	 * @param memberId
	 * @return
	 */
	public int updateWithdrawById( Integer id,String accountType,String card,String time ){
		int list= this.memberWithdrawMapper.updateWithdrawById(id,accountType,card,time);
		return list;
	}
	/**
	 * 修改账户状态 
	 * @param memberId
	 * @return
	 */
	public int updateDrawstate( Integer memberId,String time){
		int result=this.memberWithdrawMapper.updateStateBymemberId(memberId,time);
		return result;
	}
	/**
	 * 添加取款方式 zh
	 * @param mw
	 * @return
	 */
	@Transactional
	public String addMemberWithdraw(MemberWithdraw mbw){
		if (mbw.getMemberId() != null && mbw.getStoreId() != null
				&& mbw.getAccountType() != null && mbw.getAccountCard() != null
				&& mbw.getAccountState() != null && mbw.getCreatTime() != null) {
			List<MemberWithdraw> mwlist = this.memberWithdrawMapper.selectBymemberId(mbw.getMemberId());
			if(mwlist.size() != 0){
				for (MemberWithdraw mws : mwlist) {
					if(mws.getAccountType() == mbw.getAccountType()){
						return "ERROR";
					}
				}
				MemberWithdraw mw = new MemberWithdraw();
				mw.setMemberId(mbw.getMemberId());
				mw.setAccountState(1);//将当前默认状态"2" -> 改为"1"启用状态
				this.memberWithdrawMapper.updateStateBymember(mw,2);//取消当前默认取款方式
				
				mbw.setAccountState(2);
				int flag = this.memberWithdrawMapper.insert(mbw);
				if(flag != 0){
					return "SUCCESS";
				}else{
					return "ERROR";
				}
			}else{
				int flag = this.memberWithdrawMapper.insert(mbw);
				if(flag != 0){
					return "SUCCESS";
				}else{
					return "ERROR";
				}
			}
		}else{
			return "ERROR";
		}
	}
	
	/**
	 * 修改取款方式信息 zh
	 * @param mw
	 * @param memberId
	 * @return
	 */
	public String updMemberWithdrawByMid(MemberWithdraw mw){
		if(mw.getMemberId() != null && mw.getAccountType() != null && mw.getAccountCard() != null){
			int flag = this.memberWithdrawMapper.updateBymemberIdAndAccountType(mw);
			if(flag != 0){
				return "SUCCESS";
			}else{
				return "ERROR";
			}
		}else{
			return "ERROR";
		}
	}
	
	/**
	 * 修改取款方式状态 zh UPD
	 */
	@Transactional
	public String updMemberWithdrawStateByMid(String type, Integer mId){
		List<MemberWithdraw> mwlist = this.memberWithdrawMapper.selectBymemberId(mId);
		if(mwlist.size() != 0){
			MemberWithdraw mw = new MemberWithdraw();
			mw.setMemberId(mId);
			mw.setAccountState(1);//将当前默认状态"2" -> 改为"1"使用状态
			this.memberWithdrawMapper.updateStateBymember(mw,2);//取消当前默认取款方式
			
			mw.setAccountState(2);//设置为当前默认状态"2" -> 根据取款类型 type
			mw.setAccountType(type);
			int flag = this.memberWithdrawMapper.updateStateBymember(mw,null);
			if(flag != 0){
				return "SUCCESS";//修改成功
			}else{
				return "ERROR";
			}
		}else{
			return "ERROR";
		}
	}
	
	/**
	 * author wangheping
	 * 获取用户中奖纪录
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	@Override
	public Pagination getMemberOrderListBonus(LotteryOrder param, Integer pageNo, Integer pageSize){
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.lotteryordermapper.getMemberOrderCountBonus(param);
		pagination.setTotalCount(count);
		List<LotteryOrder> list = this.lotteryordermapper.getMemberOrderListBonus(param, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	/**
	 * author wangheping
	 * 获取营业厅用户方案列表
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getYYTOrderByMemberAndGameType(LotteryOrder param, Integer pageNo, Integer pageSize){
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.lotteryordermapper.getMemberOrderCount(param);
		pagination.setTotalCount(count);
		List<LotteryOrder> list = this.lotteryordermapper.geYYTMemberOrderList(param, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	/**
	 * 营业厅用户确认出票
	 * @param orderId
	 * @return
	 */
	public int updateLotteryOrderState(Integer OrderId, Integer memberId) {
		// 修改方案状态
		int result1 = this.lotteryordermapper.updateLotteryState(
				LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "",
				LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "", OrderId);
		if (result1 == 0) {
			throw new BaseException("提交失败,方案状态修改失败");
		}
		// 修改彩票状态
		int result2 = this.lotteryticketmapper.updateStateByOrderId(OrderId,
				LotteryTicketState.TICKET_STATE_WAITFORCONFIRMATION + "");
		if (result2 == 0) {
			throw new BaseException("提交失败,彩票状态修改失败");
		}
		// 锁定账户
		MemberAccount marecord = this.memberAccountMapper
				.selectByPrimaryKey(memberId);
		marecord.setState(MemberState.MemberAccountState.NOTAVAILABLE);
		int result3 = this.memberAccountMapper.updateByPrimaryKeySelective(marecord);
		if (result3 == 0) {
			throw new BaseException("提交失败,账户状态修改失败");
		}

		return 1;
	}
	
	/***
	 * 营业厅用户删除方案
	 * @param orderId
	 * @return
	 */
	public int deleteLotteryOrder(Integer orderId){
		 LotteryOrder param = this.lotteryordermapper.selectByPrimaryKey(orderId);//获取方案
		 
		//修改方案状态
		 this.lotteryordermapper.updateLotteryState(LotteryOrderState.LOTTERY_ORDER_STATE_CANCEL + "" , 
				LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "" , param.getId());
		 
		 //修改彩票状态
		 this.lotteryticketmapper.updateStateByOrderId(param.getId() , LotteryTicketState.TICKET_STATE_DELETE + "" );
		 
		//退款
		//修改账户（增加现金账户）
		MemberAccount marecord = this.memberAccountMapper.selectByPrimaryKey(param.getUserid());
		marecord.setMoneyAccount(new Double(param.getBetPrice() + ""));
		this.memberAccountMapper.updateMoneyAccount(marecord);
		 
		return 1;
	}
	/**
	 * 得到店铺可销售彩种集合
	 */
	@Override
	public List<StoreLicense> getStoreLicenseList(Integer storeId){
		List<StoreLicense> list = this.storeLicenseMapper.getStoreLicense(storeId);
		List<StoreLicense> list2 = new ArrayList<StoreLicense>();
		StoreLicense lic;
		for(int i = 0;i < list.size();i++)
		{
			lic = new StoreLicense();
			lic.setLicenseId(list.get(i).getLicenseId());
			lic.setLicenseString(GameUtil.GAMESMAP.get(lic.getLicenseId()+""));
			lic.setReserved1(list.get(i).getReserved1());
			list2.add(lic);
		}
		return list2;
	}
	
	/**
	 * 修改彩民资料
	 */
	@Override
	public int updateMemberMessage(Member mb){
		return this.memberMapper.updateByPrimaryKeySelective(mb);
	}
	
	/***
	 * 店铺的收款账户
	 */
	@Override
	public List<StoreReceiv> getStoreReceivAccount(@Param("param")StoreReceiv param,@Param("pagination")Pagination pagination){
		return this.storeReceivMapper.selectByParamObject(param, null);
	}
	
	/***
	 * 获取一个彩民
	 * @param mb
	 * @return
	 */
    public Member getOneMember(Integer memberId){
    	return this.memberMapper.selectByPrimaryKey(memberId);
    }
    
    public Store getOneStore(Integer storeId){
    	return storeMapper.selectByPrimaryKey(storeId);
    }
    
    /**
     * 彩民发起取款请求
     * @param mb  用户对象
     * @param currMoney  发生额
     */
    @Override
	@Transactional //数据库事务
    public void doGetMoney(Member mb , Double currMoney , MemberAccount marecord , String typeNameV , String accountMessageV){
    	
		if("支付宝".equals(typeNameV) || "微信".equals(typeNameV)) {
			if (currMoney > 100d) throw new BaseException("微信与支付宝单笔取款不能大于100元！");
			MemberDrow param = new MemberDrow();
			param.setBeginCreateTime(DateUtil.getDateFormat0());
			param.setMemberId(mb.getId());
			List<Integer> stateList = new ArrayList<Integer>();
			stateList.add(MemberUtil.STATE.MEMBER_DROW_STATE_WAIT);
			stateList.add(MemberUtil.STATE.MEMBER_DROW_STATE_PROCESSED);
			param.setStateList(stateList);
			if ("微信".equals(typeNameV)) {
				param.setBankName("微信");
			} else {
				param.setBankName("支付宝");
			}
			List<MemberDrow> list = this.memberDrowMapper.selectByMemberDrow(null, param);
			if (list.size() >= 3) {
				throw new BaseException("取款次数超出当日上限！");
			}
		}
    	
    	//彩民取款单
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String currTime = df.format(new Date().getTime());
		MemberDrow mdrecord = new MemberDrow();
		mdrecord.setBankAccount(accountMessageV);//mb.getBankAccount()//账户信息
		mdrecord.setBankName(typeNameV);//mb.getBankName() + "[" + mb.getBankUserName() + "]"//取款方式
		mdrecord.setBankUserName(mb.getCertiName());
		mdrecord.setCreateTime(currTime);
		mdrecord.setOperatorTime(currTime);
		mdrecord.setMemberId(mb.getId());
		mdrecord.setMoney(currMoney);
		mdrecord.setOperatorTime(currTime);
		mdrecord.setStoreId(mb.getStoreId());
		mdrecord.setState(MemberUtil.STATE.MEMBER_DROW_STATE_WAIT);
		
    	int result = this.memberDrowMapper.insert(mdrecord);
    	if (result == 0) {
			throw new BaseException("彩民取款单失败");
		}
		
    	//修改账户（增加冻结资金）
    	//MemberAccount marecord = this.memberAccountMapper.selectByPrimaryKey(mb.getId());
    	
    	//写资金往来日志
		StoreUser storeuser = new StoreUser();
		storeuser.setUserName("member");
		MemberMoneyLog memberMoneyLog = new MemberMoneyLog(storeuser.getUserName(), 
													currMoney, 
													marecord,
													MemberUtil.ACCESS_ACCOUNT_TYPE.OUTOFF,
													MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.WITHDRAWALSTOFREEZE,
													MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.GETMONEYFREEZE,
													"取款冻结",
													mdrecord.getId()+"",
													MemberUtil.STATE.MEMBER_MONEY_LOG_STATE_UNFINISHED);
		result =this.memberMoneyLogMapper.insert(memberMoneyLog);
    	if (result == 0) {
			throw new BaseException("彩民取款单失败");
		}
    	
    	//顺序必须在这里
    	marecord.setFrozenAccount(currMoney);
    	result = this.memberAccountMapper.memberGetMoney(marecord);
    	if (result == 0) {
			throw new BaseException("彩民取款单失败");
		}
    	
    	CacheUtil.setStoreWaitOrderNum(mb.getStoreId(), 4, true);
    	StoreInfoCache.updateWaitNumByType(SYS_TYPE.O2O,mb.getStoreId(),StoreWaitOrderNum.WAIT_NUM_DRAW,true);
    }
    
    /**
     * 获取彩民提款单
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberGetMoney(MemberDrow param, Integer pageNo, Integer pageSize){
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.memberDrowMapper.selectWaitCountByMemberDrow(param);
		pagination.setTotalCount(count);
		List<MemberDrow> list = this.memberDrowMapper.selectByMemberDrow(pagination , param);
		pagination.setList(list);
		
		return pagination;
    }
    
    /***
     * 彩民充值记录入库
     * @param mb
     * @param currMoney 当前交易额
     * @param payBank   来源 icbc,ccb,alipayaccount,sftaccount
     * @param type      充值方式 alipay,sft
     */
    @Override
    //@Transactional //数据库事务
    public int doPutMoney(Member mb , Double currMoney , 
				    	  String payBank , Integer type , 
				    	  String commonts,String userIp){
    	commonts = MemberUtil.MEMBER_PAY_TYPE_MAP.get(type);//从类别中匹配
    	int result = 0;
    	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String currTime = df.format(new Date().getTime());
		//充值日志
		MemberPayLog payLog = new MemberPayLog();
		payLog.setMemberId(mb.getId());
		payLog.setStoreId(mb.getStoreId());
		payLog.setType(type);
		payLog.setMoney(currMoney);
		payLog.setCreateTime(currTime);
		payLog.setBackTime(currTime);
		payLog.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_WAIT);
		payLog.setPayId("");
		payLog.setReserved1(userIp);
		payLog.setComments(commonts);
		payLog.setReserved5("作废");
		
		//同一个类别的未成功充值全部作废
		this.memberPayLogMapper.updateBachByPrimaryKeyAndStateAndMember(payLog);
		
		//充值单入库
		payLog.setReserved5(commonts);
		if( this.memberPayLogMapper.insert(payLog) > 0)
			result = payLog.getId();
		
		return result;
    }
    /***
     * 彩民充值记录入库-POS机线下充值
     * @param mb
     * @param currMoney 当前交易额
     * @param payBank   来源 icbc,ccb,alipayaccount,sftaccount
     * @param type      充值方式 alipay,sft
     */
    @Override
    //@Transactional //数据库事务
    public String doPutMoneyOffLine(Member mb , Double currMoney , 
				    	  String payBank , Integer type , 
				    	  String commonts,String userIp){
    	commonts = MemberUtil.MEMBER_PAY_TYPE_MAP.get(type);//从类别中匹配
    	int result = 0;
    	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String currTime = df.format(new Date().getTime());
		//充值日志
		MemberPayLog payLog = new MemberPayLog();
		payLog.setMemberId(mb.getId());
		payLog.setStoreId(mb.getStoreId());
		payLog.setType(type);
		payLog.setMoney(currMoney);
		payLog.setCreateTime(currTime);
		payLog.setBackTime(currTime);
		payLog.setState(MemberUtil.STATE.MEMBER_PAY_LOG_STATE_WAIT);
		payLog.setPayId("");
		payLog.setReserved1(userIp);
		//pos机线下充值ID
		String orderId = DateUtil.getDateFormat3() + RandomTool.generateNumberString(4);
		payLog.setReserved3(orderId);
		payLog.setComments(commonts);
		payLog.setReserved5("作废");
		
		//同一个类别的未成功充值全部作废
		this.memberPayLogMapper.updateBachByPrimaryKeyAndStateAndMember(payLog);
		
		//充值单入库
		payLog.setReserved5(commonts);
		if( this.memberPayLogMapper.insert(payLog) > 0)
			result = payLog.getId();
		
		return orderId;
    }
    /**
     * 获取彩民充值记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberPutMoney(MemberPayLog param, Integer pageNo, Integer pageSize){
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.memberPayLogMapper.selectWaitCountByParamObject(param);
		pagination.setTotalCount(count);
		List<MemberPayLog> list = this.memberPayLogMapper.selectByParamObject(param , pagination);
		pagination.setList(list);
		
		return pagination;
    }
    
    /**
     * 获取彩民资金记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberMoneyLog(MemberMoneyLog param, Integer pageNo, Integer pageSize){
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.memberMoneyLogMapper.selectWaitCountByParamObject(param);
		pagination.setTotalCount(count);
		List<MemberMoneyLog> list = this.memberMoneyLogMapper.selectByParamObject(pagination , param);
		pagination.setList(list);
		
		return pagination;
    }
    
    /**
     * 获取彩民欠款记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberDebitLog(Debit param, Integer pageNo, Integer pageSize){
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.debitMapper.selectWaitCountByParamObject(param);
		pagination.setTotalCount(count);
		List<Debit> list = this.debitMapper.selectByParamObject(param , pagination);
		pagination.setList(list);
		
		return pagination;
    }
    
    /**
     * 获取彩民站内信
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberMessageList(MemberMessage param, Integer pageNo, Integer pageSize){
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.memberMessageMapper.selectWCountByParam(param);
		pagination.setTotalCount(count);
		List<MemberMessage> list = this.memberMessageMapper.selectByParam(param , pagination);
		pagination.setList(list);
		
		return pagination;
    }
    
    /***
     * 获取一个彩民站内信对象
     * @param messageId
     * @return
     */
    public MemberMessage getOneMessage(Integer messageId){
    	return this.memberMessageMapper.selectByPrimaryKey(messageId);
    }
    
    /**
     * 更新一个消息对象
     * @param message
     * @return
     */
    public int updateMessage(MemberMessage message){
    	return this.memberMessageMapper.updateByPrimaryKeySelective(message);
    }
    
    /****
	 * 需要公告，预测，推荐三个列表页（9条数据的列表），刷新店铺所有的新闻内容页面
	 */
	public int createNews(){
		List<Store> storeList = this.storeMapper.getAllStore();
		if(storeList != null){
			for(Store record : storeList){
				Integer storeId = record.getStoreId();
				List<Integer> storeIdList = new ArrayList<Integer>();
				storeIdList.add(storeId);
				storeIdList.add(-1);
				
				//定义文件名称
				String ggFile = "indexGG.js";//公告
				String ycFile = "indexYC.js";//预测
				String txFile = "indexTx.js";//店铺提醒
				String newGGFile = "newIndexGG.js";//新首页公告
				
				String jcFile = "jcNews.js";//竞彩新闻
				String zcFile = "zcNews.js";//足彩新闻
				String szcFile = "szcFile.js";//数字彩新闻
				
				Pagination p = new Pagination(1,9);//取9条数据
				NewsInfo newsinfo = new NewsInfo();
				newsinfo.setStoreIdList(storeIdList);
				//公告列表
				newsinfo.setType(StoreNewsType.ANNOUNCEMENT);
				List<NewsInfo> listGG =	this.newsinfomapper.selectByParamObjectByStoreList(newsinfo, p);
				StringBuffer bufGG = new StringBuffer();
				bufGG.append("document.write(\"<ul>\");\n");
				for (NewsInfo info : listGG) {
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,23,"") + "...";
					String date_ = info.getCreateTime().substring(5, 10).replaceAll("-", ".");
					bufGG.append("document.write(\"<li><a href='/news.jhtml?conid="+id_+"' target='_blank'><font>"+title+"</font>  <span>"+date_+"</span></a> </li>\");\n");
				}
				bufGG.append("document.write(\"</ul>\");\n");
				
				//新首页公告
				StringBuffer bufNewGG = new StringBuffer();
				bufNewGG.append("document.write(\"<ul class='announce'>\");\n");
				int ggcounter = 0;
				for (NewsInfo info : listGG) {
					if(ggcounter >= 6)
						break;
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,30,"") + "...";
					//String date_ = info.getCreateTime().substring(8, 10).replaceAll("-", ".");
					//<span>"+date_+"日</span>
					bufNewGG.append("document.write(\"<li><a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a></li>\");\n");
					ggcounter ++;
				}
				bufNewGG.append("document.write(\"</ul>\");\n");
				
				//预测列表
				newsinfo.setType(null);
				List<NewsInfo> listYC =	this.newsinfomapper.selectRecomByParamObject(newsinfo, p);
				StringBuffer bufYC = new StringBuffer();
				bufYC.append("document.write(\"<ul>\");\n");
				for (NewsInfo info : listYC) {
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,23,"") + "...";
					String date_ = info.getCreateTime().substring(5, 10).replaceAll("-", ".");
					bufYC.append("document.write(\"<li><a href='/news.jhtml?conid="+id_+"' target='_blank'><font>"+title+"</font>  <span>"+date_+"</span></a> </li>\");\n");
				}
				bufYC.append("document.write(\"</ul>\");\n");
				
				//店铺公告
				newsinfo.setType(StoreNewsType.REMINDER);
				List<NewsInfo> listTx =	this.newsinfomapper.selectByParamObjectByStoreList(newsinfo, p);
				StringBuffer bufTX = new StringBuffer();
				//bufTX.append("document.write(\"<ul>\");\n");
				for (NewsInfo info : listTx) {
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,23,"") + "...";
					//String date_ = info.getCreateTime().substring(5, 10).replaceAll("-", ".");
					bufTX.append("document.write(\"<a href='/news.jhtml?conid="+id_+"' target='_blank'><font>"+title+"</font></a>\");\n");
				}
				//bufTX.append("document.write(\"</ul>\");\n");
				
				//竞彩新闻
				newsinfo.setType(StoreNewsType.NEWSJC);
				List<NewsInfo> listJC =	this.newsinfomapper.selectByParamObjectByStoreList(newsinfo, p);
				StringBuffer bufJC = new StringBuffer();
				bufJC.append("document.write(\"<li>\");");
				ggcounter = 0;
				for (NewsInfo info : listJC) {
					if(ggcounter >= 8)
						break;
					
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,32,"") + "...";
					//String date_ = info.getCreateTime().substring(5, 10).replaceAll("-", ".");
					if(ggcounter%2 == 0 && ggcounter > 0)
						bufJC.append("\ndocument.write(\"</li><li><a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a>\");");
					else
						bufJC.append("\ndocument.write(\"<a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a>\");");
					
					ggcounter ++;
				}
				bufJC.append("\ndocument.write(\"</li>\");");
				
				//足彩新闻
				newsinfo.setType(StoreNewsType.NEWSZC);
				List<NewsInfo> listZC =	this.newsinfomapper.selectByParamObjectByStoreList(newsinfo, p);
				StringBuffer bufZC = new StringBuffer();
				bufZC.append("document.write(\"<li>\");");
				ggcounter = 0;
				for (NewsInfo info : listZC) {
					if(ggcounter >= 8)
						break;
					
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,32,"") + "...";
					//String date_ = info.getCreateTime().substring(5, 10).replaceAll("-", ".");
					if(ggcounter%2 == 0 && ggcounter > 0)
						bufZC.append("\ndocument.write(\"</li><li><a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a>\");");
					else
						bufZC.append("\ndocument.write(\"<a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a>\");");
				    
					ggcounter ++;
				}
				bufZC.append("\ndocument.write(\"</li>\");");
				
				//数字彩新闻
				newsinfo.setType(StoreNewsType.NEWSSZ);
				List<NewsInfo> listSZC = this.newsinfomapper.selectByParamObjectByStoreList(newsinfo, p);
				StringBuffer bufSZC = new StringBuffer();
				bufSZC.append("document.write(\"<li>\");");
				ggcounter = 0;
				for (NewsInfo info : listSZC) {
					if(ggcounter >= 8)
						break;
					
					Integer id_ = info.getId();
					String title = FileUtil.getSubString(info.getTitle(),-1,32,"") + "...";
					//String date_ = info.getCreateTime().substring(5, 10).replaceAll("-", ".");
					if(ggcounter%2 == 0 && ggcounter > 0)
						bufSZC.append("\ndocument.write(\"</li><li><a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a>\");");
					else
						bufSZC.append("\ndocument.write(\"<a href='/news.jhtml?conid="+id_+"' target='_blank'>"+title+"</a>\");");
				
					ggcounter ++;
				}
				bufSZC.append("\ndocument.write(\"</li>\");");
				
				//写文件
				PropertiesTool pTool = new PropertiesTool("/jc.properties");
		    	String filePath = pTool.getValue("newsPath");
		    	filePath = filePath.endsWith("/") ? filePath : filePath + "/";
		    	filePath = filePath + storeId + "/";//按店铺id创建文件夹
		    	//FileUtil.generateFile(filePath);//创建店铺文件夹
		    	
		    	/** 写文件*/
		    	FileUtil.writer(bufGG.toString() , filePath ,  ggFile , "");
		    	FileUtil.writer(bufYC.toString() , filePath ,  ycFile , "");
		    	FileUtil.writer(bufTX.toString() , filePath ,  txFile , "");
		    	FileUtil.writer(bufNewGG.toString() , filePath ,  newGGFile , "");
		    	
		    	FileUtil.writer(bufJC.toString() , filePath ,  jcFile , "");
		    	FileUtil.writer(bufZC.toString() , filePath ,  zcFile , "");
		    	FileUtil.writer(bufSZC.toString() , filePath ,  szcFile , "");
			}
		}
		return 0;
	}
	
	/***
	 *生成店铺中奖文件
	 */
	public void createDraw(){
		List<Store> storeList = this.storeMapper.getAllStore();
		if(storeList != null){
			for(Store record : storeList){
				Integer storeId = record.getStoreId();
				String drawFile = "draw.js";//新首页公告
				
				//String[] userNames =  new String[]{"老家有***","garywa***","贯文哥***","曾氏后***","小陈帅***","2014lo***","zucaida***","宝哥20***"};
				//String[] gameNames =  new String[]{"竞彩足球","竞彩足球","排列三","竞彩足球","竞彩足球","大乐透","胜负彩","竞彩足球"};
				//String[] finiBonuses =  new String[]{"5390.40","3080.86","3000.00","2205.50","1800.78","1461.00","1474.00","871.07"};
				
				List<LotteryOrder> list = this.lotteryordermapper.selectNewWinOrderList(storeId);
				StringBuffer bufDraw = new StringBuffer();
				
				int counter = 0;
				if(list != null && list.size() > 0){
					for(LotteryOrder order:list){
						if(counter >= 8)
							break;
						
						String userName = FileUtil.getSubString(order.getUsername(),-1,5,"") + "***";
						String gameName = GameUtil.GAMESMAP.get(order.getLicenseId() + "");
						Double finiBonus = order.getFiniBonus();
						DecimalFormat df = new DecimalFormat("#,###.00");
						bufDraw.append("document.write(\"<tr>\");\n");
						bufDraw.append("document.write(\"<td class='cola'>"+userName+"</td>" +
								"<td>"+gameName+"</td><td class='colb'>"+(df.format(finiBonus))+"</td>\");\n");
						bufDraw.append("document.write(\"</tr>\");\n");
					}
				}
				
				//写文件
				PropertiesTool pTool = new PropertiesTool("/jc.properties");
				String filePath = pTool.getValue("newsPath");
				filePath = filePath.endsWith("/") ? filePath : filePath + "/";
				filePath = filePath + storeId + "/";//按店铺id创建文件夹
				//FileUtil.generateFile(filePath);//创建店铺文件夹
				
				/** 写文件*/
				FileUtil.writer(bufDraw.toString() , filePath ,  drawFile , "");
			}
		}
	}
	
	/**
	 * 按id获取一个支付记录
	 * @param id
	 * @return
	 */
	public MemberPayLog getOneMemberPayLog(Integer id){
		return this.memberPayLogMapper.selectByPrimaryKey(id);
	}
	/**
	 * 按POS机线下订单号获取一个支付记录
	 * @param reserved3
	 * @return
	 */
	public MemberPayLog getOneMemberPayLog(String reserved3){
		return this.memberPayLogMapper.selectByReserved3(reserved3);
	}
	
	/***
	 * 在线充值反馈成功，修改数据库订单状态
	 * @return
	 */
	public int setState(MemberPayLog record){
		return this.memberPayLogMapper.updateByPrimaryKeyAndState(record);
	}
	
	/***
	 * 在线充值分润反馈更新订单
	 * @return
	 */
	public int updateMemberPayLog(MemberPayLog record){
		return this.memberPayLogMapper.updateByPrimaryKeySelective(record);
	}
	
	public int updateMemberPayLogNoState(MemberPayLog record){
		return this.memberPayLogMapper.updateNoStateByPrimaryKeySelective(record);
	}
	/***
	 * 增加彩民账户余额
	 * @param memberId
	 * @param money
	 * @param type
	 * @return
	 */
	@Override
	@Transactional
	public int putMoneyToMemberAccount(Integer memberId , Store store , Double money , Integer type ,String relationId) {
		Double consumpProp = store.getConsumpProp();//最低额消费比例
		Double minConsu = money * consumpProp;//最低消费额度，即：不可提款的
		minConsu = new BigDecimal(minConsu+"").setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		//if(minConsu == 0)
			//minConsu = 0.01;
		String scanDraw = new BigDecimal(money - minConsu+"").setScale(2, BigDecimal.ROUND_HALF_DOWN)+"";//可取款
		Double dcanDraw = Double.valueOf(scanDraw);
		
		//修改彩民账户
		MemberAccount oldaccount = this.memberAccountMapper.selectByPrimaryKey(memberId);
		
		MemberAccount newAccount = new MemberAccount();
		newAccount.setMemberId(memberId);
		newAccount.setMoneyAccount(dcanDraw);
		newAccount.setCanDrawalsAccount(minConsu);
		newAccount.setVision(oldaccount.getVision());
		int result = this.memberAccountMapper.updateMoneyAccountNew(newAccount);
		if (result == 0) {
			throw new BaseException("充值出错");
		}
		
		//写资金日志
		StoreUser storeuser = new StoreUser();
		storeuser.setUserName("member");
		MemberMoneyLog moneylog = new MemberMoneyLog(storeuser.getUserName(), money, oldaccount,
				MemberUtil.ACCESS_ACCOUNT_TYPE.INCOME,
				MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.SECCUSSRECHANGE,
				MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.SFT_RECHANGE,
				MemberUtil.MEMBER_PAY_TYPE_MAP.get(type),
				relationId);
		result = this.memberMoneyLogMapper.insert(moneylog);
		if (result == 0) {
			throw new BaseException("彩民充值记录帐变日志出错");
		}

		return result;
	}
	
	/***
	 * 追号记录
	 * @param memberId
	 * @param money
	 * @param type
	 * @return
	 */
	
	public Pagination getChaseMemberRecord(ChasingOrder param, Integer pageNo,
			Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.chasingOrderMapper.getMemberChaseCountBonus(param);
		pagination.setTotalCount(count);
		List<ChasingOrder> list = this.chasingOrderMapper.getMemberChaseListBonus(param, pagination);
		pagination.setList(list);
		return pagination;
	}

	/**
	 * 获取用户的金额
	 * @param memberId
	 * @return double[总充值][总中奖][总购彩][总提款][未还款欠款充值][等待处理的取款单]
	 */
	public Double[] allowGetMoney(Integer memberId){
		Double[] result = new Double[6];
		List<MemberMoneyLog> recordList= this.memberMoneyLogMapper.selectSumMemberMoney(memberId);
		//充值-1
		//购彩-2
		//取款-4
		//手工扣款-6
		//兑奖-8
		//出票失败退款-9
		//退款-10
		Double sumPut = 0.0;//所有充值
		Double sumBonus = 0.0;//所有中奖
		Double sumConsume = 0.0;//所有购彩
		Double sumGet = 0.0;//所有取款
		
		for(MemberMoneyLog record:recordList){
			Integer category = record.getCategory();
			int icategory = category.intValue();
			Double money = record.getMoney();
			switch(icategory){ 
			case 1:{
				sumPut = sumPut + money;
				break;
			}
			case 2:{
				sumConsume = sumConsume + money;
				break;
			}
			case 4:{
				sumGet = sumGet + money;
				break;
			}
			case 6:{
				sumGet = sumGet + money;
				break;
			}
			case 8:{
				sumBonus = sumBonus + money;
				break;
			}
			case 9:{
				sumConsume = sumConsume - money;
				break;
			}
			case 10:{
				sumConsume = sumConsume - money;
				break;
			}
		 }
		}
		
		//未还款的欠款单
		Debit debitParam = new Debit();
		debitParam.setObligorId(memberId);
		debitParam.setState(MemberUtil.STATE.DEBIT_STATE_INITIAL);
		Double totalDebitMoney = this.debitMapper.totalDebitMoneyByMemberState(debitParam);
		//等待处理的取款单
		MemberDrow drowParam = new MemberDrow();
		drowParam.setMemberId(memberId);
		drowParam.setState(MemberUtil.STATE.DEBIT_STATE_INITIAL);
		Double totalDrowMoney = this.memberDrowMapper.totalDrowMoneyByMemberState(drowParam);
		
		result[0] = sumPut;
		result[1] = sumBonus;
		result[2] = sumConsume;
		result[3] = sumGet;
		result[4] = totalDebitMoney;
		result[5] = totalDrowMoney;
		
		return result;
	}

	@Override
	public int deleteMergerCustom(Integer customId) {
		 MergerCustom param = this.mergerCustomMapper.selectByPrimaryKey(customId);//获取方案		 
		 //修改跟单状态
		 param.setCancelDate(DateUtil.getDateFormat2());
		 this.mergerCustomMapper.updateMergerCustomState(param.getId(), MergerCustom.STATE_CANCEL + "",param.getCancelDate());
		 return 1;
	}
	
	/**
	 * 跟单记录 zh
	 */
	@Override
	public Pagination selectMergerCustomLog(Member param, Integer pageNo, Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.mergerCustomLogMapper.getMergerCustomLogCountBonus(param);
		pagination.setTotalCount(count);
		List<MergerCustomLog> list = this.mergerCustomLogMapper.selectMergerCustomLogByMergerId(param, pagination);
		pagination.setList(list);
		return pagination;
	}
	
	/***
	 * 充值入库
	 * @param memberpayLog
	 * @param contextUrl 终端用户ip
	 * @param transType  盛付通的充值类别
	 * @param cateType   资金子类别
	 */
	@Override
	@Transactional
	public void putMoney(MemberPayLog memberpayLog , 
			             String contextUrl ,String transType , 
			             Integer cateType , boolean beSharing){
		//修改订单状态
		int result = this.memberPayLogMapper.updateByPrimaryKeyAndState(memberpayLog);
		if (result == 0) {
			throw new BaseException("彩民充值修改订单状态出错");
		}
		Store store = this.storeMapper.selectByPrimaryKey(memberpayLog.getStoreId());
		Double consumpProp = store.getConsumpProp();//最低额消费比例
		Double minConsu = memberpayLog.getMoney() * consumpProp;//最低消费额度，即：不可提款的
		minConsu = new BigDecimal(minConsu+"").setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		String scanDraw = new BigDecimal(memberpayLog.getMoney() - minConsu+"").setScale(2, BigDecimal.ROUND_HALF_DOWN)+"";//可取款
		Double dcanDraw = Double.valueOf(scanDraw);
		
		//修改彩民账户
		MemberAccount oldaccount = this.memberAccountMapper.selectByPrimaryKey(memberpayLog.getMemberId());
		
		MemberAccount newAccount = new MemberAccount();
		newAccount.setMemberId(memberpayLog.getMemberId());
		newAccount.setMoneyAccount(dcanDraw);
		newAccount.setCanDrawalsAccount(minConsu);
		newAccount.setVision(oldaccount.getVision());
		result = this.memberAccountMapper.updateMoneyAccountNew(newAccount);
		if (result == 0) {
			throw new BaseException("彩民充值修改彩民资金账户出错");
		}
		
		//写资金日志
		StoreUser storeuser = new StoreUser();
		storeuser.setUserName("member");
		MemberMoneyLog moneylog = new MemberMoneyLog(
				storeuser.getUserName(), 
				memberpayLog.getMoney(), 
				oldaccount,
				MemberUtil.ACCESS_ACCOUNT_TYPE.INCOME,
				MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.SECCUSSRECHANGE,
				cateType,
				MemberUtil.MEMBER_PAY_TYPE_MAP.get(memberpayLog.getType()),
				memberpayLog.getId()+"");
		result = this.memberMoneyLogMapper.insert(moneylog);
		if (result == 0) {
			throw new BaseException("彩民充值写资金流水出错");
		}
		
		//如果是盛付通，需要分账
		if(( memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.SFT_PAY.intValue()
		  || memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.SFT_PAYMOBILE.intValue()
		  || memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.SFT_WECHAT_APP.intValue()
		  || memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.SFT_WECHAT_WEB.intValue()
		  || memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.SFT_ZFB_WEB.intValue()) 
				&& beSharing){
			try {
				System.out.println("===分润开始===="+memberpayLog.getId() + ";" + store.getReserved8());
				
				//构造分润需要的对象参数
				ReturnForm rForm = new ReturnForm();
				rForm.setTransNo(memberpayLog.getPayId());//盛付通交易号
				rForm.setOrderNo(memberpayLog.getId() + "");//商户订单号
				rForm.setTransType(transType);
				rForm.setTransAmount(memberpayLog.getMoney() + "");
				new SftService().submitSharingForm(rForm, store.getReserved8(), contextUrl,memberpayLog);
				
				System.out.println("===分润结束==="+memberpayLog.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//添加用户充值成功站内信 zh
		String des = "(来自网站)";
		if(transType.equals("PTWap"))
			des = "(来自手机)";
		try {
			String title  = "用户充值";
			Member mb = getOneMember(memberpayLog.getMemberId());
			String message = "<font size=\"2px\">用户<strong color=\"red\">"+mb.getMemberName()+"</strong>成功充值<strong color=\"red\">"+memberpayLog.getMoney()+"元</strong>，订单号<strong color=\"blue\">"+memberpayLog.getId()+"</strong>。"+des+"</font>";
			this.loginService.sendMessage(memberpayLog.getMemberId(), memberpayLog.getStoreId(), title, message);
		} catch (Exception e) {}
		
		/*
		 * 汇付通充值，需要为店主增加额度，写店主资金日志
		 */
		if(memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.HFT_PAY.intValue() ||
				memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.HFT_PAYMOBILE.intValue()||
				memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.HFT_ALIPAY.intValue() ){
			//1%佣金扣除
			//计算佣金
			Double rate = Heepay.RATEWEB;
			if(memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.HFT_PAYMOBILE.intValue())
				rate = Heepay.RATEWAP;
			if(memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.HFT_ALIPAY.intValue())
				rate = Heepay.RATEALIPAY;
			double rMoney = memberpayLog.getMoney() * rate;
			double f1 = new BigDecimal(rMoney+"").setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			String trueMoney = new BigDecimal(memberpayLog.getMoney() - f1+"").setScale(2, BigDecimal.ROUND_HALF_DOWN)+"";
			StoreAccount saRecord = this.saMapper.selectByPrimaryKey(memberpayLog.getStoreId());
			//可取额度
			/*Double oldGiven = saRecord.getGiveAccount();//充值资金账户
			saRecord.setGiveAccount(new Double(trueMoney));
			saRecord.setVision(saRecord.getVision());
			result = this.saMapper.updateGiveAccount(saRecord);*/
			//待兑额度
			Double oldwaitGetAccount = saRecord.getWaitGetAccount();//充值资金账户
			Double oldcanGetAccount = saRecord.getCanGetAccount();//可取金额
			saRecord.setWaitGetAccount(new Double(trueMoney));
			saRecord.setVision(saRecord.getVision());
			result = this.saMapper.updateWaitGetAccount(saRecord);
			if (result == 0) {
				throw new BaseException("汇付通充值店主资金账户出错");
			}
			
			//充值款插入店铺充值资金流水表
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			String currTime = df.format(new Date().getTime());
			StoreMoneyCzLog storeMoneyCzLog = new StoreMoneyCzLog();
			storeMoneyCzLog.setStoreId(memberpayLog.getStoreId());
			storeMoneyCzLog.setMoney(memberpayLog.getMoney());
			storeMoneyCzLog.setBalance(oldwaitGetAccount + oldcanGetAccount + memberpayLog.getMoney());
			storeMoneyCzLog.setType(ACCESS_ACCOUNT_TYPE.INCOME);
			storeMoneyCzLog.setCategory(StoreConstant.CZ);
			storeMoneyCzLog.setCategoryDetail(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.HFB_RECHANGE);
			storeMoneyCzLog.setState(STATE.STORE_MONEY_LOG_STATE_PROCESSED);
			storeMoneyCzLog.setRelationId(memberpayLog.getId() + "");
			storeMoneyCzLog.setOperator(this.memberMapper.selectByPrimaryKey(memberpayLog.getMemberId()).getMemberName());
			storeMoneyCzLog.setCommont(StoreConstant.HEEPSTATEMESSAGE.get(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.HFB_RECHANGE));
			storeMoneyCzLog.setCreateTime(currTime);
			storeMoneyCzLog.setBackTime(currTime);
			result = this.smclogMapper.insert(storeMoneyCzLog);
			if(result == 0)
			{
				throw new BaseException("汇付通充值店主资金日志出错");
			}
			
			//佣金
			storeMoneyCzLog = new StoreMoneyCzLog();
			storeMoneyCzLog.setStoreId(memberpayLog.getStoreId());
			storeMoneyCzLog.setMoney(f1);
			storeMoneyCzLog.setBalance(oldwaitGetAccount + oldcanGetAccount + memberpayLog.getMoney() - f1);
			storeMoneyCzLog.setType(ACCESS_ACCOUNT_TYPE.OUTOFF);
			storeMoneyCzLog.setCategory(StoreConstant.CZSXF);
			storeMoneyCzLog.setCategoryDetail(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.CZ_FEE);
			storeMoneyCzLog.setState(STATE.STORE_MONEY_LOG_STATE_PROCESSED);
			storeMoneyCzLog.setRelationId(memberpayLog.getId() + "");
			storeMoneyCzLog.setOperator(this.memberMapper.selectByPrimaryKey(memberpayLog.getMemberId()).getMemberName());
			storeMoneyCzLog.setCommont(StoreConstant.HEEPSTATEMESSAGE.get(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.CZ_FEE));
			storeMoneyCzLog.setCreateTime(currTime);
			storeMoneyCzLog.setBackTime(currTime);
			result = this.smclogMapper.insert(storeMoneyCzLog);
			if(result == 0)
			{
				throw new BaseException("汇付通充值佣金出错");
			}
		}
		
		/*
		 * 易宝充值，需要为店主增加额度，写店主资金日志
		 */
		
		if(memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.YEE_PAY.intValue()
		|| memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.YEE_PAYMOBILE.intValue()
		|| memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.YEE_PAYWEIXIN.intValue()){
			//1%佣金扣除
			//计算佣金//TODO
			Double rate = YeePayBase.RATEWEB;
			if( memberpayLog.getType().intValue() == MemberUtil.MEMBER_PAY_TYPE.YEE_PAYMOBILE.intValue())
				rate = YeePayBase.RATEWAP;
			double rMoney = memberpayLog.getMoney() * rate;
			double f1 = new BigDecimal(rMoney+"").setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			String trueMoney = new BigDecimal(memberpayLog.getMoney() - f1+"").setScale(2, BigDecimal.ROUND_HALF_DOWN)+"";
			StoreAccount saRecord = this.saMapper.selectByPrimaryKey(memberpayLog.getStoreId());
			//待兑额度
			Double oldwaitGetAccountYp = saRecord.getWaitGetAccountYp();//充值资金账户
			Double oldcanGetAccountYp = saRecord.getCanGetAccountYp();//可取金额
			saRecord.setVision(saRecord.getVision());
			//saRecord.setWaitGetAccountYp(new Double(trueMoney));
			//result = this.saMapper.updateWaitGetAccountYp(saRecord);
			saRecord.setWaitGetAccountYp(0D);
			saRecord.setCanGetAccountYp(new Double(trueMoney));
			result = this.saMapper.updateWaitGetAndCanGetAccountYp(saRecord);
			
			if (result == 0) {
				throw new BaseException("易宝充值店主资金账户出错");
			}
			
			//充值款插入店铺充值资金流水表
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			String currTime = df.format(new Date().getTime());
			StoreMoneyCzYpLog storeMoneyCzYpLog = new StoreMoneyCzYpLog();
			storeMoneyCzYpLog.setStoreId(memberpayLog.getStoreId());
			storeMoneyCzYpLog.setMoney(memberpayLog.getMoney());
			storeMoneyCzYpLog.setBalance(oldwaitGetAccountYp + oldcanGetAccountYp + memberpayLog.getMoney());
			storeMoneyCzYpLog.setType(ACCESS_ACCOUNT_TYPE.INCOME);
			storeMoneyCzYpLog.setCategory(StoreConstant.CZ);
			storeMoneyCzYpLog.setCategoryDetail(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.YEE_RECHANGE);
			storeMoneyCzYpLog.setState(STATE.STORE_MONEY_LOG_STATE_PROCESSED);
			storeMoneyCzYpLog.setRelationId(memberpayLog.getId() + "");
			storeMoneyCzYpLog.setOperator(this.memberMapper.selectByPrimaryKey(memberpayLog.getMemberId()).getMemberName());
			storeMoneyCzYpLog.setCommont(StoreConstant.HEEPSTATEMESSAGE.get(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.YEE_RECHANGE));
			storeMoneyCzYpLog.setCreateTime(currTime);
			storeMoneyCzYpLog.setBackTime(currTime);
			result = this.smclogYpMapper.insert(storeMoneyCzYpLog);
			if(result == 0)
			{
				throw new BaseException("易宝充值店主资金日志出错");
			}
			
			//佣金
			storeMoneyCzYpLog = new StoreMoneyCzYpLog();
			storeMoneyCzYpLog.setStoreId(memberpayLog.getStoreId());
			storeMoneyCzYpLog.setMoney(f1);
			storeMoneyCzYpLog.setBalance(oldwaitGetAccountYp + oldcanGetAccountYp + memberpayLog.getMoney() - f1);
			storeMoneyCzYpLog.setType(ACCESS_ACCOUNT_TYPE.OUTOFF);
			storeMoneyCzYpLog.setCategory(StoreConstant.CZSXF);
			storeMoneyCzYpLog.setCategoryDetail(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.CZ_FEE);
			storeMoneyCzYpLog.setState(STATE.STORE_MONEY_LOG_STATE_PROCESSED);
			storeMoneyCzYpLog.setRelationId(memberpayLog.getId() + "");
			storeMoneyCzYpLog.setOperator(this.memberMapper.selectByPrimaryKey(memberpayLog.getMemberId()).getMemberName());
			storeMoneyCzYpLog.setCommont(StoreConstant.HEEPSTATEMESSAGE.get(StoreConstant.STORE_ACCOUNT_CHANGE_TYPE_DETAIL.CZ_FEE));
			storeMoneyCzYpLog.setCreateTime(currTime);
			storeMoneyCzYpLog.setBackTime(currTime);
			result = this.smclogYpMapper.insert(storeMoneyCzYpLog);
			if(result == 0)
			{
				throw new BaseException("易宝充值佣金出错");
			}
		}
	}
	
	/**
	 * 代理彩民查询我的团队
	 */
	public Pagination getMyTeam(String agentId,String memberName, Integer pageNo,
			Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		int count = this.memberMapper.selectMyteamCountByParamObject(agentId,memberName);
		pagination.setTotalCount(count);
		List<Member> list = this.memberMapper.selectByTeamObject(agentId ,memberName, pagination);
		pagination.setList(list);
		
		return pagination;
	}
	
	/**
	 * 查询充值方式信息 zh
	 * mid bankName 不能为空
	 * cardNo与protocolNo其中一个不能为空
	 */
	public MemberBankInfo getMemberBankInfo(Integer mid, String bankName, String cardNo, String protocolNo, String cardType){
		MemberBankInfo result = null;
		List<MemberBankInfo> list = this.mbiMapper.selectByMemberIdAndBankNoAndBankName(mid, bankName, cardType);
		if(list != null && list.size() > 0){
			for(MemberBankInfo mi:list){
				String tmp1 = mi.getProtocolNo()==null?"":mi.getProtocolNo().trim();
				String tmp2 = mi.getCardNo()==null?"":mi.getCardNo().trim();
				if(cardNo != null && tmp2.equals(cardNo)){
					result = mi;
					break;
				}else if(protocolNo != null && tmp1.equals(protocolNo)){
					result = mi;
					break;
				}else if("".equals(tmp1) && protocolNo != null){
					mi.setProtocolNo(protocolNo);
					this.mbiMapper.updMemberBankInfoById(mi);
					result = mi;
					break;
				}
			}
		}
		return result;
	}
	/**
	 * 添加充值方式信息 zh ---已废弃
	 */
	/*public void addMemberBankInfo(String holderName, String cardNo, String protocolNo, String idNo,String phoneNumber, String  bankName, 
			Integer mid, Integer sid, String cardType, String effectiveDate, String tail){
		if(holderName != null && idNo != null && phoneNumber != null && bankName != null){
			if(cardNo != null || protocolNo != null){
				MemberBankInfo mi = new MemberBankInfo();
				mi.setHolderName(holderName);
				mi.setIdNo(idNo);
				mi.setPhoneNumber(phoneNumber);
				mi.setBankName(bankName);
				mi.setMemberId(mid);
				mi.setStoreId(sid);
				if(cardNo != null){
					mi.setCardNo(cardNo);
				}else if(protocolNo != null){
					mi.setProtocolNo(protocolNo);
				}
				mi.setReserve1(cardType);//银行卡类型 DR储蓄卡   CR信用卡
				if(effectiveDate != null && tail != null){
					mi.setReserve2(effectiveDate);//信用卡有效期
					mi.setReserve3(tail);//信用卡后三位
				}
				this.mbiMapper.insert(mi);
			}
		}
	}*/
	
	/**
	 * 获取充值方式信息集合 zh
	 */
	public List<MemberBankInfo> getMemberBankInfoList(Integer mid, String bankName, String cardType){
		return this.mbiMapper.selectByMemberIdAndBankNoAndBankName(mid, bankName, cardType);
	}
	
	/**
	 * 添加信用卡信息
	 * @Author zh
	 */
	@Override
	public void addMemberBankInfoCR(String holderName, String cardNo, String protocolNo, String idNo, String phoneNumber, String bankName, 
			Integer mid, Integer sid, String validThru, String cvv2) {
		if(cardNo != null || protocolNo != null){
			if(bankName != null && idNo != null && holderName != null && phoneNumber != null && validThru != null && cvv2 != null
					&& !"".equals(bankName) && !"".equals(idNo) && !"".equals(holderName) && !"".equals(phoneNumber) && !"".equals(validThru) && !"".equals(cvv2)){
				MemberBankInfo mi = new MemberBankInfo();
				mi.setMemberId(mid);//用户id
				mi.setStoreId(sid);//店铺id
				mi.setBankName(bankName);//银行名称
				mi.setCardNo(cardNo);//银行卡号
				mi.setIdNo(idNo);//身份证号
				mi.setHolderName(holderName);//真实姓名
				mi.setProtocolNo(protocolNo);//协议号码
				mi.setPhoneNumber(phoneNumber);//预留手机号码
				mi.setReserve1("CR");//银行卡类型 信用卡
				mi.setReserve2(validThru);//信用卡有效期
				mi.setReserve3(cvv2);//信用卡后三位
				this.mbiMapper.insert(mi);
			}
		}
	}
	
	/**
	 * 添加储蓄卡卡信息
	 * @Author zh
	 */
	@Override
	public void addMemberBankInfoDR(String holderName, String cardNo, String protocolNo, String idNo, String phoneNumber, String bankName, 
			Integer mid, Integer sid) {
		if(cardNo != null || protocolNo != null){
			if(bankName != null && idNo != null && holderName != null && phoneNumber != null 
					&& !"".equals(bankName) && !"".equals(idNo) && !"".equals(holderName) && !"".equals(phoneNumber)){
				MemberBankInfo mi = new MemberBankInfo();
				mi.setMemberId(mid);//用户id
				mi.setStoreId(sid);//店铺id
				mi.setBankName(bankName);//银行名称
				mi.setCardNo(cardNo);//银行卡号
				mi.setIdNo(idNo);//身份证号
				mi.setHolderName(holderName);//真实姓名
				mi.setProtocolNo(protocolNo);//协议号码
				mi.setPhoneNumber(phoneNumber);//预留手机号码
				mi.setReserve1("DR");//银行卡类型 信用卡
				this.mbiMapper.insert(mi);
			}
		}
	}
	/**
	 * 获取店铺易宝账户
	 * @param storeId
	 * @return
	 */
	public StoreYeepay getStoreYeepay(Integer storeId){
		return this.storeyeepayMapper.selectByPrimaryKey(storeId);
	}
}
