<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.alipay.util.UtilDate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	User user = (User)session.getAttribute("user");
	Company company = (Company)session.getAttribute("company");
	AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
	ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
	MyCartDao myCartDao = (MyCartDao)SpringUtils.getBean(MyCartDao.class);
	if(user == null && company == null){
		response.sendRedirect(ctx + "/logout.jsp");
		return;
	}
	String setcity = (String)session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		setcity = "上海";
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}
	List<String> isRepeat = new ArrayList<String>();

	List<AreaDetail> province_list = areaDetailDao.findAllProvince();
	List<AreaDetail> selectcity = areaDetailDao.findAllCountyByCity(setcity + "市");

	String selectprovince = "";
	if(selectcity.size() > 0){
		selectprovince = selectcity.get(0).getProvince();
		selectcity = areaDetailDao.findAllCityByProvince(selectprovince);
	}else{
		selectcity = areaDetailDao.findAllCityByProvince("上海市");
		selectprovince = selectcity.get(0).getProvince();
	}
	List<MyCart> myCart_list = (List<MyCart>)session.getAttribute("ProductInCart");
	DecimalFormat df=new DecimalFormat("######0.00");
	double totla_price = 0;
	if(null == myCart_list){
		if(null != user){
			myCart_list = myCartDao.findMyCartByCompany(user.getId());
		}
		if(null != company){
			myCart_list = myCartDao.findMyCartByCompany(company.getId());
		}
		
	}
	if(null != myCart_list){
		for(int i = 0;i < myCart_list.size();i ++){
			totla_price = totla_price + myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum();
		}
	}
	List<ServiceProduct> product = new ArrayList<ServiceProduct>();
	List<ServiceShop> shops = serviceShopDao.findServiceShopByCity(setcity + "市");
	List<ServiceShop> shop_list = new ArrayList<ServiceShop>();
	if(null != myCart_list){
		for(int i = 0;i < myCart_list.size();i ++){
			product.add(myCart_list.get(i).getServiceProduct());
		}
	}
	for(int i = 0;i < shops.size();i ++){
		boolean isok = true;
		List<Integer> product1 = new ArrayList<Integer>();
		for(int j = 0;j < shops.get(i).getServiceshopServices().size();j ++){
			product1.add(shops.get(i).getServiceshopServices().get(j).getServiceProduct().getId());
		}
		for(int k = 0;k < product.size();k ++){
			if(!product1.contains(product.get(k).getId())){
				isok = false;
				break;
			}
			
		}
		if(isok && !shops.get(i).getPhone().contains("@#del")){
			shop_list.add(shops.get(i));
		}
	}
	String username = "";
	String userphone = "";
	if(null != user){
		if(null != user.getName() && user.getName().length() > 0){
			username = user.getName();
		}else{
			username = user.getPhone();
		}
		userphone = user.getPhone();
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－核对订单信息</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/checkorder.css">
	<link rel="stylesheet" type="text/css" href="<%=ctx%>/css/Bmap.min.css">

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
    <script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js" type="text/ecmascript"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
	<script src="<%=ctx%>/js/map.js"></script>
	<script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection2.jsp" flush="true" />

		<div id="bodySection" style="overflow: hidden;min-height:0;">
			<div class="hdXinxi">
	            <div class="hdXinxi_one">
	                <div class="hdXinxi_one_cont">
	                    <h1>用户联系信息</h1>
	                    <div><img src="images/yy_xing.png"/><span>用户姓名：&nbsp;<%=username%></span></div>
	                    <div><img src="images/yy_xing.png"/><span>用户手机：&nbsp;<%=userphone%></span></div>
	                </div>
	                <!-- <div class="hdXinxi_one_cont">
	                    <h1>用户车型</h1>
	                    <a>奥迪</a>
	                    <a>奥迪A6L</a>
	                    <a>2012款 TFSI手动基本型</a>
	                </div> -->
	            </div>
	            <div class="hdXinxi_two">
	                <h1>确认服务门店</h1>
	                <div class="hdXinxi_two_left">
	                    <select  id="provinceSelect">>
	                        <option value="0">选择省/市</option>
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
	                    <select id="citySelect">
	                        <option value="0">选择城市</option>
	                        <%
							isRepeat.clear();
							for(int i = 0;i < selectcity.size();i ++){
								if(!isRepeat.contains(selectcity.get(i).getCity())){
									isRepeat.add(selectcity.get(i).getCity());
									if(setcity.indexOf(selectcity.get(i).getCity()) > -1){
							%>
								<option value="<%=selectcity.get(i).getId()%>" selected="selected"><%=selectcity.get(i).getCity()%></option>
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
	                    <span class="hdXinxi_twospan">共<font style="color: #ff551a;"><%=shop_list.size()%></font>家安装门店</span>
	                    <ul>
	                    	<%
	                    	if(shop_list.size() > 0){
	                    		for(int i = 0;i < shop_list.size();i ++){
	                    			List<Comment> comment_list = shop_list.get(i).getComments();
	                    			List<Order> order_list = shop_list.get(i).getOrders();
	                    			int order = 0;
	                    			int star = 0;
	                    			String serialnumber = "";
	                    			for(int j = 0;j < order_list.size();j ++){
	                    				if(serialnumber != order_list.get(j).getSerialnumber() && order_list.get(j).getState() >1 && order_list.get(j).getState() < 4){
	                    					order ++;
	                    					serialnumber = order_list.get(j).getSerialnumber();
	                    				}else{
	                    					continue;
	                    				}
	                    			}
	                    			for(int j = 0;j < comment_list.size();j ++){
	                    				star = star + comment_list.get(j).getStar();
	                    			}
	                    			if(star != 0){
	                    				star = star / comment_list.size();
	                    			}
	                    	%>
	                    	<li class="select_after">
	                    		<div class="comm_item">
									<span class="itema"><%=shop_list.get(i).getTitle()%></span>
									<span class="item_fen">
									<%=star%>分
									<span>(安装<%=order%>单)</span>
									</span>
									<span class="itemb"><%=shop_list.get(i).getAreaDetail().getProvince() + shop_list.get(i).getAreaDetail().getCity() + shop_list.get(i).getAddress()%></span>
								</div>
								<a class="item_xiugai" data-id="<%=shop_list.get(i).getId()%>" onclick="selectShop(this)">选择</a>
	                        </li>
	                    	<%	}
	                    	}else{%>
	                    	<li >
	                    		暂无门店提供此类服务
	                    	</li>
	                    	<%}%>
	                    	 <li class="item_sel">
								<div class="comm_item">
									<span class="itema">南京雨花台店</span>
									<span class="item_fen">
									4.8分
									<span>(安装914单)</span>
									</span>
									<span class="itemb">秦淮区汇景北路近汇景家园</span>
								</div>
								<span class="item_xiugai" onclick="changeShop()">修改</span>
							</li>
							<!--
							<li class="select_after">
								<div class="comm_item">
									<span class="itema">南京雨花台店</span>
									<span class="item_fen">
									5.8分
									<span>(安装9单)</span>
									</span>
									<span class="itemb">秦淮区汇景北路近汇景家园</span>
								</div>
								<a class="item_xiugai" onclick="selectShop(this)">选择</a>
							</li>
							<li class="select_after">
								<div class="comm_item">
									<span class="itema">南京雨花台店</span>
									<span class="item_fen">
									3.8分
									<span>(安装9单)</span>
									</span>
									<span class="itemb">秦淮区汇景北路近汇景家园</span>
								</div>
								<a class="item_xiugai" data-id="2" onclick="selectShop(this)">选择</a>
							</li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="javascript:void(0)" onclick="selectShop(this)">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li>
	                        <li class="select_after">
	                            <p>南京雨花台店<span><font style="color: #ff551a;">4.9分</font>&nbsp;&nbsp;&nbsp;(安装700单)</span></p>
	                            <span>江苏省南京市秦淮区汇景北路近汇景家园</span>
	                            <a href="">选择</a>
	                        </li> -->
	                    </ul>
	                </div>
	                <div class="hdXinxi_two_right" id="allmap">

	                </div>
	            </div>
	            <div class="hdXinxi_three">
	                <h1>服务清单</h1>
	                <ul class="hdXinxi_three_title">
	                    <li>服务类型</li>
	                    <li>服务名称</li>
	                    <li>服务价格</li>
	                    <li>数量</li>
	                    <li class="no">小计</li>
	                </ul>
	                <ul class="hdXinxi_three_cont">
	                	<%
	                	if(null != myCart_list){
	                		if(myCart_list.size() > 0){
	                			for(int i = 0;i < myCart_list.size();i ++){
	                				String title1 = "";
	                				String title2 = "";
	                				if(myCart_list.get(i).getServiceProduct().getServiceProject().getName().length() > 15){
	                					title1 = myCart_list.get(i).getServiceProduct().getServiceProject().getName().substring(0,12) + "...";
	                				}else{
	                					title1 = myCart_list.get(i).getServiceProduct().getServiceProject().getName();
	                				}
	                				if(myCart_list.get(i).getServiceProduct().getTitle().length() > 15){
	                					title2 = myCart_list.get(i).getServiceProduct().getTitle().substring(0,12) + "...";
            						}else{
            							title2 = myCart_list.get(i).getServiceProduct().getTitle();
            						}

	                	%>
	                	<li>
	                        <span><%=title1%></span>
	                        <span><%=title2%></span>
	                        <span class="hdXinxi_cheng">¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice())%></span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="<%=myCart_list.get(i).getNum()%>" class="inputproductnum"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">
	                        	¥<%=df.format(myCart_list.get(i).getServiceProduct().getNewprice() * myCart_list.get(i).getNum())%>
	                        </span>
	                        <input type="hidden" id="sp_id" value="<%=myCart_list.get(i).getServiceProduct().getId()%>">
	                    </li>
	                	<%
	                			}
	                		}else{
	                	%>
	                	<li>服务车暂无服务商品</li>
	                	<%
	                		}
	                	%>
	                	<%}%>
	                    <!-- <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                    </li>
	                    <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                    </li>
	                    <li>
	                        <span>轮胎清洗</span>
	                        <span>轮胎全套低价清洗</span>
	                        <span class="hdXinxi_cheng">¥7000</span>
	                        <span><div class="yy_Number">
	                            <span class="yy_reduce">-</span>
	                            <input type="text" value="2"/>
	                            <span class="yy_add">+</span>
	                        </div></span>
	                        <span class="hdXinxi_cheng">¥14000</span>
	                    </li> -->
	                </ul>
	            </div>
	            <div class="yy_jiesuan">
	            	<form id="orderinfo">
	            		<input type="hidden" id="setsid" value="">
	            		<input type="hidden" id="serialnumber" value="HX<%=UtilDate.getOrderNum()%>">
	            	</form>
	                <a onclick="submitOrder()">去结算</a>
	                <span>应付服务总价：<font style="color: #ff551a;font-size: 20px;">¥<%=df.format(totla_price)%></font></span>
	            </div>
	        </div>
		</div>
		<jsp:include page="footSection.jsp" flush="true" />
		
	</div>
</body>
<script type="text/javascript">
 $(document).ready(function(){
 	$($('.yebz_jd .yebz_jd_cont div')[1]).attr('class','yebz_jd_contspan1');
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
var shops = {};
var markerArr;
var level = 9;
var Province = remote_ip_info["province"] + "省";
var City = remote_ip_info["city"] + "市";
if(City.length == 0){
	City = returnCitySN["cname"];
	if(City.length == 0){
		if(Province.length > 0){
			var uri = "<%=ctx%>/former/getnowcity.do?";
			var now_province = remote_ip_info["province"];
			now_province = encodeURI(encodeURI(now_province)); 
			uri = uri + "province=" + now_province;
			$.ajax({
				url: uri,
				type: "post",
				dataType: "JSON",
				async: false,
				timeout: 3000,
				success: function(ret){
					if(ret.nowcity.length > 0){
						City = ret.nowcity;
					}
				},
				error: function(XMLRequest, textInfo){
					if(textInfo != null){
						alert(textInfo);
					}
				}
			});
		}else{
			City = "上海市上海市";
		}
	}else{
		
	}
}

function selectShop(obj){
	$('li.select_after').hide();
	$('.item_sel div').html($(obj).parent().find('div').html());
	// var sid = $(obj).data().id;
	$('#setsid').val($(obj).data().id);
	$('.item_sel').show();
}
function changeShop(){
	$('li.select_after').show();
	$('.item_sel').hide();
}
function submitOrder(){
	var uri = "<%=ctx%>/former/putorder.do?";
	var sid = $('#setsid').val();
	var serialnumber = $('#serialnumber').val();
	if(sid.length == 0){
		sAlert("请先选择服务门店");
		return false;
	}
	uri = uri + "sid=" + sid + "&serialnumber=" + serialnumber;
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

            Province = $('#provinceSelect').val();
            City = "";
            setMapInfo();

            level = 9;
            Province = $('#provinceSelect').val();
            if (Province == "上海市" || Province == "北京市")
				level += 1;
			if (City)
				level += 2;
			else if (Province == "江苏省")
				City = "丹阳市";
			else if (Province == "浙江省")
				City = "杭州市";
            Hx.Map.init({
				map: "allmap",
				city: Province + City,
				level: level
			});
			Hx.Map.renders(markerArr);
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
});

$('#citySelect').change(function(){
	var city = this.options[this.selectedIndex].innerHTML;
	var setcity = this.options[this.selectedIndex].innerHTML;
	City = setcity;
    city = encodeURI(encodeURI(city));
    $.ajax({
        url: "<%=ctx%>/former/getshopbycity.do?city=" + city,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
        	var sel = "<li class='item_sel'>" + $('.item_sel').html().trim() + "</li>";
            $(".hdXinxi_two_left ul").html(ret.html + sel);
            $(".hdXinxi_twospan font").html(ret.total);
            City = setcity;
           	Province = "";
            setMapInfo();

            level = 9;
            Province = $('#provinceSelect').val();
            City = setcity;

            if (Province == "上海市" || Province == "北京市")
				level += 1;
			if (City)
				level += 2;
			else if (Province == "江苏省")
				City = "丹阳市";
			else if (Province == "浙江省")
				City = "杭州市";
            Hx.Map.init({
				map: "allmap",
				city: Province + City,
				level: level
			});
			Hx.Map.renders(markerArr);

			$(".hdXinxi_two_left>ul>li.select_after").mouseenter(function () {
				shops[$(this).find(".item_xiugai").data().id].showInfo();
			});
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });

});


function setMapInfo(){
	var uri = "<%=ctx%>/former/setshopmap.do?";
	if(City.length > 0){
		var setc = City;
		setc = encodeURI(encodeURI(setc));
		uri = uri + "city=" + setc;
	}else{
		if(Province.length > 0){
			var setp = Province;
			setp = encodeURI(encodeURI(setp));
			uri = uri + "province=" + setp;
		}
	}
	$.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            markerArr = ret;
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}

$(function(){
	level = 9;
	if (Province == "上海市" || Province == "北京市")
		level += 1;
	if (City)
		level += 2;
	else if (Province == "江苏省")
		City = "丹阳市";
	else if (Province == "浙江省")
		City = "杭州市";
	Hx.Map.init({
		map: "allmap",
		city: Province + City,
		level: level
	});
	setMapInfo();
	$.each(markerArr, function () {
        shops[this.PKID] = this;
    });

	Hx.Map.getAllShop(markerArr);

	
	$(".hdXinxi_two_left>ul>li.select_after").mouseenter(function () {
		shops[$(this).find(".item_xiugai").data().id].showInfo();
	});
});
</script>
</html>