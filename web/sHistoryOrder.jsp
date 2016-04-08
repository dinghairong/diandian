<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.util.TextUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	ServiceShop shop_user = (ServiceShop)session.getAttribute("shopuser");
    if(session.getValue("shopuser") == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }

    String pageIndex = request.getParameter("pageIndex");
    pageIndex = TextUtils.isEmpty(pageIndex) ? "0" : pageIndex;
    int pageSize = 10;
    int iPageIndex = Integer.parseInt(pageIndex);

    NewsInfoDao areaDetailDao = (NewsInfoDao)SpringUtils.getBean(NewsInfoDao.class);
    OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
    List<NewsInfo> newsinfo_list = areaDetailDao.findNewInfoByServiceShop(shop_user.getId());
//    List<Order> order_list = orderDao.findOrderByServiceShop(shop_user.getId());
    List<Order> order_list = orderDao.findOrderByServiceShopAndPage(shop_user.getId(), pageSize, pageSize * iPageIndex);
    int countMax = (int) orderDao.countOrdersServiceShop(shop_user.getId());
    int total_page = 1;
    if(order_list.size() > 10){
        if(order_list.size() % 10 != 0){
            total_page = order_list.size() / 10 + 1;
        }else{
            total_page = order_list.size() / 10;
        }
    }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－商家门店－－历史订单</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/sHistoryOrder.css">
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
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sHistoryOrder.jsp" style="display:inline-block;background-color: #00688b;width:100%;">历史订单</a>						
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
                        <h2> 历史订单</h2>
                        <div>
                            <div>
                                <div>
                                    订单日期选择： 
                                    <label>
                                        <input type="radio" checked="checked" value="All" name="deliveryDate">
                                        <span>全部</span>
                                    </label>
                                    <label>
                                        <input type="radio" value="LastOneWeek" name="deliveryDate">
                                        <span>近一个星期</span>
                                    </label>
                                    <label>
                                        <input type="radio" value="LastoneMonth" name="deliveryDate">
                                        <span>近一个月</span>
                                    </label>
                                    <label>
                                        <input type="radio" value="LastThreeMonth" name="deliveryDate">
                                        <span>近三个月</span>
                                    </label>
                                </div>
                                <div style="height: 20px;"> </div>
                                <div>
                                    <input id="UserName" type="text" placeholder="输入客户名称或电话" value="" name="UserName">
                                    <input id="OrderProducts" type="text" placeholder="输入产品名字包含内容" value="" name="OrderProducts">
                                    <span>订单状态：</span>
                                    <select id="OrderStatus" name="OrderStatus">
                                        <option value="8" selected>全部</option>
                                        <option value="0">已提交</option>
                                        <option value="1">已付款</option>
                                        <option value="2">已使用</option>
                                        <option value="3">已评价</option>
                                        <option value="4">退款中</option>
                                        <option value="5">退款成功</option>
                                        <option value="6">退款失败</option>
                                        <option value="7">已取消</option>
                                    </select>
                                    <span>金额：</span>
                                    <input type="text" style="width:60px;" value="" name="SumMoney">
                                    <span>订单主人：</span>
                                    <select id="Owner" name="Owner">
                                        <option value="0" selected>全部</option>
                                        <%
                                        for(int i = 0;i < order_list.size();i ++){
                                            String showname = "";
                                            if(null != order_list.get(i).getUser()){
                                                showname = order_list.get(i).getUser().getName();
                                            }else{
                                                if(null != order_list.get(i).getCompany()){
                                                    showname = order_list.get(i).getCompany().getCompany();
                                                }
                                            }
                                        %>                                      
                                        <option value="<%=showname%>"><%=showname%></option>                                        
                                        <%}%>
                                        
                                    </select>
                                    <span>订单类型：</span>
                                    <select id="orderType" name="orderType">
                                        <option value="0" selected>全部</option>
                                        <option value="1">安装服务</option>
                                        <option value="3">快修保养</option>
                                        <option value="5">美容装潢</option>
                                        <option value="7">检测修正</option>                                        
                                    </select>
                                    <input id="Search" type="submit" value="搜索" name="Search" onclick="searchHistoryBySome()">
                                    <input id="nowpageNumber" type="hidden" value="1" name="nowageNumber">
                                    <input id="totalpageNumber" type="hidden" value="<%=total_page%>" name="totalageNumber">
                                    <input id="search" type="hidden" value="" name="search">
                                    <input id="totalCount" type="hidden" name="totalCount" value="58">                                   
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
                                                    <th>订单总价</th>
                                                    <th>服务数量</th>
                                                    <th>订单状态</th>
                                                    <th>客户名称</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                if(order_list.size() > 0){
                                                    DecimalFormat df_money=new DecimalFormat("######0.00");
                                                    DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
                                                    int shownum = 10;
                                                    if(order_list.size() < shownum){
                                                        shownum = order_list.size();
                                                    }
                                                    String status = "已下单";

                                                    for(int i = 0;i < shownum;i ++){
                                                        int st = order_list.get(i).getState();
                                                        if (st == 0) {
                                                            status = "已下单";
                                                        } else if (st == 1) {
                                                            status = "已付款";
                                                        } else if (st == 2) {
                                                            status = "已使用";
                                                        } else if (st == 3) {
                                                            status = "已评价";
                                                        } else if (st == 4) {
                                                            status = "退款中";
                                                        } else if (st == 5) {
                                                            status = "退款成功";
                                                        } else if (st == 6) {
                                                            status = "退款失败";
                                                        }
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
                                                        <%=df_money.format(order_list.get(i).getWeb_price() * order_list.get(i).getNumber())%>
                                                    </td>
                                                    <td>
                                                        <%=order_list.get(i).getNumber()%>
                                                    </td>
                                                    <td>
                                                        <%= status %>
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
                                        <div style="text-align:center">
                                            <input id="FirstPage" class="ui-button ui-widget ui-state-default ui-corner-all" type="button" value="首页" name="pages" role="button" onclick="getserviceshopbypage(0)">
                                            <input id="PrevPage" class="ui-button ui-widget ui-state-default ui-corner-all" type="button" value="上一页" name="pages" role="button" onclick="getserviceshopbypage(-1)">
                                            <input id="NextPage" class="ui-button ui-widget ui-state-default ui-corner-all" type="button" value="下一页" name="pages" role="button" onclick="getserviceshopbypage(1)">
                                            <label style="font-weight:bold;">&nbsp;第<%= iPageIndex + 1 %>页&nbsp;&nbsp;总数量：<span id="total_booking"><%=countMax%></span> 单</label>
                                        </div>
                                    </form>   
                                </div>
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
function getserviceshopbypage(num){
    var p_index = <%= iPageIndex %>;
    var max = <%= countMax %>
    max = max / 10;
    p_index += num;

    if (p_index >= max) return;

    if (p_index < 0) p_index = 0;
    window.location.href = num == 0? "/sHistoryOrder.jsp" : "/sHistoryOrder.jsp?pageIndex=" + p_index;

    <%--var nowpage = Number($('#nowpageNumber').val());--%>
    <%--var totalpage = Number($('#totalpageNumber').val());--%>
    <%--var showpage = 0;--%>
    <%--var pagenumber = 0;--%>
    <%--if(num != 0){--%>
        <%--showpage = nowpage + num;--%>
        <%--pagenumber = (showpage - 1) * 10;--%>
    <%--}else{--%>
        <%--if(nowpage == 1){--%>
           <%--return false; --%>
        <%--}--%>
        <%--showpage = 1;--%>
        <%--pagenumber = 0;--%>
    <%--}--%>
    <%--if(showpage > totalpage || showpage <= 0){--%>
        <%--return false;--%>
    <%--}else{--%>
        <%--$("#FirstPage")[0].disabled = "";--%>
        <%--$("#PrevPage")[0].disabled = "";--%>
    <%--}--%>

    <%--var uri = "<%=ctx%>/browser/orderbypage?pagenumber=" + pagenumber;--%>
    <%--$.ajax({--%>
        <%--url: uri,--%>
        <%--type: "post",--%>
        <%--dataType: "JSON",--%>
        <%--async: false,--%>
        <%--timeout: 3000,--%>
        <%--success: function(ret){--%>
            <%--$('#nowpageNumber').val(showpage);--%>
            <%--$('#OrderLists tbody').html(ret.html);--%>
        <%--},--%>
        <%--error: function(XMLRequest, textInfo){--%>
            <%--if(textInfo != null){--%>
                <%--alert(textInfo);--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>
}

function searchHistoryBySome(){
    var deliveryDate = "";
    var userName = encodeURI(encodeURI($('#UserName').val()));
    var orderProducts = encodeURI(encodeURI($('#OrderProducts').val()))
    var orderStatus = encodeURI(encodeURI($('#OrderStatus').val()));
    var sumMoney = encodeURI(encodeURI($("input[name='SumMoney']").val()));
    var owner = encodeURI(encodeURI($('#Owner').val()));
    var orderType = encodeURI(encodeURI($('#orderType').val()));
    for(var i  = 0;i < $("input[name='deliveryDate']").length;i ++){
        if($("input[name='deliveryDate']")[i].checked){
            deliveryDate = i;
        }
    }
    var uri = "<%=ctx%>/former/getorderbysome?sid=<%=shop_user.getId()%>&deliveryDate=" + deliveryDate + "&userName=" + userName + "&orderProducts=" + orderProducts + "&orderStatus=" + orderStatus + "&sumMoney=" + sumMoney + "&owner=" + owner + "&orderType=" + orderType;
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            $('#OrderLists tbody').html(ret.html);
            $('#total_booking').html(ret.total);    
            $("#FirstPage")[0].disabled = "disabled";
            $("#PrevPage")[0].disabled = "disabled";
            $("#NextPage")[0].disabled = "disabled";
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
</script>
</html>