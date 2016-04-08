<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.UsersDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.OrderDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.smart4c.common.SmartProperties" %>

<%
    String ctx = request.getContextPath();
    User user = (User)session.getAttribute("user");
    String userIdChubao = user.getUserExternal().getUserId();
    String orderId = request.getParameter("orderId");
    OrderDao orderDao = (OrderDao) SpringUtils.getBean(OrderDao.class);
    Order order = orderDao.findOrderById(Integer.valueOf(orderId));
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
  <title>订单详情</title>

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
    <li>
        <div class="am-cf">
            <span class="am-fl"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + order.getServiceProduct().getPath()%>&imageName=<%=order.getServiceProduct().getIcon()%>" width="100" height="86"></span>
  <span><p style="margin-top:5px; font-size:14px;"><%=order.getServiceProduct().getTitle()%></p><p style="font-size:10px; color:#999; margin-top:-20px; margin-bottom:1px;"><%=order.getServiceProduct().getServiceProject().getName()%>
  </p><p style="font-size:12px; margin-top:5px;">服务店家：<%=order.getServiceShop()==null?"暂未选择":order.getServiceShop().getTitle()%><span class="am-fr" style="font-weight:bold; color:#FF7419; margin-right:16px; font-size:14px;">¥<%=order.getPaid()%></span></p></span>
        </div>
    </li>
</ul>
<ul class="am-list">
    <li>
        <div class="am-cf">
            <div class="am-form-group am-fl am-btn-xl" style="padding:8px 10px;">
            订单编号：<%=order.getSerialnumber()%>
                </div>
        </div>
    </li>
    <li>
        <div class="am-cf">
            <div class="am-form-group am-fl am-btn-xl" style="padding:8px 10px;">
                下单时间：<%=format.format(order.getCreatedTime())%>
            </div>
        </div>
    </li>
</ul>
<ul class="am-list">
    <li>
        <div class="am-cf">
            <div class="am-form-group am-fl am-btn-xl" style="padding:8px 10px;">
                车主姓名：<%=order.getCustomername()%>
            </div>
        </div>
    </li>
    <li>
        <div class="am-cf">
            <div class="am-form-group am-fl am-btn-xl" style="padding:8px 10px;">
                车主手机：<%=order.getCustomerphone()%>
            </div>
        </div>
    </li>
    <%--<li>--%>
        <%--<div class="am-cf">--%>
            <%--<div class="am-form-group am-fl am-btn-xl" style="padding:8px 10px;">--%>
                <%--预约时间：2015-12-12 12:20:02--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</li>--%>
</ul>
<ul class="am-list">

    <%if(0 == order.getState()){%>　
    <button type="button" onclick="select(<%=order.getId()%>,<%=order.getPaid()%>)" class="am-btn am-btn-warning am-btn-xs">去支付</button>
    <button type="button" onclick="cancerOrder(<%=order.getId()%>)" class="am-btn am-btn-warning am-btn-xs">取消</button>　
    <%}%>
    <%if(1==order.getState()){%>　
    <button type="button" onclick="sureOrder(<%=order.getId()%>)" class="am-btn am-btn-warning am-btn-xs">确认使用</button>　
    <button type="button" onclick="refundOrder(<%=order.getId()%>)" class="am-btn am-btn-warning am-btn-xs">退款</button>　
    <%}%>
    <%if(2==order.getState()){%>　
    <button type="button" onclick="commentOrder(<%=order.getId()%>)" class="am-btn am-btn-warning am-btn-xs">去评价</button>　
    <%}%>
    <%if(3==order.getState()){%>　
        <span ><font color="green">已评价</font></span>
    <%}%>
    <%if(4==order.getState()){%>　
    <span ><font color="#ff7f50">退款中</font></span>
    <%}%>
    <%if(5==order.getState()){%>　
    <span ><font color="green">退款成功</font></span>
    <%}%>
    <%if(6==order.getState()){%>　
    <span ><font color="red">退款失败</font></span>　
    <%}%>
    <%if(7==order.getState()){%>　
    <span ><font color="gray">已取消</font></span>　
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
<script src="http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js"></script>
<script src="<%=ctx%>/js/config.js"></script>
<script type="text/javascript">

    //支付
    function select(orderId,paid){
        ctk.logged({
            yes: function(res) {
                ctk.select({
                    tradeService: 'com.80ycw.autoservice',
                    totalFee: paid*100,
                    success: function(res) {
                        console.log(JSON.stringify(res));
                        var tradeStr = res.tradeStr;
                        requestPay(tradeStr,paid*100,orderId);
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

    function cancerOrder(orderId){
        var uri="<%=ctx%>/apphybrid/cancerOrder.do?orderId="+orderId;
        $('#cancer').modal({
            relatedTarget: this,
            onConfirm: function(options) {
                $.ajax({
                    url: uri,
                    type: "post",
                    dataType: "JSON",
                    async: false,
                    success: function(ret){
                        if(ret.result == "ok"){
                            window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state="+<%=order.getState() %>;
                        }else{
                            alert("该订单不存在！");
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
    function sureOrder(orderId){
        var uri="<%=ctx%>/apphybrid/sureOrder.do?orderId="+orderId;
        $('#sure').modal({
            relatedTarget: this,
            onConfirm: function(options) {
                $.ajax({
                    url: uri,
                    type: "post",
                    dataType: "JSON",
                    async: false,
                    success: function(ret){
                        if(ret.result == "ok"){
                            window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=user.getId()%>&state="+<%=order.getState() %>;
                        }else{
                            alert("该订单不存在！");
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
    function refundOrder(orderId){
        window.location.href="<%=ctx%>/apphybrid/order-refund.jsp?orderId="+orderId;
    }

    function commentOrder(orderId){
        window.location.href="<%=ctx%>/apphybrid/order-evaluate.jsp?orderId="+orderId;
    }

</script>
</body>
</html>