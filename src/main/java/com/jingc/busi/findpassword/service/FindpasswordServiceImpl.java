/**
 * 
 */
package com.jingc.busi.findpassword.service;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jingc.afc.util.DES;
import com.jingc.afc.util.MD5;
import com.jingc.busi.common.mapper.MemberMapper;
import com.jingc.busi.common.table.Member;

/**
 * <p>File: ChartServiceImpl.java</p>
 * <p>Desc: 走势图业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("findpasswordService")
public class FindpasswordServiceImpl implements FindpasswordService {

	/**
	 * 彩民信息
	 */
	@Resource
	private MemberMapper memberMapper;
	
	@Override
	public Member getMember(Integer storeid, String username) {
		return this.memberMapper.selectStoreMember(storeid, username, null);
	}

	/**
	 * 修改密码
	 */
	@Override
	public String updatePass(Member param) {
		//MD5.toMD5WithJDK().toUpperCase();
		String pass = "";
		int num [] = {1,2,3,4,5,6,7,8,9};
		Random r = new Random();
		for(int i = 0;i < 6;i++)
		{
			pass += num[r.nextInt(9)];
		}
		param.setLoginPass(MD5.toMD5WithJDK(pass).toUpperCase());
		this.memberMapper.updateLoginPass(param);
		return pass;
	}

}
