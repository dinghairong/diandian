function reg_event() {
	var $btn_next = document.getElementById("btn_next");	

	$btn_next.addEventListener("click", function() {

		var $reg_chk = document.getElementById("reg_chk");
		var eles = document.getElementsByName("reg_fir");	
		
		if (!validateEmpty(eles) ) {
			return;
 		} else {
 			if (!validate_reg()) {
 				return;
 			}
 		}

 		if (!$reg_chk.checked) {
			showToast("请先同意协议", 2000);
			return;
		}

		document.getElementById("first").style.display = "none";
		document.getElementById("second").style.display = "block";
		window.location.href = "#second";

		var for_platform = document.getElementById("for_platform");
		for_platform.value = document.getElementById("fir_platform").value;
		var $sec_name = document.getElementById("sec_name");
		var $sec_name_01 = document.getElementById("sec_name_01");
		$sec_name.value = document.getElementById("fir_name").value;
		$sec_name_01.value = document.getElementById("fir_name").value; 

		var $sec_contact = document.getElementById("sec_contact");	
		$sec_contact.value = document.getElementById("fir_contact").value;

		var $sec_phone = document.getElementById("sec_phone");
		$sec_phone.value = document.getElementById("fir_phone").value;

		var $sec_href = document.getElementById("sec_href");
		$sec_href.value = document.getElementById("href_addr").value;
// console.log(d.getDate());

	});

	var $btn_agree = document.getElementById("btn_agree");
	$btn_agree.addEventListener("click", function() {
		var eles = document.getElementsByName("reg_sec");

		if (!validateEmpty(eles)) {
			return;
		}

		// var $province = document.getElementById("province");
		// var $city = document.getElementById("city");
		var $county = document.getElementById("county");
		var $reg_email = document.getElementById("reg_email");
		var $desc_addr = document.getElementById("desc_addr");
		var $reg_pwd = document.getElementById("reg_pwd");
		var $agreement_no = document.getElementById("agreement_no");
		var $sec_name = document.getElementById("sec_name");
		var $sec_name_01 = document.getElementById("sec_name_01");
		var $license = document.getElementById("license");
		var $sec_contact = document.getElementById("sec_contact");
		var $sec_phone = document.getElementById("sec_phone");
		var $sec_href = document.getElementById("sec_href");
		var $for_platform = document.getElementById("for_platform");
		var $from_time = document.getElementById("from_time");
		var $to_time = document.getElementById("to_time");

		var req_code = getReq_code4Agree();


		var formData = "req_code=" + encodeURIComponent(req_code) + 
						"&county=" + encodeURIComponent($county.value) + 
						"&reg_email=" + encodeURIComponent($reg_email.value) + 
						"&desc_addr=" + encodeURIComponent($desc_addr.value) + 
						"&reg_pwd=" + encodeURIComponent($reg_pwd.value) + 
						"&agreement_no=" + $agreement_no.value + 
						"&company_name=" + encodeURIComponent($sec_name_01.value) + 
						"&second_party=" + encodeURIComponent($sec_name.value) + 
						"&business_license_no=" + $license.value + 
						"&contact=" + encodeURIComponent($sec_contact.value) + 
						"&phone_num=" + $sec_phone.value + 
						"&href_addr=" + encodeURIComponent($sec_href.value) + 
						"&third_platform=" + encodeURIComponent($for_platform.value) + 
						"&from_time=" + $from_time.value + 
						"&to_time=" + $to_time.value;

		var request = new XMLHttpRequest();
		request.open("POST", "/ajax.do", true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		request.onload = function() {
			if (request.status == 200) {
				var obj = JSON.parse(request.responseText);

				if (obj.code > -1) {
					clogin(encodeURIComponent($reg_pwd.value), 
						$sec_phone.value);
				} else {
					showToast("注册失败", 2000);
				}

			} else {
				showToast("注册失败, 网络错误", 2000);
			}
		};
		request.send(formData);
	});

	var $btn_disagree = document.getElementById("btn_disagree");
	$btn_disagree.addEventListener("click", function() {
		document.getElementById("first").style.display = "block";
		document.getElementById("second").style.display = "none";
	});
}

function clogin(pwd, phone) {
	var formdata = "caccount=" + phone + "&cpassword=" + pwd;
	var request = new XMLHttpRequest();
	request.open("POST", "/former/clogin.do", true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	request.onload = function() {
		if (request.status == 200) {
			var obj = JSON.parse(request.responseText);

			if(obj.result == 0){
				window.location.href = "/cwelcome.jsp";
			}
		} else {
			showToast("网络错误", 2000);
		}
	};
	request.send(formdata);
}

function getProvince(req_code) {
	var $province = document.getElementById("province");
	var $city = document.getElementById("city");
	var $county = document.getElementById("county");

	// var formData = new FormData();
	// formData.append("req_code", req_code);

	var formData = "req_code=" + encodeURIComponent(req_code);

	var request = new XMLHttpRequest();
	request.open("POST", "/ajax.do", true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.onload = function() {
		if (request.status == 200) {
			var obj = JSON.parse(request.responseText);

			var arr = undefined;

			if (obj.code > -1) {
				arr = obj.data;
			}

			if (arr) {
				for (var i = 0;  i < arr.length; i++) {
					var p = arr[i];
					var $option = document.createElement("option");
					$option.text = p.name;
					$option.value = p.name;
				 	$province.add($option);
				}

				var cities = arr[0].cities;

				for (var j = 0; j < cities.length; j++) {
					var c = cities[j];
					var $option = document.createElement("option");
					$option.text = c.name;
					$option.value = c.name;
				 	$city.add($option);
				}

				var counties = cities[0].counties;

				for (var k = 0; k < counties.length; k++) {
					var cu = counties[k];
					var $option = document.createElement("option");
					$option.text = cu.name;
					$option.value = cu.id;
				 	$county.add($option);
				}
			}
		} else {
		}
	};
	request.send(formData);
}

function getCity(req_code) {
	var $province = document.getElementById("province");
	var $city = document.getElementById("city");
	var $county = document.getElementById("county");

	var sel = $province.value;

	var formData = "req_code=" + encodeURIComponent(req_code) + "&province=" + sel;

	var request = new XMLHttpRequest();
	request.open("POST", "/ajax.do", true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.onload = function() {
		if (request.status == 200) {
			var obj = JSON.parse(request.responseText);
			var arr = undefined;

			if (obj.code > -1) {
				arr = obj.data;
			}

			if (arr) {
				cleanChildren($city);
				cleanChildren($county);

				for (var i = 0;  i < arr.length; i++) {
					var c = arr[i];
					var $option = document.createElement("option");
					$option.text = c.name;
					$option.value = c.name;
				 	$city.add($option);
				}

				var counties = arr[0].counties;

				for (var k = 0; k < counties.length; k++) {
					var cu = counties[k];
					var $option = document.createElement("option");
					$option.text = cu.name;
					$option.value = cu.id;
				 	$county.add($option);
				}
			}
		} else {
		}
	};
	request.send(formData);
}

function getCounty(req_code) {
	var $city = document.getElementById("city");
	var $county = document.getElementById("county");

	var sel = $city.value;

	var formData = "req_code=" + encodeURIComponent(req_code) + "&city=" + sel;

	var request = new XMLHttpRequest();
	request.open("POST", "/ajax.do", true);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.onload = function() {
		if (request.status == 200) {
			var obj = JSON.parse(request.responseText);
			var arr = undefined;

			if (obj.code > -1) {
				arr = obj.data;
			}

			if (arr) {
				cleanChildren($county);

				for (var i = 0;  i < arr.length; i++) {
					var cu = arr[i];
					var $option = document.createElement("option");
					$option.text = cu.name;
					$option.value = cu.id;
				 	$county.add($option);
				}
			}
		} else {
		}
	};

	request.send(formData);
}


function validate_reg() {
	var $fir_name = document.getElementById("fir_name");
	var $fir_contact = document.getElementById("fir_contact");
	var $fir_phone = document.getElementById("fir_phone");
	// var $reg_email = document.getElementById("reg_email");
	// var $href_addr = document.getElementById("href_addr");
	var $pwd_fir = document.getElementById("pwd_fir");
	var $reg_pwd = document.getElementById("reg_pwd");

	var result = undefined;

	if (!validateString($fir_contact.value)) {
// log($fir_contact.value);
		return fail($fir_contact);
	} 

	if (!validateString($fir_name.value)) {
// log($fir_name.value);
		return fail($fir_name);
	} 

	if (!validatephone($fir_phone.value)) {
// log($fir_phone.value);
		return fail($fir_phone);
	}

	// if ($reg_email.value) {
	// 	if (!validateEmail($reg_email.value)) {
	// 		return fail($reg_email);
	// 	}
	// }

	if (validatePassword($pwd_fir.value)) {
		if ($pwd_fir.value != $reg_pwd.value) {
// log($pwd_fir.value + "!=" + $reg_pwd.value);
			$reg_pwd.focus();
			$reg_pwd.select();
			showToast("确认密码与初始密码不一致", 2000);
			return undefined;
		}
	} else {
// log($pwd_fir.value);
		return fail($pwd_fir);
	}

	// if (!validateURL($href_addr.value)) {
	// 	return fail($href_addr);
	// }

	return 'yes';
}

function fail(ele) {
	ele.focus();
	ele.select();
	showToast("格式错误", 2000);
	return undefined;	
}



