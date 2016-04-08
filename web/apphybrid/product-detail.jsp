<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.ServiceProductDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smart4c.common.SmartProperties" %>
<%
    String ctx = request.getContextPath();
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
  <title>服务详情</title>

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
<!--
.STYLE2 {color: #ff780f}
-->
        .square {
            border: solid #dadada 1px;
            height: 0;
            width: 100%;
            padding-bottom: 100%;
        }
        .theme-bg{
            background: #FF7419;
            color: #fff;
        }
        .theme-btn{
            border: solid #FF7419 1px;
            background: #fff;
            color: #dbbc5f;

        }
        .theme-btn.am-active{
            background: #dbbc5f;
            color: #fff;
            box-shadow: none;
            -webkit-box-shadow: none;

        }

        .theme-btn:hover{
        color: #dbbc5f;
        }
        .theme-btn:hover.am-active{
            color: #fff;
        }
  body{ background:#eee; margin-top:-15px;}
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
  </style>
</head>
<body>
<header class="am-topbar am-topbar-fixed-bottom">
    <div class="am-container">
        <a href="<%=ctx%>/apphybrid/order-confirm.jsp?spId=<%=sp.getId()%>" class="am-topbar-btn am-btn am-btn-sm theme-bg am-btn-block" id="btn-submit">立即购买</a>
    </div>
</header>
<ul class="am-list">
  <li style=" text-align:center"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath +sp.getPath()%>&imageName=<%=sp.getIcon()%>" width="250" height="216"></li>
  <li style="font-size:16px; padding:5px 8px;;"><%=sp.getTitle()%></li>
  <li style="font-size:10px; color:#AAAAAA; line-height:20px; padding:5px 8px;">摘要：<%=sp.getAbstract_()%>
<br>所需配件：<%=sp.getAccessory()%>
<br>描述：<%=sp.getDescription()%></li>
  <li style="line-height:28px; font-size:14px; padding:5px 8px; color:#656565;">市场价：<strong>¥<%=sp.getOldprice()%></strong><br>
体验价：<strong style=" font-size:16px; color:#FF0000">¥<%=sp.getNewprice()%></strong>
<br>服务时间：大约<%=sp.getDuration()%>分钟
<br>服务支持：<button type="button" class="am-btn am-btn-success am-btn-xs" style="font-size:12px; color:#fff;">免费安装</button> <button type="button" class="am-btn am-btn-secondary am-btn-xs" style="font-size:12px; color:#fff">装完付款</button> <button type="button" class="am-btn am-btn-secondary am-btn-xs" style="font-size:12px; color:#fff; padding-left:10px">正规发票</button></li>
</ul>


<ul class="am-list">
  <li style="font-size:16px; padding:5px 8px;">商品介绍			<button type="button" class="am-fr am-close" style="margin-top:-1px; margin-right:-5px; ; font-size:23px;">＞</button>
</li>
  <li style="font-size:14px; color:#000; line-height:20px; padding:5px 8px;"><a href="<%=ctx%>/apphybrid/product-evaluate.jsp?spId=<%=spId%>"> 用户评价（<span style="color:#FF780F"><%=(commentList==null?0:commentList.size())%></span>）</a></li>

    <% if(comment != null){ %>
  <li style="line-height:28px; font-size:14px; padding:5px 8px; color:#656565;">商品综合满意度：<span style="color:#FF780F"><%=resuScore%>分</span>，共<span style="color:#FF780F"><%=commentList.size()%></span>条
<br><span style="color:#9A9A9A"><%=comment.getUser().getName()%>评分：<span id="contentMain" class="am-fr" style="margin-top:5px; margin-right:50px;">
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
<br><%=comment.getTitle()%>
<br><%=comment.getContent()%></span></li>
    <%}%>
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