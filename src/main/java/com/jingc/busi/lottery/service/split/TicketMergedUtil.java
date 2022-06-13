package com.jingc.busi.lottery.service.split;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.jingc.afc.util.CombAlgorithm;
import com.jingc.afc.util.JcUtil;
import com.jingc.busi.common.table.LotteryOrder;
import com.jingc.busi.common.table.LotteryTicket;

/**
 * <p>Desc: 竞彩票合单工具类</p>
 * @author  luochang
 */
public class TicketMergedUtil {
	
	static Map<String, String> MERGED_MAP = new Hashtable<String, String>();
	static {
		MERGED_MAP.put("3_2","3c3");		// 3场3串3
		MERGED_MAP.put("3_23","3c4");		// 3场3串4
		
		MERGED_MAP.put("4_3","4c4");		// 4场4串4
		MERGED_MAP.put("4_34","4c5");		// 4场4串5
		MERGED_MAP.put("4_2","4c6");		// 4场4串6
		MERGED_MAP.put("4_234","4c11");		// 4场4串11
		
		MERGED_MAP.put("5_4","5c5");		// 5场5串5
		MERGED_MAP.put("5_45","5c6");		// 5场5串6
		MERGED_MAP.put("5_2","5c10");		// 5场5串10
		MERGED_MAP.put("5_345","5c16");		// 5场5串16
		MERGED_MAP.put("5_23","5c20");		// 5场5串20
		MERGED_MAP.put("5_2345","5c26");	// 5场5串26
		
		MERGED_MAP.put("6_5","6c6");		// 6场6串6
		MERGED_MAP.put("6_56","6c7");		// 6场6串7
		MERGED_MAP.put("6_2","6c15");		// 6场6串15
		MERGED_MAP.put("6_3","6c20");		// 6场6串20
		MERGED_MAP.put("6_456","6c22");		// 6场6串22
		MERGED_MAP.put("6_23","6c35");		// 6场6串35
		MERGED_MAP.put("6_3456","6c42");	// 6场6串42
		MERGED_MAP.put("6_234","6c50");		// 6场6串50
		MERGED_MAP.put("6_23456","6c57");	// 6场6串57
		
		MERGED_MAP.put("7_6","7c7");		// 7场7串7
		MERGED_MAP.put("7_67","7c8");		// 7场7串8
		MERGED_MAP.put("7_5","7c21");		// 7场7串21
		MERGED_MAP.put("7_4","7c35");		// 7场7串35
		MERGED_MAP.put("7_234567","7c120");	// 7场7串120
		
		MERGED_MAP.put("8_7","8c8");		// 8场8串8
		MERGED_MAP.put("8_78","8c9");		// 8场8串9
		MERGED_MAP.put("8_6","8c28");		// 8场8串28
		MERGED_MAP.put("8_5","8c56");		// 8场8串56
		MERGED_MAP.put("8_4","8c70");		// 8场8串70
		MERGED_MAP.put("8_2345678","8c247");// 8场8串247
	}
	
	/*
	 * 一场比赛中存在两张玩法的时候调用该方法
	 */
	public static List<LotteryTicket> merge(LotteryOrder order, List<LotteryTicket> soureList) {
		if ( !order.getPlayType().equals("6") ) {
			return soureList;
		}
		String[] cInfo = order.getBetCode().split("\\|");
		boolean single = true;
		for ( String c : cInfo ) {
			String p = c.split(":")[1].split(",")[0].split("-")[0];
			String[] pp = c.split(":")[1].split(",");
			for ( String s : pp ) {
				if ( !s.split("-")[0].equals(p) ) {
					single = false;
					break;
				}
			}
			if ( !single ) {
				break;
			}
		}
		if ( single ) {
			return soureList;
		}
		
		int limit = getMixedMaxPassNum(order);
		int schNum = cInfo.length;
		if ( !"0".equals(order.getSingleFlag()) || (schNum < 3 || schNum > limit) || order.getMultiple() > 99 ) {
			return soureList;
		} 
		
		List<LotteryTicket> targetList = new ArrayList<LotteryTicket>();
		
		schNum = schNum > limit ? limit : schNum;
		String pkey = schNum + "_";
		String[] pls = order.getPassType().split(",");
		for ( String pl : pls ) {
			if ( Integer.valueOf(pl.split("c")[1]) == 1 ) {
				pkey += pl.split("c")[0];
			}
		}
		if ( MERGED_MAP.get(pkey) != null ) {
			// 需要合成的组合关
			List<LotteryTicket> mergedList = new ArrayList<LotteryTicket>();
			for ( LotteryTicket lt : soureList ) {
				int p = Integer.valueOf(lt.getPlayType().split("c")[1]);
				if ( p > 1 ) {
					targetList.add(lt);
				} else {
					mergedList.add(lt);
				}
			}
			GuessService jczqService = GuessService.getInstance();
			List<String> codesList = jczqService.findNmHhComb(order.getBetCode());
			String[] freeCross = JcUtil.COMB_CR_MAP.get(MERGED_MAP.get(pkey));
			CombAlgorithm<String> combAlgorithm = new CombAlgorithm<String>();
			for ( String betCode : codesList ) {
				boolean merged = true;
				for ( String fc : freeCross ) {
					List<List<String>> list = combAlgorithm.findJcComb(betCode.split("\\|"), Integer.valueOf(fc.split("c")[0]));
					boolean E = true;
					for ( List<String> olist : list ) {
						String source = "";
						for ( String s : olist ) {
							source += s + "|";
						}
						source = source.substring(0, source.length()-1);
						E = false;
						for ( LotteryTicket lt : mergedList ) {
							if ( source.equals(lt.getReserved15()) ) {
								E = true;
								break;
							}
						}
						if ( !E ) {
							break;
						}
					}
					if ( !E ) {
						merged = false;
						break;
					}
				}
				if ( merged ) {
					//int betNum = jczqService.calcCombPtBetNum(betCode.split("\\|"), MERGED_MAP.get(pkey));
					int betNum = 0;
					// 重复去掉
					for ( String fc : freeCross ) {
						List<List<String>> list = combAlgorithm.findJcComb(betCode.split("\\|"), Integer.valueOf(fc.split("c")[0]));
						for ( List<String> olist : list ) {
							String source = "";
							for ( String s : olist ) {
								source += s + "|";
							}
							source = source.substring(0, source.length()-1);
							for ( LotteryTicket lt : mergedList ) {
								if ( source.equals(lt.getReserved15()) ) {
									betNum += lt.getBetNum();
									mergedList.remove(lt);
									break;
								}
							}
						}
					}
					targetList.add(new LotteryTicket(order, order.getPlayType(), betCode, betNum, MERGED_MAP.get(pkey), order.getMultiple()));
				}
			}
			if ( mergedList.size() > 0 ) {
				targetList.addAll(mergedList);
			}
		} else {
			return soureList;
		}
		return targetList;
	}
	
	/**
	 * 获取混合关的最大过关数
	 */
	private static int getMixedMaxPassNum(LotteryOrder order) {
		int pn = 8;
		String[] codes = order.getBetCode().split("\\|");
		if ( order.getLicenseId().intValue() == 9 ) {
			for ( int i = 0; i < codes.length; i++ ) {
				String[] pp = codes[i].split(":")[1].split(",");
				for ( int j = 0; j < pp.length; j++ ) {
					int p = Integer.parseInt(pp[j].split("-")[0],10);
					switch( p ) {
					case 3:
						pn = pn > 6 ? 6 : pn;
						break;
					case 4:
						pn = pn > 4 ? 4 : pn;
						break;
					case 5:
						pn = pn > 4 ? 4 : pn;
						break;
					}
				}
			}
		} else if ( order.getLicenseId().intValue() == 10 ) {
			for ( int i = 0; i < codes.length; i++ ) {
				String[] pp = codes[i].split(":")[1].split(",");
				for ( int j = 0; j < pp.length; j++ ) {
					int p = Integer.parseInt(pp[j].split("-")[0],10);
					switch( p ) {
					case 3:
						pn = pn > 4 ? 4 : pn;
						break;
					}
				}
			}
		} 
		return pn;
	}
}
