<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.ServiceProductDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.OrderDao" %>
<%@ page import="com.smart4c.dao.UsersDao" %>
<%@ page import="com.smart4c.common.SmartProperties" %>

<%
  String ctx = request.getContextPath();
  UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
  User user = (User)session.getAttribute("user");
  String orderId = request.getParameter("orderId");
  OrderDao orderDao = (OrderDao) SpringUtils.getBean(OrderDao.class);
  Order order = orderDao.findOrderById(Integer.valueOf(orderId));
  SmartProperties smartProp = SmartProperties.getInstance();
  String imgPath = smartProp.getImgPath();
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
  <title>我要评价</title>

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
    <div class="">
        <button type="button" onclick="sureComment()" class="am-topbar-btn am-btn  theme-bg am-btn-block am-btn-warning" id="btn-submit">提交</button>
    </div>
</header>


<ul class="am-list">
  <li>
  <div class="am-cf">
  <span class="am-fl"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + order.getServiceProduct().getPath()%>&imageName=<%=order.getServiceProduct().getIcon()%>" width="100" height="86"></span>
  <span><p style="margin-top:5px; font-size:14px;"><%=order.getServiceProduct().getTitle()%></p><p style="font-size:10px; color:#999; margin-top:-20px; margin-bottom:1px;"><%=order.getServiceProduct().getServiceProject().getName()%>
</p><p style="font-size:12px; margin-top:5px;">服务店家：<%=order.getServiceShop()==null?"暂未选择":order.getServiceShop().getTitle()%><span class="am-fr" style="font-weight:bold; color:#FF7419; margin-right:16px; font-size:14px;">¥<%=order.getPaid()%></span></p></span>
</div>
</li>
</ul>

<ul class="am-list">

<div class="am-cf">
<div class="am-form-group am-fl am-btn-xl" style="padding:8px 10px;">
  <input type="text" id="star" name="star" placeholder="1-5星评价"/><br><br>
  <input type="text" id="title" name="title" placeholder="评价简写"/><br><br>
      <textarea   id="content" name="content" rows="3"  placeholder="请写下对服务的详细评价吧" cols="23"></textarea>
    </div>
	</div>
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
<script type="text/javascript">
 function sureComment(){
   var star = $("#star").val();
   var title = $("#title").val();
   var content = $("#content").val();

   var uri=encodeURI("<%=ctx%>/apphybrid/sureComment.do?orderId=<%=order.getId()%>&title="+title+"&star="+star+"&content="+content);
   $.ajax({
     url: uri,
     type: "post",
     dataType: "JSON",
     async: false,
     success: function(ret){
       if(ret.result == "ok"){
         window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state=2";
       }else{
         alert("评论失败！");
       }
     },
     error: function(XMLRequest, textInfo){
       if(textInfo != null){
         alert(textInfo);
       }
     }
   });



 }
</script>
</body>
</html>