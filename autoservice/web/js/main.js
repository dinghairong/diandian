var user = undefined;
var intervalCounter = undefined;

var Ajaxs = {
	'GET_PROVINCE' : 1,
    'GET_CITY' : 2,
    'GET_COUNTY' : 3,
    'VALIDATE_CODE' : 4,
    'REGIST_STORE' : 5,
    'CHECK_MOBILE_NUMBER' : 6,
    'REGIST_ENTERPRISE'	: 7

};

var device = {
	"Android" : "andorid",
	"iOS" : "ios",
	"PC" : "pc"
};

var timer = undefined;
function delayed(func) {
	timer = setTimeout(func, 500);
}

// function initDevice() {
// 	var u = navigator.userAgent, app = navigator.appVersion;
// 	var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
// 	var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

// 	var d = undefined;

// 	if (isAndroid){
// 		d = device.Android;
// 	} else if(isiOS){
// 		d = device.iOS;
// 	} else {
// 		d = device.PC;
// 	}

// 	return d;
// }

function showDialog() {
	
	var dialogOver = document.getElementById("progress_dialog");

	if (dialogOver) {
		var dialog = document.createElement("div");
		dialog.setAttribute("class", "loader");
		dialogOver.appendChild(dialog);

		dialogOver.style.display = "block";
	}
}

function closeDialog() {
	delayed(function() {
		var dialogOver = document.getElementById("progress_dialog");

		if (dialogOver && dialogOver.style.display == 'block') {
			cleanChildren(dialogOver);
			dialogOver.style.display = "none";
		}

		if (timer) {
			window.clearTimeout(timer);
			timer = undefined;
		}
	});

}

function showConfirmDialog(msg, handler) {
	var $dialogOver = document.createElement("div");
	$dialogOver.id = "confirm_dialog";
	$dialogOver.style.display = "block";
	var $dialog = document.createElement("div");
	$dialog.setAttribute("class", "dialog");
	var $msg = document.createElement("span");
	var $text = document.createTextNode(msg);
	$msg.appendChild($text);
	var $button = document.createElement("div");
	$button.innerHTML = "关闭";
	$button.addEventListener("click", function() {
		cleanChildren($dialogOver);
		document.body.removeChild(document.body.lastChild);

		if (handler && typeof(handler) == "function") {
			handler();
		}
	});

	$dialog.appendChild($msg);
	$dialog.appendChild($button);
	$dialogOver.appendChild($dialog);

	if(document.body) {
		document.body.appendChild($dialogOver);
	}

}

function cleanChildren(ele) {
	if (ele) {
		while (ele.hasChildNodes()) {
	    	ele.removeChild(ele.lastChild);
		}
	}
}

function login(user_info) {
	if (window["localStorage"]) {
		window.localStorage.setItem("user_info", user_info);
	}
}

function logout() {
	if (window["localStorage"]) {
		window.localStorage.removeItem("user_info");
	}
}

function isLogin() {
	if (window["localStorage"]) {
		return window.localStorage.getItem("user_info");
	} else {
		return false;
	}
}

function toLogin() {
	if (!user) {
		showConfirmDialog("您尚未登录！", function() {
			window.location.href = urls.login;
		});

		return;
	}
}

function initUser() {
	var info = isLogin();

	if (info) {
		user = JSON.parse(info); 
	}
}

function updateUser() {
	if (user) {
		var user_json = JSON.stringify(user);

		if (window["localStorage"]) {
			window.localStorage.setItem("user_info", user_json);
		}
	}
}

function getUrlVars() {
	var vars = {};
	var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
		vars[key] = value;
	});

	return vars;
}

function getParameter(param) {
	if (param && typeof(param) == "string") {
		var vars = getUrlVars();
		return vars[param];
	}
}

function setPress(type) {
	var $ul = document.getElementsByClassName("footer_nav")[0];
	var li_arr = $ul.getElementsByTagName("li");

	for (var i = 0; i < li_arr.length; i++) {
		var id = li_arr[i].getAttribute("id");

		if (id == type) {
			var $li = li_arr[i];
			var $a = $li.getElementsByTagName("a")[0];
			var $span = $li.getElementsByTagName("span")[0];
			var $img = $li.getElementsByTagName("img")[0];

			if ($span && $img && $a) {
				$a.setAttribute("href", "javascript:void(0)");
				$span.style.color = "#F2496B";
				$img.src = nav_images[type];
			}
		}
	}
}

function formatDatetime(datetime) {
	var d = new Date(datetime);
    var dformat = [d.getFullYear(),
    			(d.getMonth()+1),
               d.getDate()].join('-') + ' ' +
              [d.getHours(),
               d.getMinutes(),
               d.getSeconds()].join(':');

    return dformat;
}

function getScrollTop() {
	var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;

	if (document.body) {
		bodyScrollTop = document.body.scrollTop;
	}

	if (document.documentElement) {
		documentScrollTop = document.documentElement.scrollTop;
	}

	scrollTop = (bodyScrollTop - documentScrollTop) > 0 ? bodyScrollTop : documentScrollTop;
	return scrollTop;
}

function getScrollHeight() {
	var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;

	if (document.body) {
		bodyScrollHeight = document.body.scrollHeight;
	}

	if (document.documentElement) {
		documentScrollHeight = document.documentElement.scrollHeight;
	}

	scrollHeight = (bodyScrollHeight - documentScrollHeight) > 0 ? bodyScrollHeight : documentScrollHeight;
	return scrollHeight;
}

function getWindowHeight() {
	var windowHeight = 0;

	if (document.compatMode == "CSS1Compat") {
		windowHeight = document.documentElement.clientHeight;
	} else {
		windowHeight = document.body.clientHeight;
	}

	return windowHeight;
}

function isScrollBottom() {
	var d = initDevice();
	// alert(getScrollTop() + "+" +  getWindowHeight() + "==" +  getScrollHeight());

	if (d == device.Android) {
		return (getWindowHeight() <= getScrollHeight()) &&
				(getScrollTop() + getWindowHeight()) >= (getScrollHeight());

	} else if (d == device.iOS) {
		return (getWindowHeight() < getScrollHeight()) &&
				(getScrollTop() + getWindowHeight()) >= (getScrollHeight() + 30);
	}
}

function validateEmpty(eles) {
	var result = undefined;

	if (eles) {
		for (var i = 0; i < eles.length; i++) {
			var $ele = eles[i];

			if ($ele) {
				if (!$ele.value) {
					$ele.focus();
					showToast("内容不能为空", 2000);
					return result;
				}
			} else {
				return result;
			}
		}

		result = "yes";
	}

	return result;
}

function validateMobileNumber(number) {
	return !!number.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
}

function validateString(str) {
	return str.match(/^[A-Za-z]*[^x00-xff]*[\dA-Za-z_]*$/);
}

function validateEmail(email) {
	return email.match(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/);
}

function validatePassword(password) {
	return password.match(/^[a-zA-Z]\w{5,19}$/);
}

function validateTel(tel) {
	return tel.match(/(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}/);
}

function validateURL (url) { 
	return url.match('https?://[-\w.]+(:\d+)?(/([\w/_.]*)?)?');
} 

function validatephone(num) {
	// return num.match(/^[1-9]{1}[0-9]{7,18}$/);
	return num.match(/^[0-9]{8,18}$/);
}

function log(msg) {
	console.log(msg);
}

function colseToast(){  
	var $toast = document.getElementById("toast");

	if ($toast) {
    	$toast.style.opacity = 0; 
	    clearInterval(intervalCounter); 
	    intervalCounter = undefined;
	    cleanChildren($toast);
	    document.body.removeChild($toast);
	}
}  
  
function showToast(message, delayed){  
    var $alert = document.getElementById("toast");  

    if (!$alert){ 
		var $toast = document.createElement("div");
		$toast.id = "toast";
		var $msg = document.createTextNode(message);
		$toast.appendChild($msg);

		if(document.body) {
			document.body.appendChild($toast);
		}

    	intervalCounter = setInterval("colseToast()", delayed || 1000);
        // var toastHTML = '<div id="toast">' + message + '</div>';  
        // document.body.insertAdjacentHTML('beforeEnd', toastHTML);  
    } else{  
        // alert.style.opacity = .9;  
    }  

}

window.onload = function() {
	// initUser();

	try {
		if (init && typeof(init) == "function") {
			init();
		}
	} catch(e) {

	}
}

