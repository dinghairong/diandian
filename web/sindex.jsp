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
	NewsInfoDao areaDetailDao = (NewsInfoDao)SpringUtils.getBean(NewsInfoDao.class);
	OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
	List<NewsInfo> newsinfo_list = areaDetailDao.findNewInfoByServiceShop(shop_user.getId());
	List<Order> order_list = orderDao.findOrderByServiceShopAndState(shop_user.getId(),1);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮你养车网－－商家门店－－欢迎页</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/sindex.css">
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
						<%=shop_user.getTitle()%>&nbsp;&nbsp;欢迎您来到帮你养车网！
						您共计有<span style="color:#007fcc"><%=order_list.size()%></span>个未处理订单，请去<a href="<%=ctx%>/sOrderManage.jsp">订单管理</a>处理。
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
                          <a href="<%=ctx%>/index.jsp"><img alt="logo" src="images/logo.gif"></a>
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
					<div id="maincontent" style="position: relative;">
						<div style="border-bottom: 1px solid #999;">
							<label style="font-size: 26px;font-weight: bold">帮您养车网通知</label>
								<%if(newsinfo_list.size() > 5){%>
								<a title="更多>>>>" target="_blank" style="float: right; margin-right: 10px;font-size: 14px;" href="<%=ctx%>/smorenews.jsp">更多>></a>
								<%}%>
							
						</div>
						<div style="font-size: 14px">
							<%
							boolean hasnew = false;
							int shownum = 5;
							if(newsinfo_list.size() < 5){
								shownum = newsinfo_list.size();
							}
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							for(int i = 0;i < shownum;i ++){
								if(newsinfo_list.get(i).getInfoClass().getName().equals("系统通知")){
									hasnew = true;
									String title = newsinfo_list.get(i).getTitle();
									String isread = "";
									if(null != title && title.length() > 9){
										title = title.substring(0,9) + "...";
									}
									if(newsinfo_list.get(i).getIsread() == 1){
										isread = "<span>[已读]</span>";
									}else{
										isread = "<span style='color:red'>[未读]</span>";
									}
							%>
								<ul class="hongxi_news_info">
									<li class="hongxi_news_tetle">
										<a title="<%=newsinfo_list.get(i).getTitle()%>" target="_Blank" href="<%=ctx%>/former/getnewinfo?wid=<%=newsinfo_list.get(i).getId()%>" style="color: gray">
											<%=isread%><%=title%> 
										</a>
										<span style="float: right; margin-right: 10px;">
											发布日期：<%=sdf.format(newsinfo_list.get(i).getCreatedtime())%>来源：帮您养车网
										</span>	
									</li>												
								</ul>
							<%
								}
							}
							if(!hasnew){
							%>
							目前没有任何通知！
							<%
							}
							%>
							
						</div>
						<div style="position: relative;top: 20px;">
							<div style="text-align: center; font-size: 30px;font-weight: bold">
								帮您养车网公告
							</div>
							<div style="font-size: 28px;">
								<%
								boolean hasinfo = false;
								for(int i = 0;i < newsinfo_list.size();i ++){
									if(newsinfo_list.get(i).getInfoClass().getName().equals("系统提示")){
										hasinfo = true;
								%>
										&nbsp;&nbsp;&nbsp;&nbsp;<%=newsinfo_list.get(i).getContent()%>
								<%
									}
								}
								if(!hasinfo){
								%>
								&nbsp;&nbsp;目前没有任何公告！
								<%
								}
								%>
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

});

</script>
</html>