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
    <title>帮您养车网－－账号注册</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/register.css">
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
		<div class="qyyh_cont"></div>

		<div id="bodySection" style="overflow: hidden;min-height:0;">
             <div class="register">
            <div class="register-infobox step1">
                <h2>免费注册帮您养车会员，率先享有特权优惠</h2>
                    <form id="member_register_form" method="post">
                        <input type="hidden" value="" name="http_referer">
                        <div class="register-row">
                            <div class="register-row-left">
                                <em>*</em>
                                手机号码：
                            </div>
                            <div class="register-row-input">
                                <div class="input-box">
                                    <input id="register_mobile" class="pub-input phone" type="text" name="mobile">
                                </div>
                                <div class="tips"></div>
                                <div class="phone-error">亲，您输入的手机号码有误！</div>
                            </div>
                        </div>
                        <div class="register-row">
                            <div class="register-row-left">
                                <em>*</em>
                                图片验证码：
                            </div>
                            <div class="register-row-input">
                                <div class="input-box">
                                    <input id="register_image_code" class="pub-input image_code" name="imagecode">
                                </div>
                               <span class="show_image_code">
										<img id='imgVcode' src="<%=ctx%>/former/imagecode" />
								</span>
                                <a href="javascript:;"onclick="document.getElementById('imgVcode').src='<%=ctx%>/former/imagecode?'+new Date()" style="color: black;float:left;line-height:42px;">
                                看不清
                                </a>
                                <div class="tips"></div>
                            </div>
                        </div>
                        <div class="register-row">
                            <div class="register-row-left">
                                <em>*</em>
                                短信验证码：
                            </div>
                            <div class="register-row-input">
                                <div class="input-box">
                                    <input id="register_verify_code" class="pub-input verify_code" name="verifycode">
                                </div>
                                <a id="register_get_code" class="pub-btn-small-green" group="" href="javascript:void(0)">
                                获取验证码
                                </a>
                                <div class="tips"></div>
                            </div>
                        </div>
                        <div class="register-row">
                            <div class="register-row-left">
                                <em>*</em>
                                所属地区：
                            </div>
                            <div class="register-row-input">
                                <div class="input-box">
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
                                        %>
                                            <option value="<%=selectcity.get(i).getId()%>"><%=selectcity.get(i).getCity()%></option>
                                        <%
                                            }
                                        }
                                        %>
                                    </select>
                                </div>
                                <div class="tips"></div>
                                <div class="phone-error">亲，您输入的手机号码有误！</div>
                            </div>
                        </div>
                        <div class="register-row">
                            <div class="register-row-left">
                                <em>*</em>
                                登录密码：
                            </div>
                            <div class="register-row-input">
                                <input id="password_reg_input" class="pub-input password" type="password" name="password">
                                </br>
                                <div class="tips"></div>
                                <div class="password-level">
                                    <span class="low">低</span>
                                    <span class="middle">中</span>
                                    <span class="high">高</span>
                                </div>
                            </div>
                        </div>
                        <div class="register-row" style="margin-top:40px;">
                            <div class="register-row-left">
                                <em>*</em>
                                确认密码：
                            </div>
                            <div class="register-row-input">
                                <input id="repassword_reg_input" class="pub-input re-password" type="password" name="repassword">
                                <div class="tips">请输入确认密码</div>
                            </div>
                        </div>
                        <div class="register-row">
                            <div class="register-row-left"> </div>
                            <div class="register-row-input agreement">
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
                        </div>
                        <div class="register-row">
                            
                            <div class="register-row-input" >
                                <a id="register_submit_button" class="pub-btn-big-orange">同意协议并注册</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.head_nav').hide();
	$('.lunbo').hide();
});

$(function(){
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
    $(".register-row-input .pub-input").on("focus",function(){
            $(this).parents(".register-row-input").removeClass("error");
    });
    $(".register-row-input .tips").on("click",function(){
        var obj = $(this).parents(".register-row-input");
        obj.removeClass("error");
        obj.find("input").focus();
    });
    
    $("input[name=mobile]").on("blur",function(){
        if(VerifyMobile(this)){
            $(this).attr("verify-finish",true);
        }
    });
    $("input[name=password]").on("blur",function(){
        if(VerifyPassword(this)){
            $(this).attr("verify-finish",true);
        }
    });
    $("input[name=repassword]").on("blur",function(){
        if(VerifyRePassword(this)){
            $(this).attr("verify-finish",true);
        }
    });
    $("input[name=verifycode]").on("blur",function(){
        if(VerifyVerifyCode(this)){
            $(this).attr("verify-finish",true);
        }
    });
    $("input[name=imagecode]").on("blur",function(){
        if(VerifyImageCode(this)){
            $(this).attr("verify-finish",true);
        }
    });
    $("#register_get_code").on("click",function(){
        if($(this).hasClass("on")){ return false;}
        if($("input[name=mobile]").attr("verify-finish")){
            var self = $(this);
            self.html("正在发送").addClass('on');
            $.ajax({
                url:"<%=ctx%>/former/sendcode.do",
                dataType:"json",
                async:true,
                data:"mobile="+$("input[name=mobile]").val(),
                type:"POST",
                timeout: 30000,
                error:function(){
                    sAlert("验证码发送失败");
                    self.html("发送验证码").removeClass("on");
                    return false;
                },
                success: function(){
                    var html = '验证码已发送(<i>60</i>)';
                    self.html(html);
                    regCodeInterval = setInterval(function(){
                        regCodeTimeinterval();
                        }, 1000);
                }
            });
        }
    });

    /* 验证手机 */
    function VerifyMobile(id){
        var mobile = $(id).val(),msg = "",slef = $(id),
            parent = $(id).parents(".register-row-input"),
            tip = parent.find(".tips");
        if(mobile==""){
            msg = "请输入您的手机号";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }else if(!/^0?1[34578]\d{9}$/.test(mobile)){
            msg = "手机号码格式错误";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }else{
            $.ajax({
                dataType:"json",
                async:false,
                url : "<%=ctx%>/former/checkmobile.do",
                data: "checkmobile="+mobile,
                type:"POST",
                timeout: 10000,
                success: function(data){
                    if(data.result == "fail"){
                        msg = "该手机号已经被注册过";
                        tip.html(msg);
                        parent.addClass("error");
                        $(id).val("");
                        return false;
                    }else{
                        slef.attr("verify-finish",true);
                    }
                }
            })
        }
        return;
    }

    /* 验证密码 */
    function VerifyPassword(id){
        var password = $(id).val(),msg = "",
            parent = $(id).parents(".register-row-input"),
            tip = parent.find(".tips");
        if(password==""){
            msg = "请输入密码";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }
        if(password.length<6){
            msg = "密码位数不能少于6位!";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }
        return true;
    }
    /* 验证确认密码 */
    function VerifyRePassword(id){
        var repassword = $(id).val(),password = $("input[name=password]").val(),
            parent = $(id).parents(".register-row-input"),
            tip = parent.find(".tips"),msg = "";
        if(repassword==""){
            msg = "请输入确认密码";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }
        if(repassword!=password){
            msg = "两次密码输入不一致";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }
        return true;
    }
    /* 检测验证码 */
    function VerifyVerifyCode(id){
        var code = $(id).val(),msg = "",
            parent = $(id).parents(".register-row-input"),
            tip = parent.find(".tips");
        if(code==""){
            msg = "请输入短信验证码";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }
        return true;
    }
    /* 检测验证码 */
    function VerifyImageCode(id){
        var code = $(id).val(),msg = "",
            parent = $(id).parents(".register-row-input"),
            tip = parent.find(".tips");
        if(code==""){
            msg = "请输入图片验证码";
            tip.html(msg);
            parent.addClass("error");
            $(id).val("");
            return false;
        }
        return true;
    }
    /* 密码安全程度 */
    $('#password_reg_input').bind('keyup', function(){
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
    /* 重新发送 */
    function regCodeTimeinterval(){
        var currTime = $('#register_get_code i').html();
        var newTime = parseInt(currTime) - 1;
        if(newTime){
            $('#register_get_code i').html(newTime);
        }else{
            clearInterval(regCodeInterval);
            $('#register_get_code').html('重新发送').removeClass('on'); 
        }
    }
    //将注册提交绑定提交按钮
    $("#register_submit_button").click(function(){      
        var mobile = $("input[name=mobile]"),
            code  = $("input[name=verifycode]"),
            imgcode = $("input[name=imagecode]"),
            psw  = $("input[name=password]"),
            repsw  = $("input[name=repassword]");
            cityid = $("#citySelect");
        var mobile_v = mobile.attr("verify-finish"),
            code_v  = code.attr("verify-finish"),
            imgcode_v = imgcode.attr("verify-finish"),
            psw_v  = psw.attr("verify-finish"),
            repsw_v  = repsw.attr("verify-finish");
        if(!$("input[type='checkbox']").is(":checked")){
            sAlert("请先阅读帮您养车用户协议并同意！");
            return false;
        }
        if(mobile_v && code_v && psw_v && repsw_v){
            var prama = {mobile:mobile.val(),verifycode:code.val(),password:psw.val(),imagecode:imgcode.val(),city_id:cityid.val()}
            $.ajax({
                url: "<%=ctx%>/former/register.do",
                type:"POST",
                data:prama,
                dataType: "JSON",
                async: false,
                timeout: 3000,
                success: function(ret){
                    if(ret.result == "ok"){
                        if(ret.http_referer){
                            window.location.href = ret.http_referer;
                            return false;
                        }
                    }else {                        
                        if(ret.errCode==1){
                            sAlert("请先获取验证码");
                            return false;
                        }
                        if(ret.errCode==2){
                            sAlert("短信验证码错误");
                            return false;
                        }
                        if(ret.errCode==3){
                            sAlert("图片验证码错误");
                            return false;
                        }
                        if(ret.errCode==4){
                            sAlert("该号码已被注册");
                            return false;
                        }
                        if(ret.errCode==5){
                            sAlert("注册失败");
                            return false;
                        }
                    }
                }
            })
        }else{
            mobile.trigger("blur");
            code.trigger("blur");
            psw.trigger("blur");
            repsw.trigger("blur");
        }
        
    });
})
</script>
</html>