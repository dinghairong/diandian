<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.SmartProperties" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.smart4c.dao.OrderDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smart4c.dao.UsersDao" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
    String ctx = (String)request.getContextPath();
    UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
    User user = (User)session.getAttribute("user");
//    User user = usersDao.findUserById(2);
%>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>我的</title>

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
<div class="am-panel am-panel-default">
    <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state=100">
        <div class="am-panel-hd"><span  class="am-icon-sm am-secondary am-icon-list am-fl"></span> 我的订单 <p class="am-fr" style="margin-top:3px; font-size:14px; color:#999">查看全部已购买服务　></p>
        </div>
    </a>
    <div class="am-panel-bd">
        <button type="button" onclick="myorder(0)" class="am-btn am-btn-default am-radius  am-btn-sm ">待付款</button>
        <button type="button" onclick="myorder(2)" class="am-btn am-btn-default am-radius  am-btn-sm ">待评价</button>
        <button type="button" onclick="myorder(4)" class="am-btn am-btn-default am-radius  am-btn-sm ">退款单</button>
    </div>
</div>

<!--
<div class="am-panel am-panel-default">
    <div class="am-panel-hd"><a href="" class="am-icon-sm am-secondary am-icon-list"></a> 猜你喜欢</div>
    <div class="am-panel-bd">

        <div class="am-g">
            <div class="am-u-sm-4">
                <div class="am-radius">
                    <img src="<%=ctx %>/zp/6.jpg" alt="" width="80" height="61"/>
                    <h3 class="am-thumbnail-caption" style="font-size:12px; margin-left:-10px; margin-right:-10px;">爱车基础保护</h3>
                </div>
            </div>
            <div class="am-u-sm-4">
                <img src="<%=ctx %>/zp/6.jpg" alt="" class="am-radius" width="80" height="61"/>
                <figcaption class="am-thumbnail-caption" style="font-size:12px; margin-left:-10px; margin-right:-10px;">爱车基础保护</figcaption>
            </div>
            <div class="am-u-sm-4">
                <figure class="am-radius">
                    <img src="<%=ctx %>/zp/6.jpg" alt="" class="am-radius" width="80" height="61"/>
                    <figcaption class="am-thumbnail-caption" style="font-size:12px; margin-left:-10px; margin-right:-10px;">爱车基础保护</figcaption>
                </figure>
            </div>
        </div>
    </div>
    -->


    <!--[if (gte IE 9)|!(IE)]><!-->
    <script src="<%=ctx %>/assets/js/jquery.min.js"></script>
    <!--<![endif]-->
    <!--[if lte IE 8 ]>
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script src="<%=ctx %>/assets/js/amazeui.ie8polyfill.min.js"></script>
    <![endif]-->
    <script src="<%=ctx %>/assets/js/amazeui.min.js"></script>
    <script type="text/javascript">
        function myorder(state){
            window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state="+state;
        }

    </script>
</body>
</html>