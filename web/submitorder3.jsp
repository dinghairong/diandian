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
    String serialnumber = (String)session.getAttribute("paid_serialnumber");
    String total = (String)session.getAttribute("paid_total");
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－订单提交成功</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/submitorder3.css">
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
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection2.jsp" flush="true" />		

		<div id="bodySection" style="overflow: hidden;min-height:0;">
             <div class="yebz_cont fen_back">
                <div class="yebzc_cont">
                    <img src="images/yebz_cha.png"/>
                    <p class="yebzc_contp cheng">
                        您的费用不足！<br/>
                        <span>订单号：<%=serialnumber%>&nbsp;&nbsp;|&nbsp;&nbsp;应付金额：<font style="color: #ff551a;"><%=total%></font>元&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=ctx%>/corder.jsp?corder=1">查看清单</a></span>
                    </p>
                </div>
                <p class="yebz_contp">订单已提交，贵公司账号余额不足，请充值或使用支付宝付款。<br><br></p>
                <a href="javascript:void(0)" onclick="paidorder()" class="yebz_cont_jxfw">支付宝</a>
                <a href="<%=ctx%>/cwelcome.jsp" class="yebz_cont_jxfw">充值</a>
                <a href="<%=ctx%>/index.jsp" class="yebz_cont_jxfw">继续服务</a>
                <form name="alipayment" action="<%=ctx%>/alipayapi.jsp" method="post" target="_blank">
                    <input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no" value="<%=serialnumber%>">
                    <input type="hidden" name="WIDshow_url" id="WIDshow_url" value="">
                </form>
               
            </div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
 $(document).ready(function(){
    $('.yebz_jd .yebz_jd_cont div').attr('class','yebz_jd_contspan1');
});

function paidorder(){
    $("form[name='alipayment']").submit();
}

</script>
</html>