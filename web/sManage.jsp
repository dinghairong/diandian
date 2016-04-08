<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.pojo.RegProtocol" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	ServiceClassDao servceClassDao = (ServiceClassDao)SpringUtils.getBean(ServiceClassDao.class);
	ServiceshopServiceDao serviceshopServiceDao = (ServiceshopServiceDao)SpringUtils.getBean(ServiceshopServiceDao.class);
	ServiceProjectDao serviceProjectDao = (ServiceProjectDao)SpringUtils.getBean(ServiceProjectDao.class);
	ServiceProductDao serviceProductDao = (ServiceProductDao)SpringUtils.getBean(ServiceProductDao.class);
	
	DetailPictureDao dpDao = (DetailPictureDao)SpringUtils.getBean(DetailPictureDao.class);
	
	ServiceShop shop_user = (ServiceShop)session.getAttribute("shopuser");
	if(session.getValue("shopuser") == null){
		response.sendRedirect(ctx + "/logout.jsp");
		return;
	}
	List<DetailPicture> dp_list = dpDao.getShopThumbnails(shop_user.getId());
	
	NewsInfoDao newsinfoDao = (NewsInfoDao)SpringUtils.getBean(NewsInfoDao.class);
	OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
	List<NewsInfo> newsinfo_list = newsinfoDao.findNewInfoByServiceShop(shop_user.getId());
	List<Order> order_list = orderDao.findOrderByServiceShopAndState(shop_user.getId(),1);
	List<ServiceClass> class_list = servceClassDao.getAllClass();
	List<ServiceshopService> service_list = serviceshopServiceDao.findBySSIDOrderByClassProject(shop_user.getId());
	List<ServiceProject> project_list = serviceProjectDao.getAllServiceProject();
	List<ServiceProduct> product_list = serviceProductDao.findAllServiceProduct();
	
	SmartProperties smartProp = SmartProperties.getInstance();
	String imgPath = smartProp.getImgPath();

	DbHelper helper = DbHelper.getInstance();
	RegProtocol protocol = helper.getStoreProtocol(shop_user.getId());
	
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－商家门店－－门店对账</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/sManage.css">
	 <link href="images/favicon.ico" rel="shortcut icon"/>
	 <link rel="stylesheet" href="<%=ctx%>/css/regist_store_protoco1.css">

    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
    <script type="text/javascript">
	window.jQuery || document.write("<script src='<%=ctx %>/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
	var ctx = "<%=ctx%>";
	</script>
	<script src="<%=ctx%>/assets/js/ajaxfileupload.js"></script>
	<script src="<%=ctx%>/js/hongxi.alert.js"></script>
	<script src="<%=ctx%>/js/select2.js"></script>
	<script src="<%=ctx%>/js/select2.min.js"></script>
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
                            <img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sOrderManage.jsp" style="display:inline-block;">订单管理</a>
                            <img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sHistoryOrder.jsp" style="display:inline-block;">历史订单</a>
                            <img src="<%=ctx%>/img/shop_title.png" style="display:inline-block;float: right;">						
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/s_r.jsp" style="display:inline-block;">门店对账</a>
							
						</div>
						<div class="grid_2">
							<a class="current" href="<%=ctx%>/sManage.jsp" style="display:inline-block;background-color: #00688b;width:100%;">门店管理</a>							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="bodySection" style="overflow: hidden;min-height:0;">
			<div class="container_24">
				<div id="main">
					<div id="ListLeft" style="width:150px">
						<div class="leftNavi">
							<div style="text-align:left;">
								<div style="line-height: 45px;font-size:18px;margin-left: 20px;">
									门店管理
								</div>
								<div class="title_select_div">
									<a href="javascript:void(0)" style="line-height: 45px;" class="title_select" onclick="aboutChange(this,shopmanage)">门店服务管理</a>
								</div>
								<div class="title_unselect_div">
									<a href="javascript:void(0)" style="line-height: 45px;" onclick="aboutChange(this,shopedit)">门店资料编辑</a>
								</div>
								<div class="title_unselect_div">
									<a href="javascript:void(0)" style="line-height: 45px;" onclick="aboutChange(this,protocol1)">门店协议信息</a>
								</div>
							</div>	
						</div>
					</div>
					<div id="context" style="overflow: hidden;margin-left:200px;font-size:14px;">
						<div id="shopmanage" >
							
							<div style="margin-top:5px;">
								<span style="font-size:20px;">服务产品</span>
								<a href="javascript:void(0)" style="margin-left:50px;text-decoration: underline;" onclick="addShopCommodity()"><span>添加产品</span></a>
							</div>
							<div id="add_list" style="display:none">
							<div>
								<span>服务类别:</span>
								<select id="selectclass" onchange="setprojectinfo(this)">
                                    <option selected></option>
									<%for(int i  = 0;i < class_list.size();i ++){%>
									<option value="<%=class_list.get(i).getId()%>"><%=class_list.get(i).getName()%></option>
									<%}%>
								</select>
								<span style="margin-left:15px;">服务项目:</span>
								<select id="selectproject" onchange="setproductinfo(this)">
                                    <option selected></option>
								</select>
								<span style="margin-left:15px;">服务产品:</span>
								<select id="selectproduct">
                                    <option selected></option>
								</select>
								<span style="margin-left:-30px;"><a href="javascript:void(0)" onclick="deletelist(this,0,0,0)">删除</a></span>
							</div>
							</div>
							<div class="tire_commodity_list">
								<%
								if(service_list.size() > 0){
									for(int i = 0;i < service_list.size();i ++){
								%>
								<div>
									<span>服务类别:</span>
									<select id="selectclass" onchange="setprojectinfo(this)">
										<option></option>
										<%for(int j = 0;j < class_list.size();j ++){
											if(class_list.get(j).getId() == service_list.get(i).getServiceProduct().getServiceProject().getServiceClass().getId()){
										%>
										<option value="<%=class_list.get(j).getId()%>" selected><%=class_list.get(j).getName()%></option>
										<%	
										}else{
										%>
										<option value="<%=class_list.get(j).getId()%>"><%=class_list.get(j).getName()%></option>
										<%}}%>										
									</select>
									<span style="margin-left:15px;">服务项目:</span>
									<select id="selectproject" onchange="setproductinfo(this)">
										<option></option>
										<%
										for(int j = 0;j < project_list.size();j ++){
											if(project_list.get(j).getId() == service_list.get(i).getServiceProduct().getServiceProject().getId()){
										%>
										<option value="<%=project_list.get(j).getId()%>" selected><%=project_list.get(j).getName()%></option>
										<%}else{%>
										<option value="<%=project_list.get(j).getId()%>"><%=project_list.get(j).getName()%></option>
										<%}}%>
									</select>
									<span style="margin-left:15px;">服务产品:</span>
									<select id="selectproduct">
										<option></option>
										<%
										for(int j = 0;j < product_list.size();j ++){
											if(product_list.get(j).getId() == service_list.get(i).getServiceProduct().getId()){
										%>
										<option value="<%=product_list.get(j).getId()%>" selected><%=product_list.get(j).getTitle()%></option>
										<%}else{%>
										<option value="<%=product_list.get(j).getId()%>"><%=product_list.get(j).getTitle()%></option>
										<%}}%>									
									</select>
									<span style="margin-left:-40px;"><a href="javascript:void(0)" onclick="deletelist(this,<%=shop_user.getId()%>,<%=service_list.get(i).getServiceProduct().getId()%>)">删除</a></span>
								</div>
								<%}}else{%>
								<div>
									<span>服务类别:</span>
									<select id="selectclass" onchange="setprojectinfo(this)">
	                                    <option selected></option>
										<%for(int i  = 0;i < class_list.size();i ++){%>
										<option value="<%=class_list.get(i).getId()%>"><%=class_list.get(i).getName()%></option>
										<%}%>
									</select>
									<span style="margin-left:15px;">服务项目:</span>
									<select id="selectproject" onchange="setproductinfo(this)">
	                                    <option selected></option>
									</select>
									<span style="margin-left:15px;">服务产品:</span>
									<select id="selectproduct">
	                                    <option selected></option>
									</select>
									<span style="margin-left:-40px;"><a href="javascript:void(0)" onclick="deletelist(this,0,0,0)">删除</a></span>
								</div>
								<%}%>
							</div>
							
						<div id="commit" class="check_submit_btn">
							<a href="javascript:void(0)" style="line-height: 40px;color: white;" onclick="editshopcommodity()">确认提交</a>
						</div>
						
					</div>
					<div id="shopedit" style="display:none">
						<form id="editform" method="post" action="">
							<div class="register">
								<div class="register-infobox step1">
									<div class="register-row">
										<div class="register-row-left">
											<em>*</em>
											店铺名称：
										</div>
										<div class="register-row-input">
											<input class="pub-input re-password" type="text" name="supplier_name" value="<%=shop_user.getTitle()%>">
										</div>
									</div>
									<div class="register-row">
										<div class="register-row-left">
											<em>*</em>
											业务联系电话：
										</div>
										<div class="register-row-input">
											<input class="pub-input re-password" type="text" name="cmobile" value="<%=shop_user.getTel()%>">
										</div>
									</div>					
									<div class="register-row">
										<div class="register-row-left">
											<em>*</em>
											门店面积：
										</div>
										<div class="register-row-input">
											<input class="pub-input re-password" type="text" name="meter" value="<%=shop_user.getSizes()%>">  平米
										</div>
									</div>
									<div class="register-row">
										<div class="register-row-left">
											<em>*</em>
											门店员工人数：
										</div>
										<div class="register-row-input">
											<input class="pub-input re-password" type="text" name="people" value="<%=shop_user.getPeople()%>">  人
										</div>
									</div>
									<div class="register-row">
										<div class="register-row-left">
											<em>*</em>
											营业年限：
										</div>
										<div class="register-row-input">
											<input class="pub-input re-password" type="text" name="years" value="<%=shop_user.getYears()%>">  年
										</div>
									</div>
									<div class="register-row">
										<div class="register-row-left">
											<em>*</em>
											店铺地址：
										</div>
										<%
											AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
											List<AreaDetail> province_list = areaDetailDao.findAllProvince();
											List<AreaDetail> city_list = null;
											List<AreaDetail> county_list = null;
											if(province_list.size() > 0){
												city_list = areaDetailDao.findAllCityByProvince(shop_user.getAreaDetail().getProvince());
											}
											if(city_list.size() > 0){
												county_list = areaDetailDao.findAllCountyByCity(city_list.get(0).getCity());
											}
											List<String> isRepeat = new ArrayList<String>();
										%>
										<div class="register-row-input">
											<div style="width:90px;height:28px; overflow:hidden; float:left; padding-right:3px;">
												<select id="J_province" style="width:90px; height:28px;font-size:14px;" name="province_id">
												<%
												for(int i = 0;i < province_list.size();i ++){
													if(!isRepeat.contains(province_list.get(i).getProvince())){
														isRepeat.add(province_list.get(i).getProvince());
														if(province_list.get(i).getProvince().equals(shop_user.getAreaDetail().getProvince())){
												%>
														<option selected><%=province_list.get(i).getProvince()%></option>
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
												<input type="hidden" name="province" id="province">
											</div>
											<div style="width:90px;height:28px; overflow:hidden; float:left; padding-right:3px;">
												<select id="J_city" style="width:90px; height:28px;font-size:14px;" name="cityid">
												<%
												isRepeat.clear();
												for(int i = 0;i < city_list.size();i ++){
													if(!isRepeat.contains(city_list.get(i).getCity())){
														isRepeat.add(city_list.get(i).getCity());
														if(city_list.get(i).getCity().equals(shop_user.getAreaDetail().getCity())){
													%>
													<option selected value="<%=city_list.get(i).getId()%>"><%=city_list.get(i).getCity()%></option>
													<%	
														}else{
												%>
												<option value="<%=city_list.get(i).getId()%>"><%=city_list.get(i).getCity()%></option>
												<%
														}
													}
												}
												%>
												</select>
												<input type="hidden" name="city_id" id="city_id">
											</div>
											<div style="width:90px;height:28px; overflow:hidden; float:left; padding-right:3px;display:none">
												<select id="J_area" style="width:90px; height:28px;font-size:14px;" name="area_id">
												<%
												isRepeat.clear();
												for(int i = 0;i < county_list.size();i ++){
													if(!isRepeat.contains(county_list.get(i).getCounty())){
														isRepeat.add(county_list.get(i).getCounty());
														if(county_list.get(i).getCounty().equals(shop_user.getAreaDetail().getCounty())){
												%>
													<option selected><%=county_list.get(i).getCounty()%></option>
												<%		
													}else{
												%>
												<option><%=county_list.get(i).getCounty()%></option>
												<%
														}
													}
												}
												%>
												</select>
												<input type="hidden" name="county" id="county">
											</div>
											<input class="pub-input re-password" type="text" name="address" value="<%=shop_user.getAddress()%>">
										</div>	
									</div>
									<div class="biz_reg_upload">
										<div class="register-row-left">店铺图片： </div>
										<div class="register-row-input">
											<div id="J_logo" class="biz_reg_img fl">
												<%if(shop_user.getImage() != null){%>
												<img width="230" height="140" src="<%=ctx%>/displayPic.do?imagePath=<%=imgPath+shop_user.getPath()%>&imageName=<%=shop_user.getImage()%>">
												<%}else{%>
												<img width="230" height="140" src="" style="display:none;">
												<%}%>
											</div>
											<div class="biz_reg_imgr fl pt10">
												<a id="biz_logo" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
													更换图片
													<input type="file" name="file" id="file1" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo1('file1',this)">
												</a>
												<br>
												<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>
											</div>
										</div>
									</div>
									<div class="biz_reg_upload">
										<div class="register-row-left">您的营业执照： </div>
										<div class="register-row-input">
											<div id="biz_identity_img" class="biz_reg_img fl">
												<%if(shop_user.getLicense() != null){%>
												<img width="230" height="140" src="<%=ctx%>/displayPic.do?imagePath=<%=imgPath+shop_user.getPath()%>&imageName=<%=shop_user.getLicense()%>">
												<%}else{%>
												<img width="230" height="140" src="" style="display:none;">
												<%}%>
											</div>
											<div class="biz_reg_imgr fl pt10">
												<a id="biz_identity" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
												更换图片
													<input type="file" name="file" id="file2" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo2('file2',this)">
												</a>
												<br>
												<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>
											</div>
										</div>
									</div>
									<div class="biz_reg_upload">
										<div class="register-row-left">您的店铺详情： </div>
										<div class="register-row-input">
											<div id="sp_detail1" class="biz_reg_img fl">
												<%if(dp_list.size()>0){%>
													<img width="230" height="140" src="<%=ctx%>/displayPic.do?imagePath=<%=imgPath+dp_list.get(0).getPath()%>&imageName=<%=dp_list.get(0).getImage()%>">
												<%}else{%>
													<img width="230" height="140" src="" style="display:none;">
											<%}%>
											</div>
											<div class="biz_reg_imgr fl pt10">
												<a id="biz_identity" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
												更换图片
													<input type="file" name="file" id="files1" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo3('files1',this)">
												</a>
												<br>
												<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>
											</div>
											
											<div id="sp_detail2" class="biz_reg_img fl">
												<%if(dp_list.size()>1){%>
													<img width="230" height="140" src="<%=ctx%>/displayPic.do?imagePath=<%=imgPath+dp_list.get(1).getPath()%>&imageName=<%=dp_list.get(1).getImage()%>">
												<%}else{%>
													<img width="230" height="140" src="" style="display:none;">
											<%}%>
											</div>
											<div class="biz_reg_imgr fl pt10">
												<a id="biz_identity" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
												更换图片
													<input type="file" name="file" id="files2" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo4('files2',this)">
												</a>
												<br>
												<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>
											</div>
											
											<div id="sp_detail3" class="biz_reg_img fl">
												<%if(dp_list.size()>2){%>
													<img width="230" height="140" src="<%=ctx%>/displayPic.do?imagePath=<%=imgPath+dp_list.get(2).getPath()%>&imageName=<%=dp_list.get(2).getImage()%>">
												<%}else{%>
													<img width="230" height="140" src="" style="display:none;">
											<%}%>
											</div>
											<div class="biz_reg_imgr fl pt10">
												<a id="biz_identity" class="pub-func-btn" style="position: relative; overflow: hidden; direction: ltr;">
												更换图片
													<input type="file" name="file" id="files3" style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;" onchange="uploadUserInfo5('files3',this)">
												</a>
												<br>
												<em>注：图片只限与jpg、png、gif，并且不得超过2M。</em>
											</div>
											
										</div>
									</div>
									<iframe style="display:none" id="rfFrame" name="rfFrame" src="about:blank">
									</iframe>
									<input id="J_img" type="hidden" value="<%=shop_user.getImage()%>" name="logo">
									<input id="J_path" type="hidden" value="<%=shop_user.getPath()%>" name="path">
									<input id="J_identity" type="hidden" value="<%=shop_user.getLicense()%>" name="identity_img">
									<%if(dp_list.size()>2){%>
										<input id="filep3" type="hidden" value="<%=dp_list.get(2).getImage()%>" name="dp_img3">
									<%} %>
									<%if(dp_list.size()>1){%>
										<input id="filep2" type="hidden" value="<%=dp_list.get(1).getImage()%>" name="dp_img2">
									<%} %>
									<%if(dp_list.size()>0){%>
										<input id="filep1" type="hidden" value="<%=dp_list.get(0).getImage()%>" name="dp_img1">
										<input id="dp_path" type="hidden" value="<%=dp_list.get(0).getPath()%>" name="dp_path">
									<%} %>

									
									
									<div class="clear"></div>
									<div class="register-row">
										<div class="register-row-left"> </div>
										<div class="register-row-input">
											<a class="pub-btn-middle-orange">保存修改</a>
										</div>
									</div>
								</div>
							</div>	
						</form>
					</div>
					<div id="protocol1" style="display:none">
						<h1>合&nbsp;作&nbsp;协&nbsp;议</h1>

				        <p>甲方：上海邦车电子商务有限公司</p>

				        <p>&nbsp;</p>

				        <p class="yi">乙方：<input id="txt_second" type="text" value="<%= protocol.getSecond_party() %>" readonly="readonly"></p>

				        <p>&nbsp;</p>

				        <p>甲、乙双方本着自愿、平等、公平、诚实、信用的原则，经友好协商，根据中华人民共和国有关法律、法规的规定签订本协议，由双方共同遵守。</p>

				        <p>&nbsp;</p>

				        <p>第一条</p>

				         <p>协议范围内，双方的关系确定为合作关系。为拓展市场更好地、更规范地服务消费者，根据公司的规划，甲方根据乙方的申请和对乙方的经营能力的审核，同意乙方加入 帮您养车网 为甲方客户提供安装服务网络。同意乙方在<input id="txt_province" class="province" type="text" value="<%= protocol.getProvince() %>" readonly="readonly">省<input id="txt_city" class="city" type="text" value="<%= protocol.getCity() %>" readonly="readonly">市<input id="txt_place" type="text" value="<%= protocol.getPlace() %>" readonly="readonly">处为第三方提供安装服务/安装单(见附件)。</p>
				        <p>&nbsp;</p>

				        <p>第二条</p>

				        <p>
				            订立本协议的目的在于确保甲、乙双方忠实履行本协议规定的双方的职责和权利。乙方作为单独的企业法人或者经营者进行经济活动。因此，乙方必须遵守对所有企业法人或者经营者共同的法律要求，特别是有关资格的规则以及社会的，财务的商业要求。作为一个企业法人或经营者，乙方应就其活动自负一切风险和从合法经营中获利。乙方向消费者提供的任何产品，必须确保产品质量，并对消费者提供的产品承担全部责任风险。乙方不是甲方的代理人，也不是甲方的雇员和合伙人。乙方不是作为甲方委托代表，乙方无权以甲方的名义签订协议使甲方在任何方面对第三方承担责任，或由甲方负担费用，承担任何义务。订立本协议并未授予乙方任何约束甲方和甲方有关企业之权利，甲方对本协议任何条款有最终的解释权。</p>

				        <p>&nbsp;</p>

				        <p>第三条</p>

				        <p>本协议有效期从<i><%= protocol.getStart() %>
				        </i>至<i><%= protocol.getEnd() %></i>，由签约日计。除非本协议提前终止，合同期满后若甲、乙双方均未提出解除合同的要求，可视为双方同意续签，并延续本合作协议的相互约束力。</p>

				        <p>&nbsp;</p>

				        <p>第四条</p>

				        <p>
				            甲方为使乙方所辖区域更好运营，提升客流量，保证服务质量符合标准，将会合理定价，最大限度保证乙方的供应。在本协议期间，甲方承诺，积极协助承担市场物流、组织功能，乙方按甲方要求确保产品的适时安装和服务质量，并承担提供安装服务时、安装结果的一切风险和责任。</p>

				        <p>&nbsp;</p>

				        <p>第五条</p>

				        <p>
				            1、乙方只能使用甲方提供、指定的产品或者第三方消费者提供的产品为第三方提供安装服务。乙方在合作期间不得替换甲方提供的任何产品或者客户提供的其它任何产品。在双方合作关系确定期间若乙方违反该协议规定，造成任何损失将由乙方承担全部责任。</p>

				        <p>2、乙方不得在第三方消费者不知情的情况下，提供其他任何有偿产品和服务。如提供，必须提前明示产品和服务的内容、目的及收费信息。</p>

				        <p>3、如乙方提供其他产品，应征得甲方或第三方的确认，必须保证提供合格产品和服务质量，并且对所提供的产品和服务质量承担全部责任，甲方不承担因安装非甲方指定的产品所导致的任何风险和责任。</p>

				        <p>&nbsp;</p>

				        <p>第六条</p>

				        <p>
				            甲方需承担货物调配、安装服务等产生的相关费用的义务。乙方需要积极配合接收甲方提供到店的安装服务信息并对安装服务尽到妥善管理，积极联系消费者尽早安装的义务。乙方有权拒收或者要求甲方更换不适合第三方消费者安装的服务产品。乙方有义务检查第三方消费者所带的产品是否有损伤，并协调第三方消费者提出退货要求的义务。</p>

				        <p>&nbsp;</p>

				        <p>&nbsp;</p>

				        <p>流程详情：</p>

				        <p>1．预约；</p>

				        <p>a、与客户确定安装时间和地点；</p>

				        <p>b、甲方将“购物清单”及所需服务项目提前配送至门店；</p>

				        <p>c、门店根据上述单据，在车主预约到店的时间前准备服务人员和必要的安装工具。</p>

				        <p>&nbsp;</p>

				        <p>2．安装与代收款：</p>

				        <p>a．车主在所预约的安装服务时间内到达所预约的店面；</p>

				        <p>b．店家安装(店家必须提供合格的安装服务，安装完毕后店家必须让车主进行驾车测试)。店家让车主签字确认“检测及安装单”，并填写好店家应确认内容；</p>

				        <p>c、特殊情况下如甲方需要乙方在完成安装代收货款，店面负责向客户收取货款，按照约定时间后续汇款给甲方。</p>

				        <p>d、完成安装服务后的7个工作日之内第三方消费者若对本次服务有投诉，乙方有义务免费为第三方消费者协调满意或者重新服务。</p>

				        <p>&nbsp;</p>

				        <p>结算标准：</p>

				        <p>乙方根据网购客户的专有购物清单为客户提供安装服务,甲方通过网购客户的安装服务评价、及乙方提供的客户安装凭证底单核销客户购物清单的确认，同意对乙方支付安装费用，具体结算金额按照本协议附件执行；</p>

				        <p>&nbsp;</p>

				        <p>付款方式</p>

				        <p>乙方完成指定安装服务项目之后，甲方将在10个工作日之内，将费用回款至乙方提供指定的银行帐号或者支付宝账号；</p>

				        <p>乙方结算指定帐户帐号为： </p>

				        <p>开户行：<input id="txt_bank" type="text" readonly="readonly" value="<%= protocol.getBank() %>"></p>

				        <p>&nbsp;</p>

				        <p>账号：<input id="txt_account" type="text" readonly="readonly" value="<%= protocol.getAccount() %>"></p>

				        <p>&nbsp;</p>

                            <p>账户名：<input id="txt_account_name" readonly="readonly" type="text" value="<%= protocol.getAccount_name() %>"></p>

				        <p>&nbsp;</p>

				        <p>支付宝账号：<input id="txt_alipay" type="text" readonly="readonly" value="<%= protocol.getAlipay() %>"></p>

				        <p>&nbsp;</p>

				        <p></p>第七条、双方责任：</p>
				        <p>甲方责任：</p>

				        <p>甲方负责向乙方提供当地区域的网购客户或（会员），并保证客户资料信息的真实有效！ </p>

				        <p>甲方负责网购客户姓名、电话，安装产品、服务类型的确认；</p>

				        <p>甲方负责网购客户所参加的促销活动、和促销物品（赠品）、以及促销时间的确认；</p>

				        <p>甲方有义务在第三方消费者确认安装服务之后，在约定时间内，将服务费用打款给乙方。</p>

				        <p>乙方责任：</p>

				        <p>乙方负责对甲方提供（介绍）客户进行信息核实、登记；</p>

				        <p>乙方负责对甲方提供（介绍）的安装客户进行服务安装；</p>

				        <p>乙方需接受甲方的监督服务的评价、乙方有责任将收集、反馈有关市场、消费、安装服务以及投诉建议信息给甲方。乙方服务区域对客户增值部份的销售、服务、以及馈赠等促销活动，将由乙方自行负责；</p>

				        <p>
				            乙方在指定区域内将设专业人员负责，服务之前有义务当面先检查第三方消费者所带的产品是否完好及适合第三方消费者车辆安装，按专业内容进行操作，如果由乙方安装造成第三方消费者所购买的产品破损、因安装造成其他方面的破损，而带来的损失由乙方自己承担；；</p>

				        <p>因乙方提供不合格产品或服务致使第三方损失的，由乙方自行承担全部责任包括但不限于赔偿、退款等；</p>

				        <p>乙方完成服务后，由消费者驾车检测，7个工作日之内第三方消费者若对服务有投诉，乙方有义务免费为第三方消费者协调满意或者重新服务。</p>

				        <p>乙方任何新增/更换网点，需事先以书面形式通知甲方，经甲方书面许可后方可实施。</p>

				        <p>乙方严格执行甲方的价格管理政策，当网购客户所带商品指定安装，乙方不得以任何方式、理由销售、报价、打折、等有损合作意向的举动；。</p>

				        <p>乙方之名称、地址、主要股东或负责人变更时，应于变更之日起七天内以书面形式通知甲方，并提供具有法律效应的相关证明文件，以便双方变更本合约。</p>

				        <p>未经双方协商同意，乙方不得将本托管协议部分或全部转给第三方，由此造成的任何经济损失，由乙方负责，甲方不负责其造成的任何相关连带责任。</p>

				        <p>本合约一式二份，甲、乙方各一份。如有未尽事宜，双方协商，可另行签订补充协议，补充协议一经签署与本合约具有同等效力；</p>

				        <p>&nbsp;</p>

				        <p>&nbsp;</p>

				        <p><span>甲方：上海邦车电子商务有限公司</span>乙方：<input id="txt_second2" type="text" readonly="readonly" value="<%= protocol.getSecond_party() %>"></p>

				        <p>&nbsp;</p>

                            <p><span>代表：</span>代表：<input id="txt_linkman" type="text" readonly="readonly" value="<%= protocol.getLinkman() %>"></p>

				        <p>&nbsp;</p>

				        <p><span>联系地址：</span>联系地址：<input id="txt_p_address" type="text" readonly="readonly" value="<%= protocol.getAddress() %>"></p>

				        <p>&nbsp;</p>

				        <p><span>联系电话：</span>联系电话：<input id="txt_p_tel" type="text" readonly="readonly" value="<%= protocol.getTel() %>"></p>

				        <p>&nbsp;</p>

				        <p><span>专职负责人员：</span>业务负责人：<input id="txt_person_in_charge" type="text" readonly="readonly" value="<%= protocol.getPerson_in_charge() %>"></p>

				        <p>&nbsp;</p>

				        <p><span>签章：</span>签章：</p>

				        <p>&nbsp;</p>

				        <img id="seal" src="/images/seal.png" alt="">
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>

</body>
<script type="text/javascript">
function addShopCommodity(){
	$('.tire_commodity_list').prepend($('#add_list').html());
}
function deletelist(obj,ssid,spid){
		var uri = "<%=ctx%>/former/deleteshopmanage?sid=" + ssid + "&sp_id=" + spid;
		$.ajax({
			url: uri,
			type: "post",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.success == "0"){
					sAlert("删除成功！");
					$(obj).parent().parent().remove();
				};
				if(ret.success == "1"){
					$(obj).parent().parent().remove();
				};
			},
			error: function(XMLRequest, textInfo){
				if(textInfo != null){
					sAlert(textInfo);
				}
			}
		});
}
function aboutChange(obj,name){
	var titlename = ["shopmanage","shopedit", "protocol1"];
	for(var i = 0;i < $('.leftNavi a').length;i ++){
		$('.leftNavi a')[i].className = "";
		$('.leftNavi a')[i].parentNode.className = "title_unselect_div";
	}
	obj.className = "title_select";
	obj.parentNode.className = "title_select_div";
	for(var i = 0;i < titlename.length;i ++){
		if(name.id == titlename[i]){
			$(name).show();
		}else{
			$('#' + titlename[i]).hide();
		}
	}
	if(name.id == "shopedit"){
		$('.foot')[0].style["margin-top"] = "300px";
	}else{
		$('.foot')[0].style["margin-top"] = "0px";
	}
}
function editshopcommodity(){
	if($('.tire_commodity_list div').length > 0){
		for(var i = 0;i < $('.tire_commodity_list select#selectclass').length;i ++){
			if($('.tire_commodity_list select#selectclass')[i].value.length == 0){
				sAlert("您还有服务类别没有选择，或者您可以删除空白服务类别列");
				return false;
			}
		}
		for(var i = 0;i < $('.tire_commodity_list select#selectproject').length;i ++){
			if($('.tire_commodity_list select#selectproject')[i].value.length == 0){
				sAlert("您还有服务项目没有选择，或者您可以删除空白服务项目列");
				return false;
			}
		}
		for(var i = 0;i < $('.tire_commodity_list select#selectproduct').length;i ++){
			if($('.tire_commodity_list select#selectproduct')[i].value.length == 0){
				sAlert("您还有服务产品没有选择，或者您可以删除空白服务产品列");
				return false;
			}
		}
	}
	var set_spid = "";
	var set_commodity = "";
	for(var i = 0;i < $('.tire_commodity_list select#selectproduct').length;i ++){
		set_spid = set_spid + $('.tire_commodity_list select#selectproduct')[i].value + ",";
	}
	var uri = "<%=ctx%>/former/saveshopmanage?set_spid=" + set_spid ;
	$.ajax({
		url: uri,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.success == "0"){
				sAlert("门店商品管理成功！");
			}else{
				sAlert("请重试，可能该记录已存在！");
			}
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				sAlert(textInfo);
			}
		}
	});
}
$('.pub-btn-middle-orange').bind('click', function() {
	var uri = "<%=ctx%>/former/editbinisuess.do";
	var supplier_name = $('input[name="supplier_name"]').val();
	if(supplier_name==''){
		sAlert("请输入店铺名称!");
		return false;
	}
	var cmobile = $('input[name="cmobile"]').val();
	if(cmobile==''){
		sAlert("请输入业务联系电话!");
		return false;
	}
	var address = $('input[name="address"]').val();
	if(address==''){
		sAlert("请输入店铺地址!");
		return false;
	}else{
		$('#province').val(document.getElementById("J_province").options[document.getElementById("J_province").selectedIndex].innerHTML);
		$('#city').val(document.getElementById("J_city").options[document.getElementById("J_city").selectedIndex].innerHTML);
		$('#city_id').val($('#J_city').val());
		// $('#county').val(document.getElementById("J_area").options[document.getElementById("J_area").selectedIndex].innerHTML);
	}
    var meter = $('input[name="meter"]').val();
    if(meter == ''){
        sAlert("请输入门店面积!");
        return false;
    }
    if(isNaN(meter)){
        sAlert("请正确输入门店面积!");
        return false;
    }
    var people = $('input[name="people"]').val();
    if(people == ''){
        sAlert("请输入门店员工人数!");
        return false;
    }
    if(isNaN(people)){
        sAlert("请正确输入门店员工人数!");
        return false;
    }else{
        if(!/^[0-9]*$/.test(people)){
            sAlert("请正确输入门店员工人数!");
            return false;
        }
    }
    var years = $('input[name="years"]').val();
    if(years == ''){
        sAlert("请输入门店营业年限!");
        return false;
    }
    if(isNaN(years)){
        sAlert("请正确输入门店营业年限!");
        return false;
    }

	$.ajax({
		url: uri,
		type: "post",
		dataType: "JSON",
		data:jQuery("#editform").serialize(),
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.success == "0"){
				// sAlert("商户信息编辑成功！");
				// window.location.reload();
                sAlert3("商户信息编辑成功！",window.location.href);
			}
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
});
function uploadUserInfo1(fileIds,which){
	document.getElementById("J_img").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("J_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "serviceshop_image"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("J_img").value = data.imgName;
					$('#J_logo').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#J_logo').children('img').show();
					// $('#J_upload_sp_logo').hide();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return sAlert('Failed to upload logo!');
		}
	});
}
function uploadUserInfo2(fileIds,which){
	document.getElementById("J_identity").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("J_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "serviceshop_image"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("J_identity").value = data.imgName;
					$('#biz_identity_img').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#biz_identity_img').children('img').show();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return alert('Failed to upload logo!');
		}
	});
}
function uploadUserInfo3(fileIds,which){
	document.getElementById("filep1").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("dp_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "shop_thumbnail_picture"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("filep1").value = data.imgName;
					$('#sp_detail1').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#biz_identity_img').children('img').show();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return alert('Failed to upload logo!');
		}
	});
}
function uploadUserInfo4(fileIds,which){
	document.getElementById("filep2").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("dp_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "shop_thumbnail_picture"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("filep2").value = data.imgName;
					$('#sp_detail2').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#biz_identity_img').children('img').show();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return alert('Failed to upload logo!');
		}
	});
}
function uploadUserInfo5(fileIds,which){
	document.getElementById("filep3").value = document.getElementById(fileIds).value;

	var imgPath = $("#" + fileIds).val();  
    if (imgPath == "") {  
        sAlert("请选择上传图片！");  
        return;  
    } 
	var imagepath = document.getElementById("dp_path").value;
	var filename = document.getElementById(fileIds).value;
	if (which.files[0].size > 2097152) {
		sAlert("请上传不大于2M的图片！");
		return;
	}
	$.ajaxFileUpload({
		url: "<%=ctx%>/common/uploadPics.do",
		secureuri: false,
		fileElementId: fileIds,
		dataType: 'json',
		data: {filePath: imagepath, fileName: filename,picType: "shop_thumbnail_picture"},
		success: function (data, status) {
			if (typeof (data.success) != 'undefined') {
				if (data.success == true) {
					document.getElementById("filep3").value = data.imgName;
					$('#sp_detail3').children('img').attr('src', "<%=ctx%>/common/displayPic?imagePath=" + data.imgPath + "&imageName=" + data.imgName);
					// $('#biz_identity_img').children('img').show();
				} else {
					sAlert(data.message);
				}
			} else {
				return sAlert('Failed to upload logo!');
			}
		},
		error: function (data, status, e) {
			return alert('Failed to upload logo!');
		}
	});
}
$('#J_province').change(function(){
	var province = this.options[this.selectedIndex].innerHTML;
	province = encodeURI(encodeURI(province));

	$.ajax({
		url: "<%=ctx%>/former/getcitybyprovince.do?province=" + province,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('#J_city').html(ret.html);
			// $('#J_area').html(ret.html2);
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
});
// $('#J_city').change(function(){
// 	var city = this.options[this.selectedIndex].innerHTML;
// 	city = encodeURI(encodeURI(city));

// 	$.ajax({
// 		url: "<%=ctx%>/browser/getcountybycity.do?city=" + city,
// 		type: "post",
// 		dataType: "JSON",
// 		async: false,
// 		timeout: 3000,
// 		success: function(ret){
// 			$('#J_area').html(ret.html);
// 		},
// 		error: function(XMLRequest, textInfo){
// 			if(textInfo != null){
// 				alert(textInfo);
// 			}
// 		}
// 	});
// });
function setprojectinfo(obj){
    var getclassid = $(obj).val();
    if(getclassid.length == 0){

        return false;
    }
    $.ajax({
        url: "<%=ctx%>/former/getprojectbyclassid.do?sc_id=" + getclassid,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
        	$($(obj).parent().children()[3]).html(ret.html);
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
function setproductinfo(obj){
	var getprojectid = $(obj).val();
	if(getprojectid.length == 0){
        // if($(obj).parent().children()[3].id == "s2id_selectproject"){
        //     $($(obj).parent().children()[3]).hide();
        //     $(obj).parent().children()[4].className = "";
        //     $($(obj).parent().children()[4]).html("");
        //     $($(obj).parent().children()[4]).select2();
        //     $(".select2-drop.select2-display-none.select2-with-searchbox").hide();
        // }else{
        //     $($(obj).parent().children()[3]).html("");
        // }

        return false;
    }
    $.ajax({
        url: "<%=ctx%>/former/getproductbyprojectid.do?sp_id=" + getprojectid,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
        	$($(obj).parent().children()[5]).html(ret.html);
            // if($(obj).parent().children()[3].id == "s2id_selectproject"){
            //     $($(obj).parent().children()[3]).hide();
            //     $(obj).parent().children()[4].className = "";
            //     $($(obj).parent().children()[4]).html(ret.option);
            //     $($(obj).parent().children()[4]).select2();
            //     $(".select2-drop.select2-display-none.select2-with-searchbox").hide();
            // }else{
            //     $($(obj).parent().children()[3]).html(ret.option);
            //     $($(obj).parent().children()[3]).select2();
            //     $(".select2-drop.select2-display-none.select2-with-searchbox").hide();
            // }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}
$(document).ready(function() {
    // for(var i = 0;i < $("select#selectproduct").length - 1;i ++){
    //     $($("select#selectproduct")[i]).select2();
    // }
    //$("#selectformat").select2();
    // $(".select2-drop.select2-display-none.select2-with-searchbox").hide();
    // document.onmousedown=function(){
    //     $("#select2-drop").hide();
    //     $("#select2-drop-mask").hide();
    //     $("#s2id_selectformat")[0].className = "select2-container";    
    //     };
    var $protocols = document.getElementById("protocol1").getElementsByTagName("input");

    for (var i = 0; i < $protocols.length; i++) {
    	if ($protocols[i].value === "null") {
    		$protocols[i].value = "";
    	}
    }
});
</script>
</html>