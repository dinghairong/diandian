<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*,java.util.Date"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.alipay.util.UtilDate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
    SmartProperties smartProp = SmartProperties.getInstance();
	Company company = (Company)session.getAttribute("company");
    if(company == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }
    List<MyCart> myCart_list = (List<MyCart>) session.getAttribute("ProductInCart");
    DecimalFormat df=new DecimalFormat("######0.00");
    DateFormat d_f=new SimpleDateFormat("yyyy-MM-dd");
    UserCouponDao userCouponDao = (UserCouponDao) SpringUtils.getBean(UserCouponDao.class);
    MyCartDao myCartDao = (MyCartDao) SpringUtils.getBean(MyCartDao.class);
    
    double totla_price = 0;
    if(null == myCart_list){
        if(null != company){
            myCart_list = myCartDao.findMyCartByCompany(company.getId());
            session.setAttribute("ProductInCart", null);
            session.setAttribute("ProductInCart", myCart_list);
        }
        
    }
    if(null != myCart_list){
        for(int i = 0;i < myCart_list.size();i ++){
            totla_price = totla_price + myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum();
        }
    }
    String haveProduct = "";
    if(null != myCart_list){
        if(myCart_list.size() > 0){
            haveProduct = "1";
        }
    }
    String imgPath = smartProp.getImgPath();

    List<UserCoupon> coupon = userCouponDao.findCouponByCompanyAndStatus(company.getId(),0);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－企业用户－－欢迎页</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/cselect.css">
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
                        <a href="<%=ctx%>/cselect.jsp" class="on">服务选购</a>
                        <a href="<%=ctx%>/corder.jsp">消费订单管理</a>
                        <a href="<%=ctx%>/caccount.jsp">账号管理</a>
                        <a href="<%=ctx%>/count.jsp" style="border-right: 0!important;">统计</a>
                    </div>

                    <ul class="qyyh_lsdd_tab">
                        <li class="fwxgtab current">全部</li>
                        <li>安装服务</li>
                        <li>快修保养</li>
                        <li>美容装潢</li>
                        <li>检测修正</li>
                    </ul>
                    <div class="qyyh_xfddAll">
                        <!--全部-->
                        <div class="qyyh_xfdd_cont">
                            <ul class="fwxg">
                                <%
                                if(null != myCart_list){
                                if(myCart_list.size() > 0){
                                    for(int i = 0;i < myCart_list.size();i ++){
                                %>
                                 <li>
                                    <input type="checkbox" class="fwxginput" data-id="<%=myCart_list.get(i).getId()%>"/>
                                    <div class="fwxg_img">
                                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                        <%
                                        if(null != myCart_list.get(i).getServiceProduct().getIcon() && myCart_list.get(i).getServiceProduct().getIcon().length() > 0){
                                        %>
                                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + myCart_list.get(i).getServiceProduct().getPath()%>&imageName=<%=myCart_list.get(i).getServiceProduct().getIcon()%>" style="width:72;height:77px;">
                                        <%
                                        }else{
                                        %>
                                        <img src="<%=ctx%>/img/hx_default.png" style="width:72;height:77px;">
                                        <%
                                        }
                                        %>
                                        </a>                                        
                                    </div>
                                    <p style="width:150px;text-align:center">
                                        <%=myCart_list.get(i).getServiceProduct().getTitle()%><br/>
                                        <span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
                                    </p>
                                    <div class="fwxg_fwjg">
                                        <p>服务价格：</p><br/>
                                        <span>¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%></span>
                                    </div>
                                    <div class="yy_Number fwxg_number">
                                        <span class="yy_reduce">-</span>
                                        <input type="text" value="<%=myCart_list.get(i).getNum()%>" id="productnum" class="inputproductnum"/>
                                        <span class="yy_add">+</span>
                                    </div>
                                    <input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                </li>
                                <%
                                    }
                                }else{
                                %>
                                暂未选择任何服务
                                <%}}else{%>
                                暂未选择任何服务
                                <%}%>
                            </ul>
                        </div>
                        <!--END全部-->

                        <div class="qyyh_xfdd_cont">
                            <ul class="fwxg">
                                <%
                            if(null != myCart_list){
                                if(myCart_list.size() > 0){
                                    boolean havethis1 = false;
                                    for(int i = 0;i < myCart_list.size();i ++){
                                        if(myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId() == 1){
                                            havethis1 = true;
                                %>
                                <li>
                                    <input type="checkbox" class="fwxginput" data-id="<%=myCart_list.get(i).getId()%>"/>
                                    <div class="fwxg_img">
                                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                        <%
                                        if(null != myCart_list.get(i).getServiceProduct().getIcon() && myCart_list.get(i).getServiceProduct().getIcon().length() > 0){
                                        %>
                                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + myCart_list.get(i).getServiceProduct().getPath()%>&imageName=<%=myCart_list.get(i).getServiceProduct().getIcon()%>" style="width:72;height:77px;">
                                        <%
                                        }else{
                                        %>
                                        <img src="<%=ctx%>/img/hx_default.png" style="width:72;height:77px;">
                                        <%
                                        }
                                        %>
                                        </a>                                        
                                    </div>
                                    <p>
                                        <%=myCart_list.get(i).getServiceProduct().getTitle()%><br/>
                                        <span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
                                    </p>
                                    <div class="fwxg_fwjg">
                                        <p>服务价格：</p><br/>
                                        <span>¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%></span>
                                    </div>
                                    <div class="yy_Number fwxg_number">
                                        <span class="yy_reduce">-</span>
                                        <input type="text" value="<%=myCart_list.get(i).getNum()%>" id="productnum" class="inputproductnum"/>
                                        <span class="yy_add">+</span>
                                    </div>
                                    <input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                </li>
                                <%
                                        }
                                    }
                                    if(!havethis1){
                                %>
                                暂未选择该项服务产品
                                <%
                                    }

                                }else{
                                %>
                                暂未选择任何服务
                                <%}}else{%>
                                暂未选择任何服务
                                <%}%>
                            </ul>
                        </div>

                        <div class="qyyh_xfdd_cont">
                            <ul class="fwxg">
                            <%
                            if(null != myCart_list){
                                if(myCart_list.size() > 0){
                                    boolean havethis2 = false;
                                    for(int i = 0;i < myCart_list.size();i ++){
                                        if(myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId() == 3){
                                            havethis2 = true;
                                %>
                                <li>
                                    <input type="checkbox" class="fwxginput" data-id="<%=myCart_list.get(i).getId()%>"/>
                                    <div class="fwxg_img">
                                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                        <%
                                        if(null != myCart_list.get(i).getServiceProduct().getIcon() && myCart_list.get(i).getServiceProduct().getIcon().length() > 0){
                                        %>
                                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + myCart_list.get(i).getServiceProduct().getPath()%>&imageName=<%=myCart_list.get(i).getServiceProduct().getIcon()%>" style="width:72;height:77px;">
                                        <%
                                        }else{
                                        %>
                                        <img src="<%=ctx%>/img/hx_default.png" style="width:72;height:77px;">
                                        <%
                                        }
                                        %>
                                        </a>                                        
                                    </div>
                                    <p>
                                        <%=myCart_list.get(i).getServiceProduct().getTitle()%><br/>
                                        <span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
                                    </p>
                                    <div class="fwxg_fwjg">
                                        <p>服务价格：</p><br/>
                                        <span>¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%></span>
                                    </div>
                                    <div class="yy_Number fwxg_number">
                                        <span class="yy_reduce">-</span>
                                        <input type="text" value="<%=myCart_list.get(i).getNum()%>" id="productnum" class="inputproductnum"/>
                                        <span class="yy_add">+</span>
                                    </div>
                                    <input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                </li>
                                <%
                                        }
                                       
                                    }
                                     if(!havethis2){
                                %>
                                暂未选择该项服务产品
                                <%
                                        }

                                }else{
                                %>
                                暂未选择任何服务
                                <%}}else{%>
                                暂未选择任何服务
                                <%}%>
                            </ul>
                        </div>

                        <div class="qyyh_xfdd_cont">
                            <ul class="fwxg">
                            <%
                            if(null != myCart_list){
                                if(myCart_list.size() > 0){
                                    boolean havethis3 = false;
                                    for(int i = 0;i < myCart_list.size();i ++){
                                        if(myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId() == 5){
                                            havethis3 = true;
                                %>
                                <li>
                                    <input type="checkbox" class="fwxginput" data-id="<%=myCart_list.get(i).getId()%>"/>
                                    <div class="fwxg_img">
                                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                        <%
                                        if(null != myCart_list.get(i).getServiceProduct().getIcon() && myCart_list.get(i).getServiceProduct().getIcon().length() > 0){
                                        %>
                                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + myCart_list.get(i).getServiceProduct().getPath()%>&imageName=<%=myCart_list.get(i).getServiceProduct().getIcon()%>" style="width:72;height:77px;">
                                        <%
                                        }else{
                                        %>
                                        <img src="<%=ctx%>/img/hx_default.png" style="width:72;height:77px;">
                                        <%
                                        }
                                        %>
                                        </a>                                        
                                    </div>
                                    <p>
                                        <%=myCart_list.get(i).getServiceProduct().getTitle()%><br/>
                                        <span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
                                    </p>
                                    <div class="fwxg_fwjg">
                                        <p>服务价格：</p><br/>
                                        <span>¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%></span>
                                    </div>
                                    <div class="yy_Number fwxg_number">
                                        <span class="yy_reduce">-</span>
                                        <input type="text" value="<%=myCart_list.get(i).getNum()%>" id="productnum" class="inputproductnum"/>
                                        <span class="yy_add">+</span>
                                    </div>
                                    <input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                </li>
                                <%
                                        }                                     
                                    }
                                    if(!havethis3){
                                %>
                                暂未选择该项服务产品
                                <%
                                        }
                                }else{
                                %>
                                暂未选择任何服务
                                <%}}else{%>
                                暂未选择任何服务
                                <%}%>
                            </ul>
                        </div>

                        <div class="qyyh_xfdd_cont">
                            <ul class="fwxg">
                            <%
                            if(null != myCart_list){
                                if(myCart_list.size() > 0){
                                    boolean havethis4 = false;
                                    for(int i = 0;i < myCart_list.size();i ++){
                                        if(myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId() == 7){
                                            havethis4 = true;
                                %>
                                <li>
                                    <input type="checkbox" class="fwxginput" data-id="<%=myCart_list.get(i).getId()%>"/>
                                    <div class="fwxg_img">
                                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                        <%
                                        if(null != myCart_list.get(i).getServiceProduct().getIcon() && myCart_list.get(i).getServiceProduct().getIcon().length() > 0){
                                        %>
                                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + myCart_list.get(i).getServiceProduct().getPath()%>&imageName=<%=myCart_list.get(i).getServiceProduct().getIcon()%>" style="width:72;height:77px;">
                                        <%
                                        }else{
                                        %>
                                        <img src="<%=ctx%>/img/hx_default.png" style="width:72;height:77px;">
                                        <%
                                        }
                                        %>
                                        </a>                                        
                                    </div>
                                    <p>
                                        <%=myCart_list.get(i).getServiceProduct().getTitle()%><br/>
                                        <span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
                                    </p>
                                    <div class="fwxg_fwjg">
                                        <p>服务价格：</p><br/>
                                        <span>¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%></span>
                                    </div>
                                    <div class="yy_Number fwxg_number">
                                        <span class="yy_reduce">-</span>
                                        <input type="text" value="<%=myCart_list.get(i).getNum()%>" id="productnum" class="inputproductnum"/>
                                        <span class="yy_add">+</span>
                                    </div>
                                    <input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
                                </li>
                                <%
                                        }                                       
                                    }
                                    if(!havethis4){
                                %>
                                暂未选择该项服务产品
                                <%
                                        }
                                }else{
                                %>
                                暂未选择任何服务
                                <%}}else{%>
                                暂未选择任何服务
                                <%}%>
                            </ul>
                        </div>

                    </div>
                    <div class="yy_jiesuan">
                        <input type="hidden" id="serialnumber" value="HX<%=UtilDate.getOrderNum()%>"/>
                        <a href="javascript:void(0)" onclick="submitOrder()">去结算</a>
                        <span>总费用：<font style="color: #ff551a;font-size: 20px;">¥0.00</font></span>
                    </div>
                    
                    <div class="youhuiquan">
                        <div>
                            <img src="<%=ctx%>/img/youhuiquan.png" class="yhq_img">
                            <span class="yhq_title">使用优惠券</span>
                        </div>
                        <div class="yhq_list">
                            <div class="yhq_list_title">
                                你的帮你养车网优惠券
                            </div>
                            <div class="yhq_list_div">
                                <ul>
                                    <%for(int i = 0;i < coupon.size();i ++){%>
                                    	<%if(coupon.get(i).getExprieDate().after(new Date())){ %>
                                    <li>
                                        <input type="radio" name="youhui">
                                        <span class="yhq_money"><%=coupon.get(i).getCoupon().getMoney()%> 元</span>
                                        <span class="yhq_condition">优惠券编号：<%=coupon.get(i).getSerialnumber()%></span>
                                        <span class="yhq_condition">有效期至<%=d_f.format(coupon.get(i).getExprieDate())%></span>
                                        <span class="yhq_condition">使用条件：订单总额大于<%=coupon.get(i).getCoupon().getChargeAmount()%></span>
                                        <input type="hidden" id="coupon_id" name="coupon_id" value="<%=coupon.get(i).getId()%>">
                                        <input type="hidden" id="coupon_money" name="coupon_money" value="<%=coupon.get(i).getCoupon().getChargeAmount()%>">
                                    </li>
                                    <%}%>
                                    <%}%>
                                    
                                    <!-- <li>
                                        <input type="radio" name="youhui">
                                        <span class="yhq_money">10 元</span>
                                        <span class="yhq_condition">优惠券编号：HX2015232322422</span>
                                        <span class="yhq_condition">有效期至2015-08-30</span>
                                        <span class="yhq_condition">使用条件：订单总额大于1000</span>
                                    </li>
                                    <li>
                                        <input type="radio" name="youhui">
                                        <span class="yhq_money">10 元</span>
                                        <span class="yhq_condition">优惠券编号：HX2015232322422</span>
                                        <span class="yhq_condition">有效期至2015-08-30</span>
                                        <span class="yhq_condition">使用条件：订单总额大于1000</span>
                                    </li> -->
                                    <input type="hidden" id="uc_id"></input>
                                </ul>
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

$('.inputproductnum').keyup(function(){
    if(this.value.length >0){
        this.value=this.value.replace(/\D/gi,"");
    }else{
        return this.value = 1;
    }
    var num = this.value;

    var obj = $(this);
    var id = $(this).parent().parent().find('#sp_id').val();
    $.ajax({
        url: "<%=request.getContextPath()%>/former/changenumber.do?number=" + num + "&sp_id=" + id,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.addtocart == true){
                var price = 0;
                if(parseFloat(ret.price.substring(1,ret.price.length) < $(obj.parent().parent().find('.fwxg_fwjg span')).html().substring(1,$(obj.parent().parent().find('.fwxg_fwjg span')).html().length))){
                    price = parseFloat($(obj.parent().parent().find('.fwxg_fwjg span')).html().substring(1,$(obj.parent().parent().find('.fwxg_fwjg span')).html().length)) - parseFloat(ret.price.substring(1,ret.price.length));
                    if($(obj.parent().parent().find("input[type='checkbox']")).is(":checked")){
                    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
                    $('.yy_jiesuan font').html("¥" + (total - price).toFixed(2));
                }
                }else{
                    price = parseFloat(parseFloat(ret.price.substring(1,ret.price.length) - $(obj.parent().parent().find('.fwxg_fwjg span')).html().substring(1,$(obj.parent().parent().find('.fwxg_fwjg span')).html().length)));
                    if($(obj.parent().parent().find("input[type='checkbox']")).is(":checked")){
                        var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
                        $('.yy_jiesuan font').html("¥" + (total + price).toFixed(2));
                    }
                }                    
                $(obj.parent().parent().find('.fwxg_fwjg span')).html(ret.price);
                
            }           
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
});

$('.yy_reduce').click(function(){
    var num = Number($(this).parent().find("input").val());
    if(num > 1){
        num = num - 1;
    }
    if(num < 0){
        num = 1;
    }
    $(this).parent().find("input").val(num);

    var obj = $(this);
    var id = $(this).parent().parent().find('#sp_id').val();
    $.ajax({
        url: "<%=request.getContextPath()%>/former/changenumber.do?number=" + num + "&sp_id=" + id,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.addtocart == true){
                var price = parseFloat($(obj.parent().parent().find('.fwxg_fwjg span')).html().substring(1,$(obj.parent().parent().find('.fwxg_fwjg span')).html().length)) - parseFloat(ret.price.substring(1,ret.price.length));
                $(obj.parent().parent().find('.fwxg_fwjg span')).html(ret.price);
                if($(obj.parent().parent().find("input[type='checkbox']")).is(":checked")){
                    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
                    $('.yy_jiesuan font').html("¥" + (total - price).toFixed(2));
                }
            }           
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    }); 
});
$('.yy_add').click(function(){
    var num = Number($(this).parent().find("input").val());
    num = num + 1;

    if(num < 0){
        num = 1;
    }
    $(this).parent().find("input").val(num);
    var obj = $(this);
    var id = $(this).parent().parent().find('#sp_id').val();
    $.ajax({
        url: "<%=request.getContextPath()%>/former/changenumber.do?number=" + num + "&sp_id=" + id,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.addtocart == true){
                var price = parseFloat(parseFloat(ret.price.substring(1,ret.price.length) - $(obj.parent().parent().find('.fwxg_fwjg span')).html().substring(1,$(obj.parent().parent().find('.fwxg_fwjg span')).html().length)));
                $(obj.parent().parent().find('.fwxg_fwjg span')).html(ret.price);
                if($(obj.parent().parent().find("input[type='checkbox']")).is(":checked")){
                    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
                    $('.yy_jiesuan font').html("¥" + (total + price).toFixed(2));
                }
                for(var i = 0;i < $(".qyyh_lsdd_tab li").length;i ++){
                    if($(".qyyh_lsdd_tab li")[i].className == "current"){
                        
                    }
                }
            }           
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
});
$(".qyyh_lsdd_tab").tabso({
    cntSelect:".qyyh_xfddAll",
    tabEvent:"click",
    tabStyle:"fade"
});
$('.fwxginput').click(function(){
    var one_price = parseFloat($(this).parent().find('.fwxg_fwjg span').html().substring(1,$(this).parent().find('.fwxg_fwjg span').html().length));
    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
    if($(this).is(":checked")){       
        $('.yy_jiesuan font').html("¥" + (total + one_price).toFixed(2));
    }else{
        $('.yy_jiesuan font').html("¥" + (total - one_price).toFixed(2));
    }
});
function submitOrder(){
    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
    var uc_id = $('#uc_id').val();
    if(total == 0){
        sAlert("请选择你所需要的服务");
        return false;
    }
    var uri = "<%=ctx%>/former/putorder.do?serialnumber=" + $('#serialnumber').val();
    var id_list = "";
    for(var i = 0;i < $('.fwxginput').length;i ++){
        if($($('.fwxginput')[i]).is(":checked")){
            var id = $($('.fwxginput')[i]).data().id;
            id_list =id_list + id + ",";
        }
    }
    uri = uri + "&id_list=" + id_list;
    if(uc_id.length > 0 && uc_id!=null){
        uri = uri + "&uc_id=" + uc_id;
    }

    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.add == true){
                window.location.href = ret.url;
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
    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
    if(total == 0){
        for(var i = 0;i < $('.fwxginput').length;i ++){
            if($($('.fwxginput')[i]).is(":checked")){
                var price = parseFloat($($('.fwxginput')[i]).parent().find('.fwxg_fwjg span').html().substring(1,$($('.fwxginput')[i]).parent().find('.fwxg_fwjg span').html().length));
                total = total + price;
            }
        }
        $('.yy_jiesuan font').html("¥" + (total).toFixed(2));
    }
});

$("input[name='youhui']").click(function(){
    var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
    var money = parseFloat($(this).parent().find('#coupon_money').val());

    if(total < 0){
        this.checked = false;
        sAlert("请先勾选你所需要的服务。");
    }else{
        if(total < money){
            this.checked = false;
            sAlert("你的订单总金额不满足优惠券使用条件，请重新选择。"); 
        }else{
            $('#uc_id').val($(this).parent().find('#coupon_id').val());
        }
    }

});
</script>
</html>