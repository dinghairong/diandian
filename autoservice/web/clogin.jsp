<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	int pagenum = 0;
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－企业用户－－登录</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/clogin.css">
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
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body style="min-width: 1280px;">
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<a class="qyyh_login" href="<%=ctx%>/clogin.jsp"><span>登录</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a>
		<a class="qyyh_login" href="<%=ctx%>/cregister.jsp">开通</a>
		<div class="top_line"></div>
		<div class="login_div" style="margin: 61px 226px 0 0;">
			<form id="member_login_form" onsubmit="return validateLogin();" action="<%=request.getContextPath()%>/former/clogin.do" method="post" style="box-sizing: unset;">
				<div class="login-form-row" style="margin-top: 26px;">
					<div class="title">账号：</div>
					<div class="input">
						<input id="login_name_input" class="pub-input" type="text" name="caccount" placeholder="请输入您的个人帐号">
					</div>
				</div>
				<div style="height:15px">
					
				</div>
				<div class="login-form-row">
					<div class="title">密码：</div>
					<div class="input">
						<input id="login_password_input" class="pub-input" type="password" name="cpassword" placeholder="请输入您的登录密码">
					</div>
				</div>
				<div class="login-form-row forget">
					<div class="title"></div>
					<div class="input">
						<a class="forget_psw" href="javascript:void(0)">忘记密码？</a>
					</div>
				</div>
				<div class="login-submit">
					<a class="pub-btn-middle-orange" onclick="loginHX();" href="javascript:void(0);">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
				</div>
				<div class="dotted_line"></div>
				<div class="help_title">使用合作网站账号登录帮你养车网</div>
				<div class="help_login">
					<img src="<%=ctx%>/images/hz_qq.png"/>
                	<img src="<%=ctx%>/images/hz_qq.png"/>
                	<img src="<%=ctx%>/images/hz_qq.png"/>
                </div>
			</form>

			<img src="<%=ctx%>/images/clogin_new.png" 
		style="z-index: -100; position: absolute; top: 180px; left: 0; overflow: hidden; width: 100%;">
		</div>

		<div id="bodySection" style="overflow: hidden;min-height:0;margin-top:-50px;">
			
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
		<div id="forget1" class="userinfobody forgetbodyheight" style="z-index: 9999999; position: fixed; top: 150px; left: 470px;display:none;">
	<div class="userinfoarea">
		忘记密码
		<div class="closebtn"></div>
	</div>
	<hr class="seperateline">
	<div class="userinfoform forgetformheight">
		<form id="passwordgetter">
			<table class="userinfotable" id="userinfo1">
				<tbody>
					<tr>
						<td>手机号码</td>
					</tr>
					<tr>
						<td>
							<input class="input username" type="text" style="box-sizing: unset">
						</td>
					</tr>
					<tr>
						<td>图片验证码</td>
					</tr>
					<tr>
						<td>
							<input class="input" type="text" style="float: left;width:80px;margin-right: 10px;" id="imagecode" name="imagecode" style="box-sizing: unset">
							<span style="display:block;float:left;height:42px;margin-right: 10px;">
								<img id='imgVcode' src="<%=ctx%>/former/imagecode" />
							</span>
							
							<a href="javascript:;"onclick="document.getElementById('imgVcode').src='<%=ctx%>/former/imagecode?'+new Date()">换一张 </a>
						</td>
					</tr>
					<tr>
						<td id="upro" class="promotion" style="margin-top: 10px; text-align: center; margin-left: 20px; line-height: 25px;"></td>
					</tr>
					<tr>
						<td>
							<div class="userinfosubmit forgot" id="getcode1" style="width: 140px; display: inline-block;border-radius: 6px;" onclick="PassWordRecv()">获取验证码</div>
							<div class="forget_psw_next" id="pwd_next">下一步</div>							
						</td>
					</tr>
				</tbody>
			</table>
			<table class="userinfotable" style="display:none" id="userinfo2">
				<tbody>
					<tr>
						<td>验证码</td>
					</tr>
					<tr>
						<td>
							<input class="input" type="text" id="code">
						</td>
					</tr>
					<tr>
						<td class="promotion" id="errormsg2"></td>
					</tr>
					<tr>
						<td>
							<div class="userinfosubmit forgot" style="width: 120px; display: inline-block;border-radius: 6px;" onclick="goBack()">上一步</div>
							<div class="forget_psw_next" style="background-color:#e54631;width: 120px;" onclick="changepassword()">下一步</div>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="userinfotable" style="display:none" id="userinfo3">
				<tbody>
					<tr>
						<td>新密码</td>
					</tr>
					<tr>
						<td>
							<input class="input password" type="password" id="new_pwd">
						</td>
					</tr>
					<tr>
						<td>确认密码</td>
					</tr>
					<tr>
						<td>
							<input class="input password" type="password" id="check_pwd">
						</td>
					</tr>
					<tr>
						<td class="promotion" id="errormsg3"></td>
					</tr>
					<tr>
						<td>
							<div class="userinfosubmit forgot" style="margin-left: 20px;" onclick="saveChangePwd()">提交修改</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="pagefoot1">
		<div class="pagefoot2">立即登录</div>
	</div>
</div>
<div id="forget2" style="position: fixed; z-index: 9999998; background-color: black; opacity: 0.3; right: 0px; bottom: 0px; left: 0px; top: 0px;display:none;"></div>
	</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();
});

$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();
});

$('.forget_psw').click(function(){
	$('.userinfoform.forgetformheight').height(222);
	$('#forget1').show();
	$('#forget2').show();
})
$('.closebtn').click(function(){
	$('#forget1').hide();
	$('#forget2').hide();

	$('.userinfoform.forgetformheight').height(162);
	$('#userinfo1').show();
	$('#userinfo2').hide();
	$('#userinfo3').hide();
});
$('.pagefoot2').click(function(){
	$('#forget1').hide();
	$('#forget2').hide();
});
$($('.forget_psw_next')[1]).click(function(){
	var code = $('#code').val();
	if(code.length == 0){
		sAlert("请输入您的验证码！");
		return false;
	}else{
		$.ajax({
			url: "<%=ctx%>/former/checkpwdcode.do?smscode=" + code,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.result == "ok"){
					$('.userinfoform.forgetformheight').height(222);
					$('#userinfo2').hide();
					$('#userinfo3').show();
					$('#errormsg2').hide();
				}else {
					if(ret.errCode==1){
						$('#errormsg2').html('您输入的验证码有误，请重新输入。');
						$('#errormsg2').show();
						return false;
					}
				}
			}
		});
	}
});
function PassWordRecv(){
	//验证手机号存不存在
	var phone = $('.input.username').val();
	var imgcode = $('#imagecode').val();
	if(phone.length == 0){
		sAlert("请输入您的手机号！");
		return false;
	}else if(!/^0?1[34578]\d{9}$/.test(phone)){
		sAlert("手机号码格式错误");
        return false;
	}else if(imgcode.length == 0){
		sAlert("请输入图片验证码！");
		return false;
	}else{
		$.ajax({
			url: "<%=ctx%>/former/checkcompanyphone.do?phone=" + phone + "&imagecode=" + imgcode,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.result == "ok"){
					$('.promotion').hide();
					getPwdCode(phone);
				}else {
					if(ret.errCode==1){
						$('.promotion').html('您的手机号还未注册');
						$('.promotion').show();
						return false;
					}
					if(ret.errCode == 2){
						$('.promotion').html('您的验证码输入有误');
						$('.promotion').show();
						//startTime();
						return false;
					}
				}
			}
		});
	}
}
var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function SetRemainTime() {
    if (curCount == 0) {                
        window.clearInterval(InterValObj);//停止计时器
        $("#getcode1").attr("onclick","PassWordRecv()");
        $("#getcode1").html("重新发送");
        $("#getcode1")[0].style["background-color"] = "#e54631";
    }
    else {
        curCount--;
        $("#getcode1").html(curCount + "秒后重新获取");
    }
}
function startTime(){
	curCount = count;
	$("#getcode1").attr("onclick","");
	$("#getcode1").html(curCount + "秒后重新获取");
	$("#getcode1")[0].style["background-color"] = "#999";
	InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
}
function getPwdCode(phone){
	//调用接口，发送验证码到手机
	$.ajax({
		url: "<%=ctx%>/former/sendpwdcode.do?phone=" + phone,
		type:"POST",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.result == "ok"){
				sAlert('验证码已经发送到你的手机上，请点击下一步。');
				$("#pwd_next")[0].style["background-color"] = "#e54631";
				$('#pwd_next').click(function(){
					$('#userinfo1').hide();
					$('#userinfo2').show();
				});
			}else{
				if(ret.errCode==1){
					sAlert("发送失败，请重新点击发送。");
				}
			}
		}
	});
	startTime();
}
function goBack(){
	$('#userinfo1').show();
	$('#userinfo2').hide();
}
function saveChangePwd(){
	var new_pwd = $('#new_pwd').val();
	var check_pwd = $('#check_pwd').val();
	if(new_pwd.length == 0){
		sAlert("请输入您的新密码");
		return false;
	}
	if(new_pwd.length < 6){
		sAlert("密码位数不能少于6位!");
		return false;
	}
	if(check_pwd.length == 0){
		sAlert("请输入您的确认密码");
		return false;
	}
	if(new_pwd != check_pwd){
		$('#errormsg3').html('两次密码输入不一致，请重新输入。');
		$('#errormsg3').show();
	}else{
		$('#errormsg3').hide();
		$.ajax({
			url: "<%=ctx%>/former/savecompanychangepwd.do?newpwd=" + new_pwd,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.result == "ok"){
					alert('密码修改成功，请登录。');

					$('#forget1').hide();
					$('#forget2').hide();

					$('.userinfoform.forgetformheight').height(162);
					$('#userinfo1').show();
					$('#userinfo2').hide();
					$('#userinfo3').hide();
				}else{
					if(ret.errCode==1){
						sAlert("修改失败，请重试");
					}
				}
			}
		});
	}
}

function loginHX(){
	$.ajax({
		url: "<%=request.getContextPath()%>/former/clogin.do",
		type: "post",
		dataType: "JSON",
		data:jQuery("#member_login_form").serialize(),
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.result == 0){
				window.location.href = "<%=request.getContextPath()%>/index.jsp";
			}
			if(ret.result == 2){
				sAlert("账号或密码不正确！");
			}
			if(ret.result == 1){
				sAlert("该账号不存在！");
			}
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}
function validateLogin(){
	if(!$.trim($('#login_name_input').val())){
		sAlert('请输入您的手机号!');
		return false;
	}	
	if(!$.trim($('#login_password_input').val())){
		sAlert('请输入您的密码!');
		return false;
	}
	return true;
}
$(function(){
	$('#login_password_input').bind('keyup', function(e){
		if(e.which == 13){
			loginHX();
		}
	});
});
</script>
</html>