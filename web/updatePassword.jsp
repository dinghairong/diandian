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
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－用户中心</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/updatePassword.css">
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
						<a href="<%=ctx%>/userinfo.jsp">基本信息</a>
						<!-- <a href="/Addresses/List.html">收货地址管理</a> -->
						<a class="current" href="<%=ctx%>/updatePassword.jsp">修改密码</a>
						<a href="<%=ctx%>/myproblem.jsp">我的咨询</a>
					</div>
				</div>
			</div>
			<div class="r_content">
				<div class="pwd_OK">
					<img src="http://resource.tuhu.cn/Image/UserCenter/OK.png">
					密码修改成功！
					<span class="Code_Close">x</span>
				</div>
				<div class="user_pwd w776" style="border-top:2px solid #007fcc">
					<div class="pwd_content">
						<form method="post">
							<div class="pwd_inputdiv">
								<span class="tit">原密码：</span>
								<input id="oldPassword" class="input" type="password" name="oldPassword">
								<span id="yz_oldPassword" style="color:red"></span>
							</div>
							<div class="pwd_inputdiv">
								<span class="tit">新的密码：</span>
								<input id="newPassword" class="input" type="password" name="newPassword">
								<span id="yz_newpassword" class="c999">密码长度不少于8位</span>
							</div>
							<div class="pwd_inputdiv">
								<span class="tit">确认密码：</span>
								<input id="confirmPassword" class="input" type="password" name="confirmPassword">
								<span id="yz_confirmpassword"></span>
							</div>
							<input id="button" class="OKbutton" type="button" onclick="updateInfo()" style="cursor:pointer" value="确认">
						</form>
					</div>
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
function updateInfo(){
	var oldpwd = $('#oldPassword').val();
	var newpwd = $('#newPassword').val();
	var checkpwd = $('#confirmPassword').val();
	if(oldpwd.length == 0){
		$("#yz_oldPassword").html("请输入原密码");
		return false;
	}else{
		$("#yz_oldPassword").html("");
	}
	if(newpwd.length == 0){
		$("#yz_newpassword").html("请输入新密码");
		$("#yz_newpassword").removeClass().css("color","red");
		return false;
	}else{
		if(newpwd.length < 8){
			$("#yz_newpassword").html("密码长度不少于8位");
			return false;
		}else{
			$("#yz_newpassword").html("");
		}
	}
	if(checkpwd.length == 0){
		$("#yz_confirmpassword").html("请输入确认密码");
		return false;
	}else{
		if(newpwd != checkpwd){
			$("#yz_confirmpassword").html("两次密码输入不一致");
			return false;
		}else{
			$("#yz_confirmpassword").html("");
		}
		
	}

	$.ajax({
		url: "<%=ctx%>/former/updateuser.do?user.password=" + newpwd + "&oldpwd=" + oldpwd,
		type: "post",
		dataType: "JSON",
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