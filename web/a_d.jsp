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
							<a href="<%=ctx%>/a_d.jsp" style="line-height: 45px;" class="title_select">广告与市场合作</a>
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
								<th style="background-color:white;width:8%; height:38px;border-top:2px solid #007fcc;">
									<a style="color:#007fcc;">&nbsp;&nbsp;广告与市场合作&nbsp;&nbsp;</a>
								</th>
								<th style="border-left:1px solid #E3E3E3;background-color:#F8F8F8;width:25%;border-top:1px solid #E3E3E3;border-bottom:1px solid #E3E3E3;height:38px;" colspan="2"></th>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td style="border-top:none;padding-bottom:30px;padding-top:20px;">
									    一个极具发展潜力的汽车服务O2O平台，
									<br>							
									    一家拥有20多年线下连锁经销运作经验的企业，
									<br>
									一种全新的线上线下同步推进的方式，
									<br>
									一项全方位解决供应链通路、覆盖售前售中售后的模式，
									<br>
									    开放合作迎来无限可能，
									<br>
										无论作为消费者、零售店或者是供应商的您，还在等什么？
									<br>
									<br>
									    客服电话：
									<span style="color: #2C59B8;">400-665-8027</span>
									<br>
									<br>
									    门店合作：
									<br>
									    请到官网首页右上角点击“门店入驻”，热情的工作人员会协助您加入我们
									<br>
									<br>
									    商务合作
									<br>
									    联系人：陈先生
									<br>							    
									    联系电话：
									<span style="color: #2C59B8;">021-39501956</span>
									<br>
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

</script>
</html>