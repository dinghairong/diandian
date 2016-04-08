<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>

<%
String ctx = (String)request.getContextPath();
User user = (User)session.getAttribute("user");
Company company = (Company)session.getAttribute("company");
String setcity = (String)session.getAttribute("setcity");
if((setcity == null) || (setcity.length() == 0)){
    setcity = "";
}else{
    if(setcity.length() > 0){
        setcity = setcity.substring(0, setcity.length() - 1);
    }
}
%>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js" type="text/ecmascript"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<div class="top">
    <div class="tops" id="tops">

        <div class="denglu" id="denglu">
            <div class="denglu_left">
                <p style="display:inline;font-size:14px"><%=setcity%></p>&nbsp;<a href="<%=ctx%>/city.jsp" class="chose_city" style="font-size:14px">[选择城市]</a>
                <span>您好 欢迎光临帮您养车网</span>
                <span>全国覆盖城市近<font color="#4c8de5">8000</font>家，<a href="<%=ctx%>/slogin.jsp" style="color:#4c8de5">线下合作门店加盟</a></span>
                <input type="hidden" id="setcity" value="<%=setcity%>">
            </div>
            <div class="denglu_right" style="display: inline-block; width: auto">
                <%if(null != user){%>
                <div class="enter" style="width: 120px"><a href="<%=ctx%>/profile.jsp" style="color:#4c8de5;"><%=user.getPhone()%></a></div>
                <div class="login"><a href="<%=ctx%>/logout.jsp" style="color:#4c8de5;">退出</a></div>
                <%}else{
                    if(null != company){
                %>
                <div class="enter" style="width: 120px"><a href="<%=ctx%>/cwelcome.jsp" style="color:#4c8de5;"><%=company.getPhone()%></a></div>
                <div class="login"><a href="<%=ctx%>/logout.jsp" style="color:#4c8de5;">退出</a></div>
                <%
                    }else{
                %>
                <div class="enter" style="width: 70px"><a href="<%=ctx%>/login.jsp" style="color:#4c8de5;">个人登录</a></div>
                <div class="login" style="width: 70px"><a href="<%=ctx%>/register.jsp" style="color:#4c8de5;">个人注册</a></div>
                <%}}%>
                <!-- <div class="tixing"><span>提醒</span><img src="<%=ctx%>/images/xiangxia.png"/></div>
                <div class="shoucang">收藏</div> -->
                <!-- <div class="guanzhu"><span>关注</span><img src="images/xiangxia.png"/></div> -->
                <div class="enter" style="width:124px;"><a href="<%=ctx%>/company.jsp" style="color:#4c8de5;">线上合作商家加盟</a></div>
            </div>
        </div>

        <div class="banner">

           <div class="logo">
                <div class="logo_cont">
                         <!--  <a href="<%=ctx%>/index.jsp" style="color:#007fcc">  帮您养车网<br/><span>专注汽车服务</span></a> -->
                         <a href="/index.jsp" title=""><img alt="logo" src="images/logo.gif"></a>
                </div>
           </div>

            <div class="yebz_jd">
                <div class="yebz_jd_cont">
                    <div class="yebz_jd_contspan1" >
                        <p>1</p>
                        <span style="float:left">我的服务车</span>
                    </div>
                </div>
                <div class="yebz_jd_cont">
                    <div class="yebz_jd_contspan2" >
                        <p>2</p>
                        <span>核对订单信息</span>
                    </div>
                </div>
                <div class="yebz_jd_cont">
                    <div class="yebz_jd_contspan2" >
                        <p>3</p>
                        <span>订单提交成功</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
function getIpPlace(){
    return remote_ip_info["city"];
}
var city = getIpPlace();
var province = "";
if(city.length == 0){
    city = returnCitySN["cname"];
    if(city.length > 0){
        if(city.indexOf("省") > -1){
            city = returnCitySN['cname'].substring(returnCitySN['cname'].indexOf("省") + 1,returnCitySN['cname'].length - 1);
        }else{
            if(city.indexOf("自治区") == -1){
                city = returnCitySN['cname'].substring(0,returnCitySN['cname'].indexOf("市") + 1);
            }
        }
    }
}
if(city.length > 0){
    if($('#setcity').val().length == 0){
        $('.denglu_left h').html(city);
    }
}else{
    province = remote_ip_info["province"];
    if(province.length == 0){
        province = returnCitySN["cname"];
        if(province.length > 0){
            if(city.indexOf("省") > -1){
                city = returnCitySN['cname'].substring(0,returnCitySN['cname'].indexOf("省") + 1);
            }else{
                if(city.indexOf("自治区") == -1){
                    city = returnCitySN['cname'].substring(0,returnCitySN['cname'].indexOf("市") + 1);
                }
            }
        }
    }
}
function setNowCityName(){
    var uri = "<%=ctx%>/former/setnowcity.do?";
    var cityname = "";
    if(city.length > 0){
        cityname = city;
        cityname = encodeURI(encodeURI(cityname)); 
        uri = uri + "city=" + cityname;
    }else{
        nowprovince = encodeURI(encodeURI(nowprovince)); 
        uri = uri + "province=" + nowprovince;
    }

    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.nowcity.length > 0){
                var showcity = ret.nowcity.substring(0,ret.nowcity.length - 1);
                $('.denglu_left h').html(showcity);
            }else{
                $('.denglu_left h').html("上海");
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
$(function(){
    if($('#setcity').val().length == 0){
        setNowCityName();
    }
})
</script>