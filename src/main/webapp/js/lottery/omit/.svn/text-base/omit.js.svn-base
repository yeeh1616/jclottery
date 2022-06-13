/**
 * 获取遗漏数据
 * 
 * */
function loadOmitDate(pcode){
	var licenseId = $("#licenseId").val();
	var pageId = $("#lotteryBuyFormId").find("input[name=playType]").val();
	if( licenseId == "1" || licenseId == "12" ){
		if (  pageId == "zxpt" ) {
			loadOmitPL3ZXPT( zxPtOmit );
		} else if (  pageId == "zxzh" ) {
			loadOmitPL3ZXZH( zxHhOmit );
		} else if (  pageId == "zxdt" ) {
			loadOmitPL3ZXZH( zxDtOmit );
		} else if (  pageId == "z3ds" ) {
			loadOmitPL3ZXPT( zxPtOmit );
		} else if (  pageId == "z3fs" ) {
			loadOmitPL3ZXZH( z3FsOmit );
		} else if (  pageId == "z3dt" ) {
			loadOmitPL3ZXDT( z3DtOmit );
		} else if (  pageId == "z6pt" ) {
			loadOmitPL3ZXZH( z6PtOmit );
		} else if (  pageId == "z6dt" ) {
			loadOmitPL3ZXDT( z6DtOmit );
		} else if (  pageId == "zxhz" ) {
			try {
				loadOmitPL3ZXPT( zxHzOmit );
			} catch ( e ) {}
		} else if (  pageId == "z3hz" ) {
			try {
				loadOmitPL3ZXPT( z3HzOmit );
			} catch ( e ) {}
		} else if (  pageId == "z6hz" ) {
			try {
				loadOmitPL3ZXPT( z6HzOmit );
			} catch ( e ) {}
		}
	}else if(licenseId == "2"){
		loadOmitPL3ZXPT( zxPtOmit );//pl5
	}else if(licenseId == "3"){
		loadOmitPL3ZXPT( zxPtOmit );//qxc
	}else if(licenseId == "4" && pageId == "dlt"){//大乐透普通
		loadOmitDLTPT( ptOmit );
	}else if(licenseId == "4" && pageId == "dltdt"){//大乐透胆拖
		loadOmitDLTDT( dtOmit );
	}else if(licenseId == "11" && pageId == "ssq"){//双色球普通
		loadOmitSSQPT( ptOmit );
	}else if(licenseId == "11" && pageId == "ssqdt"){//双色球胆拖
		loadOmitSSQDT( dtOmit );
	}
		
}

/*********************************************************各种采种玩法加载遗漏对应的方法***********************************************************/

/***********************排列三***********************************/
/**
 * pl3直选普通
 * @return
 */
function loadOmitPL3ZXPT(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('#omit_'+index+'_'+value['data']).html(value['omit']);
		});
	});
}

/**
 * pl3直选组合
 * @return
 */
function loadOmitPL3ZXZH(jsondata){
	$.each(jsondata[0]['dmos'],function(index,val){
		$('#omit_'+val['data']).html(val['omit']);
	});
}

/**
 * pl3直选胆拖
 * @return
 */
function loadOmitPL3ZXDT(jsondata){
	for ( var i = 0; i < 2; i ++) {
		$.each(jsondata[0]['dmos'],function(index,val){
			$('#omit_'+i+'_'+val['data']).html(val['omit']);
		});	
	}	
}

/***********************排列三***********************************/

/***********************大乐透***********************************/
/**
 * 大乐透普通
 * @return
 */
function loadOmitDLTPT(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('#omit_'+index+'_'+value['data']).html(value['omit']);
		});
	});
}

/**
 * 大乐透胆拖
 * @return
 */
function loadOmitDLTDT(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('dd[name=omit_'+index+'_'+value['data']+']').html(value['omit']);
		});
	});
}


/***********************大乐透***********************************/

/***********************双色球***********************************/
/**
 * 双色球普通
 * @return
 */
function loadOmitSSQPT(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('#omit_'+index+'_'+value['data']).html(value['omit']);
		});
	});
}

/**
 * 双色球胆拖
 * @return
 */
function loadOmitSSQDT(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('dd[name=omit_'+index+'_'+value['data']+']').html(value['omit']);
		});
	});
}


/***********************双色球***********************************/

/***********************江西时时彩***********************************/
/**
 * 江西时时彩
 * @return
 */
function loadOmitJXSSC5X(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('#omit_'+index+'_'+value['data']).html(value['omit']);
		});
	});
}

/***********************江西时时彩***********************************/
/***********************七乐彩***********************************/
/**
 * 七乐彩直选
 * @return
 */
function loadOmitQLCZX(jsondata){
	$.each(jsondata[0]['dmos'],function(index,val){
		$('#omit_'+val['data']).html(val['omit']);
	});
}

/**
 * 七乐彩胆拖
 * @return
 */
function loadOmitQLCDT(jsondata){
	for ( var i = 0; i < 2; i ++) {
		$.each(jsondata[0]['dmos'],function(index,val){
			$('#omit_'+i+'_'+val['data']).html(val['omit']);
		});	
	}	
}
/***********************七乐彩***********************************/

/***********************11运夺金***********************************/
/**
 * 11运夺金组合
 * @return
 */
function loadOmit11X5ZH(jsondata){
	$.each(jsondata,function(index,val){
		$.each(val['dmos'],function(item,value){
			$('#omit_'+index+'_'+value['data']).html(value['omit']);
		});
	});
}

/**
 * 11运夺金普通
 * @return
 */
function loadOmit11X5PT(jsondata){
	$.each(jsondata[0]['dmos'],function(index,val){
		$('#omit_'+val['data']).html(val['omit']);
	});
}

/**
 * 11运夺金胆拖
 * @return
 */
function loadOmit11X5DT(jsondata){
	for ( var i = 0; i < 2; i ++) {
		$.each(jsondata[0]['dmos'],function(index,val){
			$('#omit_'+i+'_'+val['data']).html(val['omit']);
		});	
	}	
}

/***********************11运夺金***********************************/
