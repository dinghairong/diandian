<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	Company company = (Company)session.getAttribute("company");
    if(company == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }
    CompanyDao companyDao = (CompanyDao)SpringUtils.getBean(CompanyDao.class);
    List<Company> company_list = companyDao.findCompanyUserByMasterId(company.getId());
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－企业用户－－账号管理</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/caccount.css">
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
        <div class="top_line"></div>
		<div id="bodySection" style="overflow: hidden;min-height:0;">
            <div class="qyyh_lsddAll">
                <div class="qyyh_lsdd">
                    <div class="nav">
                        <a href="<%=ctx%>/cwelcome.jsp">欢迎页</a>
                        <a href="<%=ctx%>/cselect.jsp">服务选购</a>
                        <a href="<%=ctx%>/corder.jsp">消费订单管理</a>
                        <a href="<%=ctx%>/caccount.jsp" class="on">账号管理</a>
                        <a href="<%=ctx%>/count.jsp" style="border-right: 0!important;">统计</a>
                    </div>

                    <ul class="qyyh_lsdd_cont">
                        <li class="title">
                            <span style="width: 43px;"><input type="checkbox" class="checkbox" onclick="allchecked(this)"/></span>
                            <span style="width: 202px;">账号名</span>
                            <span style="width: 202px;">手机号码</span>
                            <span style="width: 203px;">密码</span>
                            <span class="no" style="width: 302px;">说明</span>
                        </li>
                        <%
                            if(company_list.size() > 0){
                                for(int i = 0;i < company_list.size();i ++){
                        %>
                        <li>
                            <input type="hidden" id="cid" value="<%=company_list.get(i).getId()%>">
                            <span style="width: 43px;"><input type="checkbox" class="checkbox"/></span>
                            <span style="width: 202px;"><%=company_list.get(i).getCompany()%></span>
                            <span style="width: 202px;"><%=company_list.get(i).getPhone()%></span>
                            <span style="width: 203px;">******</span>
                            <span class="no" style="width: 302px;"><%=company_list.get(i).getContacts()%></span>
                        </li>
                        <%}}else{%>
                        <li>暂无子账号</li>
                        <%}%>
                        <!-- <li>
                            <span style="width: 43px;"><input type="checkbox" class="checkbox"/></span>
                            <span style="width: 202px;">taylor719</span>
                            <span style="width: 202px;">123456789012</span>
                            <span style="width: 203px;">******</span>
                            <span class="no" style="width: 302px;">客服A</span>
                        </li> -->
                    </ul>

                    <div class="qyyh_zhgl_xgan">
                        <a href="javascript:void(0)" onclick="openxiugai()"><img src="images/qyyh_xiugai.png"/></a>
                        <a href="javascript:void(0)" onclick="openzengjia()"><img src="images/qyyh_zengjia.png"/></a>
                        <a href="javascript:void(0)" onclick="opensuosuo()"><img src="images/qyyh_sousuo.png"/></a>
                        <a href="<%=ctx%>/caccount.jsp"><img src="images/qyyh_shuaxin.png"/></a>
                        <a href="javascript:void(0)" onclick="shanchu()"><img src="images/qyyh_shanchu.png"/></a>
                    </div>

                    <!-- <div class="qyyh_fenye">
                        <a class="shangxia">上一页</a>
                        <a class="on">1</a>
                        <a>2</a>
                        <a>3</a>
                        <span>...</span>
                        <a>7</a>
                        <a class="shangxia">下一页</a>
                        <p>总数量：45单</p>
                    </div> -->
                    <div id="forget1" class="userinfobody forgetbodyheight" style="z-index: 9999999; position: fixed; top: 150px; left: 470px;display:none;">
                        <div class="userinfoarea">
                            <span id="addtitle">添加子账号</span>
                            <span id="changetitle">修改子账号</span>
                            <div class="closebtn"></div>
                        </div>
                        <form id="user_form" method="post" class="register">
                            <input type="hidden" id="userid" name="company.id">
                            <div class="register-row">
                                <div class="register-row-left">
                                    <em>*</em>
                                    账号名：
                                </div>
                                <div class="register-row-input">
                                    <div class="input-box">
                                        <input id="username" class="pub-input phone" type="text" name="company.company">
                                    </div>
                                    <div class="tips"></div>
                                    <div class="name-error">请输入子账号名！</div>
                                </div>
                            </div>
                            <div class="register-row">
                                <div class="register-row-left">
                                    <em>*</em>
                                    手机号码：
                                </div>
                                <div class="register-row-input">
                                    <div class="input-box">
                                        <input id="userphone" class="pub-input image_code" name="company.phone">
                                    </div>
                                    <div class="tips"></div>
                                    <div class="phone-error">输入的手机号码有误！</div>
                                </div>
                            </div>
                            <div class="register-row">
                                <div class="register-row-left">
                                    <em>*</em>
                                    密  码：
                                </div>
                                <div class="register-row-input">
                                    <div class="input-box">
                                        <input id="userpwd" class="pub-input verify_code" name="company.password" type="password">
                                    </div>
                                    <div class="tips"></div>
                                    <div class="pwd-error">请输入子账号的登录密码！</div>
                                </div>
                            </div>
                            <div class="register-row">
                                <div class="register-row-left">
                                    <em>*</em>
                                    说  明：
                                </div>
                                <div class="register-row-input">
                                    <div class="input-box">
                                        <input id="usermsg" class="pub-input verify_code" name="company.contacts">
                                    </div>
                                    <div class="tips"></div>
                                    <div class="msg-error">请输入子账号的说明！</div>
                                </div>
                            </div>
                            <div class="register-row" id="adduser">                          
                                <div class="register-row-input" >
                                    <a id="register_submit_button" class="pub-btn-big-orange" onclick="zengjia()">添&nbsp;&nbsp;&nbsp;&nbsp;加</a>
                                </div>
                            </div>
                            <div class="register-row" id="changeuser">                          
                                <div class="register-row-input" >
                                    <a id="register_submit_button" class="pub-btn-big-orange" onclick="xiugai()">修&nbsp;&nbsp;&nbsp;&nbsp;改</a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="forget2" style="position: fixed; z-index: 9999998; background-color: black; opacity: 0.3; right: 0px; bottom: 0px; left: 0px; top: 0px;display:none;"></div>
                    <div id="forget3" class="userinfobody forgetbodyheight" style="z-index: 9999999; position: fixed; top: 150px; left: 470px;display:none;height:120px;">
                        <div class="userinfoarea">
                            <span>查找账号</span>
                            <div class="closebtn2"></div>
                        </div>
                        <div class="register-row">
                            <div class="register-row-left">
                                账号名或手机号码：
                            </div>
                            <div class="register-row-input">
                                <div class="input-box">
                                    <input id="search" class="pub-input phone" type="text" name="search">
                                    <button onclick="suosuo()" style="margin-left:100px;width:80px;height:25px;background-color:#007fcc;color:#fff;">搜索</button>
                                </div>
                                <div class="tips"></div>
                                <div class="name-error">请输入子账号名！</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();
});

function allchecked(obj){
    if($(obj).is(":checked")){
        for(var i = 0;i < $("input[type='checkbox']").length;i ++){
            if(i != 0){
                $("input[type='checkbox']")[i].checked = true;
            }       
        }
    }else{
       for(var i = 0;i < $("input[type='checkbox']").length;i ++){
            if(i != 0){
                $("input[type='checkbox']")[i].checked = false;
            }       
        } 
    }
}
function openxiugai(){
    var obj;
    var checknum = 0;
    for(var i = 0;i < $("input[type='checkbox']").length;i ++){
        if(i != 0){
            if($("input[type='checkbox']")[i].checked){
                checknum ++;
                obj = $("input[type='checkbox']")[i];
            }
        }       
    }
    if(checknum == 0){
        sAlert("请选择需要修改的子账号");
        return false;
    }
    if(checknum > 1){
        sAlert("一次只能选择一个子账号进行修改");
        return false;
    }
    $('#forget1').show();
    $('#forget2').show();
    $('#addtitle').hide();
    $('#changetitle').show();
    $('#adduser').hide();
    $('#changeuser').show();

    $('#userid').val($(obj).parent().parent().find("#cid").val())
    $('#username').val($($(obj).parent().parent().find("span")[1]).html());
    $('#userphone').val($($(obj).parent().parent().find("span")[2]).html());
    $('#userpwd').val($($(obj).parent().parent().find("span")[3]).html());
    $('#usermsg').val($($(obj).parent().parent().find("span")[4]).html());
}
function xiugai(){
    var name = $('#username').val();
    var phone = $('#userphone').val();
    var pwd = $('#userpwd').val();
    var msg = $('#usermsg').val();
    if(name.length == 0){
        $('.name-error').show();
        return false;
    }else{
        $('.name-error').hide();
    }
    if(phone.length == 0){
        $('.phone-error').html("请输入手机号码");
        $('.phone-error').show();
        return false;
    }else if(!/^0?1[34578]\d{9}$/.test(phone)){
        $('.phone-error').html("手机号码格式错误");
        $('.phone-error').show();
        return false;
    }else{
        $('.phone-error').hide();
    }
    if(pwd.length == 0){
        $('.pwd-error').html("请输入子账号的登录密码！");
        $('.pwd-error').show();
        return false;
    }else{
        if(pwd.length < 6){
            $('.pwd-error').html("密码长度不能小于6");
            $('.pwd-error').show();
            return false; 
        }else{
            $('.pwd-error').hide();
        }
    }
    if(msg.length == 0){
        $('.msg-error').show();
        return false;
    }else{
        $('.msg-error').hide();
    }
    $.ajax({
        url: "<%=request.getContextPath()%>/former/changeuser.do",
        type: "post",
        dataType: "JSON",
        data:jQuery("#user_form").serialize(),
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.result == 0){
                $('#forget1').hide();
                $('#forget2').hide();
                sAlert3("子账号修改成功！",window.location.href);
            }
            if(ret.result == 1){
                sAlert("该账号已经存在！");
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
function openzengjia(){
    $('#forget1').show();
    $('#forget2').show();
    $('#addtitle').show();
    $('#changetitle').hide();
    $('#adduser').show();
    $('#changeuser').hide();

    $('#username').val("");
    $('#userphone').val("");
    $('#userpwd').val("");
    $('#usermsg').val("");
}
function zengjia(){
    var name = $('#username').val();
    var phone = $('#userphone').val();
    var pwd = $('#userpwd').val();
    var msg = $('#usermsg').val();
    if(name.length == 0){
        $('.name-error').show();
        return false;
    }else{
        $('.name-error').hide();
    }
    if(phone.length == 0){
        $('.phone-error').html("请输入手机号码");
        $('.phone-error').show();
        return false;
    }else if(!/^0?1[34578]\d{9}$/.test(phone)){
        $('.phone-error').html("手机号码格式错误");
        $('.phone-error').show();
        return false;
    }else{
        $('.phone-error').hide();
    }
    if(pwd.length == 0){
        $('.pwd-error').html("请输入子账号的登录密码！");
        $('.pwd-error').show();
        return false;
    }else{
        if(pwd.length < 6){
            $('.pwd-error').html("密码长度不能小于6");
            $('.pwd-error').show();
            return false; 
        }else{
            $('.pwd-error').hide();
        }
    }
    if(msg.length == 0){
        $('.msg-error').show();
        return false;
    }else{
        $('.msg-error').hide();
    }
    $.ajax({
        url: "<%=request.getContextPath()%>/former/adduser.do",
        type: "post",
        dataType: "JSON",
        data:jQuery("#user_form").serialize(),
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.result == 0){
                $('#forget1').hide();
                $('#forget2').hide();
                sAlert3("子账号添加成功！",window.location.href);
            }
            if(ret.result == 1){
                sAlert("该账号已经存在！");
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
$('.closebtn').click(function(){
    $('#forget1').hide();
    $('#forget2').hide();
});
$('.closebtn2').click(function(){
    $('#forget3').hide();
    $('#forget2').hide();
});
function opensuosuo(){
   $('#forget3').show();
   $('#forget2').show(); 
}
function suosuo(){
    var search = $('#search').val();
    if(search.length == 0){
        sAlert("请输入你需要查找的账号或手机号");
        return false;
    }
    $.ajax({
        url: "<%=request.getContextPath()%>/former/searchuser.do?search=" + search,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.result == 0){
                $('#forget3').hide();
                $('#forget2').hide();
                var li1 = "<li class='title'>" + $('.qyyh_lsdd_cont li.title').html() + "</li>";
                $('.qyyh_lsdd_cont').html(li1 + ret.html);
            }
            if(ret.result == 1){
                sAlert("没有查询到相关账号！");
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
function shanchu(){
    var ischecked = false;
    var obj;
    var userlist = "";
    for(var i = 0;i < $("input[type='checkbox']").length;i ++){
        if(i != 0){
            if($("input[type='checkbox']")[i].checked){
                ischecked = true;
                obj = $("input[type='checkbox']")[i];
                userlist = userlist + $(obj).parent().parent().find("#cid").val() + ",";
            }
        }       
    }
    if(!ischecked){
        sAlert("请选择需要删除的子账号");
        return false;
    }

    var uri = "<%=request.getContextPath()%>/former/deleteuser.do?set_cid=" + userlist;
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.result == 0){
                $('#forget3').hide();
                $('#forget2').hide();
                sAlert3("子账号删除成功！",window.location.href);
            }
            if(ret.result == 1){
                sAlert("没有查询到相关账号！");
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
</script>
</html>