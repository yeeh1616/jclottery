/**
 * 
 */
package com.jingc.busi.merger.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jingc.afc.pagination.Pagination;
import com.jingc.afc.util.BjDcUtil;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.afc.util.JcUtil;
import com.jingc.afc.util.SfGgUtil;
import com.jingc.busi.common.mapper.GameBjdcAgainstMapper;
import com.jingc.busi.common.mapper.GameJcAgainstMapper;
import com.jingc.busi.common.mapper.GameMapper;
import com.jingc.busi.common.mapper.GameSfggAgainstMapper;
import com.jingc.busi.common.mapper.GameZcAgainstMapper;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.mapper.MergerCustomMapper;
import com.jingc.busi.common.mapper.MergerJoinMapper;
import com.jingc.busi.common.mapper.MergerOrderMapper;
import com.jingc.busi.common.table.Game;
import com.jingc.busi.common.table.GameJcAgainst;
import com.jingc.busi.common.table.GameSfggAgainst;
import com.jingc.busi.common.table.GameZcAgainst;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.common.table.MergerCustom;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: MergerServiceImpl.java</p>
 * <p>Desc: 合买查询业务实现</p>
 * <p>Copyright: Copyright (c) 2013</p> 
 * <p>Company: 北京中科易达科技发展有限责任公司</p> 
 * @author  luochang
 * @version 1.0 2014-3-4
 * <p>          修改者姓名 修改内容说明</p>
 * @see     参考类1
 */
@Service("mergerQueryService")
public class MergerQueryServiceImpl implements MergerQueryService {
	@Resource
	private MergerOrderMapper mergerOrderMapper;
	
	@Resource
	private LotteryOrderMapper lotteryOrderMapper;
    @Resource LotteryTicketMapper lotteryTicketMapper;
	
	@Resource
	private MergerJoinMapper mergerJoinMapper;

	@Resource
	private GameJcAgainstMapper gameJcAgainstMapper;
	
	@Resource
	private GameZcAgainstMapper gameZcAgainstMapper;
	
	@Resource
	private GameSfggAgainstMapper gameSfggAgainstMapper;
	
	@Resource
	private GameBjdcAgainstMapper gameBjdcAgainstMapper;
	
	@Resource
	private MergerCustomMapper mergerCustomMapper;
	
	@Resource
	private GameMapper gameMapper;
	
	/**
	 * 奖金格式化
	 */
	protected DecimalFormat moneyFmt = new DecimalFormat("#############.##");
	
	/**
	 * 获取合买记录
	 * @param pageNo
	 * @param pageSize
	 * @param param
	 * @return
	 */
	public Pagination getMergerJoinRecord(Integer pageNo, Integer pageSize, MergerJoin param){
		Pagination pagination = new Pagination(pageNo,pageSize);
		pagination.setTotalCount(this.mergerJoinMapper.countByParam(param, pagination));
		List<MergerJoin> list = this.mergerJoinMapper.selectByParam(param, pagination);
		pagination.setList(list);
		return pagination;
	}
	
    /**
     * 获取合买订单记录
     * @param param
     * @param pageNo
     * @param pageSize
     * @return
     */
	@Override
	public Pagination getMergerOrder(MergerOrder param, Integer pageNo,
			Integer pageSize) {
		if ( null == pageNo ) {
			pageNo = 1;
		}
		if ( null == pageSize ) {
			pageSize = 40;
		}
		
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = (int) this.mergerOrderMapper.selectMergerOrderCountByParamObject(param);
		pagination.setTotalCount(count);
		List<MergerOrder> list = this.mergerOrderMapper.selectMergerOrderByParamObject(param, pagination);
		pagination.setList(list);
		return pagination;
	}
    /**
     * 获取合买订单记录(by licenseId)
     * @param param
     * @param pageNo
     * @param pageSize
     * @param licenseId
     * @return
     */
	@Override
	public Pagination getMergerOrderByLicenseId(MergerOrder param,
			Integer pageNo, Integer pageSize, Integer licenseId) {
		
		param.setLicenseId(licenseId);
		return getMergerOrder(param, pageNo, pageSize);
	}
    /**
     * 查询合买订单记录
     * @param param
     * @return
     */
	@Override
	public MergerOrder selectMergerOrder(MergerOrder param) {
		MergerOrder mo = this.mergerOrderMapper.selectByPrimaryKey(param.getId());
		return mo;
	}
    /**
     * 根据orderId查询LotteryOrder
     * @param param
     * @return
     */
	@Override
	public LotteryOrder selectLotteryOrderByPartnerNoOnly(Integer orderId) {
		LotteryOrder lo = this.lotteryOrderMapper.selectByPartnerNo(orderId);
		return lo;
	}

    /**
     * 查询参与合买记录(MergerJoin)
     * @param param
     * @return
     */
	@Override
	public Pagination getMergerJoin(MergerJoin param, Integer pageNo,
			Integer pageSize) {
    	Pagination pagination = new Pagination(pageNo,pageSize);
		int count = (int) this.mergerJoinMapper.selectMergerJoinCountByParamObject(param);
		pagination.setTotalCount(count);
		List<MergerJoin> list = this.mergerJoinMapper.selectMergerJoinByParamObject(param, pagination);
		pagination.setList(list);
		return pagination;
	}
    /**
     * 查询精彩对阵表
     * @param licenseId
     * @param raceTime
     * @param number
     * @return
     */
	@Override
	public GameJcAgainst selectGameJcAgainstByScheduleId(Integer licenseId,String raceTime,String number){
		GameJcAgainst gameJcAgainst = this.gameJcAgainstMapper.selectByScheduleId(licenseId, raceTime, number);
		return gameJcAgainst;		
	}
    /**
     * 查询参与合买人数
     * @return
     */
	@Override
	public Integer selectCountOfMergerJoinRecords() {
		Integer numRecords = this.mergerJoinMapper.selectCountOfMergerJoinRecords();
		return numRecords;
	}
    /**
     * 查询传统足彩对阵表
     * @param licenseId
     * @param issue
     * @return
     */
	@Override
	public List<GameZcAgainst> getGameZcAgainstByLicenseAndIssueOrderByGameId(Integer licenseId, String issue) {
		List<GameZcAgainst> list = this.gameZcAgainstMapper.getGameZcAgainstByLicenseAndIssueOrderByGameId(licenseId,issue);
		return list;
	}
	
    /**
     * 处理足彩的betCode
     * @param betCode
     * @return
     */
	public List<String[]> getListOfBetCode(LotteryOrder lo) {
		List<String[]> betList = new ArrayList<String[]>();
		//betCode = "1:1`2,2:3`1,3:31`1,4:1`1,5:#`1,6:#`1,7:1`1,8:1`1,9:10`1,10:0`1,11:#`1,12:10`1,13:#`1,14:#`1";
		// 查询开奖信息
		Game queryObj = new Game();
		queryObj.setLicenseId(lo.getLicenseId() == 6 ? 5 : lo.getLicenseId());
		queryObj.setIssue(lo.getIssue());
		Game g = this.gameMapper.selectByIssueAndLicenseId(queryObj);
		String bonusNumber = null;
		if ( null != g ) {
			bonusNumber = g.getBonusNumber();
		}
		if ( !"1".equals(lo.getSingleFlag()) && null != bonusNumber ) {
			
			String[] arrBetCodes = lo.getBetCode().split(";");
			String[] bb = bonusNumber.split(",");
			for ( String betCode : arrBetCodes ) {
				String[] opts = betCode.split(",");
				int index = 0;
				String nc = "";
				for ( String bet : opts ) {
					if ( bet.indexOf(':') == -1 ) {
						char[] cc = bet.toCharArray();
						for ( char c : cc ) {
							if ( bb[index].split("::")[1].equals(c+"") ) {
								nc += "<font color=red>"+c+"</font>";
							} else {
								nc += ""+c+"";
							}
						}
						nc += ",";
					} else {
						// 任九
						String[] pp = bet.split(":");
						char[] cc = pp[1].split("`")[0].toCharArray();
						for ( char c : cc ) {
							if ( bb[index].split("::")[1].equals(c+"") ) {
								nc += "<font color=red>"+c+"</font>";
							} else {
								nc += ""+c+"";
							}
						}
						if ( "0".equals(pp[1].split("`")[1] )) {
							nc += "(胆)";
						}
						nc += ",";
					}
					index++;
				}
				nc = nc.substring(0, nc.length()-1);
				betList.add(nc.split(","));
			}
		} else {
			String betCode = lo.getBetCode();
			String[] betCodeLines = betCode.split(";");
			int numOfBetCodeLines = betCodeLines.length;
			for(int i=0;i<numOfBetCodeLines;i++){
				String[] strBetCodeLine = betCodeLines[i].split(",");
				if(strBetCodeLine[0].contains(":") && strBetCodeLine[0].contains("`")){
					for(int j=0;j<strBetCodeLine.length;j++){
						strBetCodeLine[j] = strBetCodeLine[j].replaceAll("`",":");
						String[] strTemp = strBetCodeLine[j].split(":");
						if(strTemp[2].equals("0")){
							strBetCodeLine[j] = strTemp[1] + "(胆)";
						}else{
							strBetCodeLine[j] = strTemp[1];
						}
					}
				}
				List<String> list = Arrays.asList(strBetCodeLine);
				betList.add(list.toArray(new String[0]));
			}
		}
		/*if(betCode.contains(";")){
			String[] betCodeLines = betCode.split(";");
			int numOfBetCodeLines = betCodeLines.length;
			for(int i=0;i<numOfBetCodeLines;i++){
				String[] strBetCodeLine = betCodeLines[i].split(",");
				lists = Arrays.asList(strBetCodeLine);
			}
		}else{
			String[] strBetCodeLine = betCode.split(",");
			lists = Arrays.asList(strBetCodeLine);
		}*/
		return betList;
	}

    /**
     * 处理数字彩的betCode
     * @param betCode
     * @return
     */
	@Override
	public List<String> getListOfBetCodeSZC(String betCode) {
		String[] betCodeArr = betCode.split(";");
		List<String> listBetCodeSZC = Arrays.asList(betCodeArr);
		return listBetCodeSZC;
	}
	
    /**
     * 合买详情页的分类(数字彩，竞技彩，足彩)
     * @param LotteryOrder
     * @param MergerOrder
     * @param ModelAndView
     * @return
     */
	@Override
	public ModelAndView groupsByLicenseId(LotteryOrder lo, MergerOrder mo,
			ModelAndView mv) {
		// 查询定制，中奖等信息 added at 2015/09/10 by luochang
		HrbDetail hrb = new HrbDetail();
		MergerCustom cm = new MergerCustom();
		cm.setCustomizedMemberId(lo.getUserid());
		cm.setLicenseId(lo.getLicenseId());
		Integer cusNum = this.mergerCustomMapper.selectCountByParamObject(cm);
		hrb.setCusNum(cusNum);
		// 战绩等级 0-5000,1等级，5000-30000,2等级，30000-100000，3等级，100000-1000000，4等级，大于1000000，5等级
		double prize = 0;
		int level = 0;
		Double d = this.lotteryOrderMapper.totalMergerPrize(lo.getUserid());
		if ( null != d ) {
			prize = d;
			if ( prize > 0 && prize < 5000 ) {
				level = 1;
			} else if ( prize < 30000 ) {
				level = 2;
			} else if ( prize < 100000 ) {
				level = 3;
			} else if ( prize < 1000000 ) {
				level = 4;
			} else {
				level = 5;
			}
		}
		hrb.setLevel(level);
		hrb.setLastLevel(5-level);
		if ( lo.getBetState().equals("10") ||
				lo.getBetState().equals("12") || lo.getBetState().equals("13") ) {
			// 中奖
			hrb.setBonusAftTax(moneyFmt.format(lo.getFiniBonus()));
			// 给发起人派发佣金
			if ( lo.getFiniBonus() > lo.getBetPrice() ) {
				double brokerage = (lo.getFiniBonus() - lo.getBetPrice()) * mo.getBrokerage();
				hrb.setBrok(moneyFmt.format(brokerage));
				brokerage = new Double(moneyFmt.format(brokerage));
				double p = (lo.getFiniBonus() - brokerage) / mo.getTotalNum();
				hrb.setPerBonus(moneyFmt.format(p));
			} else {
				hrb.setBrok("0.00");
				double p = lo.getFiniBonus() / mo.getTotalNum();
				hrb.setPerBonus(moneyFmt.format(p));
			}
			
		}
		mv.addObject("hrb", hrb);
		
		if ( lo.getLicenseId() == GameUtil.GAMEIDPLS
				   ||lo.getLicenseId() > 100
				   ||lo.getLicenseId() == GameUtil.GAMEIDPLW
				   ||lo.getLicenseId() == GameUtil.GAMEIDQXC
				   ||lo.getLicenseId() == GameUtil.GAMEIDDLT
				   ||lo.getLicenseId() == GameUtil.GAMEIDSSQ
				   ||lo.getLicenseId() == GameUtil.GAMEIDF3D
				   ||lo.getLicenseId() == Constants.LICENSE_FJ31X7
				   ||lo.getLicenseId() == Constants.LICENSE_20X5
				   ||lo.getLicenseId() == Constants.LICENSE_LJY
				   ||lo.getLicenseId() == Constants.LICENSE_JSQWS
				   ||lo.getLicenseId() == GameUtil.GAMEIDQLC) {//"数字彩"
					
					List<String> szcList = this.getListOfBetCodeSZC(lo.getBetCode());
		    		mv.addObject("szcList",szcList);
		    		mv.setViewName("merger/mergerDetailsSZC");
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDSFC
		    			 ||lo.getLicenseId() == GameUtil.GAMEIDRXJ
		    			 ||lo.getLicenseId() == GameUtil.GAMEIDBQC
		    			 ||lo.getLicenseId() == GameUtil.GAMEIDJQC) {//"足彩";
		    		Integer licenseIdTemp;
		    		if(lo.getLicenseId() == 6){//任选九与胜负彩是同一个彩种，查询精彩对阵时统一用彩种5
			    		licenseIdTemp = 5;
		    		}else{
		    			licenseIdTemp = lo.getLicenseId();
		    		}
		    		List<GameZcAgainst> zcList = this.getGameZcAgainstByLicenseAndIssueOrderByGameId(licenseIdTemp, lo.getIssue());//
		    		//String temp = lo.getBetCode();
		    		List<String[]> betCodeLists = this.getListOfBetCode(lo);
		    		mv.addObject("betCodeLists",betCodeLists);
		    		mv.addObject("zcList",zcList);
		    		mv.setViewName("merger/mergerDetailsZC");
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDJCZQ || lo.getLicenseId() == GameUtil.GAMEIDJCLQ
		    			|| lo.getLicenseId() == Constants.LICENSE_SFGG || lo.getLicenseId() == Constants.LICENSE_BJDC) {
		    		GameJcAgainst jc = new GameJcAgainst();
		    		List<GameJcAgainst> jcList = new ArrayList<GameJcAgainst>();
		    		String betCode = lo.getBetCode();
		    		String playType = lo.getPlayType();
		    		String[] betCodeArr = betCode.split("[|]");
		    		int numberOfGames = betCodeArr.length;
		    		mv.addObject("order", lo);
		    		mv.addObject("ndate", DateUtil.getDateFormat2());
		    		mv.addObject("playType",GameUtil.getGameName(lo.getLicenseId(), playType, 0));
		    		if ( !"".equals(betCode) ) {
		    			mv.addObject("numberOfGames",numberOfGames);//"场次";
			    		for(int i=0;i<betCodeArr.length;i++){
			       			String[] itemPieces = betCodeArr[i].split(":");
			    			String raceTime = itemPieces[0].substring(0, 8);
			    			String number = itemPieces[0].substring(8);
			    			
			    			if ( lo.getLicenseId() == GameUtil.GAMEIDJCZQ || lo.getLicenseId() == GameUtil.GAMEIDJCLQ ) {
				    			jc = this.selectGameJcAgainstByScheduleId(lo.getLicenseId(), raceTime, number);
				    			
				        		if(jc != null){
				        			String bets = "";
				        			String[] betInfo = itemPieces[1].split(",");
				        			for ( String b : betInfo ) {
				        				if ( lo.getLicenseId() == Constants.LICENSE_JCZQ ) {
											bets += JcUtil.getBetInfo(lo.getLicenseId(), Integer.valueOf(lo.getPlayType()), b, jc) + ",";
										} else {
											String[] pp = getBasketballRqZf(lo, betCode.split(":")[0]).split(",");
											bets += JcUtil.getBetInfo(lo.getLicenseId(), Integer.valueOf(lo.getPlayType()), b, jc, pp[0], pp[1]) + ",";
										}
				        			}
				        			bets = bets.substring(0, bets.length() - 1);
				        			jc.setShowBetItemForJC(bets);
				        			jc.setIsDan(itemPieces[2].toString());
				        		    jc.setSchdule(DateUtil.dayForWeek("yyyyMMdd", jc.getRaceTime()) + number);//------
				        			jcList.add(jc);
				        		}
			    			} else { // 北单
			    				GameSfggAgainst g = null;
			    				if ( lo.getLicenseId() == Constants.LICENSE_SFGG ) {
			    					g = this.gameSfggAgainstMapper.selectByIssueAndNumber(lo.getIssue(), itemPieces[0].substring(8));
			    				} else {
			    					g = this.gameBjdcAgainstMapper.selectByIssueAndNumber(lo.getIssue(), itemPieces[0].substring(8));
			    				}
			    				if ( null != g ) {
			    					String bets = "";
				        			String[] betInfo = itemPieces[1].split(",");
				        			for ( String b : betInfo ) {
				        				if ( lo.getLicenseId() == Constants.LICENSE_SFGG ) {
				        					bets += SfGgUtil.getBetInfo(b, g) + ",";
				        				} else {
				        					bets += BjDcUtil.getBetInfo(Integer.valueOf(lo.getPlayType()), b, g) + ",";
				        				}
				        			}
				        			jc = new GameJcAgainst();
				        			jc.setHostTeam(g.getHostTeam());
				        			jc.setGuestTeam(g.getGuestTeam());
				        			bets = bets.substring(0, bets.length() - 1);
				        			jc.setShowBetItemForJC(bets);
				        			jc.setIsDan(itemPieces[2].toString());
				        			jc.setAllScore(g.getAllScore());
				        			jc.setHalfScore(g.getHalfScore());
				        		    jc.setSchdule(lo.getIssue() + "期" + number);//------
				        			jcList.add(jc);
			    				}
			    			}
			    		}
		    		} else {
		    			mv.addObject("numberOfGames","-");//"场次";
		    		}
		    		mv.addObject("jcList",jcList);//"竞彩";
		    		mv.setViewName("merger/mergerDetailsJC");
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDSD11X5 ) {
		    		//"11运夺金";
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDHNXYSC ) {
		    		//"湖南幸运赛车";
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEEFREQJXSSC ) {
		    		//"江西时时彩";
		    	}
		return mv;
	}
	
	public String getBasketballRqZf(LotteryOrder lo, String sid) {
		String rq = "0";
		String zf = "0";
		
		List<LotteryTicket> ticketList = this.lotteryTicketMapper.selectByOrderId(lo.getId(), new Pagination(1,10));
		for ( LotteryTicket lt : ticketList ) {
			String[] betCodes = lt.getBetCode().split("\\|");
			String[] rqs = lt.getOrderRqs().split(",");
			int len = rqs.length;
			if ( null != lt.getTicketRqs() ) {
				rqs = lt.getTicketRqs().split(",");
			}
			if ( lt.getPlayType().startsWith("2-") ) {
				for (int i = 0; i < len; i++ ) {
					if ( betCodes[i].split(":")[0].equals(sid) ) {
						rq = rqs[i];
						break;
					}
				}
			} else if ( lt.getPlayType().startsWith("4-") ) {
				for (int i = 0; i < len; i++ ) {
					if ( betCodes[i].split(":")[0].equals(sid) ) {
						zf = rqs[i];
						break;
					}
				}
			} else if ( lt.getPlayType().startsWith("6-") ) {
				for (int i = 0; i < len; i++ ) {
					String[] pp = betCodes[i].split(":");
					if ( pp[0].equals(sid) ) {
						if ( pp[1].startsWith("2-") ) {
							rq = rqs[i];
							break;
						} else if ( pp[1].startsWith("4-") ) {
							zf = rqs[i];
							break;
						} 
						
					}
				}
			}
			if ( (!"0".equals(rq)) && (!"0".equals(zf)) ) {
				break;
			}
		}
		return rq + "," + zf;
	}
	
	/**
     * 我的团队——合买详情页的分类(数字彩，竞技彩，足彩) 
     * @param LotteryOrder
     * @param MergerOrder
     * @param ModelAndView
     * @return
     */
	@Override
	public ModelAndView myTeamGroupsByLicenseId(LotteryOrder lo, MergerOrder mo,ModelAndView mv) {
		// 查询定制，中奖等信息 added at 2015/09/10 by luochang
		HrbDetail hrb = new HrbDetail();
		MergerCustom cm = new MergerCustom();
		cm.setCustomizedMemberId(lo.getUserid());
		cm.setLicenseId(lo.getLicenseId());
		Integer cusNum = this.mergerCustomMapper.selectCountByParamObject(cm);
		hrb.setCusNum(cusNum);
		// 战绩等级 0-5000,1等级，5000-30000,2等级，30000-100000，3等级，100000-1000000，4等级，大于1000000，5等级
		double prize = 0;
		int level = 0;
		Double d = this.lotteryOrderMapper.totalMergerPrize(lo.getUserid());
		if ( null != d ) {
			prize = d;
			if ( prize > 0 && prize < 5000 ) {
				level = 1;
			} else if ( prize < 30000 ) {
				level = 2;
			} else if ( prize < 100000 ) {
				level = 3;
			} else if ( prize < 1000000 ) {
				level = 4;
			} else {
				level = 5;
			}
		}
		hrb.setLevel(level);
		hrb.setLastLevel(5-level);
		if ( lo.getBetState().equals("10") ||
				lo.getBetState().equals("12") || lo.getBetState().equals("13") ) {
			// 中奖
			hrb.setBonusAftTax(moneyFmt.format(lo.getFiniBonus()));
			// 给发起人派发佣金
			if ( lo.getFiniBonus() > lo.getBetPrice() ) {
				double brokerage = (lo.getFiniBonus() - lo.getBetPrice()) * mo.getBrokerage();
				hrb.setBrok(moneyFmt.format(brokerage));
				brokerage = new Double(moneyFmt.format(brokerage));
				double p = (lo.getFiniBonus() - brokerage) / mo.getTotalNum();
				hrb.setPerBonus(moneyFmt.format(p));
			} else {
				hrb.setBrok("0.00");
				double p = lo.getFiniBonus() / mo.getTotalNum();
				hrb.setPerBonus(moneyFmt.format(p));
			}
			
		}
		mv.addObject("hrb", hrb);
		
		if ( lo.getLicenseId() == GameUtil.GAMEIDPLS
				   ||lo.getLicenseId() == GameUtil.GAMEIDPLW
				   ||lo.getLicenseId() == GameUtil.GAMEIDPLW
				   ||lo.getLicenseId() == GameUtil.GAMEIDQXC
				   ||lo.getLicenseId() == GameUtil.GAMEIDDLT
				   ||lo.getLicenseId() == GameUtil.GAMEIDSSQ
				   ||lo.getLicenseId() == GameUtil.GAMEIDF3D
				   ||lo.getLicenseId() == GameUtil.GAMEIDQLC) {//"数字彩"
					
					List<String> szcList = this.getListOfBetCodeSZC(lo.getBetCode());
		    		mv.addObject("szcList",szcList);
		    		mv.setViewName("merger/myTeamMergerDetailsSZC");
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDSFC
		    			 ||lo.getLicenseId() == GameUtil.GAMEIDRXJ
		    			 ||lo.getLicenseId() == GameUtil.GAMEIDBQC
		    			 ||lo.getLicenseId() == GameUtil.GAMEIDJQC) {//"足彩";
		    		Integer licenseIdTemp;
		    		if(lo.getLicenseId() == 6){//任选九与胜负彩是同一个彩种，查询精彩对阵时统一用彩种5
			    		licenseIdTemp = 5;
		    		}else{
		    			licenseIdTemp = lo.getLicenseId();
		    		}
		    		List<GameZcAgainst> zcList = this.getGameZcAgainstByLicenseAndIssueOrderByGameId(licenseIdTemp, lo.getIssue());//
		    		//String temp = lo.getBetCode();
		    		List<String[]> betCodeLists = this.getListOfBetCode(lo);
		    		mv.addObject("betCodeLists",betCodeLists);
		    		mv.addObject("zcList",zcList);
		    		mv.setViewName("merger/myTeamMergerDetailsZC");
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDJCZQ || lo.getLicenseId() == GameUtil.GAMEIDJCLQ
		    			|| lo.getLicenseId() == Constants.LICENSE_SFGG || lo.getLicenseId() == Constants.LICENSE_BJDC) {
		    		GameJcAgainst jc = new GameJcAgainst();
		    		List<GameJcAgainst> jcList = new ArrayList<GameJcAgainst>();
		    		String betCode = lo.getBetCode();
		    		String playType = lo.getPlayType();
		    		String[] betCodeArr = betCode.split("[|]");
		    		int numberOfGames = betCodeArr.length;
		    		mv.addObject("order", lo);
		    		mv.addObject("ndate", DateUtil.getDateFormat2());
		    		mv.addObject("playType",GameUtil.getGameName(lo.getLicenseId(), playType, 0));
		    		if ( !"".equals(betCode) ) {
		    			mv.addObject("numberOfGames",numberOfGames);//"场次";
			    		for(int i=0;i<betCodeArr.length;i++){
			       			String[] itemPieces = betCodeArr[i].split(":");
			    			String raceTime = itemPieces[0].substring(0, 8);
			    			String number = itemPieces[0].substring(8);
			    			
			    			if ( lo.getLicenseId() == GameUtil.GAMEIDJCZQ || lo.getLicenseId() == GameUtil.GAMEIDJCLQ ) {
				    			jc = this.selectGameJcAgainstByScheduleId(lo.getLicenseId(), raceTime, number);
				    			
				        		if(jc != null){
				        			String bets = "";
				        			String[] betInfo = itemPieces[1].split(",");
				        			for ( String b : betInfo ) {
				        				bets += JcUtil.getBetInfo(lo.getLicenseId(), Integer.valueOf(lo.getPlayType()), b, jc) + ",";
				        			}
				        			bets = bets.substring(0, bets.length() - 1);
				        			jc.setShowBetItemForJC(bets);
				        			jc.setIsDan(itemPieces[2].toString());
				        		    jc.setSchdule(DateUtil.dayForWeek("yyyyMMdd", jc.getRaceTime()) + number);//------
				        			jcList.add(jc);
				        		}
			    			} else { // 北单
			    				GameSfggAgainst g = null;
			    				if ( lo.getLicenseId() == Constants.LICENSE_SFGG ) {
			    					g = this.gameSfggAgainstMapper.selectByIssueAndNumber(lo.getIssue(), itemPieces[0].substring(8));
			    				} else {
			    					g = this.gameBjdcAgainstMapper.selectByIssueAndNumber(lo.getIssue(), itemPieces[0].substring(8));
			    				}
			    				if ( null != g ) {
			    					String bets = "";
				        			String[] betInfo = itemPieces[1].split(",");
				        			for ( String b : betInfo ) {
				        				if ( lo.getLicenseId() == Constants.LICENSE_SFGG ) {
				        					bets += SfGgUtil.getBetInfo(b, g) + ",";
				        				} else {
				        					bets += BjDcUtil.getBetInfo(Integer.valueOf(lo.getPlayType()), b, g) + ",";
				        				}
				        			}
				        			jc = new GameJcAgainst();
				        			jc.setHostTeam(g.getHostTeam());
				        			jc.setGuestTeam(g.getGuestTeam());
				        			bets = bets.substring(0, bets.length() - 1);
				        			jc.setShowBetItemForJC(bets);
				        			jc.setIsDan(itemPieces[2].toString());
				        			jc.setAllScore(g.getAllScore());
				        			jc.setHalfScore(g.getHalfScore());
				        		    jc.setSchdule(lo.getIssue() + "期" + number);//------
				        			jcList.add(jc);
			    				}
			    			}
			    		}
		    		} else {
		    			mv.addObject("numberOfGames","-");//"场次";
		    		}
		    		mv.addObject("jcList",jcList);//"竞彩";
		    		mv.setViewName("merger/myTeamMergerDetailsJC");
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDSD11X5 ) {
		    		//"11运夺金";
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEIDHNXYSC ) {
		    		//"湖南幸运赛车";
		    	}else if ( lo.getLicenseId() == GameUtil.GAMEEFREQJXSSC ) {
		    		//"江西时时彩";
		    	}
		return mv;
	}
	
    /**
     * 判断当前用户是否是发起人
     * @param orderId
     * @return
     */
	@Override
	public Integer getIsLanucher(Integer userId, Integer orderId) {
		Integer isLanucher = this.mergerOrderMapper.getIsLanucher(userId,orderId);
		return isLanucher;
	}
	
    /**
     * 判断当前用户是否是参与人
     * @param orderId
     * @return
     */
	@Override
	public Integer getIsJoiner(Integer userId, Integer orderId) {
		Integer isJoiner = this.mergerJoinMapper.getIsJoiner(userId,orderId);
		return isJoiner;
	}

    /**
     * 判断合买单是否过期
     * @param orderId
     * @return
     */
	@Override
	public Integer getIsPassDeadline(MergerOrder param) {
		param = this.mergerOrderMapper.getMergerOrderByObject(param);
		if ( null == param.getReserved2() ) {
			return 1;
		}
		java.util.Calendar dateNow=java.util.Calendar.getInstance();
		java.util.Calendar dateDeadline=java.util.Calendar.getInstance();
		
		dateDeadline.setTime(DateUtil.getDate(param.getReserved2(), "yyyy-MM-dd HH:mm:ss"));
		
		Long l = dateNow.getTimeInMillis() - dateDeadline.getTimeInMillis();
		if(l>0){
			return 1;
		}else
			return -1;
	}
}
