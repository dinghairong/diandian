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

	AdvisoryDao advisoryDao = (AdvisoryDao)SpringUtils.getBean(AdvisoryDao.class);
	List<Advisory> advisory_list = advisoryDao.findAdvisoryByUid(user.getId());
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－用户中心</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/myproblem.css">
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
						<!-- <h5>途虎车管家</h5>
						<a href="/Car/CarIndex.html">我的车型库</a> -->
						<h5>账户中心</h5>
						<a href="<%=ctx%>/userinfo.jsp">基本信息</a>
						<!-- <a href="/Addresses/List.html">收货地址管理</a> -->
						<a href="<%=ctx%>/updatePassword.jsp">修改密码</a>
						<a class="current" href="<%=ctx%>/myproblem.jsp">我的咨询</a>
					</div>
				</div>
			</div>
			<div class="r_content">
				<div class="user_information w776" style="border-top:2px solid #007fcc;float:left;margin-bottom:100px;margin-top:0;">
					<div style="margin-left: 20px; margin-top: 20px;margin-right: 20px;" id="problemlist">
						<div class="problemlist">
							<ul>							
								<%
								if(advisory_list.size() > 0){
								for(int i = 0;i < advisory_list.size();i ++){
								%>
								<li>
									<a href="javascript:void(0)" style="text-decoration:underline;" onclick="showAnswer(this)">
										<%=advisory_list.get(i).getUsecontent()%>
									</a>
									<div class="problem_list_span">
										<span style="display:block;">问题解答：</span>
										<span>
											<%if(null != advisory_list.get(i).getUucontent()){%>
											<%=advisory_list.get(i).getUucontent()%>
											<%}%>
										</span>
									</div>
								</li>
								<%
								}}else{
								%>
								你目前还没有任何提问，你可以点击<a href="javascript:void(0)" style="color: red;" onclick="opencreate()">我要提问</a>进行提问。
								<%
								}
								%>
							</ul>
						</div>
						<%if(advisory_list.size() > 0){%>
						<div style="float:right;">
							<a href="javascript:void(0)" style="color: #007fcc;" onclick="opencreate()">我要提问</a>
						</div>
						<%}%>
					</div>

					<div style="margin-top:10px;overflow: hidden;display:none" id="creatproblem">
						<div>
							<span>
								我的咨询：
							</span>
						</div>
						<div style="margin-top:5px;">
							<textarea class="advisory_common_content" id="content" name="content"></textarea>
						</div>
						<div style="float:right;margin-top:10px;">
							<a href="javascript:void(0)" onclick="submitMyproblem()">
								<span class="advisory_common_submit">发布</span>
							</a>
							<a href="javascript:void(0)" onclick="closecreate()">
								<span class="advisory_common_submit">返回</span>
							</a>
						</div>
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

function opencreate(){
	$('#problemlist').hide();
	$('#creatproblem').show();
}
function closecreate(){
	$('#problemlist').show();
	$('#creatproblem').hide();
}
function submitMyproblem(){
	var problem = $('#content').val();
	problem = encodeURI(encodeURI(problem));
	if(problem.length == 0){
		sAlert("请填写你的问题！");
		return false;
	}else{
		$.ajax({
			url: "<%=ctx%>/former/addproblem.do?problem=" + problem,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.success == "0"){
					window.location.reload();
				}else if(ret.success == "1"){
					sAlert("改问题已经存在请查看！");
				}
			}
		});
	}

}
function showAnswer(obj){
	if($(obj).siblings().is(":hidden")){
		$(obj).siblings().show();
	}else{
		$(obj).siblings().hide();
	}
}
</script>
</html>