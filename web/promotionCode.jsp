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

	DecimalFormat df=new DecimalFormat("######0.00");
    DateFormat d_f=new SimpleDateFormat("yyyy-MM-dd");
	UserCouponDao userCouponDao = (UserCouponDao)SpringUtils.getBean(UserCouponDao.class);

	List<UserCoupon> coupon_list = userCouponDao.findUserCouponByUserAndStatus(user.getId(),0);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－用户中心－－我的优惠券</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/promotionCode.css">
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
				<span class="s1"> ></span>
				<span>我的优惠券</span>
			</div>
			<div class="uc_content_Navi">
				<div class="leftNavi">
					<div>
						<h5 class="title_top">订单中心</h5>
						<a href="<%=ctx%>/myorder.jsp">我的订单</a>
						<!-- <a class="current" href="<%=ctx%>/promotionCode.jsp">我的优惠券</a> -->
						<a class="current" href="<%=ctx%>/mycart.jsp">我的服务车</a>
						<a href="/Car/CarIndex.html">我的车型库</a> -->
						<h5>账户中心</h5>
						<a href="<%=ctx%>/userinfo.jsp">基本信息</a>
						<!-- <a href="/Addresses/List.html">收货地址管理</a> -->
						<a href="<%=ctx%>/updatePassword.jsp">修改密码</a>
					</div>
				</div>
			</div>
			<div class="r_content">
				<div class="order_data w776" style="border-bottom:none;">
					<div class="order_tab2 w143">
						<a class="act_tab2" href="<%=ctx%>/promotionCode.jsp">未使用的优惠券</a>
						<a class="a" href="<%=ctx%>/promotionCode2.jsp">已使用的优惠券</a>
						<a class="a" href="<%=ctx%>/promotionCode3.jsp">已过期的优惠券</a>
					</div>
					<div style="background-color:#FFFFFF;width:100%;height:10px"></div>
					<table class="order_tbg" width="750" cellspacing="0" cellpadding="0" style="border-left:none;border-right:none">
						<tbody>
							<tr>
								<td class="td" width="140" valign="middle" align="center">优惠券编号</td>
								<td class="td" width="238" valign="middle" align="center">名称</td>
								<td class="td" width="147" valign="middle" align="center">面值</td>
								<td class="td" width="100" valign="middle" align="center">使用金额限制</td>
		<!-- 						<td class="td" width="100" valign="middle" align="center">限用品类</td> -->
								<td class="td" valign="middle" align="center">有效期</td>
							</tr>
							<%
							if(coupon_list.size() > 0){
								int num = 10;
								if(coupon_list.size() < 10){
									num = coupon_list.size();
								}
								for(int i = 0;i < num;i ++){
							%>
							<tr>
								<td>
									<%=coupon_list.get(i).getSerialnumber()%>
								</td>
								<td>
									<%=coupon_list.get(i).getCoupon().getTitle()%>
								</td>
								<td>
									<%=df.format(coupon_list.get(i).getCoupon().getMoney())%>
								</td>
								<td>
									<%=coupon_list.get(i).getCoupon().getChargeAmount()%>
								</td>
								<td>
									<%=d_f.format(coupon_list.get(i).getExprieDate())%>
								</td>
							</tr>
							<%
								}
							}
							%>
						</tbody>
						</table>
					<table class="order_content2 ntp" width="930" cellspacing="0" cellpadding="0"> </table>
				</div>
				<div class="page_count">
					<div class="div">
						关于订单有任何问题敬请拨打帮你养车网热线
						<span style="color:#007fcc;float:none;display:inline;font-weight:900">400-665-8027</span>
					</div>
					<a class="np" href="#"></a>
					<a class="pp" href="#"></a>
				</div>
				<div class="c_tip" style="font-family:'宋体'">
					<br>
					<ul class="ul">
						<li style="list-style: none;margin-left: 25px;margin-bottom:20px">温馨提示：</li>
						<li>优惠劵只能用于提交订单时抵扣应付商品金额（不能支付运费），不能进行兑现或其他用途。</li>
						<li>一个订单只能使用一张优惠劵，每张优惠劵只能使用一次。</li>
						<li>本优惠劵最终解释权归帮你养车网所有。</li>
					</ul>
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