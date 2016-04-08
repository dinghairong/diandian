package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.dao.AreaDetailDao;
import com.smart4c.util.SpringUtils;
import com.smart4c.dao.ServiceShopDao;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import java.util.ArrayList;
import com.smart4c.util.Page;
import com.smart4c.common.SmartProperties;

public final class store_002dchoose_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    String ctx = request.getContextPath();
    AreaDetailDao areaDetailDao = (AreaDetailDao) SpringUtils.getBean(AreaDetailDao.class);
    ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
    List<String> provinceList = areaDetailDao.findProvince();
    List<String> cityList = new ArrayList<String>();
    List<String> countryList = new ArrayList<String>();
    String province = (String)request.getAttribute("province");
    if(StringUtils.isEmpty(province)){
        province = "";
    }
    if(StringUtils.isNotEmpty(province)){
        cityList = areaDetailDao.getCites(province);
    }
    String city = (String)request.getAttribute("city");
    if(StringUtils.isEmpty(city)){
        city = "";
    }
    if(StringUtils.isNotEmpty(province) && StringUtils.isNotEmpty(city)){
        countryList = areaDetailDao.getCounties(province,city);
    }
    String country = (String)request.getAttribute("country");
    if(StringUtils.isEmpty(country)){
        country = "";
    }
    Long totalRecords = (Long)request.getAttribute("totalRecords");
    long totalPages = 0;
     totalPages = totalRecords / 10;
    if (totalRecords % 10 != 0) {
        totalPages += 1;
    }
    int curPage = (Integer)request.getAttribute("curPageNo");
    List<ServiceShop> serviceshopList = (List<ServiceShop>)request.getAttribute("serviceshop");
    SmartProperties smartProp = SmartProperties.getInstance();
    String imgPath = smartProp.getImgPath();


      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html class=\"no-js\">\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("  <meta name=\"description\" content=\"\">\r\n");
      out.write("  <meta name=\"keywords\" content=\"\">\r\n");
      out.write("  <meta name=\"viewport\"\r\n");
      out.write("        content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\r\n");
      out.write("  <title>选择门店</title>\r\n");
      out.write("\r\n");
      out.write("  <!-- Set render engine for 360 browser -->\r\n");
      out.write("  <meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("\r\n");
      out.write("  <!-- No Baidu Siteapp-->\r\n");
      out.write("  <meta http-equiv=\"Cache-Control\" content=\"no-siteapp\"/>\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" href=\"");
      out.print(ctx );
      out.write("/assets/i/favicon.png\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Add to homescreen for Chrome on Android -->\r\n");
      out.write("  <meta name=\"mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("  <link rel=\"icon\" sizes=\"192x192\" href=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Add to homescreen for Safari on iOS -->\r\n");
      out.write("  <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("  <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\r\n");
      out.write("  <meta name=\"apple-mobile-web-app-title\" content=\"Amaze UI\"/>\r\n");
      out.write("  <link rel=\"apple-touch-icon-precomposed\" href=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("\r\n");
      out.write("  <!-- Tile icon for Win8 (144x144 + tile color) -->\r\n");
      out.write("  <meta name=\"msapplication-TileImage\" content=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("  <meta name=\"msapplication-TileColor\" content=\"#0e90d2\">\r\n");
      out.write("\r\n");
      out.write("  <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->\r\n");
      out.write("  <!--\r\n");
      out.write("  <link rel=\"canonical\" href=\"http://www.example.com/\">\r\n");
      out.write("  -->\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/amazeui.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/app.css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("body{ background:#eee;}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div data-am-widget=\"tabs\"\r\n");
      out.write("       class=\"am-tabs am-tabs-d2\"\r\n");
      out.write("        >\r\n");
      out.write("      <ul class=\"am-tabs-nav am-cf\">\r\n");
      out.write("          <li class=\"\">\r\n");
      out.write("              <select id=\"province\">\r\n");
      out.write("                  <option value=\"0\">请选择省份</option>\r\n");
      out.write("                  ");
 if(provinceList != null && provinceList.size() > 0) {
                      for(int i =0;i<provinceList.size();i++){
                          if(province.equals(provinceList.get(i))){

                    
      out.write("\r\n");
      out.write("                  <option selected=\"selected\">");
      out.print(provinceList.get(i));
      out.write("</option>\r\n");
      out.write("                  ");
}else{
      out.write("\r\n");
      out.write("                  <option>");
      out.print(provinceList.get(i));
      out.write("</option>\r\n");
      out.write("                  ");
}}}
      out.write("\r\n");
      out.write("              </select>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"\">\r\n");
      out.write("              <select id=\"city\">\r\n");
      out.write("                  <option value=\"0\">请选择城市</option>\r\n");
      out.write("                  ");
 if(cityList != null && cityList.size() > 0) {
                      for(int i =0;i<cityList.size();i++){
                          if(city.equals(cityList.get(i))){

                  
      out.write("\r\n");
      out.write("                  <option selected=\"selected\">");
      out.print(cityList.get(i));
      out.write("</option>\r\n");
      out.write("                  ");
}else{
      out.write("\r\n");
      out.write("                  <option>");
      out.print(cityList.get(i));
      out.write("</option>\r\n");
      out.write("                  ");
}}}
      out.write("\r\n");
      out.write("              </select>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"\">\r\n");
      out.write("              <select id=\"country\">\r\n");
      out.write("                  <option value=\"0\">请选择县/区</option>\r\n");
      out.write("                  ");
 if(countryList != null && countryList.size() > 0) {
                      for(int i =0;i<countryList.size();i++){
                          if(country.equals(countryList.get(i))){

                  
      out.write("\r\n");
      out.write("                  <option selected=\"selected\">");
      out.print(countryList.get(i));
      out.write("</option>\r\n");
      out.write("                  ");
}else{
      out.write("\r\n");
      out.write("                  <option>");
      out.print(countryList.get(i));
      out.write("</option>\r\n");
      out.write("                  ");
}}}
      out.write("\r\n");
      out.write("              </select>\r\n");
      out.write("          </li>\r\n");
      out.write("      </ul>\r\n");
      out.write("      <div class=\"am-tabs-bd\">\r\n");
      out.write("          <div data-tab-panel-0 class=\"am-tab-panel am-active\">\r\n");
      out.write("            \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<div data-am-widget=\"list_news\" class=\"am-list-news am-list-news-default\" style=\"margin-right:5px;\" >\r\n");
      out.write("  <!--列表标题-->\r\n");
      out.write("\r\n");
      out.write("  <div class=\"am-list-news-bd\">\r\n");
      out.write("      <div align=\"left\">共有门店：");
      out.print(totalRecords==null?0:totalRecords);
      out.write("家，为您提供服务。</div>\r\n");
      out.write("  <ul class=\"am-list\">\r\n");
      out.write("    ");
 if(serviceshopList != null && serviceshopList.size()>0) {
        for(int i=0;i<serviceshopList.size();i++){
    
      out.write("\r\n");
      out.write("     <!--缩略图在标题左边-->\r\n");
      out.write("      <li class=\"am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left\">\r\n");
      out.write("        <div class=\"am-u-sm-4 am-list-thumb\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + serviceshopList.get(i).getPath());
      out.write("&imageName=");
      out.print(serviceshopList.get(i).getImage());
      out.write("\" alt=\"\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\" am-u-sm-8 am-list-main am-text-truncate\">\r\n");
      out.write("            <h3 class=\"am-list-item-hd am-text-truncate\">门店名称：");
      out.print(serviceshopList.get(i).getTitle());
      out.write("</h3>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"am-list-item-text \" style=\"font-size:10px;\">门店地址：");
      out.print(serviceshopList.get(i).getAddress());
      out.write("</div>\r\n");
      out.write("            <div class=\"am-list-item-text am-btn-xs\"><button type=\"button\" class=\"am-btn am-btn-secondary am-btn-xs\" onclick=\"select(");
      out.print(serviceshopList.get(i).getId());
      out.write(")\">选择门店</button></div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("      </li>\r\n");
      out.write("\r\n");
}}else{
      out.write("\r\n");
      out.write("    暂无(请选择省市县)\r\n");
      out.write("\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("            ");
 if(serviceshopList != null && serviceshopList.size()>0){if(curPage < totalPages){ 
      out.write("\r\n");
      out.write("            <div align=\"center\"><a href=\"");
      out.print(ctx);
      out.write("/apphybrid/storeChoose.do?province=");
      out.print(province);
      out.write("&city=");
      out.print(city);
      out.write("&country=");
      out.print(country);
      out.write("&page.curPageNo=");
      out.print(curPage+1);
      out.write("\">点击下一页……</a></div>\r\n");
      out.write("\r\n");
      out.write("            ");
 }else{ 
      out.write("\r\n");
      out.write("            <div align=\"center\">已经是最后一页</div>\r\n");
      out.write("            ");
 } }
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("          </div>\r\n");
      out.write("      </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--[if (gte IE 9)|!(IE)]><!-->\r\n");
      out.write("<script src=\"");
      out.print(ctx );
      out.write("/assets/js/jquery.min.js\"></script>\r\n");
      out.write("<!--<![endif]-->\r\n");
      out.write("<!--[if lte IE 8 ]>\r\n");
      out.write("<script src=\"http://libs.baidu.com/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(ctx );
      out.write("/assets/js/amazeui.ie8polyfill.min.js\"></script>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("<script src=\"");
      out.print(ctx );
      out.write("/assets/js/amazeui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $('#province').change(function(){\r\n");
      out.write("        var province = this.options[this.selectedIndex].innerHTML;\r\n");
      out.write("        province = encodeURI(province);\r\n");
      out.write("        location.href = \"");
      out.print(ctx);
      out.write("/apphybrid/storeChoose.do?province=\"+province;\r\n");
      out.write("    });\r\n");
      out.write("    $('#city').change(function(){\r\n");
      out.write("        var city = this.options[this.selectedIndex].innerHTML;\r\n");
      out.write("        var province = jQuery(\"#province  option:selected\").text();\r\n");
      out.write("        var uri = \"");
      out.print(ctx);
      out.write("/apphybrid/storeChoose.do?province=\"+province+\"&city=\"+city;\r\n");
      out.write("        location.href = encodeURI(uri);\r\n");
      out.write("    });\r\n");
      out.write("    $('#country').change(function(){\r\n");
      out.write("        var country = this.options[this.selectedIndex].innerHTML;\r\n");
      out.write("        var province = jQuery(\"#province  option:selected\").text();\r\n");
      out.write("        var city = jQuery(\"#city  option:selected\").text();\r\n");
      out.write("        var uri = \"");
      out.print(ctx);
      out.write("/apphybrid/storeChoose.do?province=\"+province+\"&city=\"+city+\"&country=\"+country;\r\n");
      out.write("        location.href =  encodeURI(uri);\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    function select(serviceShopId){\r\n");
      out.write("        location.href = \"");
      out.print(ctx);
      out.write("/apphybrid/order-confirm.jsp?serviceShopId=\"+serviceShopId;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
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
