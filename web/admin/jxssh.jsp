<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.*" %>
<%@ page import="com.smart4c.bean.*" %>
<%@ page import="java.util.*, com.smart4c.common.*" %>
<%
String ctx = request.getContextPath();
SmartProperties hxProp = SmartProperties.getInstance();
int maxThumbnail = hxProp.getIntProperty("max_count_shop_thumbnail");
if (maxThumbnail < 1) {
	maxThumbnail = 1;
}
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
		<link rel="stylesheet" href="<%=ctx %>/assets/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="<%=ctx %>/assets/css/ui.jqgrid.css" />
		<!-- 
		<link rel="stylesheet" href="<%=ctx%>/assets/css/zTreeStyle/zTreeStyle.css" type="text/css">
		-->

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
		*,*:before,*:after{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}
		ol,ul {list-style: outside none none;}
		*,*:before,*:after{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}
		.ui-autocomplete {
			height: 200px;
			width: 400px;
			overflow-y: scroll;
			/* prevent horizontal scrollbar */
			overflow-x: hidden;
			/* add padding to account for vertical scrollbar */
			padding-right: 20px;
		}
		/* IE 6 doesn't support max-height
		* we use height instead, but this forces the menu to always be this tall
		*/
		* html .ui-autocomplete {
		height: 100px;
			} 
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
							<li>门店审核</li>
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
			<a id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse" href="#">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<div id="allmap"></div>
		
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
		<script src="<%=ctx %>/assets/js/bootstrap.min.js"></script>
		<script src="<%=ctx %>/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="<%=ctx %>/assets/js/uncompressed/date-time/bootstrap-timepicker.js"></script>
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
		<!-- 
		<script type="text/javascript" src="<%=ctx%>/assets/js/ztree/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="<%=ctx%>/assets/js/ztree/jquery.ztree.excheck-3.5.js"></script>
		-->
	
		<!-- page specific plugin scripts -->

		<script src="<%=ctx %>/assets/js/uncompressed/fuelux/fuelux.tree.js"></script>

		<!-- ace scripts -->

		<script src="<%=ctx %>/assets/js/ace-elements.min.js"></script>
		<script src="<%=ctx %>/assets/js/ace.min.js"></script>
		
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
		
			var brandList = "";
		
			function onclickLiOper(maxCount) {
				jQuery(".moveup").on("click", function (e) {
					var li = jQuery(this).parent().parent().parent();
					li.removeClass("last");
					li.prev().removeClass("first");
					li.insertBefore(li.prev());
					li.parent().children("li:first").addClass("first");
					li.parent().children("li:last").addClass("last");
					
					var ul = li.parent();
					updateImageFileInfo("shop_thumbnail");
				});
				
				jQuery(".movedown").on("click", function (e) {
					var li = jQuery(this).parent().parent().parent();
					li.removeClass("first");
					li.next().removeClass("last");
					li.insertAfter(li.next());
					li.parent().children("li:first").addClass("first");
					li.parent().children("li:last").addClass("last");
					
					updateImageFileInfo("shop_thumbnail");
					
				});
				
				jQuery(".del").on("click", function(e) {
					var li = jQuery(this).parent().parent().parent();
					var ul = li.parent();
					li.remove();
					ul.children("li:first").addClass("first");
					ul.children("li:last").addClass("last");
					
					updateImageFileInfo("shop_thumbnail");
					
					// show add photo div
					if (maxCount == null) {
						maxCount = 1;
					}
					if (ul.children().length < maxCount) {
						jQuery("#J_UploadPic").show();
					}
				});
			}
			
			function updateImageFileInfo(type) {
				if (type == null || type != "shop_thumbnail") {
					return;
				}
				var imgList = jQuery("#J_UploadQueue img");
				var imgValNode = jQuery("#pics");
				
				
				var imgVal = "";
				for (var i = 0; i < imgList.length; i++) {
					// /hongxi/admin/displayPic.do?imagePath=E:\hongxi_image\tyre\detail&imageName=1426757544140.gif
					var src = imgList[i].src;
					if (src == null || src == "") {
						continue;
					}
					var start = src.indexOf("imagePath=");
					var end = src.indexOf("&imageName=");
					if (start == -1 || end == -1) {
						continue;
					}
					var path = src.substring(start + 10, end);
					var name = src.substring(end + 11);
					imgVal += path+";"+name;
					if (i != (imgList.length - 1)) {
						imgVal += "|"
					}
				}
				if (imgValNode != null) {
					imgValNode.val(imgVal);
				}
			}
			
			function addLiNode(maxCnt, ulId, imgPath, imgName) {
				
				if (maxCnt == null) {
					maxCnt = 1;
				}
				
				if (jQuery("#"+ulId).children().length >= maxCnt) {
					return;
				}
				
				var idx = imgName.substring(0, imgName.indexOf("."));
				jQuery("#"+ulId+" li:last").removeClass("last");
				var first = "";
				if (jQuery("#"+ulId+" li").length == 0) {
					first = "first";
				}
				var fileLi = jQuery("<li class=\"pic-box control-group " + first + " last success\" id=\"file-" + idx + "\"></li>");
				var src = "";
				if (imgPath != null && imgPath != "") {
					src = "<%=ctx%>/displayPic.do?imagePath=" + imgPath + "&imageName=" + imgName;
				}
				var showPic = "<div class=\"pic sh-pic\">"
						+ "<a href=\"javascript:void(0);\">"
						+	"<img class=\"J_Pic_file-" + idx + "\" id=\"J_Pic_file-" + idx + "\" src=\""+ src + "\" alt=\"图片上传失败,请重新上传！\" >"
						+"</a>"
						//+"<span class=\"rotate\"><b class=\"rotate-icon\"></b>旋转图片</span>"
						+"<div class=\" J_Mask_file-" + idx + " pic-mask\" style=\"display: none;\"></div>"
						+"<div class=\"status-wrapper\">"
						+"	<div class=\"status waiting-status\" style=\"display: none;\">"
						+"		<p>等待上传<br>请稍候</p>"
						+"	</div>"
						+"	<div class=\"status start-status progress-status success-status\" style=\"\">"
						+"			<div class=\"J_ProgressBar_file-" + idx + " ks-progress-bar\" style=\"width: 100px; display: none;\" role=\"progressbar\" aria-valuemin=\"0\" aria-valuemax=\"100\" aria-valuenow=\"100\">"
						+"			<div data-value=\"100\" class=\"ks-progress-bar-value\" style=\"width: 100px;\"></div>"
						+"		</div>"
						+"	</div>"
						+"	<div class=\"status error-status\" style=\"display: none;\">"
						+"		<p class=\"J_ErrorMsg_file-" + idx + "\">服务器故障，请稍候再试！</p>"
						+"	</div>"
						+"</div>"
						+"</div>";
				var picAddon = "<div class=\"pic-addon\">"
						//+"<input id=\"J_Desc_file-" + idx + "\" placeholder=\"点击图片的响应地址\" type=\"text\" size=\"60\" maxlength=\"255\" onchange=\"updateImageFileInfo('shop_thumbnail')\">"
						+"<div class=\"bar clearfix\">"
						//+"	<label class=\"radio\"><input type=\"radio\" name=\"setMain\" class=\"set-main\" value=\"\"> 设为首图</label>"
						+"	<b class=\"moveup\">上移</b>"
						+"	<b class=\"movedown\">下移</b>"
						+"	<b class=\"del J_Del_file-"+idx+"\">删除</b>"
						+"</div>"
					+"</div>";
				fileLi.append(jQuery(showPic));
				fileLi.append(jQuery(picAddon));
				jQuery("#"+ulId).append(fileLi);
				
				if (jQuery("#"+ulId).children().length >= maxCnt) {
					// hide add photo div
					jQuery("#J_UploadPic").hide();
				}
				
				onclickLiOper(maxCnt);
			}
			
			function ajax_upload_pics(fileIds, picType, ulId, cb, which, maxCount) {
				// check file size
				if (which.files[0].size > 2097152) {
					alert("请上传不大于2M的图片！");
					return;
				}
				
				$.ajaxFileUpload(
					{
						url: "<%=ctx%>/uploadPics.do",
						secureuri: false,
						fileElementId: fileIds,
						dataType: 'json',
						data: {picType: picType},
						success: function (data, status) {
							if (typeof (data.success) != 'undefined') {
								if (data.success == true) {
									cb(maxCount, ulId, data.imgPath, data.imgName);
									updateImageFileInfo("shop_thumbnail");
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
		
			jQuery.jgrid.ajaxOptions.type = 'post'; // fixed 中文乱码
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
			
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
					url: "<%=ctx%>/admin/shopShList.do",
					//data: grid_data,
					datatype: "json",
					height: 391,
					colNames:['ID','名称','经度','纬度','省市县(区)','省份','城市','县区','地址','服务项目','营业时间','付款方式',
					          '联系电话','手机','固定电话','密码','门店图片','营业执照','图片路径',
					          '缩略图','成立时间','占地面积','店员人数','状态','创建时间'],
					colModel:[
						{name:'s.id',index:'s.id',hidden:true,editable:false},
						{name:'s.title',index:'s.title',editable:true,edittype:"text",editrules:{required:true}},
						{name:'s.longitude',index:'s.longitude',sortable:false,search:false,hidden:true,editable:true,edittype:"text"},
						{name:'s.latitude',index:'s.latitude',sortable:false,search:false,hidden:true,editable:true,edittype:"text"},
						{name:'s.cid',index:'s.cid',hidden:true,editable:true,search:false},
						{name:'province',index:'province',editable:true,edittype:"select",editoptions:{value:"<%=provinceBuf.toString()%>",readonly:true}},
						{name:'city',index:'city',editable:true,edittype:"text",editrules:{required:true},editoptions:{readonly:true}},
						{name:'county',index:'county',editable:true,edittype:"text",editrules:{required:true},editoptions:{readonly:true}},
						{name:'s.address',index:'s.address',editable:true,sortable:false,edittype:"text",editrules:{required:true}},
						{name:'service',index:'service',editable:true,edittype:"text",sortable:false,search:false},
						{name:'s.business',index:'s.business',sortable:false,search:false,editable:true,edittype:"text",editrules:{required:true}},
						{name:'paidtype',index:'paidtype',hidden:true,editable:true,sortable:true,search:true,edittype:"select",editoptions:{value:"1:现金;3:银行卡;5:现金,银行卡"}},
						{name:'contactInfo',index:'contactInfo',editable:false,sortable:false,search:false},
						{name:'s.phone',index:'s.phone',hidden:true,editable:true,edittype:"text",editrules:{required:true,edithidden:true},editoptions:{readonly:true}},
						{name:'s.tel',index:'s.tel',hidden:true,editable:true,edittype:"text",editrules:{required:true,edithidden:true}},
						{name:'s.password',index:'s.password',hidden:true,editable:true,edittype:"password",editrules:{required:true,edithidden:true}},
						{name:'icon',index:'icon',hidden:true,search:false,sortable:false,editable:true,edittype:"file",editoptions:{enctype:"multipart/form-data"},editrules:{edithidden:true}},
						{name:'licensePic',index:'licensePic',hidden:true,search:false,sortable:false,editable:true,edittype:"file",editoptions:{enctype:"multipart/form-data"},editrules:{edithidden:true}},
						{name:'iconPN',index:'iconPN',hidden:true,search:false,sortable:false,editable:true,edittype:"text"},
						{name:'pics',index:'pics',hidden:true,editable:true,edittype:"text",editrules:{edithidden:true}},
						{name:'s.years',index:'s.years',editable:true,edittype:"text",editrules:{required:true}},
						{name:'s.sizes',index:'s.sizes',editable:true,edittype:'text',editrule:{required:true}},
						{name:'s.people',index:'s.people',editable:true,edittype:'text',editrules:{required:true,integer:true}},
						{name:'s.status',index:'s.status',editable:true,edittype:'select',editoptions:{value:"0:审核通过;1:待审核;2:已删除;3:其它"}},
						{name:'s.creatTime',index:'s.creatTime',editable:false,search:false},
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
					sortname: "s.id",
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
							enableTooltips(table);
						}, 0);
					},
			
					caption: "门店列表",
					autowidth: true
			
				});
			
				function getCoordinate() {
					if (jQuery("#tr_s\\.address input:eq(0)").val() == "") {
						alert("门店地址不能为空！");
						return;
					}
					
					//String addr = jQuery("#tr_province input:eq(0)").val();
					var map = new BMap.Map("allmap");
					var point = new BMap.Point(116.331398,39.897445);
					map.centerAndZoom(point,12);
					var addr = jQuery("#tr_province input:eq(0)").val() 
						+ jQuery("#tr_city input:eq(0)").val() 
						+ jQuery("#tr_county input:eq(0)").val() 
						+ jQuery("#tr_address input:eq(0)").val();
					
					var myGeo = new BMap.Geocoder();
					myGeo.getPoint(addr,function(point) {
						if (point != null) {
							jQuery("#tr_s\\.longitude input:eq(0)").val(point.lng); // 经度
							jQuery("#tr_s\\.latitude input:eq(0)").val(point.lat); // 纬度
						} else {
							alert("地址可能有误！在百度地图上无法获取该地址坐标！");
							jQuery("#tr_s\\.longitude input:eq(0)").val(0); // 经度
							jQuery("#tr_s\\.latitude input:eq(0)").val(0); // 纬度
						}
					});
				}
				
				var DataSourceTree = function(options) {
					this.ssId = options.ssId;
					this.ctx = options.ctx;
				}

				DataSourceTree.prototype.data = function(options, callback) {
					var self = this;
					var $data = null;

					if (! ('type0' in options)) {
						$.ajax({
							url: this.ctx + "/admin/getProducts.do?id=0&ssId=" + this.ssId,
							dataType:"json",
							//async:false,
							success: function(data) {
								if (data == null || data.status == "1") {
									alert("获取产品分类信息失败！");
									return;
								}
								callback({data: data.data});
							},
							error: function() {
								alert("获取产品分类信息失败！");
							}
						});
					} else if(options['type0'] == 'class' || options['type0'] == 'project'){ // this root tree
						$.ajax({
							url: this.ctx + "/admin/getProducts.do?id="+options['id']+"&ssId=" + this.ssId + "&nodeType=" +options['type0'],
							dataType:"json",
							//async:false,
							success: function(data) {
								if (data == null || data.status == "1") {
									alert("获取产品信息失败！");
									return;
								}
								callback({data: data.data});
							},
							error: function() {
								alert("获取产品信息失败！");
							}
						});
					} else {
						$data = {};
					}
				};
				

				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						//edit: true,
						//editicon : 'icon-pencil blue',
						add: false,
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
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							show_icon(form);
							show_thumbnails(form);
							style_edit_form(form);
							
							if ($("#s\\.status").val() == "2") {
								jQuery("#edithdgrid-table span:eq(0)").append("&nbsp;<font color='red'>已删除门店无法编辑!</font>");
								jQuery("#sData").css("display", "none");
							}
							
							$("#tr_s\\.address input:eq(0)").blur(getCoordinate);
							
							// set business hours
							$("#s\\.business").css("display", "none");
							var businessHours = $("#s\\.business").val();
							var hours = businessHours.split("--");
							var selTime = "<div class=\"input-append\"><label for='startTime'>开始时间</label>&nbsp;&nbsp;<input type='text' id='startTime' size='4'></div>";
							selTime += "<div class=\"input-append\"><label for='endTime'>结束时间</label>&nbsp;&nbsp;<input type='text' id='endTime' size='4'></div>";
							$("#tr_s\\.business td:eq(1)").append($(selTime));
							$("#startTime").timepicker({showMeridian:false,defaultTime:hours[0]});
							$("#endTime").timepicker({showMeridian:false,defaultTime:hours[1]});
							
							$("#service").css("display", "none");
							$("#tr_service td:eq(1)").append("<div style=\"margin-top: -20px;\" class=\"widget-header header-color-blue2\">"
								+ "<h4 class=\"lighter smaller\">选择服务项目</h4></div><div id='serviceTree' class='tree'></div>");
							var selRowIdx = jQuery(grid_selector).jqGrid("getGridParam", "selrow");
							var rowData = jQuery(grid_selector).jqGrid("getRowData", selRowIdx);
							var serviceDS = new DataSourceTree({ssId:rowData['s.id'],ctx:"<%=ctx%>"});
							$("#serviceTree").ace_tree({
								dataSource: serviceDS,
								multiSelect: true,
								loadingHTML: '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
								'open-icon' : 'icon-minus',
								'close-icon' : 'icon-plus',
								'selectable' : true,
								'selected-icon' : 'icon-ok',
								'unselected-icon' : 'icon-remove'
							});
							
							if ($("#s\\.status").val() != "2") {
								$("#serviceTree").on("selected", function(evt,data) {
									$.ajax({
										url:"<%=ctx%>/admin/addProductToShop.do",
										data: "ssId="+$("#serviceTree").data("tree").options.dataSource.ssId+"&id="+data.clickedNode.id,
										dataType: "json",
										success: function(data) {
											if (data.ret == "1") {
												alert(data.msg);
											}
										},
										error: function() {
											alert("操作失败，请刷新后重试！");
										}
									});
								});
								$("#serviceTree").on("unselected", function(evt,data) {
									$.ajax({
										url: "<%=ctx%>/admin/delProductFromShop.do",
										data: "ssId="+$("#serviceTree").data("tree").options.dataSource.ssId+"&id="+data.clickedNode.id,
										dataType: "json",
										success: function() {
											if (data.ret == "1") {
												alert(data.msg);
											}
										},
										error: function() {
											alert("操作失败，请刷新后重试！");
										}
									});
								});
							}
							
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
							$("#county").change(getCoordinate);
							
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
						serializeEditData: function(data) {
							var postdata = "";
							for (key in data) {
								if (postdata.length!=0) {
									postdata += "&";
								}
								
								if (key == "icon" || key == "licensePic" || key == "iconPN") {
									continue;
								}
								
								if (key == "id"){
									postdata +="s.id="+jQuery(grid_selector).getRowData(data[key])['s.id'];
								} else if (key == 'service') {
									// set services
									var services = "";
									$($("#serviceTree").data("tree").selectedItems()).each(function(idx,val){
										services += val.id + ",";
									});
									if (services.length > 0) {
										services.substring(0, services.length-1);
									}
									postdata += "service=" + services;
								} else if (key == "paidtype") {
									postdata += "s.paidtype.id="+$("#paidtype option:selected").val();
								} else if (key== "s.business") {
									// set business hours
									postdata += "s.business="+$("#startTime").timepicker("getTime").val()+"--"+$("#endTime").timepicker("getTime").val();
								} else {
									postdata += key+"="+data[key];
								}
							}
							return postdata;
						},
						afterShowForm: function(form) {
							form.css("height", "455px");
						},
						onclickSubmit: function(params,postdata) {
							params.url = "<%=ctx%>/admin/updateShop.do";
						},
						afterSubmit: function(response, postdata) {
							var data = $.parseJSON(response.responseText);
							if (data.success == true) {
								if ($("#icon").val() != "") {
									$.ajaxFileUpload(
										{
											url: "<%=ctx%>/admin/uploadShopPic.do",
											secureuri: false,
											fileElementId: 'icon',
											dataType: 'json',
											data: {id:data.id, "s.id":data.id},
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
								
								if ($("#licensePic").val() != "") {
									$.ajaxFileUpload(
										{
											url: "<%=ctx%>/admin/uploadShopLicensePic.do",
											secureuri: false,
											fileElementId: 'licensePic',
											dataType: 'json',
											data: {id:data.id, "s.id":data.id},
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
							}

							return [data.success, data.message, data.id];
						}
					},
					{},
					{
						//delete record form
						mtype: "POST",
						reloadAfterSubmit: true,
						onclickSubmit: function(rp_ge, postdata) {
							rp_ge.url = "<%=ctx%>/admin/removeShop.do";
						},
						serializeDelData: function (postdata) {
							var ids = "";
							var idxArr = postdata.id.split(",");
							for (var i = 0; i < idxArr.length; i++) {
								var rowData = jQuery(grid_selector).getRowData(idxArr[i]);
								ids += rowData['s.id'];
								if (i != (idxArr.length - 1)) {
									ids += ",";
								}
							}
							return "oper=page._delete&ids="+ids;
						},
						afterSubmit: function(rsp,postdata) {
							var ret = jQuery.parseJSON(rsp.responseText);
							if (ret.ret > 0) {
								return [true, ''];
							} else {
								return [false, decodeURIComponent(ret.detail)]; // detail is encoded by utf-8
							}
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
				)
				
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
			                jQuery("#icon-img").attr("src", elem.target.result);
			            }
			            reader.readAsDataURL(file)
					});
					var tmp = getPathAndName(form.find("#tr_iconPN td:eq(1) input:eq(0)").val());
					var src = "";
					if (tmp == null || tmp[1] == "") {
						src = "../assets/images/add_pic.png";
					} else {
						var icons = tmp[1].split(","); // icons[0] for shop's icon  icons[1] for license icon
						src = "<%=ctx%>/displayPic.do?imagePath="+tmp[0]+"&imageName="+icons[0];
					}
					var img = "<img id=\"icon-img\" onclick=\"jQuery('#icon').trigger('click')\" src=\""+src+"\" style=\"max-width: 110px; max-height: 110px;\"/>";
					form.find("#tr_icon td:eq(1)").append(jQuery(img));
					
					$("#licensePic").attr("accept", "image/*");
					$("#licensePic").css("display", "none");
					form.find("#licensePic").change(function(e) {
						if (e.target.files[0].size > 2097152) {
							alert("请选择小于2M的图片！");
							e.value="";
							return;
						}
						
						var file = e.target.files[0];
						var reader = new FileReader()
			            reader.onload = function(elem) {
			                jQuery("#license-img").attr("src", elem.target.result);
			            }
			            reader.readAsDataURL(file)
					});
					if (tmp == null || tmp[1] == "") {
						src = "../assets/images/add_pic.png";
					} else {
						var icons = tmp[1].split(","); // icons[0] for shop's icon  icons[1] for license icon
						src = "<%=ctx%>/displayPic.do?imagePath="+tmp[0]+"&imageName="+icons[1];
					}
					img = "<img id=\"license-img\" onclick=\"jQuery('#licensePic').trigger('click')\" src=\""+src+"\" style=\"max-width: 110px; max-height: 110px;\"/>";
					form.find("#tr_licensePic td:eq(1)").append(jQuery(img));
				}
				
				function show_thumbnails(form) {
					form.find("#tr_pics td:eq(0)").css("vertical-align", "top");
					form.find("#tr_pics td:eq(1) input:eq(0)").css("display","none");
					form.find("#tr_pics td:eq(1) input:eq(0)").attr("id", "pics");
					var controls = jQuery("<div class=\"controls\"></div>");
					var J_UploadQueueContainer = jQuery("<div data-url=\"\" id=\"J_UploadQueueContainer\"></div>");
					var J_UploadQueue = jQuery("<ul class=\"upload-queue ks-uploader-queue imageUploader-queue\" id=\"J_UploadQueue\"></ul>");
					var arrFile = form.find("#tr_pics td:eq(1) input:eq(0)").val().split("|");
					var maxCount = <%=maxThumbnail%>;
					if (maxCount == null) {
						maxCount = 1;
					}
					var i=0, realCnt = 0;
					for (; i<arrFile.length && i<maxCount; i++) {
						var tmp = getPathAndName(arrFile[i]);
						if (tmp == null) {
							continue;
						}
						var first = "", last = "";
						if (i == 0) {
							first = "first";
						}
						if (i == (arrFile.length - 1)) {
							last = "last";
						}
						var idx = tmp[1].substring(0,tmp[1].indexOf("."));
						var src = "<%=ctx%>/displayPic.do?imagePath="+tmp[0]+"&imageName="+tmp[1];
						var fileLi = jQuery("<li class=\"pic-box control-group "+ first + " " + last + " success\" id=\"file-" + idx + "\"></li>");
						var showPic = "<div class=\"pic sh-pic\">"
								+ "<a href=\"javascript:void(0);\">"
								+	"<img class=\"J_Pic_file-" + idx + "\" id=\"J_Pic_file-" + idx + "\" src=\""+src+"\">"
								+"</a>"
								//+"<span class=\"rotate\"><b class=\"rotate-icon\"></b>旋转图片</span>"
								+"<div class=\" J_Mask_file-"+idx+" pic-mask\" style=\"display: none;\"></div>"
								+"<div class=\"status-wrapper\">"
								+"	<div class=\"status waiting-status\" style=\"display: none;\">"
								+"		<p>等待上传<br>请稍候</p>"
								+"	</div>"
								+"	<div class=\"status start-status progress-status success-status\" style=\"\">"
								+"			<div class=\"J_ProgressBar_file-"+idx+" ks-progress-bar\" style=\"width: 100px; display: none;\" role=\"progressbar\" aria-valuemin=\"0\" aria-valuemax=\"100\" aria-valuenow=\"100\">"
								+"			<div data-value=\"100\" class=\"ks-progress-bar-value\" style=\"width: 100px;\"></div>"
								+"		</div>"
								+"	</div>"
								+"	<div class=\"status error-status\" style=\"display: none;\">"
								+"		<p class=\"J_ErrorMsg_file-"+idx+"\">服务器故障，请稍候再试！</p>"
								+"	</div>"
								+"</div>"
								+"</div>";
						var picAddon = "<div class=\"pic-addon\">"
								//+"<input id=\"J_Desc_file-" + idx + "\" placeholder=\"点击图片的响应地址,例如: http://www.hongxi365.com/admin/ \""
								//+" type=\"text\" size=\"60\" maxlength=\"255\" onchange=\"updateImageFileInfo('ads_picture')\" "
								//+" value='" + tmp[2] + "' >"
								+"<div class=\"bar clearfix\">"
								//+"	<label class=\"radio\"><input type=\"radio\" name=\"setMain\" class=\"set-main\" value=\"\"> 设为首图</label>"
								+"	<b class=\"moveup\">上移</b>"
								+"	<b class=\"movedown\">下移</b>"
								+"	<b class=\"del J_Del_file-"+idx+"\">删除</b>"
								+"</div>"
							+"</div>";
						fileLi.append(jQuery(showPic));
						fileLi.append(jQuery(picAddon));
						J_UploadQueue.append(fileLi);
						realCnt++;
					}
					J_UploadQueueContainer.append(J_UploadQueue);
					controls.append(J_UploadQueueContainer);
					form.find("#tr_pics td:eq(1)").append(controls);
					
					var jUpic = "<div class=\"upload\" id=\"J_UploadPic\" ";
					if (realCnt>=maxCount) {
						jUpic += "style=\"display: none\" ";
					}
					jUpic += "/>";
					var J_UploadPic = jQuery(jUpic);
					var upload_inner = jQuery("<div class=\"upload-inner\" />");
					upload_inner.append(jQuery("<b></b>"));
					var innerHtml = "<input type=\"file\" accept='image/*' onchange='ajax_upload_pics(\"thumbnailFile\",\"shop_thumbnail_picture\",\"J_UploadQueue\",addLiNode, this, " + maxCount + ");' class=\"file-input\" hidefocus=\"true\""
						+ " id=\"thumbnailFile\" name=\"file\" style=\"font-family: Arial; height: 110px; width:110px;"
						+" margin: 0px; padding: 0px; cursor: pointer; opacity: 0;\">";
					upload_inner.append(jQuery(innerHtml));
					J_UploadPic.append(upload_inner);
					form.find("#tr_pics td:eq(1)").append(J_UploadPic);
					
					form.find("#tr_pics td:eq(1)").append(jQuery("<span class=\"upload-tip\">最多可上传"+maxCount+"张照片，图片每张最大2M</span>"));
					
					onclickLiOper(maxCount);
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