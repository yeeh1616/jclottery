/**
 * 
 */
package com.jingc.busi.singleupload.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jingc.afc.exception.BaseException;
import com.jingc.afc.util.Constants;
import com.jingc.afc.util.DateUtil;
import com.jingc.busi.common.mapper.LotteryOrderMapper;
import com.jingc.busi.common.mapper.LotteryTicketMapper;
import com.jingc.busi.common.mapper.MemberAccountMapper;
import com.jingc.busi.common.mapper.MemberMoneyLogMapper;
import com.jingc.busi.common.mapper.MergerJoinMapper;
import com.jingc.busi.common.mapper.MergerOrderMapper;
import com.jingc.busi.common.mapper.StoreMapper;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;
import com.jingc.busi.common.table.Member;
import com.jingc.busi.common.table.MemberAccount;
import com.jingc.busi.common.table.MemberMoneyLog;
import com.jingc.busi.common.table.MergerJoin;
import com.jingc.busi.common.table.MergerOrder;
import com.jingc.busi.common.table.Store;
import com.jingc.busi.common.table.StoreLicense;
import com.jingc.busi.common.table.StoreLicenseKey;
import com.jingc.busi.core.service.CommonService;
import com.jingc.busi.lottery.service.LotteryService;
import com.jingc.busi.lottery.service.LotteryServiceImpl;
import com.jingc.busi.lottery.service.LotteryServiceImpl.TicketSplitorFactory;
import com.jingc.busi.lottery.service.split.FootballService;
import com.jingc.busi.lotteryopen.task.Startup;
import com.jingc.busi.merger.service.MergerService;
import com.jingc.busi.singleupload.parser.GuessSingleUploadParser;
import com.jingc.busi.singleupload.parser.PlsSingleUploadParser;
import com.jingc.busi.singleupload.parser.S11x5SingleUploadParser;
import com.jingc.busi.singleupload.parser.SingleUploadParser;
import com.jingc.busi.util.member.LotteryOrderState;
import com.jingc.busi.util.member.MemberUtil;
import com.jingc.constant.util.GameUtil;

/**
 * <p>File: UploadServiceImpl.java</p>
 * <p>Desc: ??????????????????</p>
 * <p>Copyright: Copyright (c) 2014</p> 
 * <p>Company: ??????????????????????????????????????????</p> 
 * @author  luochang
 * @version 1.0 2014-12-17
 * <p>          ??????????????? ??????????????????</p>
 * @see     ?????????1
 */
@Service("uploadService")
public class UploadServiceImpl implements UploadService {
	
	@Resource
	private LotteryService lotteryService;
	@Resource
	private MergerService mergerService;
	@Resource
	private LotteryOrderMapper lotteryOrderMapper;
	@Resource
	private LotteryTicketMapper lotteryTicketMapper;
	@Resource
	private MergerOrderMapper mergerOrderMapper;
	@Resource
	private MergerJoinMapper mergerJoinMapper;
	@Resource
	private StoreMapper storeMapper;
	@Resource
	private MemberAccountMapper memberAccountMapper;
	@Resource
	private MemberMoneyLogMapper memberMoneyLogMapper;
	
	@Resource
	private CommonService commonService;
	
	public static final float FRT_FLOAT_MIN = 0.6f;	// ????????????????????????????????????????????????????????????80%
	public static final float FRT_FLOAT_MAX = 1.4f; // ????????????????????????????????????????????????????????????120%

	/**
	 * ????????????????????????????????????null
	 */
	@Override
	public String parse(Integer licenseId, String line) {
		SingleUploadParser sup = SingleUploadParserFactory.getSingleUploadParser(licenseId);
		return sup.parseLine(line);
	}
	
	/**
	 * ???????????????
	 * @param licenseId
	 * @param playId???1-???????????????2-???????????????3-????????????
	 * @param line
	 * @return
	 */
	public String parsePls(Integer licenseId, int playId, String line) {
		PlsSingleUploadParser sup = (PlsSingleUploadParser)SingleUploadParserFactory.getSingleUploadParser(licenseId);
		return sup.parseLine(playId, line);
	}
	
	/**
	 * ???????????????
	 * @param licenseId
	 * @param playId???1-???????????????2-???????????????3-????????????
	 * @param line
	 * @return
	 */
	public String parseS11x5(Integer licenseId, int playId, String line) {
		S11x5SingleUploadParser sup = (S11x5SingleUploadParser)SingleUploadParserFactory.getSingleUploadParser(licenseId);
		return sup.parseLine(playId, line);
	}
	
	/**
	 * ????????????
	 */
	public String parseGuessLine(Integer licenseId, int playId, String fileContent, int schNum, int passLen, boolean withSch) {
		GuessSingleUploadParser sup = (GuessSingleUploadParser)SingleUploadParserFactory.getSingleUploadParser(licenseId);
		return sup.parseSingleFileLine(playId, fileContent, schNum, passLen, withSch);
	}

	/**
	 * ????????????
	 * @param bo
	 */
	public LotteryOrder bet(BetObject bo, Member mb) {
		// ??????LotteryOrder??????
		LotteryOrder order = new LotteryOrder();
		order.setMemberFrom(mb.getMemberFrom());	// ????????????
		
		order.setFetchFlag("1");
		
		order.setBetState(mb.getMemberFrom()==5?LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "":LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "");
		//?????????????????????????????????????????????????????????
		order.setReserved1(mb.getReserved1());
		
		order.setUserid(mb.getId());
		order.setUsername(mb.getMemberName());
		order.setStoreid(mb.getStoreId());
		order.setZjFlag(bo.getZjFlag());
		
		order.setPlayType("1");
		if ( bo.getLicenseId() == Constants.LICENSE_PLS || bo.getLicenseId() == Constants.LICENSE_3D) {
			if ( bo.getPlayId().equals("1") ) {
				order.setPlayType("zxpt");
			} else if ( bo.getPlayId().equals("2") ) {
				order.setPlayType("z3ds");
			} else {
				order.setPlayType("z6pt");
			}
		} else if ( bo.getLicenseId() == Constants.LICENSE_DLT ) {
			order.setPlayType("zxpt");
		} else if ( bo.getLicenseId() > 100 ) {
			if ( bo.getPlayId().equals("1") ) {
				order.setPlayType("q1pt");
			} else if ( bo.getPlayId().equals("2") ) {
				order.setPlayType("x2r2pt");
			} else if ( bo.getPlayId().equals("3") ) {
				order.setPlayType("x3r3pt");
			} else if ( bo.getPlayId().equals("4") ) {
				order.setPlayType("r4pt");
			} else if ( bo.getPlayId().equals("5") ) {
				order.setPlayType("r5pt");
			} else if ( bo.getPlayId().equals("6") ) {
				order.setPlayType("r6pt");
			} else if ( bo.getPlayId().equals("7") ) {
				order.setPlayType("r7pt");
			} else if ( bo.getPlayId().equals("8") ) {
				order.setPlayType("r8pt");
			} else if ( bo.getPlayId().equals("9") ) {
				order.setPlayType("x2q2zhx");
			} else if ( bo.getPlayId().equals("10") ) {
				order.setPlayType("x2q2zxpt");
			} else if ( bo.getPlayId().equals("11") ) {
				order.setPlayType("x3q3zhx");
			} else if ( bo.getPlayId().equals("12") ) {
				order.setPlayType("x3q3zxpt");
			}
		} 
		
		String betCode = "";
		int betNum = 0;
		// ???????????????????????????????????????
		File file = null;
		FileReader frd = null;
		BufferedReader brd = null;
		String[] schs = null;	// 	????????????
		Map<String,Set<String>> betCodeMap = null;// ???????????????
		try {
			file = new File(Startup.ROOT_PATH+"/temp/"+bo.getFileName());
			if ( !file.exists() ) {
				throw new BaseException("?????????????????????");
			}
			frd = new FileReader(file);
			brd = new BufferedReader(frd);
			
			// ?????????????????????????????????
			if ( bo.getLicenseId() == Constants.LICENSE_JCZQ || bo.getLicenseId() == Constants.LICENSE_JCLQ ||
					bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
				order.setPlayType(bo.getPlayId());
				order.setPassType(bo.getPassType());
				order.setSingleFlag("1");
				schs = bo.getSchs().split(",");
				betCodeMap = new Hashtable<String, Set<String>>();
			}
			String readLine = null;
			while ( (readLine = brd.readLine()) != null ) {
				if ( bo.getLicenseId() == Constants.LICENSE_JCZQ || bo.getLicenseId() == Constants.LICENSE_JCLQ ||
						bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG ) {
					
					String[] bets = readLine.split(",");
					int index = 0;
					for ( String bet : bets ) {
						if ( "*".equals(bet) || "#".equals(bet) || "**".equals(bet) || "##".equals(bet)) {
							index++;
							continue;
						}
						betCode += schs[index] + ":" + bet + ":0|";
						if ( betCodeMap.get(schs[index]) != null ) {
							Set<String> set = betCodeMap.get(schs[index]);
							set.add(bet);
						} else {
							Set<String> set = new HashSet<String>();
							set.add(bet);
							betCodeMap.put(schs[index], set);
						}
						index++;
					}
					betCode = betCode.substring(0, betCode.length()-1) + "`" + bo.getMultiple() + ";";
				} else {
					betCode += readLine + ";";
				}
				betNum++;
			}
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) 
				throw (BaseException)ex;
			ex.printStackTrace();
		} finally {
			if ( null != frd ) {
				try {
					frd.close();
				} catch (IOException e) {
				}
			}
			if ( null != brd ) {
				try {
					brd.close();
				} catch (IOException e) {
				}
			}
		}
		betCode = betCode.substring(0, betCode.length()-1);
		order.setBetCode(betCode);
		if ( bo.getLicenseId() == Constants.LICENSE_JCZQ || bo.getLicenseId() == Constants.LICENSE_JCLQ ||
				bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
			String nc = "";
			for ( String sch : schs ) {
				Set<String> set = betCodeMap.get(sch);
				if ( null != set ) {
					nc += sch + ":";
					for ( String s : set ) {
						nc += s + ",";
					}
					nc = nc.substring(0, nc.length()-1) + ":0|";
				}
			}
			nc = nc.substring(0, nc.length()-1);
			order.setBetCode(nc);
			order.setSchInfo(betCode);
		}
		order.setReserved15(bo.getReserved15());
		order.setReserved16(bo.getReserved16());
		order.setReserved5(betCode);
		order.setBetNum(betNum);
		order.setMultiple(bo.getMultiple());
		order.setBetPrice(betNum*2*bo.getMultiple());
		order.setIssue(bo.getIssue());
		order.setReserved8(bo.getStopTime());
		order.setLicenseId(bo.getLicenseId());
		
		order.setBetFrom("1");
		order.setBetType("1");
		this.lotteryService.bet(order);
		
		return order;
	}
	
	public void uploadWithSch(Integer licenseId, Integer playId, List<String> list) {
		
	}
	
	/**
	 * ??????????????????
	 * @param mbo
	 */
	public LotteryOrder merger(MergerBetObject bo, Member mb) {
		MergerOrder order = new MergerOrder();
		order.setMemberFrom(mb.getMemberFrom());	// ????????????
		
		order.setFetchFlag("1");
		
		order.setPartTitile(bo.getPartTitile());
		order.setPartDetail(bo.getPartDetail());
		order.setTotalNum(bo.getTotalNum());
		order.setLaunchNum(bo.getLaunchNum());
		order.setShowLevel(bo.getShowLevel());
		order.setBrokerage(bo.getBrokerage());
		order.setInsNum(bo.getInsNum());
		
		order.setBetState(mb.getMemberFrom()==5?LotteryOrderState.LOTTERY_ORDER_STATE_TEMPORARY + "":LotteryOrderState.LOTTERY_ORDER_STATE_WAITFORCONFIRMATION + "");
		//?????????????????????????????????????????????????????????
		order.setReserved1(mb.getReserved1());
		
		order.setUserid(mb.getId());
		order.setUsername(mb.getMemberName());
		order.setStoreid(mb.getStoreId());
		
		order.setZjFlag(bo.getZjFlag());
		order.setPlayType("1");
		if ( bo.getLicenseId() == Constants.LICENSE_PLS || bo.getLicenseId() == Constants.LICENSE_3D ) {
			if ( bo.getPlayId().equals("1") ) {
				order.setPlayType("zxpt");
			} else if ( bo.getPlayId().equals("2") ) {
				order.setPlayType("z3ds");
			} else {
				order.setPlayType("z6pt");
			}
		} else if ( bo.getLicenseId() == Constants.LICENSE_DLT ) {
			order.setPlayType("zxpt");
		} 
		
		String betCode = "";
		int betNum = 0;
		// ???????????????????????????????????????
		File file = null;
		FileReader frd = null;
		BufferedReader brd = null;
		String[] schs = null;	// 	????????????
		Map<String,Set<String>> betCodeMap = null;// ???????????????
		try {
			file = new File(Startup.ROOT_PATH+"/temp/"+bo.getFileName());
			if ( !file.exists() ) {
				throw new BaseException("?????????????????????");
			}
			frd = new FileReader(file);
			brd = new BufferedReader(frd);
			
			// ?????????????????????????????????
			if ( bo.getLicenseId() == Constants.LICENSE_JCZQ || bo.getLicenseId() == Constants.LICENSE_JCLQ ||
					bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
				order.setPlayType(bo.getPlayId());
				order.setPassType(bo.getPassType());
				order.setSingleFlag("1");
				schs = bo.getSchs().split(",");
				betCodeMap = new Hashtable<String, Set<String>>();
			}
			String readLine = null;
			while ( (readLine = brd.readLine()) != null ) {
				if ( bo.getLicenseId() == Constants.LICENSE_JCZQ || bo.getLicenseId() == Constants.LICENSE_JCLQ ||
						bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
					
					String[] bets = readLine.split(",");
					int index = 0;
					for ( String bet : bets ) {
						if ( "*".equals(bet) || "#".equals(bet) || "**".equals(bet) || "##".equals(bet)) {
							index++;
							continue;
						}
						betCode += schs[index] + ":" + bet + ":0|";
						if ( betCodeMap.get(schs[index]) != null ) {
							Set<String> set = betCodeMap.get(schs[index]);
							set.add(bet);
						} else {
							Set<String> set = new HashSet<String>();
							set.add(bet);
							betCodeMap.put(schs[index], set);
						}
						index++;
					}
					betCode = betCode.substring(0, betCode.length()-1) + "`" + bo.getMultiple() + ";";
				} else {
					betCode += readLine + ";";
				}
				betNum++;
			}
		} catch ( Exception ex ) {
			if ( ex instanceof BaseException ) 
				throw (BaseException)ex;
			ex.printStackTrace();
		} finally {
			if ( null != frd ) {
				try {
					frd.close();
				} catch (IOException e) {
				}
			}
			if ( null != brd ) {
				try {
					brd.close();
				} catch (IOException e) {
				}
			}
		}
		betCode = betCode.substring(0, betCode.length()-1);
		order.setBetCode(betCode);
		if ( bo.getLicenseId() == Constants.LICENSE_JCZQ || bo.getLicenseId() == Constants.LICENSE_JCLQ ||
				bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
			String nc = "";
			for ( String sch : schs ) {
				Set<String> set = betCodeMap.get(sch);
				if ( null == set ) {
					continue;
				}
				nc += sch + ":";
				for ( String s : set ) {
					nc += s + ",";
				}
				nc = nc.substring(0, nc.length()-1) + ":0|";
			}
			nc = nc.substring(0, nc.length()-1);
			order.setBetCode(nc);
			order.setSchInfo(betCode);
		}
		if ( bo.getLicenseId() == Constants.LICENSE_14SFC || bo.getLicenseId() == Constants.LICENSE_R9 || bo.getLicenseId() == Constants.LICENSE_4JQ || bo.getLicenseId() == Constants.LICENSE_6CBQ ) {
			order.setReserved5(betCode);
		}
		order.setReserved15(bo.getReserved15());
		order.setReserved16(bo.getReserved16());
		order.setBetNum(betNum);
		order.setMultiple(bo.getMultiple());
		order.setBetPrice(betNum*2*bo.getMultiple());
		order.setIssue(bo.getIssue());
		order.setReserved8(bo.getStopTime());
		order.setLicenseId(bo.getLicenseId());
		
		order.setBetFrom("1");
		order.setBetType("3");
		
		this.mergerService.merger(order);
		
		return order;
	}
	
	/**
	 * ?????????????????????
	 * 
	 * ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????100%
	 * ????????????????????????????????????????????????????????????????????????
	 */
	@Override
	@Transactional
	public void frsMerger(Integer orderId, BetObject bo, Member m, List<String> codeList) {
		// ????????????????????????????????????
		LotteryOrder order = this.lotteryOrderMapper.selectByPartnerNo(orderId);
		if ( !LotteryOrderState.LOTTERY_ORDER_STATE_SUCCESS.equals(order.getBetState()) ) {
			throw new BaseException("[????????????????????????????????????]");
		}
		/*if ( order.getUserid().intValue() != m.getId() ) {
			throw new BaseException("[??????????????????????????????????????????]");
		}*/
		MergerOrder mo = this.mergerOrderMapper.selectByPrimaryKey(orderId);
		if ( null != mo.getUploadType() && mo.getUploadType() != MergerOrder.UP_TYPE_NO_UPLOAD ) {
			throw new BaseException("[???????????????]");
		}
		// ??????betCode
		String betCode = "";
		int betNum = 0;
		
		String[] schs = null;	// 	????????????
		Map<String,Set<String>> betCodeMap = null;// ???????????????
		
		boolean hasComplex = false;	// ?????????????????????
		if ( order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ ||
				bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
			order.setPlayType(bo.getPlayId());
			order.setPassType(bo.getPassType());
			if ( "1".equals(bo.getFsscFlag()) ) {
				order.setSingleFlag("0");
				order.setBetCode(codeList.get(0));
				betNum = bo.getBetNum();
			} else if ( "2".equals(bo.getFsscFlag()) ) {
				order.setSingleFlag("2");
				order.setBetCode(codeList.get(0));
				order.setSchInfo(bo.getSchs());
				betNum = bo.getBetNum();
			} else {
				if ( null == bo.getSchs() ) {
					throw new BaseException("[??????????????????]");
				}
				order.setSingleFlag("1");
				schs = bo.getSchs().split(",");
				betCodeMap = new Hashtable<String, Set<String>>();
				for ( String s : codeList ) {
					String[] bets = s.split(",");
					int index = 0;
					for ( String bet : bets ) {
						if ( "*".equals(bet) || "#".equals(bet) || "**".equals(bet) || "##".equals(bet)) {
							index++;
							continue;
						}
						betCode += schs[index] + ":" + bet + ":0|";
						if ( betCodeMap.get(schs[index]) != null ) {
							Set<String> set = betCodeMap.get(schs[index]);
							set.add(bet);
						} else {
							Set<String> set = new HashSet<String>();
							set.add(bet);
							betCodeMap.put(schs[index], set);
						}
						index++;
					}
					betNum++;
					betCode = betCode.substring(0, betCode.length()-1) + "`" + order.getMultiple() + ";";
				}
				betCode = betCode.substring(0, betCode.length()-1);
				order.setSchInfo(betCode);
				
				String nc = "";
				for ( String sch : schs ) {
					Set<String> set = betCodeMap.get(sch);
					if ( null == set ) {
						 continue;
					} else {
						nc += sch + ":";
						for ( String s : set ) {
							nc += s + ",";
						}
						nc = nc.substring(0, nc.length()-1) + ":0|";
					}
				}
				nc = nc.substring(0, nc.length()-1);
				order.setBetCode(nc);
			}
			
		} else {
			for ( String s : codeList ) {
				betCode += s + ";";
				if ( order.getLicenseId() == Constants.LICENSE_14SFC ||
						order.getLicenseId() == Constants.LICENSE_R9 ||
						order.getLicenseId() == Constants.LICENSE_6CBQ || 
						order.getLicenseId() == Constants.LICENSE_4JQ) {
					if ( s.indexOf('`') == -1 ) {
						int subNum = FootballService.getInstance().getBetNum(s);
						if ( subNum > 1 ) {
							hasComplex = true;
						}
						betNum += subNum;
					} else {
						List<String> _codeList = FootballService.getInstance().divRxjBetString(s);
						for ( String _betCode : _codeList ) {
							betNum += FootballService.getInstance().getBetNum(_betCode);
						}
						hasComplex = true;
					}
				} else {
					betNum++;
				}
			}
			betCode = betCode.substring(0, betCode.length()-1);
			order.setBetCode(betCode);
		}
		
		/*?????????????????????20%*/
		int betMoney = betNum * order.getMultiple() * 2;
		int sourceBetMoney = order.getBetPrice();
		if ( betMoney < sourceBetMoney * FRT_FLOAT_MIN || betMoney > sourceBetMoney * FRT_FLOAT_MAX ) {
			throw new BaseException("[????????????????????????????????????40%]");
		}
		/* ??????????????? 10000???---????????????9000???--????????????????????????9000 */
		int buyNum = mo.getBuyNum();
		if ( betMoney < buyNum ) {
			throw new BaseException("[?????????????????????????????????]");
		}
		/* ?????????????????????????????????????????? */
		if ( betMoney < mo.getTotalNum() ) {
			// ??????????????????????????????????????????????????????????????????
			if ( mo.getBuyNum() > betMoney ) {
				int revNum =  mo.getBuyNum() - betMoney;
				mo.setBuyNum(betMoney);
				//mo.setState(MergerOrder.STATE_FILLED+"");
				// ???????????????
				List<MergerJoin> mjs = this.mergerJoinMapper.selectOrderList(mo.getId());
				for ( MergerJoin mj : mjs ) {
					if ( revNum > mj.getJoinNum() ) {
						logTx2(mj.getJoinUserid(), mo, mj.getJoinPrice().intValue(), "????????????????????????????????????????????????????????????"+mo.getId());
						// ??????
						this.mergerJoinMapper.deleteOneJoin(mj);
						revNum = revNum - mj.getJoinNum();
					} else if ( revNum == mj.getJoinNum() ) {
						logTx2(mj.getJoinUserid(), mo, mj.getJoinPrice().intValue(), "????????????????????????????????????????????????????????????"+mo.getId());
						this.mergerJoinMapper.deleteOneJoin(mj);
						break;
					} else {
						logTx2(mj.getJoinUserid(), mo, revNum, "????????????????????????????????????????????????????????????"+mo.getId());
						mj.setJoinNum(mj.getJoinNum() - revNum);
						mj.setJoinPrice(mj.getJoinNum().doubleValue());
						this.mergerJoinMapper.updateOneJoin(mj);
						break;
					}
				}
			} 
		} else if ( betMoney > mo.getTotalNum() ) {
			mo.setState(MergerOrder.STATE_NO_FILLED+"");
		}
		
		order.setReserved8(mo.getReserved3());
		
		/*??????????????????*/
		Store store = this.storeMapper.selectByPrimaryKey(order.getStoreid());
		if ( null == store.getSplitMul() || 0 == store.getSplitMul() ) {
			LotteryServiceImpl.maxMultiple.set(99);
		} else {
			LotteryServiceImpl.maxMultiple.set(store.getSplitMul());
		}
		/*??????50???*/
		if ( order.getLicenseId() == 11 || order.getLicenseId() == 12 || order.getLicenseId() == 13 ) {
			LotteryServiceImpl.maxMultiple.set(50);
		}
		
		String reserved4 = store.getReserved3();
		String reserved8 = store.getReserved5();
		
		/*??????*/
		List<LotteryTicket> tickets = TicketSplitorFactory.getTicketSplitor(order.getLicenseId()).split(order);
		//order.setTicketTotalNum(tickets.size());	// ???????????????
		
		if ( order.getLicenseId() == Constants.LICENSE_JCZQ || order.getLicenseId() == Constants.LICENSE_JCLQ ||
				bo.getLicenseId() == Constants.LICENSE_BJDC || bo.getLicenseId() == Constants.LICENSE_SFGG) {
			List<String> stopArray = new ArrayList<String>();
			for (LotteryTicket ticket : tickets) {
				stopArray.add(ticket.getStopTime());
			}
			Collections.sort(stopArray);
			order.setReserved13(stopArray.get(0));// ?????????????????????
			
			StoreLicenseKey key = new StoreLicenseKey();
			key.setStoreId(order.getStoreid());
			key.setLicenseId(order.getLicenseId());
			int aheadset = 0;	// ??????
			StoreLicense csl = this.lotteryService.getStoreLicense(key);
			// ??????????????????????????????
			if ( null != csl.getBuyAheadTime() && !"".equals(csl.getCoopAheadTime()) ) {
				aheadset = Integer.parseInt(csl.getCoopAheadTime());
			} else {
				try {
					key.setStoreId(-1);
					key.setLicenseId(order.getLicenseId());
					aheadset = Integer.parseInt(this.lotteryService.getStoreLicense(key).getCoopAheadTime());
				} catch ( Exception ex ) {
				}
			}
			// ??????????????????
			Date date = DateUtil.getDayMiniteBefore("yyyy-MM-dd HH:mm:ss", order.getReserved13(), aheadset+MergerOrder.COOP_COMM_AHEAD);
			String stTime = DateUtil.formatDay("yyyy-MM-dd HH:mm:ss", date);
			mo.setReserved2(stTime);
			//this.mergerOrderMapper.updateStopTime(mo);
			
			order.setBetNum(betNum);
			order.setBetPrice(betMoney);
			order.setTicketTotalNum(tickets.size());	// ???????????????
			this.lotteryOrderMapper.setJcBetCode(order);
		} else {
			String singleFlag = hasComplex ? "0" : "1";
			this.lotteryOrderMapper.setBetCode(order.getId(), betCode, betNum, betMoney, tickets.size(), singleFlag);
		}
		// ????????????
		if ( betMoney != mo.getTotalNum() ) {
			mo.setTotalNum(betMoney);
		}
		mo.setUploadType(MergerOrder.UP_TYPE_UPLOAD);
		this.mergerOrderMapper.updateTotalNum(mo);
		
		int startpos = 1, endpos = 1, tlen = tickets.size();
		String playType = tickets.get(0).getPlayType().split("-")[0];
		String printFiles = "";
		/*??????????????????????????????*/
		int seq = 1;
		for ( LotteryTicket ticket : tickets ) {
			ticket.setReserved4(reserved4);
			ticket.setReserved8(reserved8);
			ticket.setOrderId(order.getId());
			ticket.setTicketId(seq++);
			ticket.setReserved2(this.commonService.createTicketUniIndex(order.getId(), ticket.getTicketId()));
			
			if ( !playType.equals(ticket.getPlayType().split("-")[0]) || (endpos - startpos > LotteryServiceImpl.SIM_FILE_MAX) ) {
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
		
		/*????????????*/
		this.lotteryTicketMapper.insertBatch(tickets);
		{
			LotteryOrder updateObj = new LotteryOrder();
			updateObj.setReserved14(printFiles.substring(0, printFiles.length()-1));
			if ( updateObj.getReserved14().length() > 256 ) {
				updateObj.setReserved14( updateObj.getReserved14().substring(0,250));
			}
			updateObj.setId(order.getId());
			this.lotteryOrderMapper.setSimFiles(updateObj);
		} 
	}
	
	/**
	 * ????????????
	 * @param order
	 * @param totalMoney
	 * @param coment
	 */
	private void logTx2(Integer userId, MergerOrder order, int totalMoney, String coment) {
		this.memberAccountMapper.updateAccount2Revaction(userId, (double)totalMoney);
		/*???????????????*/
		MemberAccount ma = this.memberAccountMapper.selectByPrimaryKey(userId);
		MemberMoneyLog mml = new MemberMoneyLog();
		mml.setMemberId(userId);
		mml.setStoreId(order.getStoreid());
		mml.setMoney((double)totalMoney);
		mml.setBalance(this.commonService.getUsedMoney(ma));
		mml.setType(MemberUtil.ACCESS_ACCOUNT_TYPE.INCOME);
		mml.setCategory(MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE.REFUND);
		mml.setCategoryDetail(MemberUtil.MEMBER_ACCOUNT_CHANGE_TYPE_DETAIL.TO_BET);
		mml.setRelationId(order.getId()+"");
		mml.setState(MemberUtil.STATE.MEMBER_MONEY_LOG_STATE_FINISH);
		mml.setCommont(coment);
		mml.setCreateTime(DateUtil.getDateFormat2());
		this.memberMoneyLogMapper.insert(mml);
	}
}
