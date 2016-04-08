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
	User user = (User) session.getAttribute("user");
	Company company = (Company) session.getAttribute("company");
	AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
	ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
	DetailPictureDao detailPictureDao = (DetailPictureDao)SpringUtils.getBean(DetailPictureDao.class);
	ServiceProjectDao serviceProjectDao = (ServiceProjectDao)SpringUtils.getBean(ServiceProjectDao.class);

	String setcity = (String)session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		response.sendRedirect(ctx + "/index.jsp");
		return;
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}
	
	SmartProperties smartProp = SmartProperties.getInstance();
	String imgPath = smartProp.getImgPath();
	
	String islogin = "";
	if(null != user){
		islogin = "0";
	}else{
		if(null != company){
			islogin = "0";
		}else{
			islogin = "1";
		}
	}

	ServiceShop serviceshop_detail = (ServiceShop)request.getAttribute("serviceshop_detail");
	List<ServiceProject> project_list = serviceProjectDao.getAllServiceProject();
	//serviceShopDao.merge(serviceshop_detail);
	//List<Comment> comment_list = serviceshop_detail.getComments();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－服务点－－<%=serviceshop_detail.getTitle()%></title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/shop_detail.css">
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
		<input type="hidden" id="islogin" value="<%=islogin%>">

		<div id="bodySection" style="overflow: hidden;">
			<div class="container_24">
				<div class="container_24 ">
					<div class="grid_24">
						<div class="site-map">
							<a class="astyle" href="#">当前位置</a>
							<a href="#">首页</a> > <a href="#">服务门店</a> > <%=serviceshop_detail.getTitle()%>
						</div>
					</div>
				</div>
				<div class="container_24">
					<div class="grid_17">
						<div class="grid_5 shopimgs">
							<img class="imgShow" height="232" width="232" src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath+serviceshop_detail.getPath()%>&imageName=<%=serviceshop_detail.getImage()%>">
							<div class="imgPreList">
								<div class="smallimages">
									<div style="width:240px;margin-top:4px;">
										<img alt="门店图片"  height="49" width="49" src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath+serviceshop_detail.getPath()%>&imageName=<%=serviceshop_detail.getImage()%>">
										<%
										List<DetailPicture> stList = detailPictureDao.getShopThumbnails(serviceshop_detail.getId());
										for(int i = 0;i < stList.size();i ++){
										%>
										<img alt="缩略图" data-src="<%=ctx%>/common/displayPic?imagePath=<%=stList.get(i).getPath()%>&imageName=<%=stList.get(i).getImage()%>" src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath+stList.get(i).getPath()%>&imageName=<%=stList.get(i).getImage()%>" height="49" width="49">
										<%
										}
										%>
									</div>
								</div>
							</div>
						</div>
						<div class="grid_11 shopinfo">
							<div class="fonth1"> <%=serviceshop_detail.getTitle()%> </div>
							<div id="bodyform">
								<table style="width: 100%;font-size: 13px;">
									<tbody>
										<tr height="31">
											<td width="80">
												<span class="titlename">满意度：</span>
											</td>
											<td>
												<span style="width: 100px; background-color: gray">
													<span class="star-bar">
														<%
														int all_star = 0;
														int star = 0;
														int ordersize = 0;
														for(int j = 0;j < serviceshop_detail.getComments().size();j ++){
															all_star = all_star + serviceshop_detail.getComments().get(j).getStar();
														}
														if(serviceshop_detail.getComments().size() > 0){
															star = all_star / serviceshop_detail.getComments().size();
														}
														for(int j = 0;j < serviceshop_detail.getOrders().size();j ++){
															if(serviceshop_detail.getOrders().get(j).getState() >= 2 && serviceshop_detail.getOrders().get(j).getState() < 4){
																ordersize ++ ;
															}
														}
														%>
														<span class="star" title="<%=star%>颗星">
															<%
															for(int i = 0;i < star;i ++){
															%>
															<span></span>
															<%
															}
															if(5 - star > 0){
																for(int j = 0;j < 5 - star;j ++){
															%>
															<span class="disabled"></span>
															<%
																}
															}
															%>
														</span>
													</span>
												</span>
												<span style="padding-left: 10px; "><%=star%></span>
											</td>
											<td style="text-align: right;">
												<span class="title_men">已完成
													<span style="color: #d12a3e; font-family:Arial; font-weight:bold;"><%=ordersize%></span>
													个安装单
												</span>
												<span class="shuline"></span>
												<span class="tb_pinglun">
													<span><%=serviceshop_detail.getComments().size()%></span>人评价
												</span>
											</td>
										</tr>
										<tr height="41">
											<td colspan="3">
												<img src="<%=ctx%>/img/at_address.png" style="float: left;margin-left: 10px">
												<span style="line-height: 25px;font-size: 14px;">
													<%=serviceshop_detail.getAreaDetail().getCity() + serviceshop_detail.getAreaDetail().getCounty() + serviceshop_detail.getAddress()%>
												</span>
											</td>
											
										</tr>
										
										<tr height="41">
											<td>
												<span class="titlename">营业时间：</span>
											</td>
											<td class="detailcontent"><%=serviceshop_detail.getBusiness()%></td>
										</tr>
										<tr height="41">
											<td>
												<span class="titlename">门店客服：</span>
											</td>
											<td class="detailcontent">400-665-8027</td>
										</tr>
									</tbody>
								</table>
								<div id="submitbtns">
									<a id="ordershop" onclick="openphone()" href="javascript:void(0)" style="background-color: rgb(209, 42, 62);">联系门店</a>
								</div>
							</div>
						</div>
						<div class="sever_xm">
							<table>
								<tbody>
									<tr>
										<!-- <th width="130">
											<div class="tyre_bj xiangmu" style="display: block;">服务项目</div>
											<a class="tyre_buy buy" href="#" style="display: none;">
												去买服务
												<span class="arrow-s"></span>
											</a>
										</th> -->
										<th width="130">
											<div class="baoyang_bj xiangmu" style="display: block;"> 服务项目</div>
											<a class="baoyang_buy buy" href="#" style="display: none;">
												去买服务
												<span class="arrow-s"></span>
											</a>
										</th>
										<td width="680">
											<div class="mdItem">
												<span class="lun_item">
													<%
													List<String> isRepeat = new ArrayList<String>();
													if(serviceshop_detail.getServiceshopServices().size() > 0){
														for(int i = 0;i< serviceshop_detail.getServiceshopServices().size();i ++){
															isRepeat.add(serviceshop_detail.getServiceshopServices().get(i).getServiceProduct().getServiceProject().getName());
															%>
														<label class='have' style='color: rgb(51, 51, 51);'>
															<%=serviceshop_detail.getServiceshopServices().get(i).getServiceProduct().getServiceProject().getName()%>
														</label>
														<% }
													}%>
													
												</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="comments">
							<div class="commenttitle">
								<div class="divkhpj">门店评价   </div>
								<div id="commentRates">
									<%if(serviceshop_detail.getComments().size() > 0){
										double totalstar = (double)star;
									%>
									<span class="span-bar" style="width: <%=((totalstar / 5)) * 100%>px; margin-top: 4px;"></span>
									<span class="span-bar" style="width: <%= (5 - totalstar) / 5 * 100%>px;margin-left:-2px; margin-top: 4px; background-color: RGB(211,211,211);"></span>
									<span id="commentRate"><%= totalstar%>/5</span>
									<%}else{%>
									<span id="commentRate" style="color: #999999; font-size: 15px;line-height:28px;">暂无评分</span>
									<%}%>
								</div>
								<div class="Rate_ress">
									<span style="float: left;font-size: 12px; color: RGB(254, 102, 19);margin-top: 2px;"><%=serviceshop_detail.getComments().size()%>人</span>
									<span class="spanrpjc">评价</span>
									<span class="spanfbwdpl">
										<a id="publishMyView" onclick="userlogin()">我要评价</a>
										<%if(null != user){%>
										<a href="<%=ctx%>/myorder.jsp" id="gotousercenter"></a>
										<%}
										if(null != company){
										%>
										<a href="<%=ctx%>/corder.jsp" id="gotousercenter"></a>
										<%}%>
									</span>
								</div>
							</div>
							<div id="detailcomments">
								<%if(serviceshop_detail.getComments().size() == 0){%>
									<div class="theshophasntcomment">该门店暂无评价</div>
								<%}else{%>
								<ul class="commentlines">
									<%
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
									SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									for(int k = 0;k < serviceshop_detail.getComments().size();k ++){
									%>
									<li class="clearfix commentline">
										<div class="laohuuserinfo">
											<div class="laohulevel">										
												<%if(null!= serviceshop_detail.getComments().get(k).getUser() && serviceshop_detail.getComments().get(k).getUser().getIcon() != null){%>
												<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath+serviceshop_detail.getComments().get(k).getUser().getPath()%>&imageName=<%=serviceshop_detail.getComments().get(k).getUser().getIcon()%>" height="35" width="35">
												<%}else{
													if(null != serviceshop_detail.getComments().get(k).getCompany() && serviceshop_detail.getComments().get(k).getCompany().getIcon() != null){
												%>
												<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath+serviceshop_detail.getComments().get(k).getCompany().getPath()%>&imageName=<%=serviceshop_detail.getComments().get(k).getCompany().getIcon()%>" height="35" width="35">
												<%	
													}else{
												%>
												<img src="<%=ctx%>/img/hongxi_service_12.png" height="35" width="35">
												<%}}%>
											</div>
											<div class="laohuusername">
												<%
												if(null != serviceshop_detail.getComments().get(k).getUser()){
													if(serviceshop_detail.getComments().get(k).getUser().getName() != null && serviceshop_detail.getComments().get(k).getUser().getName().length() > 0){%> 
												<%=serviceshop_detail.getComments().get(k).getUser().getName()%>
												<%}else{%>
												<%=serviceshop_detail.getComments().get(k).getUser().getPhone()%>
												<%}}else{%>
												<%=serviceshop_detail.getComments().get(k).getCompany().getCompany()%>
												<%}%>
											</div>
											<div class="laohuusergrade">
												<font></font>
											</div>
										</div>
										<div class="commentdetail">
											<span class="orderdetailfather">
												<span class="orderdetail">
													<div class="publishtime" style="display:none">安装时间：</div>
													<div class="ordercartype" style="display:none">
														<a href="#">SRX-上海通用</a>
													</div>
													<span class="commentsatis">
														<ul class="commentsatisul">
															<li>
																<span class="commentsatisRate">满意度：</span>
																<%
																	double star2 = (double)serviceshop_detail.getComments().get(k).getStar();
																%>
																<span style="width: 120px">
																	<span class="span-bar" style="width: <%=((star2 / 5)) * 100%>px;margin-top: 2px;"> </span>
																	<span class="span-bar" style="width: <%= (5 - star2) / 5 * 100%>px;margin-left:-2px;margin-top: 2px;margin-right: 5px;background-color: RGB(211,211,211);"> </span>
																</span>
																<span class="commentnum">  <%=serviceshop_detail.getComments().get(k).getStar()%> </span>
															</li>
														</ul>
													</span>
												</span>
											</span>
											<div class="comment_jiao"> </div>
											<span class="commentcontent"> <%=serviceshop_detail.getComments().get(k).getContent()%> </span>
											<div class="comment_imgs" style="display:none">
												<div class="samll_imgs">
													<span>
														<img src="">
													</span>
												</div>
												<span class="big_img">
													<img src="" style="background: url("") no-repeat scroll center center rgb(245, 245, 245);">
												</span>
											</div>
											<span class="updatetimespan"> <%=formatter2.format(serviceshop_detail.getComments().get(k).getUpdateTime())%> </span>
											<span class="comment_action" style="display:none">
												<a class="comment_good_area" href="" onclick="return false">
													赞（<span>0</span>）
												</a>
												<span class="comment_reply_area">
													回复（
													<span class="reply_num">0</span>
													）
												</span>
											</span>
											<div class="comm_reply">
												<div class="comm_reply_textarea">
													<form method="POST" autocomplete="off">
														<textarea style="resize:none;" name="replyComment"></textarea>
														<input type="submit" value="回复" data-commentid="171733" data-shopid="4103">
													</form>
												</div>
											</div>
										</div>
									</li>
									<%}%>
								</ul>
								<%}%>
							</div>
						</div>
					</div>
					<div class="grid_7">
						<div id="mymap" style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
						</div>
						<div style="margin-top: 20px;display:none;">
							<a href="javascript:void(0)">
								<img height="100" width="330" src="<%=ctx%>/img/BSGSD.jpg">
							</a>
							<a href="javascript:void(0)">
								<img height="100" width="330" style="margin-top: 10px;" src="<%=ctx%>/img/HSFW.png">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="car2" style="position: fixed; z-index: 9999998; background-color: black; opacity: 0.3; right: 0px; bottom: 0px; left: 0px; top: 0px;display:none;"></div>
		<div id="loginbody" class="userinfobody loginbodyheight" style="z-index: 9999999; position: fixed; top: 60px; left: 442.5px;display:none;">
			<div class="userinfoarea">
				登录
				<div class="closebtn" onclick="closelogin()"></div>
			</div>
			<hr class="seperateline">
			<div class="loginerror">
				<img height="15" width="15" style="float: left">
				<div style="color: #007fcc;height: 15px; line-height: 15px; float: left;margin-left: 10px;">您输入的账户或密码错误，请核对后重新输入</div>
			</div>
			<div class="userinfoform loginformheight">
				<form method="post" action="<%=request.getContextPath()%>/browser/login.do" id="member_login_form" onsubmit="return validateLogin();">
					<table class="userinfotable">
						<tbody>
							<tr>
								<td>手机</td>
							</tr>
							<tr>
								<td>
									<input class="input username" type="text" name="account" id="login_name_input">
								</td>
							</tr>
							<tr>
								<td>密码</td>
							</tr>
							<tr>
								<td>
									<input class="input password" type="password" name="password" id="login_password_input">
								</td>
							</tr>
							<tr>
								<td>
									<div class="userinfosubmit login" onclick="loginHX()">立即登录</div>
								</td>
							</tr>
						</tbody>
					</table>
					<label id="loginexten" style="display:none">合作网站账号登录：</label>
					<div id="qqloginicon" onmouseout="" onmouseover="" onclick="" style="background: url("") no-repeat scroll 0px 0px transparent;display:none;"></div>
				</form>
			</div>
			<div class="pagefoot1">
				<a class="forget_psw" href="javascript:void(0)">忘记密码？</a>
				还不是帮你养车网用户？
				<div class="pagefoot2" onclick="userregist()">免费注册</div>
				<a href="<%=ctx%>/register.jsp" id="gotoregist"></a>
			</div>
		</div>
		<div id="forget1" class="userinfobody forgetbodyheight" style="z-index: 9999999; position: fixed; top: 100px; left: 470px;display:none;">
			<div class="userinfoarea">
				忘记密码
				<div class="closebtn"></div>
			</div>
			<hr class="seperateline">
			<div class="userinfoform forgetformheight">
				<form id="passwordgetter">
					<table class="userinfotable" id="userinfo1">
						<tbody>
							<tr>
								<td>手机号码</td>
							</tr>
							<tr>
								<td>
									<input id="forinput" class="input username" type="text">
								</td>
							</tr>
							<tr>
								<td>图片验证码</td>
							</tr>
							<tr>
								<td>
									<input class="input" type="text" style="float: left;width:80px;margin-right: 10px;" id="imagecode" name="imagecode">
									<span style="display:block;float:left;height:42px;margin-right: 10px;">
										<img id='imgVcode' src="<%=ctx%>/former/imagecode" />
									</span>
									
									<a href="javascript:;"onclick="document.getElementById('imgVcode').src='<%=ctx%>/former/imagecode?'+new Date()">换一张 </a>
								</td>
							</tr>
							<tr>
								<td id="upro" class="promotion"></td>
							</tr>
							<tr>
								<td>
									<div class="userinfosubmit forgot" id="getcode1" style="width: 138px; display: inline-block;" onclick="PassWordRecv()">获取验证码</div>
									<div class="forget_psw_next" id="pwd_next">下一步</div>							
								</td>
							</tr>
						</tbody>
					</table>
					<table class="userinfotable" style="display:none" id="userinfo2">
						<tbody>
							<tr>
								<td>验证码</td>
							</tr>
							<tr>
								<td>
									<input class="input" type="text" id="code">
								</td>
							</tr>
							<tr>
								<td class="promotion" id="errormsg2"></td>
							</tr>
							<tr>
								<td>
									<div class="userinfosubmit forgot" style="width: 120px; display: inline-block;" onclick="goBack()">上一步</div>
									<div class="forget_psw_next" style="background-color:#007fcc" >下一步</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="userinfotable" style="display:none" id="userinfo3">
						<tbody>
							<tr>
								<td>新密码</td>
							</tr>
							<tr>
								<td>
									<input class="input password" type="password" id="new_pwd">
								</td>
							</tr>
							<tr>
								<td>确认密码</td>
							</tr>
							<tr>
								<td>
									<input class="input password" type="password" id="check_pwd">
								</td>
							</tr>
							<tr>
								<td class="promotion" id="errormsg3"></td>
							</tr>
							<tr>
								<td>
									<div class="userinfosubmit forgot" onclick="saveChangePwd()">提交修改</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="pagefoot1">
				<div class="pagefoot2">立即登录</div>
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

var markerArr;
var map;
var province = "";
markerArr = [{title:"",point:"<%=serviceshop_detail.getLongitude()%>,<%=serviceshop_detail.getLatitude()%>",address:""}];
function map_init(){
	map = new BMap.Map("mymap");
	var px = markerArr[0].point.split(",")[0];
	var py = markerArr[0].point.split(",")[1];
	var point = new BMap.Point(px, py);
	map.centerAndZoom(point,12);
	map.enableScrollWheelZoom(true); //启用滚轮放大缩小  
    //向地图中添加缩放控件  
    var ctrlNav = new window.BMap.NavigationControl({  
        anchor: BMAP_ANCHOR_TOP_LEFT,  
        type: BMAP_NAVIGATION_CONTROL_LARGE  
    });  
    map.addControl(ctrlNav);  

    //向地图中添加缩略图控件  
    var ctrlOve = new window.BMap.OverviewMapControl({  
        anchor: BMAP_ANCHOR_BOTTOM_RIGHT,  
        isOpen: 1  
    });  
    map.addControl(ctrlOve);  

    //向地图中添加比例尺控件  
    var ctrlSca = new window.BMap.ScaleControl({  
        anchor: BMAP_ANCHOR_BOTTOM_LEFT  
    });  
    map.addControl(ctrlSca);

    var point = new Array(); //存放标注点经纬信息的数组  
    var marker = new Array(); //存放标注点对象的数组  
    var info = new Array(); //存放提示信息窗口对象的数组  
    for (var i = 0; i < markerArr.length; i++) {  
        var p0 = markerArr[i].point.split(",")[0]; //  
        var p1 = markerArr[i].point.split(",")[1]; //按照原数组的point格式将地图点坐标的经纬度分别提出来  
        point[i] = new window.BMap.Point(p0, p1); //循环生成新的地图点 

        marker[i] = new window.BMap.Marker(point[i]); //按照地图点坐标生成标记  
        map.addOverlay(marker[i]);  
        //marker[i].setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画  
        // var label = new window.BMap.Label(markerArr[i].title, { offset: new window.BMap.Size(20, -10) });  
        // marker[i].setLabel(label);  
        info[i] = new window.BMap.InfoWindow("<div style=’font-size:13px;color:#d12a3e;font-weight:bold;height: 25px; line-height: 25px;overflow: hidden;padding: 0 5px;’>" + markerArr[i].title + "</div><div style='color: #666;overflow-x: auto;overflow-y: hidden;padding: 0 5px;'>地址：" + markerArr[i].address + "</div>"); // 创建信息窗口对象  
        //marker[i].openInfoWindow(info[i]);
    }
}
//异步调用百度js  
function map_load() {  
    var load = document.createElement("script");  
    load.src = "http://api.map.baidu.com/api?v=1.4&callback=map_init";  
    document.body.appendChild(load);  
}
$(document).ready(function(){
	map_load();
});
$(".sever_xm table tr").each(function(){
	$(this).hover(function(){
		$(this).find(".have").css("color", "#04539c");
		$(this).find(".xiangmu").css("display", "none");
		$(this).find(".buy").css("display", "block");
	}, function(){
		$(this).find(".have").css("color", "#333");
		$(this).find(".xiangmu").css("display", "block");
		$(this).find(".buy").css("display", "none");
	});
});
$(".baoyang_bj").parent().parent().click(function (){
	window.open("<%=ctx%>/install.jsp");
});
function openphone(){
	<%--sAlert("请拨打客服电话：<%=serviceshop_detail.getTel()%>");--%>
	sAlert("请拨打客服电话：400-665-8027");
}


function userlogin(){
	var login = $('#islogin').val();
	if(login == "1"){
		// document.getElementById("registbody").style.display = "none";
		document.getElementById("loginbody").style.display = "";
		document.getElementById("car2").style.display = "";
	}else{
		document.getElementById("gotousercenter").click();
	}
}
function closelogin(){
	document.getElementById("loginbody").style.display = "none";
	document.getElementById("car2").style.display = "none";	
}
function userregist(){
	document.getElementById("gotoregist").click();
}
$('.forget_psw').click(function(){
	$('.userinfoform.forgetformheight').height(222);
	$('#forget1').show();
	document.getElementById("loginbody").style.display = "none";
	document.getElementById("car2").style.display = "";
});
$('.closebtn').click(function(){
	$('#forget1').hide();
	document.getElementById("car2").style.display = "none";

	$('.userinfoform.forgetformheight').height(162);
	$('#userinfo1').show();
	$('#userinfo2').hide();
	$('#userinfo3').hide();
});
$('.pagefoot2').click(function(){
	$('#forget1').hide();
	document.getElementById("loginbody").style.display = "";
});

function loginHX(){
	$.ajax({
		url: "<%=ctx%>/former/alllogin.do",
		type:"POST",
		data:$('#member_login_form').serialize(),
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.result == "0"){
				window.location.reload();
			}else {
				$('.loginerror').show();
			}
		}
	})
}
function PassWordRecv(){
	var phone = $('#forinput').val();
	var imgcode = $('#imagecode').val();
	if(phone.length == 0){
		sAlert("请输入您的手机号");
		return false;
	}else if(!/^0?1[34578]\d{9}$/.test(phone)){
		sAlert("手机号码格式错误");
		return false;
	}else if(imgcode.length == 0){
		sAlert("请输入图片验证码");
		return false;
	}else{
		$.ajax({
			url: "<%=ctx%>/former/checkpeoplephone.do?phone=" + phone + "&imagecode=" + imgcode,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.result == "ok"){
					$('.promotion').hide();
					getPwdCode(phone);
				}else {
					if(ret.errCode==1){
						$('.promotion').html('您的手机号还未注册');
						$('.promotion').show();
						return false;
					}
					if(ret.errCode == 2){
						$('.promotion').html('您的验证码输入有误');
						$('.promotion').show();
						//startTime();
						return false;
					}
				}
			}
		});
	}
}
var InterValObj; //timer变量，控制时间
var count = 90; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function SetRemainTime() {
    if (curCount == 0) {                
        window.clearInterval(InterValObj);//停止计时器
        $("#getcode1").attr("onclick","PassWordRecv()");
        $("#getcode1").html("重新发送");
        $("#getcode1")[0].style["background-color"] = "#007fcc";
    }
    else {
        curCount--;
        $("#getcode1").html(curCount + "秒后重新获取");
    }
}
function startTime(){
	curCount = count;
	$("#getcode1").attr("onclick","");
	$("#getcode1").html(curCount + "秒后重新获取");
	$("#getcode1")[0].style["background-color"] = "#999";
	InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
}
function getPwdCode(phone){
	//调用接口，发送验证码到手机
	$.ajax({
		url: "<%=ctx%>/former/sendpwdcode.do?phone=" + phone,
		type:"POST",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.result == "ok"){
				sAlert('验证码已经发送到你的手机上，请点击下一步。');
				$("#pwd_next")[0].style["background-color"] = "#007fcc";
				$('#pwd_next').click(function(){
					$('#userinfo1').hide();
					$('#userinfo2').show();
				});
			}else{
				if(ret.errCode==1){
					sAlert("发送失败，请重新点击发送。");
				}
			}
		}
	});
	startTime();
}
function goBack(){
	$('#userinfo1').show();
	$('#userinfo2').hide();
}
function saveChangePwd(){
	var new_pwd = $('#new_pwd').val();
	var check_pwd = $('#check_pwd').val();
	if(new_pwd.length == 0){
		sAlert("请输入您的新密码");
		return false;
	}
	if(new_pwd.length < 6){
		sAlert("密码位数不能少于6位!");
		return false;
	}
	if(check_pwd.length == 0){
		sAlert("请输入您的确认密码");
		return false;
	}
	if(new_pwd != check_pwd){
		$('#errormsg3').html('两次密码输入不一致，请重新输入。');
		$('#errormsg3').show();
	}else{
		$('#errormsg3').hide();
		$.ajax({
			url: "<%=ctx%>/former/savechangepwd.do?newpwd=" + new_pwd,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.result == "ok"){
					alert('密码修改成功，请登录。');

					$('#forget1').hide();
					$('#forget2').hide();

					$('.userinfoform.forgetformheight').height(162);
					$('#userinfo1').show();
					$('#userinfo2').hide();
					$('#userinfo3').hide();
				}else{
					if(ret.errCode==1){
						sAlert("修改失败，请重试");
					}
				}
			}
		});
	}
}
$($('.forget_psw_next')[1]).click(function(){
	var code = $('#code').val();
	if(code.length == 0){
		sAlert("请输入您的验证码！");
		return false;
	}else{
		$.ajax({
			url: "<%=ctx%>/former/checkpwdcode.do?smscode=" + code,
			type:"POST",
			dataType: "JSON",
			async: false,
			timeout: 3000,
			success: function(ret){
				if(ret.result == "ok"){
					$('.userinfoform.forgetformheight').height(222);
					$('#userinfo2').hide();
					$('#userinfo3').show();
					$('#errormsg2').hide();
					closelogin();
				}else {
					if(ret.errCode==1){
						$('#errormsg2').html('您输入的验证码有误，请重新输入。');
						$('#errormsg2').show();
						return false;
					}
				}
			}
		});
	}
});

$('img[alt="缩略图"],img[alt="门店图片"]').mouseover(function(){
	var oldsrc=$(this).attr("src");
	
	$(".imgShow").attr("src",oldsrc);
	

});
</script>
</html>