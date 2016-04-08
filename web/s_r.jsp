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
    DecimalFormat df_money=new DecimalFormat("######0.00");
    DateFormat df=new SimpleDateFormat("yyyy-MM-dd");

    NewsInfoDao areaDetailDao = (NewsInfoDao)SpringUtils.getBean(NewsInfoDao.class);
    OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
    List<NewsInfo> newsinfo_list = areaDetailDao.findNewInfoByServiceShop(shop_user.getId());
    List<Order> order_list = null;
    order_list = (List<Order>)request.getAttribute("order_by_year");
    if(null == order_list){
        order_list = orderDao.findOrderByServiceShopState(shop_user.getId());
    }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－商家门店－－门店对账</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/s_r.css">
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
							<a class="current" href="<%=ctx%>/sindex.jsp"  style="display:inline-block;">
								欢迎页
							</a>
                            <img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sOrderManage.jsp" style="display:inline-block;">订单管理</a>
                            <img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sHistoryOrder.jsp" style="display:inline-block;">历史订单</a>						
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sreconciliations.jsp" style="display:inline-block;background-color: #00688b;width:100%;">门店对账</a>
							
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
                        <div style="border: 2px solid #e8eef4;width: 500px;margin-right: auto;margin-bottom: 20px;font-size:14px;">
                            <%
                            double lineup = 0;
                            double linedown = 0;
                            double total = 0;
                            for(int i  = 0;i < order_list.size();i ++){
                                if(order_list.get(i).getPaidType().getId() == 1){
//                                    lineup = lineup + order_list.get(i).getPaid();
                                    lineup = lineup + order_list.get(i).getWeb_price() * order_list.get(i).getNumber();
                                }else{
//                                    linedown = linedown + order_list.get(i).getPaid();
                                    linedown = linedown + order_list.get(i).getWeb_price() * order_list.get(i).getNumber();
                                }
                            }
                            total = lineup + linedown;
                            %>
                            <div style="margin-left: 10px;margin-top: 20px;">
                                <span>线上订单总额：</span>
                                <span><%=df_money.format(lineup)%>元</span>
                            </div>
                            <div style="margin-left: 10px;">
                                <span>线下总额：</span>
                                <span><%=df_money.format(linedown)%>元</span>
                            </div>
                            <div style="margin-left: 10px;">
                                <span>总计订单金额：</span>
                                <span><%=df_money.format(total)%>元</span>
                            </div>
                            <div style="margin-left: 10px;margin-bottom: 20px;">
                                <span>实际返现：</span>
                                <span>0.00元</span>
                            </div>
                        </div>
                        <div style="text-align:center;float: right;margin-bottom: 10px; display: none;">
                            选择日期：
                            <select onchange="searchbyyear(this)">
                                <option>2013</option>
                                <option>2014</option>
                                <option>2015</option>
                                <option>2016</option>
                                <option>2017</option>
                                <option>2018</option>
                            </select>
                            年
                            <select style="margin-left:20px;" onchange="searchyearnum(this)">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                            </select>
                            年
                        </div>
                        <br>
                        <div id="OrderLists">
                            <form method="post" action="#">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>订单号</th>
                                            <th>服务类别</th>
                                            <th>服务名称</th>
                                            <th>订单时间</th>
                                            <!-- <th>预约时间</th> -->
                                            <th>订单总价</th>
                                            <th>服务数量</th>
                                            <th>订单状态</th>
                                            <!-- <th>订单说明</th> -->
                                            <th>客户名称</th>
                                            <!-- <th style="text-align:center;">对账状态</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        if(order_list.size() > 0){
                                            
                                            for(int i = 0;i < order_list.size();i ++){                                           
                                        %>                                      
                                        <tr>
                                            <td>
                                                <a href="javascript:void(0)"><%=order_list.get(i).getSerialnumber()%></a>
                                            </td>
                                            <td>
                                                <%=order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%>
                                            </td>
                                            <td>
                                                <%=order_list.get(i).getServiceProduct().getServiceProject().getName()%>
                                            </td>
                                            <td>
                                                <%=df.format(order_list.get(i).getCreatedTime())%>
                                            </td>
                                            <td>
                                                <%=df_money.format(order_list.get(i).getWeb_price() * order_list.get(i).getNumber()) %>
                                            </td>
                                            <td>
                                                <%=order_list.get(i).getNumber()%>
                                            </td>
                                            <td>
                                                <%if(order_list.get(i).getState() == 0){%>
                                                已下单
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 1){%>
                                                已付款
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 2){%>
                                                已使用
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 3){%>
                                                已评价
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 4){%>
                                                退款中
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 5){%>
                                                退款成功
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 6){%>
                                                退款失败
                                                <%}%>
                                                <%if(order_list.get(i).getState() == 7){%>
                                                已取消
                                                <%}%>
                                            </td>
                                            <td>
                                                <%if(null != order_list.get(i).getUser()){%>
                                                <%=order_list.get(i).getUser().getName()%>
                                                <%}else{
                                                    if(null != order_list.get(i).getCompany()){
                                                        String showname = "";
                                                        if(null != order_list.get(i).getCustomername() && order_list.get(i).getCustomername().length() > 0){
                                                            showname = order_list.get(i).getCustomername();
                                                        }else{
                                                            showname = order_list.get(i).getCompany().getCompany();
                                                        }
                                                %>
                                                    <%=showname%>
                                                <%
                                                    }
                                                }
                                                %>
                                            </td>                                                   
                                        </tr>
                                        <%
                                            }
                                        }else{
                                        %>
                                        <tr>
                                            <td colspan="10">没有相关订单</td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                                <br>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>

</body>
<script type="text/javascript">
function searchbyyear(obj){
    var year = obj.value;
    var sid = "<%=shop_user.getId()%>";
    window.location.href = "<%=ctx%>/former/getorderbyyeear?year=" + year + "&yearnum=0&status=1" + "&sid=" + vid;
}
function searchyearnum(obj){
    var yearnum = obj.value;
    var sid = "<%=shop_user.getId()%>";
    window.location.href = "<%=ctx%>/former/getorderbyyeear?yearnum=" + yearnum + "&year=''&status=1" + "&sid=" + vid;
}
</script>
</html>