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
	// User user = (User)session.getAttribute("user");
	// Company company = (Company)session.getAttribute("company");
	AdvisoryDao advisoryDao = (AdvisoryDao)SpringUtils.getBean(AdvisoryDao.class);
	List<Advisory> advisory_list = advisoryDao.findAdvisory();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－服务介绍</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">	
	<link rel="stylesheet" href="<%=ctx%>/css/advistory.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
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
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<div class="top_line"></div>

		<div id="bodySection" style="overflow: hidden;">
			<div class="siteNavi">
				<a href="">首页</a>
				<span class="s1"> ></span>
				<span>服务介绍</span>
			</div>
			<div id="ListLeft">
				<div class="leftNavi">
					<div class="leftNavi_div">
						<div class="title_list">
							服务介绍
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_s.jsp" style="line-height: 45px;">配送安装</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_c.jsp" style="line-height: 45px;">产品保修</a>
						</div>			
						<div class="title_list_div2">
							<a href="<%=ctx%>/a_a.jsp" style="line-height: 45px;">用户协议</a>
						</div>
						<div class="title_list">
							支付方式
						</div>
						<div class="title_list_div3">
							<a href="<%=ctx%>/a_p.jsp" style="line-height: 45px;">货到付款</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_y.jsp" style="line-height: 45px;">支付宝</a>
						</div>
						<div class="title_list_div2">
							<a href="<%=ctx%>/a_t.jsp" style="line-height: 45px;">银行转账/汇款</a>
						</div>
						<div class="title_list">
							联系我们
						</div>
						<div class="title_list_div3">
							<a href="<%=ctx%>/a_b.jsp" style="line-height: 45px;">帮你养车网简介</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_d.jsp" style="line-height: 45px;">广告与市场合作</a>
						</div>
						<div class="title_list_div1">
							<a href="#javascript:void(0)" style="line-height: 45px;">招贤纳士</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_e.jsp" style="line-height: 45px;">我要投诉</a>
						</div>
					</div>	
				</div>
			</div>
			<div id="context" style="overflow: hidden;">
				<div class="grid_19">
					<table>
						<tbody>
							<tr style="border-bottom:none;">
								<th style="background-color:white;width:18%; height:38px;border-top:2px solid #007fcc;">
								<a style="color:#007fcc;">全部咨询</a>
								</th>
								<th style="border-left:1px solid #E3E3E3;background-color:#F8F8F8;width:25%;border-top:1px solid #E3E3E3;border-bottom:1px solid #E3E3E3;height:38px;" colspan="2"></th>
							</tr>
						</tbody>
					</table>
						<table>
							<tbody>
								<tr>
									<td style="border-top:none;padding-bottom:30px;">
										<div>
											<input type="text" id="search" name="search" style="width:500px;height:25px;">
											<a href="javascript:void(0)" onclick="searchProblem()">
												<span style="border: 1px solid #eee;border-radius: 6px;display: inline-block;height: 30px;line-height: 33px;margin-left: 20px;text-align: center;width: 80px;">搜 索</span>
											</a>
										</div>
										<div style="margin-left: 20px; margin-top: 20px;margin-right: 20px;">
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
													}}
													%>
												</ul>
											</div>
											<%if(advisory_list.size() > 0){%>
											<div style="float:right;display:none">
												<a href="javascript:void(0)" style="color: #007fcc;" onclick="opencreate()" id="creatbtn">我要提问</a>
											</div>
											<%}%>

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
									</td>
								</tr>
							</tbody>
					</table>
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

function showAnswer(obj){
	if($(obj).siblings().is(":hidden")){
		$(obj).siblings().show();
	}else{
		$(obj).siblings().hide();
	}
}
function searchProblem(){
	var problem = $('#search').val();
	if(problem.length == 0){
		return false;
	}
	if(problem.indexOf("'") > -1){
		sAlert("请正确输入查询条件！");
		return false;
	}
	problem = encodeURI(encodeURI(problem));
	var uri = "<%=ctx%>/former/searchproblem?problem=" + problem;
	$.ajax({
		url: uri,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('.problemlist ul').html(ret.html);
			$($('.problemlist ul li')[1]).remove();
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}

function opencreate(){

	$('#creatbtn').hide();
	$('#creatproblem').show();
}
function closecreate(){
	$('#creatbtn').show();
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
</script>
</html>