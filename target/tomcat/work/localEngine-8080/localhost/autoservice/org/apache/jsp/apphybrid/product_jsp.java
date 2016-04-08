package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import java.lang.*;
import com.smart4c.dao.*;
import com.smart4c.bean.*;
import com.smart4c.util.SpringUtils;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import com.smart4c.common.SmartProperties;

public final class product_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String ctx = request.getContextPath();
    JSONObject json =(JSONObject)request.getAttribute("jsonObj");
    int serviceClassId = (Integer)json.get("serviceClassId");
    int curPage =  (Integer)json.get("curPage");
    int totalPages = (Integer) json.get("totalPages");
    JSONArray jarray = json.getJSONArray("dataRows");
    SmartProperties smartProp = SmartProperties.getInstance();
    String imgPath = smartProp.getImgPath();


      out.write("\r\n");
      out.write("<html class=\"no-js\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"keywords\" content=\"\">\r\n");
      out.write("    <meta name=\"viewport\"\r\n");
      out.write("          content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\r\n");
      out.write("    <title>服务列表</title>\r\n");
      out.write("\r\n");
      out.write("    <!-- Set render engine for 360 browser -->\r\n");
      out.write("    <meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("\r\n");
      out.write("    <!-- No Baidu Siteapp-->\r\n");
      out.write("    <meta http-equiv=\"Cache-Control\" content=\"no-siteapp\"/>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" href=\"");
      out.print(ctx );
      out.write("/assets/i/favicon.png\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Add to homescreen for Chrome on Android -->\r\n");
      out.write("    <meta name=\"mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("    <link rel=\"icon\" sizes=\"192x192\" href=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Add to homescreen for Safari on iOS -->\r\n");
      out.write("    <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("    <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\r\n");
      out.write("    <meta name=\"apple-mobile-web-app-title\" content=\"Amaze UI\"/>\r\n");
      out.write("    <link rel=\"apple-touch-icon-precomposed\" href=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Tile icon for Win8 (144x144 + tile color) -->\r\n");
      out.write("    <meta name=\"msapplication-TileImage\" content=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("    <meta name=\"msapplication-TileColor\" content=\"#0e90d2\">\r\n");
      out.write("\r\n");
      out.write("    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->\r\n");
      out.write("    <!--\r\n");
      out.write("    <link rel=\"canonical\" href=\"http://www.example.com/\">\r\n");
      out.write("    -->\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/amazeui.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/app.css\">\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("        body{ background:#eee; padding-top:10px;}\r\n");
      out.write("        #typeone {\r\n");
      out.write("            width:\r\n");
      out.write("        }\r\n");
      out.write("        .formItemDiff {\r\n");
      out.write("            width: 20px;\r\n");
      out.write("            height: 20px;\r\n");
      out.write("            background-image: url(../assets/images/diff.png);\r\n");
      out.write("            background-position: 0px -575px;\r\n");
      out.write("            float: left;\r\n");
      out.write("            margin-top: 0px;\r\n");
      out.write("        }\r\n");
      out.write("        .formItemDiffFirst {\r\n");
      out.write("            margin-left: 0px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div>\r\n");
      out.write("    ");

    for(int i=0;i<jarray.size();i++){
        int star = (Integer) jarray.getJSONObject(i).get("star");
    
      out.write("\r\n");
      out.write("    <div class=\"am-panel am-panel-default\">\r\n");
      out.write("        <div class=\"am-panel-hd\">\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/product-detail.jsp?spId=");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write("\">\r\n");
      out.write("                <div class=\"am-cf\" style=\" margin-left:-15px;\">\r\n");
      out.write("                    <div class=\"am-fl\">\r\n");
      out.write("                        <img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + jarray.getJSONObject(i).get("path"));
      out.write("&imageName=");
      out.print(jarray.getJSONObject(i).get("icon"));
      out.write("\" width=\"80\" height=\"69\"></div>\r\n");
      out.write("                    <div class=\"am-fr\" style=\"margin-top:4px;\">\r\n");
      out.write("                        <li style=\"list-style-type:none; font-size:14px;\">");
      out.print(jarray.getJSONObject(i).get("title"));
      out.write("<br><span style=\"font-size:12px;\">");
      out.print(jarray.getJSONObject(i).get("project"));
      out.write("</span><br>\r\n");
      out.write("\r\n");
      out.write("                    ");
      out.write("\r\n");
      out.write("                      ");
      out.write("\r\n");
      out.write("                        ");
      out.write("\r\n");
      out.write("                          ");
      out.write("\r\n");
      out.write("                            ");
      out.write("\r\n");
      out.write("                              ");
      out.write("\r\n");
      out.write("                              ");
      out.write("\r\n");
      out.write("                              ");
      out.write("\r\n");
      out.write("                              ");
      out.write("\r\n");
      out.write("                               ");
      out.write("\r\n");
      out.write("                              ");
      out.write("\r\n");
      out.write("                            ");
      out.write("\r\n");
      out.write("                          ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        ");
      out.write("\r\n");
      out.write("                      ");
      out.write("\r\n");
      out.write("                    ");
      out.write("\r\n");
      out.write("                    <strong style=\"color:#FF7419\">¥");
      out.print(jarray.getJSONObject(i).get("newprice"));
      out.write("</strong>\r\n");
      out.write("                            ");

                                for(int k = 0;k < star;k ++){
                            
      out.write("\r\n");
      out.write("                            <img src=\"");
      out.print(ctx);
      out.write("/img/star_1.png\" style=\"width: 12px;\">\r\n");
      out.write("                            ");

                                }
                                for(int o = 0;o < 5 - star;o ++){
                            
      out.write("\r\n");
      out.write("                            <img src=\"");
      out.print(ctx);
      out.write("/img/star_2.png\" style=\"width: 12px;\">\r\n");
      out.write("                            ");

                                }
                            
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"am-panel-bd\">\r\n");
      out.write("            <div class=\"am-cf\">\r\n");
      out.write("                <span class=\"am-fr\" style=\"font-size:10px; color:#666666; margin-right:-5px; margin-top:-10px; margin-bottom:-10px;\">本商品已有");
      out.print(jarray.getJSONObject(i).get("buycount"));
      out.write("人购买　<a href=\"");
      out.print(ctx);
      out.write("/apphybrid/order-confirm.jsp?spId=");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write("\" class=\"am-btn am-btn-warning\">立即购买</a></span>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

    }
    
      out.write("\r\n");
      out.write("</div>\r\n");
 if(curPage < totalPages){ 
      out.write("\r\n");
      out.write("    <div align=\"center\"><a href=\"");
      out.print(ctx);
      out.write("/apphybrid/getproductlist.do?scId=");
      out.print(serviceClassId);
      out.write("&page.curPageNo=");
      out.print(curPage+1);
      out.write("\">点击下一页……</a></div>\r\n");
      out.write("\r\n");
 }else{ 
      out.write("\r\n");
      out.write("    <div align=\"center\">已经是最后一页</div>\r\n");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--[if (gte IE 9)|!(IE)]><!-->\r\n");
      out.write("<script src=\"");
      out.print(ctx);
      out.write("/assets/js/jquery.min.js\"></script>\r\n");
      out.write("<!--<![endif]-->\r\n");
      out.write("<!--[if lte IE 8 ]>\r\n");
      out.write("<script src=\"http://libs.baidu.com/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(ctx);
      out.write("/assets/js/amazeui.ie8polyfill.min.js\"></script>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("<script src=\"");
      out.print(ctx);
      out.write("/assets/js/amazeui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://www.pengyaou.com/jquery-1.4.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(document).ready(function(e) {\r\n");
      out.write("        $(\".formItemDiff\").hover(function() {\r\n");
      out.write("            $(this).css(\"background-position\", \"0px -555px\");\r\n");
      out.write("            $(this).prevAll().css(\"background-position\", \"0px -555px\");\r\n");
      out.write("            $(this).nextAll().css(\"background-position\", \"0px -575px\");\r\n");
      out.write("\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
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
