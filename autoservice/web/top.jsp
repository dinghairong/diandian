<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--     <link rel="stylesheet" href="css/main.css"> -->
    <link rel="stylesheet" href="css/top.css">
    <script src="js/main.js"></script>
</head>
<body>
<%
	String setcity = (String) session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		setcity = "";
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}
%>
	<div class="top">
		<div>
			<div class="left"><span id="span_coun_name"><%= setcity %></span><a href="/city.jsp"><em>[选择城市]</em></a></div>
			<div class="middle">
				<span class="welcome">您好，欢迎光临一站式汽车服务网</span>
				<span>全国覆盖</span><em>200</em><span>城市，</span><a href="/slogin.jsp"><em id="em_join">服务门店加盟</em></a>
				<input type="hidden" id="setcity" value="<%=setcity%>">
			</div>
			<ul>
				<li><a href="/login.jsp"><em>登录</em></a></li>
				<li><a href="/register.jsp"><em>注册</em></a></li>
				<li class="wide"><span>提醒</span><img src="./images/pull_down.png"></li>
				<li><em>收藏</em></li>
				<li class="wide1"><span>关注</span><img src="./images/pull_down.png"></li>
			</ul>
		</div>
	</div>

	<div class="header">
		<div class="title">
			<img class="logo" src="./images/logo.png">
			<div>
				<div class="search">
					<input id="bar_search" type="text" value="" name="" placeholder="请输入关键字">
					<a href="javascript:void(0)" title="" onclick="searchbyfuzzy(this)"><div class="right_search"><span>搜索</span></div></a>
				</div>
				<div class="search_content">
					<span class="right">热门搜索：</span>
					<a href="/upholster.jsp"><span>汽车美容</span></a>
					<a href="install.jsp"><span>安装服务</span></a>
					<a href="/former/getproduct?sp_id=89&number=10&start=0"><span>打蜡</span></a>
					<a href="/former/getproduct?sp_id=55&number=10&start=0"><span>更换火花塞</span></a>
					<a href="/former/getproduct?sp_id=101&number=10&start=0"><span>车内消毒</span></a>
					<a href="/conserve.jsp"><span>快修保养</span></a>
				</div>
			</div>
			<img class="phone" src="./images/phone_num.png">
		</div>

		<div class="nav">
			<div>
				<ul>
					<li class="service"><span>快速服务</span></li>
					<li><a href="/index.jsp"><span>首页</span></a></li>
					<li><a href="/install.jsp"><span>安装改装</span></a></li>
					<li><a href="/conserve.jsp"><span>快修保养</span></a></li>
					<li><a href="/upholster.jsp"><span>美容装潢</span></a></li>
					<li><a href="/check.jsp"><span>检测修正</span></a></li>
					<li class="mycar"><span>我的爱车</span><img src="./images/expand.png"></li>
					<li clas="li_last"><a href="shoplist.jsp"><span id="join_02">服务门店加盟</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>

<script>
function searchbyfuzzy(obj){
	var $sousuo = document.getElementById('bar_search');
    var fuzzy = $sousuo.value;
    if(fuzzy.length == 0){
        return false;
    }
    fuzzy = encodeURI(encodeURI(fuzzy));
    var uri = "/former/searchbyfuzzy.do?fuzzy=" + fuzzy;

    obj.href = uri;
}
</script>
</html>
