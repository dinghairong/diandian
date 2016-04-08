<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.*" %>
<%@ page import="com.smart4c.bean.*" %>
<%@ page import="java.util.*, com.smart4c.common.*" %>
<%@ page import="net.sf.json.*" %>
<%
String ctx = request.getContextPath();
SmartProperties hxProp = SmartProperties.getInstance();
int maxThumbnail = hxProp.getIntProperty("max_count_shop_thumbnail");
if (maxThumbnail < 1) {
	maxThumbnail = 1;
}

ServiceClassDao scDao = (ServiceClassDao)SpringUtils.getBean(ServiceClassDao.class);
ServiceProjectDao spjDao = (ServiceProjectDao)SpringUtils.getBean(ServiceProjectDao.class);
List<ServiceClass> scList = scDao.getAllClass();
StringBuffer scBuf = new StringBuffer();
JSONObject spjTree = new JSONObject();
for (ServiceClass sc : scList) {
	scBuf.append(sc.getId() + ":" + sc.getName());
	scBuf.append(";");
	JSONObject children = new JSONObject();
	List<ServiceProject> spjList = spjDao.getProjectsByClsId(sc.getId());
	for (ServiceProject spj : spjList) {
		JSONObject item = new JSONObject();
		item.put("name", spj.getName());
		item.put("id", spj.getId());
		item.put("type", "item");
		children.put(spj.getName(), item);
	}
	JSONObject addParam = new JSONObject();
	addParam.put("children", children);
	JSONObject spjObj = new JSONObject();
	spjObj.put("additionalParameters", addParam);
	spjObj.put("id", sc.getId());
	spjObj.put("type", "folder");
	spjObj.put("name", sc.getName());
	spjTree.put(sc.getName(), spjObj);
	
}
if (scBuf.length() > 1) {
	scBuf.deleteCharAt(scBuf.length() - 1);
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
							<li>服务产品管理</li>
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
			
			
			jQuery.jgrid.ajaxOptions.type = 'post'; // fixed 中文乱码
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
			
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
					url: "<%=ctx%>/admin/getSProducts.do",
					//data: grid_data,
					datatype: "json",
					height: 391,
					colNames:['ID','类别','项目','项目Id','产品名称','摘要','配件','促销价格','原价','时长','首页显示','产品描述','图片详情','产品图标','图标路径','状态'],
					colModel:[
						{name:'s.id',index:'s.id',hidden:true,editable:false},
						{name:'sc',index:'sc',editable:true,edittype:"text"},
						{name:'project',index:'project',editable:true,edittype:"text",editoptions:{readonly:true}},
						{name:'spjId', index:'spjId',editable:false,hidden:true},
						{name:'s.title',index:'s.title',editable:true,edittype:'text',editrules:{required:true}},
						{name:'s.abstract_',index:'s.abstract_',editable:true,edittype:'text',editrules:{required:true}},
						{name:'s.accessory',index:'s.accessory',editable:true,edittype:'text',editrules:{required:true}},
						{name:'s.newprice',index:'s.newprice',editable:true,edittype:'text',editrules:{required:true,number:true}},
						{name:'s.oldprice',index:'s.oldprice',editable:true,edittype:'text',editrules:{required:true,number:true}},
						{name:'s.duration',index:'s.duration',editable:true,edittype:'text',editrules:{required:true,integer:true}},
						{name:'s.isfirst',index:'s.isfirst',editable:true,edittype:'select',editoptions:{value:"1:是;0:否"}},
						{name:'s.description',index:'s.description',editable:true,edittype:'textarea',editrules:{required:true}},
						{name:'pics',index:'pics',hidden:true,editable:true,edittype:"text",editrules:{edithidden:true}},
						{name:'icon',index:'icon',hidden:true,search:false,sortable:false,editable:true,edittype:"file",editoptions:{enctype:"multipart/form-data"},editrules:{edithidden:true}},
						{name:'iconPN',index:'iconPN',hidden:true,search:false,sortable:false,editable:true,edittype:"text"},
						{name:'s.status',index:'s.status',editable:true,edittype:'select',editoptions:{value:"0:上架;1:已下架"}}
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
			
					caption: "服务列表",
					autowidth: true
			
				});
				
				var DataSourceTree = function(options) {
					this.spjId = options.spjId;
					this._data = options.data;
				}

				DataSourceTree.prototype.data = function(options, callback) {
					var $data = null;
					if(!("name" in options) && !("type" in options)){
						$data = this._data;//the root tree
						callback({ data: $data });
						return;
					} else if("type" in options && options.type == "folder") {
						if("additionalParameters" in options && "children" in options.additionalParameters) {
							$data = options.additionalParameters.children;
							for (var key in $data) {
								if($data[key].id == this.spjId) {
									$data[key]['additionalParameters'] = eval('('+"{'item-selected':true}"+')');
									break;
								}
							}
						} else {
								$data = {}//no data
						}
					}

					if($data != null) {//this setTimeout is only for mimicking some random delay
						setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);
					}
				};
				

				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: true,
						editicon : 'icon-pencil blue',
						add: true,
						addicon : 'icon-plus-sign purple',
						del: false,
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
							
							$("#tr_sc").css("display", "none");
							$("#project").css("display", "none");
							$("#tr_project td:eq(1)").append("<div style=\"margin-top: -20px;\" class=\"widget-header header-color-blue2\">"
								+ "<h4 class=\"lighter smaller\">选择服务项目</h4></div><div id='serviceTree' class='tree'></div>");
							var selRowIdx = jQuery(grid_selector).jqGrid("getGridParam", "selrow");
							var rowData = jQuery(grid_selector).jqGrid("getRowData", selRowIdx);
							var serviceDS = new DataSourceTree({spjId:rowData['spjId'],data:eval('('+'<%=spjTree.toString()%>'+')')});
							$("#serviceTree").ace_tree({
								dataSource: serviceDS,
								multiSelect: false,
								loadingHTML: '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
								'open-icon' : 'icon-minus',
								'close-icon' : 'icon-plus',
								'selectable' : true,
								'selected-icon' : 'icon-ok',
								'unselected-icon' : 'icon-remove'
							});

							$(".tree-folder-header > .tree-folder-name").each(function(idx,val){
								if ($(val).text() == $("#sc").val()) {
									$(val).parent().trigger("click");
									return false;
								}
							});
						},
						serializeEditData: function(data) {
							var postdata = "";
							for (key in data) {
								if (postdata.length!=0) {
									postdata += "&";
								}
								
								if (key == "sc" || key == "icon" || key == "iconPN") {
									continue;
								}
								
								if (key == "id"){
									postdata +="s.id="+jQuery(grid_selector).getRowData(data[key])['s.id'];
								} else if (key == 'project') {
									postdata += "s.serviceProject.id=" + $("#serviceTree").data("tree").selectedItems()[0].id;
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
							params.url = "<%=ctx%>/admin/updateSProduct.do";
						},
						beforeSubmit: function(postData, formId) {
							if ($("#serviceTree").data("tree").selectedItems().length == 0) {
								return [false,"请选择服务项目！"];
							}
							return [true, "success"];
						},
						afterSubmit: function(response, postdata) {
							var data = $.parseJSON(response.responseText);
							if (data.success == true) {
								if ($("#icon").val() != "") {
									$.ajaxFileUpload(
										{
											url: "<%=ctx%>/admin/uploadSProductPic.do",
											secureuri: false,
											fileElementId: 'icon',
											dataType: 'json',
											data: {id:data.id, "s.id":data.id},
											success: function (data, status) {
												if (typeof (data.success) != 'undefined') {
													if (data.success == true) {
														$(grid_selector).trigger(" ");
														alert("修改成功");
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
					{
						width: 750,
						mtype: "POST",
						closeAfterAdd: true,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							show_icon(form);
							show_thumbnails(form);
							style_edit_form(form);
							
							$("#tr_sc").css("display", "none");
							$("#project").css("display", "none");
							$("#tr_project td:eq(1)").append("<div style=\"margin-top: -20px;\" class=\"widget-header header-color-blue2\">"
								+ "<h4 class=\"lighter smaller\">选择服务项目</h4></div><div id='serviceTree' class='tree'></div>");
							var selRowIdx = jQuery(grid_selector).jqGrid("getGridParam", "selrow");
							var rowData = jQuery(grid_selector).jqGrid("getRowData", selRowIdx);
							var serviceDS = new DataSourceTree({spjId:-1,data:eval('('+'<%=spjTree.toString()%>'+')')});
							$("#serviceTree").ace_tree({
								dataSource: serviceDS,
								multiSelect: false,
								loadingHTML: '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
								'open-icon' : 'icon-minus',
								'close-icon' : 'icon-plus',
								'selectable' : true,
								'selected-icon' : 'icon-ok',
								'unselected-icon' : 'icon-remove'
							});

							$(".tree-folder-header > .tree-folder-name").each(function(idx,val){
								if ($(val).text() == $("#sc").val()) {
									$(val).parent().trigger("click");
									return false;
								}
							});
						},
						serializeEditData: function(data) {
							var postdata = "";
							for (key in data) {
								if (postdata.length!=0) {
									postdata += "&";
								}
								
								if (key == "sc" || key == "icon" || key == "iconPN" || key == "id") {
									continue;
								}
								
								if (key == 'project') {
									postdata += "s.serviceProject.id=" + $("#serviceTree").data("tree").selectedItems()[0].id;
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
							params.url = "<%=ctx%>/admin/addSProduct.do";
						},
						beforeSubmit: function(postData, formId) {
							if ($("#serviceTree").data("tree").selectedItems().length == 0) {
								return [false,"请选择服务项目！"]
							}
							return [true, "success"];
						},
						afterSubmit: function(response, postdata) {
							var data = $.parseJSON(response.responseText);
							if (data.success == true) {
								if ($("#icon").val() != "") {
									$.ajaxFileUpload(
										{
											url: "<%=ctx%>/admin/uploadSProductPic.do",
											secureuri: false,
											fileElementId: 'icon',
											dataType: 'json',
											data: {id:data.id, "s.id":data.id},
											success: function (data, status) {
												if (typeof (data.success) != 'undefined') {
													if (data.success == true) {
														$(grid_selector).trigger("reloadGrid");
														alert(操作成功);
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
								alert(操作成功);
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
						src = "<%=ctx%>/displayPic.do?imagePath="+tmp[0]+"&imageName="+tmp[1];
					}
					var img = "<img id=\"icon-img\" onclick=\"jQuery('#icon').trigger('click')\" src=\""+src+"\" style=\"max-width: 110px; max-height: 110px;\"/>";
					form.find("#tr_icon td:eq(1)").append(jQuery(img));
					
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
					var innerHtml = "<input type=\"file\" accept='image/*' onchange='ajax_upload_pics(\"thumbnailFile\",\"product_detail_picture\",\"J_UploadQueue\",addLiNode, this, " + maxCount + ");' class=\"file-input\" hidefocus=\"true\""
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