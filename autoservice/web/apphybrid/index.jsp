<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    String ctx = request.getContextPath();
    UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
//    User user = (User)session.getAttribute("user");
//    User user = usersDao.findUserById(2);
//    if(user == null){
//        response.sendRedirect(ctx + "/logout.jsp");
//        return;
//    }
    ServiceClassDao serviceClassDao = (ServiceClassDao)SpringUtils.getBean(ServiceClassDao.class);
    List<ServiceClass> scList = serviceClassDao.getAllClass();
%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>首页</title>

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
            .wang{ width:100%; height:auto;}
            .wang ul{ list-style-type:none;}
            .wang ul li{ float:left;}
        </style>
    </head>


</head>
<body>

<div class="am-g" style="padding-top:30px; padding-left:20px;">

        <%
        for(int i=0;i<scList.size();i++){
        %>

    <div class="am-u-sm-6">
        <a  href="<%=ctx%>/apphybrid/getproductlist.do?scId=<%=scList.get(i).getId()%>&page.curPageNo=1">
            <img src="<%=ctx%>/zp/<%=(i+2)%>.jpg" alt="" width="90%" height="90%"/>
        </a>
    </div>
        <%
        }
        %>

</div>


<header class="am-topbar  am-topbar-fixed-bottom">
    <ul style="list-style-type:none; text-align:center">
        <li style="float:left; width:85px; padding-top:10px; color:#0066FF"><a href="<%=ctx%>/apphybrid/index.jsp">首页</a><span class="am-icon-caret-down"></span><ul class="am-dropdown-content">
            ...
        </ul></li>
        <li style="float:left; width:85px; padding-top:10px;">评价 <span class="am-icon-caret-down"></span><ul class="am-dropdown-content">
            ...
        </ul></li>
        <li style="float:left; width:85px; padding-top:10px;"><a href="javascript:gomy()">我的</a> <span class="am-icon-caret-down"></span><ul class="am-dropdown-content">
            ...
        </ul></li>

    </ul>
</header>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=ctx%>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=ctx%>/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=ctx%>/assets/js/amazeui.min.js"></script>
<script src="http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js"></script>
<script src="<%=ctx%>/js/config.js"></script>
<script type="text/javascript">

    // ctk_config in config.js
    ctk_config.timestamp = Math.floor((+new Date()) / 1000);
    ctk_config.jsApiList = ['logged','login'];

    try{
        ctk.config(ctk_config.appkey,
                ctk_config.serviceId,
                ctk_config. timestamp,
                ctk_config.charset,
                ctk_config.signType,
                ctk_config.host,
                ctk_config.jsApiList,
                ctk_config.sign);
    }catch(e){
        alert(e);
    }

    function gomy(){

        function doLoginByAccessToken(accessToken){
            $.post('loginByAccessToken.do',{
                accessToken: accessToken,
                type: 'touchlife'
            }, function(data){
                console.log(JSON.stringify(data));
                if(data.result == 0){
                    location.href = '<%=ctx%>/apphybrid/my.do';
                }
               else{
                    alert('登录错误:'+JSON.stringify(data));
                }
            });
        };

        ctk.logged({
            yes:function(res){
                doLoginByAccessToken(res.accessToken);
            },
            no:function(){
                ctk.login({
                    success: function(res){
                        doLoginByAccessToken(res.accessToken);
                    },
                    fail: function(){
                        alert('无法打开登录框');
                    }
                })
            }
        });
    }

</script>
</body>
</html>