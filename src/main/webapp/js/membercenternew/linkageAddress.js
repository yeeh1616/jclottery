					$(document).ready(function()
					{
						
						var toppx = 4;//上误差
						var leftpx = 0;//左误差
						
						var mytop = 0//上边距
						var myleft = 0;//左边距
						
						var linkageHtml = ''
					    	+'<div id="linkage_province" class="linkage_box" style="display:none;">'
							+'<p>请选择所在直辖市或省份</p>'
							+'<ul>'
							+'<li>'
							+'<strong>东北</strong>'
							+'<a id="220000" class="linkage_province_btnLink">吉林</a>'
							+'<a id="210000" class="linkage_province_btnLink">辽宁</a>'
							+'<a id="230000" class="linkage_province_btnLink">黑龙江</a>'
							+'</li>'
							+'<li>'
							+'<strong>华北</strong>'
							+'<a id="110000" class="linkage_province_btnLink">北京</a>'
							+'<a id="120000" class="linkage_province_btnLink">天津</a>'
							+'<a id="130000" class="linkage_province_btnLink">河北</a>'
							+'<a id="140000" class="linkage_province_btnLink">山西</a>'
							+'<a id="150000" class="linkage_province_btnLink">内蒙古</a>'
							+'</li>'
							+'<li>'
							+'<strong>华东</strong>'
							+'<a id="370000" class="linkage_province_btnLink">山东</a>'
							+'<a id="320000" class="linkage_province_btnLink">江苏</a>'
							+'<a id="340000" class="linkage_province_btnLink">安徽</a>'
							+'<a id="330000" class="linkage_province_btnLink">浙江</a>'
							+'<a id="360000" class="linkage_province_btnLink">江西</a>'
							+'<a id="350000" class="linkage_province_btnLink">福建</a>'
							+'<a id="310000" class="linkage_province_btnLink">上海</a>'
							+'</li>'
							+'<li>'
							+'<strong>华中</strong>'
							+'<a id="410000" class="linkage_province_btnLink">河南</a>'
							+'<a id="420000" class="linkage_province_btnLink">湖北</a>'
							+'<a id="430000" class="linkage_province_btnLink">湖南</a>'
							+'</li>'
							+'<li>'
							+'<strong>华南</strong>'
							+'<a id="440000" class="linkage_province_btnLink">广东</a>'
							+'<a id="460000" class="linkage_province_btnLink">海南</a>'
							+'<a id="450000" class="linkage_province_btnLink">广西</a>'
							+'</li>'
							+'<li>'
							+'<strong>西南</strong>'
							+'<a id="510000" class="linkage_province_btnLink">四川</a>'
							+'<a id="530000" class="linkage_province_btnLink">云南</a>'
							+'<a id="520000" class="linkage_province_btnLink">贵州</a>'
							+'<a id="500000" class="linkage_province_btnLink">重庆</a>'
							+'<a id="540000" class="linkage_province_btnLink">西藏</a>'
							+'</li>'
							+'<li>'
							+'<strong>西北</strong>'
							+'<a id="610000" class="linkage_province_btnLink">陕西</a>'
							+'<a id="620000" class="linkage_province_btnLink">甘肃</a>'
							+'<a id="630000" class="linkage_province_btnLink">青海</a>'
							+'<a id="640000" class="linkage_province_btnLink">宁夏</a>'
							+'<a id="650000" class="linkage_province_btnLink">新疆</a>'
							+'</li>'
							+'<li class="last">'
							+'<strong>港澳台</strong>'
							+'<a id="810000" class="linkage_province_btnLink">香港</a>'
							+'<a id="820000" class="linkage_province_btnLink">澳门</a>'
							+'<a id="710000" class="linkage_province_btnLink">台湾</a>'
							+'</li>'
							+'	</ul>'
							+'	<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
							+'</div>'
					+'<div id="city_110000" class="linkage_box" style="display:none;">'
					+'<p>北京市</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">东城区</a>'
					+'<a class="linkage_city_btnLink">西城区</a>'
					+'<a class="linkage_city_btnLink">崇文区 </a>'
					+'<a class="linkage_city_btnLink">宣武区</a>'
					+'<a class="linkage_city_btnLink">朝阳区</a>'
					+'<a class="linkage_city_btnLink">丰台区</a>'
					+'<a class="linkage_city_btnLink">石景山区</a>'
					+'<a class="linkage_city_btnLink">海淀区</a>'
					+'<a class="linkage_city_btnLink">门头沟区</a>'
					+'<a class="linkage_city_btnLink">房山区</a>'
					+'<a class="linkage_city_btnLink">通州区 </a>'
					+'<a class="linkage_city_btnLink">顺义区 </a>'
					+'<a class="linkage_city_btnLink">昌平区</a>'
					+'<a class="linkage_city_btnLink">大兴区</a>'
					+'<a class="linkage_city_btnLink">怀柔区</a>'
					+'<a class="linkage_city_btnLink">平谷区 </a>'
					+'<a class="linkage_city_btnLink">密云县</a>'
					+'<a class="linkage_city_btnLink">延庆县</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_310000" class="linkage_box" style="display:none;">'
					+'<p>上海市</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">黄浦区</a>'
					+'<a class="linkage_city_btnLink">卢湾区</a>'
					+'<a class="linkage_city_btnLink">徐汇区 </a>'
					+'<a class="linkage_city_btnLink">长宁区</a>'
					+'<a class="linkage_city_btnLink">静安区</a>'
					+'<a class="linkage_city_btnLink">普陀区</a>'
					+'<a class="linkage_city_btnLink">闸北区</a>'
					+'<a class="linkage_city_btnLink">虹口区</a>'
					+'<a class="linkage_city_btnLink">杨浦区</a>'
					+'<a class="linkage_city_btnLink">闵行区</a>'
					+'<a class="linkage_city_btnLink">宝山区</a>'
					+'<a class="linkage_city_btnLink">嘉定区</a>'
					+'<a class="linkage_city_btnLink">浦东新区</a>'
					+'<a class="linkage_city_btnLink">金山区</a>'
					+'<a class="linkage_city_btnLink">松江区</a>'
					+'<a class="linkage_city_btnLink">青浦区</a>'
					+'<a class="linkage_city_btnLink">南汇区</a>'
					+'<a class="linkage_city_btnLink">奉贤区</a>'
					+'<a class="linkage_city_btnLink">崇明县</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_120000" class="linkage_box" style="display:none;">'
					+'<p>天津市</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">和平区</a>'
					+'<a class="linkage_city_btnLink">河东区 </a>'
					+'<a class="linkage_city_btnLink">河西区</a>'
					+'<a class="linkage_city_btnLink">南开区</a>'
					+'<a class="linkage_city_btnLink">河北区</a>'
					+'<a class="linkage_city_btnLink">红桥区</a>'
					+'<a class="linkage_city_btnLink">塘沽区</a>'
					+'<a class="linkage_city_btnLink">汉沽区</a>'
					+'<a class="linkage_city_btnLink">大港区</a>'
					+'<a class="linkage_city_btnLink">东丽区 </a>'
					+'<a class="linkage_city_btnLink">西青区</a>'
					+'<a class="linkage_city_btnLink">津南区 </a>'
					+'<a class="linkage_city_btnLink">北辰区</a>'
					+'<a class="linkage_city_btnLink">武清区</a>'
					+'<a class="linkage_city_btnLink">宝坻区</a>'
					+'<a class="linkage_city_btnLink">宁河县</a>'
					+'<a class="linkage_city_btnLink">静海县</a>'
					+'<a class="linkage_city_btnLink">蓟县</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_500000" class="linkage_box" style="display:none;">'
					+'<p>重庆市</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">万州区</a>'
					+'<a class="linkage_city_btnLink">涪陵区 </a>'
					+'<a class="linkage_city_btnLink">渝中区</a>'
					+'<a class="linkage_city_btnLink">大渡口区</a>'
					+'<a class="linkage_city_btnLink">江北区</a>'
					+'<a class="linkage_city_btnLink">沙坪坝区</a>'
					+'<a class="linkage_city_btnLink">九龙坡区</a>'
					+'<a class="linkage_city_btnLink">南岸区</a>'
					+'<a class="linkage_city_btnLink">北碚区</a>'
					+'<a class="linkage_city_btnLink">万盛区 </a>'
					+'<a class="linkage_city_btnLink">双桥区</a>'
					+'<a class="linkage_city_btnLink">渝北区 </a>'
					+'<a class="linkage_city_btnLink">巴南区</a>'
					+'<a class="linkage_city_btnLink">黔江区</a>'
					+'<a class="linkage_city_btnLink">长寿区</a>'
					+'<a class="linkage_city_btnLink">江津区</a>'
					+'<a class="linkage_city_btnLink">合川区 </a>'
					+'<a class="linkage_city_btnLink">永川区</a>'
					+'<a class="linkage_city_btnLink">南川区 </a>'
					+'<a class="linkage_city_btnLink">綦江县</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_130000" class="linkage_box" style="display:none;">'
					+'<p>河北省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">石家庄市</a>'
					+'<a class="linkage_city_btnLink">唐山市</a>'
					+'<a class="linkage_city_btnLink">秦皇岛市</a>'
					+'<a class="linkage_city_btnLink">邯郸市</a>'
					+'<a class="linkage_city_btnLink">邢台市</a>'
					+'<a class="linkage_city_btnLink">保定市</a>'
					+'<a class="linkage_city_btnLink">张家口市</a>'
					+'<a class="linkage_city_btnLink">承德市</a>'
					+'<a class="linkage_city_btnLink">沧州市</a>'
					+'<a class="linkage_city_btnLink">廊坊市</a>'
					+'<a class="linkage_city_btnLink">衡水市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_140000" class="linkage_box" style="display:none;">'
					+'<p>山西省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">太原市</a>'
					+'<a class="linkage_city_btnLink">大同市</a>'
					+'<a class="linkage_city_btnLink">阳泉市</a>'
					+'<a class="linkage_city_btnLink">长治市</a>'
					+'<a class="linkage_city_btnLink">晋城市</a>'
					+'<a class="linkage_city_btnLink">朔州市</a>'
					+'<a class="linkage_city_btnLink">晋中市</a>'
					+'<a class="linkage_city_btnLink">运城市</a>'
					+'<a class="linkage_city_btnLink">忻州市</a>'
					+'<a class="linkage_city_btnLink">临汾市</a>'
					+'<a class="linkage_city_btnLink">吕梁市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_150000" class="linkage_box" style="display:none;">'
					+'<p>内蒙古自治区</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">呼和浩特市</a>'
					+'<a class="linkage_city_btnLink">包头市</a>'
					+'<a class="linkage_city_btnLink">乌海市</a>'
					+'<a class="linkage_city_btnLink">赤峰市</a>'
					+'<a class="linkage_city_btnLink">通辽市</a>'
					+'<a class="linkage_city_btnLink">鄂尔多斯市</a>'
					+'<a class="linkage_city_btnLink">呼伦贝尔市</a>'
					+'<a class="linkage_city_btnLink">巴彦淖尔市</a>'
					+'<a class="linkage_city_btnLink">乌兰察布市</a>'
					+'<a class="linkage_city_btnLink">兴安盟</a>'
					+'<a class="linkage_city_btnLink">锡林郭勒盟</a>'
					+'<a class="linkage_city_btnLink">阿拉善盟</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_210000" class="linkage_box" style="display:none;">'
					+'<p>辽宁省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">沈阳市</a>'
					+'<a class="linkage_city_btnLink">大连市</a>'
					+'<a class="linkage_city_btnLink">鞍山市</a>'
					+'<a class="linkage_city_btnLink">抚顺市</a>'
					+'<a class="linkage_city_btnLink">本溪市</a>'
					+'<a class="linkage_city_btnLink">丹东市</a>'
					+'<a class="linkage_city_btnLink">锦州市</a>'
					+'<a class="linkage_city_btnLink">营口市</a>'
					+'<a class="linkage_city_btnLink">阜新市</a>'
					+'<a class="linkage_city_btnLink">辽阳市</a>'
					+'<a class="linkage_city_btnLink">盘锦市</a>'
					+'<a class="linkage_city_btnLink">铁岭市</a>'
					+'<a class="linkage_city_btnLink">朝阳市</a>'
					+'<a class="linkage_city_btnLink">葫芦岛市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_220000" class="linkage_box" style="display:none;">'
					+'<p>吉林省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">长春市</a>'
					+'<a class="linkage_city_btnLink">吉林市</a>'
					+'<a class="linkage_city_btnLink">四平市</a>'
					+'<a class="linkage_city_btnLink">辽源市</a>'
					+'<a class="linkage_city_btnLink">通化市</a>'
					+'<a class="linkage_city_btnLink">白山市</a>'
					+'<a class="linkage_city_btnLink">松原市</a>'
					+'<a class="linkage_city_btnLink">白城市</a>'
					+'<a class="linkage_city_btnLink">延边朝鲜族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_230000" class="linkage_box" style="display:none;">'
					+'<p>黑龙江省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">哈尔滨市</a>'
					+'<a class="linkage_city_btnLink">齐齐哈尔市</a>'
					+'<a class="linkage_city_btnLink">鸡西市</a>'
					+'<a class="linkage_city_btnLink">鹤岗市</a>'
					+'<a class="linkage_city_btnLink">双鸭山市</a>'
					+'<a class="linkage_city_btnLink">大庆市</a>'
					+'<a class="linkage_city_btnLink">伊春市</a>'
					+'<a class="linkage_city_btnLink">佳木斯市</a>'
					+'<a class="linkage_city_btnLink">七台河市</a>'
					+'<a class="linkage_city_btnLink">牡丹江市</a>'
					+'<a class="linkage_city_btnLink">黑河市</a>'
					+'<a class="linkage_city_btnLink">绥化市</a>'
					+'<a class="linkage_city_btnLink">大兴安岭地区</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_320000" class="linkage_box" style="display:none;">'
					+'<p>江苏省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">南京市</a>'
					+'<a class="linkage_city_btnLink">无锡市</a>'
					+'<a class="linkage_city_btnLink">徐州市</a>'
					+'<a class="linkage_city_btnLink">常州市</a>'
					+'<a class="linkage_city_btnLink">苏州市</a>'
					+'<a class="linkage_city_btnLink">南通市</a>'
					+'<a class="linkage_city_btnLink">连云港市</a>'
					+'<a class="linkage_city_btnLink">淮安市</a>'
					+'<a class="linkage_city_btnLink">盐城市</a>'
					+'<a class="linkage_city_btnLink">扬州市</a>'
					+'<a class="linkage_city_btnLink">镇江市</a>'
					+'<a class="linkage_city_btnLink">泰州市</a>'
					+'<a class="linkage_city_btnLink">宿迁市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_330000" class="linkage_box" style="display:none;">'
					+'<p>浙江省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">杭州市</a>'
					+'<a class="linkage_city_btnLink">宁波市</a>'
					+'<a class="linkage_city_btnLink">温州市</a>'
					+'<a class="linkage_city_btnLink">嘉兴市</a>'
					+'<a class="linkage_city_btnLink">湖州市</a>'
					+'<a class="linkage_city_btnLink">绍兴市</a>'
					+'<a class="linkage_city_btnLink">金华市</a>'
					+'<a class="linkage_city_btnLink">衢州市</a>'
					+'<a class="linkage_city_btnLink">舟山市</a>'
					+'<a class="linkage_city_btnLink">台州市</a>'
					+'<a class="linkage_city_btnLink">丽水市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_340000" class="linkage_box" style="display:none;">'
					+'<p>安徽省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">合肥市</a>'
					+'<a class="linkage_city_btnLink">芜湖市</a>'
					+'<a class="linkage_city_btnLink">蚌埠市</a>'
					+'<a class="linkage_city_btnLink">淮南市</a>'
					+'<a class="linkage_city_btnLink">马鞍山市</a>'
					+'<a class="linkage_city_btnLink">淮北市</a>'
					+'<a class="linkage_city_btnLink">铜陵市</a>'
					+'<a class="linkage_city_btnLink">安庆市</a>'
					+'<a class="linkage_city_btnLink">黄山市</a>'
					+'<a class="linkage_city_btnLink">滁州市</a>'
					+'<a class="linkage_city_btnLink">阜阳市</a>'
					+'<a class="linkage_city_btnLink">宿州市</a>'
					+'<a class="linkage_city_btnLink">巢湖市</a>'
					+'<a class="linkage_city_btnLink">六安市</a>'
					+'<a class="linkage_city_btnLink">亳州市</a>'
					+'<a class="linkage_city_btnLink">池州市</a>'
					+'<a class="linkage_city_btnLink">宣城市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_350000" class="linkage_box" style="display:none;">'
					+'<p>福建省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">福州市</a>'
					+'<a class="linkage_city_btnLink">厦门市</a>'
					+'<a class="linkage_city_btnLink">莆田市</a>'
					+'<a class="linkage_city_btnLink">三明市</a>'
					+'<a class="linkage_city_btnLink">泉州市</a>'
					+'<a class="linkage_city_btnLink">漳州市</a>'
					+'<a class="linkage_city_btnLink">南平市</a>'
					+'<a class="linkage_city_btnLink">龙岩市</a>'
					+'<a class="linkage_city_btnLink">宁德市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_360000" class="linkage_box" style="display:none;">'
					+'<p>江西省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">南昌市</a>'
					+'<a class="linkage_city_btnLink">景德镇市</a>'
					+'<a class="linkage_city_btnLink">萍乡市</a>'
					+'<a class="linkage_city_btnLink">九江市</a>'
					+'<a class="linkage_city_btnLink">新余市</a>'
					+'<a class="linkage_city_btnLink">鹰潭市</a>'
					+'<a class="linkage_city_btnLink">赣州市</a>'
					+'<a class="linkage_city_btnLink">吉安市</a>'
					+'<a class="linkage_city_btnLink">宜春市</a>'
					+'<a class="linkage_city_btnLink">抚州市</a>'
					+'<a class="linkage_city_btnLink">上饶市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_370000" class="linkage_box" style="display:none;">'
					+'<p>山东省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">济南市</a>'
					+'<a class="linkage_city_btnLink">青岛市</a>'
					+'<a class="linkage_city_btnLink">淄博市</a>'
					+'<a class="linkage_city_btnLink">枣庄市</a>'
					+'<a class="linkage_city_btnLink">东营市</a>'
					+'<a class="linkage_city_btnLink">烟台市</a>'
					+'<a class="linkage_city_btnLink">潍坊市</a>'
					+'<a class="linkage_city_btnLink">济宁市</a>'
					+'<a class="linkage_city_btnLink">泰安市</a>'
					+'<a class="linkage_city_btnLink">威海市</a>'
					+'<a class="linkage_city_btnLink">日照市</a>'
					+'<a class="linkage_city_btnLink">莱芜市</a>'
					+'<a class="linkage_city_btnLink">临沂市</a>'
					+'<a class="linkage_city_btnLink">德州市</a>'
					+'<a class="linkage_city_btnLink">聊城市</a>'
					+'<a class="linkage_city_btnLink">滨州市</a>'
					+'<a class="linkage_city_btnLink">菏泽市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_410000" class="linkage_box" style="display:none;">'
					+'<p>河南省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">郑州市</a>'
					+'<a class="linkage_city_btnLink">开封市</a>'
					+'<a class="linkage_city_btnLink">洛阳市</a>'
					+'<a class="linkage_city_btnLink">平顶山市</a>'
					+'<a class="linkage_city_btnLink">安阳市</a>'
					+'<a class="linkage_city_btnLink">鹤壁市</a>'
					+'<a class="linkage_city_btnLink">新乡市</a>'
					+'<a class="linkage_city_btnLink">焦作市</a>'
					+'<a class="linkage_city_btnLink">濮阳市</a>'
					+'<a class="linkage_city_btnLink">许昌市</a>'
					+'<a class="linkage_city_btnLink">漯河市</a>'
					+'<a class="linkage_city_btnLink">三门峡市</a>'
					+'<a class="linkage_city_btnLink">南阳市</a>'
					+'<a class="linkage_city_btnLink">商丘市</a>'
					+'<a class="linkage_city_btnLink">信阳市</a>'
					+'<a class="linkage_city_btnLink">周口市</a>'
					+'<a class="linkage_city_btnLink">驻马店市</a>'
					+'<a class="linkage_city_btnLink">省直辖县</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_420000" class="linkage_box" style="display:none;">'
					+'<p>湖北省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">武汉市</a>'
					+'<a class="linkage_city_btnLink">黄石市</a>'
					+'<a class="linkage_city_btnLink">十堰市</a>'
					+'<a class="linkage_city_btnLink">宜昌市</a>'
					+'<a class="linkage_city_btnLink">襄樊市</a>'
					+'<a class="linkage_city_btnLink">鄂州市</a>'
					+'<a class="linkage_city_btnLink">荆门市</a>'
					+'<a class="linkage_city_btnLink">孝感市</a>'
					+'<a class="linkage_city_btnLink">荆州市</a>'
					+'<a class="linkage_city_btnLink">黄冈市</a>'
					+'<a class="linkage_city_btnLink">咸宁市</a>'
					+'<a class="linkage_city_btnLink">随州市</a>'
					+'<a class="linkage_city_btnLink">恩施土家族苗族自治州</a>'
					+'<a class="linkage_city_btnLink">省直辖县级行政区划</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_430000" class="linkage_box" style="display:none;">'
					+'<p>湖南省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">长沙市</a>'
					+'<a class="linkage_city_btnLink">株洲市</a>'
					+'<a class="linkage_city_btnLink">湘潭市</a>'
					+'<a class="linkage_city_btnLink">衡阳市</a>'
					+'<a class="linkage_city_btnLink">邵阳市</a>'
					+'<a class="linkage_city_btnLink">岳阳市</a>'
					+'<a class="linkage_city_btnLink">常德市</a>'
					+'<a class="linkage_city_btnLink">张家界市</a>'
					+'<a class="linkage_city_btnLink">益阳市</a>'
					+'<a class="linkage_city_btnLink">郴州市</a>'
					+'<a class="linkage_city_btnLink">永州市</a>'
					+'<a class="linkage_city_btnLink">怀化市</a>'
					+'<a class="linkage_city_btnLink">娄底市</a>'
					+'<a class="linkage_city_btnLink">湘西土家族苗族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_440000" class="linkage_box" style="display:none;">'
					+'<p>广东省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">广州市</a>'
					+'<a class="linkage_city_btnLink">韶关市</a>'
					+'<a class="linkage_city_btnLink">深圳市</a>'
					+'<a class="linkage_city_btnLink">珠海市</a>'
					+'<a class="linkage_city_btnLink">汕头市</a>'
					+'<a class="linkage_city_btnLink">佛山市</a>'
					+'<a class="linkage_city_btnLink">江门市</a>'
					+'<a class="linkage_city_btnLink">湛江市</a>'
					+'<a class="linkage_city_btnLink">茂名市</a>'
					+'<a class="linkage_city_btnLink">肇庆市</a>'
					+'<a class="linkage_city_btnLink">惠州市</a>'
					+'<a class="linkage_city_btnLink">梅州市</a>'
					+'<a class="linkage_city_btnLink">汕尾市</a>'
					+'<a class="linkage_city_btnLink">河源市</a>'
					+'<a class="linkage_city_btnLink">阳江市</a>'
					+'<a class="linkage_city_btnLink">清远市</a>'
					+'<a class="linkage_city_btnLink">东莞市</a>'
					+'<a class="linkage_city_btnLink">中山市</a>'
					+'<a class="linkage_city_btnLink">潮州市</a>'
					+'<a class="linkage_city_btnLink">揭阳市</a>'
					+'<a class="linkage_city_btnLink">云浮市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_450000" class="linkage_box" style="display:none;">'
					+'<p>广西省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">南宁市</a>'
					+'<a class="linkage_city_btnLink">柳州市</a>'
					+'<a class="linkage_city_btnLink">桂林市</a>'
					+'<a class="linkage_city_btnLink">梧州市</a>'
					+'<a class="linkage_city_btnLink">北海市</a>'
					+'<a class="linkage_city_btnLink">防城港市</a>'
					+'<a class="linkage_city_btnLink">钦州市</a>'
					+'<a class="linkage_city_btnLink">贵港市</a>'
					+'<a class="linkage_city_btnLink">玉林市</a>'
					+'<a class="linkage_city_btnLink">百色市</a>'
					+'<a class="linkage_city_btnLink">贺州市</a>'
					+'<a class="linkage_city_btnLink">河池市</a>'
					+'<a class="linkage_city_btnLink">来宾市</a>'
					+'<a class="linkage_city_btnLink">崇左市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_460000" class="linkage_box" style="display:none;">'
					+'<p>海南省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">海口市</a>'
					+'<a class="linkage_city_btnLink">三亚市</a>'
					+'<a class="linkage_city_btnLink">省直辖县级行政区划</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_510000" class="linkage_box" style="display:none;">'
					+'<p>四川省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">成都市</a>'
					+'<a class="linkage_city_btnLink">自贡市</a>'
					+'<a class="linkage_city_btnLink">攀枝花市</a>'
					+'<a class="linkage_city_btnLink">泸州市</a>'
					+'<a class="linkage_city_btnLink">德阳市</a>'
					+'<a class="linkage_city_btnLink">绵阳市</a>'
					+'<a class="linkage_city_btnLink">广元市</a>'
					+'<a class="linkage_city_btnLink">遂宁市</a>'
					+'<a class="linkage_city_btnLink">内江市</a>'
					+'<a class="linkage_city_btnLink">乐山市</a>'
					+'<a class="linkage_city_btnLink">南充市</a>'
					+'<a class="linkage_city_btnLink">眉山市</a>'
					+'<a class="linkage_city_btnLink">宜宾市</a>'
					+'<a class="linkage_city_btnLink">广安市</a>'
					+'<a class="linkage_city_btnLink">达州市</a>'
					+'<a class="linkage_city_btnLink">雅安市</a>'
					+'<a class="linkage_city_btnLink">巴中市</a>'
					+'<a class="linkage_city_btnLink">资阳市</a>'
					+'<a class="linkage_city_btnLink">阿坝藏族羌族自治州</a>'
					+'<a class="linkage_city_btnLink">甘孜藏族自治州</a>'
					+'<a class="linkage_city_btnLink">凉山彝族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_520000" class="linkage_box" style="display:none;">'
					+'<p>贵州省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">贵阳市</a>'
					+'<a class="linkage_city_btnLink">六盘水市</a>'
					+'<a class="linkage_city_btnLink">遵义市</a>'
					+'<a class="linkage_city_btnLink">安顺市</a>'
					+'<a class="linkage_city_btnLink">铜仁地区</a>'
					+'<a class="linkage_city_btnLink">黔西南布依族苗族自治州</a>'
					+'<a class="linkage_city_btnLink">毕节地区</a>'
					+'<a class="linkage_city_btnLink">黔东南苗族侗族自治州</a>'
					+'<a class="linkage_city_btnLink">黔南布依族苗族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_530000" class="linkage_box" style="display:none;">'
					+'<p>云南省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">昆明市</a>'
					+'<a class="linkage_city_btnLink">曲靖市</a>'
					+'<a class="linkage_city_btnLink">玉溪市</a>'
					+'<a class="linkage_city_btnLink">保山市</a>'
					+'<a class="linkage_city_btnLink">昭通市</a>'
					+'<a class="linkage_city_btnLink">丽江市</a>'
					+'<a class="linkage_city_btnLink">普洱市</a>'
					+'<a class="linkage_city_btnLink">临沧市</a>'
					+'<a class="linkage_city_btnLink">楚雄彝族自治州</a>'
					+'<a class="linkage_city_btnLink">大理白族自治州</a>'
					+'<a class="linkage_city_btnLink">红河哈尼族彝族自治州</a>'
					+'<a class="linkage_city_btnLink">文山壮族苗族自治州</a>'
					+'<a class="linkage_city_btnLink">西双版纳傣族自治州</a>'
					+'<a class="linkage_city_btnLink">德宏傣族景颇族自治州</a>'
					+'<a class="linkage_city_btnLink">怒江傈僳族自治州</a>'
					+'<a class="linkage_city_btnLink">迪庆藏族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_540000" class="linkage_box" style="display:none;">'
					+'<p>西藏</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">拉萨市</a>'
					+'<a class="linkage_city_btnLink">日喀则市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_610000" class="linkage_box" style="display:none;">'
					+'<p>陕西省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">西安市</a>'
					+'<a class="linkage_city_btnLink">铜川市</a>'
					+'<a class="linkage_city_btnLink">宝鸡市</a>'
					+'<a class="linkage_city_btnLink">咸阳市</a>'
					+'<a class="linkage_city_btnLink">渭南市</a>'
					+'<a class="linkage_city_btnLink">延安市</a>'
					+'<a class="linkage_city_btnLink">汉中市</a>'
					+'<a class="linkage_city_btnLink">榆林市</a>'
					+'<a class="linkage_city_btnLink">安康市</a>'
					+'<a class="linkage_city_btnLink">商洛市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_620000" class="linkage_box" style="display:none;">'
					+'<p>甘肃省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">兰州市</a>'
					+'<a class="linkage_city_btnLink">嘉峪关市</a>'
					+'<a class="linkage_city_btnLink">金昌市</a>'
					+'<a class="linkage_city_btnLink">白银市</a>'
					+'<a class="linkage_city_btnLink">天水市</a>'
					+'<a class="linkage_city_btnLink">武威市</a>'
					+'<a class="linkage_city_btnLink">张掖市</a>'
					+'<a class="linkage_city_btnLink">平凉市</a>'
					+'<a class="linkage_city_btnLink">酒泉市</a>'
					+'<a class="linkage_city_btnLink">庆阳市</a>'
					+'<a class="linkage_city_btnLink">定西市</a>'
					+'<a class="linkage_city_btnLink">陇南市</a>'
					+'<a class="linkage_city_btnLink">临夏回族自治州</a>'
					+'<a class="linkage_city_btnLink">甘南藏族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_630000" class="linkage_box" style="display:none;">'
					+'<p>青海省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">西宁市</a>'
					+'<a class="linkage_city_btnLink">海东地区</a>'
					+'<a class="linkage_city_btnLink">海北藏族自治州</a>'
					+'<a class="linkage_city_btnLink">黄南藏族自治州</a>'
					+'<a class="linkage_city_btnLink">海南藏族自治州</a>'
					+'<a class="linkage_city_btnLink">果洛藏族自治州</a>'
					+'<a class="linkage_city_btnLink">玉树藏族自治州</a>'
					+'<a class="linkage_city_btnLink">海西蒙古族藏族自治州</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_640000" class="linkage_box" style="display:none;">'
					+'<p>宁夏回族自治区</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">银川市</a>'
					+'<a class="linkage_city_btnLink">石嘴山市</a>'
					+'<a class="linkage_city_btnLink">吴忠市</a>'
					+'<a class="linkage_city_btnLink">固原市</a>'
					+'<a class="linkage_city_btnLink">中卫市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_650000" class="linkage_box" style="display:none;">'
					+'<p>新疆维吾尔自治区</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">乌鲁木齐市</a>'
					+'<a class="linkage_city_btnLink">克拉玛依市</a>'
					+'<a class="linkage_city_btnLink">吐鲁番地区</a>'
					+'<a class="linkage_city_btnLink">哈密地区</a>'
					+'<a class="linkage_city_btnLink">昌吉回族自治州</a>'
					+'<a class="linkage_city_btnLink">博尔塔拉蒙古自治州</a>'
					+'<a class="linkage_city_btnLink">巴音郭楞蒙古自治州</a>'
					+'<a class="linkage_city_btnLink">阿克苏地区</a>'
					+'<a class="linkage_city_btnLink">克孜勒苏柯尔克孜自治州</a>'
					+'<a class="linkage_city_btnLink">喀什地区</a>'
					+'<a class="linkage_city_btnLink">和田地区</a>'
					+'<a class="linkage_city_btnLink">伊犁哈萨克自治州</a>'
					+'<a class="linkage_city_btnLink">塔城地区</a>'
					+'<a class="linkage_city_btnLink">阿勒泰地区</a>'
					+'<a class="linkage_city_btnLink">市辖区</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_710000" class="linkage_box" style="display:none;">'
					+'<p>台湾省</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">台北市</a>'
					+'<a class="linkage_city_btnLink">高雄市</a>'
					+'<a class="linkage_city_btnLink">基隆市</a>'
					+'<a class="linkage_city_btnLink">台中市</a>'
					+'<a class="linkage_city_btnLink">台南市</a>'
					+'<a class="linkage_city_btnLink">新竹市</a>'
					+'<a class="linkage_city_btnLink">嘉义市</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_810000" class="linkage_box" style="display:none;">'
					+'<p>香港特别行政区</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">中西区</a>'
					+'<a class="linkage_city_btnLink">湾仔区</a>'
					+'<a class="linkage_city_btnLink">东区</a>'
					+'<a class="linkage_city_btnLink">南区</a>'
					+'<a class="linkage_city_btnLink">油尖旺区</a>'
					+'<a class="linkage_city_btnLink">深水埗区</a>'
					+'<a class="linkage_city_btnLink">九龙城区</a>'
					+'<a class="linkage_city_btnLink">黄大仙区</a>'
					+'<a class="linkage_city_btnLink">观塘区</a>'
					+'<a class="linkage_city_btnLink">荃湾区</a>'
					+'<a class="linkage_city_btnLink">葵青区</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					+'<div id="city_820000" class="linkage_box" style="display:none;">'
					+'<p>澳门特别行政区</p>'
					+'<ul>'
					+'<li>'
					+'<a class="linkage_city_btnLink">澳门</a>'
					+'</li>'
					+'</ul>'
					+'<a style="cursor:pointer" class="close" onclick="this.parentNode.style.display=\'none\'">关闭</a>'
					+'</div>'
					    	+'';
						
						
						$(".linkageProvince").parent().append(linkageHtml);
						
					    $(".linkageProvince").click(function()
					    {
					    	$(".linkage_box").hide();//关闭已显示的地址层
					        var offset = $(".linkageProvince").offset();
					        if($("#linkage_province").is(":visible"))
					        {
					        	$("#linkage_province").hide(200);
					        }else
					        {
					        	var widthpx = $(window).width();
					        	var inputWidthPx = $(".linkageProvince").width();
					        	if( (widthpx - offset.left) < 300 )
					        	{
					        		myleft = (offset.left + inputWidthPx - 300);
					        	}else{
					        		myleft = offset.left;
					        	}
					        	mytop = offset.top + $(".linkageProvince").height();
					        	$("#linkage_province").css({ top: mytop + toppx + "px", left: myleft+leftpx + "px" }).show(200);
					        }
					    });
					    
					    
					
						
						$(".linkage_city_btnLink").click(function(){
							$(".linkageCity").val($(this).html());
							$(".linkage_box").hide(200);
						});
						
						$(".linkage_province_btnLink").click(function(){
							$(".linkageProvince").val($(this).html());
							$("#linkage_province").hide(200);
							var offset = $(".linkageCity").offset();
							
							var widthpx = $(window).width();
					        var inputWidthPx = $(".linkageCity").width();
					        if( (widthpx - offset.left) < 300 )
					        {
					        	myleft = (offset.left + inputWidthPx - 300);
					        }else{
					        	myleft = offset.left;
					        }
					        mytop = offset.top + $(".linkageCity").height();
					        
							$("#"+"city_"+$(this).attr("id")).css({ top: mytop + toppx + "px", left: myleft+leftpx + "px" }).show(200);
						});
						
					
					});