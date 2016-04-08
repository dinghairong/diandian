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
	AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
	ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);

	String setcity = (String)session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		response.sendRedirect(ctx + "/index.jsp");
		return;
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}
	String getbyprovince = (String)request.getAttribute("getbyprovince");
	if(null == getbyprovince){
		getbyprovince = "";
	}
	String nowgetprovince = (String)session.getAttribute("nowprovince");
	if(getbyprovince.length() > 0){
		nowgetprovince = getbyprovince;
	}
	String getbycity = (String)request.getAttribute("getbycity");
	List<String> isRepeat = new ArrayList<String>();

	List<AreaDetail> province_list = areaDetailDao.findAllProvince();
	List<AreaDetail> selectcity = null;
	if(null != getbycity && getbycity.length() > 0){
		selectcity = areaDetailDao.findAllCountyByCity(getbycity);
		if(null != selectcity && selectcity.size() > 0){
			selectcity = areaDetailDao.findAllCityByProvince(selectcity.get(0).getProvince());
		}else{
			areaDetailDao.findAllCityByProvince(nowgetprovince);
		}
	}else{
		selectcity = areaDetailDao.findAllCityByProvince(nowgetprovince);
		getbycity = "";
	}
	String select_province = "";
	if(null != selectcity && selectcity.size() > 0){
		select_province = selectcity.get(0).getProvince();
	}else{
		select_province = nowgetprovince;
	}
	SmartProperties smartProp = SmartProperties.getInstance();
	String imgPath = smartProp.getImgPath();

	// Integer totalshop = (Integer)request.getAttribute("totalshop");
	List<ServiceShop> serviceshop_list = (List<ServiceShop>)request.getAttribute("serviceshop");
	int totalshop = 0;
	if(null == serviceshop_list){
		serviceshop_list = serviceShopDao.findServiceShopByCity(setcity + "市");
	}
	totalshop = serviceshop_list.size();
	Integer findbyorder1 = (Integer)request.getAttribute("findbyorder1");
	Integer findbyorder2 = (Integer)request.getAttribute("findbyorder2");
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－服务点</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/shoplist.css">
	 <link href="images/favicon.ico" rel="shortcut icon"/>

    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
    <script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js" type="text/ecmascript"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
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
    <script src="<%=ctx%>/js/map.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<div class="top_line"></div>

		<div id="bodySection" style="overflow: hidden;">
			<div class="container_24">
				<div class="container_24 ">
					<div class="grid_24">
						<div class="site-map">
							<a class="astyle" href="#">当前位置</a>
							> 服务门店
						</div>
						<div class="region_nexist_tip" style="display:none;">
							<span class="words_tip">抱歉！您所在的地区暂时没有安装门店</span>
							<span class="advertisement_tip">我们会将商品通过快递配送给您</span>
							<a class="to_shop" href="http://www.hongxi365.com.cn">去购物</a>
							<span class="region_nexist_tip_closebtn">×</span>
						</div>
					</div>
					<div class="container_24 details">
						<div class="product-tt">
							<div class="region_select">
								<span class="region_select_tip">
									<span class="region_select_tip_img"></span>
									<span class="region_select_tip_text">您所在的区域：</span>
								</span>	
								<ul class="posInfo">
									<select id="provinceSelect">
										<%
										for(int i = 0;i < province_list.size();i ++){
											if(!isRepeat.contains(province_list.get(i).getProvince())){
											isRepeat.add(province_list.get(i).getProvince());
											if(null != select_province){
												if(select_province.equals(province_list.get(i).getProvince())){
										%>
										<option selected="selected"><%=province_list.get(i).getProvince()%></option>
										<%
												}else{
										%>
										<option><%=province_list.get(i).getProvince()%></option>
										<%
												}
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
										<option>所有</option>
										<%
										isRepeat.clear();
										for(int i = 0;i < selectcity.size();i ++){
											if(!isRepeat.contains(selectcity.get(i).getCity())){
												isRepeat.add(selectcity.get(i).getCity());
												if(getbycity.equals(selectcity.get(i).getCity())){
										%>
											<option selected="selected"><%=selectcity.get(i).getCity()%></option>
										<%}else{%>
											<option><%=selectcity.get(i).getCity()%></option>
										<%
												}
											}
										}
										%>
									</select>
								</ul>
								<input type="hidden" id="getbyprovince" name="getbyprovince" value="<%=getbyprovince%>">
								<input type="hidden" id="nowgetprovince" name="nowgetprovince" value="<%=nowgetprovince%>">
								<input type="hidden" id="getbycity" name="getbycity" value="<%=getbycity%>">
							</div>
							<div id="posControl" class="location">
								<span class="posInfo">
									您的地址：
									<input class="addressPos" type="text" onkeydown="	EnterPress(event)" onkeypress="	EnterPress(event)" placeholder="<%=nowgetprovince%> 请输入您的详细地址" onfocus="addressPos_onfocus(this);">
									<a class="positionBtn" href="javascript:void(0);">查找</a>
									<span class="searchposError" style="color:#D12A3E;display:none">找不到该地址</span>
								</span>
							</div>
							<div class="order-menu"></div>
							<div class="clr"></div>
						</div>
						<div id="shopmap" style="float:left;">
							<div id="allmap">
							</div>
						</div>
						<div class="shoplist_left">
							<%
								int seq1 = 2;
								int seq2 = 2;
								boolean isselect2 = false;
								if(null != findbyorder1){
									seq1 = findbyorder1;
									isselect2 = true;
								}
								if(null != findbyorder2){
									seq2 = findbyorder2;
									isselect2 = true; 
								}
							%>
							<div class="order-by" style="overflow:hidden;height:30px;line-height:30px;">
								<a  <%= isselect2 ? "class='evaluation'" : "class='evaluation selected'"%> href="#" onclick="findServiceShopByOrder(this)" data-id="0">推荐</a>
								<a <%= seq1 == 2 ? "class='evaluation arrow'" : seq1 == 1 ? "class='evaluation arrow selected asc'" : "class='evaluation arrow selected desc'" %> href="javascript:void(0)" onclick="findServiceShopByOrder(this)" data-id="1">
									评论
									<span class="downArrow"></span>
									<span class="upArrow"></span>
								</a>
								<span class="countMd">共<%=totalshop%>家门店</span>
							</div>
							<div id="product-list" class="grid_8" style="float:left;margin-top: 0;">
								<div id="list">
									<%
									for(int i = 0;i < serviceshop_list.size();i ++){
										if(serviceshop_list.get(i).getStatus() == 0){
									%>
									<div class="p clearfix" style="overflow:hidden">
										<div class="pr-shopdes">
											<span class="pr-shopimg" style="height: 72px; width: 72px">
												<a target="_blank" href="<%=ctx%>/former/shopdetail?sp_id=<%=serviceshop_list.get(i).getId()%>">
													<%if(null != serviceshop_list.get(i).getImage() && serviceshop_list.get(i).getImage().length() > 0){%>
													<img height="150" width="150" alt="" src="<%=ctx%>/common/displayPic?imagePath=<%= imgPath + serviceshop_list.get(i).getPath()%>&imageName=<%=serviceshop_list.get(i).getImage()%>">
													<%}else{%>
													<img src="<%=ctx%>/img/hx_default.png" alt="" height="150" width="150">
													<%}%>
												</a>
											</span>
											<div class="shop-inf">
												<div class="shop-name clearfix">
													<a class="carparname" target="_blank" title="<%=serviceshop_list.get(i).getTitle()%>" href="<%=ctx%>/former/shopdetail?sp_id=<%=serviceshop_list.get(i).getId()%>">
														<%=serviceshop_list.get(i).getTitle()%>
													</a>
												</div>
												<div>
													<span>
														服务评价：
													</span>
													<%
													int all_star = 0;
													int star = 0;
													int ordersize = 0;
													for(int j = 0;j < serviceshop_list.get(i).getComments().size();j ++){
														all_star = all_star + serviceshop_list.get(i).getComments().get(j).getStar();
													}
													if(serviceshop_list.get(i).getComments().size() > 0){
														star = all_star / serviceshop_list.get(i).getComments().size();
													}
													for(int j = 0;j < serviceshop_list.get(i).getOrders().size();j ++){
														if(serviceshop_list.get(i).getOrders().get(j).getState() >= 2 && serviceshop_list.get(i).getOrders().get(j).getState() < 4){
															ordersize ++ ;
														}
													}
													%>
													<span>
													<%
													for(int k = 0;k < star;k ++){
													%>
													<img src="<%=ctx%>/img/star_1.png">
													<%
													}
													for(int k = star;k < 5;k ++){
													%>
													<img src="<%=ctx%>/img/star_2.png">
													<%
													}
													if(serviceshop_list.get(i).getComments().size() > 0){
													%>
													较好，<%=serviceshop_list.get(i).getComments().size()%>次评分
													<%
													}else{
													%>
													0次评分
													<%
													}
													%>
													</span>
													<br>
													<span class="descrip">此门店共完成<%=ordersize%>个安装单，有<%=serviceshop_list.get(i).getComments().size()%>条评论</span>
												</div>
											</div>
										</div>
									</div>
									
									<%}}%>
								</div>
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
	$('.daohang_wenzis').attr("style","color:#6c6c6c");
	$($('.daohang_wenzi')[4]).attr("style","color:#007fcc");
	$('.lunbo').hide();
});

var province = $('#getbyprovince').val();
var get_city = $('#getbycity').val();	
var city = $('#nowcityname').html() + "市";
var markerArr;
var markerC;
var icon3 = "<%=ctx%>/img/icon3.gif";
var level = 9;
var Province = remote_ip_info["province"] + "省";
var City = remote_ip_info["city"];
if(province.length > 0){
	Province = province;
	var uri = "<%=ctx%>/former/getnowcity.do?";
	var now_province = Province;
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
}
if(get_city.length > 0){
	City = get_city;
}

$('#provinceSelect').change(function(){
	var province = this.options[this.selectedIndex].innerHTML;
	province = encodeURI(encodeURI(province)); 
	location.href = "<%=ctx%>/former/getshoplist.do?province=" + province;
});
$('#citySelect').change(function(){
	var city = this.options[this.selectedIndex].innerHTML;
	if(city == "所有"){
		var pro = $('#provinceSelect').val();
		pro = encodeURI(encodeURI(pro)); 
		location.href = "<%=ctx%>/former/getshoplist.do?province=" + pro;
	}else{
		city = encodeURI(encodeURI(city)); 
		location.href = "<%=ctx%>/former/getshoplist.do?city=" + city;
	}
});


function setmarkerArrInfo(){
	var uri = "<%=ctx%>/former/getshopinfo?"
	if(province.length > 0){
		province = encodeURI(encodeURI(province));
		uri = uri + "province=" + province;
	}else{
		if(get_city.length > 0)
		get_city = encodeURI(encodeURI(get_city));
		uri = uri + "city=" + get_city;
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
function addressPos_onfocus(obj){
	var nowprovince = Province;
	if(province != nowprovince && province.length > 0){
		nowprovince = province;
	}
	obj.value = nowprovince;
}
function EnterPress(e){
	var e = e || window.event;
	if (e.keyCode == 13)
	{
		$("#posControl .positionBtn").click();
	}
}

$(function(){
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
		}
	}
	setmarkerArrInfo();

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
	Hx.Map.render(markerArr);

	$("#posControl .positionBtn").click(function (){
		var localSearch = new BMap.LocalSearch(map);
		localSearch.enableAutoViewport();
		var keyword = $(".addressPos").val();
		localSearch.setSearchCompleteCallback(function (searchResult){
			if (JSON.parse(JSON.stringify(searchResult))._pois.length != 0){
				$(".searchposError").hide();
				if (markerC){
					map.removeOverlay(markerC);
				}
				var poi = searchResult.getPoi(0);
				//alert(poi.point.lng + "," + poi.point.lat); //获取经度和纬度，将结果显示在文本框中
				map.centerAndZoom(poi.point, 13);
				var icon = new BMap.Icon(icon3, new BMap.Size(20, 40), {
					//是引用图标的名字以及大小，注意大小要一样
					anchor: new BMap.Size(10, 40),//这句表示图片相对于所加的点的位置
					imageOffset: new BMap.Size(0, 0)
				});
				var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat), { icon: icon });  // 创建标注，为要查询的地方对应的经纬度
				markerC = marker;
				map.addOverlay(marker);
				marker.setTitle((JSON.parse(JSON.stringify(searchResult))).province + (JSON.parse(JSON.stringify(searchResult))._pois[0].title));
				$('html, body').animate({ scrollTop: 199 }, 'slow');
			}
			else{
				$(".searchposError").show();
			}
		});
		localSearch.search(keyword);
	});
});
</script>
</html>
