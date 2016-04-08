<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	ServiceShop shop_user = (ServiceShop)session.getAttribute("shopuser");
	if(session.getValue("shopuser") == null){
		response.sendRedirect(ctx + "/logout.jsp");
		return;
	}
	NewInfoDao areaDetailDao = (NewInfoDao)SpringUtils.getBean(NewInfoDao.class);
	OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
	List<NewsInfo> newsinfo_list = areaDetailDao.findNewInfoByServiceShop(shop_user.getId());
	List<Order> order_list = orderDao.findOrderByServiceShopAndState(shop_user.getId(),1);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－商家门店－－欢迎页</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/smorenews.css">
	 <link href="images/favicon.ico" rel="shortcut icon"/>

    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
</head>
<body>
	<div class="all" id="all">
		<div id="headSection">
			<div id="topBar">
				<div class="container_24">
					<div class="grid_10 left">
						<%=shop_user.getTitle()%>欢迎您来到帮你养车网！
						您共计有<span style="color:#007fcc"><%=order_list.size()%></span>个未处理订单，请去<a href="<%=ctx%>/sOrderManage.jsp.jsp">订单管理</a>处理。
					</div>
					<div class="grid_11 right">
						亲爱的商户<b><span style="color:#00688b;"><%=shop_user.getPhone()%></span></b>欢迎登录 [<a href="<%=ctx%>/logout.jsp" style="color:#08c">退出</a>]
					</div>
				</div>
			</div>
			<div id="midBar">
				<div class="container_24">
					<div class="grid_4">
						<div class="logo">
							<div class="logo_cont">
								帮您养车网
								<br>
								<span>专注汽车服务</span>
							</div>
						</div>
					</div>		
					<span style="margin-left:40px;font-size: 20px;position: absolute;top: 70px;">门店商家管理系统</span>
				</div>
			</div>
			<div id="naviBar">
				<div class="container_24">			
					<div id="itemNavi">
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sindex.jsp"  style="background-color: #00688b">
								欢迎页
							</a>
						</div>
						<div class="grid_2">
							<a class="current clickbackground" href="<%=ctx%>/sOrderManage.jsp" style="display:inline-block;">订单管理</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sHistoryOrder.jsp" style="display:inline-block;">历史订单</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/s_r.jsp" style="display:inline-block;">门店对账</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sManage.jsp" style="display:inline-block;">门店管理</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="bodySection" style="overflow: hidden;min-height:0;">
			<div class="container_24">
				<div id="main">
					<div id="maincontent" style="padding-left: 20px; position: relative;">
						<h2>帮您养车通知列表</h2>
						<table>
							<tbody>
								<tr>
									<th>主题</th>
									<th>内容</th>
									<th>时间</th>
								</tr>
								
								<tr>
									<td>xxxx</td>
									<td>
										<a target="_blank" href="#" title="xxx" style="color: gray">
											xxxx
										</a>
									</td>
									<td>xxx</td>
								</tr>
								<%
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								for(int i = 0;i < newsinfo_list.size();i ++){
									if(newsinfo_list.get(i).getInfoClass().getName().equals("系统通知")){
									String content = newsinfo_list.get(i).getContent();
									String isread = "";
									if(null != content && content.length() > 50){
										content = content.substring(0,50) + "...";
									}else{
										content = "";
									}
									if(newsinfo_list.get(i).getIsread() == 1){
										isread = "<span>[已读]</span>";
									}else{
										isread = "<span style='color:red'>[未读]</span>";
									}
								%>
								<tr>
									<td><%=newsinfo_list.get(i).getTitle()%></td>
									<td>
										<a target="_blank" href="#" title="<%=newsinfo_list.get(i).getContent()%>" style="color: gray">
											<%=isread%><%=newsinfo_list.get(i).getContent()%> 
										</a>
									</td>
									<td><%=sdf.format(newsinfo_list.get(i).getUpdatetime())%></td>
								</tr>
								<%
									}
								}
								%>
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

</script>
</html>