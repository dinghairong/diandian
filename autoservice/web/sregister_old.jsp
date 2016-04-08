<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);

    String setcity = (String)session.getAttribute("setcity");
    if((setcity == null) || (setcity.length() == 0)){
        setcity = "上海市";
    }
	List<AreaDetail> province_list = areaDetailDao.findAllProvince();
    List<AreaDetail> selectcity = areaDetailDao.findAllCountyByCity(setcity);
    String selectprovince = "";
    if(selectcity.size() > 0){
        selectprovince = selectcity.get(0).getProvince();
        selectcity = areaDetailDao.findAllCityByProvince(selectprovince);
    }else{
        selectcity = areaDetailDao.findAllCityByProvince("上海市");
        selectprovince = selectcity.get(0).getProvince();
    }
    String showstr = "";
    List<String> isRepeat = new ArrayList<String>();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－商家门店－－注册</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/sregister.css">
	 <link href="images/favicon.ico" rel="shortcut icon"/>

    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
    <script type="text/javascript">
        $(function() {
            $(".wrap").flexslider({
                animation: "slide",
                controlNav: true,
                animationLoop: true
            });
        });
        var ctx = "<%=ctx%>";
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
    <script src="<%=ctx%>/js/ajaxfileupload.js"></script>
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<a class="qyyh_login" href="<%=ctx%>/slogin.jsp">登录</a>
		<div class="top_line"></div>
		<div id="bodySection" style="overflow: hidden;min-height:0;margin-top:-50px;">
			<div class="container_24">
				<form id="regform" method="post" action="">
					<div class="register">
						<div class="register-infobox step1">
							<div class="biz_reg_tit">
								<span>商家入驻</span>
								<em>请详细填写以下资料，我们会有专员负责与您联系 </em>
							</div>
							<table>
								<tbody><tr><td style="width: 50%;">
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									手机号码：
								</div>
								<div class="register-row-input">
									<div class="input-box">
										<input class="pub-input phone" type="text" value="" name="mobile">
									</div>
									<div class="phone-error">亲，您输入的手机号码有误！</div>
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									登录密码：
								</div>
								<div class="register-row-input">
									<input class="pub-input password" type="password" name="password" id="password">
									<div class="password-level">
										<span class="low">低</span>
										<span class="middle">中</span>
										<span class="high">高</span>
									</div>
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									确认登录密码：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="password" name="repassword">
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									店铺名称：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="text" name="supplier_name">
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									业务联系电话：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="text" name="cmobile">
								</div>
							</div>					
							<!-- <div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									主营轮胎品牌：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="text" name="brand">
								</div>
							</div> -->
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									门店面积：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="text" name="meter">  平米
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									门店员工人数：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="text" name="people">  人
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									营业年限：
								</div>
								<div class="register-row-input">
									<input class="pub-input re-password" type="text" name="years">  年
								</div>
							</div>
							<div class="register-row">
								<div class="register-row-left">
									<em>*</em>
									店铺地址：
								</div>
								<div class="register-row-input">
									<div style="width:90px;height:28px; overflow:hidden; float:left; padding-right:3px;">
										<select id="J_province" name="province_id">
											<%
					                        isRepeat.clear();
					                        for(int i = 0;i < province_list.size();i ++){
					                            if(!isRepeat.contains(province_list.get(i).getProvince())){
					                                isRepeat.add(province_list.get(i).getProvince());
					                                if(selectprovince.equals(province_list.get(i).getProvince())){
					                        %>
					                        <option selected="selected"><%=province_list.get(i).getProvince()%></option>
					                        <%
					                                }else{
					                        %>
					                        <option><%=province_list.get(i).getProvince()%></option>
					                        <%
					                                }
					                            }
					                        }                       
					                        %>
										</select>
										<input type="hidden" name="province" id="province">
									</div>
									<div style="width:90px;height:28px; overflow:hidden; float:left; padding-right:3px;">
										<select id="J_city" name="cityid">
											<%
					                        isRepeat.clear();
					                        for(int i = 0;i < selectcity.size();i ++){
					                            if(!isRepeat.contains(selectcity.get(i).getCity())){
					                                isRepeat.add(selectcity.get(i).getCity());
					                        %>
					                            <option value="<%=selectcity.get(i).getId()%>"><%=selectcity.get(i).getCity()%></option>
					                        <%
					                            }
					                        }
					                        %>
										</select>
										<input type="hidden" name="city_id" id="city_id">
									</div>
									<!-- <div style="width:90px;height:28px; overflow:hidden; float:left; padding-right:3px;">
										<select id="J_area" name="area_id">
											<option>xxx</option>
										</select>
										<input type="hidden" name="county" id="county">
									</div> -->
									<input class="pub-input re-password" type="text" name="address">
								</div>	
							</div>
							</td>
							<td style="width: 50%;">
							<div class="biz_reg_upload">
								<div class="register-row-left">上传一张店铺图片： </div>
								<div class="register-row-input">
									<div id="J_logo" class="biz_reg_img fl">
										<img width="230" height="140" src="" style="display:none;">
									</div>
									<div class="biz_reg_imgr fl pt10">
										<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>								
									</div>
									<div style="position: relative; left: 300px; top: -40px;">
										<form method="post" enctype="multipart/form-data"  name="doupload" id="doupload">
											<a id="biz_logo" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
												上传图片
												<input type="file" name="file" id="file1" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo1('file1',this)">
											</a>
											<br>
											<input id="filePath" name="filePath" type="hidden" value="stores">
											<input id="fileName" name="fileName" type="hidden">
											
										</form>
									</div>
								</div>
							</div>
							<div class="biz_reg_upload">
								<div class="register-row-left">上传您的营业执照： </div>
								<div class="register-row-input">
									<div id="biz_identity_img" class="biz_reg_img fl">
										<img width="230" height="140" src="" style="display:none;">
									</div>
									<div class="biz_reg_imgr fl pt10">
										<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>
									</div>
									<div style="position: relative; left: 300px; top: -40px;">
										<form method="post" enctype="multipart/form-data"  name="doupload" id="doupload2">
											<a id="biz_identity" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
											上传图片
												<input type="file" name="file" id="file2" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo2('file2',this)">
											</a>
											<br>
											<input id="filePath2" name="filePath" type="hidden" value="stores">
											<input id="fileName2" name="fileName" type="hidden">
											
										</form>
									</div>
								</div>
							</div>
							
							
							<iframe style="display:none" id="rfFrame" name="rfFrame" src="about:blank">
							</iframe>
							<input id="J_img" type="hidden" value="" name="logo">
							<input id="J_path" type="hidden" value="shop\icon\" name="path">
							<input id="J_identity" type="hidden" value="" name="identity_img">
							<div class="clear"></div>
							<div class="register-row">
								<div class="register-row-left"> </div>
								<div class="register-row-input">
									<a class="pub-btn-middle-orange">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
								</div>
							</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>	
				</form>
			</div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();
});

var istowimg = false;
function randomString() {  
	return '' + new Date().getTime();  
}
function uploadUserInfo1(fileIds,which){
	document.getElementById("J_img").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("J_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "serviceshop_image"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("J_img").value = data.imgName;
					$('#J_logo').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					$('#J_logo').children('img').show();
					$('#J_upload_sp_logo').hide();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return sAlert('Failed to upload logo!');
		}
	});
}
function uploadUserInfo2(fileIds,which){
	document.getElementById("J_identity").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("J_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "serviceshop_image"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("J_identity").value = data.imgName;
					$('#biz_identity_img').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					$('#biz_identity_img').children('img').show();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return alert('Failed to upload logo!');
		}
	});
}

function gotologin(){
	sAlert('注册成功！');
	window.location.href='<%=ctx%>/slogin.jsp';
}

$(function(){
	/* 密码安全程度 */
	$('#password').bind('keyup', function(){
		$('.password-level').removeClass('level1');
		$('.password-level').removeClass('level2');
		$('.password-level').removeClass('level3');
		
		var password = $(this).val();
		if(/^[0-9]+$/.test(password) || /^[a-z]+$/.test(password)){
			$('.password-level').addClass('level1');
		}else if(/^[0-9|a-z]+$/.test(password)){
			$('.password-level').addClass('level2');
		}else if(/^[0-9|a-z|\D|^0-9|^a-z]+$/.test(password)){
			$('.password-level').addClass('level3');
		}
	});

	$('.pub-btn-middle-orange').bind('click', function() {
		var mobile = $('input[name="mobile"]').val();
		
		if(!/^0?1[34578]\d{9}$/.test(mobile)){
        	$('.phone-error').show();
			return false;
		}else{
			$('.phone-error').hide();
		}
		var password = $('input[name="password"]').val();
		if(password==''){
			sAlert("请输入密码");
			return false;
		}
		if(password.length<6){
			sAlert("密码长度不能小于6位");
			return false;
		}
		var repassword = $('input[name="repassword"]').val();
		if(password!=repassword){
			sAlert("二次密码不一致！");
			return false;
		}
		var supplier_name = $('input[name="supplier_name"]').val();
		if(supplier_name==''){
			sAlert("请输入店铺名称!");
			return false;
		}
		var cmobile = $('input[name="cmobile"]').val();
		if(cmobile==''){
			sAlert("请输入业务联系电话!");
			return false;
		}
		var address = $('input[name="address"]').val();
		if(address==''){
			sAlert("请输入店铺地址!");
			return false;
		}else{
			$('#province').val(document.getElementById("J_province").options[document.getElementById("J_province").selectedIndex].innerHTML);
			$('#city').val(document.getElementById("J_city").options[document.getElementById("J_city").selectedIndex].innerHTML);
			// $('#county').val(document.getElementById("J_area").options[document.getElementById("J_area").selectedIndex].innerHTML);
			$('#city_id').val($('#J_city').val());
		}
		var brand = $('input[name="brand"]').val();
		if(brand == ''){
			sAlert("请输入门店的主营轮胎品牌!");
			return false;
		}
		var meter = $('input[name="meter"]').val();
		if(meter == ''){
			sAlert("请输入门店面积!");
			return false;
		}
		if(isNaN(meter)){
			sAlert("请正确输入门店面积!");
			return false;
		}
		var people = $('input[name="people"]').val();
		if(people == ''){
			sAlert("请输入门店员工人数!");
			return false;
		}
		if(isNaN(people)){
			sAlert("请正确输入门店员工人数!");
			return false;
		}else{
			if(parseInt(people) != people){
				sAlert("请正确输入门店员工人数!");
				return false;
			}
		}
		var years = $('input[name="years"]').val();
		if(years == ''){
			sAlert("请输入门店营业年限!");
			return false;
		}
		if(isNaN(years)){
			sAlert("请正确输入门店营业年限!");
			return false;
		}


		$.ajax({
			url: "<%=ctx%>/former/sregister.do",
			type: "post",
			dataType: "JSON",
			data:jQuery("#regform").serialize(),
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.success == "0"){
					//sAlert("信息提交成功，等待客服审核！");
					//window.location.reload();
					sAlert3("信息提交成功，等待客服审核！",window.location.href);
				}
				if(ret.success == "1"){
					sAlert("该手机号码已经被注册了");
				}
			},
			error: function(XMLRequest, textInfo){
				if(textInfo != null){
					alert(textInfo);
				}
			}
		});
		//$('#regform').submit();
	});

	$('#J_province').change(function(){
		var province = this.options[this.selectedIndex].innerHTML;
		province = encodeURI(encodeURI(province));

		$.ajax({
			url: "<%=ctx%>/former/getcitybyprovince.do?province=" + province,
			type: "post",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				$('#J_city').html(ret.html);
				// $('#J_area').html(ret.html2);
			},
			error: function(XMLRequest, textInfo){
				if(textInfo != null){
					alert(textInfo);
				}
			}
		});
	});
	$('#J_city').change(function(){
		$('#city_id').val($(this).val());
	});
		
});
</script>
</html>