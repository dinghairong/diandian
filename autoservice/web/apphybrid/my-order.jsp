<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.UsersDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="com.smart4c.common.SmartProperties" %>

<%
    String ctx = request.getContextPath();
    User user = (User)session.getAttribute("user");
    String userIdChubao = user.getUserExternal().getUserId();
    JSONObject json =(JSONObject)request.getAttribute("jsonObj");
    int curPage =  (Integer)json.get("curPage");
    int totalPages = (Integer) json.get("totalPages");
    JSONArray jarray = json.getJSONArray("dataRows");
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
  <title>我的订单</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href=<%=ctx %>/assets/i/favicon.png">

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

<div data-am-widget="titlebar" class="am-titlebar am-titlebar-cols"  style="margin-top:-1px;">
    <%if("100".equals(json.get("state").toString())){%>　
        <h2 class="am-titlebar-title ">
    <%}else{%>
        <h2 class="">
    <%}%>
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=100" class="" style="margin-right:10px; margin-left:10px;">全部</a>
    </h2>

    <nav class="am-titlebar-nav">
        <%if("0".equals(json.get("state").toString())){%>　
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=0" class="am-titlebar-title" style="margin-right:10px; margin-left:10px;">待付款</a>
        <%}else{%>
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=0" class="" style="margin-right:10px; margin-left:10px;">待付款</a>
        <%}%>
        <%if("2".equals(json.get("state").toString())){%>　
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=2" class="am-titlebar-title" style="margin-right:10px; margin-left:10px;">待评价</a>
        <%}else{%>
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=2" class="" style="margin-right:10px; margin-left:10px;">待评价</a>
        <%}%>
        <%if("4".equals(json.get("state").toString())){%>　
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=4" class="am-titlebar-title" style="margin-right:10px; margin-left:10px;">退款单</a>
        <%}else{%>
        <a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=4" class="" style="margin-right:10px; margin-left:10px;">退款单</a>
        <%}%>
    </nav>
</div>


<% if(jarray !=null && jarray.size()>0) {
    for(int i=0;i<jarray.size();i++){
%>
<div class="am-panel am-panel-default">
    <div class="am-panel-hd">
        <a href="<%=ctx%>/apphybrid/my-order-detail.jsp?orderId=<%=jarray.getJSONObject(i).get("id")%>">
            <div class="am-cf" style=" margin-left:-15px;">
                <div class="am-fl"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + jarray.getJSONObject(i).get("path")%>&imageName=<%=jarray.getJSONObject(i).get("icon")%>" width="80" height="69"></div>
                <div class="am-fr" style="margin-top:4px;"><li style="list-style-type:none; font-size:14px;"><%=jarray.getJSONObject(i).get("spTitle")%><br><span style="font-size:12px;"><%=jarray.getJSONObject(i).get("name") %></span><br>

                    <span style="font-size:12px;">服务门店：<%=jarray.getJSONObject(i).get("shopTitle")%></span><strong style="color:#FF7419" class="am-fr">¥<%=jarray.getJSONObject(i).get("paid")%></strong>
                </li>
                </div>
            </div>
        </a>
    </div>
    <div class="am-panel-bd">
        <div class="am-cf">
            <span class="am-fr" style="font-size:10px; color:#666666; margin-right:-5px; margin-top:-10px; margin-bottom:-10px;">
               <%if("0".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
            <button type="button" onclick="select(<%=jarray.getJSONObject(i).get("id")%>,<%=jarray.getJSONObject(i).get("paid")%>)" class="am-btn am-btn-warning am-btn-xs">去支付</button>
            <button type="button" onclick="cancerOrder(<%=jarray.getJSONObject(i).get("id")%>)" class="am-btn am-btn-warning am-btn-xs">取消</button>　
        <%}%>
       <%if("1".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
        <button type="button" onclick="sureOrder(<%=jarray.getJSONObject(i).get("id")%>)" class="am-btn am-btn-warning am-btn-xs">确认使用</button>　
         <button type="button" onclick="refundOrder(<%=jarray.getJSONObject(i).get("id")%>)" class="am-btn am-btn-warning am-btn-xs">退款</button>　
         <%}%>
        <%if("2".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
            <button type="button" onclick="commentOrder(<%=jarray.getJSONObject(i).get("id")%>)" class="am-btn am-btn-warning am-btn-xs">去评价</button>　
        <%}%>
        <%if("3".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
             <span style="color:green">已评价</span>
         <%}%>
        <%if("4".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
             <span style="color:#ff7f50">退款中</span>
        <%}%>
        <%if("5".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
             <span style="color:green">退款成功</span>
         <%}%>
        <%if("6".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
            <span style="color:red">退款失败</span>　
        <%}%>
        <%if("7".equals(jarray.getJSONObject(i).get("orderState").toString())){%>　
            <span style="color:gray">已取消</span>　
        <%}%>
            </span>
        </div>
    </div>
</div>
<% } }else{%>
<div align="center">未查询到相关订单哦...</div>
<%}%>

<% if(1 < totalPages){if(curPage < totalPages){ %>
<div align="center"><a href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state=<%=json.get("state")%>&page.curPageNo=<%=curPage+1%>">点击下一页……</a></div>

<% }else{ %>
<div align="center">已经是最后一页</div>
<% }} %>

<div class="am-modal am-modal-confirm" tabindex="-1" id="cancer">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">警告</div>
        <div class="am-modal-bd">
            你，确定要取消该订单吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>算了</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="cancer">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">警告</div>
        <div class="am-modal-bd">
            你，确定要取消该订单吗？
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>算了</span>
            <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
    </div>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="sure">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">警告</div>
        <div class="am-modal-bd">
            你，确定已经使用了该订单吗？
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
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=ctx %>/assets/js/amazeui.min.js"></script>
<script src="<%=ctx %>/assets/js/amazeui.js"></script>
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
                            window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state="+<%=json.get("state") %>;
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
                            window.location.href="<%=ctx%>/apphybrid/my-order.do?userId=<%=json.get("userId")%>&state="+<%=json.get("state") %>;
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