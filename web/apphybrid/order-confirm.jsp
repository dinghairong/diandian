<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.UsersDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.ServiceProductDao" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.smart4c.dao.ServiceShopDao" %>
<%@ page import="com.smart4c.common.SmartProperties" %>

<%
  String ctx = request.getContextPath();
  UsersDao usersDao = (UsersDao) SpringUtils.getBean(UsersDao.class);
  User user = (User)session.getAttribute("user");
  ServiceProductDao serviceProductDao = (ServiceProductDao) SpringUtils.getBean(ServiceProductDao.class);
  ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
  SmartProperties smartProp = SmartProperties.getInstance();
  String imgPath = smartProp.getImgPath();
  String spId = request.getParameter("spId");
  if(StringUtils.isNotEmpty(spId)){
    session.setAttribute("spId",spId);
  }else{
    Integer spIdInt = (Integer)session.getAttribute("spId");
    spId = Integer.toString(spIdInt);
  }
  ServiceProduct sp = serviceProductDao.findServiceProductById(Integer.valueOf(spId));
  String name = (String)session.getAttribute("name");
  String phone = (String)session.getAttribute("phone");
  int number=0;
  if(session.getAttribute("number") != null){
     number = (Integer)session.getAttribute("number");
  }
  String serviceShopId = (String)request.getParameter("serviceShopId");
  ServiceShop serviceShop = null;
  if(StringUtils.isNotEmpty(serviceShopId) && !"null".equals(serviceShopId)){
    serviceShop = serviceShopDao.findServiceShopById(Integer.valueOf(serviceShopId));
  }else{
    serviceShopId="0";
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
  <title>立即购买</title>

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
        <a href="javaScript:orderConfirm()"  class="am-topbar-btn am-btn am-btn-sm theme-bg am-btn-block" id="btn-submit">确认订单</a>
    </div>
</header>


<ul class="am-list">
  <li>
  <div class="am-cf">
  <span class="am-fl"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + sp.getPath()%>&imageName=<%=sp.getIcon()%>" width="100" height="86"></span>
  <span class="am-fr"><p style="margin-top:5px; font-size:14px;"><%=sp.getTitle()%></p><p style="font-size:10px; color:#999; margin-top:-20px; margin-bottom:1px;">描述：<%=sp.getAbstract_()%>
</p><button type="button" class="am-btn am-btn-success" style="width:65px; height:25px; font-size:12px; color:#fff; margin-bottom:5px;">免费安装</button> <button type="button" class="am-btn am-btn-secondary" style="width:65px; height:25px;  font-size:12px; color:#fff;margin-bottom:5px">装完付款</button> <button type="button" class="am-btn am-btn-secondary" style="width:65px; height:25px;  font-size:12px; color:#fff; padding-left:10px;margin-bottom:5px">正规发票</button></span>
</div>
</li>
  <li style="padding:5px 8px;">服务单价	<p  class="am-fr" style="margin-top:-1px; margin-right:15px; color:#FF7419;font-size:16px;"><%=sp.getNewprice()%>元</p></li>
  <li>
  
    <div class="am-cf">
  <div class="am-fl" style="padding:5px 8px;">购买数量</div>
  <div class="am-fr" style="padding:5px 0px; margin-right:-40px;">　<div class="am-btn-group am-btn-group-xs"　　>
 <button type="button" onclick="subNum()" class="am-btn am-btn-default">-</button>
</div>
<div class="am-btn-group am-btn-group-xs">
 <input type="button" class="am-btn am-btn-default" name="number" id="number" value="<%=number==0?1:number%>"/>
</div>
<div class="am-btn-group am-btn-group-xs">
 <button type="button" onclick="addNum()" class="am-btn am-btn-default">+</button>
</div>
  </div>
    </div>
  </li>
  <li style="padding:5px 8px;">服务门店 <input type="hidden" id="serviceShopId" name="serviceShopId" value="<%=serviceShopId==null?"":serviceShopId%>"><p  class="am-fr" style="margin-top:5px; margin-right:5px; color:#999;font-size:12px;"><a href="javaScript:selectShop();">请选择您需要的服务点</a></p></li>
  <li>

  <li>
    <div class="am-cf">
      <div class="am-fl" style="padding:5px 8px;">门店名称</div>
      <div class="am-fr" style=" margin-right:5px; padding-top:2px;">
       <%=serviceShop==null?"暂未选择门店":serviceShop.getTitle()%>
      </div>
    </div>
  </li>


  <li>
    <div class="am-cf">
  <div class="am-fl" style="padding:5px 8px;">车主姓名</div>
  <div class="am-fr" style=" margin-right:-2px; padding-top:2px;"><input type="text" name="customername" id="customername" placeholder="输入您的姓名" value="<%=name==null?"":name%>">　
</div>
  </div>
  </li>
    <li>

    <div class="am-cf">
  <div class="am-fl" style="padding:5px 8px;">车主手机</div>
  <div class="am-fr" style=" margin-right:-2px; padding-top:2px;"><input type="text" id="customerphone" name="customerphone" placeholder="输入您的手机" value="<%=phone==null?"":phone%>">　
</div>
  </div>
  </li>
    <li>
  <%----%>
    <%--<div class="am-cf">--%>
  <%--<div class="am-fl" style="padding:5px 8px;">预约时间</div>--%>
  <%--<div class="am-fr" style=" margin-right:-2px; padding-top:2px;"><input type="text" id="createTime" name="createTime" placeholder="预约时间" >　--%>
<%--</div>--%>
  <%--</div>--%>
  </li>
</ul>

<div class="am-modal am-modal-alert" tabindex="-1" id="alert1">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">警告</div>
    <div class="am-modal-bd">
      请输入车主姓名
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="alert2">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">警告</div>
    <div class="am-modal-bd">
      请输入车主手机
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
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
<script src="http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js"></script>
<script src="<%=ctx%>/js/config.js"></script>
<script type="text/javascript">
  function subNum(){
    var number =parseInt($("#number").val());
    if(0 < number){
      $("#number").val(number-1);
    }
  };

  function addNum(){
      var number =parseInt($("#number").val());
      $("#number").val(number+1);
  };

  function orderConfirm(){

      var number = $("#number").val();
      var name = $("#customername").val();
      var phone = $("#customerphone").val();
      if(name==""||name.length==0){
        $("#alert1").modal('open');
        return;
      }
      if(phone==""||phone.length==0){
        $("#alert2").modal('open');
        return;
      }

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
  };

  function doLoginByAccessToken(accessToken){
    var number = $("#number").val();
    var name = $("#customername").val();
    var phone = $("#customerphone").val();
    $.post('loginByAccessToken.do',{
      accessToken: accessToken,
      type: 'touchlife'
    }, function(data){
      if(data.result == 0){
        window.location.href="<%=ctx%>/apphybrid/orderComfirm.do?spId=<%=spId%>&number="+number+"&name="+encodeURI(name)+"&phone="+phone+"&serviceShopId="+<%=serviceShopId%>;
      }
      else{
        alert('登录错误:'+JSON.stringify(data));
      }
    });
  };


  function selectShop(){

    var number = $("#number").val();
    var name = $("#customername").val();
    var phone = $("#customerphone").val();

    var time = $("#createTime").val();
    window.location.href="<%=ctx%>/apphybrid/storeChoose.do?spId=<%=spId%>&number="+number+"&name="+encodeURI(name)+"&phone="+phone;
  };


</script>
</body>
</html>