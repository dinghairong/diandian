<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.UsersDao" %>
<%@ page import="com.smart4c.dao.ServiceProductDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.alipay.util.UtilDate" %>
<%@ page import="com.smart4c.dao.ServiceShopDao" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.smart4c.dao.OrderDao" %>

<%
  String ctx = request.getContextPath();
  UsersDao usersDao = (UsersDao) SpringUtils.getBean(UsersDao.class);
  User user = (User)session.getAttribute("user");
  String userIdChubao = user.getUserExternal().getUserId();
  JSONObject json =(JSONObject)request.getAttribute("jsonObj");
  OrderDao orderDao = (OrderDao) SpringUtils.getBean(OrderDao.class);
  Order order = orderDao.findOrderById((Integer)json.get("orderId"));


%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>去付款</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="<%=ctx %>/assets/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="<%=ctx %>/assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="<%=ctx %>/assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="<%=ctx %>/assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
  <!--
  <link rel="canonical" href="http://www.example.com/">
  -->

  <link rel="stylesheet" href="<%=ctx %>/assets/css/amazeui.min.css">
  <link rel="stylesheet" href="<%=ctx %>/assets/css/app.css">
  <style type="text/css">
body{ background:#eee; margin-top:-10px;}
  </style>
</head>
<body>
<header class="am-topbar am-topbar-fixed-bottom">
    <div class="am-container">

实付款：<span style="color:#ff0000; font-weight:bold;">¥<%=order.getPaid()%></span>
　　　　<a href="javaScript:payOrder()" class="am-btn am-btn-warning" style="margin-top:4px;">去付款</a>

</div>
</header>


<ul class="am-list">
  <li style="padding:5px 8px; line-height:30px;">订单编号：<%=order.getSerialnumber()%>
<br>订单内容：<%=order.getServiceProduct().getTitle()%>
<br>服务单价：¥<%=order.getServiceProduct().getNewprice()%>
<br>数　　量：<%=order.getNumber()%>份
<br>服务门店：<%=order.getServiceShop()==null?"暂未选择":order.getServiceShop().getTitle()%>
<br>车主姓名：<%=order.getCustomername()%>
<br>车主手机：<%=order.getCustomerphone()%></li>
</ul>


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=ctx %>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=ctx %>/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=ctx %>/assets/js/amazeui.min.js"></script>
<script src="http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js"></script>
<script src="<%=ctx%>/js/config.js"></script>
<script type="text/javascript">

//支付
function payOrder(){
  var paid = <%=order.getPaid()*100 %>;
  var orderId= '<%=order.getId()%>';
  ctk.logged({
    yes: function(res) {
      ctk.select({
        tradeService: 'com.80ycw.autoservice',
        totalFee: paid,
        success: function(res) {
          console.log(JSON.stringify(res));
          var tradeStr = res.tradeStr;
          requestPay(tradeStr,paid,orderId);
          ctk.show();
        },
        fail: function(res) {
          console.log('取消');
        }
      });
    },
    no: function(res) {
      alert('请先登录！');
    }
  });
}

function requestPay(tradeStr,paid,orderId) {
  var chubaoId='<%=userIdChubao%>';
  var url = '<%=ctx%>/apphybrid/trade.do?chuBaoUserId='+chubaoId+'&totalFee='+paid+'&tradeStr=' + tradeStr+'&orderId='+orderId;
  $.ajax({
    url: url,
    type: 'get',
    dataType: 'json',
    success: function (ret) {
      ctk.pay({
        payStr: ret.payStr,
        finish: function(resCode) {
          ctk.dismiss();
          window.location.href="<%=ctx%>/apphybrid/pay-result.jsp?orderId="+orderId+"&resCode="+resCode;
          console.log('resCode: ' + resCode);
        }
      });
    },
    error: function () {
      ctk.dismiss();
      alert('请求支付失败');
    }
  });
}



</script>
</body>
</html>