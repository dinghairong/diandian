<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
	String setcity = (String)session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		setcity = "上海";
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}


	List<AreaDetail> hotarea = areaDetailDao.findAreaDetailByHot();
	List<String> isRepeat = new ArrayList<String>();

	List<AreaDetail> province_list = areaDetailDao.findAllProvince();
	List<AreaDetail> selectcity = areaDetailDao.findAllCountyByCity(setcity + "市");

	String selectprovince = "";
	if(selectcity.size() > 0){
		selectprovince = selectcity.get(0).getProvince();
		selectcity = areaDetailDao.findAllCityByProvince(selectprovince);
	}else{
		selectcity = areaDetailDao.findAllCityByProvince("上海市");
		selectprovince = selectcity.get(0).getProvince();
	}
	String showstr = "";
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
	<link rel="stylesheet" href="<%=ctx%>/css/city.css">
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
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<div class="top_line"></div>
		<div id="bodySection" style="overflow: hidden;min-height:0;margin-top:-50px;">
			<div class="container_24">
				<div id="CityPage">
					<div class="hotcity">
						<label>热门城市：</label>
						<ul>
							<%
							int show_hot = 20;
							if(hotarea.size() < 20){
								show_hot = hotarea.size();
							}
							for(int i = 0;i < show_hot;i ++){
								if(!isRepeat.contains(hotarea.get(i).getCity())){
									showstr = hotarea.get(i).getCity();
									showstr = showstr.substring(0,showstr.length() - 1);
									isRepeat.add(hotarea.get(i).getCity());
							%>
							<li>
								<span data-cityid="<%=hotarea.get(i).getId()%>"><%=showstr%></span>
							</li>
							<%
								}
							}
							%>
						</ul>
						<div class="clear"></div>
					</div>
					<div class="cityselect" style="-webkit-box-sizing: content-box;">
						<label for="provinceSelect">按省份选择：</label>
						<select id="provinceSelect">
								<%
								isRepeat.clear();
								for(int i = 0;i < province_list.size();i ++){
									if(!isRepeat.contains(province_list.get(i).getProvince())){
										isRepeat.add(province_list.get(i).getProvince());
										if(selectprovince.equals(province_list.get(i).getProvince())){
								%>
								<option selected="selected"><%=province_list.get(i).getProvince()%></option>
								<%
										}else{
								%>
								<option><%=province_list.get(i).getProvince()%></option>
								<%
										}
									}
								}						
								%>
						</select>
						<select id="citySelect">
							<%
							isRepeat.clear();
							for(int i = 0;i < selectcity.size();i ++){
								if(!isRepeat.contains(selectcity.get(i).getCity())){
									isRepeat.add(selectcity.get(i).getCity());
							%>
								<option value="<%=selectcity.get(i).getId()%>"><%=selectcity.get(i).getCity()%></option>
							<%
								}
							}
							%>
						</select>
						<button value="确定">确定</button>
					</div>
					<div class="pinyin">
						<span>
							按拼音首字母选择
							<i></i>
						</span>
					</div>
					<div class="citys">
						<%
						isRepeat.clear();
						String[] first_letter = {"A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","W","X","Y","Z"};
						for(int i = 0;i < first_letter.length;i ++){
						%>
						<div class="city">
							<label><%=first_letter[i]%></label>
							<div>
						<%
							List<AreaDetail> city_list = areaDetailDao.findAreaDetailByFirstLetter(first_letter[i]);
							for(int j = 0;j < city_list.size();j ++){
								if(!isRepeat.contains(city_list.get(j).getCity())){
									showstr = city_list.get(j).getCity();
									showstr = showstr.substring(0,showstr.length() - 1);
									isRepeat.add(city_list.get(j).getCity());
						%>				
								<span data-cityid="<%=city_list.get(j).getId()%>"><%=showstr%></span>					
						<%
								}
							}
						%>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	//$('.daohang').hide();
	$('.lunbo').hide();
});

$('#provinceSelect').change(function(){
	var province = this.options[this.selectedIndex].innerHTML;
	province = encodeURI(encodeURI(province));

	$.ajax({
		url: "<%=ctx%>/former/getcitybyprovince.do?province=" + province,
		type: "post",
		dataType: "JSON",
		async: false,
		timeout: 3000,
		success: function(ret){
			$('#citySelect').html(ret.html);
		},
		error: function(XMLRequest, textInfo){
			if(textInfo != null){
				alert(textInfo);
			}
		}
	});
});
$('#CityPage span').mouseenter(function(){
	this.style["background-color"] = "#007fcc";
	this.style.color = "white";
});
$('#CityPage span').mouseleave(function(){
	this.style["background-color"] = "";
	this.style.color = "";
});
$('.citys .city').mouseenter(function(){
	this.style["background-color"] = "#f9f9f9";
	this.style["border-top"] = "1px solid #dfdfdf";
	this.style["border-bottom"] = "1px solid #dfdfdf";
	$(this).children()[0].style["background-color"] = "#007fcc";
	$(this).children()[0].style.color = "white";
});
$('.citys .city').mouseleave(function(){
	this.style["background-color"] = "";
	this.style["border-top"] = "";
	this.style["border-bottom"] = "";
	$(this).children()[0].style["background-color"] = "";
	$(this).children()[0].style.color = "";
});
$('#CityPage span').click(function(){
	var city = this.innerHTML;
	if(city.trim().indexOf("按拼音首字母选择") > -1){
		return false;
	}
	city = encodeURI(encodeURI(city));
	var url = window.parent.document.referrer;

    $.ajax({
        url: "<%=ctx%>/former/setnowcity.do?city=" + city,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            // if(ret.nowcity.length > 0){
            //     var showcity = ret.nowcity.substring(0,ret.nowcity.length - 1);
            //     $('.denglu_left h').html(showcity);
            // }else{
            //     $('.denglu_left h').html("上海");
            // }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });

	//父页面过来的
	// if(window.parent.document.referrer.indexOf('showcommoditydetail') > -1){
		// $.ajax({
		// 	url: "<%=ctx%>/browser/installcity.do?address=" + city,
		// 	type: "post",
		// 	dataType: "JSON",
		// 	async: false,
		// 	timeout: 3000,
		// 	success: function(ret){
				
		// 	},
		// 	error: function(XMLRequest, textInfo){
		// 		if(textInfo != null){
		// 			alert(textInfo);
		// 		}
		// 	}
		// });
	// }else{
		// $.ajax({
		// 	url: "<%=ctx%>/browser/setnowcity.do?city=" + city,
		// 	type: "post",
		// 	dataType: "JSON",
		// 	async: false,
		// 	timeout: 3000,
		// 	success: function(ret){
				
		// 	},
		// 	error: function(XMLRequest, textInfo){
		// 		if(textInfo != null){
		// 			alert(textInfo);
		// 		}
		// 	}
		// });
	// }

	location.href = url;
});
$('button').click(function(){
	var city = $('#citySelect')[0].options[$('#citySelect')[0].selectedIndex].innerHTML;
	city = city.substring(0,city.length - 1);
	city = encodeURI(encodeURI(city));
	var url = window.parent.document.referrer;

	$.ajax({
        url: "<%=ctx%>/former/setnowcity.do?city=" + city,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            // if(ret.nowcity.length > 0){
            //     var showcity = ret.nowcity.substring(0,ret.nowcity.length - 1);
            //     $('.denglu_left h').html(showcity);
            // }else{
            //     $('.denglu_left h').html("上海");
            // }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
    
	// if(window.parent.document.referrer.indexOf('showcommoditydetail') > -1){
		// $.ajax({
		// 	url: "<%=ctx%>/browser/installcity.do?address=" + city,
		// 	type: "post",
		// 	dataType: "JSON",
		// 	async: false,
		// 	timeout: 3000,
		// 	success: function(ret){
				
		// 	},
		// 	error: function(XMLRequest, textInfo){
		// 		if(textInfo != null){
		// 			alert(textInfo);
		// 		}
		// 	}
		// });
	// }else{
		// $.ajax({
		// 	url: "<%=ctx%>/browser/setnowcity.do?city=" + city,
		// 	type: "post",
		// 	dataType: "JSON",
		// 	async: false,
		// 	timeout: 3000,
		// 	success: function(ret){
				
		// 	},
		// 	error: function(XMLRequest, textInfo){
		// 		if(textInfo != null){
		// 			alert(textInfo);
		// 		}
		// 	}
		// });
	// }

	location.href = url;
});
</script>
</html>