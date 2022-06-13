$(document).ready(function (){    
	var index = 0;
	var customMode = 1;
    $(".f_cont_r_ct li").click(function(event) {
        $(this).addClass('current').siblings().removeClass('current');
        //alert($(this).index());
        if($(this).index() == 0){
        	customMode = 1;
        }else{
        	customMode = 2;
        }
        index=$(this).index();
        $(".f_cont_r_c").eq($(this).index()).show().siblings().hide();  /*第索引值个显示，而它的兄弟隐藏*/
    });
    $("input[name='money']").keyup(function(){
    	var temp = parseInt($(this).val().substring(0,1));
    	if((parseInt($(this).val().substring(0,1)) == 0)){
    		$(this).attr("value",'');
    	}
    });
    $("input[name='percentage']").keyup(function(){
    	var temp = parseInt($(this).val().substring(0,1));
    	if((parseInt($(this).val().substring(0,1)) == 0)||(parseInt($(this).val()) > 100)){
    		$(this).attr("value",'');
    	}
    });
	$("a[name='customBtn']").click(function(){
		var layerId = $("input[name=layerId]").val();
		var appointed = parseInt($("input[name=appointed]").val());//是否被定制
		var url = appointed == 0?"/merger/getIsCustomSuccess.jhtml":"/memberCenterCustom/acceptAppoint.do";

		if($("input[name='checkboxProtocol']").attr("checked")){
	    	var userid = $("input[name='useridOfPopup']").val();
	    	var licenseId = $("input[name='licenseIdOfPopup']").val();
	    	
	    	if($("input[name='money']").val() != null && $("input[name='percentage']").val() != null){
	    		var fixedCusMoney = $("input[name='money']").val();
		    	var cusProp = $("input[name='percentage']").val()/100;
		    	var data;
	    		if(customMode == 1){
		    		data = {"userid":userid,
							"licenseId":licenseId,
							"fixedCusMoney":fixedCusMoney,
							"customMode":customMode,
							"appointed":appointed};
		    	}else{
		    		data = {"userid":userid,
							"licenseId":licenseId,
							"cusProp":cusProp,
							"customMode":customMode,
							"appointed":appointed};
		    	}
	    		
		    	$.ajax({
					type : "POST",
					url : url,
					data:data,
					async:false, 
					error : function(xMLHttpRequest, textStatus, errorThrown) {
						layer.msg("error");
					},
					success : function(data) {
						if(data == -2){
							layer.msg("错误：不可重复定制!");
							layer.close(layerId);
						}else if(data == -3){
							layer.msg("错误：您是发起人，不能定制!");
							layer.close(layerId);
						}else if(data == 1){
							layer.msg("定制成功!");
							layer.close(layerId);
						}
					}
				});
	    	}else{
	    		
	    	}
		}else{
			layer.msg('请阅读《用户服务协议》并同意其中条款');
		}
	});
})