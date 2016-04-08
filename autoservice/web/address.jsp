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
    <title>帮您养车网－－安装改装</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/address.css">
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
						<a href="/Order/MyOrder.html">我的订单</a>
						<a href="/PromotionCode/Index.html ">我的优惠券</a>
						<a href="/Car/CarIndex.html">我的车型库</a> -->
						<h5>账户中心</h5>
						<a class="current" href="/Account/UserInfo.html">基本信息</a>
						<a href="/Addresses/List.html">收货地址管理</a>
						<a href="/Account/updatePassword.html">修改密码</a>
					</div>
				</div>
			</div>
			<div class="r_content">
				<div class="user_address NewW750" style="">
					<a id="iconButton" href="/Addresses/Edit.html">
						<div class="address_title">
							<div class="div1">
								<img src="http://resource.tuhu.cn/Image/UserCenter/plus.png">
							</div>
							<div style="width: 100px;float: left;">
								<span id="sp2" class="add_address" style="color:#72a114;margin-left: 5px;">添加新地址</span>
							</div>
						</div>
					</a>
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