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

public final class upholster_jsp extends org.apache.jasper.runtime.HttpJspBase
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
	ServiceProductDao serviceProductDao = (ServiceProductDao)SpringUtils.getBean(ServiceProductDao.class);
	SmartProperties smartProp = SmartProperties.getInstance();

	int get_by_product = 0;
	List<ServiceProduct> product_list = (List<ServiceProduct>)request.getAttribute("service_product");
	Integer total = (Integer)request.getAttribute("total_product");
	if(product_list == null){
		get_by_product = 87;
		product_list = serviceProductDao.findServiceProductByProgectIdAndNum(87,10,0);
		total = serviceProductDao.findServiceProductByProgectIdAndNum(87,0,0).size();
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
	int product_order = 0;

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <title>帮您养车网－－美容装潢</title>\r\n");
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
      out.write("/css/upholster.css\">\r\n");
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
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\tdiv.lafttitle_line2 {\r\n");
      out.write("\t\tborder-top: 1px #F9F9F9 solid;\r\n");
      out.write("\t\tmargin: 5px 0 0 0;\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv.lafttitle_select, div.lafttitle_unselect, div.lafttitle_name {\r\n");
      out.write("\t\ttext-align: left;\r\n");
      out.write("\t\tpadding-left: 17px;\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv.lafttitle_select a, div.lafttitle_unselect a {\r\n");
      out.write("\t\tfont-size: 0.95em;\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv.lafttitle {\r\n");
      out.write("\t\ttext-align: left; \r\n");
      out.write("\t\tbackground-color: #ffffff;\r\n");
      out.write("\t\tmargin: 0 8px 0 0;\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv.lafttitle_name {\r\n");
      out.write("\t\tbackground-color: #2F3437;\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv.lafttitle_name a {\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\tdiv#ListLeft {\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"all\" id=\"all\">\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "headSection.jsp", out, true);
      out.write("\r\n");
      out.write("<div style=\"background-color: #F5F5F5; padding-top: 10px\">\r\n");
      out.write("\t\t<div id=\"bodySection\" style=\"overflow: hidden;\">\r\n");
      out.write("\t\t\t<div id=\"ListLeft\" style=\"width: 220px\">\r\n");
      out.write("\t\t\t\t<div class=\"leftNavi\">\r\n");
      out.write("\t\t\t\t\t<div class=\"lafttitle\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_name\">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"javascript:void(0)\" style=\"height: 36px; line-height: 36px; color: #F0F0F0; font-size: 0.9em\">美容装潢</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- <div class=\"lafttitle_line1\"></div> -->\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 87 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=87&number=10&start=0\">洗车泥车身清洁</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 89 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=89&number=10&start=0\">打蜡</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 91 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=91&number=10&start=0\">洗车</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 93 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=93&number=10&start=0\">整车抛光封釉</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 95 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=95&number=10&start=0\">整车抛光镀膜</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 97 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=97&number=10&start=0\">整车抛光镀晶</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 99 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=99&number=10&start=0\">车内清洁保养</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 101 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=101&number=10&start=0\">车内消毒</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 103 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=103&number=10&start=0\">清洗脚垫</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 105 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=105&number=10&start=0\">发动机外部清洁</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 107 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=107&number=10&start=0\">套座安装</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 109 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=109&number=10&start=0\">底盘装甲</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"lafttitle_line2\"></div>\r\n");
      out.write("\t\t\t\t\t\t<div ");
      out.print( get_by_product == 111 ? "class='lafttitle_select'" : "class='lafttitle_unselect'" );
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=111&number=10&start=0\">玻璃贴膜(不含/含前挡)工时</a>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<!-- <div class=\"lafttitle_line1\"></div> -->\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div id=\"ProductPage\" style=\"float: left; margin: 0; background-color: #ffffff; border: none; width: 772px\">\r\n");
      out.write("\t\t\t\t<div id=\"Products\">\r\n");
      out.write("\t\t\t\t  \t<!-- product start -->\r\n");
      out.write("\t\t\t\t\t");

					for(int i = 0;i < product_list.size();i ++){
						int star1 = 0;
						for(int j = 0;j < product_list.get(i).getComments().size();j ++){
							star1 = star1 + product_list.get(i).getComments().get(j).getStar();
						}
						if(product_list.get(i).getComments().size() != 0){
							star1 = star1 / product_list.get(i).getComments().size();
						}
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<div style=\"height: 121px; padding: 10px 18px; border-bottom: 1px #F9F9F9 solid\">\r\n");
      out.write("\t\t\t\t\t\t<div style=\"float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"");
      out.print(ctx);
      out.write("/former/getproductinfo?pid=");
      out.print(product_list.get(i).getId());
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t\t");

								if(null != product_list.get(i).getIcon() && product_list.get(i).getIcon().length() > 0){
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + product_list.get(i).getPath());
      out.write("&imageName=");
      out.print(product_list.get(i).getIcon());
      out.write("\" style=\"height:99px; width: 99px;float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t");

								}else{
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/img/hx_default.png\" style=\"height:99px; width: 99px;float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t");

							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</a>\t\r\n");
      out.write("\t\t\t\t\t\t\t<div style=\"display: inline-block; margin: 4px 0 0 10px; float: left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div style=\"margin-bottom: 15px;\"><a href=\"");
      out.print(ctx);
      out.write("/former/getproductinfo?pid=");
      out.print(product_list.get(i).getId());
      out.write("\"><span style=\"font-size: 0.9em; color: #333333\">");
      out.print(product_list.get(i).getTitle());
      out.write("</span></a></div>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div style=\"margin-bottom: 11px;\"><span style=\"font-size: 0.7em; color: #999999\">");
      out.print(product_list.get(i).getAbstract_());
      out.write("</span></div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t");

									for(int k = 0;k < star1;k ++){
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/img/star_1.png\" style=\"width: 12px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

								}
									for(int o = 0;o < 5 - star1;o ++){
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<img src=\"");
      out.print(ctx);
      out.write("/img/star_2.png\" style=\"width: 12px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t");

								}
								
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t\t<div style=\"float: right; padding: 6px 18px\">\r\n");
      out.write("\t\t\t\t\t\t\t<div style=\"margin-bottom: 16px\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<span style=\"font-size: 1em; color: #FF7418; margin-right: 4px\"><span >￥</span>");
      out.print(df.format(product_list.get(i).getNewprice()));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<!-- <span style=\"text-decoration: line-through; font-size: 0.7em; color: #999999\">￥<span>40.00</span></span> -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<del style=\"font-size: 0.7em; color: #999999\">￥<del>");
      out.print(df.format(product_list.get(i).getOldprice()));
      out.write("</del></del>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"addtocart(");
      out.print(product_list.get(i).getId());
      out.write(")\"><div style=\"width: 127px; height: 34px; line-height: 34px; color: #ffffff; font-size: 0.9em; background-color: #FF7418; text-align: center; margin-bottom: 9px\">加入服务车</div></a>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<div><span style=\"font-size: 0.7em; color: #999999;\">本商品已有<span>");
      out.print( product_list.get(i).getOrders().size());
      out.write("</span>人购买</span></div>\r\n");
      out.write("\t\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t</div>\t\r\n");
      out.write("\t\t\t\t\t");

					}
					if(product_list.size() == 0){
					
      out.write("\r\n");
      out.write("\t\t\t\t\t<div style=\"border-bottom: 1px solid #e1e1e1;\">\r\n");
      out.write("\t\t\t\t\t\t<span>暂时没有该项服务的产品</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t");

					}
					
      out.write("\t\r\n");
      out.write("\t\t\t\t\t<!-- product end -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"pager\">\r\n");
      out.write("\t\t\t\t\t\t");

							if(pagenum > 1){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<a class=\"disabled first-child\" onclick=\"changepage(this.innerHTML,this)\">上一页</a>\r\n");
      out.write("\t\t\t\t\t\t");

							if(pagenum > 10){
								for(int i = 0;i < 8;i ++){
									if(i == 0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"current\" onclick=\"changepage(this.innerHTML,this)\">1</a>\r\n");
      out.write("\t\t\t\t\t\t");

									}else{
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"changepage(this.innerHTML,this)\">");
      out.print(i + 1);
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t");

									}
								}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<span>...</span>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"changepage(this.innerHTML,this)\">");
      out.print(pagenum - 1);
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"changepage(this.innerHTML,this)\">");
      out.print(pagenum);
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t");

							}else{
								for(int i = 0;i < pagenum;i ++){
									if(i == 0){
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"current\" onclick=\"changepage(this.innerHTML,this)\">1</a>\r\n");
      out.write("\t\t\t\t\t\t");

									}else{
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"javascript:void(0)\" onclick=\"changepage(this.innerHTML,this)\">");
      out.print(i + 1);
      out.write("</a>\r\n");
      out.write("\t\t\t\t\t\t");

									}
								}
							}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<a class=\"last-child\" href=\"javascript:void(0)\" onclick=\"changepage(this.innerHTML,this)\">下一页</a>\r\n");
      out.write("\t\t\t\t\t\t");

							}else{
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<a class=\"disabled first-child\">上一页</a>\r\n");
      out.write("\t\t\t\t\t\t<a class=\"current\">1</a>\r\n");
      out.write("\t\t\t\t\t\t<a class=\"disabled last-child\" href=\"javascript:void(0)\">下一页</a>\r\n");
      out.write("\t\t\t\t\t\t");

							}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"searchbyfuzzy\" value=\"");
      out.print(searchbyfuzzy);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"fuzzystring\" value=\"");
      out.print(fuzzystring);
      out.write("\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("</div>\t\t\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footSection.jsp", out, true);
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$('.daohang_wenzis').attr(\"style\",\"color:#6c6c6c\");\r\n");
      out.write("\t$($('.daohang_wenzi')[2]).attr(\"style\",\"color:#007fcc\");\r\n");
      out.write("});\r\n");
      out.write("var page_html1 = \"<a class='first-child' onclick='changepage(this.innerHTML,this)'><</a><a onclick='changepage(this.innerHTML,this)'>1</a><a  onclick='changepage(this.innerHTML,this)'>2</a><span>...</span><a onclick='changepage(this.innerHTML,this)'>6</a><a onclick='changepage(this.innerHTML,this)'>7</a><a class='current' onclick='changepage(this.innerHTML,this)'>8</a><a onclick='changepage(this.innerHTML,this)'>9</a><a onclick='changepage(this.innerHTML,this)'>10</a><span>...</span><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 1);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum);
      out.write("</a><a class='last-child' href='javascript:void(0)' onclick='changepage(this.innerHTML,this)'>></a>\";\r\n");
      out.write("var page_html2 = \"<a class='first-child' onclick='changepage(this.innerHTML,this)'><</a><a onclick='changepage(this.innerHTML,this)'>1</a><a  onclick='changepage(this.innerHTML,this)'>2</a><span>...</span><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 7);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 6);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 5);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 4);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 3);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 2);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 1);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum);
      out.write("</a><a class='last-child' href='javascript:void(0)' onclick='changepage(this.innerHTML,this)'>></a>\";\r\n");
      out.write("var page_html3 = \"<a class='first-child' onclick='changepage(this.innerHTML,this)'><</a><a onclick='changepage(this.innerHTML,this)'>1</a><a  onclick='changepage(this.innerHTML,this)'>2</a><a onclick='changepage(this.innerHTML,this)'>3</a><a onclick='changepage(this.innerHTML,this)'>4</a><a onclick='changepage(this.innerHTML,this)'>5</a><a onclick='changepage(this.innerHTML,this)'>6</a><a onclick='changepage(this.innerHTML,this)'>7</a><a onclick='changepage(this.innerHTML,this)'>8</a><span>...</span><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum - 1);
      out.write("</a><a onclick='changepage(this.innerHTML,this)'>");
      out.print(pagenum);
      out.write("</a><a class='last-child' href='javascript:void(0)' onclick='changepage(this.innerHTML,this)'>></a>\";\r\n");
      out.write("\r\n");
      out.write("function addtocart(id){\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl: \"");
      out.print(request.getContextPath());
      out.write("/former/addtocart.do?number=1&sp_id=\" + id,\r\n");
      out.write("\t\ttype: \"post\",\r\n");
      out.write("\t\tdataType: \"JSON\",\r\n");
      out.write("\t\tasync: false,\r\n");
      out.write("\t\ttimeout: 3000,\r\n");
      out.write("\t\tsuccess: function(ret){\r\n");
      out.write("\t\t\tif(ret.addtocart == true){\r\n");
      out.write("\t\t\t\tsAlert(\"成功添加到服务车\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(ret.addtocart == false){\r\n");
      out.write("\t\t\t\tsAlert(\"该服务已经在服务车中了\");\r\n");
      out.write("\t\t\t}\t\t\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror: function(XMLRequest, textInfo){\r\n");
      out.write("\t\t\tif(textInfo != null){\r\n");
      out.write("\t\t\t\talert(textInfo);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function changepage(shownum,obj){\r\n");
      out.write("\tvar totalnum = Number($('#total_page').val());\r\n");
      out.write("\tvar addnum  = 0;\r\n");
      out.write("\tvar oldpage = 0;\r\n");
      out.write("\tvar newpage = 0;\r\n");
      out.write("\tvar page_num = $('.pager a').length;\r\n");
      out.write("\tvar startnum = 0;\r\n");
      out.write("\tvar orderby = 0;\r\n");
      out.write("\tvar sp_id = ");
      out.print(get_by_product);
      out.write(";\r\n");
      out.write("\r\n");
      out.write("\tfor(var i = 0;i < $('.orderBy a').length;i ++){\r\n");
      out.write("\t\tif($('.orderBy a')[i].className == \"orderType selected\"){\r\n");
      out.write("\t\t\torderby = $($('.orderBy a')[i]).data().id;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(page_num > 3){\r\n");
      out.write("\t\tfor(var i = 1;i <= page_num - 2;i ++){\r\n");
      out.write("\t\t\tif($('.pager a')[i].className == \"current\"){\r\n");
      out.write("\t\t\t\t$('.pager a')[i].className = \"\";\r\n");
      out.write("\t\t\t\toldpage = Number($('.pager a')[i].innerHTML);\r\n");
      out.write("\t\t\t\tbreak;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(shownum == \"上一页\"){\r\n");
      out.write("\t\taddnum = -1;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(shownum == \"下一页\"){\r\n");
      out.write("\t\taddnum = 1;\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\tif(addnum != 0){\r\n");
      out.write("\t\tnewpage = oldpage + addnum;\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tnewpage = Number(shownum);\r\n");
      out.write("\t}\r\n");
      out.write("\tif(newpage == totalnum){\t\r\n");
      out.write("\t\t// $('.totalPage a')[0].className = \"\";\r\n");
      out.write("\t\t// $('.totalPage a')[1].className = \"disabled\";\r\n");
      out.write("\t\tif(page_num > 3){\r\n");
      out.write("\t\t\t$('.pager a')[page_num - 1].className = \"disabled first-child\";\r\n");
      out.write("\t\t\t$('.pager a')[0].className = \"first-child\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(newpage == 1){\r\n");
      out.write("\t\t// $('.totalPage a')[0].className = \"disabled\";\r\n");
      out.write("\t\t// $('.totalPage a')[1].className = \"\";\r\n");
      out.write("\t\tif(page_num > 3){\r\n");
      out.write("\t\t\t$('.pager a')[0].className = \"disabled first-child\";\r\n");
      out.write("\t\t\t$('.pager a')[page_num - 1].className = \"first-child\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t$('.currentPage').html(newpage);\r\n");
      out.write("\tif(newpage < totalnum && newpage != 1){\r\n");
      out.write("\t\t// $('.totalPage a')[0].className = \"\";\r\n");
      out.write("\t\t// $('.totalPage a')[1].className = \"\";\r\n");
      out.write("\t\tif(page_num > 3){\r\n");
      out.write("\t\t\t$('.pager a')[0].className = \"first-child\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tif(addnum != 0){\r\n");
      out.write("\t\tfor(var i = 1;i <= page_num - 2;i ++){\r\n");
      out.write("\t\t\tvar show_num = Number($('.pager a')[i].innerHTML);\r\n");
      out.write("\t\t\tif(show_num == newpage){\r\n");
      out.write("\t\t\t\t$('.pager a')[i].className = \"current\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tobj.className = \"current\";\r\n");
      out.write("\t}\r\n");
      out.write("\tif(newpage != 1){\r\n");
      out.write("\t\tstartnum = (newpage - 1) * 9;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//修改页数显示\r\n");
      out.write("\tif(totalnum > 10){\r\n");
      out.write("\t\tif(newpage > 7){\r\n");
      out.write("\t\t\tif(newpage + 7 <= totalnum){\r\n");
      out.write("\t\t\t\t$('.pager').html(page_html1);\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\t$('.pager').html(page_html2);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$('.pager').html(page_html3);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tvar haspage = false;\r\n");
      out.write("\t\tfor(var k = 1;k < $('.pager a').length;k ++){\r\n");
      out.write("\t\t\tif(newpage == $('.pager a')[k].innerHTML){\r\n");
      out.write("\t\t\t\t$('.pager a')[k].className = \"current\";\r\n");
      out.write("\t\t\t\thaspage = true;\r\n");
      out.write("\t\t\t\tbreak;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(!haspage){\r\n");
      out.write("\t\t\t\tif($('.pager span').length == 2){\r\n");
      out.write("\t\t\t\t\t$('.pager a')[3].innerHTML = newpage - 2;\r\n");
      out.write("\t\t\t\t\t$('.pager a')[4].innerHTML = newpage - 1;\r\n");
      out.write("\t\t\t\t\t$('.pager a')[5].innerHTML = newpage;\r\n");
      out.write("\t\t\t\t\t$('.pager a')[6].innerHTML = newpage + 1;\r\n");
      out.write("\t\t\t\t\t$('.pager a')[7].innerHTML = newpage + 2;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tif(newpage == totalnum){\t\r\n");
      out.write("\t\t\t$('.pager a')[page_num - 1].className = \"disabled first-child\";\r\n");
      out.write("\t\t\t$('.pager a')[0].className = \"first-child\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(newpage == 1){\r\n");
      out.write("\t\t\t$('.pager a')[0].className = \"disabled first-child\";\r\n");
      out.write("\t\t\t$('.pager a')[page_num - 1].className = \"first-child\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tvar byfuzzy = $('input[id=\"searchbyfuzzy\"]').val();\r\n");
      out.write("\tvar fuzzystring = $('#fuzzystring').val();\r\n");
      out.write("\tvar uri = \"");
      out.print(ctx);
      out.write("/former/getproductbypage?sp_id=\" + sp_id + \"&number=9&start=\" + startnum;\r\n");
      out.write("\tif(orderby > 0){\r\n");
      out.write("\t\turi = uri + \"&orderby=\" + orderby;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(byfuzzy == \"0\"){\r\n");
      out.write("\t\turi = uri + \"&searchbyfuzzy=1&fuzzystring=\" + fuzzystring;\r\n");
      out.write("\t}\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl: uri,\r\n");
      out.write("\t\ttype: \"post\",\r\n");
      out.write("\t\tdataType: \"JSON\",\r\n");
      out.write("\t\tasync: false,\r\n");
      out.write("\t\ttimeout: 3000,\r\n");
      out.write("\t\tsuccess: function(ret){\r\n");
      out.write("\t\t\t$('#Products table').html(ret.html);\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror: function(XMLRequest, textInfo){\r\n");
      out.write("\t\t\tif(textInfo != null){\r\n");
      out.write("\t\t\t\talert(textInfo);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
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
