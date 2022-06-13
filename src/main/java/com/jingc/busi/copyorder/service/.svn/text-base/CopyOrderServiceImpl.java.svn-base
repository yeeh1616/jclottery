/**
 * 
 */
package com.jingc.busi.copyorder.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.LotteryOrderCustomMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryOrderCustom;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.lottery.service.LotteryService;

/**
 * <p>File: CopyOrderServiceImpl.java</p>
 * <p>Desc: 复制跟单业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-7-20
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("copyOrderService")
public class CopyOrderServiceImpl implements CopyOrderService {
	
	@Resource private LotteryOrderMapper lotteryOrderMapper;
	@Resource private LotteryOrderCustomMapper lotteryOrderCustomMapper;
	@Resource private MemberMapper memberMapper;
	
	@Resource private LotteryService lotteryService;

	/**
	 * 复制订单
	 * @param orderId，订单号
	 * @param multiple，投注倍数
	 */
	@Override
	public void copy(Member m, Integer orderId, Integer multiple) {
		LotteryOrder order = this.lotteryOrderMapper.selectByPrimaryKey(orderId);
		if ( m.getStoreId().intValue() != order.getStoreid() ) {
			throw new BaseException("请选择正确的投注站");
		}
		if ( m.getId().intValue() == order.getUserid() ) {
			throw new BaseException("不能复制自己发起的订单");
		}
		order.setMemberFrom(m.getMemberFrom());	// 彩民来源
		order.setReserved1(m.getReserved1());
		order.setUserid(m.getId());
		order.setUsername(m.getMemberName());//如果是营业厅用户，存入彩民的唯一标识码
		order.setMultiple(multiple);	// 方案倍数
		order.setTicketedPrice(0);
		order.setTicketTotalNum(0);
		order.setBetType("1");
		order.setBetFrom("1");
		order.setBetState("2");
		order.setReserved15("2");		// 方案不可复制
		order.setReserved17("1");		// 标识为复制方案
		order.setReserved18(orderId+"");// 被复制方案号
		this.lotteryService.bet(order);
	}
	
	/**
	 * 查询可复制订单，1）可复制 2）状态为已出票
	 * @param storeId，店铺号
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo，第几页
	 * @param pageSize，每页显示几条
	 * @return
	 */
	@Override
	public Pagination queryCopyOrders(Integer storeId, Integer licenseId, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		Pagination pagination = new Pagination(pageNo,pageSize);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		pagination.setTotalCount(this.lotteryOrderMapper.selectCount2CopyOrder(storeId, licenseId, username));
		pagination.setList(this.lotteryOrderMapper.selectList2CopyOrder(storeId, licenseId, username, pagination));
		return pagination;
	}
	
	/**
	 * 查询我复制的订单
	 * @param storeId，店铺号
	 * @param userid，彩民ID
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryMyCopyOrders(Integer storeId, Integer userid, Integer licenseId, Integer pageNo, Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 10;
		}
		pagination.setTotalCount(this.lotteryOrderMapper.selectCount2MyCopyOrder(storeId, userid, licenseId));
		pagination.setList(this.lotteryOrderMapper.selectList2MyCopyOrder(storeId, userid, licenseId, pagination));
		return pagination;
	}
	
	/**
	 * 查询我被复制的订单
	 * @param storeId，店铺号
	 * @param userid，彩民ID
	 * @param licenseId，彩种，可为null，默认查询所有彩种
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pagination queryMyCopyedOrders(Integer storeId, Integer userid, Integer licenseId, Integer pageNo, Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 10;
		}
		pagination.setTotalCount(this.lotteryOrderMapper.selectCount2MyCopyedOrder(storeId, userid, licenseId));
		pagination.setList(this.lotteryOrderMapper.selectList2MyCopyedOrder(storeId, userid, licenseId, pagination));
		return pagination;
	}
	
	/**
	 * 重複下單
	 * @param m
	 * @param orderId
	 */
	public void repeatBet(Member m, Integer orderId) {
		LotteryOrder order = this.lotteryOrderMapper.selectByPrimaryKey(orderId);
		if ( m.getId().intValue() != order.getUserid() ) {
			throw new BaseException("不能重複投注他人订单");
		}
		order.setBetType("1");
		order.setBetState("2");
		order.setReserved15("2");		// 方案不可复制
		order.setReserved17("3");		// 标识为chongfu方案
		order.setReserved18(orderId+"");// 被复制方案号
		order.setTicketedPrice(0);
		order.setTicketTotalNum(0);
		this.lotteryService.bet(order);
	}
	
	/**
	 * 定制复制，即自动复制的定制 added at 2016/03/09
	 */
	public void custom(LotteryOrderCustom loc) {
		if ( null == loc.getLicenseId() || null == loc.getCustomedId() || null == loc.getStoreId() || null == loc.getCustomingId() ) {
			throw new BaseException("参数错误");
		}
		if ( loc.getCustomedId().intValue() == loc.getCustomingId() ) {
			throw new BaseException("不能定制自己");
		}
		if ( null != this.lotteryOrderCustomMapper.selectByLicAndCusingCusedId(loc.getLicenseId(), loc.getCustomingId(), loc.getCustomedId())) {
			throw new BaseException("不可重复定制");
		}
		Member cusedMem = this.memberMapper.selectByPrimaryKey(loc.getCustomedId());
		if ( loc.getStoreId().intValue() != cusedMem.getStoreId() ) {
			throw new BaseException("不能定制其他店铺的彩民");
		}
		loc.setCustomTime(DateUtil.getDateFormat2());
		loc.setCustomedName(cusedMem.getMemberName());
		loc.setState(1);
		
		this.lotteryOrderCustomMapper.insert(loc);
	}
	
	/**
	 * 取消复制定制 added at 2016/03/09
	 */
	public void cancelCust(Member m, Integer custId) {
		LotteryOrderCustom loc = this.lotteryOrderCustomMapper.selectByPrimaryKey(custId);
		if ( null == loc ) {
			throw new BaseException("定制号无效");
		}
		if ( loc.getCustomingId().intValue() != m.getId() ) {
			throw new BaseException("您没有权限取消他人的定制");
		}
		this.lotteryOrderCustomMapper.deleteByPrimaryKey(custId);
	}
	
	/**
	 * 查询我的定制复制
	 */
	public Pagination queryMyCopyCust(Integer userid, Integer licenseId, Integer pageNo, Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 10;
		}
		LotteryOrderCustom param = new LotteryOrderCustom();
		param.setLicenseId(licenseId);
		param.setCustomingId(userid);
		pagination.setTotalCount(this.lotteryOrderCustomMapper.selectCount2MyCust(param));
		pagination.setList(this.lotteryOrderCustomMapper.selectList2MyCust(param, pagination));
		return pagination;
	}
	
	/**
	 * 查询我被定制的定制复制
	 */
	public Pagination queryMyCopyedCust(Integer userid, Integer licenseId, Integer pageNo, Integer pageSize) {
		Pagination pagination = new Pagination(pageNo,pageSize);
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 10;
		}
		LotteryOrderCustom param = new LotteryOrderCustom();
		param.setLicenseId(licenseId);
		param.setCustomedId(userid);
		pagination.setTotalCount(this.lotteryOrderCustomMapper.selectCount2MyCust(param));
		pagination.setList(this.lotteryOrderCustomMapper.selectList2MyCust(param, pagination));
		return pagination;
	}
	
	/**
	 * 执行定制的复制
	 */
	public void copy(LotteryOrder order) {
		Integer customedId = order.getUserid();
		Integer licenseId = order.getLicenseId();
		Integer orderId = order.getId();
		List<LotteryOrderCustom> list = this.lotteryOrderCustomMapper.selectByLicAndCusedId(licenseId, customedId);
		for ( LotteryOrderCustom loc : list ) {
			if ( null != loc.getReserved1() && !"".equals(loc.getReserved1()) ) {
				order.setMultiple(Integer.valueOf(loc.getReserved1()));
			} else if ( null != loc.getReserved2() && !"".equals(loc.getReserved2()) ) {
				String[] spt = loc.getReserved2().split(",");
				if (  order.getBetPrice() < Integer.valueOf(spt[0]) ) {
					order.setMultiple(order.getMultiple() * Integer.valueOf(spt[1]));
				}
			}
			if ( null != loc.getReserved3() && !"".equals(loc.getReserved3()) ) {
				int setMon = Integer.valueOf(loc.getReserved3());
				if ( order.getBetPrice() > setMon ) {
					continue;
				}
			}
			Member m = this.memberMapper.selectByPrimaryKey(loc.getCustomingId());
			order.setMemberFrom(m.getMemberFrom());	// 彩民来源
			order.setReserved1(m.getReserved1());
			order.setUserid(m.getId());
			order.setUsername(m.getMemberName());//如果是营业厅用户，存入彩民的唯一标识码
			order.setTicketedPrice(0);
			order.setTicketTotalNum(0);
			order.setBetType("1");
			order.setBetFrom("1");
			order.setBetState("2");
			order.setReserved15("2");		// 方案不可复制
			order.setReserved17("1");		// 标识为复制方案
			order.setReserved18(orderId+"");// 被复制方案号
			try {
				this.lotteryService.bet(order);
			} catch ( Exception ex ) {
				System.out.println(loc.getCustomingName()+"跟单["+order.getId()+"]失败");
				ex.printStackTrace();
			}
		}
	}
}
