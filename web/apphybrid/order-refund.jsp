<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.OrderDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.UsersDao" %>

<%
    String ctx = request.getContextPath();
    UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
    User user = (User)session.getAttribute("user");
    String orderId = request.getParameter("orderId");
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
  <title>申请退款</title>

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
 body{ background:#eee; margin-top:-10px;}
  </style>
</head>
<body>
<header class="am-topbar am-topbar-fixed-bottom">
    <div class="">
        <button type="button" onclick="refundOrder()" class="am-topbar-btn am-btn  theme-bg am-btn-block" id="btn-submit">提交申请</button>
    </div>
</header>


<ul class="am-list">
  <li style="padding:5px 8px; line-height:30px;">订单编号：<%=order.getSerialnumber()%>
<br>服务项目：<%=order.getServiceProduct().getTitle()%>
<br>订单金额：<%=order.getPaid()%>元
<br>
<br>退款原因：<input  type="text" id="reason" name="reason" placeholder="退款原因"/></li>
</ul>

<div class="am-modal am-modal-confirm" tabindex="-1" id="refund">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">警告</div>
        <div class="am-modal-bd">
            你，确定申请退款吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>算了</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
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
<script src="<%=ctx %>/assets/js/amazeui.js"></script>
<script type="text/javascript">
    function refundOrder(){
        var reason = $("#reason").val();
        var uri=encodeURI("<%=ctx%>/apphybrid/refundOrder.do?orderId=<%=order.getId()%>&reason="+reason);
        $('#refund').modal({
            relatedTarget: this,
            onConfirm: function(options) {
                $.ajax({
                    url: uri,
                    type: "post",
                    dataType: "JSON",
                    async: false,
                    success: function(ret){
                        if(ret.result == "ok"){
                            window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state=4";
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
            },
            // closeOnConfirm: false,
            onCancel: function() {

            }
        });
    }
</script>
</body>
</html>