<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.OrderDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="java.util.Date" %>

<%
  String ctx = request.getContextPath();
  User user = (User)session.getAttribute("user");
  String orderId = request.getParameter("orderId");
  String resCode = request.getParameter("resCode");
  OrderDao orderDao = (OrderDao) SpringUtils.getBean(OrderDao.class);
  Order order = orderDao.findOrderById(Integer.valueOf(orderId));
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
  <title>支付成功</title>

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
  body{ background:#eee;}
  </style>
</head>
<body>


<ul class="am-list">
  <li><div style="text-align:center; margin-top:15px;" ><a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state=100" class="am-icon-sm am-secondary am-icon-check-circle-o"><%if("4102".equals(resCode)){%>订单支付成功<%}else{%>订单支付失败<%}%> >></a> </div>
  <div style=" padding:8px 5px;">订单编号：<%=order.getSerialnumber()%></div>
</li>
</ul>

<ul class="am-list">
  <li style="padding:8px 5px; line-height:30px;">订单内容：<%=order.getServiceProduct().getServiceProject().getName()%><br>数　　量：<%=order.getNumber()%>份<br>支付金额：¥<%=order.getPaid()%><br>门店名称：<%=order.getServiceShop()==null?"暂未选择":order.getServiceShop().getTitle()%><br>门店地址：<%=order.getServiceShop()==null?"暂未选择":order.getServiceShop().getAddress()%><br>车主姓名：<%=order.getCustomername()%><br>车主手机：<%=order.getCustomerphone()%>
  </li>
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
</body>
</html>