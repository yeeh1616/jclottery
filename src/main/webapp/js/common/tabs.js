$(function () {
	var $tabs01 = $("div.hmdj_header");
    $.each($tabs01, function (k, it) {
        var $li = $(this).find("li");
        //var $con = $(this).find("div.tabCon div");
        $.each($li, function (i, item) {
            var _self = $(this);             
            
            _self.on("mouseover", function () {
                //var _con = $con.eq(_self.index());
                _self.siblings().children("a").removeClass();
                _self.children("a").addClass("current");

               //_con.siblings().removeClass();
                //_con.addClass("cur");
                
            })
        });
    })
	
	
	
	
    var $tabs = $("div.notice_top_r");
    $.each($tabs, function (k, it) {
        var $li = $(this).find("li");
        //var $con = $(this).find("div.tabCon div");
        $.each($li, function (i, item) {
            var _self = $(this);             
            
            _self.on("mouseover", function () {
                //var _con = $con.eq(_self.index());
                _self.siblings().removeClass();
                _self.addClass("current");

               //_con.siblings().removeClass();
                //_con.addClass("cur");
                
            })
        });
    })
});