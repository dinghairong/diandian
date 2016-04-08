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
							<a href="<%=ctx%>/a_d.jsp" style="line-height: 45px;">广告与市场合作</a>
						</div>
						<div class="title_list_div1">
							<a href="#javascript:void(0)" style="line-height: 45px;">招贤纳士</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_e.jsp" style="line-height: 45px;" class="title_select">我要投诉</a>
						</div>
					</div>	
				</div>
			</div>
			<div id="context" style="overflow: hidden;">
				<div class="grid_19">
					<table>
						<tbody>
							<tr style="border-top: 2px solid #007fcc;">
								<td>
									<span style="font-weight:bolder;">亲爱的帮你养车网用户：</span>
									<br>
									当您打开此页面的时候，我们深感愧疚，我们将尽全力帮您解决问题。同时也对您表示感谢，相信您对帮你养车网的成长有所指点和帮助！
									<p>
									无论任何投诉, 请致电帮你养车网免费热线<span style="font-weight:bolder;color:red"> 400-665-8027</span>
									<br>
									我们的工作时间是：
									<br>
									周一至周日 8:00-24:00
									</p>							
									<p>最后，我们对您不完美的购物体验及不悦表示深深的歉意！感谢您的宽容，理解及对我们积极的帮助！我们会更加努力，为您呈上更专业更完美的服务！</p>
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