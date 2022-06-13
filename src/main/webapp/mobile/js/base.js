//全局
$.mobile.page.prototype.options.domCache=true;//缓存与偶有加载过得页面

var index = {
	init: function(){
		this.bind();
	},
	bind: function(){
		var mySwiper = new Swiper('.swiper-container',{
          pagination: '.pagination',
          loop:true,
          autoplay: 3000,
          autoplayDisableOnInteraction:false
        });
	}
}

$(document).on("pageinit", "#index", function(){
	index.init();//初始化index页面
});