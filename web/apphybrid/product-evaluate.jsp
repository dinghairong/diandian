<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.ServiceProductDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="java.util.List" %>

<%
  String ctx = request.getContextPath();
  Administrator user = (Administrator)session.getAttribute("adminUser");
  ServiceProductDao serviceProductDao = (ServiceProductDao) SpringUtils.getBean(ServiceProductDao.class);
  String spId = request.getParameter("spId");
  ServiceProduct sp = serviceProductDao.findServiceProductById(Integer.valueOf(spId));
  List<Comment> commentList = sp.getComments();
  Comment comment = null;int score = 0; float resuScore = 0;
  if(commentList != null && commentList.size()>0){
    comment = commentList.get(0);
    for(Comment cm:commentList){
      score += cm.getStar();
    }
    resuScore = (float)score/commentList.size();
  }


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
  <title>评价列表</title>

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
  #typeone {
 width:
}
.formItemDiff {
	width: 20px;
	height: 20px;
	background-image: url(../assets/images/diff.png);
	background-position: 0px -575px;
	float: left;
	margin-top: 0px;
}
.formItemDiffFirst {
	margin-left: 0px;
}
body{ background:#eee;}
  </style>
</head>
<body>
<div class="shouji">
<ul class="am-list">
  <li style="padding:5px 8px;">
  用户评价（<span style="color:#FF7419"><%=commentList==null?0:commentList.size()%></span>）
  </li>
  <% if(commentList != null && commentList.size() > 0){
  %>
    <li style="padding:5px 8px; font-size:14px; line-height:30px;">
  商品综合满意度：<span style="color:#FF7419"><%=resuScore%>分</span>,共<span style="color:#FF7419"><%=commentList.size()%></span>条<br>
      <% for(Comment cm:commentList){%>
      <ul>
      <span style="color:#999999"><%=cm.getUser().getName()%>评分： <span id="contentMain" class="am-fr" style="margin-top:5px; margin-right:50px;">
  <span id="contextBg">
    
    <span class="contextBgItem contextBgItemRight">
      <span id="Demo" style="text-align:center;">
        <span class="item" style="margin-top:0px; margin-left:0px;">
          <span class="formItemDiff formItemDiffFirst"></span>
          <span class="formItemDiff"></span>
          <span class="formItemDiff"></span>
          <span class="formItemDiff"></span>
           <span class="formItemDiff"></span>
          <span id="pointP" style="float:left; margin-left:20px;"></span>
        </span>
      </span>
      
    </span>
  </span>
</span>
<br><%=cm.getTitle()%>
<br><%=cm.getContent()%></span>
        </ul>
  
<% }}else{ %>
  <li style="padding:5px 8px; font-size:14px; line-height:30px;">
  该服务暂无评价。
  </li>

  <% } %>

</ul>
</div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=ctx %>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=ctx %>/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=ctx %>/assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="http://www.pengyaou.com/jquery-1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
   $(".formItemDiff").hover(function() {
				$(this).css("background-position", "0px -555px");
				$(this).prevAll().css("background-position", "0px -555px");
				$(this).nextAll().css("background-position", "0px -575px");
			
			});
	});
	</script>

</body>
</html>