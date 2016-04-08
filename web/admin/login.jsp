<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (session != null) {
	Object user = session.getAttribute("adminUser");
	if (user != null) {
		session.invalidate();
	}
}

String msg = (String) request.getParameter("reason");
String prompt = "";
String promptDisplay = "display:none";
if ("clientUser".equalsIgnoreCase(msg) || "NotFound".equalsIgnoreCase(msg)) {
	prompt = "用户名不正确！";
	promptDisplay = "";
} else if ("ErrorPass".equalsIgnoreCase(msg)) {
	prompt = "密码不正确！";
	promptDisplay = "";
} else if ("Expired".equalsIgnoreCase(msg)) {
	prompt = "非法用户！";
	promptDisplay = "";
}

String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=ctx %>/js/jquery-1.8.3.min.js" ></script>
		<link href="<%=ctx %>/css/global.min.css" rel="stylesheet">
		<style type="text/css">
		body {
			font-family: "微软雅黑";
			font-size: 15px;
		}
		.bodyGround{
			background-color: #e4e4e4;
		}
		#loginBox {
			margin-left:auto;
			margin-right:auto;
			width: 700px;
			padding: 135px;
		}
		row {
			display: table-row;
		}
	
		.label{
			width: 45%;
			text-align: right;
		}
		.input{width: 45%;}
		
		ul {
			display: table;
			list-style: outside none none;
			margin: 0 auto;
			padding: 0;
			overflow: hidden;
		}
		ul li {
			margin-bottom: 12px;
		}
		li div {
			display: table-cell;
			border: medium none;		
		}
	
		div.button {display:table-cell; text-align: center; width: 100%;}
		
		#loginInputDiv{
			background-color: #F2F2F2;
			text-align: center;
			margin-top:30px;
		}
	
		.btn {
			background-color: #e4e4e4;
			border-color: rgba(0, 0, 0, 0.15);
		}
		
		input{line-height: 25px; font-size: 17px;}
		
		#loginBtn {width: 200px; font-size: 15px; font-family: "微软雅黑"}
		
		
		.hongxilogo {
			background: url("../img/hongxi_logo_small_up.png") repeat scroll 0 0 rgba(0, 0, 0, 0);
			display: inline-block;
			height: 60px;
			margin-top: 15px;
			width: 186px;
		}
		
		.logoDiv {
			display: table-row;
			text-align: center;
		}
		</style>
		<title>帮你养车网管理后台-登陆</title>
	</head>
	<body class="bodyGround">
		<form name="loginFrm" action="<%=ctx %>/admin/login.do" method="post">
			<div id="loginBox">
				<div>
				<div id="logoDiv">
					<div class="logo" style="float:left">
                          <img alt="logo" src="<%=ctx %>/images/logo.gif">
                    </div>
					<div style="width: 65%; display: table-cell; vertical-align: middle; text-align: left;margin-top:">
						<span style="font-size:55px;text-align: center;line-height:100px;">&nbsp;汽车服务管理后台</span>
					</div>
				</div>
				</div>
				<br>
				<div id="loginInputDiv">
					<br><br>
					<div id="prompt" style="<%=promptDisplay%>">
						<span id="prompt" style="color: red"><%=prompt %></span>
						<br><br>
					</div>
					<ul>
						<li class="row weak">
							<div class="label">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;</div>
							<div class="space"></div>
							<div class="input"><input type="text" name="adminUser.name" id="username" placeholder="请输入登陆账号"></div>
						<li>
						<li class="row weak">
							<div class="label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;</div>
							<div class="space"></div>
							<div class="input"><input type="password" name="adminUser.password" id="password" placeholder="请输入密码"></div>
						<li>
						<br>
						<li class="row weak">
							<div class="button">
								<input type="submit" class="btn" name="loginBtn" id="loginBtn" value="登            陆">
							</div>
						<li>
						<br>
					</ul>
				</div>
			</div>
		</form>
		
		<script type="text/javascript">
			function check() {
				var username = document.getElementById("username").value;
				if (username == "") {
					alert("登陆名不能为空！");
					return false;
				}
				var password = document.getElementById("password").value;
				if (password == "") {
					alert("密码不能为空！");
					return false;
				}
		
				return true;
			}
			function login() {
				if (!check()) {
					return;
				}
				jQuery("#loginFrm").submit();
			}
		
			jQuery(document).ready(function() {
				document.getElementById("username").value = "";
				document.getElementById("password").value = "";
			});
		</script>
	</body>
</html>