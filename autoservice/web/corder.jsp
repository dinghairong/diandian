<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.bean.AreaDetail"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	Company company = (Company)session.getAttribute("company");
    if(company == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }
    DecimalFormat df=new DecimalFormat("######0.00");
    OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
    CorpOrderNumberDao corpDao = (CorpOrderNumberDao)SpringUtils.getBean(CorpOrderNumberDao.class);
    
    ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
    List<Order> order_list = orderDao.findOrderByCompany(company.getId());
    // List<Order> order_list1 = orderDao.findOrderByCompanyAndType(company.getId(),1);
    // List<Order> order_list2 = orderDao.findOrderByCompanyAndType(company.getId(),2);
    //List<ServiceShop> shop_list = serviceShopDao.findAllServiceShop();
    String balance = "0";
    if(null != company.getBalance() && company.getBalance().length() > 0){
        balance = company.getBalance();
    }
    String iscorder = (String)request.getParameter("corder");
    if(null == iscorder){
        iscorder = "0";
    }
    
    AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
   String setcity = (String)session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		setcity = "上海";
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}


	List<AreaDetail> hotarea = areaDetailDao.findAreaDetailByHot();
	List<String> isRepeat = new ArrayList<String>();

	List<AreaDetail> province_list = areaDetailDao.findAllProvince();
	List<AreaDetail> selectcity = areaDetailDao.findAllCountyByCity(setcity + "市");
	List<AreaDetail> selectcounty = areaDetailDao.findAllCountyByCity(setcity + "市");
	
	
	String selectprovince = "";
	if(selectcity.size() > 0){
		selectprovince = selectcity.get(0).getProvince();
		selectcity = areaDetailDao.findAllCityByProvince(selectprovince);
	}else{
		selectcity = areaDetailDao.findAllCityByProvince("上海市");
		selectprovince = selectcity.get(0).getProvince();
	}
    
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮你养车网－－企业用户－－消费订单管理</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/corder.css">
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
                        <a href="<%=ctx%>/corder.jsp" class="on">消费订单管理</a>
                        <a href="<%=ctx%>/caccount.jsp">账号管理</a>
                        <a href="" style="border-right: 0!important;">统计</a>
                    </div>

                    <ul class="qyyh_lsdd_tab">
                        <li>已发送订单</li>
                        <li>未发送订单</li>
                        <li class="current">历史订单</li>
                    </ul>
                    <div class="qyyh_xfddAll">
                        <!--已发送订单-->
                        <div class="qyyh_xfdd_cont">
                            <ul class="qyyh_lsdd_cont">
                                <li class="title">
                                    <span style="width: 117px;">订单号</span>
                                    <span style="width: 94px;">服务类型</span>
                                    <span style="width: 100px;">服务名称</span>
                                    <span style="width: 80px;">用户名</span>
                                    <span style="width: 83px;">用户手机</span>
                                    <!-- <span style="width: 121px;">用户车型</span> -->
                                    <span style="width: 74px;">服务价格</span>
                                    <span class="no" style="width: 317px;">门店信息</span>
                                </li>
                                <%
                                int order_count1 = 0;
                                for(int i = 0;i < order_list.size();i ++){
                                    if(null != order_list.get(i).getCustomername() && order_list.get(i).getCustomername().length() > 0){
                                        order_count1 ++ ;
                                %>
                                <li>
                                    <span style="width: 117px;">
                                        <%=order_list.get(i).getSerialnumber()%>
                                    </span>
                                    <span style="width: 94px;">
                                        <%=order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%>
                                    </span>
                                    <span style="width: 100px;">
                                        <%=order_list.get(i).getServiceProduct().getTitle()%>
                                    </span>
                                    <span style="width: 80px;">
                                        <%=order_list.get(i).getCustomername()%>
                                    </span>
                                    <span style="width: 83px;">
                                        <%=order_list.get(i).getCustomerphone()%>
                                    </span>
                                    <!-- <span style="width: 121px;">凯越-上海通用别克</span> -->
                                    <span style="width: 74px;" class="ff551a">
                                        ¥<%=df.format(order_list.get(i).getServiceProduct().getNewprice())%>
                                    </span>
                                    <span class="no" style="width: 317px;">
                                        <%=order_list.get(i).getServiceShop() == null ? "" : order_list.get(i).getServiceShop().getTitle()%>
                                    </span>
                                </li>
                                <%
                                    }
                                }
                                %>
                               <!--  <li>
                                    <span style="width: 117px;">BNYC001120</span>
                                    <span style="width: 94px;">汽车清洗</span>
                                    <span style="width: 100px;">汽车全套优惠清洗</span>
                                    <span style="width: 80px;">Nina7</span>
                                    <span style="width: 83px;">18115601598</span>
                                    <span style="width: 121px;">凯越-上海通用别克</span>
                                    <span style="width: 74px;" class="ff551a">¥7000</span>
                                    <span class="no" style="width: 317px;"><select><option>南京江宁二店（南京市胜太东路梦蝶园对面）</option></select></span>
                                </li> -->

                            </ul>
                            <div class="qyyh_fenye">
                                <!-- <a class="shangxia">上一页</a>
                                <a class="on">1</a>
                                <a>2</a>
                                <a>3</a>
                                <span>...</span>
                                <a>7</a>
                                <a class="shangxia">下一页</a> -->
                                <p>总数量：<%=order_count1%>单</p>
                            </div>
                        </div>
                        <!--END已发送订单-->
                        <!--未发送订单-->
                        <div class="qyyh_xfdd_cont">
                            <ul class="qyyh_lsdd_cont">
                                <li class="title">
                                    <span style="width: 157px;">订单号</span>
                                    <span style="width: 84px;">服务类型</span>
                                    <span style="width: 110px;">服务名称</span>
                                    <span style="width: 80px;">用户名</span>
                                    <span style="width: 110px;">用户手机</span>
                                    <!-- <span style="width: 171px;">用户车型</span> -->
                                    <span style="width: 50px;">剩余服务数量</span>
                                    <span style="width: 202px;">选择门店</span>
                                    <span class="no" style="width: 136px;">操作</span>
                                </li>
                                <%
                                for(int i = 0;i < order_list.size();i ++){
                                	 CorpOrderNumber corp = corpDao.findCorpOrderNumberByOrder(order_list.get(i).getId());
                                    if((null == order_list.get(i).getCustomername() || order_list.get(i).getCustomername().length() == 0) &&
                                            (corp.getTotal() - corp.getUsed() > 0)) {
                                %>
                                <li>
                                    <span style="width: 157px;">
                                        <%=order_list.get(i).getSerialnumber()%>
                                    </span>
                                    <span style="width: 84px;">
                                        <%=order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%>
                                    </span>
                                    <span style="width: 110px;">
                                        <%=order_list.get(i).getServiceProduct().getTitle()%>
                                    </span>
                                    <span style="width: 80px;">
                                        <input class="qyyh_lslsi" id="customername" name="customername"/>
                                    </span>
                                    <span style="width: 110px;">
                                        <input class="qyyh_lslsi" id="customerphone" name="customerphone"/>
                                    </span>
                                    <!-- <span style="width: 171px;"><select><option>凯越-上海通用别克</option></select></span> -->
                                    <span style="width: 50px;">
                                        <%=corp.getTotal()-corp.getUsed()%>
                                    </span>
                                    <span style="width: 202px;">
                                    	<span style="width:120px">请选择服务门店</span>
                                        <input type="button" style="width:62px;background-color: #f54e39;border-radius:3px;font-size:12px;color:#fff;padding:5px 8px" value="选择门店"/>
                                    </span>
                                    <span class="no" style="width: 206px;">
                                        <%if(order_list.get(i).getState() == 1){%>
                                        <a style="background-color: #7ade2b;" href="javascript:void(0)" onclick="sendorder(this)">发送订单</a>
                                        &nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a style="background-color: #f54e39;" href="javascript:void(0)" onclick="">退订</a>
                                        <%}else{
                                            if(order_list.get(i).getState() == 0){
                                        %>
                                        <a style="background-color: #f54e39;" href="javascript:void(0)" onclick="paidorder(this)">付款</a>
                                        <a style="background-color: #f54e39;" href="javascript:void(0)" onclick="cancelorder(this)">取消</a>
                                        <%}}%>
                                        <input type="hidden" value="<%=order_list.get(i).getSerialnumber()%>" id="serialnumber" name="serialnumber">
                                        <input type="hidden" value="<%=order_list.get(i).getServiceProduct().getId()%>" id="sp_id" name="sp_id">
                                   	 </span>
                                </li>
                                <%
                                    }
                                }
                                %>
                                <form name="alipayment" action="<%=ctx%>/alipayapi.jsp" method="post" target="_blank">
                                    <input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no" value="">
                                    <input type="hidden" name="WIDshow_url" id="WIDshow_url" value="">
                                    <input type="hidden" name="WIDsp_id" id="WIDsp_id" value="">
                                </form>
                                <input type="hidden" name="balance" id="balance" value="<%=Double.parseDouble(balance)%>">
                                <input type="hidden" name="balance" id="spId" value="">
                                <!-- <li>
                                    <span style="width: 107px;">BNYC001120</span>
                                    <span style="width: 84px;">汽车清洗</span>
                                    <span style="width: 110px;">汽车全套优惠清洗</span>
                                    <span style="width: 80px;"><input class="qyyh_lslsi"/></span>
                                    <span style="width: 110px;"><input class="qyyh_lslsi"/></span>
                                    <span style="width: 171px;"><select><option>凯越-上海通用别克</option></select></span>
                                    <span style="width: 50px;">30</span>
                                    <span style="width: 142px;"><select><option>选择门店</option></select></span>
                                    <span class="no" style="width: 136px;"><a style="background-color: #7ade2b;">发送订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a style="background-color: #f54e39;">退订</a></span>
                                </li>
                                -->
                            </ul>
                        </div>
                        <!--END未发送订单-->
                        <!--历史订单-->
                        <div class="qyyh_xfdd_cont">
                            <div class="qyyh_lsdd_one">
                                <div class="qyyh_lsdd_one_input">
                                    <input value="输入商品标题或订单号进行搜索" onfocus="if(this.value == '输入商品标题或订单号进行搜索'){this.value = '';this.style.color='#333'}" onblur="if(this.value == ''){this.value = '输入商品标题或订单号进行搜索';this.style.color='#afafaf'}"/>
                                    <a>订单搜索</a>
                                </div>
                                <!--    <span>精简筛选条件<img src="images/jqss_xs.png"/></span>  -->
                            </div>
                            <div class="qyyh_lsdd_two">
                                <p>
                                    订单日期选择：
                                    <a class="on">全部</a>
                                    <a>近一个星期</a>
                                    <a>近一个月</a>
                                    <a>近三个月</a>
                                </p>
                                <p>
                                    <span>服务类型：</span>
                                    <select id="orderType" name="orderType">
                                        <option value="0" selected>全部</option>
                                        <option value="1">安装服务</option>
                                        <option value="3">快修保养</option>
                                        <option value="5">美容装潢</option>
                                        <option value="7">检测修正</option>
                                    </select>
                                    <span>订单主人：</span>
                                    <select>
                                        <option>全部</option>
                                    </select>
                                    <span>订单状态：</span>
                                    <select id="OrderStatus" name="OrderStatus">
                                        <option value="8" selected>全部</option>
                                        <option value="0">已提交</option>
                                        <option value="1">已付款</option>
                                        <option value="2">已使用</option>
                                        <option value="3">已评价</option>
                                        <option value="4">退款中</option>
                                        <option value="5">退款成功</option>
                                        <option value="6">退款失败</option>
                                        <option value="7">已取消</option>
                                    </select>
                                </p>
                                <input id="UserName" class="qyyhlt_input" value="输入客户名称或电话" onfocus="if(this.value == '输入客户名称或电话'){this.value = '';this.style.color='#333'}" onblur="if(this.value == ''){this.value = '输入客户名称或电话';this.style.color='#afafaf'}" name="UserName"/>
                                <input id="OrderProducts" class="qyyhlt_input" value="输入产品名字包含内容" onfocus="if(this.value == '输入产品名字包含内容'){this.value = '';this.style.color='#333'}" onblur="if(this.value == ''){this.value = '输入产品名字包含内容';this.style.color='#afafaf'}" name="OrderProducts"/>
                                <span class="qyyhlt_span">金额：</span>
                                <input class="qyyhlt_jeIpt" name="SumMoney"/>
                            </div>
                            <ul class="qyyh_lsdd_cont">
                                <li class="title">
                                    <span style="width: 150px;">订单号</span>
                                    <span style="width: 94px;">服务类型</span>
                                    <span style="width: 150px;">服务名称</span>
                                    <span style="width: 114px;">用户名</span>
                                    <span style="width: 153px;">用户手机</span>
                                    <!-- <span style="width: 171px;">用户车型</span> -->
                                    <span style="width: 84px;">服务价格</span>
                                    <span class="no" style="width: 117px;">订单状态</span>
                                </li>
                                <%for(int i = 0;i < order_list.size();i ++){%>
                                <li>
                                    <span style="width: 150px;">
                                        <%=order_list.get(i).getSerialnumber()%>
                                    </span>
                                    <span style="width: 94px;">
                                        <%=order_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getName()%>
                                    </span>
                                    <span style="width: 150px;">
                                        <%=order_list.get(i).getServiceProduct().getTitle()%>
                                    </span>
                                    <span style="width: 114px;">
                                        <%=order_list.get(i).getCustomername()%>
                                    </span>
                                    <span style="width: 153px;">
                                        <%=order_list.get(i).getCustomerphone()%>
                                    </span>
                                    <!-- <span style="width: 171px;">凯越-上海通用别克</span> -->
                                    <span style="width: 84px;" class="ff551a">
                                        ¥<%=order_list.get(i).getPrice() * order_list.get(i).getNumber()%>
                                    </span>
                                    <span class="no" style="width: 117px;">
                                        <%if(order_list.get(i).getState() == 0){%>
                                        已下单
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
                                        <%if(order_list.get(i).getState() == 7){%>
                                        已取消
                                        <%}%>
                                    </span>
                                </li>
                                <%}%>
                                <!-- <li>
                                    <span style="width: 117px;">BNYC001120</span>
                                    <span style="width: 94px;">汽车清洗</span>
                                    <span style="width: 150px;">汽车全套优惠清洗</span>
                                    <span style="width: 114px;">Nina7</span>
                                    <span style="width: 153px;">18115601598</span>
                                    <span style="width: 171px;">凯越-上海通用别克</span>
                                    <span style="width: 84px;" class="ff551a">¥7000</span>
                                    <span class="no" style="width: 117px;">已提交</span>
                                </li>
                                <li>
                                    <span style="width: 117px;">BNYC001120</span>
                                    <span style="width: 94px;">汽车清洗</span>
                                    <span style="width: 150px;">汽车全套优惠清洗</span>
                                    <span style="width: 114px;">Nina7</span>
                                    <span style="width: 153px;">18115601598</span>
                                    <span style="width: 171px;">凯越-上海通用别克</span>
                                    <span style="width: 84px;" class="ff551a">¥7000</span>
                                    <span class="no" style="width: 117px;">已提交</span>
                                </li>
                                <li>
                                    <span style="width: 117px;">BNYC001120</span>
                                    <span style="width: 94px;">汽车清洗</span>
                                    <span style="width: 150px;">汽车全套优惠清洗</span>
                                    <span style="width: 114px;">Nina7</span>
                                    <span style="width: 153px;">18115601598</span>
                                    <span style="width: 171px;">凯越-上海通用别克</span>
                                    <span style="width: 84px;" class="ff551a">¥7000</span>
                                    <span class="no" style="width: 117px;">已提交</span>
                                </li> -->
                            </ul>
                            <div class="qyyh_fenye">
                                <!-- <a class="shangxia">上一页</a>
                                <a class="on">1</a>
                                <a>2</a>
                                <a>3</a>
                                <span>...</span>
                                <a>7</a>
                                <a class="shangxia">下一页</a> -->
                                <p>总数量：<%=order_list.size()%>单</p>
                            </div>
                            <input id="iscorder" type="hidden" value="<%=iscorder%>">
                        </div>
                        <!--END历史订单-->
                    </div>
                </div>
            </div>
        </div>
        
		<div id="forget1" class="userinfobody forgetbodyheight" style="z-index: 9999999; position: fixed; top: 150px; left: 470px;width:420px;hight:300px;display:none;">
			<div class="cityselect" style="-webkit-box-sizing: content-box;margin-top:20px;">
			<label for="provinceSelect">按省份选择：</label>
			<select id="provinceSelect">
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
			<select id="countySelect">
				<%
				isRepeat.clear();
				for(int i = 0;i < selectcounty.size();i ++){
					if(!isRepeat.contains(selectcounty.get(i).getCounty())){
						isRepeat.add(selectcounty.get(i).getCity());
				%>
				<option value="<%=selectcounty.get(i).getId()%>"><%=selectcounty.get(i).getCounty()%></option>
				<%
					}
				}
				%>
			</select>
			<button  value="确定" onclick="getShopList()" style="width:62px;background-color: #f54e39;border-radius:3px;font-size:12px;color:#fff;padding:5px 8px">选择</button>
	</div>
	<div style="margin-top:20px;margin-bottom:20px;margin-left:100px">
		<label for="provinceSelect">选择门店：</label>
		<select id="shopList">
		
		</select>
		<button id="confirm" value="确定" style="width:62px;background-color: #f54e39;border-radius:3px;font-size:12px;color:#fff;padding:5px 8px">确定</button>
	</div>
		</div>
					
	
	<jsp:include page="footSection.jsp" flush="true" />
	</div>
	<div id="forget2" style="position: fixed; z-index: 9999998; background-color: black; opacity: 0.3; right: 0px; bottom: 0px; left: 0px; top: 0px;display:none;"></div>
	<div>
		<input type="hidden" id="h_shopid" value ="">
	</div>
	</div>
</body>
<script type="text/javascript">
var obj;
$("input[value='选择门店']").click(function(){
	$('#forget1').show();
	$('#forget2').show();
	var id= $(this).parent().parent().find("#sp_id").val();
	$("#spId").val(id);
	obj = $(this).parent().find("span");
})

$('#confirm').click(function(){
	$('#forget1').hide();
	$('#forget2').hide();
	var shop = $('#shopList option:selected').html();
    // var $shopList = document.getElementById('shopList');
    // var shop = $shopList[$shopList.selectedIndex].text;
	obj.html(shop);
	$('#h_shopid').val($('#shopList option:selected').val());
});
$(function(){
	$('.daohang').hide();
	$('.lunbo').hide();

    if($('#iscorder').val() == "1"){
        $(".qyyh_lsdd_tab li")[1].click();
    }
});
$(".qyyh_lsdd_tab").tabso({
    cntSelect:".qyyh_xfddAll",
    tabEvent:"click",
    tabStyle:"fade"
});

function sendorder(obj){
    var serialnumber = $(obj).parent().find("#serialnumber").val();
    var sp_id = $(obj).parent().find("#sp_id").val();
    var customername = $(obj).parent().parent().find("#customername").val();
    var customerphone = $(obj).parent().parent().find("#customerphone").val();
    var sid = $('#h_shopid').val();
    if(customername.length == 0){
        sAlert("请输入用户名");
        return false;
    }
    if(customerphone.length == 0){
        sAlert("请输入用户手机号码");
        return false;
    }
    if(sid == "0"){
        sAlert("请选择门店");
        return false;
    }
    var uri = "<%=ctx%>/former/sendorder?sid=" + sid + "&customername=" + customername + "&customerphone=" + customerphone + "&serialnumber=" + serialnumber + "&sp_id=" + sp_id;
    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.send == "ok"){
                sAlert3("发送成功!",window.location.href);
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
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
                sAlert3("取消成功!",window.location.href + "?corder=1");
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
			$('#countySelect').html(ret.html2);
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
});

$("#citySelect").change(function(){
	var city =encodeURI(encodeURI($('#citySelect option:selected').text()));
	$.ajax({
		url: "<%=ctx%>/former/getCountyByProvinceandCity.do?city=" + city,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('#countySelect').html(ret.html);
			
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
});

function getShopList(){
	var province =encodeURI(encodeURI($('#provinceSelect option:selected').text()));
	var city =encodeURI(encodeURI($('#citySelect option:selected').text()));
	var county =encodeURI(encodeURI($('#countySelect option:selected').text()));
	var id=$("#spId").val();
	$.ajax({
		url: "<%=ctx%>/former/getShopListByAreaDetail.do?city="+city+"&province="+province+"&county="+county+"&id="+id,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('#shopList').html(ret.html);
			
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