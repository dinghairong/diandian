<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.*" %>
<%@ page import="com.smart4c.bean.*" %>
<%@ page import="java.util.*,com.smart4c.common.*" %>
<%
String ctx = request.getContextPath();

AreaDetailDao adDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
List<String> provinces = adDao.getProvinces();
StringBuffer provinceBuf = new StringBuffer();
for (String prov : provinces) {
	provinceBuf.append(prov + ":" + prov);
	provinceBuf.append(";");
}
if (provinceBuf.length() > 0) {
	provinceBuf.deleteCharAt(provinceBuf.length() - 1);
}
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
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ui.jqgrid.css" />

		<!-- fonts -->

		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-fonts.css" />

		<!-- ace styles -->

		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ajaxfileupload.css" />
		
		<link rel="stylesheet" href="<%=ctx %>/assets/css/common.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/global-min.css" />
		
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
							<li>企业主账号管理</li>
							<li class="active">列表</li>
						</ul><!-- .breadcrumb -->

					</div>

					<div class="page-content" style="margin-left: 8px; padding-left: 0px; overflow: hidden;">

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<table id="grid-table"></table>

								<div id="grid-pager"></div>

								<script type="text/javascript">
									var $path_base = "/";//this will be used in gritter alerts containing images
								</script>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				

				
			</div><!-- /.main-container-inner -->

		</div><!-- /.main-container -->
		<a id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse" href="#">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=ctx %>/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=ctx%>/assets/js/ajaxfileupload.js"></script>
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

		<script src="<%=ctx %>/assets/js/jquery-ui-1.10.3.full.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.slimscroll.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="<%=ctx %>/assets/js/jquery.sparkline.min.js"></script>
		<script src="<%=ctx %>/assets/js/flot/jquery.flot.min.js"></script>
		<script src="<%=ctx %>/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="<%=ctx %>/assets/js/flot/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->

		<script src="<%=ctx %>/assets/js/ace-elements.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">

			jQuery.jgrid.ajaxOptions.type = 'post'; // fixed 中文乱码
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
			
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
					url: "<%=ctx%>/admin/companyAcctList.do",
					//data: grid_data,
					datatype: "json",
					height: 391,
					colNames:['ID','企业名称','密码','联系人','手机号码','邮箱','余额','地址','省','市','区','地址','头像','头像路径','是否有效','创建时间', '企业来源', '企业链接'],
					colModel:[
						{name:'com.id',index:'o.id',hidden:true,editable:false},
						{name:'com.company',index:'o.company',editable:true,edittype:"text",editrules:{required:true}},
						{name:'com.password',index:'o.password',hidden:true,search:false,editable:true,edittype:"password",editrules:{edithidden:true},editoptions:{maxlength:15}},
						{name:'com.contacts',index:'o.contacts',editable:true,edittype:"text",editrules:{required:true}},
						{name:'com.phone',index:'o.phone',editable:true,edittype:"text",editoptions:{readonly:true},editrules:{required:true,integer:true}},
						{name:'com.email',index:'o.email',editable:true,edittype:"text",editrules:{required:true,email:true}},
						{name:'com.balance',index:'o.balance',editable:false},
						{name:'address',index:'address',search:false,sortable:false,editable:false},
						{name:'province',index:'province',hidden:true,editable:true,edittype:"select",editoptions:{value:"<%=provinceBuf.toString()%>"},editrules:{edithidden:true}},
						{name:'city',index:'city',hidden:true,editable:true,edittype:'text',editrules:{readonly:true,required:true,edithidden:true}},
						{name:'county',index:'county',hidden:true,editable:true,edittype:'text',editrules:{readonly:true,required:true,edithidden:true}},
						{name:'com.address',index:'o.address',hidden:true,sortable:false,editable:true,edittype:"text",editrules:{required:true,edithidden:true}},
						{name:'icon',index:'icon',hidden:true,search:false,editable:true,edittype:"file",editrules:{edithidden:true}},
						{name:'iconPN',index:'iconPN',hidden:true,search:false,editable:true,edittype:"text"},
						{name:'com.status',index:'o.status',editable:true,edittype:"select",editoptions:{value:"0:是;1:否"}},
						{name:'com.creatTime',index:'com.creatTime',editable:false,search:false},
						{name:'com.third',index:'com.third',editable:false,search:false},
						{name:'com.href',index:'com.href',editable:false,search:false}
					],
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
					sortname: "o.company",
					sortorder: "asc",
					jsonReader: {
	                        root:"dataRows",                // 数据行（默认为：rows）
	                        page: "curPage",            // 当前页
	                        total: "totalPages",    // 总页数
	                        records: "totalRecords",    // 总记录数
	                        repeatitems : false                // 设置成false，在后台设置值的时候，可以乱序。且并非每个值都得设
	                },
	                prmNames:{
	                	rows:"page.pageSize",
	                	page:"page.curPageNo",
	                	sort:"page.orderBy",
	                	order:"page.order",
	                	search:"page._search",
	                	editoper:"page._edit",
	                	addoper:"page._add",
	                	deloper:"page._delete"
	                },
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: true,
					//multikey: "ctrlKey",
			        multiboxonly: true,

			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							updateActionIcons(table);
							updatePagerIcons(table);
							//enableTooltips(table); // bootstrap.min.css should be included!!
						}, 0);
					},
			
					caption: "企业主账号列表",
					autowidth: true
			
				});
			
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
								.wrap('<label class="inline" />')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
			
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: true,
						editicon : 'icon-pencil blue',
						add: true,
						addicon : 'icon-plus-sign purple',
						del: true,
						delicon : 'icon-trash red',
						search: true,
						searchicon : 'icon-search orange',
						refresh: true,
						refreshicon : 'icon-refresh green',
						view: true,
						viewicon : 'icon-zoom-in grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						width: 750,
						mtype: "POST",
						closeAfterEdit: true,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
							style_edit_form(form);
							show_icon(form);
							
							$("#tr_county td:eq(1)").addClass("ui-front");
							jQuery("#county").autocomplete({
								source: function(req,rsp,url) {
									$.ajax({
										url:"<%=ctx%>/admin/getCounties.do?province="
												+encodeURIComponent(encodeURIComponent(jQuery("#province option:selected").val()))+"&city="
												+encodeURIComponent(encodeURIComponent(jQuery("#city").val()))
												+"&term="+encodeURIComponent(encodeURIComponent(req.term)),
										dataType:"json",
										success:function(data) {
											rsp(data);
										},
										error: function() {
											alert("获取县区信息失败！");
										}
									})
								},
								minLength: 0,
								delay: 0,
								select: function(event, ui) {
									jQuery("#county").val(ui.item.label);
									return false;
								},
								focus: function(event, ui) {
									//jQuery("#fmtName").val(ui.item.label);
									return false;
								}
							});
							
							jQuery("#tr_city td:eq(1)").addClass("ui-front");
							jQuery("#city").autocomplete({
								source: function(req,rsp,url) {
									$.ajax({
										url:"<%=ctx%>/admin/getCities.do?province="
											+encodeURIComponent(encodeURIComponent(jQuery("#province option:selected").val()))
											+"&term="+encodeURIComponent(encodeURIComponent(req.term)),
										dataType:"json",
										success:function(data) {
											rsp(data);
										},
										error:function() {
											alert("获取城市信息失败！");
										}
									})
								},
								minLength: 0,
								delay: 0,
								select: function(event, ui) {
									jQuery("#city").val(ui.item.label);
									jQuery("#county").val("");
									jQuery("#county").autocomplete("search", "");
									return false;
								},
								focus: function(event, ui) {
									//jQuery("#fmtName").val(ui.item.label);
									return false;
								}
							});
							jQuery("#city").focus(function() {
								jQuery(this).autocomplete("search", "");
							});
							
							$("#province").change(function() {
								$("#city").val("");
								$("#county").val("");
								jQuery("#city").autocomplete("search", "");
							});
							
							jQuery("#county").focus(function() {
								if ($("#city").val().trim().length == 0) {
									alert("请先选择城市！");
									return;
								}
								jQuery(this).autocomplete("search", "");
							});
						},
						afterShowForm: function(form) {
							form.css("height", "455px");
						},
						serializeEditData: function(data) {
							var postdata = "";
							for (key in data) {
								if (postdata.length!=0) {
									postdata += "&";
								}
								if (key == "oper") {
									postdata += key+"="+data[key];
									continue;
								}
								if (key == "iconPN") {
									continue;
								} else if (key == "id") {
									postdata +="com.id"+"="+jQuery(grid_selector).getRowData(data[key])['com.id'];
								} else {
									postdata +=key+"="+data[key];
								}
							}
							return postdata;
						},
						onclickSubmit: function(params,postdata) {
							params.url = "<%=ctx%>/admin/updateComUser.do";
						},
						afterSubmit: function(response, postdata) {
							var data = $.parseJSON(response.responseText);
							if (data.success == true && $('#icon').val() != '') {
								$.ajaxFileUpload(
									{
										url: "<%=ctx%>/admin/uploadComAvatar.do",
										secureuri: false,
										fileElementId: 'icon',
										dataType: 'json',
										data: {id:data.id, "com.id":data.id},
										success: function (data, status) {
											if (typeof (data.success) != 'undefined') {
												if (data.success == true) {
													$(grid_selector).trigger("reloadGrid");
													return;
												} else {
													alert(data.message);
												}
											} else {
												return alert('Failed to upload logo!');
											}
										},
										error: function (data, status, e) {
											return alert('Failed to upload logo!');
										}
									}
								);
							}
							return [data.success, data.message, data.id];
						}
					},
					{
						//new record form
						width: 750,
						mtype: "POST",
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
							style_edit_form(form);
							show_icon(form);
							jQuery("tr#tr_com\\.company input:eq(0)", form).removeAttr("readonly");
							jQuery("tr#tr_com\\.phone input:eq(0)", form).removeAttr("readonly");
							
							$("#city").val("北京市");
							$("#county").val("朝阳区");
							$("#tr_county td:eq(1)").addClass("ui-front");
							jQuery("#county").autocomplete({
								source: function(req,rsp,url) {
									$.ajax({
										url:"<%=ctx%>/admin/getCounties.do?province="
												+encodeURIComponent(encodeURIComponent(jQuery("#province option:selected").val()))+"&city="
												+encodeURIComponent(encodeURIComponent(jQuery("#city").val()))
												+"&term="+encodeURIComponent(encodeURIComponent(req.term)),
										dataType:"json",
										success:function(data) {
											rsp(data);
										},
										error: function() {
											alert("获取县区信息失败！");
										}
									})
								},
								minLength: 0,
								delay: 0,
								select: function(event, ui) {
									jQuery("#county").val(ui.item.label);
									return false;
								},
								focus: function(event, ui) {
									//jQuery("#fmtName").val(ui.item.label);
									return false;
								}
							});
							
							jQuery("#tr_city td:eq(1)").addClass("ui-front");
							jQuery("#city").autocomplete({
								source: function(req,rsp,url) {
									$.ajax({
										url:"<%=ctx%>/admin/getCities.do?province="
											+encodeURIComponent(encodeURIComponent(jQuery("#province option:selected").val()))
											+"&term="+encodeURIComponent(encodeURIComponent(req.term)),
										dataType:"json",
										success:function(data) {
											rsp(data);
										},
										error:function() {
											alert("获取城市信息失败！");
										}
									})
								},
								minLength: 0,
								delay: 0,
								select: function(event, ui) {
									jQuery("#city").val(ui.item.label);
									jQuery("#county").val("");
									jQuery("#county").autocomplete("search", "");
									return false;
								},
								focus: function(event, ui) {
									//jQuery("#fmtName").val(ui.item.label);
									return false;
								}
							});
							jQuery("#city").focus(function() {
								jQuery(this).autocomplete("search", "");
							});
							
							$("#province").change(function() {
								$("#city").val("");
								$("#county").val("");
								jQuery("#city").autocomplete("search", "");
							});
							
							jQuery("#county").focus(function() {
								if ($("#city").val().trim().length == 0) {
									alert("请先选择城市！");
									return;
								}
								jQuery(this).autocomplete("search", "");
							});
						},
						afterShowForm: function(form) {
							form.css("height", "455px");
						},
						serializeEditData: function(data) {
							var postdata = "";
							for (key in data) {
								if (postdata.length!=0) {
									postdata += "&";
								}
								if (key == "oper" || key == "id") {
									postdata += key+"="+data[key];
									continue;
								}
								if (key == "iconPN") {
									continue;
								} else {
									postdata +=key+"="+data[key];
								} 
							}
							return postdata;
						},
						onclickSubmit: function(params, postdata) {
							params.url = "<%=ctx%>/admin/addComUser.do";
						},
						afterSubmit: function(response, postdata) {
							var data = $.parseJSON(response.responseText);
							if (data.success == true && $('#icon').val() != '') {
								$.ajaxFileUpload(
									{
										url: "<%=ctx%>/admin/uploadComAvatar.do",
										secureuri: false,
										fileElementId: 'icon',
										dataType: 'json',
										data: {id:data.id, "com.id":data.id},
										success: function (data, status) {
											if (typeof (data.success) != 'undefined') {
												if (data.success == true) {
													$(grid_selector).trigger("reloadGrid");
													return;
												} else {
													alert(data.message);
												}
											} else {
												return alert('Failed to upload logo!');
											}
										},
										error: function (data, status, e) {
											return alert('Failed to upload logo!');
										}
									}
								);
							}
							return [data.success, data.message, data.id];
						}
					},
					{
						//delete record form
						mtype: "POST",
						reloadAfterSubmit: true,
						onclickSubmit: function(rp_ge, postdata) {
							rp_ge.url = "<%=ctx%>/admin/removeComUser.do";
						},
						serializeDelData: function (postdata) {
							var ids = "";
							var idxArr = postdata.id.split(",");
							for (var i = 0; i < idxArr.length; i++) {
								var rowData = jQuery(grid_selector).getRowData(idxArr[i]);
								ids += rowData['com.id'];
								if (i != (idxArr.length - 1)) {
									ids += ",";
								}
							}
							return "oper=page._delete&ids="+ids;
						},
						afterSubmit: function(rsp,postdata) {
							var ret = jQuery.parseJSON(rsp.responseText);
							if (ret.ret == 0) {
								alert(ret.detail);
							}
							return [true, ''];
						},
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							alert(1);
						}
					},
					{
						//search form
						recreateForm: true,
						sopt:["eq",'cn'],
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				);

				function getPathAndName(pathAndName) {
					// path:name|path:name
					if (pathAndName == null || pathAndName == "") {
						return null;
					}
					var pn = pathAndName.split(";");
					if (pn.length != 2) {
						return null;
					}
					return pn;
				}
				
				function show_icon(form) {
					form.find("#tr_icon td:eq(1) input:eq(0)").attr("accept", "image/*");
					form.find("#tr_icon td:eq(1) input:eq(0)").css("display", "none");
					form.find("#tr_icon td:eq(1) input:eq(0)").change(function(e) {
						if (e.target.files[0].size > 2097152) {
							alert("请选择小于2M的图片！");
							e.value="";
							return;
						}
						
						var file = e.target.files[0];
						var reader = new FileReader()
			            reader.onload = function(elem) {
			                jQuery("#icon-img").attr("src", elem.target.result)
			            }
			            reader.readAsDataURL(file)
					});
					var tmp = getPathAndName(form.find("#tr_iconPN td:eq(1) input:eq(0)").val());
					var src = "";
					if (tmp == null || tmp[1] == "") {
						src = "../assets/images/add_pic.png";
					} else {
						src = "<%=ctx%>/displayPic.do?imagePath="+tmp[0]+"&imageName="+tmp[1];
					}
					var img = "<img id=\"icon-img\" onclick=\"jQuery('#icon').trigger('click')\" src=\""+src+"\" style=\"max-width: 110px; max-height: 110px;\"/>";
					form.find("#tr_icon td:eq(1)").append(jQuery(img));
				}
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
						.end().find('input[name=stock]')
							  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
					buttons.eq(1).prepend('<i class="icon-remove"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').remove();
					buttons.eq(0).append('<i class="icon-chevron-left"></i>');
					buttons.eq(1).append('<i class="icon-chevron-right"></i>');	
					
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
					buttons.eq(1).prepend('<i class="icon-remove"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) {
						return false;
					}
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-icon-pencil' : 'icon-pencil blue',
						'ui-icon-trash' : 'icon-trash red',
						'ui-icon-disk' : 'icon-ok green',
						'ui-icon-cancel' : 'icon-remove red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
						'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
						'ui-icon-seek-next' : 'icon-angle-right bigger-140',
						'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
				
			});
		</script>
	</body>
</html>