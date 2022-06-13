/**
 * 
 */
package com.jingc.busi.pass.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.BjDcUtil;
import com.jingc.afc.util.CombAlgorithm;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.JcUtil;
import com.jingc.afc.util.SfGgUtil;
import com.jingc.busi.common.mapper.GameBjdcAgainstMapper;
import com.jingc.busi.common.mapper.GameJcAgainstMapper;
import com.jingc.busi.common.mapper.GameMapper;
import com.jingc.busi.common.mapper.GameSfggAgainstMapper;
import com.jingc.busi.common.mapper.GameZcAgainstMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.GameBjdcAgainst;
import com.jingc.busi.common.table.GameJcAgainst;
import com.jingc.busi.common.table.GameSfggAgainst;
import com.jingc.busi.common.table.GameZcAgainst;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.common.table.query.PassStatisticsQueryObject;
import com.jingc.busi.lottery.service.split.FootballService;
import com.jingc.busi.pass.service.PassStatisticsService.FootballHeader.Against;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: PassStatisticsServiceImpl.java</p>
 * <p>Desc: 过关统计业务实现类</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京彩游天下网络科技有限公司</p> 
 * @author  luochang
 * @version 1.0 2015-7-21
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("passStatisticsService")
public class PassStatisticsServiceImpl implements PassStatisticsService {
	
	@Resource private GameZcAgainstMapper gameZcAgainstMapper;
	@Resource private GameMapper gameMapper;
	@Resource private GameJcAgainstMapper gameJcAgainstMapper;
	@Resource private GameBjdcAgainstMapper gameBjdcAgainstMapper;
	@Resource private GameSfggAgainstMapper gameSfggAgainstMapper;
	
	@Resource private LotteryOrderMapper lotteryOrderMapper;
	@Resource private LotteryTicketMapper lotteryTicketMapper;
	
	private static final String[] BONUS_LEVEL = {"一等奖", "二等奖", "任选九"};
	private static final String[] PLS_BONUS_LEVEL = {"直选", "组三", "组六"};
	private static final String[] QXC_BONUS_LEVEL = {"一等奖", "二等奖", "三等奖","四等奖","五等奖","六等奖"};
	private static final String[] QLC_BONUS_LEVEL = {"一等奖", "二等奖", "三等奖","四等奖","五等奖","六等奖", "七等奖"};
	private static final String[] DLT_BONUS_LEVEL = {"一等奖(基本)", "一等奖(追加)", "二等奖(基本)", "二等奖(追加)", 
		"三等奖(基本)", "三等奖(追加)", "四等奖(基本)", "四等奖(追加)", "五等奖(基本)", "五等奖(追加)", "六等奖"};
	
	private static CombAlgorithm<String> combAlg = new CombAlgorithm<String>();
	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	/**
	 * 数字彩过关统计
	 */
	@Override
	public MathQueryObject queryMathQueryObject(Integer storeId, Integer licenseId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		MathQueryObject obj = new MathQueryObject(pageNo,pageSize);
		
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(new Integer(licenseId), newStopTime, 10);
		Game g = null;
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			if ( null != jsList.get(0).getBonusNumber() ) {
				issue = jsList.get(0).getIssue();
				g = jsList.get(0);
			} else {
				issue = jsList.get(1).getIssue();
				g = jsList.get(1);
			}
		} else {
			Game queryObj = new Game();
			queryObj.setLicenseId(licenseId);
			queryObj.setIssue(issue);
			g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		}
		PassStatisticsService.MathHeader header = new PassStatisticsService.MathHeader();
		header.setGameList(jsList);
		
		int[] bonus = {0,0,0,0,0,0,0,0,0,0,0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				// 2`10000000|2`6000000|24`381203|7`228721|314`11036|108`6621|15281`200|5316`100|312510`10|103630`5|3262654`5::169,930,972`1,483,412,687
				String[] des = g.getPayDes().split("::");
				String[] sailAndBp = des[1].split("`");
				header.setSail(sailAndBp[0]);
				header.setBonusPool(sailAndBp[1]);
				
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( int i = 0; i < 5; i++ ) {
					String[] bs1 = bb[2*i].split("`");
					String[] bs2 = bb[2*i+1].split("`");
					BonusObject bo = new BonusObject(DLT_BONUS_LEVEL[2*i]+"/"+DLT_BONUS_LEVEL[2*i+1], bs1[0]+"/"+bs2[0], bs1[1]+"/"+bs2[1]);
					bos.add(bo);
				}
				String[] bs1 = bb[10].split("`");
				BonusObject bo = new BonusObject(DLT_BONUS_LEVEL[10], bs1[0], bs1[1]);
				bos.add(bo);
				for ( String b : bb ) {
					String[] bs = b.split("`");
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		String[] bns = g.getBonusNumber().split("-");
		List<String> redArea = new ArrayList<String>();
		for ( int i = 0; i < 5; i++ ) {
			redArea.add(bns[i]);
		}
		List<String> greenArea = new ArrayList<String>();
		for ( int i = 5; i < 7; i++ ) {
			greenArea.add(bns[i]);
		}
		header.setOpenCodeList(bns);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);

		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			DltSchemeObject so = new DltSchemeObject();
			so.setOrder(order);
			String st = "单式";
			if ( order.getBetCode().indexOf(';') == -1 && order.getBetNum() > 1 ) {
				st = "复式";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : order.getBetType().equals("2") ? "追号" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			String[] betCodes = order.getBetCode().split(";");
			
			/*if ( betCodes.length == 1 && order.getBetNum() > 1 ) {
				List<String> singlist = null;
				singlist = combAlg.findDltSingComb(betCodes[0]);
				betCodes = singlist.toArray(new String[0]);
			}*/
			int[] bonusLevel = new int[6];	// 每个奖金中奖的注数统计
			for ( String _betCode : betCodes ) {
				List<String> singlist = combAlg.findDltSingComb(_betCode);
				for ( String betCode : singlist ) {
					String[] betSelected = betCode.split("\\+");
					String[] redBetSelected = betSelected[0].split(",");
					String[] greenBetSelected = betSelected[1].split(",");
					/*if ( redBetSelected.length != 5 && greenBetSelected.length != 2 ) {
						continue;
					}*/
					int redCounter = 0, greenCounter = 0;
					for ( String bet : redBetSelected ) {
						if ( redArea.contains(bet) ) {
							redCounter++;
						}
					}
					for ( String bet : greenBetSelected ) {
						if ( greenArea.contains(bet) ) {
							greenCounter++;
						}
					}
					
					if ( redCounter == 5 && greenCounter == 2 ) {
						bonusLevel[0]++;
					} else if ( redCounter == 5 && greenCounter == 1 ) {
						bonusLevel[1]++;
					} else if ( redCounter == 5 || (redCounter == 4 && greenCounter == 2) ) {
						bonusLevel[2]++;
					} else if ( (redCounter == 4 && greenCounter == 1) || (redCounter == 3 && greenCounter == 2) ) {
						bonusLevel[3]++;
					} else if ( (redCounter == 4)  || (redCounter == 3 && greenCounter == 1) || (redCounter == 2 && greenCounter == 2 )) {
						bonusLevel[4]++;
					} else if ( (redCounter == 3 )  || (redCounter == 1 && greenCounter == 2) || (redCounter == 2 && greenCounter == 1 ) || ( greenCounter == 2 ) ) {
						bonusLevel[5]++;
					}
				}
			}
			so.setPrize(bonusLevel);
			int w = 0;
			for ( int p : bonusLevel ) {
				w += p;
			}
			so.setAllRight(w);
			so.setWrongOne(0);
			rlist.add(so);
		}
		Collections.sort(rlist, new PtComparable());
		obj.setTotalCount(count);
		obj.setList(rlist);
		return obj;
	}
	
	/**
	 * 双色球过关统计
	 */
	@Override
	public MathQueryObject querySsqQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		MathQueryObject obj = new MathQueryObject(pageNo,pageSize);
		Integer licenseId = 11;
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(new Integer(licenseId), newStopTime, 10);
		Game g = null;
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			if ( null != jsList.get(0).getBonusNumber() ) {
				issue = jsList.get(0).getIssue();
				g = jsList.get(0);
			} else {
				issue = jsList.get(1).getIssue();
				g = jsList.get(1);
			}
		} else {
			Game queryObj = new Game();
			queryObj.setLicenseId(licenseId);
			queryObj.setIssue(issue);
			g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		}
		PassStatisticsService.MathHeader header = new PassStatisticsService.MathHeader();
		header.setGameList(jsList);
		
		int[] bonus = {0,0,0,0,0,0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				String[] des = g.getPayDes().split("::");
				String[] sailAndBp = des[1].split("`");
				header.setSail(sailAndBp[0]);
				header.setBonusPool(sailAndBp[1]);
				
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( int i = 0; i < 6; i++ ) {
					String[] bs1 = bb[i].split("`");
					BonusObject bo = new BonusObject(QXC_BONUS_LEVEL[i], bs1[0], bs1[1]);
					bos.add(bo);
				}
				
				for ( String b : bb ) {
					String[] bs = b.split("`");
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		String[] bns = g.getBonusNumber().split("-");
		List<String> redArea = new ArrayList<String>();
		for ( int i = 0; i < 6; i++ ) {
			redArea.add(bns[i]);
		}
		String greenWined = bns[6];/** 中奖篮球 */
		
		header.setOpenCodeList(bns);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);

		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			DltSchemeObject so = new DltSchemeObject();
			so.setOrder(order);
			String st = "单式";
			if ( order.getBetCode().indexOf(';') == -1 && order.getBetNum() > 1 ) {
				st = "复式";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : order.getBetType().equals("2") ? "追号" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			String[] betCodes = order.getBetCode().split(";");
			
			int[] bonusLevel = new int[6];	// 每个奖金中奖的注数统计
			for ( String _betCode : betCodes ) {
				List<String> singlist = combAlg.findSsqSingComb(_betCode);
				for ( String betCode : singlist ) {
					String[] betSelected = betCode.split("\\+");
					String[] redBetSelected = betSelected[0].split(",");
					
					int redCounter = 0, greenCounter = 0;
					for ( String bet : redBetSelected ) {
						if ( redArea.contains(bet) ) {
							redCounter++;
						}
					}
					if ( betSelected[1].equals(greenWined) ) {
						greenCounter++;
					}
					/**
					 * 中奖规则： 1等)中6+1,2等)中6+0,3等)中5+1,4等)中5+0或中4+1,5等)中4+0或中3+1,6等)中2+1或中1+1或中0+1
					 */
					if ( redCounter == 6 && greenCounter == 1 ) {
						/** 中一等奖 */
						bonusLevel[0]++;
					} else if ( redCounter == 6 && greenCounter == 0 ) {
						/** 中二等奖 */
						bonusLevel[1]++;
					} else if ( redCounter == 5 && greenCounter == 1 ) {
						/** 三等奖 :3000*/
						bonusLevel[2]++;
					} else if ( (redCounter == 5 && greenCounter == 0) || (redCounter == 4 && greenCounter == 1) ) {
						/** 四等奖：固定奖金200 */
						bonusLevel[3]++;
					} else if ( (redCounter == 4 && greenCounter == 0) || (redCounter == 3 && greenCounter == 1) ) {
						/** 五等奖：固定奖金10 */
						bonusLevel[4]++;
					} else if ( greenCounter == 1 ) {
						/** 六等奖：固定奖金5 */
						bonusLevel[5]++;
					}
				}
			}
			so.setPrize(bonusLevel);
			int w = 0;
			for ( int p : bonusLevel ) {
				w += p;
			}
			so.setAllRight(w);
			so.setWrongOne(0);
			rlist.add(so);
		}
		Collections.sort(rlist, new PtComparable());
		obj.setTotalCount(count);
		obj.setList(rlist);
		return obj;
	}
	
	/**
	 * 七乐彩过关统计
	 */
	@Override
	public MathQueryObject queryQlcQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		MathQueryObject obj = new MathQueryObject(pageNo,pageSize);
		Integer licenseId = 13;
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(licenseId, newStopTime, 10);
		Game g = null;
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			if ( null != jsList.get(0).getBonusNumber() ) {
				issue = jsList.get(0).getIssue();
				g = jsList.get(0);
			} else {
				issue = jsList.get(1).getIssue();
				g = jsList.get(1);
			}
		} else {
			Game queryObj = new Game();
			queryObj.setLicenseId(licenseId);
			queryObj.setIssue(issue);
			g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		}
		PassStatisticsService.MathHeader header = new PassStatisticsService.MathHeader();
		header.setGameList(jsList);
		
		int[] bonus = {0,0,0,0,0,0,0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				String[] des = g.getPayDes().split("::");
				String[] sailAndBp = des[1].split("`");
				header.setSail(sailAndBp[0]);
				header.setBonusPool(sailAndBp[1]);
				
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( int i = 0; i < 7; i++ ) {
					String[] bs1 = bb[i].split("`");
					BonusObject bo = new BonusObject(QLC_BONUS_LEVEL[i], bs1[0], bs1[1]);
					bos.add(bo);
				}
				
				for ( String b : bb ) {
					String[] bs = b.split("`");
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		String[] winDesc = g.getBonusNumber().split("-");
		List<String> redArea = new ArrayList<String>();
		for ( int i = 0; i < 7; i++ ) {
			redArea.add(winDesc[i]);
		}
		String greenWined = winDesc[7];/** 中奖篮球 */
		header.setOpenCodeList(winDesc);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);

		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			DltSchemeObject so = new DltSchemeObject();
			so.setOrder(order);
			String st = "单式";
			if ( order.getBetCode().indexOf(';') == -1 && order.getBetNum() > 1 ) {
				st = "复式";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : order.getBetType().equals("2") ? "追号" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			String[] betCodes = order.getBetCode().split(";");
			
			
			int[] bonusLevel = new int[7];	// 每个奖金中奖的注数统计
			for ( String _betCode : betCodes ) {
				List<String> singlist = combAlg.findQlcSingComb(_betCode, 7);
				for ( String betCode : singlist ) {
					String[] redBetSelected = betCode.split(",");
					
					int redCounter = 0, greenCounter = 0;
					for ( String bet : redBetSelected ) {
						if ( redArea.contains(bet) ) {
							redCounter++;
						}
						if ( bet.equals(greenWined) ) {
							greenCounter++;
						}
					}
					
					/**
					 * 中奖规则： 1等)中7个基本号码,2等)中6和特别号码,3等)中6个基本号码,4等)中5个基本和特别号码,5等)中5个基本号码,
					 * 6等)中4个基本号码及其特别号码,7等)中4基本号码
					 */
					if ( redCounter == 7 ) {
						/** 中一等奖 */
						bonusLevel[0]++;
					} else if ( redCounter == 6 && greenCounter == 1 ) {
						/** 中二等奖 */
						bonusLevel[1]++;
					} else if ( redCounter == 6  ) {
						/** 中三等奖 */
						bonusLevel[2]++;
					} else if ( redCounter == 5 && greenCounter == 1 ) {
						/** 中四等奖 */
						bonusLevel[3]++;
					} else if ( redCounter == 5  ) {
						/** 中五等奖 */
						bonusLevel[4]++;
					} else if ( redCounter == 4 && greenCounter == 1 ) {
						/** 中六等奖 */
						bonusLevel[5]++;
					} else if ( redCounter == 4  ) {
						/** 中七等奖 */
						bonusLevel[6]++;
					}
				}
			}
			so.setPrize(bonusLevel);
			int w = 0;
			for ( int p : bonusLevel ) {
				w += p;
			}
			so.setAllRight(w);
			so.setWrongOne(0);
			rlist.add(so);
		}
		Collections.sort(rlist, new PtComparable());
		obj.setTotalCount(count);
		obj.setList(rlist);
		return obj;
	}
	
	/**
	 * 七星彩过关统计
	 */
	@Override
	public MathQueryObject queryQxcQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		MathQueryObject obj = new MathQueryObject(pageNo,pageSize);
		Integer licenseId = 3;
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(licenseId, newStopTime, 10);
		Game g = null;
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			if ( null != jsList.get(0).getBonusNumber() ) {
				issue = jsList.get(0).getIssue();
				g = jsList.get(0);
			} else {
				issue = jsList.get(1).getIssue();
				g = jsList.get(1);
			}
		} else {
			Game queryObj = new Game();
			queryObj.setLicenseId(licenseId);
			queryObj.setIssue(issue);
			g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		}
		PassStatisticsService.MathHeader header = new PassStatisticsService.MathHeader();
		header.setGameList(jsList);
		
		int[] bonus = {0,0,0,0,0,0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				// 2`10000000|2`6000000|24`381203|7`228721|314`11036|108`6621|15281`200|5316`100|312510`10|103630`5|3262654`5::169,930,972`1,483,412,687
				String[] des = g.getPayDes().split("::");
				String[] sailAndBp = des[1].split("`");
				header.setSail(sailAndBp[0]);
				header.setBonusPool(sailAndBp[1]);
				
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( int i = 0; i < 6; i++ ) {
					String[] bs1 = bb[i].split("`");
					BonusObject bo = new BonusObject(QXC_BONUS_LEVEL[i], bs1[0], bs1[1]);
					bos.add(bo);
				}
				
				for ( String b : bb ) {
					String[] bs = b.split("`");
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		String[] winDesc = g.getBonusNumber().split("-");
		header.setOpenCodeList(winDesc);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);

		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			DltSchemeObject so = new DltSchemeObject();
			so.setOrder(order);
			String st = "单式";
			if ( order.getBetCode().indexOf(';') == -1 && order.getBetNum() > 1 ) {
				st = "复式";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : order.getBetType().equals("2") ? "追号" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			String[] betCodes = order.getBetCode().split(";");
			
			
			int[] bonusLevel = new int[6];	// 每个奖金中奖的注数统计
			for ( String _betCode : betCodes ) {
				_betCode = _betCode.replaceAll(",", "\\|");
				List<String> singlist = combAlg.findNmSingComb(_betCode);
				for ( String betCode : singlist ) {
					String[] redBetSelected = betCode.split("\\|");
					/**
					 * 计算连续命中个数
					 */
					int winNum = 0, index = 0;
					for ( int i = 0; i < redBetSelected.length; i++ ) {
						if ( winDesc[i].equals(redBetSelected[i]) ) {
							index++;
						} else {
							if ( winNum < index ) {
								winNum = index;
							}
							index = 0;
						}
					}
					if ( winNum < index ) {
						winNum = index;
					}
					
					switch ( winNum ) {
					case 7:/** 中一等奖 */
						bonusLevel[0]++;
						break;
					case 6:/** 中二等奖 */
						bonusLevel[1]++;
						break;
					case 5:/** 中三等奖 */
						bonusLevel[2]++;
						break;
					case 4:/** 中四等奖 */
						bonusLevel[3]++;
						break;
					case 3:/** 中五等奖 */
						bonusLevel[4]++;
						break;
					case 2:/** 中六等奖 */
						bonusLevel[5]++;
						break;
					}
				}
			}
			so.setPrize(bonusLevel);
			int w = 0;
			for ( int p : bonusLevel ) {
				w += p;
			}
			so.setAllRight(w);
			so.setWrongOne(0);
			rlist.add(so);
		}
		Collections.sort(rlist, new PtComparable());
		obj.setTotalCount(count);
		obj.setList(rlist);
		return obj;
	}
	
	/**
	 * 排列五过关统计
	 */
	@Override
	public MathQueryObject queryPlwQueryObject(Integer storeId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		MathQueryObject obj = new MathQueryObject(pageNo,pageSize);
		Integer licenseId = 2;
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(licenseId, newStopTime, 10);
		Game g = null;
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			if ( null != jsList.get(0).getBonusNumber() ) {
				issue = jsList.get(0).getIssue();
				g = jsList.get(0);
			} else {
				issue = jsList.get(1).getIssue();
				g = jsList.get(1);
			}
		} else {
			Game queryObj = new Game();
			queryObj.setLicenseId(licenseId);
			queryObj.setIssue(issue);
			g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		}
		PassStatisticsService.MathHeader header = new PassStatisticsService.MathHeader();
		header.setGameList(jsList);
		
		int[] bonus = {0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				String[] des = g.getPayDes().split("::");
				String[] sailAndBp = des[1].split("`");
				header.setSail(sailAndBp[0]);
				header.setBonusPool("--");
				
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( int i = 0; i < 1; i++ ) {
					String[] bs1 = bb[i].split("`");
					BonusObject bo = new BonusObject(QXC_BONUS_LEVEL[i], bs1[0], bs1[1]);
					bos.add(bo);
				}
				
				for ( String b : bb ) {
					String[] bs = b.split("`");
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		String[] winDesc = g.getBonusNumber().split("-");
		header.setOpenCodeList(winDesc);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);

		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			DltSchemeObject so = new DltSchemeObject();
			so.setOrder(order);
			String st = "单式";
			if ( order.getBetCode().indexOf(';') == -1 && order.getBetNum() > 1 ) {
				st = "复式";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : order.getBetType().equals("2") ? "追号" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			String[] betCodes = order.getBetCode().split(";");
			
			
			int[] bonusLevel = new int[1];	// 每个奖金中奖的注数统计
			for ( String _betCode : betCodes ) {
				String[] selected = _betCode.split(",");
				
				int winCounter = 0;
				for ( int i = 0; i < selected.length; i++ ) {
					if ( selected[i].contains(winDesc[i]) ) {
						winCounter++;
					}
				}
				if ( winCounter == 5 ) {
					/** 中一等奖 */
					bonusLevel[0]++;
				} 
			}
			so.setPrize(bonusLevel);
			int w = 0;
			for ( int p : bonusLevel ) {
				w += p;
			}
			so.setAllRight(w);
			so.setWrongOne(0);
			rlist.add(so);
		}
		Collections.sort(rlist, new PtComparable());
		obj.setTotalCount(count);
		obj.setList(rlist);
		return obj;
	}
	
	/**
	 * 排列三过关统计
	 */
	@Override
	public MathQueryObject queryPlsQueryObject(Integer storeId, Integer licenseId, String issue, String singleFlag, String succFlag, 
			String type, Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		MathQueryObject obj = new MathQueryObject(pageNo,pageSize);
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(licenseId, newStopTime, 10);
		Game g = null;
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			if ( null != jsList.get(0).getBonusNumber() ) {
				issue = jsList.get(0).getIssue();
				g = jsList.get(0);
			} else {
				issue = jsList.get(1).getIssue();
				g = jsList.get(1);
			}
		} else {
			Game queryObj = new Game();
			queryObj.setLicenseId(licenseId);
			queryObj.setIssue(issue);
			g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		}
		PassStatisticsService.MathHeader header = new PassStatisticsService.MathHeader();
		header.setGameList(jsList);
		
		int[] bonus = {0,0,0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				String[] des = g.getPayDes().split("::");
				String[] sailAndBp = des[1].split("`");
				header.setSail(sailAndBp[0]);
				header.setBonusPool("--");
				
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( int i = 0; i < 3; i++ ) {
					String[] bs1 = bb[i].split("`");
					BonusObject bo = new BonusObject(PLS_BONUS_LEVEL[i], bs1[0], bs1[1]);
					bos.add(bo);
				}
				
				for ( String b : bb ) {
					String[] bs = b.split("`");
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		String[] winDesc = g.getBonusNumber().split("-");
		header.setOpenCodeList(winDesc);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);

		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			DltSchemeObject so = new DltSchemeObject();
			so.setOrder(order);
			String st = "直选";
			if ( order.getPlayType().startsWith("z3") ) {
				st = "组三";
			} else if ( order.getPlayType().startsWith("z6") ) {
				st = "组六";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType((order.getBetType().equals("1") ? "代购" : order.getBetType().equals("2") ? "追号" : "合买")+"_"+st);
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			
			
			int[] bonusLevel = new int[3];	// 每个奖金中奖的注数统计
			if ( order.getPlayType().startsWith("z3") ) {
				if ( order.getFiniBonus() > 0 ) {
					bonusLevel[1]++;
				}
			} else if ( order.getPlayType().startsWith("z6") ) {
				if ( order.getFiniBonus() > 0 ) {
					bonusLevel[2]++;
				}
			} else {
				if ( order.getFiniBonus() > 0 ) {
					bonusLevel[0]++;
				}
			}
			so.setPrize(bonusLevel);
			int w = 0;
			for ( int p : bonusLevel ) {
				w += p;
			}
			so.setAllRight(w);
			so.setWrongOne(0);
			rlist.add(so);
		}
		Collections.sort(rlist, new PtComparable());
		obj.setTotalCount(count);
		obj.setList(rlist);
		return obj;
	}

	/**
	 * 足彩过关统计
	 */
	@Override
	public FootballQueryObject queryFootballQueryObject(Integer storeId, Integer licenseId,
			String issue, String singleFlag, String succFlag, String type,
			Integer userid, String username, Integer pageNo, Integer pageSize) {
		
		Integer queryLicenseId = licenseId == Constants.LICENSE_R9 ? Constants.LICENSE_14SFC : licenseId;
		
		String newStopTime = df.format(new Date());
		List<Game> jsList = this.gameMapper.getPreGames(new Integer(queryLicenseId), newStopTime, 10);
		if ( null == issue || "".equals(issue) ) {
			// 取出上期
			issue = jsList.get(0).getIssue();
		}
		
		PassStatisticsService.FootballHeader header = new PassStatisticsService.FootballHeader();
		header.setGameList(jsList);
		
		Game queryObj = new Game();
		queryObj.setLicenseId(queryLicenseId);
		queryObj.setIssue(issue);
		Game g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		
		int[] bonus = {0,0,0};	//	税前奖金
		if ( null != g ) {
			header.setOpenDate(g.getDopayTime());
			List<BonusObject> bos = new ArrayList<BonusObject>();
			if ( null != g.getPayDes() ) {
				// 0`0|0`0|45`142,544::10,295,094`10,022,644`11,288,545
				String[] des = g.getPayDes().split("::");
				// 14场销量和任九销量、奖池
				String[] sailAndBp = des[1].split("`");
				if ( licenseId == Constants.LICENSE_14SFC ) {
					header.setSail(sailAndBp[0]);
					header.setBonusPool(sailAndBp[2]);
				} else if ( licenseId == Constants.LICENSE_R9 ) {
					header.setSail(sailAndBp[1]);
					header.setBonusPool(sailAndBp[2]);
				} else {
					header.setSail(sailAndBp[0]);
					header.setBonusPool(sailAndBp[1]);
				}
				// 每注奖金
				String[] bb = des[0].split("\\|");
				int index = 0;
				for ( String b : bb ) {
					String[] bs = b.split("`");
					BonusObject bo = new BonusObject(BONUS_LEVEL[index], bs[0], bs[1]);
					try {
						bonus[index] = Integer.valueOf(bs[1].replaceAll(",", ""));
					} catch ( Exception ex ){}
					bos.add(bo);
					index++;
				}
				
			}
			header.setBos(bos);
			
		}
		
		List<Against> againstList = new ArrayList<Against>();
		List<GameZcAgainst> slist = this.gameZcAgainstMapper.getGameZcAgainstByLicenseAndIssue(queryLicenseId , issue);
		String[] bns = null;
		//int openSch = 0;	// 已开场次数
		if ( null!= g && null != g.getBonusNumber() ) {
			// 1::1,2::1,3::0,4::0,5::0,6::1,7::3,8::3,9::1,10::3,11::3,12::0,13::1,14::1
			bns = g.getBonusNumber().split(",");
			/*for ( String bn : bns ) {
				if ( !bn.split("::")[1].equals("*") ) {
					openSch++;
				}
			}*/
		}
		/*if ( openSch > 9 && licenseId == Constants.LICENSE_R9 ) {
			openSch = 9;
		}*/
		
		if ( licenseId == Constants.LICENSE_14SFC || licenseId == Constants.LICENSE_R9 ) {
			int index = 0;
			for ( GameZcAgainst gza : slist ) {
				Against a = new Against(gza.getHostTeam(), gza.getGuestTeam(), bns[index].split("::")[1]);
				againstList.add(a);
				index++;
			}
		} else if ( licenseId == Constants.LICENSE_6CBQ ) {
			int index = 0;
			for ( GameZcAgainst gza : slist ) {
				Against a = new Against(gza.getHostTeam()+"（半）", gza.getGuestTeam()+"（半）", bns[index*2].split("::")[1]);
				againstList.add(a);
				Against a1 = new Against(gza.getHostTeam()+"（全）", gza.getGuestTeam()+"（全）", bns[index*2+1].split("::")[1]);
				againstList.add(a1);
				index++;
			}
		} else if ( licenseId == Constants.LICENSE_4JQ ) {
			int index = 0;
			for ( GameZcAgainst gza : slist ) {
				Against a = new Against(gza.getHostTeam(), gza.getGuestTeam(), bns[index*2].split("::")[1]);
				againstList.add(a);
				Against a1 = new Against(gza.getGuestTeam(), gza.getGuestTeam(), bns[index*2+1].split("::")[1]);
				againstList.add(a1);
				index++;
			}
		}
		 
		header.setLicenseName(GameUtil.GAMESMAP.get(licenseId+""));
		header.setIssue(issue);
		header.setAgainstList(againstList);
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 80;
		}
		FootballQueryObject obj = new FootballQueryObject(pageNo,pageSize);
		
		obj.setHeader(header);
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, issue, singleFlag, succFlag, type, userid, username, pageNo, pageSize);
		int count = this.lotteryOrderMapper.selectCount2PassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2PassStat(queryObject);
		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			SchemeObject so = new SchemeObject();
			so.setOrder(order);
			String st = "单式";
			if ( order.getBetCode().indexOf(';') == -1 && order.getBetNum() > 1 ) {
				st = "复式";
			}
			so.setSingleType( st );
			so.setOrderId(order.getId());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			String[] betCodes = order.getBetCode().split(";");
			
			int winNum = 0;		//	命中场次
			if ( betCodes.length == 1 ) {
				List<String> singlist = null;
				if ( order.getBetCode().indexOf(':') > -1 ) {
					List<String> ssinglist = FootballService.getInstance().divRxjBetString(order.getBetCode());
					singlist = new ArrayList<String>();
					for ( String ss : ssinglist ) {
						List<String> ll = FootballService.getInstance().findNmComb(ss);
						for ( String sss : ll ) {
							singlist.add(sss);
						}
					}
				} else {
					singlist = combAlg.findNmSingComb(betCodes[0].replaceAll(",", "|"));
				}
				betCodes = singlist.toArray(new String[0]);
			} else {
				List<String> singlist = new ArrayList<String>();
				for ( String betCode : betCodes ) {
					if ( betCode.indexOf(':') > -1 ) {
						List<String> ssinglist = FootballService.getInstance().divRxjBetString(betCode);
						for ( String ss : ssinglist ) {
							List<String> ll = FootballService.getInstance().findNmComb(ss);
							for ( String sss : ll ) {
								singlist.add(sss);
							}
						}
					} else {
						singlist.addAll(combAlg.findNmSingComb(betCode.replaceAll(",", "|")));
					}
				}
				betCodes = singlist.toArray(new String[0]);
			}
			
			int allRightNum = 0;	//	全对注数
			int wrongOneNum = 0;	//	错一注数
			int dsMaxWin = 0;	// 命中最多场次的单式
			if ( null != bns ) {
				int[] wins = {0,0,0,0,0,0,0,0,0,0,0,0,0,0};
				for ( String betCode : betCodes ) {
					int winbetNum = 0; // 命中统计
					String[] codes = betCode.replaceAll("\\|", ",").split(",");
					int inx = 0;
					int openSch = 0;
					for ( String bn : bns ) {
						if ( !bn.split("::")[1].equals("*") && !codes[inx].equals("#") ) {
							openSch++;
						}
						inx++;
					}
					inx = 0;
					int dsWin = 0;
					for ( String code : codes ) {
						if ( code.contains(bns[inx].split("::")[1]) ) {
							winbetNum++;
							dsWin++;
							if ( wins[inx] == 0 ) {
								wins[inx] = 1;
							}
						}
						inx++;
					}
					if ( dsWin > dsMaxWin ) {
						dsMaxWin = dsWin;
					}
					if ( winbetNum == openSch ) {
						allRightNum++;
					}
					if ( winbetNum == openSch - 1 ) {
						wrongOneNum++;
					}
				}
				winNum = 0;
				if ( order.getBetCode().indexOf(';') == -1  ) {
					for ( int i : wins ) {
						winNum += i;
					}
				}
				if ( allRightNum > 0 ) {
					so.setAllRightNum("<font color=red>"+allRightNum+"</font>");
				} else {
					so.setAllRightNum(allRightNum+"");
				}
				if ( wrongOneNum > 0 && licenseId == Constants.LICENSE_14SFC ) {
					so.setWrongOneNum("<font color=red>"+wrongOneNum+"</font>");
				} else {
					so.setWrongOneNum(wrongOneNum+"");
				}
			} else {
				so.setAllRightNum("-");
				so.setWrongOneNum("-");
			}
			if ( winNum > 0 ) {
				so.setWinNum(winNum+"");
			} else {
				if ( order.getBetCode().indexOf(';') == -1  ) {
					so.setWinNum(winNum+"");
				} else {
					so.setWinNum(dsMaxWin+"");
				}
			}
			so.setAllRight(allRightNum);
			so.setWrongOne(wrongOneNum);
			
			if ( "2".equals(succFlag) ) {
				// 流单方案显示奖金
				double lb = 0;
				if ( licenseId == 5 ) {
					lb = bonus[0] * allRightNum * order.getMultiple() + bonus[1] * wrongOneNum * order.getMultiple();
				} else if ( licenseId == 6 ) {
					lb = bonus[2] * allRightNum * order.getMultiple();
				} else {
					lb = bonus[0] * allRightNum * order.getMultiple();
				}
				order.setFiniBonus(lb);
			}
			order.setBetCode("");
			rlist.add(so);
		}
		obj.setTotalCount(count);
		Collections.sort(rlist, new PtComparable());
		obj.setList(rlist);
		return obj;
	}
	
	public static class PtComparable implements Comparator<SchemeObject> {
		public int compare(SchemeObject pro1, SchemeObject pro2) {
			int result = 0;   
			int pro1name = pro1.getAllRight();   
			int pro2name = pro2.getAllRight(); 
			int pro11name = pro1.getWrongOne();   
			int pro22name = pro2.getWrongOne(); 
	        if ( pro1name < pro2name )  {
	        	result = 1;
	        } else if ( pro1name == pro2name )  {
	        	if ( pro11name < pro22name )  {
		        	result = 1;
		        }
	        } else {
	        	result = -1;
	        }
	        return result;   
		}   
	}
	
	public static class GuessComparable implements Comparator<SchemeObject> {
		public int compare(SchemeObject pro1, SchemeObject pro2) {
			int result = 0;   
			double pro1name = pro1.getOrder().getFiniBonus();   
			double pro2name = pro2.getOrder().getFiniBonus(); 
	        if ( pro1name < pro2name )  {
	        	result = 1;
	        } else if ( pro1name > pro2name )  {
	        	result = -1;
	        } 
	        return result;   
		}   
	}
	
	/**
	 * 竞彩过关统计
	 */
	@Override
	public Pagination queryGuessQueryObject(Integer storeId, Integer licenseId,
			String selDate, String singleFlag, String succFlag, String type,
			Integer userid, String username, Integer pageNo, Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		
		if ( null != username ) {
			username = 	"%"+username+"%";
		}
		
		selDate = selDate+"%";
		
		//String stopTime = DateUtil.getDayBefore("yyyy-MM-dd HH:mm:ss", 7);
		
		PassStatisticsQueryObject queryObject = new PassStatisticsQueryObject(storeId, licenseId, "1", singleFlag, succFlag, type, userid, username, pageNo, pageSize, selDate);
		
		int count = this.lotteryOrderMapper.selectCount2GuessPassStat(queryObject);
		List<LotteryOrder> orders = this.lotteryOrderMapper.selectList2GuessPassStat(queryObject);
		List<SchemeObject> rlist = new ArrayList<SchemeObject>();
		for ( LotteryOrder order : orders ) {
			SchemeObject so = new SchemeObject();
			so.setOrder(order);
			so.setOrderId(order.getId());
			so.setOrderDate(order.getOrderDate());
			so.setLicenseId(order.getLicenseId());
			so.setUserid(order.getUserid());
			so.setSchemeType(order.getBetType().equals("1") ? "代购" : "合买");
			so.setLauchMember(order.getUsername());
			so.setBetNum(order.getBetNum());
			so.setPlayName(GameUtil.getGameName(licenseId, order.getPlayType(), 0));
			String[] betCodes = order.getBetCode().split("\\|");
			so.setSchNum(betCodes.length);
			if ( "1c1".equals(order.getPassType()) ) {
				so.setPassType("单关");
			} else {
				if ( null != order.getPassType() ) {
					so.setPassType(order.getPassType().replaceAll("c", "串"));
				} else {
					so.setPassType("-");
				}
			}
			so.setSuccFlag(order.getStateName3());
			// 命中场次数
			int win = 0;
			int openNum = 0;
			boolean ds = !"0".equals(order.getSingleFlag());
			Map dsMap = new Hashtable();
			for ( String betCode : betCodes ) {
				String id = betCode.split(":")[0];
				if ( licenseId == 9 || licenseId == 10 ) {
					GameJcAgainst gja = this.gameJcAgainstMapper.selectByScheduleId(order.getLicenseId(), id.substring(0, 8), id.substring(8));
					if ( ds ) {
						dsMap.put(gja.getRaceTime()+gja.getNumber(), gja);
					}
					if ( null != gja && null != gja.getAllScore() ) {
						openNum++;
						String[] betInfo = betCode.split(":")[1].split(",");
						for ( String b : betInfo ) {
							if ( "*:*".equals(gja.getAllScore()) || JcUtil.isWinedBet(order.getLicenseId(), Integer.valueOf(order.getPlayType()), b, gja)) {
								win++;
								break;
							}
						}
					}
				} else if ( licenseId == 21 ) {
					GameBjdcAgainst gja = this.gameBjdcAgainstMapper.selectByIssueAndNumber(order.getIssue(), id.substring(8));
					if ( ds ) {
						dsMap.put(gja.getUuid(), gja);
					}
					if ( null != gja && null != gja.getAllScore() ) {
						openNum++;
						String[] betInfo = betCode.split(":")[1].split(",");
						for ( String b : betInfo ) {
							if ( "*:*".equals(gja.getAllScore()) || BjDcUtil.isWinedBet(order.getLicenseId(), Integer.valueOf(order.getPlayType()), b, gja)) {
								win++;
								break;
							}
						}
					}
				} else if ( licenseId == 22 ) {
					GameSfggAgainst gja = this.gameSfggAgainstMapper.selectByIssueAndNumber(order.getIssue(), id.substring(8));
					if ( ds ) {
						dsMap.put(gja.getUuid(), gja);
					}
					if ( null != gja && null != gja.getAllScore() ) {
						openNum++;
						String[] betInfo = betCode.split(":")[1].split(",");
						for ( String b : betInfo ) {
							if ( "*:*".equals(gja.getAllScore()) || SfGgUtil.isWinedBet(order.getLicenseId(), Integer.valueOf(order.getPlayType()), b, gja)) {
								win++;
								break;
							}
						}
					}
				} 
			}
			// 单式号码
			if ( ds ) {
				int allRight = 0;
				List<LotteryTicket> list = this.lotteryTicketMapper.selectByOrderId(order.getId(), null);
				for ( LotteryTicket lt : list ) {
					int swin = 0;
					String betCode = lt.getBetCode();
					String[] _betCodes = betCode.split("\\|");
					if ( licenseId == 9 || licenseId == 10 ) {
						for ( String _betCode : _betCodes ) {
							String[] betInfo = _betCode.split(":");
							GameJcAgainst gja = (GameJcAgainst)dsMap.get(betInfo[0]);
							if ( null != gja && null != gja.getAllScore() ) {
								if ( "*:*".equals(gja.getAllScore()) || JcUtil.isWinedBet(order.getLicenseId(), Integer.valueOf(lt.getPlayType().split("-")[0]), betInfo[1], gja)) {
									swin++;
								}
							}
						}
					} else if ( licenseId == 21 ) {
						for ( String _betCode : _betCodes ) {
							String[] betInfo = _betCode.split(":");
							GameBjdcAgainst gja = (GameBjdcAgainst)dsMap.get(betInfo[0]);
							if ( null != gja && null != gja.getAllScore() ) {
								if ( "*:*".equals(gja.getAllScore()) || BjDcUtil.isWinedBet(order.getLicenseId(), Integer.valueOf(lt.getPlayType().split("-")[0]), betInfo[1], gja)) {
									swin++;
								}
							}
						}
					} else if ( licenseId == 22 ) {
						for ( String _betCode : _betCodes ) {
							String[] betInfo = _betCode.split(":");
							GameSfggAgainst gja = (GameSfggAgainst)dsMap.get(betInfo[0]);
							if ( null != gja && null != gja.getAllScore() ) {
								if ( "*:*".equals(gja.getAllScore()) || SfGgUtil.isWinedBet(order.getLicenseId(), Integer.valueOf(lt.getPlayType().split("-")[0]), betInfo[1], gja)) {
									swin++;
								}
							}
						}
					} 
					if ( swin == openNum ) {
						allRight++;
					}
				}
				so.setAllRightNum(allRight+"");
			} else {
				so.setAllRightNum("-");
			}
			so.setOpenNum(openNum);
			so.setWinNum(win+"");
			rlist.add(so);
		}
		Pagination pagination = new Pagination(pageNo, pageSize);
		pagination.setTotalCount(count);
		Collections.sort(rlist, new GuessComparable());
		pagination.setList(rlist);
		return pagination;
	}

	public static void main(String[] args) {
		ApplicationContext c = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		PassStatisticsService a = (PassStatisticsService)c.getBean("passStatisticsService");
		FootballQueryObject f = a.queryFootballQueryObject(11, 5, null, null, null, null, null, null, null, null);
		System.out.println(f);
	}

}
