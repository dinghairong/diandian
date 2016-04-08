<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	User user = (User)session.getAttribute("user");
	if(user == null){
		response.sendRedirect(ctx + "/logout.jsp");
		return;
	}
	SmartProperties smartProp = SmartProperties.getInstance();
	String imgPath = smartProp.getImgPath();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－用户中心</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/userinfo.css">
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
		<div class="top_line"></div>

		<div id="bodySection" style="overflow: hidden;" class="uc_content">
			<div class="siteNavi">
				<a href="">首页</a>
				<span class="s1"> ></span>
				<span>用户中心</span>
			</div>
			<div class="uc_content_Navi">
				<div class="leftNavi">
					<div>
						<h5 class="title_top">订单中心</h5>
						<a href="<%=ctx%>/myorder.jsp">我的订单</a>
						<!-- <a href="<%=ctx%>/promotionCode.jsp">我的优惠券</a> -->
						<a href="<%=ctx%>/mycart.jsp">我的服务车</a>
						<!-- <a href="/Car/CarIndex.html">我的车型库</a> -->
						<h5>账户中心</h5>
						<a class="current" href="<%=ctx%>/userinfo.jsp">基本信息</a>
						<!-- <a href="/Addresses/List.html">收货地址管理</a> -->
						<a href="<%=ctx%>/updatePassword.jsp">修改密码</a>
						<a href="<%=ctx%>/myproblem.jsp">我的咨询</a>
					</div>
				</div>
			</div>
			<div class="r_content">
				<div class="user_information w776" style="border-top:2px solid #007fcc;float:left;margin-bottom:100px">
					<div class="div2">
						<%if(null != user.getIcon() && user.getIcon().length() > 0){%>
						<img id="Userheadimg" src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + user.getPath()%>&imageName=<%=user.getIcon()%>">
						<%}else{%>
						<img id="Userheadimg" src="<%=ctx%>/img/default_icon.png">
						<%}%>
						<!-- <img id="Userheadimg" src="http://resource.tuhu.cn/Image/UserCenter/hu.png"> -->
						<div id="updateimg" onclick="openBrowse();" style="width: 98px; height: 25px; float: left; margin-top: -27px; border: 1px solid rgb(153, 153, 153); background-color: rgba(153, 153, 153, 0.8); cursor: pointer; color: rgb(255, 255, 255); text-align: center; line-height: 25px; display: none;">修改头像</div>
						<input id="file" type="file" onchange="uploadUserInfo('file',this)" name="file" style="display:none">
						<!-- <input id="filePath" type="hidden" value="user" name="filePath"> -->
						<input id="fileName" type="hidden" name="fileName">
					</div>
					<div id="infoShow" class="information_data" style="width:620px;">
						<div>
							<span class="idl">姓名：</span>
							<div id="s_userName" class="text" style="float:left;width:100px;"><%=user.getName()%></div>
							<div class="update" onclick="xg()">修改</div>
						</div>
						<div>
							<span class="idl">手机号：</span>
							<div id="s_phone" class="text" style="float:left;width:100px;"><%=user.getPhone()%></div>
						</div>
						<div>
							<span class="idl">邮箱：</span>
							<span id="s_mail" class="text"> <%=user.getEmail()%> </span>
						</div>
						<!-- <div>
							<span class="idl">性别：</span>
							<span id="s_sex">未知</span>
						</div> -->
						<!-- <div>
							<span class="idl">昵称：</span>
							<span id="s_Nickname" class="text"></span>
						</div> -->
					</div>
					<form id="UpateUsreObjectForm" action="<%=ctx%>/former/updateuser.do" method="post">
						<div id="infoUp" class="information_data" style="display:none">
							<div>
								<span class="idl">姓名：</span>
								<input id="userName" class="input" type="text" style="float:left;margin-top: 5px;" value="<%=user.getName()%>" name="user.name">
								<span id="yz_UserName" class="errormsg" style="display:none"></span>
							</div>
							<div>
								<span class="idl">
									<span style="color:#d12a3e">* </span>
									手机号：
								</span>
								<input id="MobileNumber" type="hidden" value="<%=user.getPhone()%>" name="MobileNumber">
								<input id="phone" class="input" type="text" maxlength="11" style="float:left;margin-top: 5px;" name="user.phone" value="<%=user.getPhone()%>">
								<span id="yz_mobileNumber" class="errormsg" style="display:none"></span>
							</div>
							<div id="phoneYz" style="display:none">
								<span class="idl">
									<span style="color:#d12a3e">* </span>
									验证码：
								</span>
								<div class="text" style="width:120px;float:left;">
									<input id="YanZhengCode" class="input" type="text" name="sms_code" value="">
								</div>
								<a id="btn_YZ" class="bt_yzphone" style="height:30px;" href="javascript:void(0)">获取验证码</a>
								<span id="yz_Phoneerror" class="errormsg" style="display:none"></span>
							</div>
							<div>
								<span class="idl">
									<span style="color:#d12a3e">* </span>
									邮箱：
								</span>
								<input id="EmailAddress" type="hidden" value="<%=user.getEmail()%>" name="EmailAddress">
								<input id="mail" class="input" type="text" name="user.email" value="<%=user.getEmail()%>">
								<span id="yz_EmailAddress" class="errormsg" style="display:none"></span>
							</div>
							<div id="mailYz" style="display:none">
								<span class="idl">
									<span style="color:#d12a3e">* </span>
									验证码：
								</span>
								<div class="text" style="width:120px;float:left;">
									<input id="emailYanZhengCode" class="input" type="text" name="emailYanZhengCode" style="width:100px;" value="">
								</div>
								<div id="btn_email_yz" class="bt_yzphone" style="height:30px;">获取验证码</div>
								<span id="yz_Emailerror" class="errormsg" style="display:none"></span>
							</div>
							<!-- <input id="filePath" type="hidden" value="user" name="user.path">  -->
							<div>
								<input id="submit" class="submit" type="button" value="保存" onclick="updateInfo()">
								<span id="error" class="errormsg" style="display:none"></span>
							</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			
			
		</div>
	</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang_wenzis').attr("style","color:#6c6c6c");
	$('.lunbo').hide();
});
$(".div2").hover(function () {
	$("#updateimg").show();
}, function () {
	$("#updateimg").hide();

});
$("#phone").on("blur",function(){
    var oldphone = $('#MobileNumber').val();
    var newphone = $('#phone').val();
    if(oldphone != newphone){
    	
    	VerifyMobile(this);
    }else{
    	$('#phoneYz').hide();
    }
    
});
$("#btn_YZ").on("click",function(){
	if($(this).hasClass("on")){ return false;}
    // if($("input[name=mobile]").attr("verify-finish")){
        var self = $(this);
        self.html("正在发送").addClass('on');
        $.ajax({
            url:"<%=ctx%>/former/changephone.do",
            dataType:"json",
            async:true,
            data:"mobile="+$("#phone").val(),
            type:"POST",
            timeout: 30000,
            error:function(){
                sAlert("验证码发送失败");
                self.html("发送验证码").removeClass("on");
                return false;
            },
            success: function(){
                var html = '验证码已发送(<i>60</i>)';
                self.html(html);
                regCodeInterval = setInterval(function(){
                    regCodeTimeinterval();
                    }, 1000);
            }
        });
    // }
});
/* 重新发送 */
function regCodeTimeinterval(){
    var currTime = $('#btn_YZ i').html();
    var newTime = parseInt(currTime) - 1;
    if(newTime){
        $('#btn_YZ i').html(newTime);
    }else{
        clearInterval(regCodeInterval);
        $('#btn_YZ').html('重新发送').removeClass('on'); 
    }
}
/* 验证手机 */
function VerifyMobile(id){
    var mobile = $(id).val(),msg = "",slef = $(id),
        tip = $('#yz_mobileNumber');
    if(mobile==""){
        msg = "请输入您的手机号";
        tip.html(msg);
        tip.show();
        $(id).val("");
        return false;
    }else if(!/^0?1[34578]\d{9}$/.test(mobile)){
        msg = "手机号码格式错误";
        tip.html(msg);
        tip.show();
        $(id).val("");
        
        return false;
    }else{    	
        $.ajax({
            dataType:"json",
            async:false,
            url : "<%=ctx%>/former/checkmobile.do",
            data: "checkmobile="+mobile,
            type:"POST",
            timeout: 10000,
            success: function(data){
                if(data.result == "fail"){
                    msg = "该手机号已经被注册过";
                    tip.html(msg);
                    tip.show();
                    $(id).val("");
                    return false;
                }
                else{
                	$('#phoneYz').show();
                    tip.hide();
                }
            }
        })
    }
    return;
}

function openBrowse() {
	$(".pwd_OK").hide();
	var ie = navigator.appName == "Microsoft Internet Explorer" ? true : false;
	if (ie) {
		document.getElementById("file").click();
	} else {
		var a = document.createEvent("MouseEvents");//FF的处理
		a.initEvent("click", true, true);
		document.getElementById("file").dispatchEvent(a);
	}

}
function uploadUserInfo(fileIds,which){
	var imgPath = $("#file").val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = "";
	var filename = document.getElementById("file").value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "user_avatar"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					var uri = "<%=ctx%>/former/updateuser?user.icon=" + data.imgName + "&user.path=" + "user/user/";
					$.ajax({
						url: uri,
						type: "post",
						dataType: "JSON",
						async: false,
						timeout: 3000,
						success: function(ret){
							document.getElementById("fileName").value = data.imgName;
							$('#Userheadimg').attr('src',"<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
						},
						error: function(XMLRequest, textInfo){
							if(textInfo != null){
								alert(textInfo);
							}
						}
					});
				} else {
					sAlert(data.message);
				}
			} else {
				return alert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return alert('Failed to upload logo!');
		}
	});
}
function xg(){
	$('#infoShow').hide();
	$('#infoUp').show();
}
function updateInfo(){
	if(!$('#phoneYz').is(":hidden")){
		var phone = $('#YanZhengCode').val();
		if(phone.length == 0){
			sAlert("请输入验证码");
			return false;
		}
	}
	var name = $('#userName').val();
	var phone = $('#phone').val();
	var email = $('#mail').val();


	$.ajax({
		url: "<%=ctx%>/former/updateuser.do",
		type: "post",
		dataType: "JSON",
		data:jQuery("#UpateUsreObjectForm").serialize(),
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.success == true){
				sAlert3("信息修改成功",window.location.href);
			}
			if(ret.error  == 1){
				sAlert("验证码错误");
			}
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}
</script>
</html>