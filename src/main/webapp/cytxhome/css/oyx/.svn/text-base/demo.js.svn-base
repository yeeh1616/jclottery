function getCookie(name) {
  var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
  if(arr != null) {
    return unescape(arr[2]);
  } else {
    return false;
  }
}

function writeCookie(name,value) {
  var Days = 365; //
  var exp  = new Date();    //
  exp.setTime(exp.getTime() + Days*86400000);
  document.cookie = name + "="+ escape(value) +";path=/;expires="+ exp.toGMTString();
}

function delCookie(name) {
  var exp = new Date();
  exp.setTime(exp.getTime() - 1);
  var cval = getCookie(name);
  if(cval!=null) {
    document.cookie=name +"="+cval+";expires="+exp.toGMTString();
  }
}

function scroll(p){
  var d = document,w = window,o = d.getElementById(p.id),ie6 = /msie 6/i.test(navigator.userAgent);
  if(o){
    o.style.cssText +=";position:"+(p.f&&!ie6?'fixed':'absolute')+";"+(p.r?'left':"right")+":0;"+(p.t!=undefined?'top:'+p.t+'px':'bottom:0');
    if(!p.f||ie6){
      -function(){
        var t = 500,st = d.documentElement.scrollTop||d.body.scrollTop,c;
        c = st  - 200 -o.offsetTop + (p.t!=undefined?p.t:(w.innerHeight||d.documentElement.clientHeight)-o.offsetHeight);//如果你是html 4.01请改成d.body，这里不处理以减少代码
        c!=0&&(o.style.top = o.offsetTop + Math.ceil(Math.abs(c)/10)*(c<0?-1:1) + 'px',t=10);
        setTimeout(arguments.callee,t);
      }();
    }
  }
}
function Hidden(id_) {
  $('#show_bet_change').html();
  $('#show_bet_change').hide();
}

function show_bet_change(mid, e) {
  var e = e || event;
  var bodyTop = 0;
  if (document.compatMode == "BackCompat") {
    bodyTop = document.body.scrollTop; 
  } else {
    bodyTop = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop; 
  }
  $('#show_bet_change').css('top', (bodyTop + e.clientY+15)+'px');
  $('#show_bet_change').css('left', (e.clientX - 290)+'px');
  $.get(
    "/football/info/fb_his_interface.php?action=fb_hhad_his&mid="+mid,
    function(result){
      $('#show_bet_change').html(result);
      $('#show_bet_change').show();
    }
  );
}

var loaded=0;
var LoadTime=0;
var notifyTimer=0;
var matchType=-1;
var runtimeTimer=0;
var loadFileTime=new Date();
var loadDetailFileTime=new Date();
var lastUpdateTime="";
var oldUpdateTime="";
var lastUpdateFileTime=0;
var hiddenID="_";
var concernId="_";
var bg1="#FFFDF3";
var bg2="#F0F0F0";

var flash_sound=Array(5);
flash_sound[1] = "images/goalSound.swf";
flash_sound[2] = "images/notice.swf";
flash_sound[3] = "images/deep.swf";
flash_sound[4] = "images/base.swf";

var state_ch=Array(18);
state_ch[0]="推迟,推遲,Defer";
state_ch[1]="中断,中斷,Halt";
state_ch[2]="腰斩,腰斬,Halt";
state_ch[3] = "<font color=green>待定</font>,<font color=green>待定</font>,<font color=green>Wait</font>";
state_ch[4] = "取消,取消,Cancel";
state_ch[13]="<b>完</b>,<b>完</b>,<b>Ft</b>";
state_ch[14]=",,";
state_ch[15]="上,上,Part1";
state_ch[16]="<font color=blue>中</font>,<font color=blue>中</font>,<font color=blue>Half</font>";
state_ch[17] = "下,下,Part2";
state_ch[18] = "加,加,Ot";

var status_ch = Array(16);
status_ch[0] = "开球";
status_ch[3] = "射门次数";
status_ch[4] = "射正次数";
status_ch[5] = "犯规次数";
status_ch[6] = "角球次数";
status_ch[9] = "越位次数";
status_ch[11] = "黄牌数";
status_ch[14] = "控球时间";
status_ch[16] = "救球";

var GoalCn="平手,平/半,半球,半/一,一球,一/球半,球半,球半/两,两球,两/两球半,两球半,两球半/三,三球,三/三球半,三球半,三球半/四球,四球,四球/四球半,四球半,四球半/五球,五球,五球/五球半,五球半,五球半/六球,六球,六球/六球半,六球半,六球半/七球,七球,七球/七球半,七球半,七球半/八球,八球,八球/八球半,八球半,八球半/九球,九球,九球/九球半,九球半,九球半/十球,十球".split(",");
var GoalCn2 = ["0", "0/0.5", "0.5", "0.5/1", "1", "1/1.5", "1.5", "1.5/2", "2", "2/2.5", "2.5", "2.5/3", "3", "3/3.5", "3.5", "3.5/4", "4", "4/4.5", "4.5", "4.5/5", "5", "5/5.5", "5.5", "5.5/6", "6", "6/6.5", "6.5", "6.5/7", "7", "7/7.5", "7.5", "7.5/8", "8", "8/8.5", "8.5", "8.5/9", "9", "9/9.5", "9.5", "9.5/10", "10", "10/10.5", "10.5", "10.5/11", "11", "11/11.5", "11.5", "11.5/12", "12", "12/12.5", "12.5", "12.5/13", "13", "13/13.5", "13.5", "13.5/14", "14" ];
var WeekDay = ["", "周一", "周二", "周三", "周四", "周五", "周六", "周日"];
function Goal2GoalCn(goal){ //数字盘口转汉汉字  
  if (goal==null || goal +""=="") {
    return "";
  } else {
    if(goal>10 || goal<-10) return goal+"球";
    if(goal>=0)  return GoalCn[parseInt(goal*4)];
    else return "受"+ GoalCn[Math.abs(parseInt(goal*4))];
  }
}
function Goal2GoalCn2(goal){
  if (goal=="") {
    return "";
  } else {
    if(goal>14) return goal+"球";
    return GoalCn2[parseInt(goal*4)];
  }
}

//显示进球窗口
var startani_C, startani_A, startani_B, pop_TC;
var oPopup;
try{
  oPopup=window.createPopup();
} catch(e) {}

function pop(x,y, w, h){
  try{
    oPopup.show(x, y, w, h);
    startani_A = setTimeout("pop("+x+","+y+","+w+","+h+")",300);  //显示15秒
    if(pop_TC<0){dismisspopup();};
    pop_TC=pop_TC-1;
  } catch(e){
  }
}

function dismisspopup() {
  clearTimeout(startani_A);
  oPopup.hide();
}

/** Config begin **/
var Config = new Object();
Config.language = 0;
Config.rank = 0;
Config.explain = 0;
Config.redcard = 1;
Config.redcardWin = 1;
Config.detail = 1;
Config.vs = 1;
Config.sound = 1;
Config.guestSound = 0;
Config.winLocation = 1;
Config.style = 0;
Config.oddsSound = 0;
Config.sound_swf = ['sound.swf','notice.swf','deep.swf','base.swf'];

Config.getCookie = function(type) {
  var Cookie=getCookie("Cookie");
  if(!Cookie) Cookie=""; 
  var Cookie=Cookie.split("^");
  if(Cookie.length!=12) {
    Config.writeCookie();
  } else {
    this.language =parseInt(Cookie[0]);
    this.rank =parseInt(Cookie[1]);
    this.explain = parseInt(Cookie[2]);
    this.redcard =parseInt(Cookie[3]);
    this.redcardWin=parseInt(Cookie[4]);
    this.detail =parseInt(Cookie[5]);
    this.vs =parseInt(Cookie[6]);
    this.sound = parseInt(Cookie[7]);
    this.winLocation =parseInt(Cookie[8]);        
    this.style =parseInt(Cookie[9]);
    this.oddsSound = parseInt(Cookie[10]);
    this.guestSound = parseInt(Cookie[11]);
  }
  try {
    //document.getElementById("Language"+ Config.language).className="selected";
    //if(this.rank==1)  document.getElementById("rank").checked=true;
    //if(this.explain==0)  document.getElementById("explain").checked=false;
    if(this.redcard==0) $("#redcard").attr("checked", false);
    else $("#redcard").attr("checked", true);
    if(this.redcardWin==0) $("#redcardWin").attr("checked", false);
    else $("#redcardWin").attr("checked", true);
    //if(this.detail==0)  document.getElementById("detail").checked=false;
    //if(this.vs==0)  document.getElementById("vs").checked=false;
    if(this.sound==0) $("#sound").attr("checked", false);
    else $("#sound").attr("checked", true);
    if(this.sound>0) $("#sound_"+this.sound).attr("checked", true);
    if(this.winLocation==0) $("#winLocation").attr("checked", false);
    else $("#winLocation").attr("checked", true);
    if(this.winLocation>0) $("#winLocation_"+this.winLocation).attr("checked", true);
    //if(this.style>0)  document.getElementById("style").value=this.style;
    //if(type=="2in1" && this.oddsSound==1)  document.getElementById("oddsSound").checked=true;
  } catch(e) {
  }
}

Config.writeCookie = function() {
  var value = this.language + "^" + this.rank + "^" + this.explain + "^" + this.redcard + "^" + this.redcardWin + "^" + this.detail + "^" + this.vs + "^" + this.sound + "^" + this.winLocation + "^" + this.style + "^" + this.oddsSound + "^" + this.guestSound;     
  writeCookie("Cookie",value);
}

Config.CheckFunction = function(obj) {
  if ($('#'+obj).attr("checked")) {
    eval("Config."+obj+"=1");
  } else {
    eval("Config."+obj+"=0");
  }
  Config.writeCookie();
}

Config.ShowDiv = function(obj) {
  switch(obj) {
    case "LocationBox":
      if (Config.winLocation > 0) {
        if ($('#'+obj).css('display') == 'none') {
          $('#'+obj).show();
        } else {
          $('#'+obj).hide();
        }
        return true;
      } else {
        return false;
      }
    break;
    case "SoundBox":
      if (Config.sound > 0) {
        if ($('#'+obj).css('display') == 'none') {
          $('#'+obj).show();
        } else {
          $('#'+obj).hide();
        }
        return true;
      } else {
        return false;
      }
    break;
  }
}

Config.ShowFlash = function(id, n) {
  try {
    var ieVersion = "-1";
    var ua = navigator.userAgent.toLowerCase();
    if (window.ActiveXObject)
      ieVersion = ua.match(/msie ([\d.]+)/)[1];
    if (Config.sound >= 0 && parseInt(A[n][13]) >= -1) {
      if (document.getElementById("tr1_" + id).style.display != "none") {
        if (parseFloat(ieVersion) > 0 && parseFloat(ieVersion) < 6)
          document.getElementById("flashsound").innerHTML = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='1' height='1'><param name='movie' value='" + flash_sound[Config.sound] + "'><param name='quality' value='high'><param name='wmode' value='transparent'><embed src='" + flash_sound[Config.sound] + "' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='1' height='1'></embed></object>";
        else
          document.getElementById("flashsound").innerHTML = "<embed src='" + flash_sound[Config.sound] + "' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='1' height='1'></embed>";
      }
    }
  } catch (e) {
  }
  window.setTimeout("timecolors(" + id + ")", 60000);
}

Config.ShowDivLocation = function() {
  if (Config.winLocation <= 0) {
    return false;
  } else {
    var windowWidth = document.documentElement.clientWidth;
    var bodyTop = document.documentElement.clientHeight + document.body.scrollTop;
    var popupHeight = $("#GoalDiv").height();
    var popupWidth = $("#GoalDiv").width();
    switch(Config.winLocation) {
      case 1:
      break;
      case 2:
      break;
    }
    return true;
  }
}

function timecolors(matchid){
  try{
    var tr = document.getElementById("tr1_" + matchid);
    tr.cells[5].style.backgroundColor="";
    tr.cells[7].style.backgroundColor="";
  } catch(e) {}
}

/** Config end **/

function ShowSelectLeague() {
  $('#SSDiv').show();
}

function HideSelectLeague() {
  $('#SSDiv').hide();
}

function SelectLocation(n) {
  if (Config.winLocation > 0) {
    Config.winLocation = n;
    Config.writeCookie();
  }
  $('#LocationBox').hide();
}

function SelectSound(n) {
  if (Config.sound > 0) {
    Config.sound = n;
    Config.writeCookie();
  }
  $('#SoundBox').hide();
}

function CheckLeague(obj) {
  if (obj.checked) {
    $('#'+obj.id.substr(2)).css("background-color", "#ffeded");
  } else {
    $('#'+obj.id.substr(2)).css("background-color", "#ffffff");
  }
}

function ShowAllMatch(){
  SelectAll(true);
  SelectOK();
}

function SelectAll(value){
  $('#SSDiv input').each(function() {
    this.checked = value;
    if (value) {
      $('#' + this.id.substring(2)).css("background-color", "#ffeded");
    } else {
      $('#' + this.id.substring(2)).css("background-color", "#ffffff");
    }
  });
}

function SelectImportant(){
  for(var i=1;i<=sclasscount;i++) {
    if(B[i][6]==0) continue;
    if(B[i][5]=="1"){
      $("#myleague_"+i).attr("checked", true);
      $("#league_"+i).css("background-color", "#ffeded");
    } else {
      $("#myleague_"+i).attr("checked", false);
      $("#league_"+i).css("background", "#ffffff");
    }
  }
}

function SelectReverse() {
  $('#SSDiv input').each(function() {
    if (this.checked) {
      this.checked = false;
      $('#' + this.id.substring(2)).css("background-color", "#ffffff");
    } else {
      this.checked = true;
      $('#' + this.id.substring(2)).css("background-color", "#ffeded");
    }
  });
}

function SelectOK(){
  $('#SSDiv').hide();
  var i,j;
  var hh=0;
  hiddenID="_";
  
  try {
    $('#SSDiv input').each(function() {
      if (this.checked) {
        var k=parseInt(this.value);
        for(var j=1;j<=matchcount;j++){
          if(A[j][0]>0 && A[j][2]==B[k][0]){
            $('#tr1_'+A[j][0]).css('display', '');
            hiddenID+=A[j][0] + "_";
          }
        }
      } else {
        var k=parseInt(this.value);
        for(var j=1;j<=matchcount;j++){
          if(A[j][0]>0 && A[j][2]==B[k][0]){
            $('#tr1_'+A[j][0]).css('display', 'none');
            hh=hh+1;
            //if(hiddenID.indexOf("_"+A[j][0] + "_")==-1) hiddenID+=A[j][0] + "_";
          }
        }
      }
    });
  } catch(e) {
  }
  writeCookie("Fbls_hiddenID", hiddenID);   
}

function HiddenSelected(value){
  for(var j=1;j<=sclasscount;j++) B[j][7]=0;
  for(var i=1;i<=matchcount;i++){
    if (A[i][0] > 0 && document.getElementById('tr1_'+A[i][0]).style.display == "") {
      if(document.getElementById("chk_" +  A[i][0]).checked == value){
        $("#tr1_" + A[i][0]).css('display', 'none');
        hiddenID = hiddenID.replace("_"+A[i][0] + "_","_");
      } else {
        if(hiddenID.indexOf("_" + A[i][0] + "_") == -1) hiddenID += A[i][0] + "_";
        for(j=1;j<=sclasscount;j++){
          if(A[i][2]==B[j][0]) {
            B[j][7]++;
            break;
          }
        }
      }
    }
  }
  for(var j=1;j<=sclasscount;j++) {
    if(B[j][6]==0) continue;
    if(B[j][7]>0){
      $("#myleague_" + j).attr("checked", true);
      $("#league_" + j).css("background-color", "#ffeeee");
    } else {
      $("#myleague_" + j).attr("checked", false);
      $("#league_" + j).css("background-color", "#ffffff");
    }
  }
  writeCookie("Fbls_hiddenID", hiddenID);   
}

function SelectReset() {
  $("#TableBox input").each(function(index) {
    if (this.checked) {
      this.checked = false;
    }
  });
}

function ShowFilter(n) {
  for(var j=1;j<=sclasscount;j++) B[j][7]=0;
  for(var i=1;i<=matchcount;i++){
    if (A[i][0] > 0) {
      state = parseInt(A[i][13]);
      if (n == 3) {
        if (state == 0) {
          $("#tr1_" + A[i][0]).css('display', '');
          if(hiddenID.indexOf("_" + A[i][0] + "_") == -1) hiddenID += A[i][0] + "_";
          for(j=1;j<=sclasscount;j++){
            if(A[i][2]==B[j][0]) {
              B[j][7]++;
              break;
            }
          }
        } else {
          $("#tr1_" + A[i][0]).css('display', 'none');
          hiddenID = hiddenID.replace("_"+A[i][0] + "_","_");
        }
      } else if (n == 2) {
        if (state > 0) {
          $("#tr1_" + A[i][0]).css('display', '');
          if(hiddenID.indexOf("_" + A[i][0] + "_") == -1) hiddenID += A[i][0] + "_";
          for(j=1;j<=sclasscount;j++){
            if(A[i][2]==B[j][0]) {
              B[j][7]++;
              break;
            }
          }
        } else {
          $("#tr1_" + A[i][0]).css('display', 'none');
          hiddenID = hiddenID.replace("_"+A[i][0] + "_","_");
        }
      } else if (n == 1) {
        if (state < 0) {
          $("#tr1_" + A[i][0]).css('display', '');
          if(hiddenID.indexOf("_" + A[i][0] + "_") == -1) hiddenID += A[i][0] + "_";
          for(j=1;j<=sclasscount;j++){
            if(A[i][2]==B[j][0]) {
              B[j][7]++;
              break;
            }
          }
        } else {
          $("#tr1_" + A[i][0]).css('display', 'none');
          hiddenID = hiddenID.replace("_"+A[i][0] + "_","_");
        }
      }
    }
  }
  for(var j=1;j<=sclasscount;j++) {
    if(B[j][6]==0) continue;
    if(B[j][7]>0){
      $("#myleague_" + j).attr("checked", true);
      $("#league_" + j).css("background-color", "#ffeeee");
    } else {
      $("#myleague_" + j).attr("checked", false);
      $("#league_" + j).css("background-color", "#ffffff");
    }
  }
  writeCookie("Fbls_hiddenID", hiddenID); 
}

//关注比赛函数
function addConcern(matchIndex, num) {
  var cCount = document.getElementById("concernCount").innerHTML;
  if (concernId.indexOf("_" + A[matchIndex][0] + "_") == -1) concernId += A[matchIndex][0] + "_";
  else return;
  writeCookie("Fbls_concernId", concernId);
  cCount++;
  var tr = document.getElementById("tr1_" + A[matchIndex][0]);
  tr.cells[num].innerHTML = tr.cells[num].innerHTML.replace("addConcern", "deleteConcern").replace("expand", "collapse").replace("添加", "取消");
  var TTime = new Date();
  var isChange = false;
  var nt = A[matchIndex][11].split(":");
  var nd = A[matchIndex][36].split("-");
  var nt2 = new Date(TTime.getYear(), nd[0], nd[1], nt[0], nt[1], 0);
  for (var i = 1; i <= matchcount; i++) {
    if (concernId.indexOf("_" + A[i][0] + "_") != -1) {
      if (A[i][13] > 0) {
        var ot = A[i][11].split(":");
        var od = A[i][36].split("-");
        var ot2 = new Date(TTime.getYear(), od[0], od[1], ot[0], ot[1], 0);
        if (ot2 > nt2) {
          isChange = true;
          MovePlace(A[i][0], A[matchIndex][0]);
          break;
        }
      }
    }
  }
  if (!isChange || temp.length == 0) MovePlace(0, A[matchIndex][0]);
  document.getElementById("concernCount").innerHTML = cCount;
}

function addMoreConcern(num) {
  var searchStr = document.getElementById("searchCorcen").value;
  if (searchStr == "") {
    alert("请输入搜索内容!");
    return;
  }
  
  for (var i = 1; i <= matchcount; i++) {
    try {
      if (A[i][2].indexOf(searchStr) != -1 || A[i][3].indexOf(searchStr) != -1 || A[i][4].indexOf(searchStr) != -1 || A[i][5].indexOf(searchStr) != -1 || A[i][6].indexOf(searchStr) != -1 || A[i][7].indexOf(searchStr) != -1 || A[i][8].indexOf(searchStr) != -1 || A[i][9].indexOf(searchStr) != -1 || A[i][10].indexOf(searchStr) != -1)
        addConcern(i, num);
    } catch (e) {
    }
  }   
}

function deleteConcern(matchIndex, count) {
  if (concernId.indexOf("_" + A[matchIndex][0] + "_") == -1) return;
  var tr = document.getElementById("tr1_" + A[matchIndex][0]);
  tr.cells[count].innerHTML = tr.cells[count].innerHTML.replace("deleteConcern", "addConcern").replace("collapse", "expand").replace("取消", "添加");
  var TTime = new Date();
  var isChange = false;
  var nt = A[matchIndex][11].split(":");
  var nd = A[matchIndex][36].split("-");
  var nt2 = new Date(TTime.getYear(), nd[0], nd[1], nt[0], nt[1], 0);
  for (var i = 1; i <= matchcount; i++) {
    if (concernId.indexOf("_" + A[i][0] + "_") == -1) {
      if (A[matchIndex][13] == -1) {
        if (A[i][13] == -1) {
          if (A[i][0] > 0) {
            var ot = A[i][11].split(":");
            var od = A[i][36].split("-");
            var ot2 = new Date(TTime.getYear(), od[0], od[1], ot[0], ot[1], 0);
            if (ot2 > nt2) {
              isChange = true;
              MovePlace(A[i][0], A[matchIndex][0]);
              break;
            }
          }
        }
      }
      else {
        if (A[i][0] > 0) {
          var ot = A[i][11].split(":");
          var od = A[i][36].split("-");
          var ot2 = new Date(TTime.getYear(), od[0], od[1], ot[0], ot[1], 0);
          if (ot2 > nt2) {
            isChange = true;
            MovePlace(A[i][0], A[matchIndex][0]);
            break;
          }
        }
      }
    }
  }
  if (!isChange) {
    if (count > 10) {
      var list = new Array();
      list = oddsLastIndex.split(',');
      if (matchIndex > 10) {
        var num = matchIndex;
        var num2 = 0;
        for (var i = list.length - 2; i >= 0; i--) {
          if (concernId.indexOf("_" + A[list[i]][0] + "_") != -1) {
            num2 = i;
          }
        }
        MovePlace(A[list[num2 - 1]][0], A[matchIndex][0]);
      }
      else {
        var num = list.length - 1;
        MovePlace(A[list[num - 1]][0], A[matchIndex][0]);
      }
    } else {
      if (matchIndex > 10) {
        var num2 = 0;
        for (var i = A.length - 1; i > 0; i--) {
          if (concernId.indexOf("_" + A[i][0] + "_") != -1) {
            num2 = i;
          }
        }
        MovePlace(A[num2 - 1][0], A[matchIndex][0]);
      }
      else {
        var num = A.length - 1;
        MovePlace(A[num - 1][0], A[matchIndex][0]);
      }
    }
  } 
  concernId = concernId.replace("_" + A[matchIndex][0] + "_", "_");
  var cCount = document.getElementById("concernCount").innerHTML;
  writeCookie("Fbls_concernId", concernId);
  cCount--;
  document.getElementById("concernCount").innerHTML = cCount;
}      

function deleteAllConcern() {
  if (concernId == "_" || concernId == "")
    return;
  concernId = "_";
  document.getElementById("concernCount").innerHTML = 0;
  writeCookie("Fbls_concernId", concernId);
  var allDate = document.getElementById("allDate");
  var s = document.createElement("script");
  s.type = "text/javascript";
  //s.src = "http://info.sporttery.cn/livescore/iframe/realtime2.php?type=fbdata&r=?" + Date.parse(new Date());
  s.src = "/data/lottery/guess/foot/test1.jsp?type=fbdata&r=" + Date.parse(new Date());
  s.charset="utf-8";
  allDate.removeChild(allDate.firstChild);
  allDate.appendChild(s, "script");
  MakeTable();
}

//开始
function ShowBf() {
  loaded=0;
  hiddenID=getCookie("Fbls_hiddenID");
  if(!hiddenID) hiddenID="_";
  concernId=getCookie("Fbls_concernId");
  if(!concernId) concernId="_";
  
  SortData();
  MakeTable();

  window.clearTimeout(runtimeTimer);
  runtimeTimer=window.setTimeout("setMatchTime()",1000);
  //n  document.getElementById("loading").style.display="none";
}

function SortData() {
  temp=new Array();
  var j=1; 
  temp[0]=",";
  var tempCount=matchcount;
  for(var i=1;i<=tempCount;i++) {
    if(concernId.indexOf("_" + A[i][0] + "_")!=-1) {
      temp[j]=A[i];
      A.splice(i,1);
      tempCount--;
      i--;
      j++;
    }
  }
  if(temp.length>1) {
    document.getElementById("concernCount").innerHTML=temp.length-1;
    A.splice(0,1);
    A=temp.concat(A);
  }
}

function MakeTable() {
  var state,j=0,hh=0;
  //var H_redcard,G_redcard,H_yellow,G_yellow,H_order,G_order;
  var oldHiddenID=true;
  var ArrayHiddenID=hiddenID.split("_");
  //var isCreateTableTop=false;
  var html_=new Array();

  html_.push('        <table cellpadding="0" cellspacing="0" class="Table">');
  html_.push('          <tr>');
  html_.push('            <th rowspan="2" width="50px" style="border-left:1px #498FD0 solid">选</th>');
  html_.push('            <th rowspan="2" width="60px">编号</th>');
  html_.push('            <th rowspan="2">联赛</th>');
  html_.push('            <th rowspan="2" width="50px">时间</th>');
  html_.push('            <th rowspan="2" width="50px">态</th>');
  html_.push('            <th rowspan="2">主队</th>');
  html_.push('            <th rowspan="2" width="80px">比分</th>');
  html_.push('            <th rowspan="2">客队</th>');
  html_.push('            <th rowspan="2" width="40px">半</th>');
  html_.push('            <th rowspan="2" width="40px">彩</th>');
  html_.push('            <th colspan="3" style="line-height:27px">竞彩奖金</th>');
  html_.push('            <th rowspan="2" style="border-right:1px #498FD0 solid">其他</th>');
  html_.push('          </tr>');
  html_.push('          <tr>');
  html_.push('            <th style="line-height:24px;background:#327CC0;width:50px">胜</th>');
  html_.push('            <th style="line-height:24px;background:#327CC0;width:50px">平</th>');
  html_.push('            <th style="line-height:24px;background:#327CC0;width:50px">负</th>');
  html_.push('          </tr>');

  if(hiddenID != "_") {
    for(var i=1; i<=matchcount; i++){
      if(ArrayHiddenID[1] == A[i][0]){
        oldHiddenID=false;
        break;
      }
    }
  }
  
  if(oldHiddenID) hiddenID="_";

  for (var i=1; i<=matchcount;i++) {
    try {
      if(i % 2==0) bg=bg1; else bg=bg2;
        
      if (matchType >= 0){
        A[i][25] = parseInt(A[i][25]);
        if ( !(matchType==0 && A[i][25]>0 || matchType==1 && (A[i][25]==1 || A[i][25]===3) || matchType==2 && (A[i][25]==2 || A[i][25]===3))){
          A[i][0]=0;
          continue;
        }
      }
      for(j=1;j<=sclasscount;j++){
        if(A[i][2]==B[j][0]){
          B[j][6]++;
          if(hiddenID=="_" || hiddenID.indexOf("_"+A[i][0] + "_")!=-1)  B[j][7]++;
          break;
        }
      }
      /*
      for(j=0;j<C.length;j++) {
        if(A[i][40]==C[j][0]) {
          C[j][2]++;
          break;
        }
      }
      */
      
      state = parseInt(A[i][13]);
      switch(state) {
        case 0:
          if(A[i][27]=="1") match_score = "-";//match_score = "阵容";
          else match_score = "-";
          match_half = "-";
          break;
        case 1:
          if (A[i][52] == 1) {
            match_score = A[i][15] + "-" + A[i][14];
          } else {
            match_score = A[i][14] + "-" + A[i][15];
          }
          match_half = "-";
          break;
        case -11:
        case -14:
          match_score = "";
          match_half = "";
          break;
        default:
          if (A[i][52] == 1) {
            match_score = A[i][15] + "-" + A[i][14];
            match_half = A[i][17] + "-" + A[i][16];
          } else {
            match_score = A[i][14] + "-" + A[i][15];
            match_half = A[i][16] + "-" + A[i][17];
          }
          break;
      }
      
      /*
      //if(A[i][29]!="") pk[Math.abs(A[i][29])*4]++;
      if(A[i][18]!="0") H_redcard = "<img src='images/redcard" + A[i][18] + ".gif'>"; else H_redcard = "";
      if(A[i][19]!="0") G_redcard = "<img src='images/redcard" + A[i][19] +  ".gif'>"; else  G_redcard = "";
      if(A[i][20]!="0") H_yellow = "<img src='images/yellow" + A[i][20] + ".gif'>"; else H_yellow = "";
      if(A[i][21]!="0") G_yellow = "<img src='images/yellow" + A[i][21] +  ".gif'>"; else  G_yellow = "";
      H_order="";G_order="";
      if(Config.rank==1){
        if(A[i][22]!="") H_order="<font color=#444444><sup>["+ A[i][22] +"]</sup></font>";
        if(A[i][23]!="") G_order="<font color=#444444><sup>["+ A[i][23] +"]</sup></font>";
      }
      */
      
      if(hiddenID!="_"){
        for(var j=1;j<ArrayHiddenID.length-1;j++){
          if(ArrayHiddenID[j]==A[i][0]){
            classx="";
            break;
          }
        }
      }
      
      html_.push('          <tr id="tr1_' + A[i][0] + '" bgcolor="' + bg + '" index="' + i + '">');
      html_.push('            <td><input type="checkbox"  id="chk_' + A[i][0] +'" /></td>');
      html_.push('            <td>');
      var tmp_str = A[i][A[i].length-2].substring(0, 1);
      tmp_str = parseInt(tmp_str);
      html_.push('<!--' + tmp_str + '-->');
      html_.push(WeekDay[tmp_str] + A[i][51].substring(1, 4));
      html_.push('</td>');
      html_.push('            <td bgcolor="' + A[i][1] + '" style="color:white;">' + A[i][2] + '</td>');
      html_.push('            <td id="mt_' + A[i][0] + '">' + A[i][11] + '</td>');
      html_.push('            <td id="time_' + A[i][0] + '" class="td_status">' + state_ch[state+14].split(",")[Config.language] + '</td>');
      html_.push('            <td id="team1_' + A[i][0] +'">' + A[i][5+Config.language]+'');
      if (A[i][42]!='' && parseInt(A[i][42], 10) != 0) {
        html_.push('(' + A[i][42] + ')');
      }
      if (A[i][52] == 1) {
        if (parseInt(A[i][19], 10) > 0) {
          html_.push('<span class="yellowcardbg">' + A[i][19] + '</span>');
        }
      } else {
        if (parseInt(A[i][18], 10) > 0) {
          html_.push('<span class="yellowcardbg">' + A[i][18] + '</span>');
        }
      }
      html_.push('</td>');

      if(A[i][13] =="-1")
        t_class = ' style="color:red;"';
      else
        t_class = '';
      html_.push('            <td class="bifen"' + t_class + 'onmouseover="show_detail(' + i + ',event);" onmouseout="hide_detail();">' + match_score + '</td>');
      html_.push('            <td id="team2_' + A[i][0] + '">');
      if (A[i][52] == 1) {
        if (parseInt(A[i][18], 10) > 0) {
          html_.push('<span class="yellowcardbg">' + A[i][18] + '</span>');
        }
      } else {
        if (parseInt(A[i][19], 10) > 0) {
          html_.push('<span class="yellowcardbg">' + A[i][19] + '</span>');
        }
      }
      html_.push(A[i][8+Config.language] + '</td>');
      html_.push('            <td>' + match_half + '</td>');
      html_.push('            <td style="font-weight: bold;">' + A[i][43] + '</td>');
      if (A[i][43] != '') {   
        if (A[i][43] == "<font color='#FF0000'>胜</font>") {
          if (A[i][49] < 0 || A[i][49] > 0) {
            html_.push('            <td style="color: #FF0000; font-weight: bold;" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][46] + '</td>');
          } else {
            html_.push('            <td style="color: #FF0000; font-weight: bold;">' + A[i][46] + '</td>');
          }
          html_.push('            <td>' + A[i][45] + '</td>');
          html_.push('            <td>' + A[i][44] + '</td>');
        } else if (A[i][43] == "平") {
          html_.push('            <td>' + A[i][46] + '</td>');
          if (A[i][48] < 0 || A[i][48] > 0) {
            html_.push('            <td style="color: #FF0000; font-weight: bold;" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][45] + '</td>');
          } else {
            html_.push('            <td style="color: #FF0000; font-weight: bold;">' + A[i][45] + '</td>');
          }
          html_.push('            <td>' + A[i][44] + '</td>');
        } else if (A[i][43] == "<font color='#3165F7'>负</font>") {
          html_.push('            <td>' + A[i][46] + '</td>');
          html_.push('            <td>' + A[i][45] + '</td>');
          if (A[i][47] < 0 || A[i][47] > 0) {
            html_.push('            <td style="color: #FF0000; font-weight: bold;" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][44] + '</td>');
          } else {
            html_.push('            <td style="color: #FF0000; font-weight: bold;">' + A[i][44] + '</td>');
          }
        } else {
          html_.push('            <td>' + A[i][46] + '</td>');
          html_.push('            <td>' + A[i][45] + '</td>');
          html_.push('            <td>' + A[i][44] + '</td>');
        }
      } else {
        var tmp_flag = '1';
        if (A[i][50] == '0000-00-00 00:00:00') {
          tmp_flag = '';
        }
        if (A[i][49] < 0) {
          html_.push('            <td class="fu' + tmp_flag + '" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][46] + '↑');
        } else if (A[i][49] > 0) {
          html_.push('            <td class="ping' + tmp_flag + '" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][46] + '↓');
        } else {
          html_.push('            <td>' + A[i][46]);
        }
        html_.push('</td>');
        if (A[i][48] < 0) {
          html_.push('            <td class="fu' + tmp_flag + '" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][45] + '↑');
        } else if (A[i][48] > 0) {
          html_.push('            <td class="ping' + tmp_flag + '" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][45] + '↓');
        } else {
          html_.push('            <td>' + A[i][45]);
        }
        html_.push('</td>');
        if (A[i][47] < 0) {
          html_.push('            <td class="fu' + tmp_flag + '" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][44] + '↑');
        } else if (A[i][47] > 0) {
          html_.push('            <td class="ping' + tmp_flag + '" onclick="show_bet_change(' + A[i][0] + ', event);">' + A[i][44] + '↓');
        } else {
          html_.push('            <td>' + A[i][44]);
        }
        html_.push('</td>');
      }

      html_.push('            <td class="td1"><span class="ou"><a href="http://info.sporttery.cn/football/info/fb_match_hhad.php?m=' + A[i][0] + '" target="_blank">欧</a></span>|<span class="ya"><a href="http://info.sporttery.cn/football/info/fb_match_asia.php?m=' + A[i][0] + '" target="_blank">亚</a></span>|<span class="xi"><a href="http://info.sporttery.cn/football/info/fb_match_info.php?m=' + A[i][0] + '" target="_blank">析</a></span>|<span class="xun"><a href="http://info.sporttery.cn/football/info/fb_match_news.php?m=' + A[i][0] + '" target="_blank">讯</a></span>|<span class="tong"><a href="http://info.sporttery.cn/football/search_odds.php?mid=' + A[i][0] + '" target="_blank">同</a></span>|<span class="ou"><a href="http://info.sporttery.cn/football/pool_result.php?id=' + A[i][0] + '" target="_blank">奖</a></span></td>');
//      if(concernId.indexOf(A[i][0])==-1)
//        html_.push('            <td><a href="javascript:addConcern( title="添加置顶"><img src="http://info.sporttery.cn/livescoreimage/expand.gif"></a></td>');
//      else
//        html_.push('            <td><a href="javascript:deleteConcern('+i+',10);" title="取消置顶"><img src="http://info.sporttery.cn/livescore/image/collapse.gif"/></a></td>');
      html_.push('          </tr>');
    } catch(e) {
    }
  }
  html_.push("</table>");
  $(".TableBox").html(html_.join("\r\n"));
  //if(hh>0) document.getElementById("hiddencount").innerHTML=hh;   

//联赛/杯赛名列表
  var st;
  var leaguehtml_=new Array();
  leaguehtml_.push('      <div class="SSDivTit">');
  leaguehtml_.push('        <div class="SSDivTitT">赛事选择</div>');
  leaguehtml_.push('        <div class="SSDivClose" onclick="HideSelectLeague();"><img src="http://info.sporttery.cn/livescore/images/close.gif"></div>');
  leaguehtml_.push('      </div>');
  leaguehtml_.push('    <div style="height: 300px; overflow-y: scroll">');
  for(var i=1;i<=sclasscount;i++) {
    if(B[i][6]==0) continue;

    leaguehtml_.push('      <div class="SSDivB" id="league_' + i + '">');
    leaguehtml_.push('        <table class="SSDivBlock">');
    leaguehtml_.push('          <tr>');
    if(B[i][7]>0) {
      leaguehtml_.push('            <td width="21px"><input onclick="CheckLeague(this)" type="checkbox" id="myleague_' + i + '" value="' + i + '" checked="checked" /></td><td align="left"><label style="cursor:pointer" for="myleague_' + i + '">');
    } else {
      leaguehtml_.push('            <td width="21px"><input onclick="CheckLeague(this)" type="checkbox" id="myleague_' + i + '" value="' + i + '"></td><td align="left"><label style="cursor:pointer" for="myleague_' + i + '">');
    }
    if(B[i][5]=="1")
      leaguehtml_.push('<font color=red>' + B[i][Config.language] + '[' + B[i][6] + ']</font></label></li>');
    else
      leaguehtml_.push(B[i][Config.language] + '[' + B[i][6] + ']');
    leaguehtml_.push('</td>');
    leaguehtml_.push('          </tr>');
    leaguehtml_.push('        </table>');
    leaguehtml_.push('      </div>');
  }
  leaguehtml_.push('    </div>');
  leaguehtml_.push('      <div class="line"></div>');
  leaguehtml_.push('      <div class="Bu" onclick="SelectImportant();" style="margin-left:75px">一级比赛</div>');
  leaguehtml_.push('      <div class="Bu" onclick="SelectReverse()">反选</div>');
  leaguehtml_.push('      <div class="Bu" onclick="SelectAll(true);">全选</div>');
  leaguehtml_.push('      <div class="Bu" onclick="SelectAll(false);">全不选</div>');
  leaguehtml_.push('      <div class="Bu" onclick="SelectOK();">确定</div>');
  leaguehtml_.push('      <div class="line"></div>');
  $('#SSDiv').html(leaguehtml_.join(""));

  //盘口列表
  /*
  leaguehtml=new Array();
  leaguehtml_.push("<ul style='clear:both;'>");
  for(var i=0;i<pk.length;i++)
  {
    if(pk[i]==0) continue;
    leaguehtml_.push("<li style='background-color:#ffffff'><input onclick='CheckLeague(this)' type=checkbox id='pk_" + i + "' value="+ i+"><label style='cursor:pointer;color:blue' for='pk_" + i + "'>");
    leaguehtml_.push(Goal2GoalCn(i) + "["+pk[i]+"]</label></li>");
  }
  leaguehtml_.push("</ul>");
  document.getElementById("myleague").innerHTML+=leaguehtml.join("");*/

  
  //国家列表
  /*
  var country=new Array();
  for(var i=0;i<C.length;i++)
  {
    if(C[i][2]>0) country.push("<li><a href='javascript:CheckCountry(" + C[i][0] + ")' id='country_" + C[i][0] + "'>" + C[i][1] +"</a></li>");
  }
  document.getElementById("countryList").innerHTML=country.join("");
  */
}

function refresh() {
  try{
    if(oXmlHttp.readyState !=4 || (oXmlHttp.status!=200 && oXmlHttp.status!=0)) return;

    if (oXmlHttp.responseXML == null) {
      return;
    }

    var root=oXmlHttp.responseXML.documentElement;
    if(root.attributes[0].value != "0") {
      setTimeout("LoadLiveFile()",Math.floor(10000 * Math.random()));
      return;
    }
    
    var D=new Array();
    var matchindex,score1change, score2change, scorechange;
    var goTime,hometeam,guestteam,sclassname,score1,score2,tr;  
    var matchNum=0;
    var winStr_ = [];
    var cardStr = [];
    var goalStr = [];
    //var notify="";
    
    for(var i = 0;i<root.childNodes.length;i++) {   
      if(document.all)
        D=root.childNodes[i].text.split("^"); //0:ID,1:state,2:score1,3:score2,4:half1,5:half2,6:card1,7:card2,8:time1,9:time2,10:explain,11:lineup    
      else
        D=root.childNodes[i].textContent.split("^");
       
      tr=document.getElementById("tr1_" + D[0]);
      if(tr==null)  continue;
      
      matchindex=tr.attributes["index"].value;
      score1change=false;
      score2change=false;
      if(A[matchindex][52] == 1) {
        if(A[matchindex][15] != D[3]) {
          A[matchindex][15] = D[3];
          score1change = true;
          tr.cells[5].style.backgroundColor="#bbbb22";
        }
		
		if(A[matchindex][14]!=D[2]) {
          A[matchindex][14]=D[2];
          score2change=true;
          tr.cells[7].style.backgroundColor="#bbbb22";
        }
      } else {
        if(A[matchindex][14] != D[2]) {
          A[matchindex][14] = D[2];
          score1change = true;
          tr.cells[5].style.backgroundColor="#bbbb22";
        }
		
		if(A[matchindex][15]!=D[3]) {
          A[matchindex][15]=D[3];
          score2change=true;
          tr.cells[7].style.backgroundColor="#bbbb22";
        }
      }
      
      scorechange = score1change || score2change;
      /*
      //附加说明改时变了'
      if(A[matchindex][30]!= D[10])
      {
        A[matchindex][30]= D[10];
        document.getElementById("other_" + D[0]).innerHTML=D[10];
        if(D[10]=="")
          document.getElementById("tr2_" + D[0]).style.display="none";
        else
          document.getElementById("tr2_" + D[0]).style.display="";      
      }
      */

      //redcardChange
      if(Config.redcardWin == 1 && (D[6] != A[matchindex][18] || D[7]!=A[matchindex][19]) && tr.style.display != "none") {
        hometeam = A[matchindex][5+Config.language].replace("<font color=#880000>(中)</font>"," 中").substring(0,7);
        guestteam = A[matchindex][8+Config.language].substring(0,7);
        sclassname = A[matchindex][2+Config.language];
        if (A[matchindex][52] == 1) {
          if(D[6]!=A[matchindex][18]){        
            guestteam="<font color=red>" + guestteam +"</font>";
            cardStr.push('客:红牌');
          }
          if(D[7]!=A[matchindex][19]){
            hometeam="<font color=red>" + hometeam + "</font>";
            cardStr.push('主:红牌');
          }
        } else {
          if(D[6]!=A[matchindex][18]){        
            hometeam="<font color=red>" + hometeam +"</font>";
            cardStr.push('主:红牌');
          }
          if(D[7]!=A[matchindex][19]){
            guestteam="<font color=red>" + guestteam + "</font>";
            cardStr.push('客:红牌');
          }
        }
        
        winStr_.push('<tr>');
        if (A[matchindex][52] == 1) {
          winStr_.push('<td class="bifen col1">' + D[7] + '</td>');
        } else {
          winStr_.push('<td class="bifen col1">' + D[6] + '</td>');
        }
        winStr_.push('<td style="border-right:none">' + hometeam + '</td>');
        winStr_.push('<td width="76px" style="border-left:none; color:red; font-weight:bold;" rowspan="2">' + cardStr.join('<br/>') + '</td>');
        winStr_.push('</tr>');
        winStr_.push('<tr>');
        if (A[matchindex][52] == 1) {
          winStr_.push('<td class="bifen col1">' + D[6] + '</td>');
        } else {
          winStr_.push('<td class="bifen col2">' + D[7] + '</td>');
        }
        winStr_.push('<td style="border-right:none">' + guestteam + '</td>');
        winStr_.push('</tr>');

        matchNum += 1;
      }

      //红牌变化了
      if (A[matchindex][52] == 1) {
        if(D[6]!=A[matchindex][18]) {
          A[matchindex][18]=D[6];
          if(D[6]=="0")
            document.getElementById("team2_" + D[0]).innerHTML= A[matchindex][8+Config.language];
          else
            document.getElementById("team2_" + D[0]).innerHTML= '<span class="yellowcardbg">' + D[6] + '</span>' + A[matchindex][8+Config.language];
          if(Config.redcard){
            tr.cells[7].style.backgroundColor="#ff8888";  
            window.setTimeout("timecolors(" + D[0] +","+ matchindex + ")",12000);
          }
        }
      } else {
        if(D[6]!=A[matchindex][18]) {
          A[matchindex][18]=D[6];
          if(D[6]=="0")
            document.getElementById("team1_" + D[0]).innerHTML= A[matchindex][5+Config.language];
          else
            document.getElementById("team1_" + D[0]).innerHTML= A[matchindex][5+Config.language] + '<span class="yellowcardbg">' + D[6] + '</span>';
          if(Config.redcard){
            tr.cells[5].style.backgroundColor="#ff8888";  
            window.setTimeout("timecolors(" + D[0] +","+ matchindex + ")",12000);
          }
        }
      }

      if (A[matchindex][52] == 1) {
        if(D[7]!=A[matchindex][19]) {
          A[matchindex][19]=D[7];
          if(D[7]=="0")
            document.getElementById("team1_" + D[0]).innerHTML = A[matchindex][5+Config.language];
          else
            document.getElementById("team1_" + D[0]).innerHTML = A[matchindex][5+Config.language] + '<span class="yellowcardbg">' + D[7] + '</span>';
            
          if(Config.redcard){
            tr.cells[5].style.backgroundColor="#ff8888";  
            window.setTimeout("timecolors(" + D[0] +","+ matchindex + ")",12000);
          }
        }
      } else {
        if(D[7]!=A[matchindex][19]) {
          A[matchindex][19]=D[7];
          if(D[7]=="0")
            document.getElementById("team2_" + D[0]).innerHTML = A[matchindex][8+Config.language];
          else
            document.getElementById("team2_" + D[0]).innerHTML = '<span class="yellowcardbg">' + D[7] + '</span>' + A[matchindex][8+Config.language];
            
          if(Config.redcard){
            tr.cells[7].style.backgroundColor="#ff8888";  
            window.setTimeout("timecolors(" + D[0] +","+ matchindex + ")",12000);
          }
        }
      }


      //开赛
      if(A[matchindex][11]!=D[8]) {
        var oldPos=matchindex;
        var TTime=new Date();
        tr.cells[3].innerHTML = D[8];
        var nt=D[8].split(":");
        var nd=D[14].split("-");
        var nt2 = new Date(TTime.getYear(),nd[0],nd[1],nt[0],nt[1],0);
        if (concernId.indexOf("_" + A[matchindex][0] + "_") == -1) { 
          for(var i=1; i<=matchcount;i++) {
            if (concernId.indexOf("_" + A[i][0] + "_") == -1) { 
              var ot = A[i][11].split(":");
              var od = A[i][36].split("-");
              var ot2 = new Date(TTime.getYear(),od[0],od[1],ot[0],ot[1],0);
              if(D[1]!=-1) {      
                if(ot2>nt2) {    
                  MovePlace(A[i][0],D[0]);
                  break;
                }
              }
            }
          }
        } else {
          for(var i=1; i<=matchcount;i++) {
            if (concernId.indexOf("_" + A[i][0] + "_") != -1) { 
              var ot = A[i][11].split(":");
              var od = A[i][36].split("-");
              var ot2 = new Date(TTime.getYear(),od[0],od[1],ot[0],ot[1],0);
              if(D[1]!=-1) {      
                if(ot2>nt2) {
                  MovePlace(A[i][0],D[0]);
                  break;
                }
              }
            }
          }  
        }
      }
      A[matchindex][11]=D[8];
      A[matchindex][12]=D[9];
      //半场比分
      A[matchindex][16]=D[4];
      A[matchindex][17]=D[5];

      //状态
      if(A[matchindex][13]!= D[1]) {
        if(A[matchindex][13]=="-11" || A[matchindex][13]=="-14"|| A[matchindex][13]=="-13") { 
          if(D[1]=="1") {
            var oldPos=matchindex;
            var TTime=new Date();
            var nt=D[8].split(":");
            var nd=D[14].split("-");
            var nt2 = new Date(TTime.getYear(),nd[0],nd[1],nt[0],nt[1],0);
            if (concernId.indexOf("_" + A[matchindex][0] + "_") == -1) { 
              for(var i=1; i<=matchcount;i++) {
                if (concernId.indexOf("_" + A[i][0] + "_") == -1) { 
                  var ot = A[i][11].split(":");
                  var od = A[i][36].split("-");
                  var ot2 = new Date(TTime.getYear(),od[0],od[1],ot[0],ot[1],0);
                  if(D[1]!=-1) {
                    if(ot2>nt2) {
                      MovePlace(A[i][0],D[0]);
                      break;
                    }
                  }
                }
              }  
            } else {
              for(var i=1; i<=matchcount;i++) {
                if (concernId.indexOf("_" + A[i][0] + "_") != -1) { 
                  var ot = A[i][11].split(":");
                  var od = A[i][36].split("-");
                  var ot2 = new Date(TTime.getYear(),od[0],od[1],ot[0],ot[1],0);
                  if(D[1]!=-1) {
                    if(ot2>nt2) {
                      MovePlace(A[i][0],D[0]);
                      break;
                    }
                  }
                }
              }
            }
          }
        }
        A[matchindex][13]=D[1];
        switch(A[matchindex][13]) {
          case "0":
            tr.cells[4].innerHTML="";
            break;
          case "1":
            var t = A[matchindex][12].split(",");
            var t2 = new Date(t[0],t[1],t[2],t[3],t[4],t[5]);
            goTime = Math.floor((new Date()-t2-difftime)/60000);
            if(goTime>45) goTime = "45+"
            if(goTime<1) goTime = "1";
            tr.cells[4].innerHTML = goTime + "<img src='http://info.sporttery.cn/livescore/images/in.gif'>";
            break;
          case "2":
          case "4":
            tr.cells[4].innerHTML=state_ch[parseInt(D[1])+14].split(",")[Config.language];
            break;
          case "3":
            var t = A[matchindex][12].split(",");
            var t2 = new Date(t[0],t[1],t[2],t[3],t[4],t[5]);
            goTime = Math.floor((new Date()-t2-difftime)/60000)+46;
            if(goTime>90) goTime = "90+";
            if(goTime<46) goTime = "46";
            tr.cells[4].innerHTML = goTime + "<img src='http://info.sporttery.cn/livescore/images/in.gif'>";
            break;
          case "-1":
            tr.cells[4].innerHTML=state_ch[parseInt(D[1])+14].split(",")[Config.language];
            tr.cells[6].style.color = "red";
            window.setTimeout("MoveToBottom(" + D[0] + ")",25000);
            break;
          default:
            tr.cells[4].innerHTML=state_ch[parseInt(D[1])+14].split(",")[Config.language];
            MoveToBottom(D[0]);
            break;      
        }
      }
    
      //score
      switch(A[matchindex][13]) {
        case "0":
          if(D[11]=="1")
            //tr.cells[6].innerHTML="阵容"; 
            tr.cells[6].innerHTML="-";
          else
            tr.cells[6].innerHTML="-";
          break;
        case "1":
          if (A[matchindex][52] == 1) {
            tr.cells[6].innerHTML=A[matchindex][15] + "-" + A[matchindex][14];
          } else {
            tr.cells[6].innerHTML=A[matchindex][14] + "-" + A[matchindex][15];
          }
          break;
        case "-11":
        case "-14":
          tr.cells[6].innerHTML="-";
          tr.cells[8].innerHTML="-";
          break;
        default:  //2 3 -1 -12 -13
          if (A[matchindex][52] == 1) {
            tr.cells[6].innerHTML=A[matchindex][15] + "-" + A[matchindex][14];
            tr.cells[8].innerHTML=A[matchindex][17] + "-" + A[matchindex][16];
          } else {
            tr.cells[6].innerHTML=A[matchindex][14] + "-" + A[matchindex][15];
            tr.cells[8].innerHTML=A[matchindex][16] + "-" + A[matchindex][17];
          }
          tr.cells[8].style.color="red";
          break;
      }
      
      if(scorechange) {
        if(tr.style.display!="none") {
          if(A[matchindex][52] == 1) {
            hometeam=A[matchindex][8+Config.language].replace("<font color=#880000>(中)</font>"," 中").substring(0,7);
            guestteam=A[matchindex][5+Config.language].substring(0,7);
          } else {
            hometeam=A[matchindex][5+Config.language].replace("<font color=#880000>(中)</font>"," 中").substring(0,7);
            guestteam=A[matchindex][8+Config.language].substring(0,7);
          }
          sclassname=A[matchindex][2+Config.language];
          if(score1change) {
            hometeam="<font color=red>" + hometeam +"</font>";
            score1="<font color=red>" + D[2] +"</font>";
            score2="<font color=blue>" + D[3] +"</font>";
            goalStr.push('主:进球');
          }
          if(score2change){
            guestteam="<font color=red>" + guestteam + "</font>";
            score1="<font color=blue>" + D[2]+"</font>";
            score2="<font color=red>" + D[3] +"</font>";
            goalStr.push('客:进球');
          }
          
          if(Config.winLocation > 0 && parseInt(D[1])>=-1){
            winStr_.push('<tr>');
            winStr_.push('<td class="font:bold 18px; color:#000000;border:2px #E4A6A6 solid;text-align:center">' + score1 + '</td>');
            winStr_.push('<td style="border:2px #E4A6A6 solid;text-align:center">' + hometeam + '</td>');
            winStr_.push('<td width="76px" style="border-left:none; color:red; font-weight:bold;" rowspan="2">' + goalStr.join('<br/>') + '</td>');
            winStr_.push('</tr>');
            winStr_.push('<tr>');
            winStr_.push('<td style="font:bold 18px; color:#000000;border:2px #E4A6A6 solid;text-align:center">' + score2 + '</td>');
            winStr_.push('<td style="border:2px #E4A6A6 solid;text-align:center">' + guestteam + '</td>');
            winStr_.push('</tr>');
            matchNum=matchNum+1
          }
          
          Config.ShowFlash(D[0],matchindex);

          //notify+= sclassname +":"+ hometeam + " <font color=blue>" + score1 +"-" + score2 + "</font> " +guestteam +" &nbsp; ";
        }
      }//scorechange
    }

    if(matchNum > 0 && Config.winLocation > 0) {
      ShowCHWindow(winStr_, matchNum);
    }
    /*
    if(notify!=""){
      document.getElementById("notify").innerHTML+=notify;
      notifyTimer=window.setTimeout("clearNotify('"+notify+"')",20000);
    }
    */
  } catch(e) {
  }
}

function MoveToBottom(m){
  try{
    document.getElementById("tr1_" +  m).parentElement.insertAdjacentElement("BeforeEnd",document.getElementById("tr1_" +  m));
  } catch(e) {
  }
}

function MovePlace(newPos, oldPos) {
  try {
    if (newPos == 0) {
      document.getElementById("tr_" + newPos).insertAdjacentElement("BeforeBegin", document.getElementById("tr1_" + oldPos));
      document.getElementById("tr_" + newPos).insertAdjacentElement("BeforeBegin", document.getElementById("tr2_" + oldPos));
    } else {
      document.getElementById("tr1_" + newPos).insertAdjacentElement("BeforeBegin", document.getElementById("tr1_" + oldPos));
      document.getElementById("tr1_" + newPos).insertAdjacentElement("BeforeBegin", document.getElementById("tr2_" + oldPos));
    }
  } catch (e) {
  }
}

//显示弹出窗口
function ShowCHWindow(str, matchnum) {
  $('#GoalDiv').html('<table class="GoalDivTab">' + str.join('') + '</table>');
  var winLoc = Config.winLocation;
  x = $(window).width() - $('#GoalDiv').width();
  x = (x > 0) ? x : 0;
  y = $(window).height() - $('#GoalDiv').height();
  y = (y > 0) ? y : 0;  
  switch(winLoc) {
    case 1:
      x = $(document).scrollLeft() + x / 2;
      y = $(document).scrollTop() +  y / 2;
      $('#GoalDiv').css('left', x+'px');
      $('#GoalDiv').css('top', y+'px');
      break;
    case 2:
      x = $(document).scrollLeft() + x / 2;
      y = 5 ;
      $('#GoalDiv').css('left', x+'px');
      $('#GoalDiv').css('top', y+'px');
      break;
    case 3:
      x = $(document).scrollLeft() + x / 2;
      y = 5;
      $('#GoalDiv').css('left', x+'px');
      $('#GoalDiv').css('bottom', y+'px');
      break;
    case 4:
      x = 5;
      y = $(document).scrollTop() +  y / 2;;
      $('#GoalDiv').css('left', x+'px');
      $('#GoalDiv').css('top', y+'px');
      break;
    case 5:
      x = 5;
      y = $(document).scrollTop() +  y / 2;;
      $('#GoalDiv').css('right', x+'px');
      $('#GoalDiv').css('top', y+'px');
      break;
    case 6:
      x = 5;
      y = 5;
      $('#GoalDiv').css('left', x+'px');
      $('#GoalDiv').css('top', y+'px');
      break;
    case 7:
      x = 5;
      y = 5;
      $('#GoalDiv').css('right', x+'px');
      $('#GoalDiv').css('top', y+'px');
      break;
    case 8:
      x = 5;
      y = 5;
      $('#GoalDiv').css('left', x+'px');
      $('#GoalDiv').css('bottom', y+'px');
      break;
    case 9:
      x = 5;
      y = 5;
      $('#GoalDiv').css('right', x+'px');
      $('#GoalDiv').css('bottom', y+'px');
      break;
  }
  if (oPopup) {
    oPopupBody = oPopup.document.body;
    oPopupBody.innerHTML = '<table style="width:236px;border:1px #E4A6A6 solid;background:#FFEDED;border-collapse:collapse;">' + str.join('') + '</table>';
    oPopupBody.style.cursor="pointer";
    oPopupBody.title = "点击关闭";
    oPopupBody.onclick = dismisspopup;
    oPopupBody.oncontextmenu = dismisspopup;
    pop_TC=20;
    pop(x, y, 250, 70);
  } else {
    $('#GoalDiv').show();
    setTimeout('HideCHWindow()', 5000);
  }
}

function HideCHWindow() {
  $('#GoalDiv').hide();
}

//更新比赛进行的时间
function setMatchTime(){    
  for(var i=1;i<=matchcount;i++){
    try {
      if(A[i][0]==0) continue;
      if(A[i][13]=="1"){  //上半场           
        var t = A[i][12].split(",");
        var t2 = new Date(t[0],t[1],t[2],t[3],t[4],t[5]);
        goTime = Math.floor((new Date()-t2-difftime)/60000);
        if(goTime>45) goTime = "45+";
        if(goTime<1)  goTime = "1";
        $('#time_' +  A[i][0]).html(goTime +  '<img src="http://info.sporttery.cn/livescore/images/in.gif" border=0/>');
      }
      if(A[i][13]=="3"){  //下半场       
        var t = A[i][12].split(",");
        var t2 = new Date(t[0],t[1],t[2],t[3],t[4],t[5]);
        goTime = Math.floor((new Date()-t2-difftime)/60000)+46;
        if(goTime>90) goTime = "90+";
        if(goTime<46) goTime = "46";
        $('#time_' +  A[i][0]).html(goTime +  '<img src="http://info.sporttery.cn/livescore/images/in.gif" border=0/>');
      }
    } catch(e) {
    }
  }
  runtimeTimer=window.setTimeout("setMatchTime()",30000);
}

function hiddendetail() {
  document.getElementById("winScore").innerHTML="";
  document.getElementById("winScore").style.display="none";
}

function check(){
  if (oldUpdateTime == lastUpdateTime && oldUpdateTime !=""){
    if (confirm("由于程序忙，或其他网络问题，你已经和服务器断开连接超过 5 分钟，是否要重新连接观看比分？")) window.location.reload();
  }
  oldUpdateTime = lastUpdateTime;
  window.setTimeout("check()" , 300000);
}

function SetLevel(m) {
  matchType=m;
  LoadLiveFile();
  document.getElementById("liZC").style.color="blue"; 
}

function LoadLiveFile() {
  var allDate=document.getElementById("allDate");
  var  s=document.createElement("script");   
  s.type="text/javascript";   
  //s.src="http://info.sporttery.cn/livescore/iframe/realtime2.php?type=fbdata&r=" + Date.parse(new Date());
  s.src="/data/lottery/guess/foot/test1.jsp?type=fbdata&r=" + Date.parse(new Date());
  s.charset="utf-8";
  allDate.removeChild(allDate.firstChild);
  allDate.appendChild(s,"script");      
  window.setTimeout("LoadLiveFile()",1800*1000);
}

function LoadDetailFile() {
  var detail=document.getElementById("span_detail");
  var  s=document.createElement("script");   
  s.type="text/javascript";   
  //s.src="http://info.sporttery.cn/livescore/iframe/realtime2.php?type=detail&r=" + Date.parse(new Date());
  s.src="/data/lottery/guess/foot/test2.jsp?type=detail&r=" + Date.parse(new Date());
  s.charset="utf-8";
  detail.removeChild(detail.firstChild);
  detail.appendChild(s,"script");
  loadDetailFileTime = new Date();
}

function SetLanguage(l) {
  document.getElementById("Language"+ Config.language).className="";
  document.getElementById("Language"+ l).className="selected";
  Config.language=0;
  LoadLiveFile();
  Config.writeCookie();
}

var zXml = {
    useActiveX: (typeof ActiveXObject != "undefined"),
    useXmlHttp: (typeof XMLHttpRequest != "undefined")
};

zXml.ARR_XMLHTTP_VERS = ["MSXML2.XmlHttp.6.0","MSXML2.XmlHttp.3.0"];

function zXmlHttp() {}

zXmlHttp.createRequest = function () {
  if (zXml.useXmlHttp)  return new XMLHttpRequest(); 

  if(zXml.useActiveX) { //IE < 7.0 = use ActiveX
    if (!zXml.XMLHTTP_VER) {
      for (var i=0; i < zXml.ARR_XMLHTTP_VERS.length; i++) {
        try {
          new ActiveXObject(zXml.ARR_XMLHTTP_VERS[i]);
          zXml.XMLHTTP_VER = zXml.ARR_XMLHTTP_VERS[i];
          break;
        } catch (oError) {}
      }
    }        
    if (zXml.XMLHTTP_VER) return new ActiveXObject(zXml.XMLHTTP_VER);
  } 
  alert("对不起，您的电脑不支持 XML 插件，请安装好或升级浏览器。");
};

var oXmlHttp = zXmlHttp.createRequest();
var nXmlHttp = zXmlHttp.createRequest();

function gettime() {
  try  {
    LoadTime = (LoadTime+1)  % 60;
    if(LoadTime == 0) {
      getxml("2");
    } else {
      nXmlHttp.open("get","./iframe/realtime2.php?type=time&r=" + Date.parse(new Date()),true);
      nXmlHttp.onreadystatechange = function() {
        if (nXmlHttp.readyState == 4 && nXmlHttp.status == 200) {
          lastUpdateTime=new Date();
          if(nXmlHttp.responseText!="" && parseInt(nXmlHttp.responseText, 10)!= parseInt(lastUpdateFileTime, 10)) {
            lastUpdateFileTime = nXmlHttp.responseText;
            getxml('');            
          }
        }
      };
      nXmlHttp.send(null);    
    }
  }
  catch(e){}
  setTimeout("gettime()", 10000);
}

function getxml(ii) {
  oXmlHttp.open('get','./iframe/realtime2.php?type=change' + ii + '&r=' + Date.parse(new Date()),true);
  oXmlHttp.onreadystatechange = refresh;
  oXmlHttp.send(null);
}

function show_detail(n,e) {
  if(Config.detail==0) return;
  try{
    if(Math.floor((new Date()-loadDetailFileTime)/600)>60) LoadDetailFile();
    var html = new Array();
    var R=new Array();
    var bodyTop = 0;
    if (document.compatMode == "BackCompat") { 
      //cWidth = document.body.clientWidth; 
      //cHeight = document.body.clientHeight; 
      //sWidth = document.body.scrollWidth; 
      //sHeight = document.body.scrollHeight; 
      //sLeft = document.body.scrollLeft; 
      bodyTop = document.body.scrollTop; 
    } else {
      //cWidth = document.documentElement.clientWidth; 
      //cHeight = document.documentElement.clientHeight; 
      //sWidth = document.documentElement.scrollWidth; 
      //sHeight = document.documentElement.scrollHeight; 
      //sLeft = document.documentElement.scrollLeft == 0 ? document.body.scrollLeft : document.documentElement.scrollLeft; 
      bodyTop = document.documentElement.scrollTop == 0 ? document.body.scrollTop : document.documentElement.scrollTop; 
    }

    //html.push('<div class="SSDivTit"><b>初盘参考：' +Goal2GoalCn(A[n][29]) +'</b></div>');
    html.push('<div class="SSDivTit"><b>详情</b></div>');
    html.push('<div id="winScore">');
    html.push("<table width=100% bgcolor=#F0F0F0 cellpadding=0 cellspacing=1 border=0 style='border:solid 1px #666;'>");
    html.push("<tr bgcolor=#F0F0F0 align=center><td height=20 colspan=2 width=44%><font color=#006600><b>" + A[n][5+Config.language]+ "</b></font></td><td width=12% bgcolor=#F0F0F0>时间</td><td colspan=2 width=44%><font color=#006600><b>" + A[n][8+Config.language]+"</b></font></td></tr>");
    var TR;
    for(var i=0; i<rq.length;i++){ 
      R=rq[i].split('^');
      if(R[0]!=A[n][0]) continue;
      if(R.length == 2) {
      	T=R[1].split(';');
      	var TT;
      	for(var j=0; j<T.length; j++) {
      	  TT = T[j].split(',');
      	  if (status_ch[TT[0]] != undefined) {
      	    html.push("<tr bgcolor=white align=center><td height=18>" + (A[n][52] == 1?TT[2]:TT[1]) + "</td><td colspan=3>" + status_ch[TT[0]]+ "</td><td>" + (A[n][52] == 1?TT[1]:TT[2])+ "</td></tr>");
      	  }
      	}
      } else {
        if(R[1]=="1")
          html.push("<tr bgcolor=white align=center><td width=38%>" + R[6]+ "</td><td width=6% height=18><img src='http://info.sporttery.cn/livescore/images/" + R[2]+ ".gif'></td><td width=12% bgcolor=#EFF4EA>" + R[3]+ "'</td><td width=6%></td><td width=38%></td></tr>");
        else
          html.push("<tr bgcolor=white align=center><td width=38%></td><td width=6% height=18></td><td width=12% bgcolor=#EFF4EA>" + R[3]+ "'</td><td width=6%><img src='http://info.sporttery.cn/livescore/images/" + R[2]+ ".gif'></td><td width=38%>" + R[6]+ "</td></tr>");
      }
    }
    html.push("</table>");
    html.push('</div>');
    $('#MatchDataDiv2').html(html.join(''));
    $('#MatchDataDiv2').css('top', (bodyTop + e.clientY+15)+'px');
    $('#MatchDataDiv2').css('left', (document.body.clientWidth/2-188)+'px');
    $('#MatchDataDiv2').show();
  } catch(e) {
  }
}

function hide_detail() {
  $('#MatchDataDiv2').hide();
}