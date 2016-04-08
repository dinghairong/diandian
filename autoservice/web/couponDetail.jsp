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
CouponDao cpDao =(CouponDao) SpringUtils.getBean(CouponDao.class);


int cid = Integer.parseInt(request.getParameter("ids"));
Coupon cou = cpDao.findCouponById(cid);
SmartProperties smartProp = SmartProperties.getInstance();
String imgPath = smartProp.getImgPath();
SimpleDateFormat  df = new SimpleDateFormat("yyyy年MM月dd日");
String createdDay = df.format(cou.getCreatedTime());

Calendar calendar = Calendar.getInstance();
calendar.setTime(cou.getCreatedTime());
calendar.add(calendar.DAY_OF_MONTH, cou.getExprieDays());
String endDay = df.format(calendar.getTime());

int charge = cou.getChargeAmount();
 %>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>汽车服务网--优惠券详情</title>
<link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
<link href="images/favicon.ico" rel="shortcut icon"/>

<script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.tabso_yeso.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/common.js"></script>
<style type="text/css">
.top_line{
	border-top: 2px solid #007fcc;
}
</style>


</head>
.

<body>
	<div id = "all" >
		<jsp:include page="headSection.jsp"  flush="true"/>
		<script type="text/javascript">
			//jquery(".daohang").hide();
			$('.lunbo').hide();
		</script>
	<!-- 	<div class="top_line"></div> -->
		<div class="top_line"   style="padding-left:250px">
			<h3 style="margin-top:20px;margin-bottom:20px;">优惠券使用详情</h3>
		</div><hr/>
		<div id="bodySection" >
			<div id="photo" style="float:left;width:40%">
				 <%
                if(null != cou.getImage() && cou.getImage().length() > 0){
                %>
                	<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + cou.getPath()%>&imageName=<%=cou.getImage()%>"/>
                <%
                }else{
                %>
                <img src="<%=ctx%>/images/youhui.jpg">
                <%
                }
                %>  
			</div>
			<div id="content" style="float:right;width:60%">
				<div style="padding:12px;font-size:20px"><span style="color:#007fcc">有效日期:</span>&nbsp&nbsp&nbsp<%=createdDay%>&nbsp至&nbsp<%=endDay%></div>
				<div style="padding:12px;font-size:20px"><span style="color:#007fcc">领取限制:</span>&nbsp&nbsp&nbsp每充值<%=charge%>元可获得<%=cou.getNum() %>张面值<%=cou.getMoney() %>的优惠券</span></div>
				<div style="padding:12px;font-size:20px"><span style="color:#007fcc">使用规则:</span>&nbsp&nbsp&nbsp消费满<%=cou.getConsumeAmount() %>元可用<span style="color:red">（每次消费仅限一张，不可叠加）</span></span></div>
	
			</div>
			<div style="align:center;padding-top:170px;padding-left:400px"><a href ="index.jsp" method="get">
			<!-- <div style="background:#C0FF3E;width:102px;align:center"><h3>立即使用</h3></div> -->
			</a></div>
	
			 <jsp:include page="footSection.jsp" flush="true" />
        	<div id="scroll_Top" class="scroll_Top" onClick="$.$w.windowScroll(0);">
            <img src="images/fanhuil.png" width="30px"/>
        </div>
		</div>
		
	</div>
</body>
</html>