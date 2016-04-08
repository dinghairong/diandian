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
	ServiceProduct product = (ServiceProduct)request.getAttribute("product_info");
	DetailPictureDao detailPictureDao = (DetailPictureDao)SpringUtils.getBean(DetailPictureDao.class);
	CommentDao commentDao = (CommentDao)SpringUtils.getBean(CommentDao.class);
	OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);

	List<DetailPicture> picture_list = detailPictureDao.findDetailPictureByTypeAndObjectid(1,product.getId());
	List<DetailPicture> picture_listD = detailPictureDao.findDetailPictureByTypeAndObjectid(2,product.getId());
	// List<Comment> comment_list = commentDao.findCommentByProduct(product.getId());
	List<Comment> comment_list = product.getComments();
	List<Order> order_list = product.getOrders();

	SmartProperties smartProp = SmartProperties.getInstance();
	DecimalFormat df=new DecimalFormat("######0.00");
	DateFormat d_f=new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat d_f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String imgPath = smartProp.getImgPath();
	int pagenum = 0;
	
	
	User user = (User) session.getAttribute("user");

	Company company = (Company) session.getAttribute("company");
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
	
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－安装改装</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/product.css">
	<link rel="stylesheet" href="<%=ctx%>/css/shop_detail.css">
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
		<input type="hidden" id="islogin" value="<%=islogin%>">

		<div id="bodySection" style="overflow: hidden;">
			<div id="Product">
				<div class="bread_navi">
					<span style="font-size:14px;">当前位置： <a href=""><%=product.getServiceProject().getServiceClass().getName()%></a>
				</div>

				<div id="product_left">
					<div id="product_detail">
						<div class="product_images" style="box-sizing: unset;">
							<%if(null != product.getIcon() && product.getIcon().length() > 0){%>
							<img class="bigImage" src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + product.getPath()%>&imageName=<%=product.getIcon()%>">
							<%}else{%>
							<img class="bigImage" src="<%=ctx%>/img/hx_default.png">
							<%}%>							
							<div class="smaillIMage">
								<div class="images">
									<%
									if(picture_list.size() > 0){
										for(int i = 0;i < picture_list.size();i ++){
											if(picture_list.get(i).getStatus() == 1 && picture_list.get(i).getThumbnail() == 1){
												if(i == 0){
									%>
									<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + picture_list.get(i).getPath()%>&imageName=<%=picture_list.get(i).getImage()%>" class="selected">
									<%
												}else{
									%>
									<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + picture_list.get(i).getPath()%>&imageName=<%=picture_list.get(i).getImage()%>">
									<%
												}
											}
										}
									}
									%>
									<!-- <img src="<%=ctx%>/img/6.png" class="selected">
									<img src="<%=ctx%>/img/7.png">
									<img src="<%=ctx%>/img/6.png">
									<img src="<%=ctx%>/img/7.png"> -->

								</div>
							</div>
						</div>
						<div class="proudct_info">
							<h2 class="DisplayName"><%=product.getTitle()%></h2>
							<div class="properties">
								<ul>
									<li>
										<span>摘要：<%=product.getAbstract_()%></span>
									</li>
									<li>
										<span>所需配件：<%=product.getAccessory()%></span>
									</li>
									<li>
										<span>描述：<%=product.getDescription()%></span>
									</li>
								</ul>
							</div>
							<div class="proudct_price">
								<dl class="proudct_price1">
									<dt class="hx-price">市场价：</dt>
									<dd class="price">
										<span>¥ <%=df.format(product.getOldprice())%></span>
									</dd>
								</dl>
								<dl class="proudct_price2">
									<dt class="hx-price">体验价：</dt>
									<dd class="price">
										<strong>¥ <%=df.format(product.getNewprice())%></strong>
									</dd>
								</dl>
							</div>
							<div class="proudct_service_time">
								<span class="hx-price"> 服务时间：</span>
								<span class="service_time">
									<strong>大约<%=product.getDuration()%>分钟</strong>
								</span>
							</div>
							<div class="proudct_service">
								<span>服务支持：</span>
								<div>
									<label class="icon1">免费安装</label>
									<label class="icon2">装完付款</label>
									<label class="icon3">正规发票</label>
								</div>
							</div>
							<div class="proudct_number">
								<span>购买数量：</span>
								<div>
									<span class="quantityBox">
										<span>-</span>
										<input type="text" autocomplete="off" maxlength="4" value="1" name="commoditynum" id="commoditynum">
										<span>+</span>
									</span>
								</div>
							</div>
							<div class="proudct_paid">
								<a class="buynow"style="margin-top: 26px;border-radius: 6px;" href="javascript:void(0)" onclick="addtocart(<%=product.getId()%>)">加入服务车</a>
							</div>
						</div>
					</div>
					<div id="product_introduce">
						<div class="desc_navi">
							<span class="selected">服务介绍</span>
							<span>
								用户评价
							</span>
						</div>
						<div class="properties">
							<span class="product_title">
								服务项目：
								<span>
									<a href="javascript:void(0)" style="color:#959595;"><%=product.getTitle()%></a>
								</span>
							</span>
							<ul>
								<li>
									<span>详情：<%=product.getDescription()%></span>
								</li>
								<li>
									<span>所需配件：<%=product.getAccessory()%></span>
								</li>
								<li>
									<span>备注：<%=product.getAbstract_()%></span>
								</li>
							</ul>
						</div>
						<div class="description">
							<%
							if(picture_listD.size() > 0){
								for(int i = 0;i < picture_listD.size();i ++){
									if(picture_listD.get(i).getStatus() == 0 && picture_listD.get(i).getThumbnail() == 0){
							%>
							<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + picture_listD.get(i).getPath()%>&imageName=<%=picture_listD.get(i).getImage()%>">
							<%
									}
								}
							}
							%>
						</div>
						<div class="ys_all">
					        <div class="ys_top">
					            <div class="ys_top_cont">
					                我们的优势&nbsp;>
					            </div>
					        </div>
					        <ul class="ys_tabcd" id="ys_tabcd">
					            <li class="current"><img src="<%=ctx%>/images/ys_ptbz.png"/><p>平台保障</p></li>
					            <li><img src="<%=ctx%>/images/ys_anf.png"/><p>安心付</p></li>
					            <li><img src="<%=ctx%>/images/ys_zymd.png"/><p>专业门店</p></li>
					            <li><img src="<%=ctx%>/images/ys_shwq.png"/><p>售后维权</p></li>
					            <li><img src="<%=ctx%>/images/ys_hfw.png"/><p>好服务</p></li>
					        </ul>

					        <div class="ys_contall">
					            <div class="ys_cont" id="ys_cont">
					                <div class="ys_cont_cont">
					                    <p class="ys_cont_contp">甄选<font style="color: #e3001b;">优质产品</font></p>
					                    <p class="ys_cont_contps">帮您养车网承诺所有配件均来自厂家正规渠道，品牌证明齐全，保障完美品质。</p>
					                    <div class="ys_huihuang">
					                        <p>国际大牌</p>
					                        <p class="ys_huihuangp">原厂正品</p>
					                    </div>
					                    <div class="yscc_cont">
					                        <div class="yscc_cont_cont">
					                            <p>国际品牌销售资质</p>
					                            <span>帮您养车网与厂家直接合作，拥有众多国际品牌的销售资质。</span>
					                        </div>
					                        <div class="yscc_cont_conts">
					                            <p>各大品牌全力支持</p>
					                            <span>帮您养车网的上线也获得了各大品牌的全力支持。</span>
					                        </div>
					                        <img src="<%=ctx%>/images/ys_xszz.png" class="ys_xszz"/>
					                        <img src="<%=ctx%>/images/ys_ppzc.png" class="ys_ppzc"/>
					                    </div>
					                </div>

					                <div class="ys_cont_cont">
					                    <p class="ys_cont_contp">交易放心<font style="color: #e3001b;">100%</font></p>
					                    <p class="ys_cont_contps">为保证消费者放心安全的消费服务，帮您养车网特推出服务满意后再付款的担保交易。</p>
					                    <div class="ys_huihuang">
					                        <p>安心支付</p>
					                        <p class="ys_huihuangp">品质保证</p>
					                    </div>
					                    <div class="yscc_cont">
					                        <ul>
					                            <li>
					                                <img src="<%=ctx%>/images/ys_zpbz.png"/>
					                                <p>正品保障</p>
					                                <p class="yscc_cont_ps">AUTHENTIC GUARANTEE</p>
					                                <p class="yscc_cont_pss">帮您养车网的会员在享受平台服务项目时，若证实被使用假冒配件，立即假一赔十。</p>
					                            </li>
					                            <li>
					                                <img src="<%=ctx%>/images/ys_xxfw.png"/>
					                                <p>先行服务</p>
					                                <p class="yscc_cont_ps">THE SERVICE FIRST</p>
					                                <p class="yscc_cont_pss">为保证消费者放心安全的消费服务，帮您养车网特推出服务满意后再付款的担保交易。</p>
					                                <div class="yscc_cont_xz"></div>
					                                <div class="yscc_cont_xy"></div>
					                            </li>
					                            <li>
					                                <img src="<%=ctx%>/images/ys_jstk.png"/>
					                                <p>急速退款</p>
					                                <p class="yscc_cont_ps">A RAPID REFUND</p>
					                                <p class="yscc_cont_pss">当消费者遇到线下服务过程发生由服务方引起的服务纠纷，核实后即刻急速退款。</p>
					                            </li>
					                        </ul>
					                    </div>
					                </div>

					                <div class="ys_cont_cont">
					                    <p class="ys_cont_contp"><font style="color: #e3001b;">专业</font>门店</p>
					                    <p class="ys_cont_contps">与帮您养车网合作的汽修门店，均拥有专业技师团队，为您提供专业、放心的服务</p>
					                    <div class="ys_huihuangs">
					                        <p>全国上万家门店</p>
					                        <p class="ys_huihuangp">先服务后付款</p>
					                    </div>
					                    <div class="yscc_conts">
					                        <ul class="yscc_contsul">
					                            <li>
					                                <div class="yscc_contsli_img"><img src="<%=ctx%>/images/ys_zprz.png"/></div>
					                                <div class="yscc_conts_right">
					                                    <p>正品认证</p>
					                                    <span>所有合约商户均具备厂家授权文件或其他证明配件的正品来源渠道凭证</span>
					                                </div>
					                            </li>
					                            <li>
					                                <div class="yscc_contsli_img"><img src="<%=ctx%>/images/ys_zzrz.png"/></div>
					                                <div class="yscc_conts_right">
					                                    <p>资质认证</p>
					                                    <span>所有合约商户均取得机动车服务许可证，且三证齐全</span>
					                                </div>
					                            </li>
					                            <li>
					                                <div class="yscc_contsli_img"><img src="<%=ctx%>/images/ys_xmrz.png"/></div>
					                                <div class="yscc_conts_right">
					                                    <p>项目认证</p>
					                                    <span>所有合约商户均拥有专业的技师团队，保证施工设备、施工场地符合规定</span>
					                                </div>
					                            </li>
					                            <li>
					                                <div class="yscc_contsli_img"><img src="<%=ctx%>/images/ys_hjrz.png"/></div>
					                                <div class="yscc_conts_right">
					                                    <p>环境认证</p>
					                                    <span>所有门店的营业面积、休息厅、休息厅休闲娱乐项目与线上描述一致</span>
					                                </div>
					                            </li>
					                        </ul>

					                        <div class="ys_zymd_mdst">
					                            <img src="<%=ctx%>/images/ys_stdimg.jpg"/>
					                            <img src="<%=ctx%>/images/ys_stdimg.jpg"/>
					                            <img src="<%=ctx%>/images/ys_stdimg.jpg"/>
					                        </div>
					                    </div>
					                </div>

					                <div class="ys_cont_cont">
					                    <p class="ys_cont_contp">质量问题<font style="color: #e3001b;">协助解决</font></p>
					                    <p class="ys_cont_contps">当您对购买的服务项目存在疑义或者您在使用过程中遇到了困难，您都可以在第一时间拨打帮你养车网服务热线400-665-8027，我们将竭尽全力为您解决问题。</p>
					                    <div class="ys_huihuang">
					                        <p>专诚贴心</p>
					                        <p class="ys_huihuangp">完美服务</p>
					                    </div>
					                    <img src="<%=ctx%>/images/ys_zlwtxzjeimg.png" class="ys_zlwtxzjeimg"/>
					                </div>

					                <div class="ys_cont_cont">
					                    <p class="ys_cont_contp">极致<font style="color: #e3001b;">服务</font></p>
					                    <p class="ys_cont_contps">线上快捷购买，线下专业施工，给你提供提供独一无二的消费体验。</p>
					                    <div class="ys_huihuang">
					                        <p>安心支付</p>
					                        <p class="ys_huihuangp">品质保证</p>
					                    </div>
					                    <img src="<%=ctx%>/images/ys_jzfw.png" class="ys_zlwtxzjeimg"/>
					                </div>
					            </div>
					        </div>
					    </div>
					    <%if(comment_list.size() <= 0){%>
					    <div id="hash_comments" class="comments">
							<div class="has_border">
								<div class="comment_statistics">
									<span class="c_num">
										<span class="c_num_left">
											<span class="num" style="font-size: 14px; font-family: ''微软雅黑">暂无评论</span>
											<span class="c_num_line">
												<span class="line" style="left: -50px;">
													<b style="width: 0%"></b>
												</span>
												<span class="c_s_num" style="left: -50px;">
													本商品
													<span>0</span>
													人购买
													<span>0</span>
													人评价
												</span>
											</span>
										</span>
									</span>
									<span class="c_btn">
										<input class="comment_btn" type="button" value="我要评论" onclick="userlogin()">
										<%if(null != user){%>
										<a href="<%=ctx%>/WaitingComment.jsp" id="gotousercenter"></a>
										<%}
										if(null != company){
										%>
										<a href="<%=ctx%>/corder.jsp" id="gotousercenter"></a>
										<%}%>
									</span>
								</div>
							</div>
						</div>
					    <%}else{
					    int total = 0;
					    for(int i = 0;i < comment_list.size();i ++){
					    	total = total + comment_list.get(i).getStar();
						}
						total = total / comment_list.size();
					    %>					    					    
						<div id="hash_comments" class="comments">
							<div class="has_border">
								<div class="comment_statistics">
									<span class="c_num">
										<span class="c_num_left">
											<span class="num"><%=total%>/5</span>
											<span class="c_num_line">
												<span class="line" style="left: 145px;">
													<b style="width: 100%"></b>
												</span>
												<span class="c_s_num" style="left: 145px;">
													本服务
													<span><%=order_list.size()%></span>
													人购买
													<span><%=comment_list.size()%></span>
													人评价
												</span>
											</span>
										</span>	
									</span>
									<span class="c_btn">
										<input id="pinglun" class="comment_btn" type="button" value="我要评论" onclick="userlogin()">
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
							<div class="comment_detail">
								<div class="comment_items">
									<%
									int num = 10;
									if(comment_list.size() < 10){
										num = comment_list.size();
									}
									for(int i = 0;i < num;i ++){
									%>
									<div class="comment_item">
										<div class="comment_user_info">
											<div class="userheadimage">
												<img src="<%=ctx%>/img/9.png">
											</div>
											<span class="comment_tel" style="word-wrap: break-word;"><%=comment_list.get(i).getUser().getPhone().substring(0,3) + "xxxx" + comment_list.get(i).getUser().getPhone().substring(8,11)%></span>
											<span class="comment_name">帮你养车网会员</span>
										</div>
										<div class="comment_context">
											<span class="arrow-s-r" style="display:none"></span>
											<span class="small" style="display:none">晒</span>
											<span class="comment_arrow"></span>
											<div class="comment_top">
												<span class="gray">购买时间：</span>
												<span class="date"><%=d_f.format(comment_list.get(i).getCreatedTime())%></span>
												<a href="javascript:void(0)" target="_blank"><%=product.getServiceProject().getServiceClass().getName()%></a>
												<i>@</i>
												<a href="javascript:void(0)" target="_blank"><%=comment_list.get(i).getServiceShop().getTitle()%></a>
												<span class="comment_percent_area">
													<span class="comment_percent">
														<b style="width: <%= comment_list.get(i).getStar() / 5 * 100%>%;"></b>
													</span>
													5.0
												</span>
											</div>
											
											<div class="comment_title">
												<span>标题：</span>
												<p><%=comment_list.get(i).getTitle()%></p>
											</div>
											<div class="comment_cc">
												<span>内容：</span>
												<p class="p_hei"><%=comment_list.get(i).getContent()%></p>
											</div>
											<span class="comment_date"><%=d_f2.format(comment_list.get(i).getUpdateTime())%></span>
											<span class="comment_action" >
												&nbsp;
											</span>
										</div>
									</div>
									<%}%>
									<!-- <div class="comment_item">
										<div class="comment_user_info">
											<div class="userheadimage">
												<img src="<%=ctx%>/img/9.png">
											</div>
											<span class="comment_tel" style="word-wrap: break-word;">18251854027</span>
											<span class="comment_name">帮你养车网会员</span>
										</div>
										<div class="comment_context">
											<span class="arrow-s-r" ></span>
											<span class="small">晒</span>
											<span class="comment_arrow"></span>
											<div class="comment_top">
												<span class="gray">购买时间：</span>
												<span class="date">2015-05-05</span>
												<a href="#" target="_blank">轮胎安装</a>
												<i>@</i>
												<a href="#" target="_blank">南京胜太路xxxx</a>
												<span class="comment_percent_area">
													<span class="comment_percent">
														<b style="width: <%= 5 / 5 * 100%>%;"></b>
													</span>
													5.0
												</span>
											</div>
											
											<div class="comment_title">
												<span>标题：</span>
												<p>xxxxxxxxx</p>
											</div>
											<div class="comment_cc">
												<span>内容：</span>
												<p class="p_hei">xxxxxxxxxxxxxx</p>
											</div>
											<span class="comment_date">2015-05-08 13:30:00</span>
											<span class="comment_action" >
												&nbsp;
											</span>
										</div>
									</div> -->
								</div>
								<div class="pager">
									<%
										if(pagenum > 1){
									%>
									<a class="disabled first-child" onclick="changepage(this.innerHTML,this)">上一页</a>
									<%
										if(pagenum > 10){
											for(int i = 0;i < 8;i ++){
												if(i == 0){
									%>
												<a class="current" onclick="changepage(this.innerHTML,this)">1</a>
									<%
												}else{
									%>
												<a href="javascript:void(0)" onclick="changepage(this.innerHTML,this)"><%=i + 1%></a>
									<%
												}
											}
									%>
											<span>...</span>
											<a href="javascript:void(0)" onclick="changepage(this.innerHTML,this)"><%=pagenum - 1%></a>
											<a href="javascript:void(0)" onclick="changepage(this.innerHTML,this)"><%=pagenum%></a>
									<%
										}else{
											for(int i = 0;i < pagenum;i ++){
												if(i == 0){
									%>
												<a class="current" onclick="changepage(this.innerHTML,this)">1</a>
									<%
												}else{
									%>
												<a href="javascript:void(0)" onclick="changepage(this.innerHTML,this)"><%=i + 1%></a>
									<%
												}
											}
										}
									%>
									<a class="last-child" href="javascript:void(0)" onclick="changepage(this.innerHTML,this)">下一页</a>
									<%
										}else{
									%>
									<a class="disabled first-child">上一页</a>
									<a class="current">1</a>
									<a class="disabled last-child" href="javascript:void(0)">下一页</a>
									<%
										}
									%>
								</div>
							</div>
						</div>
						<%}%>
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
	$($('.daohang_wenzi')[0]).attr("style","color:#007fcc");
	$('.lunbo').hide();
});
function showdetailimage(){
	var num = $('.smaillIMage .images img').length;
	for(var i = 0;i < num;i ++){
		$($('.smaillIMage .images img')[i]).mouseenter(function(){
			var str = this.src;
			$('.bigImage').attr("src",str);
			for(var j = 0;j < num;j ++){
				if($('.smaillIMage .images img')[j].className == "selected"){
					$('.smaillIMage .images img')[j].className = "";
				}
			}
			this.className = "selected";
		});
	}
}
$($('.quantityBox span')[0]).click(function(){
	var num = Number($('#commoditynum').val());
	if(num > 1){
		num = num - 1;
	}
	if(num < 0){
		num = 2;
	}
	sum = Number($('#total_num').val());
	if(num > sum){
		sAlert("你所填写的数量超过库存");
		num = 2;
	}

	$('#commoditynum').val(num);
});
$($('.quantityBox span')[1]).click(function(){
	var num = Number($('#commoditynum').val());
	num = num + 1;

	if(num < 0){
		num = 2;
	}
	sum = Number($('#total_num').val());
	if(num > sum){
		sAlert("你所填写的数量超过库存");
		num = 2;
	}

	$('#commoditynum').val(num);
});
$('#commoditynum').keyup(function(){
	var num = this.value;
	if(num.length > 0){
		if(isNaN(num)){
			this.value = 1;
			return false;
		}
		if(parseInt(num) != num){
			this.value = 1;
			return false;
		}
		num = Number(num);
		if(num <= 0){
			this.value = 1;
		}
		sum = Number($('#total_num').val());
		if(num > sum){
			sAlert("你所填写的数量超过库存");
			this.value = 1;
		}
	}
});
$('.desc_navi span').click(function(){
	for(var i = 0;i < $('.desc_navi span').length;i ++){	
		if($('.desc_navi span')[i] == this){
			if(i == 0){
				$('#product_introduce .properties').show();
				$('.description').show();
				$('.ys_all').show();
			}
			if(i == 1){
				$('#product_introduce .properties').hide();
				$('.description').hide();
				$('.ys_all').hide();
			}
		}
		if($('.desc_navi span')[i].className == "selected"){
			$('.desc_navi span')[i].className = "";
		}
	}
	this.className = "selected";
});

$(document).ready(function($){
    $("#ys_tabcd").tabso({
        cntSelect:"#ys_cont",
        tabEvent:"mouseenter",
        tabStyle:"fade"
    });
    showdetailimage();
});


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

function addtocart(id){
	var num = $("#commoditynum").val();
	$.ajax({
		url: "<%=request.getContextPath()%>/former/addtocart.do?number="+ num +"&sp_id=" + id,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.addtocart == true){
				sAlert("成功添加到服务车");
			}	
			if(ret.addtocart == false){
				sAlert("该服务已经在服务车中了");
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