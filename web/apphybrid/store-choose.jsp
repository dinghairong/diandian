<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.dao.AreaDetailDao" %>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.ServiceShopDao" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.smart4c.util.Page" %>
<%@ page import="com.smart4c.common.SmartProperties" %>

<%
    String ctx = request.getContextPath();
    AreaDetailDao areaDetailDao = (AreaDetailDao) SpringUtils.getBean(AreaDetailDao.class);
    ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
    List<String> provinceList = areaDetailDao.findProvince();
    List<String> cityList = new ArrayList<String>();
    List<String> countryList = new ArrayList<String>();
    String province = (String)request.getAttribute("province");
    if(StringUtils.isEmpty(province)){
        province = "";
    }
    if(StringUtils.isNotEmpty(province)){
        cityList = areaDetailDao.getCites(province);
    }
    String city = (String)request.getAttribute("city");
    if(StringUtils.isEmpty(city)){
        city = "";
    }
    if(StringUtils.isNotEmpty(province) && StringUtils.isNotEmpty(city)){
        countryList = areaDetailDao.getCounties(province,city);
    }
    String country = (String)request.getAttribute("country");
    if(StringUtils.isEmpty(country)){
        country = "";
    }
    Long totalRecords = (Long)request.getAttribute("totalRecords");
    long totalPages = 0;
     totalPages = totalRecords / 10;
    if (totalRecords % 10 != 0) {
        totalPages += 1;
    }
    int curPage = (Integer)request.getAttribute("curPageNo");
    List<ServiceShop> serviceshopList = (List<ServiceShop>)request.getAttribute("serviceshop");
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
  <title>选择门店</title>

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

<div data-am-widget="tabs"
       class="am-tabs am-tabs-d2"
        >
      <ul class="am-tabs-nav am-cf">
          <li class="">
              <select id="province">
                  <option value="0">请选择省份</option>
                  <% if(provinceList != null && provinceList.size() > 0) {
                      for(int i =0;i<provinceList.size();i++){
                          if(province.equals(provinceList.get(i))){

                    %>
                  <option selected="selected"><%=provinceList.get(i)%></option>
                  <%}else{%>
                  <option><%=provinceList.get(i)%></option>
                  <%}}}%>
              </select>
          </li>
          <li class="">
              <select id="city">
                  <option value="0">请选择城市</option>
                  <% if(cityList != null && cityList.size() > 0) {
                      for(int i =0;i<cityList.size();i++){
                          if(city.equals(cityList.get(i))){

                  %>
                  <option selected="selected"><%=cityList.get(i)%></option>
                  <%}else{%>
                  <option><%=cityList.get(i)%></option>
                  <%}}}%>
              </select>
          </li>
          <li class="">
              <select id="country">
                  <option value="0">请选择县/区</option>
                  <% if(countryList != null && countryList.size() > 0) {
                      for(int i =0;i<countryList.size();i++){
                          if(country.equals(countryList.get(i))){

                  %>
                  <option selected="selected"><%=countryList.get(i)%></option>
                  <%}else{%>
                  <option><%=countryList.get(i)%></option>
                  <%}}}%>
              </select>
          </li>
      </ul>
      <div class="am-tabs-bd">
          <div data-tab-panel-0 class="am-tab-panel am-active">
            
			
		<div data-am-widget="list_news" class="am-list-news am-list-news-default" style="margin-right:5px;" >
  <!--列表标题-->

  <div class="am-list-news-bd">
      <div align="left">共有门店：<%=totalRecords==null?0:totalRecords%>家，为您提供服务。</div>
  <ul class="am-list">
    <% if(serviceshopList != null && serviceshopList.size()>0) {
        for(int i=0;i<serviceshopList.size();i++){
    %>
     <!--缩略图在标题左边-->
      <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
        <div class="am-u-sm-4 am-list-thumb">
            <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + serviceshopList.get(i).getPath()%>&imageName=<%=serviceshopList.get(i).getImage()%>" alt=""/>
        </div>

        <div class=" am-u-sm-8 am-list-main am-text-truncate">
            <h3 class="am-list-item-hd am-text-truncate">门店名称：<%=serviceshopList.get(i).getTitle()%></h3>

            <div class="am-list-item-text " style="font-size:10px;">门店地址：<%=serviceshopList.get(i).getAddress()%></div>
            <div class="am-list-item-text am-btn-xs"><button type="button" class="am-btn am-btn-secondary am-btn-xs" onclick="select(<%=serviceshopList.get(i).getId()%>)">选择门店</button></div>

        </div>
      </li>

<%}}else{%>
    暂无(请选择省市县)

<%}%>

    </ul>
  </div>

            <% if(serviceshopList != null && serviceshopList.size()>0){if(curPage < totalPages){ %>
            <div align="center"><a href="<%=ctx%>/apphybrid/storeChoose.do?province=<%=province%>&city=<%=city%>&country=<%=country%>&page.curPageNo=<%=curPage+1%>">点击下一页……</a></div>

            <% }else{ %>
            <div align="center">已经是最后一页</div>
            <% } }%>


    </div>
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
<script type="text/javascript">
    $('#province').change(function(){
        var province = this.options[this.selectedIndex].innerHTML;
        province = encodeURI(province);
        location.href = "<%=ctx%>/apphybrid/storeChoose.do?province="+province;
    });
    $('#city').change(function(){
        var city = this.options[this.selectedIndex].innerHTML;
        var province = jQuery("#province  option:selected").text();
        var uri = "<%=ctx%>/apphybrid/storeChoose.do?province="+province+"&city="+city;
        location.href = encodeURI(uri);
    });
    $('#country').change(function(){
        var country = this.options[this.selectedIndex].innerHTML;
        var province = jQuery("#province  option:selected").text();
        var city = jQuery("#city  option:selected").text();
        var uri = "<%=ctx%>/apphybrid/storeChoose.do?province="+province+"&city="+city+"&country="+country;
        location.href =  encodeURI(uri);
    });

    function select(serviceShopId){
        location.href = "<%=ctx%>/apphybrid/order-confirm.jsp?serviceShopId="+serviceShopId;
    }

</script>
</body>
</html>