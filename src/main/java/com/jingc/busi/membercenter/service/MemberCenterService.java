/**
 * 
 */
package com.jingc.busi.membercenter.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jingc.afc.pagination.Pagination;
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
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreReceiv;
import com.jingc.busi.common.table.StoreYeepay;

/**
 * <p>File: MemberCenterService.java</p>
 * <p>Desc: 个人中心业务（充值、取款、安全设置、购彩查询等）</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
public interface MemberCenterService {
	/**
	 * author wangheping
	 * 获取用户方案列表
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getOrderByMemberAndGameType(LotteryOrder param, Integer pageNo, Integer pageSize);
	
	/**
	 * author wangheping
	 * 获取用户中奖纪录
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getMemberOrderListBonus(LotteryOrder param, Integer pageNo, Integer pageSize);
	
	
	
	
	
	
	
	/**
	 * author wangheping
	 * 获取营业厅用户方案列表
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	public Pagination getYYTOrderByMemberAndGameType(LotteryOrder param, Integer pageNo, Integer pageSize);
	
	/**
	 * 营业厅用户确认出票
	 * @param orderId
	 * @return
	 */
	public int updateLotteryOrderState(Integer orderId , Integer memberId);
	/**
	 * 添加取款方式 zh
	 * @param mw
	 * @return
	 */
	public String addMemberWithdraw(MemberWithdraw mw);
	/**
	 * 修改取款方式信息 zh
	 * @param mw
	 * @param memberId
	 * @return
	 */
	public String updMemberWithdrawByMid(MemberWithdraw mw);
	/**
	 * 修改取款方式状态 zh
	 * @param state
	 * @param type
	 * @param mId
	 */
	public String updMemberWithdrawStateByMid(String type, Integer mId);
	/**
	 * 查询取款信息 
	 * @param memberId
	 * @return
	 */
	public List<MemberWithdraw> drawInfo( Integer memberId);
	
	/**
	 * 查询用户取款方式
	 * @param memberId
	 * @return
	 */
	public MemberWithdraw drawInfoOne(Integer memberId);
	/**
	 * 查询账户信息 
	 * @param memberId
	 * @return
	 */
	public MemberWithdraw drawInfoById( Integer id);
	/**
	 * 修改取款账户
	 * @param memberId
	 * @return
	 */
	public int updateWithdrawById( Integer id,String accountType,String card,String time);
	/**
	 * 修改账户状态 
	 * @param memberId
	 * @return
	 */
	public int updateDrawstate( Integer memberId,String time);
	/***
	 * 营业厅用户删除方案
	 * @param orderId
	 * @return
	 */
	public int deleteLotteryOrder(Integer orderId);
	/**
	 * 得到店铺的可销售彩种集合
	 * @param storeId
	 * @return
	 */
	public List<StoreLicense> getStoreLicenseList(Integer storeId);
	
	/***
	 * 修改用户资料
	 * @param mb
	 * @return
	 */
    public int updateMemberMessage(Member mb);
    
    /**
     * 得到店铺的银行信息
     * @return
     */
    public List<StoreReceiv> getStoreReceivAccount(@Param("param")StoreReceiv param,@Param("pagination")Pagination pagination);
    
	/**
	 * 获取一个彩民信息
	 * @param memberId
	 * @return
	 */
    public Member getOneMember(Integer memberId);
    
    /***
     * 获取一个店铺信息
     * @param storeId
     * @return
     */
    public Store getOneStore(Integer storeId);
    
    /**
     * 彩民发起取款请求
     * @param mb  用户对象
     * @param currMoney  发生额
     */
    public void doGetMoney(Member mb , Double currMoney , MemberAccount marecord , String typeNameV , String accountMessageV);
    
    /**
     * 获取彩民提款单
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberGetMoney(MemberDrow param, Integer pageNo, Integer pageSize);
    
    /***
     * 彩民充值记录入库
     * @param mb
     * @param currMoney 当前交易额
     * @param payBank   来源
     * @param type  充值方式
     */
    public int doPutMoney(Member mb , Double currMoney , String payBank , Integer type , String commonts , String userIp);
    /***
     * 彩民充值记录入库
     * @param mb
     * @param currMoney 当前交易额
     * @param payBank   来源
     * @param type  充值方式
     */
    public String doPutMoneyOffLine(Member mb , Double currMoney , String payBank , Integer type , String commonts , String userIp);
    
    /**
     * 获取彩民充值记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberPutMoney(MemberPayLog param, Integer pageNo, Integer pageSize);
    
    /**
     * 获取彩民资金记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberMoneyLog(MemberMoneyLog param, Integer pageNo, Integer pageSize);
    
    /**
     * 获取彩民欠款记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberDebitLog(Debit param, Integer pageNo, Integer pageSize);
    
    /**
     * 获取彩民站内信
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMemberMessageList(MemberMessage param, Integer pageNo, Integer pageSize);
    
    /***
     * 获取一个彩民站内信对象
     * @param messageId
     * @return
     */
    public MemberMessage getOneMessage(Integer messageId);
    
    /**
     * 更新一个消息对象
     * @param message
     * @return
     */
    public int updateMessage(MemberMessage message);
    
    /***
	 * 生成新闻静态页
	 */
	public int createNews();
	
	/**
	 * 中奖排行
	 */
	public void createDraw();
	
	/**
	 * 按id获取一个支付记录
	 * @param id
	 * @return
	 */
	public MemberPayLog getOneMemberPayLog(Integer id);
	/**
	 * 按POS机线下订单号获取一个支付记录
	 * @param reserved3
	 * @return
	 */
	public MemberPayLog getOneMemberPayLog(String reserved3);
	
	/***
	 * 在线充值反馈成功，修改数据库订单状态
	 * @return
	 */
	public int setState(MemberPayLog record);
	
	/***
	 * 在线充值分润反馈更新订单
	 * @return
	 */
	public int updateMemberPayLog(MemberPayLog record);
	
	public int updateMemberPayLogNoState(MemberPayLog record);
	
	/***
	 * 增加彩民账户余额
	 * @param memberId
	 * @param money
	 * @param type
	 * @return
	 */
	public int putMoneyToMemberAccount(Integer memberId , Store store , Double money , Integer type  ,String relationId);
	
	
	
	/**
	 * author ChenSuibing
	 * 获取用户追号纪录
	 * @param param
	 * @param pageNo 
	 * @param pageSize
	 * @return
	 */
	
	
	public Pagination getChaseMemberRecord(ChasingOrder param, Integer pageNo, Integer pageSize);
	
	/**
	 * 获取用户的金额
	 * @param memberId
	 * @return double[总充值][总中奖][总购彩][总提款][未还款欠款充值]
	 */
	public Double[] allowGetMoney(Integer memberId);
	
	/***
	 * 营业厅用户删除跟单
	 * 
	 * @param session
	 * @param orderId
	 * @return
	 */
	public int deleteMergerCustom(Integer customId);
	
	/**
	 * 跟单记录 zh
	 * @param param
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination selectMergerCustomLog(Member param, Integer pageNo, Integer pageSize);
	
	
	/***
	 * 充值入库
	 * @param memberpayLog
	 * @param contextUrl 终端用户ip
	 * @param transType  盛付通的充值类别
	 * @param cateType   资金子类别
	 * @param beSharing  是否分账
	 */
	public void putMoney(MemberPayLog memberpayLog , String contextUrl , String transType ,Integer cateType , boolean beSharing);
	
	/**
     * 获取彩民充值记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Pagination getMyTeam(String agentId,String memberName, Integer pageNo, Integer pageSize);
    
    /**
	 * 查询充值方式信息 zh
	 */
	public MemberBankInfo getMemberBankInfo(Integer mid, String bankName, String cardNo, String protocolNo, String cardType);
	/**
	 * 添加充值方式信息 储蓄卡zh
	 */
	public void addMemberBankInfoDR(String holderName, String cardNo, String protocolNo, String idNo,String phoneNumber, String  bankName, 
			Integer mid, Integer sid);
	/**
	 * 添加充值方式信息 信用卡zh
	 */
	public void addMemberBankInfoCR(String holderName, String cardNo, String protocolNo, String idNo,String phoneNumber, String  bankName, 
			Integer mid, Integer sid, String validThru, String cvv2);
	
	/**
	 * 获取充值方式信息集合 zh
	 */
	public List<MemberBankInfo> getMemberBankInfoList(Integer mid, String bankName, String type);
	
	/**
	 * 获取店铺易宝账户
	 * @param storeId
	 * @return
	 */
	public StoreYeepay getStoreYeepay(Integer storeId);
}
