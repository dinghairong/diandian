<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.alipay.util.UtilDate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	Company company = (Company)session.getAttribute("company");
    if(company == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }
    DecimalFormat df=new DecimalFormat("######0.00");
    OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
    List<Order> order_list = orderDao.findOrderByCompanyAndState(company.getId());
    double total_money = 0;
    double total_month = 0;
    for(int i = 0;i < order_list.size();i ++){
        total_money = total_money + order_list.get(i).getPaid();
    }

    List<Order> order_month = orderDao.findOrderByCompanyAndMonthAndState(company.getId());
    for(int i = 0;i < order_month.size();i ++){
        total_month = total_month + order_month.get(i).getPaid();
    }
    String balance = "0";
    if(null != company.getBalance() && company.getBalance().length() > 0){
        balance = company.getBalance();
    }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮你养车网－－企业用户－－欢迎页</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/cwelcome.css">
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
        var ctx = "<%=ctx%>";
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
        <div class="top_line"></div>
		<div id="bodySection" style="overflow: hidden;min-height:0;">
            <div class="qyyh_lsddAll">
                <div class="qyyh_lsdd">
                    <div class="nav">
                        <a href="<%=ctx%>/cwelcome.jsp" class="on">欢迎页</a>
                        <a href="<%=ctx%>/cselect.jsp">服务选购</a>
                        <a href="<%=ctx%>/corder.jsp">消费订单管理</a>
                        <a href="<%=ctx%>/caccount.jsp">账号管理</a>
                        <a href="<%=ctx%>/count.jsp" style="border-right: 0!important;">统计</a>
                    </div>

                    <p class="qyyh_wc_titlt">欢迎光临，<%=company.getCompany()%> !</p>
                    <ul class="qyyh_wc">
                        <li class="hBack">
                            <span>您的累积消费金额为：<font style="font-size: 16px;color: #ff551a;">¥<%=df.format(total_money)%></font></span>
                            <a href="<%=ctx%>/corder.jsp">查看详情</a>
                        </li>
                        <li>
                            <span>您的当月消费金额为：<font style="font-size: 16px;color: #ff551a;">¥<%=df.format(total_month)%></font></span>
                            <a href="<%=ctx%>/corder.jsp">查看详情</a>
                        </li>
                        <!-- <li class="hBack">
                            <span>我们已赠送您<font style="font-size: 16px;color: #ff551a;">9</font>次汽车服务</span>
                            <a>查看详情</a>
                        </li> -->
                        <li>
                            <span>您的账户余额为：<font style="font-size: 16px;color: #ff551a;">¥<%=df.format(Double.parseDouble(balance))%></font></span>
                            <a id="gotochozhi" class="qyyh_wclia" onclick="chongzhi()" href="javascript:void(0)">去充值</a>
                            <div id="chozhi" style="display:none;float:right;">                        
                                <input type="text" id="prepaid" style="height:30px;" name="prepaid" value="">
                                <input type="button" class="qyyh_wclia" value="充值" onclick="gochozhi()"> 
                                <input type="button" class="qyyh_wclia" value="返回" onclick="closechozhi()">
                            </div>
                            <form name="alipayment" action="<%=ctx%>/alipayapi.jsp" method="post" target="_blank">
                                <input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no" value="HX<%=UtilDate.getOrderNum()%>">
                                <input type="hidden" name="WIDshow_url" id="WIDshow_url" value="">
                                <input type="hidden" name="paidmoney" id="paidmoney" value="">
                                <input type="hidden" name="isPrepaid" id="isPrepaid" value="true">
                            </form>
                            <a href="" id="gotoapi"></a>
                        </li>
                        <li>
                            <a href="/cAgreement.jsp">查看协议</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();
});

function chongzhi(){
    $("#gotochozhi").hide();
    $("#chozhi").show();
}
function closechozhi(){
    $("#chozhi").hide();
    $("#gotochozhi").show();
}
function gochozhi(){
    var money = $('#prepaid').val();
    if(money.length == 0){
        sAlert("");
        return false;
    }
    $("#paidmoney").val(money);
    $("form[name='alipayment']").submit();
}
</script>
</html>