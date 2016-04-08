package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import java.lang.*;
import com.smart4c.dao.*;
import com.smart4c.bean.*;
import com.smart4c.common.*;
import com.smart4c.util.SpringUtils;

public final class shoplist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");

	String ctx = (String)request.getContextPath();
	AreaDetailDao areaDetailDao = (AreaDetailDao)SpringUtils.getBean(AreaDetailDao.class);
	ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);

	String setcity = (String)session.getAttribute("setcity");
	if((setcity == null) || (setcity.length() == 0)){
		response.sendRedirect(ctx + "/index.jsp");
		return;
	}else{
		if(setcity.length() > 0){
			setcity = setcity.substring(0, setcity.length() - 1);
		}
	}
	String getbyprovince = (String)request.getAttribute("getbyprovince");
	if(null == getbyprovince){
		getbyprovince = "";
	}
	String nowgetprovince = (String)session.getAttribute("nowprovince");
	if(getbyprovince.length() > 0){
		nowgetprovince = getbyprovince;
	}
	String getbycity = (String)request.getAttribute("getbycity");
	List<String> isRepeat = new ArrayList<String>();

	List<AreaDetail> province_list = areaDetailDao.findAllProvince();
	List<AreaDetail> selectcity = null;
	if(null != getbycity && getbycity.length() > 0){
		selectcity = areaDetailDao.findAllCountyByCity(getbycity);
		if(null != selectcity && selectcity.size() > 0){
			selectcity = areaDetailDao.findAllCityByProvince(selectcity.get(0).getProvince());
		}else{
			areaDetailDao.findAllCityByProvince(nowgetprovince);
		}
	}else{
		selectcity = areaDetailDao.findAllCityByProvince(nowgetprovince);
		getbycity = "";
	}
	String select_province = "";
	if(null != selectcity && selectcity.size() > 0){
		select_province = selectcity.get(0).getProvince();
	}else{
		select_province = nowgetprovince;
	}
	SmartProperties smartProp = SmartProperties.getInstance();
	String imgPath = smartProp.getImgPath();

	// Integer totalshop = (Integer)request.getAttribute("totalshop");
	List<ServiceShop> serviceshop_list = (List<ServiceShop>)request.getAttribute("serviceshop");
	int totalshop = 0;
	if(null == serviceshop_list){
		serviceshop_list = serviceShopDao.findServiceShopByCity(setcity + "市");
	}
	totalshop = serviceshop_list.size();
	Integer findbyorder1 = (Integer)request.getAttribute("findbyorder1");
	Integer findbyorder2 = (Integer)request.getAttribute("findbyorder2");

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>帮您养车网－－服务点</title>\r\n");
      out.write("\r\n");
      out.write("    <link href=\"");
      out.print(ctx);
      out.write("/css/css.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(ctx);
      out.write("/css/global.min.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.print(ctx);
      out.write("/css/Goods.min.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.print(ctx);
      out.write("/css/shoplist.css\">\r\n");
      out.write("\t <link href=\"images/favicon.ico\" rel=\"shortcut icon\"/>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/jquery-1.8.3.min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/jquery.tabso_yeso.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/jquery.flexslider-min.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/common.js\"></script>\r\n");
      out.write("    <script src=\"http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js\" type=\"text/ecmascript\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"http://api.map.baidu.com/api?v=1.3\"></script>\r\n");
      out.write("\t<script src=\"http://pv.sohu.com/cityjson?ie=utf-8\"></script> \r\n");
      out.write("\t<script type=\"text/javascript\" src=\"http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        $(function() {\r\n");
      out.write("            $(\".wrap\").flexslider({\r\n");
      out.write("                animation: \"slide\",\r\n");
      out.write("                controlNav: true,\r\n");
      out.write("                animationLoop: true\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("        var ctx = \"");
      out.print(ctx);
      out.write("\";\r\n");
      out.write("    </script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/js.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/hongxi.alert.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx);
      out.write("/js/map.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"all\" id=\"all\">\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "headSection.jsp", out, true);
      out.write("\r\n");
      out.write("\t\t<div class=\"top_line\"></div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div id=\"bodySection\" style=\"overflow: hidden;\">\r\n");
      out.write("\t\t\t<div class=\"container_24\">\r\n");
      out.write("\t\t\t\t<div class=\"container_24 \">\r\n");
      out.write("\t\t\t\t\t<div class=\"grid_24\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"site-map\">\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"astyle\" href=\"#\">当前位置</a>\r\n");
      out.write("\t\t\t\t\t\t\t> 服务门店\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"region_nexist_tip\" style=\"display:none;\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"words_tip\">抱歉！您所在的地区暂时没有安装门店</span>\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"advertisement_tip\">我们会将商品通过快递配送给您</span>\r\n");
      out.write("\t\t\t\t\t\t\t<a class=\"to_shop\" href=\"http://www.hongxi365.com.cn\">去购物</a>\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"region_nexist_tip_closebtn\">×</span>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"container_24 details\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"product-tt\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"region_select\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"region_select_tip\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"region_select_tip_img\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"region_select_tip_text\">您所在的区域：</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</span>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<ul class=\"posInfo\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select id=\"provinceSelect\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

										for(int i = 0;i < province_list.size();i ++){
											if(!isRepeat.contains(province_list.get(i).getProvince())){
											isRepeat.add(province_list.get(i).getProvince());
											if(null != select_province){
												if(select_province.equals(province_list.get(i).getProvince())){
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option selected=\"selected\">");
      out.print(province_list.get(i).getProvince());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

												}else{
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>");
      out.print(province_list.get(i).getProvince());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

												}
											}else{
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>");
      out.print(province_list.get(i).getProvince());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

												}
											}
										}
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select id=\"citySelect\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option>所有</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

										isRepeat.clear();
										for(int i = 0;i < selectcity.size();i ++){
											if(!isRepeat.contains(selectcity.get(i).getCity())){
												isRepeat.add(selectcity.get(i).getCity());
												if(getbycity.equals(selectcity.get(i).getCity())){
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option selected=\"selected\">");
      out.print(selectcity.get(i).getCity());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
}else{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<option>");
      out.print(selectcity.get(i).getCity());
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");

												}
											}
										}
										
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"getbyprovince\" name=\"getbyprovince\" value=\"");
      out.print(getbyprovince);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"nowgetprovince\" name=\"nowgetprovince\" value=\"");
      out.print(nowgetprovince);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" id=\"getbycity\" name=\"getbycity\" value=\"");
      out.print(getbycity);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"posControl\" class=\"location\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"posInfo\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t您的地址：\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"addressPos\" type=\"text\" onkeydown=\"\tEnterPress(event)\" onkeypress=\"\tEnterPress(event)\" placeholder=\"");
      out.print(nowgetprovince);
      out.write(" 请输入您的详细地址\" onfocus=\"addressPos_onfocus(this);\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"positionBtn\" href=\"javascript:void(0);\">查找</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"searchposError\" style=\"color:#D12A3E;display:none\">找不到该地址</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"order-menu\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"clr\"></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div id=\"shopmap\" style=\"float:left;\">\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"allmap\">\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"shoplist_left\">\r\n");
      out.write("\t\t\t\t\t\t\t");

								int seq1 = 2;
								int seq2 = 2;
								boolean isselect2 = false;
								if(null != findbyorder1){
									seq1 = findbyorder1;
									isselect2 = true;
								}
								if(null != findbyorder2){
									seq2 = findbyorder2;
									isselect2 = true; 
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"order-by\" style=\"overflow:hidden;height:30px;line-height:30px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<a  ");
      out.print( isselect2 ? "class='evaluation'" : "class='evaluation selected'");
      out.write(" href=\"#\" onclick=\"findServiceShopByOrder(this)\" data-id=\"0\">推荐</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a ");
      out.print( seq1 == 2 ? "class='evaluation arrow'" : seq1 == 1 ? "class='evaluation arrow selected asc'" : "class='evaluation arrow selected desc'" );
      out.write(" href=\"javascript:void(0)\" onclick=\"findServiceShopByOrder(this)\" data-id=\"1\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t评论\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"downArrow\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<span class=\"upArrow\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"countMd\">共");
      out.print(totalshop);
      out.write("家门店</span>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"product-list\" class=\"grid_8\" style=\"float:left;margin-top: 0;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"list\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");

									for(int i = 0;i < serviceshop_list.size();i ++){
										if(serviceshop_list.get(i).getStatus() == 0){
									
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"p clearfix\" style=\"overflow:hidden\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"pr-shopdes\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<span class=\"pr-shopimg\" style=\"height: 72px; width: 72px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<a target=\"_blank\" href=\"");
      out.print(ctx);
      out.write("/former/shopdetail?sp_id=");
      out.print(serviceshop_list.get(i).getId());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
if(null != serviceshop_list.get(i).getImage() && serviceshop_list.get(i).getImage().length() > 0){
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img height=\"150\" width=\"150\" alt=\"\" src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print( imgPath + serviceshop_list.get(i).getPath());
      out.write("&imageName=");
      out.print(serviceshop_list.get(i).getImage());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
}else{
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/img/hx_default.png\" alt=\"\" height=\"150\" width=\"150\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");
}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"shop-inf\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"shop-name clearfix\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<a class=\"carparname\" target=\"_blank\" title=\"");
      out.print(serviceshop_list.get(i).getTitle());
      out.write("\" href=\"");
      out.print(ctx);
      out.write("/former/shopdetail?sp_id=");
      out.print(serviceshop_list.get(i).getId());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
      out.print(serviceshop_list.get(i).getTitle());
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t服务评价：\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

													int all_star = 0;
													int star = 0;
													int ordersize = 0;
													for(int j = 0;j < serviceshop_list.get(i).getComments().size();j ++){
														all_star = all_star + serviceshop_list.get(i).getComments().get(j).getStar();
													}
													if(serviceshop_list.get(i).getComments().size() > 0){
														star = all_star / serviceshop_list.get(i).getComments().size();
													}
													for(int j = 0;j < serviceshop_list.get(i).getOrders().size();j ++){
														if(serviceshop_list.get(i).getOrders().get(j).getState() >= 2 && serviceshop_list.get(i).getOrders().get(j).getState() < 4){
															ordersize ++ ;
														}
													}
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

													for(int k = 0;k < star;k ++){
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/img/star_1.png\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

													}
													for(int k = star;k < 5;k ++){
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/img/star_2.png\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

													}
													if(serviceshop_list.get(i).getComments().size() > 0){
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t较好，");
      out.print(serviceshop_list.get(i).getComments().size());
      out.write("次评分\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

													}else{
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t0次评分\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t");

													}
													
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"descrip\">此门店共完成");
      out.print(ordersize);
      out.write("个安装单，有");
      out.print(serviceshop_list.get(i).getComments().size());
      out.write("条评论</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
}}
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footSection.jsp", out, true);
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$('.daohang_wenzis').attr(\"style\",\"color:#6c6c6c\");\r\n");
      out.write("\t$($('.daohang_wenzi')[4]).attr(\"style\",\"color:#007fcc\");\r\n");
      out.write("\t$('.lunbo').hide();\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("var province = $('#getbyprovince').val();\r\n");
      out.write("var get_city = $('#getbycity').val();\t\r\n");
      out.write("var city = $('#nowcityname').html() + \"市\";\r\n");
      out.write("var markerArr;\r\n");
      out.write("var markerC;\r\n");
      out.write("var icon3 = \"");
      out.print(ctx);
      out.write("/img/icon3.gif\";\r\n");
      out.write("var level = 9;\r\n");
      out.write("var Province = remote_ip_info[\"province\"] + \"省\";\r\n");
      out.write("var City = remote_ip_info[\"city\"];\r\n");
      out.write("if(province.length > 0){\r\n");
      out.write("\tProvince = province;\r\n");
      out.write("\tvar uri = \"");
      out.print(ctx);
      out.write("/former/getnowcity.do?\";\r\n");
      out.write("\tvar now_province = Province;\r\n");
      out.write("\tnow_province = encodeURI(encodeURI(now_province)); \r\n");
      out.write("\turi = uri + \"province=\" + now_province;\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\t\turl: uri,\r\n");
      out.write("\t\t\ttype: \"post\",\r\n");
      out.write("\t\t\tdataType: \"JSON\",\r\n");
      out.write("\t\t\tasync: false,\r\n");
      out.write("\t\t\ttimeout: 3000,\r\n");
      out.write("\t\t\tsuccess: function(ret){\r\n");
      out.write("\t\t\t\tif(ret.nowcity.length > 0){\r\n");
      out.write("\t\t\t\t\tCity = ret.nowcity;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror: function(XMLRequest, textInfo){\r\n");
      out.write("\t\t\t\tif(textInfo != null){\r\n");
      out.write("\t\t\t\t\talert(textInfo);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("}\r\n");
      out.write("if(get_city.length > 0){\r\n");
      out.write("\tCity = get_city;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$('#provinceSelect').change(function(){\r\n");
      out.write("\tvar province = this.options[this.selectedIndex].innerHTML;\r\n");
      out.write("\tprovince = encodeURI(encodeURI(province)); \r\n");
      out.write("\tlocation.href = \"");
      out.print(ctx);
      out.write("/former/getshoplist.do?province=\" + province;\r\n");
      out.write("});\r\n");
      out.write("$('#citySelect').change(function(){\r\n");
      out.write("\tvar city = this.options[this.selectedIndex].innerHTML;\r\n");
      out.write("\tif(city == \"所有\"){\r\n");
      out.write("\t\tvar pro = $('#provinceSelect').val();\r\n");
      out.write("\t\tpro = encodeURI(encodeURI(pro)); \r\n");
      out.write("\t\tlocation.href = \"");
      out.print(ctx);
      out.write("/former/getshoplist.do?province=\" + pro;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tcity = encodeURI(encodeURI(city)); \r\n");
      out.write("\t\tlocation.href = \"");
      out.print(ctx);
      out.write("/former/getshoplist.do?city=\" + city;\r\n");
      out.write("\t}\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function setmarkerArrInfo(){\r\n");
      out.write("\tvar uri = \"");
      out.print(ctx);
      out.write("/former/getshopinfo?\"\r\n");
      out.write("\tif(province.length > 0){\r\n");
      out.write("\t\tprovince = encodeURI(encodeURI(province));\r\n");
      out.write("\t\turi = uri + \"province=\" + province;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tif(get_city.length > 0)\r\n");
      out.write("\t\tget_city = encodeURI(encodeURI(get_city));\r\n");
      out.write("\t\turi = uri + \"city=\" + get_city;\r\n");
      out.write("\t}\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl: uri,\r\n");
      out.write("\t\ttype: \"post\",\r\n");
      out.write("\t\tdataType: \"JSON\",\r\n");
      out.write("\t\tasync: false,\r\n");
      out.write("\t\ttimeout: 3000,\r\n");
      out.write("\t\tsuccess: function(ret){\r\n");
      out.write("\t\t\tmarkerArr = ret;\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror: function(XMLRequest, textInfo){\r\n");
      out.write("\t\t\tif(textInfo != null){\r\n");
      out.write("\t\t\t\talert(textInfo);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("function addressPos_onfocus(obj){\r\n");
      out.write("\tvar nowprovince = Province;\r\n");
      out.write("\tif(province != nowprovince && province.length > 0){\r\n");
      out.write("\t\tnowprovince = province;\r\n");
      out.write("\t}\r\n");
      out.write("\tobj.value = nowprovince;\r\n");
      out.write("}\r\n");
      out.write("function EnterPress(e){\r\n");
      out.write("\tvar e = e || window.event;\r\n");
      out.write("\tif (e.keyCode == 13)\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$(\"#posControl .positionBtn\").click();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("$(function(){\r\n");
      out.write("\tif(City.length == 0){\r\n");
      out.write("\t\tCity = returnCitySN[\"cname\"];\r\n");
      out.write("\t\tif(City.length == 0){\r\n");
      out.write("\t\t\tif(Province.length > 0){\r\n");
      out.write("\t\t\t\tvar uri = \"");
      out.print(ctx);
      out.write("/former/getnowcity.do?\";\r\n");
      out.write("\t\t\t\tvar now_province = remote_ip_info[\"province\"];\r\n");
      out.write("\t\t\t\tnow_province = encodeURI(encodeURI(now_province)); \r\n");
      out.write("\t\t\t\turi = uri + \"province=\" + now_province;\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\turl: uri,\r\n");
      out.write("\t\t\t\t\ttype: \"post\",\r\n");
      out.write("\t\t\t\t\tdataType: \"JSON\",\r\n");
      out.write("\t\t\t\t\tasync: false,\r\n");
      out.write("\t\t\t\t\ttimeout: 3000,\r\n");
      out.write("\t\t\t\t\tsuccess: function(ret){\r\n");
      out.write("\t\t\t\t\t\tif(ret.nowcity.length > 0){\r\n");
      out.write("\t\t\t\t\t\t\tCity = ret.nowcity;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\terror: function(XMLRequest, textInfo){\r\n");
      out.write("\t\t\t\t\t\tif(textInfo != null){\r\n");
      out.write("\t\t\t\t\t\t\talert(textInfo);\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tCity = \"上海市上海市\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tsetmarkerArrInfo();\r\n");
      out.write("\r\n");
      out.write("\tif (Province == \"上海市\" || Province == \"北京市\")\r\n");
      out.write("\t\tlevel += 1;\r\n");
      out.write("\tif (City)\r\n");
      out.write("\t\tlevel += 2;\r\n");
      out.write("\telse if (Province == \"江苏省\")\r\n");
      out.write("\t\tCity = \"丹阳市\";\r\n");
      out.write("\telse if (Province == \"浙江省\")\r\n");
      out.write("\t\tCity = \"杭州市\";\r\n");
      out.write("\tHx.Map.init({\r\n");
      out.write("\t\tmap: \"allmap\",\r\n");
      out.write("\t\tcity: Province + City,\r\n");
      out.write("\t\tlevel: level\r\n");
      out.write("\t});\r\n");
      out.write("\tHx.Map.render(markerArr);\r\n");
      out.write("\r\n");
      out.write("\t$(\"#posControl .positionBtn\").click(function (){\r\n");
      out.write("\t\tvar localSearch = new BMap.LocalSearch(map);\r\n");
      out.write("\t\tlocalSearch.enableAutoViewport();\r\n");
      out.write("\t\tvar keyword = $(\".addressPos\").val();\r\n");
      out.write("\t\tlocalSearch.setSearchCompleteCallback(function (searchResult){\r\n");
      out.write("\t\t\tif (JSON.parse(JSON.stringify(searchResult))._pois.length != 0){\r\n");
      out.write("\t\t\t\t$(\".searchposError\").hide();\r\n");
      out.write("\t\t\t\tif (markerC){\r\n");
      out.write("\t\t\t\t\tmap.removeOverlay(markerC);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tvar poi = searchResult.getPoi(0);\r\n");
      out.write("\t\t\t\t//alert(poi.point.lng + \",\" + poi.point.lat); //获取经度和纬度，将结果显示在文本框中\r\n");
      out.write("\t\t\t\tmap.centerAndZoom(poi.point, 13);\r\n");
      out.write("\t\t\t\tvar icon = new BMap.Icon(icon3, new BMap.Size(20, 40), {\r\n");
      out.write("\t\t\t\t\t//是引用图标的名字以及大小，注意大小要一样\r\n");
      out.write("\t\t\t\t\tanchor: new BMap.Size(10, 40),//这句表示图片相对于所加的点的位置\r\n");
      out.write("\t\t\t\t\timageOffset: new BMap.Size(0, 0)\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\tvar marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat), { icon: icon });  // 创建标注，为要查询的地方对应的经纬度\r\n");
      out.write("\t\t\t\tmarkerC = marker;\r\n");
      out.write("\t\t\t\tmap.addOverlay(marker);\r\n");
      out.write("\t\t\t\tmarker.setTitle((JSON.parse(JSON.stringify(searchResult))).province + (JSON.parse(JSON.stringify(searchResult))._pois[0].title));\r\n");
      out.write("\t\t\t\t$('html, body').animate({ scrollTop: 199 }, 'slow');\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse{\r\n");
      out.write("\t\t\t\t$(\".searchposError\").show();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tlocalSearch.search(keyword);\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
