<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.*"%>

<%
String ctx = request.getContextPath(); 
Administrator user = (Administrator)session.getAttribute("adminUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>汽车服务后台管理</title>
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- basic styles -->

<link href="<%=ctx %>/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=ctx %>/assets/css/font-awesome.min.css" />

<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=ctx %>/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->

<link rel="stylesheet"
	href="<%=ctx %>/assets/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="<%=ctx %>/assets/css/datepicker.css" />
<link rel="stylesheet" href="<%=ctx %>/assets/css/ui.jqgrid.css" />

<!-- fonts -->

<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-fonts.css" />

<!-- ace styles -->

<link rel="stylesheet" href="<%=ctx %>/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-skins.min.css" />

<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="<%=ctx %>/assets/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<!--
		<style type="text/css">
		.divLabel{display:table-cell; text-align:right}
		.divInput{display:table-cell; text-align:left; padding-right: 10px; width: 29px;}
		.widget-content {
			border-bottom: 1px solid #cdcdcd;
			padding: 12px 15px;
		}
		.divInput select{
			width: 182px;
			padding: 5px 4px;
		}
		</style>
		-->
</head>
<body class="skin-4">
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> 汽车服务后台管理 </small> </a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <span class="user-info"> <small>欢迎,</small>
								<%=user.getName()%> - <%=user.getRole().getDisplayName() %> </span> <i
							class="icon-caret-down"></i> </a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li class="divider"></li>
							<li><a href="<%=ctx%>/admin/login.jsp"> <i
									class="icon-off"></i> 退出 </a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span> </a>

			<div class="sidebar" id="sidebar" style="margin-top: 50px;">
				<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts" style="display: none">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/orderMgmt.jsp">
								<i class="icon-edit"></i>
								<span class="menu-text"> 订单管理 </span>
							</a>
						</li>
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> 门店管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/jxsgl.jsp">
										<i class="icon-double-angle-right"></i>
										门店列表
									</a>
								</li>
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/jxssh.jsp">
										<i class="icon-double-angle-right"></i>
										门店审核
									</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> 用户管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/companyMgmt.jsp">
										<i class="icon-double-angle-right"></i>
										企业账号管理
									</a>
								</li>
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/userMgt.jsp">
										<i class="icon-double-angle-right"></i>
										消费者用户管理
									</a>
								</li>
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/adminMgmt.jsp">
										<i class="icon-double-angle-right"></i>
										系统用户管理
									</a>
								</li>
							</ul>
						</li>
						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/questions.jsp">
								<i class="icon-edit"></i>
								<span class="menu-text"> 咨询管理 </span>
							</a>
						</li>
						<li>
							<a href="#" class="dropdown-toggle"> 
								<i class="icon-list"></i> 
								<span class="menu-text"> 财务管理 </span> 
								<b class="arrow icon-angle-down"></b> 
							</a>
							<ul class="submenu">
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/overallStatistics.jsp">
										<i class="icon-double-angle-right"></i>
										<span class="menu-text"> 整体销售统计 </span> 
									</a>
								</li>
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/categoryStatistics.jsp"> 
										<i class="icon-double-angle-right"></i> 
										<span class="menu-text"> 分类销售统计 </span> 
									</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> 用户统计</span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/CompanyuserStatistics.jsp">
										<i class="icon-double-angle-right"></i>
										企业用户统计
									</a>
								</li>
								<li>
									<a class="xlink" href="#" rel="<%=ctx%>/admin/userStatistics.jsp">
										<i class="icon-double-angle-right"></i>
										普通用户统计
									</a>
								</li>
							</ul>
						</li>
						
						
						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/serviceMgt.jsp">
								<i class="icon-edit"></i>
								<span class="menu-text"> 服务产品管理 </span>
							</a>
						</li>
						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/adsMgmt.jsp">
								<i class="icon-edit"></i>
								<span class="menu-text"> 广告管理 </span>
							</a>
						</li>
						

						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/couponMgmt.jsp">
								<i class="icon-edit"></i>
								<span class="menu-text"> 优惠券规则管理 </span>
							</a>
						</li>
						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/chargeHistory.jsp">
								<i class="icon-edit"></i>
								<span class="menu-text"> 充值记录查询 </span>
							</a>
						</li>
						<li>
							<a  class="xlink" href="#" rel="<%=ctx%>/admin/notifyMgmt.jsp">
								<i class="icon-list"></i>
								<span class="menu-text"> 通知管理 </span>
							</a>
						</li>
					</ul><!-- /.nav-list -->
				<!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
			</div>

			<div class="main-content" id="dynamic-content">
				<iframe id="myFrame" name="myFrame" frameborder="0" width="100%"
					height="650" style="padding-top: 10px;" src=""></iframe>
			</div>
			<!-- /.main-content -->


		</div>
		<!-- /.main-container-inner -->

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->

	<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=ctx%>/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=ctx%>/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=ctx%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="<%=ctx%>/assets/js/bootstrap.min.js"></script>
	<script src="<%=ctx%>/assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
		  <script src="<%=ctx%>/assets/js/excanvas.min.js"></script>
		<![endif]-->

	<!-- ace scripts -->

	<script src="<%=ctx%>/assets/js/ace-elements.min.js"></script>
	<script src="<%=ctx%>/assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
			jQuery(document).ready(function(){
				
				jQuery(".xlink").click(function(e) {
					jQuery("li.active").removeClass("active");
					jQuery(this).parent().addClass("active");
            		var source = jQuery(this).attr('rel');
            		if (navigator.userAgent.indexOf("MSIE") != -1) {
            			
            		} else {
            			
            		}
            		jQuery("#dynamic-content").html('<iframe id="myFrame" name="myFrame" frameborder="0" width="100%" height="650" style="padding-top: 10px;" src="'+source+'">');
            	});
				
				jQuery(".xlink:eq(0)").trigger("click");
			});
		</script>
</body>
</html>