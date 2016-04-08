<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.*" %>
<%@ page import="com.smart4c.bean.*" %>
<%@ page import="java.util.*, com.smart4c.common.*" %>
<%
String ctx = request.getContextPath();

OrderDao oDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
Date earliestDate = oDao.getEarliestPaidOrder();
int begYear = earliestDate.getYear() + 1900;
int endYear = new Date().getYear() + 1900;
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

		<link rel="stylesheet" href="<%=ctx %>/assets/css/jquery-ui-1.10.3.full.min.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/datepicker.css" />
		
		<!-- jqplot -->
		<link rel="stylesheet" href="<%=ctx %>/assets/css/jquery.jqplot.css" />

		<!-- fonts -->

		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-fonts.css" />

		<!-- ace styles -->

		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-skins.min.css" />
		
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=ctx %>/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="<%=ctx %>/assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="<%=ctx %>/assets/js/html5shiv.js"></script>
		<script src="<%=ctx %>/assets/js/respond.min.js"></script>
		<![endif]-->
		
		<style type="text/css">
		ol,ul {list-style: outside none none;}
		*,*:before,*:after{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}
		.yearSel{height: 20px;}
		input.btn{border-top-width: 0px; border-bottom-width: 0px;}
		</style>
	</head>
	<body class="skin-4">
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li>分类销售统计</li>
							<li class="active">列表</li>
						</ul><!-- .breadcrumb -->

					</div>

					<div class="page-content" style="margin-left: 8px; padding-left: 0px; overflow: hidden;">
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header widget-header-flat widget-header-small">
									<h5>
										<i class="icon-signal"></i>
										服务年销售额统计
									</h5>
									&nbsp;&nbsp;&nbsp;
									服务类别
									<select id="tyreBrandYear" name="tyreBrandYear" class="yearSel">
										<%
										ServiceClassDao scDao = (ServiceClassDao)SpringUtils.getBean(ServiceClassDao.class);
										List<ServiceClass> classList = scDao.getAllClass();
										for (ServiceClass c : classList) {
											%>
											<option value="<%=c.getId()%>"><%=c.getName() %></option>
											<%
										}
										%>
									</select>
									&nbsp;&nbsp;&nbsp;
									起始年份
									<select id="yearBegin" name="yearBegin" class="yearSel">
									<%
									String selected = "";
									for (int i = begYear; i<=endYear; i++)  {
										if (i == endYear) {
											selected = "selected";
										}
									%>
										<option value="<%=i%>" <%=selected %>><%=i%></option>
									<%} %>
									</select>
									&nbsp;&nbsp;&nbsp;
									结束年份
									<select id="yearEnd" name="yearEnd" class="yearSel">
										<%
										selected = "";
										for (int i = begYear; i<=endYear; i++)  {
											if (i == endYear) {
												selected = "selected";
											}
										%>
										<option value="<%=i%>" <%=selected %>><%=i%></option>
										<%} %>
									</select>
									&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-info btn-sm" id="refreshYear" value="加载" style="border-top-width: 0px; border-bottom-width: 0px;">
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<div id="yearChart" style="margin-top:20px; margin-left:20px; width:80%; height:300px;">
										
										</div>
									</div><!-- /widget-main -->
								</div><!-- /widget-body -->
							</div><!-- /widget-box -->
						</div>
						
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header widget-header-flat widget-header-small">
									<h5>
										<i class="icon-signal"></i>
										服务月销售额统计
									</h5>
									&nbsp;&nbsp;&nbsp;
									轮胎品牌
									<select id="tyreBrandMonth" name="tyreBrandMonth" class="yearSel">
										<%
										for (ServiceClass c : classList) {
											%>
											<option value="<%=c.getId()%>"><%=c.getName() %></option>
											<%
										}
										%>
									</select>
									&nbsp;&nbsp;&nbsp;
									请选择年份
									<select id="yearEndMonth" name="yearEndMonth" class="yearSel">
										<%
											selected = "";
											for (int i = begYear; i<=endYear; i++)  {
												if (i == endYear) {
													selected = "selected";
												}
											%>
											<option value="<%=i%>" <%=selected %>><%=i%></option>
											<%} %>
									</select>
									&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-info btn-sm" id="refreshMonth" value="加载" style="border-top-width: 0px; border-bottom-width: 0px;">
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<div id="monthChart" style="margin-top:20px; margin-left:20px; width:80%; height:500px;">
										
										</div>
									</div><!-- /widget-main -->
								</div><!-- /widget-body -->
							</div><!-- /widget-box -->
						</div>
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header widget-header-flat widget-header-small">
									<h5>
										<i class="icon-signal"></i>
										服务次数年统计
									</h5>
									&nbsp;&nbsp;&nbsp;
									起始年份
									<select id="yearBeginServ" name="yearBeginServ" class="yearSel">
									<%
									selected = "";
									for (int i = begYear; i<=endYear; i++)  {
										if (i == endYear) {
											selected = "selected";
										}
									%>
										<option value="<%=i%>" <%=selected %>><%=i%></option>
									<%} %>
									</select>
									&nbsp;&nbsp;&nbsp;
									结束年份
									<select id="yearEndServ" name="yearEndServ" class="yearSel">
										<%
										selected = "";
										for (int i = begYear; i<=endYear; i++)  {
											if (i == endYear) {
												selected = "selected";
											}
										%>
										<option value="<%=i%>" <%=selected %>><%=i%></option>
										<%} %>
									</select>
									&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-info btn-sm" id="refreshYearServ" value="加载" style="border-top-width: 0px; border-bottom-width: 0px;">
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<div id="yearChartServ" style="margin-top:20px; margin-left:20px; width:80%; height:300px;">
										
										</div>
									</div><!-- /widget-main -->
								</div><!-- /widget-body -->
							</div><!-- /widget-box -->
						</div>
						
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header widget-header-flat widget-header-small">
									<h5>
										<i class="icon-signal"></i>
										服务次数月统计
									</h5>
									&nbsp;&nbsp;&nbsp;
									请选择年份
									<select id="yearEndMonthServ" name="yearEndMonthServ" class="yearSel">
										<%
											selected = "";
											for (int i = begYear; i<=endYear; i++)  {
												if (i == endYear) {
													selected = "selected";
												}
											%>
											<option value="<%=i%>" <%=selected %>><%=i%></option>
											<%} %>
									</select>
									&nbsp;&nbsp;&nbsp;
									<input type="button" class="btn btn-info btn-sm" id="refreshMonthServ" value="加载" style="border-top-width: 0px; border-bottom-width: 0px;">
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<div id="monthChartServ" style="margin-top:20px; margin-left:20px; width:80%; height:500px;">
										
										</div>
									</div><!-- /widget-main -->
								</div><!-- /widget-body -->
							</div><!-- /widget-box -->
						</div>
						
					</div><!-- /.page-content -->
				
				
			</div><!-- /.main-container-inner -->
			<a id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse" href="#">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=ctx %>/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		
		<script type="text/javascript" src="<%=ctx%>/assets/js/jqPlot/jquery.jqplot.js"></script>
		<script type="text/javascript" src="<%=ctx%>/assets/js/jqPlot/plugins/jqplot.barRenderer.js"></script>
		<script type="text/javascript" src="<%=ctx%>/assets/js/jqPlot/plugins/jqplot.categoryAxisRenderer.js"></script>
		<script type="text/javascript" src="<%=ctx%>/assets/js/jqPlot/plugins/jqplot.pointLabels.js"></script>
		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=ctx %>/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=ctx %>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		
		<script src="<%=ctx %>/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="<%=ctx %>/assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="<%=ctx %>/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
		<script src="<%=ctx %>/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>

		<!--[if lte IE 8]>
		  <script src="<%=ctx %>/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="<%=ctx %>/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.slimscroll.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.sparkline.min.js"></script>

		<!-- ace scripts -->

		<script src="<%=ctx %>/assets/js/ace-elements.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery.jqplot.config.enablePlugins = true;
		});
		
		jQuery("#refreshYear").on("click", function() {
			// check if end date  is after beg date
			if (parseInt(jQuery("#yearEnd").val()) < parseInt(jQuery("#yearBegin").val())) {
				alert("结束时间不能小于起始时间！");
				return;
			}
		
			// update year chart
			jQuery.ajax({
				method:"post",
				url: "<%=ctx%>/admin/getClassSalesByYear.do",
				data : {
					dateFrm:parseInt(jQuery("#yearBegin").val()),
					dateEnd:parseInt(jQuery("#yearEnd").val()),
					id:jQuery("#tyreBrandYear").val()
				},
				dataType:"JSON",
				timeout: 3000,
				success: function(data) {
					var dataValue = new Array();
	                var ticks = new Array();
	                jQuery(data).each(function (index, value) {
						dataValue.push(data[index].sales);
						ticks.push(data[index].year);
					});
	                jQuery("#yearChart").html('');
	                $.jqplot('yearChart', [dataValue], {
	                	animate: !$.jqplot.use_excanvas,
	                	seriesDefaults: {
	                		renderer: $.jqplot.BarRenderer,
	                		pointLabels: { show: true }
	                	},
	                	title: "从 " + jQuery("#yearBegin").val() + " 到 " + jQuery("#yearEnd").val() + " "
							 + jQuery("#tyreBrandYear").find("option:selected").text() + " 销售额", //标题  
	                	axes: {
	                		xaxis: {  
	                			renderer: $.jqplot.CategoryAxisRenderer,
	                			ticks: ticks
	                		},  
	                		yaxis: {
	                			pad: 1.05, // 一个相乘因子  
	                			tickOptions: { formatString: '%d'}
	                		}  
	                	}
	                });  
				},
				error: function() {
					alert("获取 " + jQuery("#tyreBrandYear").find("option:selected").text() + " 年销售额数据出错！");
				}
			});
		});
		
		jQuery("#refreshMonth").on("click", function () {
			// update month chart
			jQuery.ajax({
				method:"post",
				url: "<%=ctx%>/admin/getClassSalesByMonth.do",
					data : {
						dateFrm : parseInt(jQuery("#yearEndMonth").val()),
						id:jQuery("#tyreBrandMonth").val()
					},
					dataType : "JSON",
					timeout : 3000,
					success : function(data) {
						var dataValue = new Array();
						var ticks = new Array();
						jQuery(data).each(function(index, value) {
							dataValue.push(data[index].sales);
							ticks.push(data[index].month);
						});
						jQuery("#monthChart").html('');
						$.jqplot('monthChart', [ dataValue ], {
							animate : !$.jqplot.use_excanvas,
							seriesDefaults : {
								renderer : $.jqplot.BarRenderer,
								pointLabels : {
									show : true
								}
							},
							title : jQuery("#yearEndMonth").val() + "年 " + jQuery("#tyreBrandMonth").find("option:selected").text() + " 每个月销售额", //标题  
							axes : {
								xaxis : {
									renderer : $.jqplot.CategoryAxisRenderer,
									ticks : ticks
								},
								yaxis : {
									pad : 1.05
								// 一个相乘因子  
								}
							}
						});
					},
					error : function() {
						alert("获取 "+jQuery("#tyreBrandMonth").find("option:selected").text()+" 各月销售额数据出错！");
					}
				});
			});
		
		jQuery("#refreshYearServ").on("click", function() {
			// check if end date  is after beg date
			if (parseInt(jQuery("#yearEndServ").val()) < parseInt(jQuery("#yearBeginServ").val())) {
				alert("结束时间不能小于起始时间！");
				return;
			}
		
			// update year chart
			jQuery.ajax({
				method:"post",
				url: "<%=ctx%>/admin/serviceSalesByYear.do",
				data : {
					dateFrm:parseInt(jQuery("#yearBeginServ").val()),
					dateEnd:parseInt(jQuery("#yearEndServ").val()),
					id:jQuery("#serviceYear").val()
				},
				dataType:"JSON",
				timeout: 3000,
				success: function(data) {
					var dataValue = new Array();
	                var ticks = new Array();
	                jQuery(data).each(function (index, value) {
						dataValue.push(data[index].times);
						ticks.push(data[index].year);
					});
	                jQuery("#yearChartServ").html('');
	                $.jqplot('yearChartServ', [dataValue], {
	                	animate: !$.jqplot.use_excanvas,
	                	seriesDefaults: {
	                		renderer: $.jqplot.BarRenderer,
	                		pointLabels: { show: true }
	                	},
	                	title: "从 " + jQuery("#yearBeginServ").val() + " 到 " + jQuery("#yearEndServ").val() + " "
							 + jQuery("#serviceYear").find("option:selected").text() + " 服务次数", //标题  
	                	axes: {
	                		xaxis: {  
	                			renderer: $.jqplot.CategoryAxisRenderer,
	                			ticks: ticks
	                		},  
	                		yaxis: {
	                			pad: 1.05, // 一个相乘因子  
	                			tickOptions: { formatString: '%d'}
	                		}  
	                	}
	                });  
				},
				error: function() {
					alert("获取 " + jQuery("#serviceYear").find("option:selected").text() + " 年服务次数出错！");
				}
			});
		});
		
		jQuery("#refreshMonthServ").on("click", function () {
			// update month chart
			jQuery.ajax({
				method:"post",
				url: "<%=ctx%>/admin/serviceSalesByMonth.do",
					data : {
						dateFrm : parseInt(jQuery("#yearEndMonthServ").val()),
						id:jQuery("#serviceMonth").val()
					},
					dataType : "JSON",
					timeout : 3000,
					success : function(data) {
						var dataValue = new Array();
						var ticks = new Array();
						jQuery(data).each(function(index, value) {
							dataValue.push(data[index].times);
							ticks.push(data[index].month);
						});
						jQuery("#monthChartServ").html('');
						$.jqplot('monthChartServ', [ dataValue ], {
							animate : !$.jqplot.use_excanvas,
							seriesDefaults : {
								renderer : $.jqplot.BarRenderer,
								pointLabels : {
									show : true
								}
							},
							title : jQuery("#yearEndMonthServ").val() + "年 " + jQuery("#serviceMonth").find("option:selected").text() + " 每个月销售额", //标题  
							axes : {
								xaxis : {
									renderer : $.jqplot.CategoryAxisRenderer,
									ticks : ticks
								},
								yaxis : {
									pad : 1.05
								// 一个相乘因子  
								}
							}
						});
					},
					error : function() {
						alert("获取 "+jQuery("#serviceMonth").find("option:selected").text()+" 各月服务次数出错！");
					}
				});
			});
		</script>
	</body>
</html>