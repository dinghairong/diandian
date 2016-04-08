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
	User user = (User)session.getAttribute("user");
	if(user == null){
		response.sendRedirect(ctx + "/logout.jsp");
		return;
	}
	SmartProperties smartProp = SmartProperties.getInstance();
	DateFormat d_f=new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df=new DecimalFormat("######0.00");
	OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);

	String imgPath = smartProp.getImgPath();
	// List<Order> order_list = orderDao.findOrderByUserAndState(user.getId(),2);
	List<Order> order_list = orderDao.findOrderByUserAndNumAndState(user.getId(),10,0,2);
	int total_order = orderDao.findOrderByUserAndNumAndState(user.getId(),0,0,2).size();
	int pagenum = 0;
	if(total_order % 10 == 0){
		pagenum = total_order / 10;
	}else{
		pagenum = total_order / 10 + 1;
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－用户中心－－订单中心</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/myorder.css">
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
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<div class="top_line"></div>

		<div id="bodySection" style="overflow: hidden;" class="uc_content">
			<div class="siteNavi">
				<a href="">首页</a>
				<span class="s1"> ></span>
				<span>用户中心</span>
				<span class="s1"> ></span>
				<span>订单中心</span>
			</div>
			<div class="uc_content_Navi">
				<div class="leftNavi">
					<div>
						<h5 class="title_top">订单中心</h5>
						<a class="current" href="<%=ctx%>/myorder.jsp">我的订单</a>
						<a href="<%=ctx%>/mycart.jsp">我的服务车</a>
						<!-- <a href="<%=ctx%>/promotionCode.jsp">我的优惠券</a> -->
						<!-- <a href="/Car/CarIndex.html">我的车型库</a> -->
						<h5>账户中心</h5>
						<a href="<%=ctx%>/userinfo.jsp">基本信息</a>
						<!-- <a href="/Addresses/List.html">收货地址管理</a> -->
						<a href="<%=ctx%>/updatePassword.jsp">修改密码</a>
						<a href="<%=ctx%>/myproblem.jsp">我的咨询</a>
					</div>
				</div>
			</div>
			<div class="r_content">
				<div class="order_data">
					<div class="order_tab">
						<a href="<%=ctx%>/myorder.jsp">全部订单</a>
						<a href="<%=ctx%>/Obligation.jsp">待付款</a>
						<a class="act_tab" href="<%=ctx%>/WaitingComment.jsp">待评价</a>
					</div>
					<table class="order_tbg" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td width="176" valign="middle" align="center">订单名称</td>
								<td width="86" valign="middle" align="center">服务类别</td>
								<td width="120" valign="middle" align="center">服务门店</td>
								<td width="72" valign="middle" align="center">下单时间</td>
								<td width="70" valign="middle" align="center">订单金额</td>
								<td width="88" valign="middle" align="center">订单状态</td>
								<td class="pl40" valign="middle" align="center">操作</td>
							</tr>
							<%if(order_list.size() > 0){
								int num  = 10;
								if(order_list.size() < 10){
									num = order_list.size();
								}
								for(int i = 0;i < num;i ++){
							%>
							<tr>
								<td align="center">
									<%=order_list.get(i).getServiceProduct().getTitle()%>
								</td>
								<td align="center">
									<%=order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%>
								</td>
								<td align="center">
									<%=order_list.get(i).getServiceShop().getTitle()%>
								</td>
								<td align="center">
									<%=d_f.format(order_list.get(i).getCreatedTime())%>
								</td>
								<td align="center">
									<%=df.format(order_list.get(i).getPaid())%>
								</td>
								<td align="center">
									<%if(order_list.get(i).getState() == 0){%>
									已提交
									<%}%>
									<%if(order_list.get(i).getState() == 1){%>
									已付款
									<%}%>
									<%if(order_list.get(i).getState() == 2){%>
									已使用
									<%}%>
									<%if(order_list.get(i).getState() == 3){%>
									已评价
									<%}%>
									<%if(order_list.get(i).getState() == 4){%>
									退款中
									<%}%>
									<%if(order_list.get(i).getState() == 5){%>
									退款成功
									<%}%>
									<%if(order_list.get(i).getState() == 6){%>
									退款失败
									<%}%>
								</td>
								<td align="center">
									<a href="javascript:void(0)" onclick="commentorder(this)">评价</a>
									<input type="hidden" value="<%=order_list.get(i).getSerialnumber()%>" id="serialnumber" name="serialnumber">
                                    <input type="hidden" value="<%=order_list.get(i).getServiceProduct().getId()%>" id="sp_id" name="sp_id">			
								</td>
							</tr>
							<%
								}
							}
							%>
						</tbody>
					</table>
				</div>
				<div class="page_count">
					<span>关于订单有任何问题敬请拨打帮您养车热线</span>
					<span class="red_arial_b">400-665-8027</span>
					<a class="np" href="javascript:void(0)"></a>
					<a class="pp" href="javascript:void(0)"></a>
					<input type="hidden" id="pagenum" value="<%=pagenum%>">
					<input type="hidden" id="nowpage" value="1">
				</div>
			</div>

			
			
		</div>
	</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang_wenzis').attr("style","color:#6c6c6c");
	$('.lunbo').hide();
});

function paidorder(obj){
    var serialnumber = $(obj).parent().find("#serialnumber").val();
    var sp_id = $(obj).parent().find("#sp_id").val();
    $("#WIDout_trade_no").val(serialnumber);
    $("#WIDsp_id").val(sp_id);
    $("#WIDshow_url").val("<%=ctx%>/former/getproductinfo?pid=" + sp_id);

    $("form[name='alipayment']").submit();
}
function cancelorder(obj){
    var serialnumber = $(obj).parent().find("#serialnumber").val();
    var sp_id = $(obj).parent().find("#sp_id").val();
    var uri = "<%=ctx%>/former/changeorderstate?state=7&serialnumber=" + serialnumber + "&sp_id=" + sp_id;
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.change == "ok"){
                sAlert3("取消成功!",window.location.href);
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
$('.page_count a').click(function(){
	var total = Number($('#pagenum').val());
	var page = Number($('#nowpage').val());
	var start = 0;

	if(this.className == "np"){
		if(page == total){
			return false;
		}else{
			page = page + 1;
			$('#nowpage').val(page);
		}
	}
	if(this.className == "pp"){
		if(page == 1){
			return false;
		}else{
			page = page - 1;
			$('#nowpage').val(page);
		}
	}
	start = (page - 1) * 10;
	$.ajax({
        url: "<%=ctx%>/former/getorderbypage?uid=<%=user.getId()%>&start=" + start + "&number=10&state=2",
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            var tr1 = "<tr>" + $($('.order_tbg tr')[0]).html() + "</tr>";
            $('.order_tbg').html(tr1 + ret.html);
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
});
</script>
</html>