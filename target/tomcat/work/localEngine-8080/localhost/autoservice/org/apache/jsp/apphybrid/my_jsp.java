package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.common.SmartProperties;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.DecimalFormat;
import com.smart4c.dao.OrderDao;
import com.smart4c.util.SpringUtils;
import java.util.List;
import com.smart4c.dao.UsersDao;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;

public final class my_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");

    String ctx = (String)request.getContextPath();
    UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
    User user = (User)session.getAttribute("user");
//    User user = usersDao.findUserById(2);

      out.write("\r\n");
      out.write("<html class=\"no-js\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"description\" content=\"\">\r\n");
      out.write("    <meta name=\"keywords\" content=\"\">\r\n");
      out.write("    <meta name=\"viewport\"\r\n");
      out.write("          content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\r\n");
      out.write("    <title>我的</title>\r\n");
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
      out.write("        body{ background:#eee;}\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"am-panel am-panel-default\">\r\n");
      out.write("    <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(user.getId());
      out.write("&state=100\">\r\n");
      out.write("        <div class=\"am-panel-hd\"><span  class=\"am-icon-sm am-secondary am-icon-list am-fl\"></span> 我的订单 <p class=\"am-fr\" style=\"margin-top:3px; font-size:14px; color:#999\">查看全部已购买服务　></p>\r\n");
      out.write("        </div>\r\n");
      out.write("    </a>\r\n");
      out.write("    <div class=\"am-panel-bd\">\r\n");
      out.write("        <button type=\"button\" onclick=\"myorder(0)\" class=\"am-btn am-btn-default am-radius  am-btn-sm \">待付款</button>\r\n");
      out.write("        <button type=\"button\" onclick=\"myorder(2)\" class=\"am-btn am-btn-default am-radius  am-btn-sm \">待评价</button>\r\n");
      out.write("        <button type=\"button\" onclick=\"myorder(4)\" class=\"am-btn am-btn-default am-radius  am-btn-sm \">退款单</button>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!--\r\n");
      out.write("<div class=\"am-panel am-panel-default\">\r\n");
      out.write("    <div class=\"am-panel-hd\"><a href=\"\" class=\"am-icon-sm am-secondary am-icon-list\"></a> 猜你喜欢</div>\r\n");
      out.write("    <div class=\"am-panel-bd\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"am-g\">\r\n");
      out.write("            <div class=\"am-u-sm-4\">\r\n");
      out.write("                <div class=\"am-radius\">\r\n");
      out.write("                    <img src=\"");
      out.print(ctx );
      out.write("/zp/6.jpg\" alt=\"\" width=\"80\" height=\"61\"/>\r\n");
      out.write("                    <h3 class=\"am-thumbnail-caption\" style=\"font-size:12px; margin-left:-10px; margin-right:-10px;\">爱车基础保护</h3>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"am-u-sm-4\">\r\n");
      out.write("                <img src=\"");
      out.print(ctx );
      out.write("/zp/6.jpg\" alt=\"\" class=\"am-radius\" width=\"80\" height=\"61\"/>\r\n");
      out.write("                <figcaption class=\"am-thumbnail-caption\" style=\"font-size:12px; margin-left:-10px; margin-right:-10px;\">爱车基础保护</figcaption>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"am-u-sm-4\">\r\n");
      out.write("                <figure class=\"am-radius\">\r\n");
      out.write("                    <img src=\"");
      out.print(ctx );
      out.write("/zp/6.jpg\" alt=\"\" class=\"am-radius\" width=\"80\" height=\"61\"/>\r\n");
      out.write("                    <figcaption class=\"am-thumbnail-caption\" style=\"font-size:12px; margin-left:-10px; margin-right:-10px;\">爱车基础保护</figcaption>\r\n");
      out.write("                </figure>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!--[if (gte IE 9)|!(IE)]><!-->\r\n");
      out.write("    <script src=\"");
      out.print(ctx );
      out.write("/assets/js/jquery.min.js\"></script>\r\n");
      out.write("    <!--<![endif]-->\r\n");
      out.write("    <!--[if lte IE 8 ]>\r\n");
      out.write("    <script src=\"http://libs.baidu.com/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js\"></script>\r\n");
      out.write("    <script src=\"");
      out.print(ctx );
      out.write("/assets/js/amazeui.ie8polyfill.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("    <script src=\"");
      out.print(ctx );
      out.write("/assets/js/amazeui.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        function myorder(state){\r\n");
      out.write("            window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(user.getId());
      out.write("&state=\"+state;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
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
