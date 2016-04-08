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
	ServiceProductDao serviceProductDao = (ServiceProductDao)SpringUtils.getBean(ServiceProductDao.class);
	SmartProperties smartProp = SmartProperties.getInstance();

	int get_by_product = 0;
	List<ServiceProduct> product_list = (List<ServiceProduct>)request.getAttribute("service_product");
	Integer total = (Integer)request.getAttribute("total_product");
	if(product_list == null){
		get_by_product = 33;
		product_list = serviceProductDao.findServiceProductByProgectIdAndNum(33,9,0);
		total = serviceProductDao.findServiceProductByProgectIdAndNum(33,0,0).size();
	}else{
		get_by_product = (Integer)request.getAttribute("get_by_product_id");
	}
	int pagenum = 0;
	pagenum = total / 10;
	if(total % 10 != 0){
		pagenum = pagenum + 1;
	}

	DecimalFormat df=new DecimalFormat("######0.00");
	String imgPath = smartProp.getImgPath();

	String searchbyfuzzy = (String)request.getAttribute("searchbyfuzzy");
	if(searchbyfuzzy == null){
		searchbyfuzzy = "1";
	}
	String fuzzystring = (String)request.getAttribute("fuzzystring");
	if(fuzzystring == null){
		fuzzystring = "";
	}
	Integer product_order = (Integer)request.getAttribute("orderby");
	if(null == product_order){
		product_order = 1;
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－快修保养</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/conserve.css">
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
        $(function() {
            $(".kxbyulAll").flexslider({
                animation: "slide",
                animationLoop: false,
                itemWidth: 220,
                directionNav: true,
                controlNav: false,
                minItems: 4,
                maxItems: 4
            });
        });
        var ctx = "<%=ctx%>";
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>

<style type="text/css">
	div.lafttitle_line2 {
		border-top: 1px #F9F9F9 solid;
		margin: 5px 0 0 0;
	}
	div.lafttitle_select, div.lafttitle_unselect, div.lafttitle_name {
		text-align: left;
		padding-left: 17px;
	}
	div.lafttitle_select a, div.lafttitle_unselect a {
		font-size: 0.95em;
	}
	div.lafttitle {
		text-align: left; 
		background-color: #ffffff;
		margin: 0 8px 0 0;
	}
	div.lafttitle_name {
		background-color: #2F3437;
	}
	div.lafttitle_name a {

	}
	div#ListLeft {

	}
</style>

	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />

		<div class="kxby" style="display:none">
	        <div class="kxby_top">
	            <span>快修保养服务套餐</span>
	        </div>
	        <div class="kxbyulAll">
	            <ul id="kxbyul" class="slides">
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器1</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器2</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器3</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器4</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器5</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器6</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器7</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器8</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器9</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器10</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="kxba_lunboimg">
	                            <img src="<%=ctx%>/images/kxba_lunbo.png"/>
	                        </div>

	                        <p>更换空气滤清器11</p>
	                        <span>空气滤清器</span>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>		
<div style="background-color: #F5F5F5; padding-top: 10px">
		<div id="bodySection" style="overflow: hidden;">
			<!-- <div class="dotted_line"></div> -->
			<div id="ListLeft" style="width: 220px">
				<div class="leftNavi">
					<div class="lafttitle">
						<div class="lafttitle_name">
							<a href="javascript:void(0)" style="height: 36px; line-height: 36px; color: #F0F0F0; font-size: 0.9em">快修保养</a>
						</div>
						<!-- <div class="lafttitle_line1"></div> -->
						<div <%= get_by_product == 33 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=33&number=10&start=0">更换机油、机油滤清器</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 35 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=35&number=10&start=0">更换空气滤清器</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 37 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=37&number=10&start=0">更换燃油滤清器（外/内置）</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 39 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=39&number=10&start=0">更换空调滤清器</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 41 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=41&number=10&start=0">更换燃油泵总成</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 43 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=43&number=10&start=0">更换刹车片前、后</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 45 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=45&number=10&start=0">更换刹车盘</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 47 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=47&number=10&start=0">更换空刹车油/制动液</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 49 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=49&number=10&start=0">更换刹车感应线</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 51 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=51&number=10&start=0">更换防冻液</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 53 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=53&number=10&start=0">添加空调冷媒/制冷剂</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 55 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=55&number=10&start=0">更换火花塞</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 57 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=57&number=10&start=0">更换变速箱油(手动/自动)</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 59 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=59&number=10&start=0">更换转向油</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 61 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=61&number=10&start=0">清洗油路</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 63 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=63&number=10&start=0">清洗节气门(免拆/拆卸)</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 65 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=65&number=10&start=0">清洗进气管道</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 67 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=67&number=10&start=0">清洗空调管道</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 69 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=69&number=10&start=0">发动机内部清洗</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 71 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=71&number=10&start=0">发动机抗磨保护</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 73 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=73&number=10&start=0">更换信号灯(含/不含拆保险杠)</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 75 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=75&number=10&start=0">更换大灯总成</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 77 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=77&number=10&start=0">更换蓄电池</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 79 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=79&number=10&start=0">更换正时皮带套装、正时水泵</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 81 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=81&number=10&start=0">更换发动机外部皮带</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 83 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=83&number=10&start=0">更换雨刮/根</a>
						</div>
						<div class="lafttitle_line2"></div>
						<div <%= get_by_product == 85 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" %>>
							<a href="<%=ctx%>/former/getproduct?sp_id=85&number=10&start=0">更换减震器/避震</a>
						</div>
						<!-- <div class="lafttitle_line1"></div> -->
					</div>
				</div>
			</div>
			<div class="productsHeader" style="-webkit-box-sizing: content-box;display:none">
				<%
					int seq1 = 2;
					int seq2 = 2;
					boolean isselect2 = false;
				%>
				<div class="orderBy" style="display:none">
					排序：
					<a href="javascript:void(0)" <%= product_order == 1 ? "class='orderType selected'" : "class='orderType direction'" %> data-id="1">综合排序</a>
					<a href="javascript:void(0)" <%= product_order == 2 ? "class='orderType selected'" : "class='orderType direction'" %> style="width:80px" data-id="2">上架时间</a>
					<a href="javascript:void(0)" <%= product_order == 3 ? "class='orderType selected'" : "class='orderType direction'" %> style="width:60px" data-id="3">价格</a>
					<!-- <a href="javascript:void(0)" class="orderType direction" data-id="4">用户评分</a> -->
				</div>
				<div class="listResult">
					<span class="totalPage">
						<a class="disabled" title="上一页" href="javascript:void(0)" onclick="selectNextPage(-1,this)"><</a>
						<span>
							<b class="currentPage">1</b>
							/<%=pagenum%>
						</span>
						<%if(pagenum <= 1){%>
						<a class="disabled" title="下一页" href="javascript:void(0)">></a>
						<%}else{%>
						<a title="下一页" href="javascript:void(0)" onclick="selectNextPage(1,this)">></a>
						<%}%>
					</span>
					<input type="hidden" id="total_page" name="total_page" value="<%=pagenum%>">
				</div>
				<div class="clear"></div>
			</div>
			<div id="ProductPage" style="float: left; margin: 0; background-color: #ffffff; border: none; width: 772px">
				<div id="Products">

					<!-- product start -->
					<%
					for(int i = 0;i < product_list.size();i ++){
						if(product_list.get(i).getStatus() != 0){
							continue;
						}
						int star1 = 0;
						for(int j = 0;j < product_list.get(i).getComments().size();j ++){
							star1 = star1 + product_list.get(i).getComments().get(j).getStar();
						}
						if(product_list.get(i).getComments().size() != 0){
							star1 = star1 / product_list.get(i).getComments().size();
						}
					%>
					<div style="height: 121px; padding: 10px 18px; border-bottom: 1px #F9F9F9 solid">
						<div style="float: left">
							<a href="<%=ctx%>/former/getproductinfo?pid=<%=product_list.get(i).getId()%>">
							<%
								if(null != product_list.get(i).getIcon() && product_list.get(i).getIcon().length() > 0){
							%>
								<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + product_list.get(i).getPath()%>&imageName=<%=product_list.get(i).getIcon()%>" style="height:99px; width: 99px;float: left">
							<%
								}else{
							%>
								<img src="<%=ctx%>/img/hx_default.png" style="height:99px; width: 99px;float: left">
							<%
							}
							%>
							</a>	
							<div style="display: inline-block; margin: 4px 0 0 10px; float: left">
								<div style="margin-bottom: 15px;"><a href="<%=ctx%>/former/getproductinfo?pid=<%=product_list.get(i).getId()%>"><span style="font-size: 0.9em; color: #333333"><%=product_list.get(i).getTitle()%></span></a></div>
								<div style="margin-bottom: 11px;"><span style="font-size: 0.7em; color: #999999"><%=product_list.get(i).getAbstract_()%></span></div>

								<%
									for(int k = 0;k < star1;k ++){
								%>
									<img src="<%=ctx%>/img/star_1.png" style="width: 12px;">
								<%
								}
									for(int o = 0;o < 5 - star1;o ++){
								%>
									<img src="<%=ctx%>/img/star_2.png" style="width: 12px;">
								<%
								}
								%>
							</div>
						</div>	
						<div style="float: right; padding: 6px 18px;">
							<div style="margin-bottom: 16px">
								<span style="font-size: 1em; color: #FF7418; margin-right: 4px"><span >￥</span><%=df.format(product_list.get(i).getNewprice())%></span>
								<!-- <span style="text-decoration: line-through; font-size: 0.7em; color: #999999">￥<span>40.00</span></span> -->
								<del style="font-size: 0.7em; color: #999999">￥<del><%=df.format(product_list.get(i).getOldprice())%></del></del>
							</div>
							<a href="javascript:void(0)" onclick="addtocart(<%=product_list.get(i).getId()%>)"><div style="width: 127px; height: 34px; line-height: 34px; color: #ffffff; font-size: 0.9em; background-color: #FF7418; text-align: center; margin-bottom: 9px">加入服务车</div></a>

							<div><span style="font-size: 0.7em; color: #999999;">本商品已有<span><%= product_list.get(i).getOrders().size()%></span>人购买</span></div>
						</div>	
					</div>	
					<%
					}
					if(product_list.size() == 0){
					%>
					<div style="border-bottom: 1px solid #e1e1e1;">
						<span>暂时没有该项服务的产品</span>
					</div>
					<%
					}
					%>	
					<!-- product end -->

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
				<input type="hidden" id="searchbyfuzzy" value="<%=searchbyfuzzy%>">
				<input type="hidden" id="fuzzystring" value="<%=fuzzystring%>">
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
	$($('.daohang_wenzi')[1]).attr("style","color:#007fcc");
});
var page_html1 = "<a class='first-child' onclick='changepage(this.innerHTML,this)'><</a><a onclick='changepage(this.innerHTML,this)'>1</a><a  onclick='changepage(this.innerHTML,this)'>2</a><span>...</span><a onclick='changepage(this.innerHTML,this)'>6</a><a onclick='changepage(this.innerHTML,this)'>7</a><a class='current' onclick='changepage(this.innerHTML,this)'>8</a><a onclick='changepage(this.innerHTML,this)'>9</a><a onclick='changepage(this.innerHTML,this)'>10</a><span>...</span><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 1%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum%></a><a class='last-child' href='javascript:void(0)' onclick='changepage(this.innerHTML,this)'>></a>";
var page_html2 = "<a class='first-child' onclick='changepage(this.innerHTML,this)'><</a><a onclick='changepage(this.innerHTML,this)'>1</a><a  onclick='changepage(this.innerHTML,this)'>2</a><span>...</span><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 7%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 6%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 5%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 4%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 3%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 2%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 1%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum%></a><a class='last-child' href='javascript:void(0)' onclick='changepage(this.innerHTML,this)'>></a>";
var page_html3 = "<a class='first-child' onclick='changepage(this.innerHTML,this)'><</a><a onclick='changepage(this.innerHTML,this)'>1</a><a  onclick='changepage(this.innerHTML,this)'>2</a><a onclick='changepage(this.innerHTML,this)'>3</a><a onclick='changepage(this.innerHTML,this)'>4</a><a onclick='changepage(this.innerHTML,this)'>5</a><a onclick='changepage(this.innerHTML,this)'>6</a><a onclick='changepage(this.innerHTML,this)'>7</a><a onclick='changepage(this.innerHTML,this)'>8</a><span>...</span><a onclick='changepage(this.innerHTML,this)'><%=pagenum - 1%></a><a onclick='changepage(this.innerHTML,this)'><%=pagenum%></a><a class='last-child' href='javascript:void(0)' onclick='changepage(this.innerHTML,this)'>></a>";

function addtocart(id){
	$.ajax({
		url: "<%=request.getContextPath()%>/former/addtocart.do?number=1&sp_id=" + id,
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
function selectNextPage(num,obj){
	var now_page = Number($('.currentPage').html());
	var totalnum = Number($('#total_page').val());
	var show_page = now_page + num;
	var startnum = 0;
	var page_num = $('.pager a').length;
	var sp_id = <%=get_by_product%>;
	var orderby = 0;
	for(var i = 0;i < $('.orderBy a').length;i ++){
		if($('.orderBy a')[i].className == "orderType selected"){
			orderby = $($('.orderBy a')[i]).data().id;
		}
	}

	if((show_page > totalnum) || (show_page < 1)){
		return;
	}
	if(obj.className == "disabled"){
		return;
	}

	if(show_page == totalnum){	
		$('.totalPage a')[0].className = "";
		if(page_num > 3){
			$('.pager a')[page_num - 1].className = "disabled first-child";
			$('.pager a')[0].className = "first-child";
		}
	}
	if(show_page == 1){
		$('.totalPage a')[1].className = "";
		if(page_num > 3){
			$('.pager a')[0].className = "disabled first-child";
			$('.pager a')[page_num - 1].className = "last-child";
		}
	}
	obj.className = "disabled";
	if(show_page != 1){
		startnum = (show_page - 1) * 15;
	}
	$('.currentPage').html(show_page);
	if(show_page < totalnum && show_page != 1){
		$('.totalPage a')[0].className = "";
		$('.totalPage a')[1].className = "";
		if(page_num > 3){
			$('.pager a')[0].className = "first-child";
		}
	}
	for(var i = 1;i <= page_num - 2;i ++){
		var show_num = Number($('.pager a')[i].innerHTML);
		if($('.pager a')[i].className == "current"){
			$('.pager a')[i].className = "";
		}
		if(show_num == show_page){
			$('.pager a')[i].className = "current";
		}
	}
	if(show_page <= totalnum && show_page != 1){
		if(page_num > 3){
			$('.pager a')[0].className = "first-child";
		}
	}
	for(var i = 1;i <= page_num - 2;i ++){
		var show_num = Number($('.pager a')[i].innerHTML);
		if($('.pager a')[i].className == "current"){
			$('.pager a')[i].className = "";
		}
		if(show_num == show_page){
			$('.pager a')[i].className = "current";
		}
	}

	//修改页数显示
	if(totalnum > 10){
		if(show_page > 7){
			if(show_page + 7 <= totalnum){
				$('.pager').html(page_html1);
			}else{
				$('.pager').html(page_html2);
			}
		}else{
			$('.pager').html(page_html3);
		}
		var haspage = false;
		for(var k = 1;k < $('.pager a').length;k ++){
			if(show_page == $('.pager a')[k].innerHTML){
				$('.pager a')[k].className = "current";
				haspage = true;
				break;
			}
			if(!haspage){
				if($('.pager span').length == 2){
					$('.pager a')[3].innerHTML = show_page - 2;
					$('.pager a')[4].innerHTML = show_page - 1;
					$('.pager a')[5].innerHTML = show_page;
					$('.pager a')[6].innerHTML = show_page + 1;
					$('.pager a')[7].innerHTML = show_page + 2;
				}
			}
		}

		if(show_page == totalnum){	
			$('.pager a')[page_num - 1].className = "disabled first-child";
			$('.pager a')[0].className = "first-child";
		}
		if(show_page == 1){
			$('.pager a')[0].className = "disabled first-child";
			$('.pager a')[page_num - 1].className = "first-child";
		}
	}

	var byfuzzy = $('input[id="searchbyfuzzy"]').val();
	var fuzzystring = $('#fuzzystring').val();
	var uri = "<%=ctx%>/former/getproductbypage?sp_id=" + sp_id + "&number=9&start=" + startnum;
	if(orderby > 0){
		uri = uri + "&orderby=" + orderby;
	}
	if(byfuzzy == "0"){
		uri = uri + "&searchbyfuzzy=1&fuzzystring=" + fuzzystring;
	}
	$.ajax({
		url: uri,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('#Products table').html(ret.html);
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}

function changepage(shownum,obj){
	var totalnum = Number($('#total_page').val());
	var addnum  = 0;
	var oldpage = 0;
	var newpage = 0;
	var page_num = $('.pager a').length;
	var startnum = 0;
	var orderby = 0;
	var sp_id = <%=get_by_product%>;

	for(var i = 0;i < $('.orderBy a').length;i ++){
		if($('.orderBy a')[i].className == "orderType selected"){
			orderby = $($('.orderBy a')[i]).data().id;
		}
	}
	if(page_num > 3){
		for(var i = 1;i <= page_num - 2;i ++){
			if($('.pager a')[i].className == "current"){
				$('.pager a')[i].className = "";
				oldpage = Number($('.pager a')[i].innerHTML);
				break;
			}
		}
	}
	if(shownum == "上一页"){
		addnum = -1;
	}
	if(shownum == "下一页"){
		addnum = 1;

	}
	if(addnum != 0){
		newpage = oldpage + addnum;
	}else{
		newpage = Number(shownum);
	}
	if(newpage == totalnum){	
		$('.totalPage a')[0].className = "";
		$('.totalPage a')[1].className = "disabled";
		if(page_num > 3){
			$('.pager a')[page_num - 1].className = "disabled first-child";
			$('.pager a')[0].className = "first-child";
		}
	}
	if(newpage == 1){
		$('.totalPage a')[0].className = "disabled";
		$('.totalPage a')[1].className = "";
		if(page_num > 3){
			$('.pager a')[0].className = "disabled first-child";
			$('.pager a')[page_num - 1].className = "first-child";
		}
	}
	$('.currentPage').html(newpage);
	if(newpage < totalnum && newpage != 1){
		$('.totalPage a')[0].className = "";
		$('.totalPage a')[1].className = "";
		if(page_num > 3){
			$('.pager a')[0].className = "first-child";
		}
	}
	if(addnum != 0){
		for(var i = 1;i <= page_num - 2;i ++){
			var show_num = Number($('.pager a')[i].innerHTML);
			if(show_num == newpage){
				$('.pager a')[i].className = "current";
			}
		}
	}else{
		obj.className = "current";
	}
	if(newpage != 1){
		startnum = (newpage - 1) * 9;
	}

	//修改页数显示
	if(totalnum > 10){
		if(newpage > 7){
			if(newpage + 7 <= totalnum){
				$('.pager').html(page_html1);
			}else{
				$('.pager').html(page_html2);
			}
		}else{
			$('.pager').html(page_html3);
		}
		var haspage = false;
		for(var k = 1;k < $('.pager a').length;k ++){
			if(newpage == $('.pager a')[k].innerHTML){
				$('.pager a')[k].className = "current";
				haspage = true;
				break;
			}
			if(!haspage){
				if($('.pager span').length == 2){
					$('.pager a')[3].innerHTML = newpage - 2;
					$('.pager a')[4].innerHTML = newpage - 1;
					$('.pager a')[5].innerHTML = newpage;
					$('.pager a')[6].innerHTML = newpage + 1;
					$('.pager a')[7].innerHTML = newpage + 2;
				}
			}
		}

		if(newpage == totalnum){	
			$('.pager a')[page_num - 1].className = "disabled first-child";
			$('.pager a')[0].className = "first-child";
		}
		if(newpage == 1){
			$('.pager a')[0].className = "disabled first-child";
			$('.pager a')[page_num - 1].className = "first-child";
		}
	}

	var byfuzzy = $('input[id="searchbyfuzzy"]').val();
	var fuzzystring = $('#fuzzystring').val();
	var uri = "<%=ctx%>/former/getproductbypage?sp_id=" + sp_id + "&number=9&start=" + startnum;
	if(orderby > 0){
		uri = uri + "&orderby=" + orderby;
	}
	if(byfuzzy == "0"){
		uri = uri + "&searchbyfuzzy=1&fuzzystring=" + fuzzystring;
	}
	$.ajax({
		url: uri,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('#Products table').html(ret.html);
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
}

$('.orderBy a').click(function(){
	var byfuzzy = $('input[id="searchbyfuzzy"]').val();
	var fuzzystring = $('#fuzzystring').val();
	var uri = "<%=ctx%>/former/getproductbyorder.do?sp_id=" + "<%=get_by_product%>&number=9&start=0";
	if(byfuzzy == "0"){
		uri = uri + "&searchbyfuzzy=1&fuzzystring=" + fuzzystring;
	}

	if(this.className.indexOf('selected') > -1){
		return false;
	}else{
		for(var i = 0;i < $('.orderBy a').length;i ++){
			$('.orderBy a')[i].className = "orderType direction";
		}
		this.className = "orderType selected";
		uri = uri + "&orderby=" + $(this).data().id;
	}

	this.href = uri;
});
</script>
</html>