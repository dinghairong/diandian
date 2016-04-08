<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="com.smart4c.common.SmartProperties" %>

<%
    String ctx = request.getContextPath();
    JSONObject json =(JSONObject)request.getAttribute("jsonObj");
    int serviceClassId = (Integer)json.get("serviceClassId");
    int curPage =  (Integer)json.get("curPage");
    int totalPages = (Integer) json.get("totalPages");
    JSONArray jarray = json.getJSONArray("dataRows");
    SmartProperties smartProp = SmartProperties.getInstance();
    String imgPath = smartProp.getImgPath();

%>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>服务列表</title>

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

        body{ background:#eee; padding-top:10px;}
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


<div>
    <%
    for(int i=0;i<jarray.size();i++){
        int star = (Integer) jarray.getJSONObject(i).get("star");
    %>
    <div class="am-panel am-panel-default">
        <div class="am-panel-hd">
            <a href="<%=ctx%>/apphybrid/product-detail.jsp?spId=<%=jarray.getJSONObject(i).get("id")%>">
                <div class="am-cf" style=" margin-left:-15px;">
                    <div class="am-fl">
                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + jarray.getJSONObject(i).get("path")%>&imageName=<%=jarray.getJSONObject(i).get("icon")%>" width="80" height="69"></div>
                    <div class="am-fr" style="margin-top:4px;">
                        <li style="list-style-type:none; font-size:14px;"><%=jarray.getJSONObject(i).get("title")%><br><span style="font-size:12px;"><%=jarray.getJSONObject(i).get("project")%></span><br>

                    <%--<span id="contentMain" class="am-fr" style="margin-top:5px; margin-right:50px;">--%>
                      <%--<span id="contextBg">--%>
                        <%--<span class="contextBgItem contextBgItemRight">--%>
                          <%--<span id="Demo" style="text-align:center;">--%>
                            <%--<span class="item" style="margin-top:0px; margin-left:0px;">--%>
                              <%--<span class="formItemDiff formItemDiffFirst"></span>--%>
                              <%--<span class="formItemDiff"></span>--%>
                              <%--<span class="formItemDiff"></span>--%>
                              <%--<span class="formItemDiff"></span>--%>
                               <%--<span class="formItemDiff"></span>--%>
                              <%--<span id="pointP" style="float:left; margin-left:20px;"></span>--%>
                            <%--</span>--%>
                          <%--</span>--%>

                        <%--</span>--%>
                      <%--</span>--%>
                    <%--</span>--%>
                    <strong style="color:#FF7419">¥<%=jarray.getJSONObject(i).get("newprice")%></strong>
                            <%
                                for(int k = 0;k < star;k ++){
                            %>
                            <img src="<%=ctx%>/img/star_1.png" style="width: 12px;">
                            <%
                                }
                                for(int o = 0;o < 5 - star;o ++){
                            %>
                            <img src="<%=ctx%>/img/star_2.png" style="width: 12px;">
                            <%
                                }
                            %>

                        </li>
                    </div>
                </div>
            </a>
        </div>
        <div class="am-panel-bd">
            <div class="am-cf">
                <span class="am-fr" style="font-size:10px; color:#666666; margin-right:-5px; margin-top:-10px; margin-bottom:-10px;">本商品已有<%=jarray.getJSONObject(i).get("buycount")%>人购买　<a href="<%=ctx%>/apphybrid/order-confirm.jsp?spId=<%=jarray.getJSONObject(i).get("id")%>" class="am-btn am-btn-warning">立即购买</a></span>
            </div>
        </div>
    </div>
    <%
    }
    %>
</div>
<% if(curPage < totalPages){ %>
    <div align="center"><a href="<%=ctx%>/apphybrid/getproductlist.do?scId=<%=serviceClassId%>&page.curPageNo=<%=curPage+1%>">点击下一页……</a></div>

<% }else{ %>
    <div align="center">已经是最后一页</div>
<% } %>


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=ctx%>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=ctx%>/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="<%=ctx%>/assets/js/amazeui.min.js"></script>
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