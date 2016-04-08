<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.util.SpringUtils" %>
<%@ page import="com.smart4c.dao.*" %>
<%@ page import="com.smart4c.bean.*" %>
<%@ page import="java.util.*,com.smart4c.common.*" %>
<%
String ctx = request.getContextPath();
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
							<li>广告管理</li>
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

		<script src="<%=ctx %>/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
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
			
			function onclickLiOper(maxCount) {
				jQuery(".moveup").on("click", function (e) {
					var li = jQuery(this).parent().parent().parent();
					li.removeClass("last");
					li.prev().removeClass("first");
					li.insertBefore(li.prev());
					li.parent().children("li:first").addClass("first");
					li.parent().children("li:last").addClass("last");
					
					var ul = li.parent();
					updateImageFileInfo("ads_picture");
				});
				
				jQuery(".movedown").on("click", function (e) {
					var li = jQuery(this).parent().parent().parent();
					li.removeClass("first");
					li.next().removeClass("last");
					li.insertAfter(li.next());
					li.parent().children("li:first").addClass("first");
					li.parent().children("li:last").addClass("last");
					
					updateImageFileInfo("ads_picture");
					
				});
				
				jQuery(".del").on("click", function(e) {
					var li = jQuery(this).parent().parent().parent();
					var ul = li.parent();
					li.remove();
					ul.children("li:first").addClass("first");
					ul.children("li:last").addClass("last");
					
					updateImageFileInfo("ads_picture");
					
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
				if (type == null || type != "ads_picture") {
					return;
				}
				var imgList = jQuery("#J_UploadQueue img");
				var hrefList = jQuery("#J_UploadQueue input");
				var titleList = jQuery("#J_UploadQueue textarea");
				if (imgList == null || hrefList == null || imgList.length != hrefList.length) {
					return;
				}
				var imgValNode = jQuery("#pics");
				
				
				var imgVal = "";
				for (var i = 0; i < imgList.length; i++) {
					// /hongxi/displayPic.do?imagePath=E:\hongxi_image\tyre\detail&imageName=1426757544140.gif
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
					imgVal += path+";"+name+";"+hrefList[i].value+";"+titleList[i].value;
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
						+"<textarea id=\"J_Desc_file_title-" + idx + "\" placeholder=\"图片描述（最多50个字)\" rows=\"2\" onchange=\"updateImageFileInfo('ads_picture')\"></textarea><br><br>"
						+"<input id=\"J_Desc_file-" + idx + "\" placeholder=\"点击图片的响应地址,例如: http://www.hongxi365.com/admin/\" type=\"text\" size=\"60\" maxlength=\"255\" onchange=\"updateImageFileInfo('ads_picture')\">"
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
			
			function ajax_upload_pics(fileIds, picType, ulId, cb, which, maxCount, locIdx) {
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
						data: {picType: picType, locIdx: locIdx},
						success: function (data, status) {
							if (typeof (data.success) != 'undefined') {
								if (data.success == true) {
									cb(maxCount, ulId, data.imgPath, data.imgName);
									updateImageFileInfo("ads_picture");
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
					url: "<%=ctx%>/admin/getAdsList.do",
					//data: grid_data,
					datatype: "json",
					height: 391,
					colNames:['最大图片数','序号','广告位','广告位图片'],
					colModel:[
						{name:'maxCnt',index:'maxCnt',editable:true,hidden:true,edittype:"text"},
						{name:'location',index:'location',editable:true,editype:"text",editoptions:{readonly:true},width: 50},
						{name:'locName',index:'locName',editable:true,edittype:"text",editoptions:{readonly:true}},
						{name:'pics',index:'pics',hidden:true,editable:true,edittype:"text"},
					], 
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
					sortname: "location",
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
						
					},
			
					caption: "广告位管理",
					autowidth: true
			
				});
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: true,
						editicon : 'icon-pencil blue',
						add: false,
						addicon : 'icon-plus-sign purple',
						del:false,
						search:false,
						refresh:false
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
							style_edit_form(form);
							show_thumbnails(form);
							jQuery("tr#tr_pics", form).show();
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
								if (key == "oper" || key == "id" || key == "pics") {
									postdata += key+"="+data[key];
									continue;
								}
								if (key == "maxCnt" || key == "locName") {
									continue;
								} else {
									postdata +="ads."+key+"="+data[key];
								}
							}
							return postdata;
						},
						onclickSubmit: function(params,postdata) {
							params.url = "<%=ctx%>/admin/updateAds.do";
							alert("修改成功")
						},
						
					},
					{},{},{},{}
				);

				function getPathAndName(pathAndName) {
					// path:name|path:name
					if (pathAndName == null || pathAndName == "") {
						return null;
					}
					var pn = pathAndName.split(";");
					if (pn.length < 2) {
						return null;
					}
					return pn;
				}
				
				function show_thumbnails(form) {
					form.find("#tr_pics td:eq(0)").css("vertical-align", "top");
					form.find("#tr_pics td:eq(1) input:eq(0)").css("display","none");
					form.find("#tr_pics td:eq(1) input:eq(0)").attr("id", "pics");
					var locIdx = form.find("#tr_location td:eq(1) input:eq(0)").val();
					var controls = jQuery("<div class=\"controls\"></div>");
					var J_UploadQueueContainer = jQuery("<div data-url=\"\" id=\"J_UploadQueueContainer\"></div>");
					var J_UploadQueue = jQuery("<ul class=\"upload-queue ks-uploader-queue imageUploader-queue\" id=\"J_UploadQueue\"></ul>");
					var arrFile = form.find("#tr_pics td:eq(1) input:eq(0)").val().split("|");
					var maxCount = form.find("#tr_maxCnt td:eq(1) input:eq(0)").val();
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
								+"<textarea id=\"J_Desc_file_title-" + idx + "\" placeholder=\"图片描述（最多50个字)\" rows=\"2\" onchange=\"updateImageFileInfo('ads_picture')\">"+tmp[3]+"</textarea><br><br>"
								+"<input id=\"J_Desc_file-" + idx + "\" placeholder=\"点击图片的响应地址,例如: http://www.hongxi365.com/admin/ \""
								+" type=\"text\" size=\"60\" maxlength=\"255\" onchange=\"updateImageFileInfo('ads_picture')\" "
								+" value='" + tmp[2] + "' >"
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
					var innerHtml = "<input type=\"file\" accept='image/*' onchange='ajax_upload_pics(\"thumbnailFile\",\"ads_picture\",\"J_UploadQueue\",addLiNode, this, " + maxCount + "," + locIdx + ");' class=\"file-input\" hidefocus=\"true\""
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
				
			});
			
		</script>
	</body>
</html>