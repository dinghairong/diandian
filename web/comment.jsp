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
	if(user == null && company == null){
		response.sendRedirect(ctx + "/logout.jsp");
		return;
	}
	OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
	String serialnumber = (String)request.getAttribute("serialnumber");
	Integer sp_id = (Integer)request.getAttribute("sp_id");
	Order commentorder = null;
	if(null != user){
		commentorder = orderDao.findOrderBySerialnumberAndProductAndUser(serialnumber, sp_id, user.getId());
	}
	if(null != company){
		commentorder = orderDao.findOrderBySerialnumberAndProductAndCompany(serialnumber, sp_id, company.getId());
	}
	SmartProperties smartProp = SmartProperties.getInstance();
	String imgPath = smartProp.getImgPath();
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－评价服务</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/comment.css">
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

		<div id="bodySection" style="overflow: hidden;" class="uc_content">
			<div class="siteNavi">
				<a href="">首页</a>
				<span class="s1"> ></span>
				<span>评价服务</span>
			</div>
			<div id="content">
				<div class="line top-line clearfix rate-item">
					<h3 class="top-line-title " style="margin: 0;">
						<span class="page-title">评价服务</span>
					</h3>
					<ul class="header-nav">					
						<li class="header-nav-item">
							服务门店：<a target="_blank" href=""><%=commentorder.getServiceShop().getTitle()%></a>
						</li>
						
						<li class="header-nav-item">
							<span class="rate-tips" href="#">
								<span class="rate-tips-btn">
									评价须知<i class="arrow-down"></i>
								</span>
								<div class="rate-tips-dropdown">
									<iframe class="rate-tips-dropdown-shim" frameborder="0" onscroll="0" src="about:blank" data-spm-act-id="a1z0b.2.0.i1.zHyPx1">
										<html>
										<head></head>
										<body></body>
										</html>
									</iframe>
									<div class="rate-tips-content">
										<h3>评价须知(2009-2-15开始实行)</h3>
										<p> 请您根据本次交易，给予真实、客观、仔细地评价。您的评价将是其他会员的参考，也将影响卖家的信用。</p>
										<p>
										<strong>累积信用计分规则：</strong>
										中评不计分，但会影响卖家的好评率，请慎重给予。 每个自然月中，相同买家和卖家之间的信用评价计分不超过6分。 评价后30天内，您有一次机会删除给对方的中评或差评，或者修改成好评。
										</p>
										<p>
										<strong>动态店铺评分计分规则：</strong>
										店铺评分是匿名的。 每个自然月中，相同买家和卖家之间的店铺评分计分次数不超过3次。 店铺评分成功后无法修改。
										</p>
									</div>
								</div>
							</span>
						</li>
					</ul>
				</div>
				<div class="line rate">
					<div class="itemlist">							
						<fieldset>
							<ul class="rate-list">
								<li class="rate-box rate-box-last">
									<div class="item-rate-info" style="box-sizing: unset;-webkit-box-sizing: content-box;">
										<div class="item-detail">
											<a class="item-d-img" target="_blank" style="box-sizing: unset;" href="">
												<%if(null != commentorder.getServiceProduct().getIcon() && commentorder.getServiceProduct().getIcon().length() > 0){%>
												<img  src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + commentorder.getServiceProduct().getPath()%>&imageName=<%=commentorder.getServiceProduct().getIcon()%>" style="width: 130px;height: 130px">
												<%}else{%>
												<img src="<%=ctx%>/img/hx_default.png" style="width: 130px;height: 130px">
												<%}%>
											</a>
											<div class="item-title">
												<a title="" target="_blank" href=""><%=commentorder.getServiceProduct().getTitle()%></a>
											</div>
										</div>
									</div>
									<div class="item-rate-main">
										<div class="rate-msg-box">
											<div class="bd">
												<div class="textinput">
													 <form id="comment_form">
	                            						<input type="hidden" name="oid" value="<%=commentorder.getId()%>">
	                            						<input type="hidden" id="star" name="star" value="">                      
	                        
														<span style="color: #aaa;float: left; margin: 10px 0;">标题：</span>
														<input id="set_title" type="text" name="set_title">
														<!-- <span class="ph-label">这家店的服务怎么样？写点感受吧，亲！</span> -->
														<textarea class="rate-msg" maxlength="500" name="set_content" id="set_content" onfocus="if(this.value == '这家店的服务怎么样？写点感受吧，亲！'){this.value = '';this.style.color = '#333'}" onblur="if(this.value == ''){this.value = '这家店的服务怎么样？写点感受吧，亲！';this.style.color = '#b0b0b0'}">这家店的服务怎么样？写点感受吧，亲！</textarea>
														<div class="text-counter" style="display: none;">
															<strong class="r-t-counter">500</strong>
															字
														</div>
													</form>
												</div>
											</div>											
											<ul class="stars">
												<li>
													<label>服务评价</label>
													<span class="rate-stars" data-type="description" style="position: absolute; left: -9999px;">
														<label>
															<input type="radio" name="description" value="1" title="很不满意，差得太离谱，与卖家描述的严重不符，非常不满">
															一星
														</label>
														<label>
															<input type="radio" name="description" value="2" title="不满意，部分有破损，与卖家描述的不符，不满意">
															二星
														</label>
														<label>
															<input type="radio" name="description" value="3" title="一般，质量一般，没有卖家描述的那么好">
															三星
														</label>
														<label>
															<input type="radio" name="description" value="4" title="满意，质量不错，与卖家描述的基本一致，还是挺满意的">
															四星
														</label>
														<label>
															<input type="radio" name="description" value="5" title="很满意，质量非常好，与卖家描述的完全一致，非常满意">
															五星
														</label>
													</span>
													<span class="ks-simplestar">
														<img src="<%=ctx%>/img/star_2.png">
														<img src="<%=ctx%>/img/star_2.png">
														<img src="<%=ctx%>/img/star_2.png">
														<img src="<%=ctx%>/img/star_2.png">
														<img src="<%=ctx%>/img/star_2.png">
													</span>
													<span class="ks-ss-tips"></span>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>															
						</fieldset>
					</div>
					<div class="submitbox">                 
						<button class="submit submit-btn" type="button" onclick="putcomment()">提交评论</button>
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
var entryclick = false;
$('.ks-simplestar img').mouseenter(function(){
	entryclick = false;
	if($(this).prevAll().length > 0){
		for(var i = 0;i < $(this).prevAll().length;i ++){
			$(this).prevAll()[i].src = "<%=ctx%>/img/star_1.png";
		}
	}
	if($(this).nextAll().length > 0){
		for(var i = 0;i < $(this).nextAll().length;i ++){
			$(this).nextAll()[i].src = "<%=ctx%>/img/star_2.png";
		}
	}
	this.src = "<%=ctx%>/img/star_1.png";
});

$('.ks-simplestar img').mouseleave(function(){
	if(!entryclick){
		if($(this).prevAll().length > 0){
			for(var i = 0;i < $(this).prevAll().length;i ++){
				$(this).prevAll()[i].src = "<%=ctx%>/img/star_2.png";
			}
		}
		this.src = "<%=ctx%>/img/star_2.png";
	}
});
$('.ks-simplestar img').click(function(){
	entryclick = true;
	if($(this).prevAll().length > 0){
		for(var i = 0;i < $(this).prevAll().length;i ++){
			$(this).prevAll()[i].src = "<%=ctx%>/img/star_1.png";
		}
	}
	this.src = "<%=ctx%>/img/star_1.png";
	var score = $(this).prevAll().size()+1;
	$("#star").val(score);

});
$('.rate-tips-btn').mouseenter(function(){
	$('.rate-tips-dropdown').show();
});
$('.rate-tips-btn').mouseleave(function(){
	$('.rate-tips-dropdown').hide();
});
$('.rate-tips-dropdown').mouseenter(function(){
	$('.rate-tips-dropdown').show();
});
$('.rate-tips-dropdown').mouseleave(function(){
	$('.rate-tips-dropdown').hide();
});

function putcomment(){
	
    
    if($("#set_title").val().length == 0){
    	sAlert1("请填写评论标题！");
    	return false;
    }
    if($("#set_content").val().length == 0){
    	sAlert1("请填写评论内容！");
    	return false;
    }
    $.ajax({
		url: "<%=request.getContextPath()%>/former/creatcomment.do",
		type: "post",
		dataType: "JSON",
		data:jQuery("#comment_form").serialize(),
		async: false,
		timeout: 3000,
		success: function(ret){
			if(ret.add == "ok"){
				sAlert3("评论成功！","<%=ctx%>/profile.jsp");
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