<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	//Integer total = (Integer)request.getAttribute("commodity_total");
	int pagenum = 0;
	// pagenum = total / 15;
	// if(total % 15 != 0){
	// 	pagenum = pagenum + 1;
	// }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－服务介绍</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">	
	<link rel="stylesheet" href="<%=ctx%>/css/about.css">
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
							<a href="<%=ctx%>/a_s.jsp" style="line-height: 45px;" class="title_select">配送安装</a>
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
								<th class="cBar1" style="width: 20%; height: 38px; border-bottom: 1px solid white; background-color: white; border-top: 2px solid #007fcc;" onclick="change1()" onmouseover="change1()">
									<a style="color: #007fcc;">您自行解决安装</a>
								</th>
								<th class="cBar2" style="border-left: 1px solid #e3e3e3; width: 28%; height: 38px; background-color: #f8f8f8; border-bottom: 1px solid #e3e3e3; border-top: 1px solid #e3e3e3;" onclick="change2()" onmouseover="change2()">
									<a style="color: rgb(62, 61, 61);">&nbsp;&nbsp;帮你养车网为您解决安装&nbsp;&nbsp;</a>
								</th>
								<th id="thline" style="background-color: r#f8f8f8; width: 60%; border-bottom: 1px solid #e3e3e3; border-top: 1px solid #e3e3e3; border-left: 0px none;"></th>
							</tr>
							<tr style="border-bottom:none; border-top:none">
								<th height="10px" colspan="3"></th>
							</tr>
						</tbody>
					</table>
					<div id="tbftid" class="t1" style="display: none;">
						<table>
							<tbody>
								<tr style="font-family:regular;font-size:12px;background-color:#F8F8F8;text-align:center;">
									<td width="20%">安装产品</td>
									<td width="40%">
									帮你养车网覆盖城市 （
									<a target="_blank" style="color:#007fcc" href="">查看覆盖城市</a>
									）
									</td>
									<td width="40%">其他地区</td>
								</tr>
								<tr style="font-family:regular;font-size:12px;vertical-align:top;">
									<td height="135px" style="font-weight:bolder;vertical-align:top;text-align:center;">轮胎</td>
									<td>
										<ul>
											<li>帮你养车网配送人员直接配送,或者,委托第三方物流供应商送产品到达</li>
											<li>订单确认后48小时内发货，货物到达的时间以实际情况为准</li>
										</ul>
									</td>
									<td>
									<ul>
										<li>帮你养车网委托第三方物流供应商将产品运达您所在城市的物流集散地，您需要自行前往提货</li>
										<li>运费以实际情况为准</li>
										<li>部分城市,第三方物流供应商可以额外提供送货上门的服务，上门费另收</li>
										<li>订单确认后48小时内发货，货物到达的时间以实际情况为准</li>
										</ul>
									</td>
								</tr>
								<tr style="font-family:regular;font-size:12px;vertical-align:top;">
									<td height="135px" style="font-weight:bolder;vertical-align:top;text-align:center;">
										雨刷
										<br>
										滤清器
										<br>
										机油
									</td>
									<td>
										<ul>
											<li>帮你养车网配送人员直接配送,或者,委托第三方物流供应商送产品到达您指定的收货地址</li>
											<li>无需额外支付运费</li>
											<li>订单确认后48小时内发货，货物到达的时间以实际情况为准</li>
										</ul>
									</td>
									<td>
										<ul>
										<li>帮你养车网配送人员直接配送,或者,委托第三方物流供应商送产品到达您指定的收货地址</li>
										<li>运费以实际情况为准</li>
										<li>订单确认后48小时内发货，货物到达的时间以实际情况为准</li>
										</ul>
									</td>
								</tr>
								<tr style="font-family:regular;font-size:12px;">
									<td height="34px" style="font-weight:bolder;vertical-align:top;border-bottom: 1px solid #e3e3e3;">其他产品</td>
									<td style="border-bottom: 1px solid #e3e3e3;">
										请致电帮你养车网热线
										<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #007fcc;">400-665-8027</span>
										查询
									</td>
									<td style="border-bottom: 1px solid #e3e3e3;">
									请致电帮你热线
									<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #007fcc;">400-665-8027</span>
									查询
									</td>
								</tr>
							</tbody>
						</table>
						<span>
							欢迎致电帮你养车网热线
							<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #007fcc;">400-665-8027</span>
							进行详情查询。
						</span>
					</div>
					<div id="tbftid" class="t2" style="display: block;">
						<table>
							<tbody>
								<tr style="font-family:regular;font-size:12px;background-color:#F8F8F8;">
									<td width="20%"></td>
									<td width="40%">
									帮你养车网覆盖城市（
									<a target="_blank" style="color:#007fcc" href="<%=ctx%>/shoplist.jsp">查看覆盖城市</a>
									）
									</td>
									<td width="40%">其他地区</td>
								</tr>
								<tr style="font-family:regular;font-size:12px;">
									<td height="135px" style="font-weight:bolder;vertical-align:top;text-align:center;">轮胎</td>
									<td style="vertical-align:top;">
										<ul>
											<li>您就近选择一家帮你养车网连锁安装店，并预约到店安装时间</li>
											<li>您到店前，帮你养车网安装店已经为您准备好了产品、技工和安装设备</li>
											<li>
											您到店确认货品后，帮你养车网安装店会为您提供免费服务
											<!-- <br>
											安装费用：您无需额外支付安装费 -->
											</li>
										</ul>
									</td>
									<td style="text-align:center;">
										<ul>
											<li style="list-style-position:inside; text-align:center;">暂不提供安装服务</li>
										</ul>
									</td>
								</tr>
								<tr style="font-family:regular;font-size:12px;">
									<td height="135px" style="font-weight:bolder;vertical-align:top;text-align:center;">
										雨刷
										<br>
										滤清器
										<br>
										机油
									</td>
									<td style="vertical-align:top;">
										<ul>
											<li>您就近选择一家帮你养车网连锁安装店，并预约到店安装时间</li>
											<li>您到店前，帮你养车网安装店已经为您准备好了产品、技工和安装设备</li>
											<li>
											您到店确认货品后，帮你养车网安装店会为您提供安装服务
											<!-- <br>
											安装费用：您无需额外支付安装费
											</li> -->
										</ul>
									</td>
									<td style="text-align:center;">
										<ul>
										<li style="list-style-position:inside; text-align:center;">暂不提供安装服务</li>
										</ul>
									</td>
								</tr>
								
								<tr style="font-family:regular;font-size:12px;">
									<td height="34px" style="font-weight:bolder;vertical-align:top;text-align:center;border-bottom: 1px solid #e3e3e3;">其他产品</td>
									<td style="border-bottom: 1px solid #e3e3e3;">
										请致电帮你热线
										<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #007fcc;">400-665-8027</span>
										查询
									</td>
									<td style="text-align:center;border-bottom: 1px solid #e3e3e3;">
										请致电帮你养车网热线
										<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #007fcc;">400-665-8027</span>
										查询
									</td>
								</tr>
							</tbody>
						</table>
						<span>
							欢迎致电帮你养车网热线
							<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #007fcc;">400-665-8027</span>
							进行详情查询。
						</span>
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
function change1(){
	$(".cBar1").css("background-color", "white");
	$(".cBar1").css("border-bottom-color", "white");
	$(".cBar1").css("border-top", "2px solid #007fcc");
	$(".cBar2").css("background-color", "#F8F8F8");
	$(".cBar2").css("border-bottom", "1px solid #E3E3E3");
	$(".cBar2").css("border-top", "1px solid #E3E3E3");
	$("th.cBar1 a").css("color", "#007fcc");
	$("th.cBar2 a").css("color", "#3e3d3d");
	$("#thline").css("border-left", "0px");
	$(".t2").hide();
	$(".t1").show();
}
function change2(){
	$(".cBar2").css("border-top", "2px solid #007fcc");
	$(".cBar2").css("background-color", "white");
	$(".cBar2").css("border-bottom-color", "white");
	$(".cBar1").css("background-color", "#F8F8F8");
	$(".cBar1").css("border-bottom", "1px solid #E3E3E3");
	$(".cBar1").css("border-top", "1px solid #E3E3E3");
	$("th.cBar2 a").css("color", "#007fcc");
	$("th.cBar1 a").css("color", "#3e3d3d");
	$("#thline").css("border-left", "1px solid #E3E3E3");
	$(".t1").hide();
	$(".t2").show();	
}

</script>
</html>