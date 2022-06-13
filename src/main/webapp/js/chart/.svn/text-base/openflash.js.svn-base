if (typeof deconcept == "undefined") {
	var deconcept = new Object();
}
if (typeof deconcept.util == "undefined") {
	deconcept.util = new Object();
}
if (typeof deconcept.SWFObjectUtil == "undefined") {
	deconcept.SWFObjectUtil = new Object();
}
//var rootPath;
deconcept.SWFObject = function(_1, id, w, h, _5, c, _7, _8, _9, _a) {
	if (!document.getElementById) {
		return;
	}
	this.DETECT_KEY = _a ? _a : "detectflash";
	this.skipDetect = deconcept.util.getRequestParameter(this.DETECT_KEY);
	this.params = new Object();
	this.variables = new Object();
	this.attributes = new Array();
	if (_1) {
		this.setAttribute("swf", _1);
	}
	if (id) {
		this.setAttribute("id", id);
	}
	if (w) {
		this.setAttribute("width", w);
	}
	if (h) {
		this.setAttribute("height", h);
	}
	if (_5) {
		this.setAttribute("version", new deconcept.PlayerVersion(_5.toString()
				.split(".")));
	}
	this.installedVer = deconcept.SWFObjectUtil.getPlayerVersion();
	if (!window.opera && document.all && this.installedVer.major > 7) {
		deconcept.SWFObject.doPrepUnload = true;
	}
	if (c) {
		this.addParam("bgcolor", c);
	}
	var q = _7 ? _7 : "high";
	this.addParam("quality", q);
	this.setAttribute("useExpressInstall", false);
	this.setAttribute("doExpressInstall", false);
	var _c = (_8) ? _8 : window.location;
	this.setAttribute("xiRedirectUrl", _c);
	this.setAttribute("redirectUrl", "");
	if (_9) {
		this.setAttribute("redirectUrl", _9);
	}
};
deconcept.SWFObject.prototype = {
	useExpressInstall : function(_d) {
		this.xiSWFPath = !_d ? "expressinstall.swf" : _d;
		this.setAttribute("useExpressInstall", true);
	},
	setAttribute : function(_e, _f) {
		this.attributes[_e] = _f;
	},
	getAttribute : function(_10) {
		return this.attributes[_10];
	},
	addParam : function(_11, _12) {
		this.params[_11] = _12;
	},
	getParams : function() {
		return this.params;
	},
	addVariable : function(_13, _14) {
		this.variables[_13] = _14;
	},
	getVariable : function(_15) {
		return this.variables[_15];
	},
	getVariables : function() {
		return this.variables;
	},
	getVariablePairs : function() {
		var _16 = new Array();
		var key;
		var _18 = this.getVariables();
		for (key in _18) {
			_16[_16.length] = key + "=" + _18[key];
		}
		return _16;
	},
	getSWFHTML : function() {
		var _19 = "";
		if (navigator.plugins && navigator.mimeTypes
				&& navigator.mimeTypes.length) {
			if (this.getAttribute("doExpressInstall")) {
				this.addVariable("MMplayerType", "PlugIn");
				this.setAttribute("swf", this.xiSWFPath);
			}
			_19 = "<embed type=\"application/x-shockwave-flash\" src=\""
					+ this.getAttribute("swf") + "\" width=\""
					+ this.getAttribute("width") + "\" height=\""
					+ this.getAttribute("height") + "\" style=\""
					+ this.getAttribute("style") + "\"";
			_19 += " id=\"" + this.getAttribute("id") + "\" name=\""
					+ this.getAttribute("id") + "\" ";
			var _1a = this.getParams();
			for ( var key in _1a) {
				_19 += [ key ] + "=\"" + _1a[key] + "\" ";
			}
			var _1c = this.getVariablePairs().join("&");
			if (_1c.length > 0) {
				_19 += "flashvars='" + _1c + "'";
			}
			_19 += "/>";
		} else {
			if (this.getAttribute("doExpressInstall")) {
				this.addVariable("MMplayerType", "ActiveX");
				this.setAttribute("swf", this.xiSWFPath);
			}
			_19 = "<object id=\""
					+ this.getAttribute("id")
					+ "\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\""
					+ this.getAttribute("width") + "\" height=\""
					+ this.getAttribute("height") + "\" style=\""
					+ this.getAttribute("style") + "\">";
			_19 += "<param name=\"movie\" value=\"" + this.getAttribute("swf")
					+ "\" />";
			var _1d = this.getParams();
			for ( var key in _1d) {
				_19 += "<param name=\"" + key + "\" value=\"" + _1d[key]
						+ "\" />";
			}
			var _1f = this.getVariablePairs().join("&");
			if (_1f.length > 0) {
				_19 += "<param name=\"flashvars\" value='" + _1f + "' />";
			}
			_19 += "</object>";
		}
		return _19;
	},
	write : function(_20) {
		if (this.getAttribute("useExpressInstall")) {
			var _21 = new deconcept.PlayerVersion( [ 6, 0, 65 ]);
			if (this.installedVer.versionIsValid(_21)
					&& !this.installedVer.versionIsValid(this
							.getAttribute("version"))) {
				this.setAttribute("doExpressInstall", true);
				this.addVariable("MMredirectURL", escape(this
						.getAttribute("xiRedirectUrl")));
				document.title = document.title.slice(0, 47)
						+ " - Flash Player Installation";
				this.addVariable("MMdoctitle", document.title);
			}
		}
		if (this.skipDetect
				|| this.getAttribute("doExpressInstall")
				|| this.installedVer.versionIsValid(this
						.getAttribute("version"))) {
			var n = (typeof _20 == "string") ? document.getElementById(_20)
					: _20;
			n.innerHTML = this.getSWFHTML();
			return true;
		} else {
			if (this.getAttribute("redirectUrl") != "") {
				document.location.replace(this.getAttribute("redirectUrl"));
			}
		}
		return false;
	}
};
deconcept.SWFObjectUtil.getPlayerVersion = function() {
	var _23 = new deconcept.PlayerVersion( [ 0, 0, 0 ]);
	if (navigator.plugins && navigator.mimeTypes.length) {
		var x = navigator.plugins["Shockwave Flash"];
		if (x && x.description) {
			_23 = new deconcept.PlayerVersion(x.description.replace(
					/([a-zA-Z]|\s)+/, "").replace(/(\s+r|\s+b[0-9]+)/, ".")
					.split("."));
		}
	} else {
		if (navigator.userAgent
				&& navigator.userAgent.indexOf("Windows CE") >= 0) {
			var axo = 1;
			var _26 = 3;
			while (axo) {
				try {
					_26++;
					axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash."
							+ _26);
					_23 = new deconcept.PlayerVersion( [ _26, 0, 0 ]);
				} catch (e) {
					axo = null;
				}
			}
		} else {
			try {
				var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
			} catch (e) {
				try {
					var axo = new ActiveXObject(
							"ShockwaveFlash.ShockwaveFlash.6");
					_23 = new deconcept.PlayerVersion( [ 6, 0, 21 ]);
					axo.AllowScriptAccess = "always";
				} catch (e) {
					if (_23.major == 6) {
						return _23;
					}
				}
				try {
					axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
				} catch (e) {
				}
			}
			if (axo != null) {
				_23 = new deconcept.PlayerVersion(axo.GetVariable("$version")
						.split(" ")[1].split(","));
			}
		}
	}
	return _23;
};
deconcept.PlayerVersion = function(_29) {
	this.major = _29[0] != null ? parseInt(_29[0]) : 0;
	this.minor = _29[1] != null ? parseInt(_29[1]) : 0;
	this.rev = _29[2] != null ? parseInt(_29[2]) : 0;
};
deconcept.PlayerVersion.prototype.versionIsValid = function(fv) {
	if (this.major < fv.major) {
		return false;
	}
	if (this.major > fv.major) {
		return true;
	}
	if (this.minor < fv.minor) {
		return false;
	}
	if (this.minor > fv.minor) {
		return true;
	}
	if (this.rev < fv.rev) {
		return false;
	}
	return true;
};
deconcept.util = {
	getRequestParameter : function(_2b) {
		var q = document.location.search || document.location.hash;
		if (_2b == null) {
			return q;
		}
		if (q) {
			var _2d = q.substring(1).split("&");
			for ( var i = 0; i < _2d.length; i++) {
				if (_2d[i].substring(0, _2d[i].indexOf("=")) == _2b) {
					return _2d[i].substring((_2d[i].indexOf("=") + 1));
				}
			}
		}
		return "";
	}
};
deconcept.SWFObjectUtil.cleanupSWFs = function() {
	var _2f = document.getElementsByTagName("OBJECT");
	for ( var i = _2f.length - 1; i >= 0; i--) {
		_2f[i].style.display = "none";
		for ( var x in _2f[i]) {
			if (typeof _2f[i][x] == "function") {
				_2f[i][x] = function() {
				};
			}
		}
	}
};
if (deconcept.SWFObject.doPrepUnload) {
	if (!deconcept.unloadSet) {
		deconcept.SWFObjectUtil.prepUnload = function() {
			__flash_unloadHandler = function() {
			};
			__flash_savedUnloadHandler = function() {
			};
			window.attachEvent("onunload", deconcept.SWFObjectUtil.cleanupSWFs);
		};
		window
				.attachEvent("onbeforeunload",
						deconcept.SWFObjectUtil.prepUnload);
		deconcept.unloadSet = true;
	}
}
if (!document.getElementById && document.all) {
	document.getElementById = function(id) {
		return document.all[id];
	};
}
var getQueryParamValue = deconcept.util.getRequestParameter;
var FlashObject = deconcept.SWFObject;
var SWFObject = deconcept.SWFObject;

function resize(width, height) {
	window.document.myChart.width = width;
	window.document.myChart.height = height;
	win = parent.document.getElementById('tbFrame');
	win.height = height+35;	
	SetParentHeight2(parent.parent.document.getElementById('mainFrame'));
	//var win = parent.parent.document.getElementById('mainFrame');
	//win.height = height+130;
	//SetContentHeight(document.getElementById('tbFrame'));
}

function closeFrame() {
	var divObj = document.getElementById('divNav');
	divObj.style.display = 'none';
	window.document.myChart.closeMB();
}
function OpenFlash(gameid,gametype,isTZ) {
	if(isTZ == null)
		isTZ = false
	var so = new SWFObject("/js/chart/~MyChart.swf?p=49", "myChart", "900", "600","9,0,124,0", "#FFFFFF");
	so.addParam("allowScriptAccess","always");
	so.addParam("wmode","opaque");
	so.addParam("menu","false");//gary
	so.addVariable("menu","false");//gary
	so.addVariable("gameId",gameid);
	so.addVariable("gameType",gametype);
	so.addVariable("navurl","");
	so.addVariable("isTZ",isTZ);
	
	//rootPath = "http://shop.sports.cn/";
	//alert(rootPath);
	so.addVariable("rootPath","/dataCenter/chart/");
	so.write("flashcontent");
	
	//document.title = gameNames[gameid] + gameDescs[gametype];
}


load_head = function(map_type) {
    //tb.ajax.callFile(rootPath + "jsp/tubiao/include/top.jsp?gameid=" + map_type + "&r=" + Math.random(), function(response) {
    //    if (response == false) return;
    //    $("topmenu").innerHTML = response;
    //});
    $("topmenu").innerHTML = generateHead(map_type);
    // 画十字线(支持IE)
    if(map_type != null) {
	    if (document.all) {
	        var line = "<img src=\"about:blank\" id=\"leftright\" style=\"width:expression(document.body.clientWidth);height:1px;position:absolute;left:0;top:0;background-color:#999;z-index:100;\" \/>\n";
	        line += "<img src=\"about:blank\" id=\"topdown\" style=\"height:expression(document.body.clientHeight);width:1px;position:absolute;left:0;top:0;background-color:#999;z-index:100;\" \/>\n";
	        document.writeln(line);
	    }
    }  
}

/*if (document.all) {
    //鼠标移动事件
    document.onmousemove = function() {
        if ($("leftright") && $("topdown")) {
            var mouseY = window.event.clientY;
            var mouseX = window.event.clientX;
            var scrollY = document.documentElement.scrollTop;
            var scrollX = document.documentElement.scrollLeft;
            if (mouseY + scrollY < 300) {
                $("leftright").style.display = "none";
                $("topdown").style.display = "none";
                return;
            } else {
                $("leftright").style.display = "";
                $("topdown").style.display = "";
            }
            $("leftright").style.top = mouseY + scrollY - 1;
            $("topdown").style.left = mouseX + scrollX - 1;
        }
    };
}*/

//var $ = function(id) { var obj = typeof id == "string" ? document.getElementById(id) : id; return obj; }

var tb = {};

tb.ajax = {
	    xmlHttp: function() {
	        if (tb.isIE) {
	            var a = ["Msxml2.XMLHTTP.5.0", "Msxml2.XMLHTTP.4.0", "Msxml2.XMLHTTP.3.0", "Msxml2.XMLHTTP", "Microsoft.XMLHTTP"];
	            for (var i = 0, l = a.length; i < l; i++) {
	                try {
	                    return new ActiveXObject(a[i]);
	                } catch (e) { };
	            }
	            return false;
	        } else {
	            return new XMLHttpRequest();
	        };
	    },

	    // 载入文件
	    callFile: function(url, callBack) {
	        var xmlhttp = this.xmlHttp();
	        var async = !!callBack;
	        xmlhttp.open("GET", url, async);
	        if (tb.isFF) xmlhttp.overrideMimeType("text/html");
	        if (async) {
	            xmlhttp.onreadystatechange = this.state(xmlhttp, callBack);
	            xmlhttp.send(null);
	        } else {
	            xmlhttp.send(null);
	            return this.result(xmlhttp);
	        }
	    },

	    // 状态改变
	    state: function(xmlhttp, callBack) {
	        return function() {
	            if (xmlhttp.readyState == 4) {
	                if (xmlhttp.status == 200) callBack(xmlhttp.responseText);
	                else callBack(false);
	            };
	        }
	    },

	    // 返回结果
	    result: function(xmlhttp) {
	        return (xmlhttp.status == 200) ? xmlhttp.responseText : false;
	    }
	}	