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
	Company company = (Company)session.getAttribute("company");
	MyCartDao myCartDao = (MyCartDao)SpringUtils.getBean(MyCartDao.class);
	List<MyCart> cart_list = (List<MyCart>)session.getAttribute("ProductInCart");
	List<MyCart> myCart_list = new ArrayList<MyCart>();	
	DecimalFormat df=new DecimalFormat("######0.00");
	double totla_price = 0;
	if(null == cart_list){
		session.setAttribute("ProductInCart", null);

		if(null != user){
			cart_list = myCartDao.findMyCartByCompany(user.getId());
		}
		if(null != company){
			cart_list = myCartDao.findMyCartByCompany(company.getId());
		}

		session.setAttribute("ProductInCart", cart_list);
	}
	if(null != cart_list){
		myCart_list.addAll(cart_list);

		for(int i = 0;i < myCart_list.size();i ++){
			totla_price = totla_price + myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum();
		}	
	}
	String isLogin = "";
	String haveProduct = "";
	if(null != user){
		isLogin = "1";
	}else{
		if(null != company){
			isLogin = "2";
		}
	}
	if(null != myCart_list){
		if(myCart_list.size() > 0){
			haveProduct = "1";
		}
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－我的服务车</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/mycart.css">
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
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection2.jsp" flush="true" />		

		<div id="bodySection" style="overflow: hidden;min-height:0;">
			<div class="wdgwc">
	            <ul class="wdgwc_title">
	                <li>服务类型</li>
	                <li>服务名称</li>
	                <li>服务说明</li>
	                <li>服务价格</li>
	                <li>数量</li>
	                <li>小计</li>
	                <li class="no">操作</li>
	            </ul>
	            <%
            if(null != myCart_list){
	            if(myCart_list.size() > 0){
	            	boolean isRepeat = false;
	            	int now_class_id = 0;
	            	int show_two = 0;
	            	for(int i = 0;i < myCart_list.size();i ++){
	            		//if(show_two == 1){
	            		//	i = 0;
	            		//}
	            		if(i == 0){
	            			now_class_id = myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId();
	            			//show_num ++;
	            %>
	            		<div class="wdgwc_cont">
	            			<p><%=myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%></p>
	            			<ul id="wdgwc_contul">
		            			<li style="position: relative; padding-left: 18px;">
									<input type="checkbox" name="sel_product" value="<%= myCart_list.get(i).getServiceProduct().getId() %>" style="position: absolute; left: 0px;">
		            				<span><%=myCart_list.get(i).getServiceProduct().getServiceProject().getName()%></span>
		            				<span><%=myCart_list.get(i).getServiceProduct().getTitle()%></span>
		            				<span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
		            				<span class="hdXinxi_cheng">¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice())%></span>
		            				<span>
		            					<div class="yy_Number">
				                            <span class="yy_reduce">-</span>
				                            <input type="text" value="<%=myCart_list.get(i).getNum()%>" class="inputproductnum"/>
				                            <span class="yy_add">+</span>
			                        	</div>
		                        	</span>
		                        	<span class="hdXinxi_cheng">
		                        		¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%>
		                        	</span>
		                        	<a href="javascript:void(0)" onclick="deleteThisProduct(this)"><span><img src="images/yy_quxiao.png"/></span></a>
		                        	<input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">

		                        </li>
	            <%
	            		}else if(i == myCart_list.size() - 1){
	            			if(now_class_id != myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId()){ 
	            				List<MyCart> new_list = new ArrayList<MyCart>();
	            				for(int j = 0;j < myCart_list.size();j ++){
			        				if(now_class_id != myCart_list.get(j).getServiceProduct().getServiceProject().getServiceClass().getId()){
			        					new_list.add(myCart_list.get(j));
			        				}
			        			}
			        			myCart_list.clear();
			        			myCart_list.addAll(new_list);
			        			i = -1;
	        	%>
			        		</ul>
		            	</div>
	        	<%
			        			//show_two = 1;
		            			continue;
		            		}else{
		            			//show_num ++;
		        %>
		        				<li style="position: relative; padding-left: 18px;">
		        					<input type="checkbox" name="sel_product" value="<%= myCart_list.get(i).getServiceProduct().getId() %>" style="position: absolute; left: 0px;">
		            				<span><%=myCart_list.get(i).getServiceProduct().getServiceProject().getName()%></span>
		            				<span><%=myCart_list.get(i).getServiceProduct().getTitle()%></span>
		            				<span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
		            				<span class="hdXinxi_cheng">¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice())%></span>
		            				<span>
		            					<div class="yy_Number">
				                            <span class="yy_reduce">-</span>
				                            <input type="text" value="<%=myCart_list.get(i).getNum()%>" class="inputproductnum"//>
				                            <span class="yy_add">+</span>
			                        	</div>
		                        	</span>
		                        	<span class="hdXinxi_cheng">
		                        		¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%>
		                        	</span>
		                        	<a href="javascript:void(0)" onclick="deleteThisProduct(this)"><span><img src="images/yy_quxiao.png"/></span></a>
		                        	<input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
		                        </li>
		        <%

		            		}
		        %>
		        			</ul>
		            	</div>
		        <%
		        			List<MyCart> new_list = new ArrayList<MyCart>();
            				for(int j = 0;j < myCart_list.size();j ++){
		        				if(now_class_id != myCart_list.get(j).getServiceProduct().getServiceProject().getServiceClass().getId()){
		        					new_list.add(myCart_list.get(j));
		        				}
		        			}
		        			myCart_list.clear();
		        			myCart_list.addAll(new_list);
		            		i = -1;
	            		}else{
	            			if(now_class_id != myCart_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId()){ 
		            			continue;
		            		}else{
		            			//show_num ++;
		        %>
		        				<li style="position: relative; padding-left: 18px;">
		        					<input type="checkbox" name="sel_product" value="<%= myCart_list.get(i).getServiceProduct().getId() %>" style="position: absolute; left: 0px;">
		            				<span><%=myCart_list.get(i).getServiceProduct().getServiceProject().getName()%></span>
		            				<span><%=myCart_list.get(i).getServiceProduct().getTitle()%></span>
		            				<span><%=myCart_list.get(i).getServiceProduct().getDescription()%></span>
		            				<span class="hdXinxi_cheng">¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice())%></span>
		            				<span>
		            					<div class="yy_Number">
				                            <span class="yy_reduce">-</span>
				                            <input type="text" value="<%=myCart_list.get(i).getNum()%>" class="inputproductnum"//>
				                            <span class="yy_add">+</span>
			                        	</div>
		                        	</span>
		                        	<span class="hdXinxi_cheng">
		                        		¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%>
		                        	</span>
		                        	<a href="javascript:void(0)" onclick="deleteThisProduct(this)"><span>  <img src="images/yy_quxiao.png"/></span></a>
		                        	<input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
		                        </li>
		        <%
		            		}
	            		}
	            	}
	            }else{
	        %>
	        <div style="color:#6c6c6c;height:40px;line-height:40px;margin-left:10px">暂无任何服务产品</div>
	        <%
	        	}
	        }else{
	        %>
	        <div style="color:#6c6c6c;height:40px;line-height:40px;">暂无任何服务产品</div>
	        <%
	    	}
	        %>

	            <!-- <div class="wdgwc_cont">
	                <p>汽车服务</p>
	                <ul id="wdgwc_contul">
	                    <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span>汽车全套轮胎清洗<br/>优惠低价放心服务</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                        <span><img src="images/yy_quxiao.png"/></span>
	                    </li>
	                    <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span>汽车全套轮胎清洗<br/>优惠低价放心服务</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                        <span><img src="images/yy_quxiao.png"/></span>
	                    </li>
	                </ul>
            	</div>
	            <div class="wdgwc_cont">
	                <p>汽车服务</p>
	                <ul>
	                    <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span>汽车全套轮胎清洗<br/>优惠低价放心服务</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                        <span><img src="images/yy_quxiao.png"/></span>
	                    </li>
	                    <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span>汽车全套轮胎清洗<br/>优惠低价放心服务</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                        <span><img src="images/yy_quxiao.png"/></span>
	                    </li>
	                </ul>
	            </div> -->
	            <div class="yy_jiesuan">
	                <img src="images/qingkong.png" class="qingkong"/>
	                <a class="yy_jiesuana" onclick="clearCart()">清空购物车</a>
	                <img src="images/gouwuche.png"/>
	                <a class="yy_jiesuana" onclick="javascript:window.history.back()">返回继续找服务</a>
	                <input type="hidden" id="islogin" value="<%=isLogin%>">
	                <input type="hidden" id="ishaveproduct" value="<%=haveProduct%>">
	                <a onclick="submitOrder()">提交订单</a>
	                <span>服务总价：<font style="color: #ff551a;font-size: 20px;">¥<%=df.format(totla_price)%></font></span>
	            </div>
	        </div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
function clearCart(){
	$.ajax({
		url: "<%=request.getContextPath()%>/former/clearcart.do",
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.delall == true){
				sAlert3("服务车清空成功",window.location.href);
			}			
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}
function deleteThisProduct(obj){
	var id = $(obj).parent().find('#sp_id').val();
	 $.ajax({
		url: "<%=request.getContextPath()%>/former/delfromcart.do?sp_id=" + id,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.delfromcart == true){
				sAlert3("服务产品删除成功",window.location.href);
			}			
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}
 $(document).ready(function(){
 	var $cbs = document.getElementsByName("sel_product");
 	for (var i = 0; i < $cbs.length; i++) {
 		$cbs[i].style.display = 'none';
 	}

    $('.wdgwc_cont ul').children(":last").css("border-bottom","0px");
    $('#wdgwc_contul').children(":last").css("border-bottom","0px");
    $('.yy_add').click(function(){
        var beforeN = $(this).parent().find('input').val();
        var laterN = parseInt(beforeN) + 1;
        $(this).parent().find('input').val(laterN);

        var obj = $(this);
        var id = $(this).parent().parent().parent().find('#sp_id').val();
        $.ajax({
			url: "<%=request.getContextPath()%>/former/changenumber.do?number=" + laterN + "&sp_id=" + id,
			type: "post",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.addtocart == true){
					$(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html(ret.price);
					$('.yy_jiesuan font').html(ret.total);
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
        var beforeN = $(this).parent().find('input').val();
        var laterN = parseInt(beforeN) - 1;
        if(laterN>=1){
            $(this).parent().find('input').val(laterN);
        }else{
        	laterN = 1;
            $(this).parent().find('input').val(laterN);
        }

        var obj = $(this);
        var id = $(this).parent().parent().parent().find('#sp_id').val();
        $.ajax({
			url: "<%=request.getContextPath()%>/former/changenumber.do?number=" + laterN + "&sp_id=" + id,
			type: "post",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.addtocart == true){
					$(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html(ret.price);
					$('.yy_jiesuan font').html(ret.total);
				}			
			},
			error: function(XMLRequest, textInfo){
				if(textInfo != null){
					alert(textInfo);
				}
			}
		});	
    });

    
    $('.inputproductnum').keyup(function(){
   		
    	if(this.value.length >0){
    		this.value=this.value.replace(/\D/gi,"");
    	}else{
    		return this.value = 1;
    	}
    	var num = this.value;
    	
    	
        var obj = $(this);
        var id = $(this).parent().parent().parent().find('#sp_id').val();
        $.ajax({
            url: "<%=request.getContextPath()%>/former/changenumber.do?number=" + num + "&sp_id=" + id,
            type: "post",
            dataType: "JSON",
            async: false,
            timeout: 3000,
            success: function(ret){
                if(ret.addtocart == true){
                    var price = 0;
                    if(parseFloat(ret.price.substring(1,ret.price.length) < $(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html().trim().substring(1,$(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html().trim().length))){
                        price = parseFloat($(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html().trim().substring(1,$(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html().trim().length)) - parseFloat(ret.price.substring(1,ret.price.length));                   
                    	var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
                   	 	$('.yy_jiesuan font').html("¥" + (total - price).toFixed(2));
                    	
                    }else{
                        price = parseFloat(parseFloat(ret.price.substring(1,ret.price.length) - $(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html().trim().substring(1,$(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html().trim().length)));
                        var total = parseFloat($('.yy_jiesuan font').html().substring(1,$('.yy_jiesuan font').html().length));
                        $('.yy_jiesuan font').html("¥" + (total + price).toFixed(2));
                    }                    
                    $(obj.parent().parent().parent().find('.hdXinxi_cheng')[1]).html(ret.price);
                    
                }           
            },
            error: function(XMLRequest, textInfo){
                if(textInfo != null){
                    alert(textInfo);
                }
            }
        });
    
});
});
function submitOrder(){
	var login = $('#islogin').val();
	var ishave = $('#ishaveproduct').val();
	if(ishave.length == 0){
		sAlert("请先选择所需要的服务!");
		return;
	}else{
		if(login.length == 0){
			sAlert3("请先登录！","<%=ctx%>/login.jsp");
			return;
		}else{
			if(login == "1"){
				window.location.href = "<%=ctx%>/checkorder.jsp"
			}
			if(login == "2"){
				window.location.href = "<%=ctx%>/cselect.jsp"
			}
		}
	}

	

}

</script>
</html>