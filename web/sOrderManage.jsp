<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.util.TextUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
    ServiceShop shop_user = (ServiceShop)session.getAttribute("shopuser");
    if(session.getValue("shopuser") == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }

    String pageIndex = request.getParameter("pageIndex");
    pageIndex = TextUtils.isEmpty(pageIndex) ? "0" : pageIndex;
    int pageSize = 10;
    int iPageIndex = Integer.parseInt(pageIndex);

    OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
//    List<Order> order_list = orderDao.findOrderByServiceShopAndState(shop_user.getId(),1);
    List<Order> order_list = orderDao.findOrderByServiceShopAndStateAndPage(shop_user.getId(), 1, pageSize, pageSize * iPageIndex);
    int countMax = (int) orderDao.countOrdersServiceShopAndState(shop_user.getId(), 1);
    int total_page = 1;
    if(countMax > 10){
        if(countMax % 10 != 0){
            total_page = countMax / 10 + 1;
        }else{
            total_page = countMax / 10;
        }
    }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮你养车网－－商家门店－－订单管理</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/sOrderManage.css">
	 <link href="images/favicon.ico" rel="shortcut icon"/>

	<script type="text/javascript">
		var ctx = "<%=ctx%>";
	</script>
    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
	<div class="all" id="all">
		<div id="headSection">
			<div id="topBar">
				<div class="container_24">
					<div class="grid_10 left">
                        <%=shop_user.getTitle()%>欢迎您来到帮你养车网！
                        您共计有<span style="color:#007fcc"><%=order_list.size()%></span>个未处理订单，请去<a href="<%=ctx%>/sOrderManage.jsp.jsp">订单管理</a>处理。
                    </div>
                    <div class="grid_11 right">
                        亲爱的商户<b><span style="color:#00688b;"><%=shop_user.getPhone()%></span></b>欢迎登录 [<a href="<%=ctx%>/logout.jsp" style="color:#08c">退出</a>]
                    </div>
				</div>
			</div>
			<div id="midBar">
				<div class="container_24">
					<div class="grid_4">
						<div class="logo">
							<div class="logo_cont">
								帮您养车网
								<br>
								<span>专注汽车服务</span>
							</div>
						</div>
					</div>		
					<span style="margin-left:40px;font-size: 20px;position: absolute;top: 70px;">门店商家管理系统</span>
				</div>
			</div>
			<div id="naviBar">
				<div class="container_24">			
					<div id="itemNavi">
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sindex.jsp"  style="display:inline-block;">
								欢迎页
							</a>
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sOrderManage.jsp" style="display:inline-block;background-color: #00688b;width:100%;">订单管理</a>
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sHistoryOrder.jsp" style="display:inline-block;">历史订单</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/s_r.jsp" style="display:inline-block;">门店对账</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/storesManage.jsp" style="display:inline-block;">门店管理</a>
							<img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="bodySection" style="overflow: hidden;min-height:0;">
			<div class="container_24">
	            <div id="main">
	                <div id="maincontent" style="padding-left: 20px; position: relative;">
	                    <h2> 订单管理</h2>
	                    <div style="text-align:right;">
	                        <span>订单号查询：</span>
	                        <input type="text" style="width: 160px; height: 30px;border: 1px solid #999;" value="" name="serialnumber">
	                        <a href="javascript:void(0)" onclick="searchserviceshop()"><img src="<%=ctx%>/img/s_search_icon.png" style="width: 30px; height: 30px; float: right;" ></a>
	                    </div>
	                    <br>
	                    <div id="OrderLists">
	                        <form method="post" action="#">
	                            <table>
	                                <thead>
	                                    <tr>
	                                        <th>订单号</th>
	                                        <th>服务类别</th>
                                            <th>服务名称</th>
	                                        <th>订单时间</th>
	                                        <!-- <th>预约时间</th> -->
	                                        <th>订单总价</th>
	                                        <th>服务数量</th>
	                                        <th>订单状态</th>
	                                        <!-- <th>订单说明</th> -->
	                                        <th>客户名称</th>
	                                        <th style="text-align:center;">操作</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                   <%
                                        if(order_list.size() > 0){
                                            DecimalFormat df_money=new DecimalFormat("######0.00");
                                            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
                                            int shownum = 10;
                                            if(order_list.size() < shownum){
                                                shownum = order_list.size();
                                            }
                                            for(int i = 0;i < shownum;i ++){
                                               
                                        %>                                      
	                                    <tr>
	                                        <td>
	                                            <a href="javascript:void(0)"><%=order_list.get(i).getSerialnumber()%></a>
	                                        </td>
	                                        <td>
	                                            <%=order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%>
                                            </td>
	                                        <td>
                                                <%=order_list.get(i).getServiceProduct().getServiceProject().getName()%>
                                            </td>
	                                        <td>
                                                <%=df.format(order_list.get(i).getCreatedTime())%>
                                            </td>
	                                        <td>
                                                <%=df_money.format(order_list.get(i).getWeb_price() * order_list.get(i).getNumber())%>
                                            </td>
	                                        <td>
                                                <%=order_list.get(i).getNumber()%>
                                            </td>
	                                        <td>
                                                已付费
                                            </td>
	                                        <td>
                                                <%
                                                String sendmobile = "";
                                                int userid = 0;
                                                int sp_id = order_list.get(i).getServiceProduct().getId();
                                                if(null != order_list.get(i).getUser()){
                                                    sendmobile = order_list.get(i).getUser().getPhone();
                                                    userid = order_list.get(i).getUser().getId();
                                                %>
                                                <%=order_list.get(i).getUser().getName()%>
                                                <%}else{
                                                    if(null != order_list.get(i).getCompany()){
                                                        userid = order_list.get(i).getCompany().getId();
                                                        String showname = "";
                                                        if(null != order_list.get(i).getCustomername() && order_list.get(i).getCustomername().length() > 0){
                                                            showname = order_list.get(i).getCustomername();
                                                            sendmobile = order_list.get(i).getCustomerphone();
                                                        }else{
                                                            showname = order_list.get(i).getCompany().getCompany();
                                                            sendmobile = order_list.get(i).getCompany().getPhone();
                                                        }
                                                %>
                                                    <%=showname%>
                                                <%
                                                    }
                                                }
                                                %>
                                            </td>
	                                        <!-- <td> xxx </td> -->
	                                        <td style="text-align: center;">                                                
	                                            <a href="javascript:void(0)" class="ui-button ui-widget ui-state-default ui-corner-all" onclick="checkService('<%=order_list.get(i).getSerialnumber()%>','<%=order_list.get(i).getServiceShop().getId()%>','<%=sendmobile%>','<%=userid%>','<%=sp_id%>')">服务确认</a>                                                                           
	                                        </td>
	                                    </tr>
                                        <%
                                            }
                                        }else{
                                        %>
	                                    <tr>
	                                        <td colspan="10">没有相关订单</td>
	                                    </tr>
                                        <%}%>
	                                </tbody>
	                            </table>
	                            <br>
	                            <div style="text-align:center">
	                                <input id="nowpageNumber" type="hidden" value="1" name="nowpageNumber">
	                                <input id="totalpageNumber" type="hidden" value="<%=total_page%>" name="totalpageNumber">
	                                <input id="FirstPage" class="ui-button ui-widget ui-state-default ui-corner-all" type="button" value="首页" name="pages" role="button" onclick="getserviceshopbypage(0)">
	                                <input id="PrevPage" class="ui-button ui-widget ui-state-default ui-corner-all" type="button" value="上一页" name="pages" role="button" onclick="getserviceshopbypage(-1)">
	                                <input id="NextPage" class="ui-button ui-widget ui-state-default ui-corner-all" type="button" value="下一页" name="pages" role="button" onclick="getserviceshopbypage(1)">
	                                <label style="font-weight:bold;">&nbsp;第<%= iPageIndex + 1 %>页&nbsp;&nbsp;总数量：<%=countMax%>单</label>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
	<div id="servicebody1" style="position: fixed; z-index: 9999998; background-color: black; opacity: 0.3; right: 0px; bottom: 0px; left: 0px; top: 0px;display:none"></div>
    <div id="servicebody2" class="userinfobody loginbodyheight" style="z-index: 9999999; position: fixed; top: 60px; left: 382.5px;display:none">
        <div class="userinfoarea">
            服务确认
            <div class="closebtn" onclick="closecheck()"></div>
        </div>
        <hr class="seperateline">
        <div class="userinfoform loginformheight">
            <div class="check_service_num_span">
                服务确认码已经发送到用户指定的手机号，请向用户询问服务确认码。
            </div>
            <div class="check_service_num_text">
                <input type="text" id="checkservice" name="checkservice" placeholder="请输入服务确认码">
            </div>
            <div class="check_service_pos_span">
                请输入线下POS支付号
            </div>
            <div class="check_service_pos_text">
                <input type="text" id="posnum" name="posnum" placeholder="请输入POS号">
            </div>
            <div class="check_service_put">
                <a href="javascript:void(0)" onclick="checkservicecode()">确定</a>
            </div>
            <input type="hidden" id="serialnumber" name="serialnumber">
            <input type="hidden" id="userid" name="userid">
            <input type="hidden" id="sp_id" name="sp_id">
            <input type="hidden" id="vid" name="vid">
        </div>
    </div>
</body>
<script type="text/javascript">
function getserviceshopbypage(num){
    var p_index = <%= iPageIndex %>;
    var max = <%= countMax %>
    max = max / 10;
    p_index += num;

    if (p_index >= max) return;

    if (p_index < 0) p_index = 0;
    window.location.href = num == 0? "/sOrderManage.jsp" : "/sOrderManage.jsp?pageIndex=" + p_index;
    <%--var nowpage = Number($('#nowpageNumber').val());--%>
    <%--var totalpage = Number($('#totalpageNumber').val());--%>
    <%--var showpage = 0;--%>
   <%--var pagenumber = 0;--%>
    <%--if(num != 0){--%>
        <%--showpage = nowpage + num;--%>
        <%--pagenumber = (showpage - 1) * 10;--%>
    <%--}else{--%>
        <%--if(nowpage == 1){--%>
           <%--return false; --%>
        <%--}--%>
        <%--showpage = 1;--%>
        <%--pagenumber = 0;--%>
    <%--}--%>
    <%--if(showpage > totalpage || showpage <= 0){--%>
        <%--return false;--%>
    <%--}else{--%>
        <%--$("#FirstPage")[0].disabled = "";--%>
        <%--$("#PrevPage")[0].disabled = "";--%>
    <%--}--%>

    <%--var uri = "<%=ctx%>/former/orderbypage?haveaction=1&status=1&pagenumber=" + pagenumber;--%>
    <%--$.ajax({--%>
        <%--url: uri,--%>
        <%--type: "post",--%>
        <%--dataType: "JSON",--%>
        <%--async: false,--%>
        <%--timeout: 3000,--%>
        <%--success: function(ret){--%>
            <%--$('#nowpageNumber').val(showpage);--%>
            <%--$('#OrderLists tbody').html(ret.html);--%>
        <%--},--%>
        <%--error: function(XMLRequest, textInfo){--%>
            <%--if(textInfo != null){--%>
                <%--alert(textInfo);--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>
}
function searchserviceshop(){
    var search = $("input[name='serialnumber']").val();
    if(search.length == 0){
        sAlert("请输入订单号！");
        return false;
    }
    var uri = "<%=ctx%>/former/searchorderbyserial?serialnumber=" + search;
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            $('#OrderLists tbody').html(ret.html);
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
function checkService(serial,vid,mobile,userid,sp_id){
    var uri = "<%=ctx%>/former/sendservicecode?mobile=" + mobile;
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            $('#serialnumber').val(serial);
            $('#vid').val(vid);
            $('#userid').val(userid);
            $('#sp_id').val(sp_id);
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
    // if(paidtype == "线上支付"){
        $('.check_service_pos_span').hide();
        $('.check_service_pos_text').hide();
        $('.loginformheight').height(180);
    // }

    document.getElementById("servicebody1").style.display = "";
    document.getElementById("servicebody2").style.display = "";
}

function closecheck(){
    document.getElementById("servicebody1").style.display = "none";
    document.getElementById("servicebody2").style.display = "none";
}
function checkservicecode(){
    var servicecode = $('#checkservice').val();
    var posnum = $('#posnum').val();
    var serialnumber = $('#serialnumber').val();
    var vid = $('#vid').val();
    var userid= $('#userid').val();
    var sp_id = $('#sp_id').val();
    var uri = "<%=ctx%>/former/checkservicecode?serialnumber=" + serialnumber + "&vid=" + vid + "&servicecode=" + servicecode + "&userid=" + userid + "&sp_id=" + sp_id;
    if(posnum.length > 0){
        uri = uri + "&posnum=" + posnum;
    }
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.result == "ok"){
                //sAlert("服务完成！");
                //window.location.reload();
                sAlert3("服务完成！",window.location.href);
            }else{
                sAlert("验证码错误，请重新输入！");
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