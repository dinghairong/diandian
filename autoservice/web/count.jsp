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
	Company company = (Company)session.getAttribute("company");
    if(company == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－企业用户－－统计</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/count.css">
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
		<div id="bodySection" style="overflow: hidden;min-height:0;">
            <div class="qyyh_lsddAll">
                <div class="qyyh_lsdd">
                    <div class="nav">
                        <a href="<%=ctx%>/cwelcome.jsp">欢迎页</a>
                        <a href="<%=ctx%>/cselect.jsp">服务选购</a>
                        <a href="<%=ctx%>/corder.jsp">消费订单管理</a>
                        <a href="<%=ctx%>/caccount.jsp">账号管理</a>
                        <a href="<%=ctx%>/count.jsp" style="border-right: 0!important;" class="on">统计</a>
                    </div>

                     <div class="tjall">
                        <div class="tjall_one">
                            <p>服务及消费统计</p>
                            <span>选择年份：</span>
                            <select>
                                <option>2015</option>
                            </select>
                        </div>
                        <h4>2015年服务统计</h4>
                        <!--饼图-->
                        <div class="pie">
                            <div class="pie_cycle">
                                <img src="<%=ctx%>/former/getpieimage.do?year=2015">
                            </div>
                            <div class="pie_tongji" style="display:none">
                                <p>
                                    <a class="lan"></a>
                                    <span>已购买</span>
                                </p>
                                <p>
                                    <a class="lv"></a>
                                    <span>已发送</span>
                                </p>
                                <p>
                                    <a class="cheng"></a>
                                    <span>未发送</span>
                                </p>
                            </div>
                        </div>
                        <!--END饼图-->

                        <h4 class="h4_two">2015年消费量统计</h4>
                        <!--折线图-->
                        <div class="lineChart">
                            <img src="<%=ctx%>/former/getlineimage.do?year=2015">
                        </div>
                        <p class="lineChartp" style="display:none">
                            <span><a class="lv"></a>服务发送量</span>
                            <span class="dier"><a class="cheng"></a>服务发送量</span>
                        </p>
                        <!--END折线图-->
                    </div>
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

</script>
</html>