<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
    AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);

    String setcity = (String)session.getAttribute("setcity");
    if((setcity == null) || (setcity.length() == 0)){
        setcity = "上海市";
    }
    List<AreaDetail> province_list = areaDetailDao.findAllProvince();
    List<AreaDetail> selectcity = areaDetailDao.findAllCountyByCity(setcity);
    String selectprovince = "";
    if(selectcity.size() > 0){
        selectprovince = selectcity.get(0).getProvince();
        selectcity = areaDetailDao.findAllCityByProvince(selectprovince);
    }else{
        selectcity = areaDetailDao.findAllCityByProvince("上海市");
        selectprovince = selectcity.get(0).getProvince();
    }
    String showstr = "";
    List<String> isRepeat = new ArrayList<String>();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－企业用户－－登录</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/cregister.css">
	 <link href="images/favicon.ico" rel="shortcut icon"/>

    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
    <script type="text/javascript">
        $(function() {
            $(".wrap").flexslider({
                animation: "slide",
                controlNav: true,
                animationLoop: true
            });
        });
        var ctx = "<%=ctx%>";
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<a class="qyyh_login" href="<%=ctx%>/clogin.jsp">登录</a>
		<a class="qyyh_login" href="<%=ctx%>/cregister.jsp"><span>开通</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a>
		<div class="qyyh_cont"></div>
        <div class="qyyh_djxx">
            <div class="qyyh_djxx_head">
                登记信息
            </div>
            <form id="companyInfo">
            <ul>
                <li>
                    <div class="qyyh_djxx_left"><span>公司：</span><img src="<%=ctx%>/images/yy_xing.png"/></div>
                    <input value="请输入公司名称" onfocus="if(this.value == '请输入公司名称'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '请输入公司名称';this.style.color = '#b0b0b0'}" id="cname" name="company.company"/>
                    <span class="name_error">＊ 请输入公司名称</span>
                </li>
                <li>
                    <div class="qyyh_djxx_left"><span>联系人：</span><img src="<%=ctx%>/images/yy_xing.png"/></div>
                    <input value="请输入联系人称呼" onfocus="if(this.value == '请输入联系人称呼'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '请输入联系人称呼';this.style.color = '#b0b0b0'}" id="contact" name="company.contacts"/>
                    <span class="contact_error">＊ 请输入联系人称呼</span>
                </li>
                <li>
                    <div class="qyyh_djxx_left"><span>联系电话：</span><img src="<%=ctx%>/images/yy_xing.png"/></div>
                    <input value="请输入联系人电话" onfocus="if(this.value == '请输入联系人电话'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '请输入联系人电话';this.style.color = '#b0b0b0'}" id="cmobile" name="company.phone"/>
                    <span class="mobile_error">＊ 请输入联系人电话</span>
                </li>
                <li>
                    <div class="qyyh_djxx_left"><span>联系邮箱：</span></div>
                    <input value="请输入联系人邮箱" onfocus="if(this.value == '请输入联系人邮箱'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '请输入联系人邮箱';this.style.color = '#b0b0b0'}" id="cemail" name="company.email"/>
                    <span class="email_error">＊ 请输入联系人邮箱</span>
                </li>
                <li>
                    <div class="qyyh_djxx_left"><span>所属地区：</span></div>
                    <select class="qyyh_select" id="provinceSelect">
                        <%
                        isRepeat.clear();
                        for(int i = 0;i < province_list.size();i ++){
                            if(!isRepeat.contains(province_list.get(i).getProvince())){
                                isRepeat.add(province_list.get(i).getProvince());
                                if(selectprovince.equals(province_list.get(i).getProvince())){
                        %>
                        <option selected="selected"><%=province_list.get(i).getProvince()%></option>
                        <%
                                }else{
                        %>
                        <option><%=province_list.get(i).getProvince()%></option>
                        <%
                                }
                            }
                        }                       
                        %>
                    </select>
                    <select class="qyyh_select" id="citySelect">
                        <%
                        isRepeat.clear();
                        for(int i = 0;i < selectcity.size();i ++){
                            if(!isRepeat.contains(selectcity.get(i).getCity())){
                                isRepeat.add(selectcity.get(i).getCity());
                                if(setcity.indexOf(selectcity.get(i).getCity()) > -1){
                        %>
                            <option value="<%=selectcity.get(i).getId()%>" selected><%=selectcity.get(i).getCity()%></option>
                        <%
                                }else{
                        %>
                            <option value="<%=selectcity.get(i).getId()%>"><%=selectcity.get(i).getCity()%></option>
                        <%
                                }
                            }
                        }
                        %>
                    </select>
                </li>
                <li>
                    <div class="qyyh_djxx_left"><span>详细地址：</span></div>
                    <input value="请输入详细地址" onfocus="if(this.value == '请输入详细地址'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '请输入详细地址';this.style.color = '#b0b0b0'}" id="caddress" name="company.address"/>
                </li>
                <!-- <li>
                    <div class="qyyh_djxx_left"><span>企业账号名称：</span><img src="<%=ctx%>/images/yy_xing.png"/></div>
                    <input class="qyyhSq_yb" value="请输入企业账号名称" onfocus="if(this.value == '请输入企业账号名称'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '请输入企业账号名称';this.style.color = '#b0b0b0'}" id="caccount" name="company.name"/>
                </li> -->
                <li>
                    <div class="qyyh_djxx_left"><span>初始密码：</span><img src="<%=ctx%>/images/yy_xing.png"/></div>
                    <input class="qyyhSq_yb" type="password" id="cpassword" name="company.password"/>
                    <span class="pwd_error">＊ 请输入密码</span>
                </li>
                <li>
                    <div class="qyyh_djxx_left"><span>确认密码：</span><img src="<%=ctx%>/images/yy_xing.png"/></div>
                    <input class="qyyhSq_yb" type="password" id="crepassword" name="crepassword"/>
                    <span class="repwd_error">＊ 两次密码输入不一致</span>
                    <span class="repwd_error2">＊ 请输入确认密码</span>
                </li>
            </ul>
            <input type="hidden" id="setcityid" name="city_id" value="">
            </form>
            <div class="tongyi">
                <span>
                    <em>
                        <input type="checkbox" checked="checked">
                    </em>
                    <em style="margin-left:10px;">
                        同意帮您养车
                        <a class="to-agreement" target="_blank" href="<%=ctx%>/a_a.jsp">用户协议</a>
                    </em>
                </span>
            </div>
            
            <a class="qyyh_tjAn" onclick="saveRegisterInfo()">提交申请</a>
        </div>


		<div id="bodySection" style="overflow: hidden;min-height:0;margin-top:20px;">
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();
});
$('#provinceSelect').change(function(){
    var province = this.options[this.selectedIndex].innerHTML;
    province = encodeURI(encodeURI(province));

    $.ajax({
        url: "<%=ctx%>/former/getcitybyprovince.do?province=" + province,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            $('#citySelect').html(ret.html);
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
});
$('#citySelect').change(function(){
    $('#setcityid').val($(this).val());
})
$('#crepassword').keyup(function(){
    var pwd1 = $('#cpassword').val();
    var pwd2 = $('#crepassword').val();
    if(pwd1 != pwd2){
        $('.repwd_error').show();
    }else{
       $('.repwd_error').hide(); 
    }
});
/* 密码安全程度 */
$('#cpassword').bind('keyup', function(){
    $('.password-level').removeClass('level1');
    $('.password-level').removeClass('level2');
    $('.password-level').removeClass('level3');
    
    var password = $(this).val();
    if(/^[0-9]+$/.test(password) || /^[a-z]+$/.test(password)){
        $('.password-level').addClass('level1');
    }else if(/^[0-9|a-z]+$/.test(password)){
        $('.password-level').addClass('level2');
    }else if(/^[0-9|a-z|\D|^0-9|^a-z]+$/.test(password)){
        $('.password-level').addClass('level3');
    }
});

function saveRegisterInfo(){
    var cname = $('#cname').val();
    var contact = $('#contact').val();
    var cmobile = $('#cmobile').val();
    var cemail = $('#cemail').val();
    var cityid = $('#citySelect').val();
    var caddress = $('#caddress').val();
    // var caccount = $('#caccount').val();
    var cpassword = $('#cpassword').val();
    var crepassword = $('#crepassword').val();

    if(!$("input[type='checkbox']").is(":checked")){
        sAlert("请先阅读用户协议，并同意!");
        return false;
    }
    if(cname.length == 0){
        $('.name_error').show();
        return false;
    }else{
        if(cname == "请输入公司名称"){
            $('.name_error').show();
            return false;  
        }else{
            $('.name_error').hide();
        }
    }
    if(contact.length == 0){
        $('.contact_error').show();
        return false;
    }else{
        if(contact == "请输入联系人称呼"){
            $('.contact_error').show();
            return false; 
        }else{
            $('.contact_error').hide();
        }
    }
    if(cmobile.length == 0){
        $('.mobile_error').show();
        return false;
    }else{
        if(cmobile == "请输入联系人电话"){
            $('.mobile_error').show();
            return false;
        }else{
            $('.mobile_error').hide();
        }      
    }
    if(cemail.length == 0){
        $('.email_error').show();
        return false;
    }else{
        $('.email_error').hide();
    }
    if(cpassword.length == 0){
        $('.pwd_error').show();
        return false;
    }else{
        $('.pwd_error').hide();
    }
    if(crepassword.length == 0){
        $('.repwd_error').show();
        return false;
    }else{
        $('.repwd_error').hide();
    }
    if(cpassword.length < 6){
        sAlert("密码位数不能少于6位!");
        return false;
    }
    if(crepassword != cpassword){
        $('.repwd_error').show();
        return false;
    }else{
        $('.repwd_error').hide();
    }
    if(!/^0?1[34578]\d{9}$/.test(cmobile)){
        sAlert("手机号码格式错误");
        return false;
    }else{
        $.ajax({
            dataType:"json",
            async:false,
            url : "<%=ctx%>/former/checkcmobile.do",
            data: "checkmobile="+cmobile,
            type:"POST",
            timeout: 10000,
            success: function(data){
                if(data.result == "fail"){
                    sAlert("该手机号已经被注册过");                   
                    return false;
                }
                else{
                    //slef.attr("verify-finish",true);
                }
            }
        })
    }
    $('#setcityid').val(cityid);
    // var prama = {cname:cname,cmobile:cmobile,contact:contact,cemail:cemail,cemail:cemail,city_id:cityid,caddress:caddress,caccount:caccount,cpassword:cpassword};
    $.ajax({
        url: "<%=ctx%>/former/cregister.do",
        type:"POST",
        // data:prama,
        data:jQuery("#companyInfo").serialize(),
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.ok == true){
                if(ret.http_referer){
                    window.location.href = ret.http_referer;
                    return false;
                }
            }else {                        
                if(ret.errCode==1){
                    sAlert("该联系电话已经被注册过");
                    return false;
                }
            }
        }
    });
}

</script>
</html>