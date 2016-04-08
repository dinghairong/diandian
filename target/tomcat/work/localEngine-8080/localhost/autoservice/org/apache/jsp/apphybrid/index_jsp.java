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

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");

    String ctx = request.getContextPath();
    UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
//    User user = (User)session.getAttribute("user");
//    User user = usersDao.findUserById(2);
//    if(user == null){
//        response.sendRedirect(ctx + "/logout.jsp");
//        return;
//    }
    ServiceClassDao serviceClassDao = (ServiceClassDao)SpringUtils.getBean(ServiceClassDao.class);
    List<ServiceClass> scList = serviceClassDao.getAllClass();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html class=\"no-js\">\r\n");
      out.write("<head>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"keywords\" content=\"\">\r\n");
      out.write("        <meta name=\"viewport\"\r\n");
      out.write("              content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\r\n");
      out.write("        <title>首页</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- Set render engine for 360 browser -->\r\n");
      out.write("        <meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("\r\n");
      out.write("        <!-- No Baidu Siteapp-->\r\n");
      out.write("        <meta http-equiv=\"Cache-Control\" content=\"no-siteapp\"/>\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"");
      out.print(ctx );
      out.write("/assets/i/favicon.png\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Add to homescreen for Chrome on Android -->\r\n");
      out.write("        <meta name=\"mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("        <link rel=\"icon\" sizes=\"192x192\" href=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Add to homescreen for Safari on iOS -->\r\n");
      out.write("        <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("        <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\r\n");
      out.write("        <meta name=\"apple-mobile-web-app-title\" content=\"Amaze UI\"/>\r\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" href=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Tile icon for Win8 (144x144 + tile color) -->\r\n");
      out.write("        <meta name=\"msapplication-TileImage\" content=\"");
      out.print(ctx );
      out.write("/assets/i/app-icon72x72@2x.png\">\r\n");
      out.write("        <meta name=\"msapplication-TileColor\" content=\"#0e90d2\">\r\n");
      out.write("\r\n");
      out.write("        <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->\r\n");
      out.write("        <!--\r\n");
      out.write("        <link rel=\"canonical\" href=\"http://www.example.com/\">\r\n");
      out.write("        -->\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/amazeui.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/app.css\">\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            .wang{ width:100%; height:auto;}\r\n");
      out.write("            .wang ul{ list-style-type:none;}\r\n");
      out.write("            .wang ul li{ float:left;}\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-g\" style=\"padding-top:30px; padding-left:20px;\">\r\n");
      out.write("\r\n");
      out.write("        ");

        for(int i=0;i<scList.size();i++){
        
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"am-u-sm-6\">\r\n");
      out.write("        <a  href=\"");
      out.print(ctx);
      out.write("/apphybrid/getproductlist.do?scId=");
      out.print(scList.get(i).getId());
      out.write("&page.curPageNo=1\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/zp/");
      out.print((i+2));
      out.write(".jpg\" alt=\"\" width=\"90%\" height=\"90%\"/>\r\n");
      out.write("        </a>\r\n");
      out.write("    </div>\r\n");
      out.write("        ");

        }
        
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<header class=\"am-topbar  am-topbar-fixed-bottom\">\r\n");
      out.write("    <ul style=\"list-style-type:none; text-align:center\">\r\n");
      out.write("        <li style=\"float:left; width:85px; padding-top:10px; color:#0066FF\"><a href=\"");
      out.print(ctx);
      out.write("/apphybrid/index.jsp\">首页</a><span class=\"am-icon-caret-down\"></span><ul class=\"am-dropdown-content\">\r\n");
      out.write("            ...\r\n");
      out.write("        </ul></li>\r\n");
      out.write("        <li style=\"float:left; width:85px; padding-top:10px;\">评价 <span class=\"am-icon-caret-down\"></span><ul class=\"am-dropdown-content\">\r\n");
      out.write("            ...\r\n");
      out.write("        </ul></li>\r\n");
      out.write("        <li style=\"float:left; width:85px; padding-top:10px;\"><a href=\"javascript:gomy()\">我的</a> <span class=\"am-icon-caret-down\"></span><ul class=\"am-dropdown-content\">\r\n");
      out.write("            ...\r\n");
      out.write("        </ul></li>\r\n");
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("</header>\r\n");
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
      out.write("<script src=\"http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(ctx);
      out.write("/js/config.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("    // ctk_config in config.js\r\n");
      out.write("    ctk_config.timestamp = Math.floor((+new Date()) / 1000);\r\n");
      out.write("    ctk_config.jsApiList = ['logged','login'];\r\n");
      out.write("\r\n");
      out.write("    try{\r\n");
      out.write("        ctk.config(ctk_config.appkey,\r\n");
      out.write("                ctk_config.serviceId,\r\n");
      out.write("                ctk_config. timestamp,\r\n");
      out.write("                ctk_config.charset,\r\n");
      out.write("                ctk_config.signType,\r\n");
      out.write("                ctk_config.host,\r\n");
      out.write("                ctk_config.jsApiList,\r\n");
      out.write("                ctk_config.sign);\r\n");
      out.write("    }catch(e){\r\n");
      out.write("        alert(e);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function gomy(){\r\n");
      out.write("\r\n");
      out.write("        function doLoginByAccessToken(accessToken){\r\n");
      out.write("            $.post('loginByAccessToken.do',{\r\n");
      out.write("                accessToken: accessToken,\r\n");
      out.write("                type: 'touchlife'\r\n");
      out.write("            }, function(data){\r\n");
      out.write("                console.log(JSON.stringify(data));\r\n");
      out.write("                if(data.result == 0){\r\n");
      out.write("                    location.href = '");
      out.print(ctx);
      out.write("/apphybrid/my.do';\r\n");
      out.write("                }\r\n");
      out.write("               else{\r\n");
      out.write("                    alert('登录错误:'+JSON.stringify(data));\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("        };\r\n");
      out.write("\r\n");
      out.write("        ctk.logged({\r\n");
      out.write("            yes:function(res){\r\n");
      out.write("                doLoginByAccessToken(res.accessToken);\r\n");
      out.write("            },\r\n");
      out.write("            no:function(){\r\n");
      out.write("                ctk.login({\r\n");
      out.write("                    success: function(res){\r\n");
      out.write("                        doLoginByAccessToken(res.accessToken);\r\n");
      out.write("                    },\r\n");
      out.write("                    fail: function(){\r\n");
      out.write("                        alert('无法打开登录框');\r\n");
      out.write("                    }\r\n");
      out.write("                })\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
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
