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
	User user = (User)session.getAttribute("user");

    if(user == null){
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
	<link rel="stylesheet" href="<%=ctx%>/css/submitorder1.css">
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
			<div class="tjcg_cont lv_back nbj nbk_hui">
                <img src="images/tjcg_gou.png" class="tjcg_contimg"/>
                <p class="tjcg_cont_p">
                    订单提交成功，请您尽快付款！<br/>
                    <span>订单号：<%=serialnumber%>&nbsp;&nbsp;|&nbsp;&nbsp;应付金额：<font style="color: #ff551a;"><%=total%></font>元&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=ctx%>/profile.jsp">查看清单</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=ctx%>/index.jsp">返回继续购物</a></span>
                </p>
            </div>

            <div class="tjcg_cont lv_back_fen nbj_zf nbk_fen" style="margin-top: 35px;">
                <p class="tjcg_fen_p">
                    立即支付<font style="color: #ff551a;"><%=total%></font>元，即可完成订单。请您在提交订单后<font style="color: #ff551a;">24小时</font>内完成支付，否则订单会自动取消。
                </p>
                <ul class="zhifu">
                    <li>
                        <img src="images/zffs_logo.png"/>
                        <p class="zhifulip">支付宝在线支付</p>
                        <span class="zhifulispan">支付金额（元）：<font style="color: #ff551a;"><%=total%></font></span>
                    </li>
                </ul>
                <form name="alipayment" action="<%=ctx%>/alipayapi.jsp" method="post" target="_blank">
                    <input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no" value="<%=serialnumber%>">
                    <input type="hidden" name="WIDshow_url" id="WIDshow_url" value="">
                </form>
                <a href="javascript:void(0)" onclick="paidorder()" class="tjcg_ljzf">立即支付</a>
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