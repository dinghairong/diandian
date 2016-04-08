
var Form_Data = undefined;

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

function validate_info() { 

	var $txt_name = document.getElementById("txt_name"); // *
	var $txt_password= document.getElementById("txt_password"); // *
	var $txt_repassword= document.getElementById("txt_repassword"); // *
	var $txt_phone = document.getElementById("txt_phone"); // *
	var $txt_vcode = document.getElementById("txt_vcode"); // *
	var $txt_email = document.getElementById("txt_email");
	var $txt_introducer = document.getElementById("txt_introducer");
	var $txt_store_name = document.getElementById("txt_store_name"); // *
	var $txt_tel = document.getElementById("txt_tel");
	var $county = document.getElementById("county"); // *
	var $txt_address = document.getElementById("txt_address"); // *

	var $J_identity = document.getElementById("J_identity"); // *
	var $J_img = document.getElementById("J_img"); // *
	var $J_path = document.getElementById("J_path"); // *

	if (validateString($txt_name.value)) {
		Form_Data = "username=" + $txt_name.value;
	} else {
		return fail($txt_name);
	}

	if (validatePassword($txt_password.value)) {
		if (txt_password.value == $txt_repassword.value) {
			Form_Data += "&password=" + $txt_password.value;
		} else {
			return fail($txt_repassword, "输入密码不一致");
		}
	} else {
		return fail($txt_password);
	}

	if (validateMobileNumber($txt_phone.value)) {
		if (checkMobile(Ajaxs.CHECK_MOBILE_NUMBER, $txt_phone.value)) {
			Form_Data += "&mobile=" + $txt_phone.value;
		} else {
			return fail($txt_phone, "手机号已被注册");
		}
	} else {
		return fail($txt_phone);
	}



	if ($txt_email.value) {
		if (validateEmail($txt_email.value)) {
			Form_Data += "&email=" + $txt_email.value;
		} else {
			return fail($txt_email);
		}
	}

	if ($txt_introducer.value) {
		if (validateMobileNumber($txt_introducer.value)) {
			Form_Data += "&introducer=" + $txt_introducer.value;
		} else {
			return fail($txt_introducer);
		}
	}

	if (validateString($txt_store_name.value)) {
		Form_Data += "&store_name=" + $txt_store_name.value;
	} else {
		return fail($txt_store_name);
	}

	if ($txt_tel.value) {
		if (validateTel($txt_tel.value)) {
			Form_Data += "&tel=" + $txt_tel.value;
		} else {
			return fail($txt_tel);
		}
	}

	Form_Data += "&address_id=" + $county.value;
	Form_Data += "&address=" + $txt_address.value;

	// if ($J_img.value) {
		Form_Data += "&store_img=" + $J_img.value;
	// } else {
	// 	Form_Data = undefined;
	// 	showToast("门头图片没有上传", 2000);
	// 	return;
	// }

	// if ($J_identity.value) {
		Form_Data += "&license_img=" + $J_identity.value;
	// } else {
	// 	Form_Data = undefined;
	// 	showToast("营业执照图片没有上传", 2000);
	// 	return;
	// }

	Form_Data += '&path=' + $J_path.value;

	return 'yes';
}

function fail(ele, message) {
	ele.focus();
	ele.select();
	showToast(message || "格式错误", 2000);
	Form_Data = undefined;
	return undefined;	
}

function validateVcode(req_code) {
	var $vcode = document.getElementById("txt_vcode");
	var result;

	if ($vcode && $vcode.value) {
		var formData = "req_code=" + encodeURIComponent(req_code) + 
			"&vcode=" + encodeURIComponent($vcode.value);

		var request = new XMLHttpRequest();
		request.open("POST", "/ajax.do", false);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		request.onload = function() {
			if (request.status == 200) {
				var obj = JSON.parse(request.responseText);

				if (obj.code > -1) {
					result = true;
				}
			}

			if (!result) {
				showToast("验证码输入不正确", 2000);
				$vcode.focus();
				$vcode.select();
			}
		};
		request.send(formData);
	} else {
	}

	return result;
}

function uploadUserInfo1(fileIds,which){
	document.getElementById("J_img").value = document.getElementById(fileIds).value;

	var imgPath = document.getElementById(fileIds).value;
    if (!imgPath) {  
        return;  
    } 

	var imagepath = document.getElementById("J_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		// sAlert("请上传不大于2M的图片！");
		return;
	}

	$.ajaxFileUpload({
		url: "/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "serviceshop_image"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("J_img").value = data.imgName;
					$('#img1').attr('src', "/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#J_logo').children('img').show();
				} else {
					// 
				}
			} else {
				// return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			// return sAlert('Failed to upload logo!');
		}
	});
}

function uploadUserInfo2(fileIds,which){
	document.getElementById("J_identity").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        // sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("J_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		// sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "serviceshop_image"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("J_identity").value = data.imgName;
					$('#img2').attr('src', "/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#biz_identity_img').children('img').show();
				} else {
					// sAlert(data.message);
				}
			} else {
				// return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			// return alert('Failed to upload logo!');
		}
	});
}

function doSubmit(req_code) {
	if (Form_Data) {
		Form_Data += "&req_code=" + encodeURIComponent(req_code);

		var req = new XMLHttpRequest();
		req.open("POST", "/ajax.do", true);
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		req.onload = function() {
			if (req.status == 200) {
				var obj = JSON.parse(req.responseText);

				if (obj.code > -1) {
					showToast("门店注册成功");
					window.location.href = "/index.jsp";
				} else {
					showToast("门店注册失败", 3000);
				}

			} else {
				showToast("网络原因，门店注册失败", 3000);
			}
		};

		req.send(Form_Data);
	}
}

function checkMobile(req_code, mobile) {
	var result;

	if (mobile) {
		var formData = "req_code=" + encodeURIComponent(req_code) +
			"&mobile=" + mobile;

		var req = new XMLHttpRequest();
		req.open("POST", "/ajax.do", false);
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		req.onload = function() {
			if (req.status == 200) {
				var obj = JSON.parse(req.responseText);

				if (obj.code == 0) {
					result = 'yes';
				} 
			} 
		};

		req.send(formData);

		return result;
	}
}












