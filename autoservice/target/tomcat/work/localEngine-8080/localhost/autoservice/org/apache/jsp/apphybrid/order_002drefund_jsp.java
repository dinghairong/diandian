package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.dao.OrderDao;
import com.smart4c.util.SpringUtils;
import com.smart4c.dao.UsersDao;

public final class order_002drefund_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String ctx = request.getContextPath();
    UsersDao usersDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
    User user = (User)session.getAttribute("user");
    String orderId = request.getParameter("orderId");
    OrderDao orderDao = (OrderDao) SpringUtils.getBean(OrderDao.class);
    Order order = orderDao.findOrderById(Integer.valueOf(orderId));

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
      out.write("  <title>申请退款</title>\r\n");
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
      out.write("  <style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".STYLE2 {color: #ff780f}\r\n");
      out.write("-->\r\n");
      out.write("        .square {\r\n");
      out.write("            border: solid #dadada 1px;\r\n");
      out.write("            height: 0;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            padding-bottom: 100%;\r\n");
      out.write("        }\r\n");
      out.write("        .theme-bg{\r\n");
      out.write("            background: #FF7419;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("        }\r\n");
      out.write("        .theme-btn{\r\n");
      out.write("            border: solid #FF7419 1px;\r\n");
      out.write("            background: #fff;\r\n");
      out.write("            color: #dbbc5f;\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("        .theme-btn.am-active{\r\n");
      out.write("            background: #dbbc5f;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            box-shadow: none;\r\n");
      out.write("            -webkit-box-shadow: none;\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .theme-btn:hover{\r\n");
      out.write("        color: #dbbc5f;\r\n");
      out.write("        }\r\n");
      out.write("        .theme-btn:hover.am-active{\r\n");
      out.write("            color: #fff;\r\n");
      out.write("        }\r\n");
      out.write(" body{ background:#eee; margin-top:-10px;}\r\n");
      out.write("  </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<header class=\"am-topbar am-topbar-fixed-bottom\">\r\n");
      out.write("    <div class=\"\">\r\n");
      out.write("        <button type=\"button\" onclick=\"refundOrder()\" class=\"am-topbar-btn am-btn  theme-bg am-btn-block\" id=\"btn-submit\">提交申请</button>\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul class=\"am-list\">\r\n");
      out.write("  <li style=\"padding:5px 8px; line-height:30px;\">订单编号：");
      out.print(order.getSerialnumber());
      out.write("\r\n");
      out.write("<br>服务项目：");
      out.print(order.getServiceProduct().getTitle());
      out.write("\r\n");
      out.write("<br>订单金额：");
      out.print(order.getPaid());
      out.write("元\r\n");
      out.write("<br>\r\n");
      out.write("<br>退款原因：<input  type=\"text\" id=\"reason\" name=\"reason\" placeholder=\"退款原因\"/></li>\r\n");
      out.write("</ul>\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-modal am-modal-confirm\" tabindex=\"-1\" id=\"refund\">\r\n");
      out.write("    <div class=\"am-modal-dialog\">\r\n");
      out.write("        <div class=\"am-modal-hd\">警告</div>\r\n");
      out.write("        <div class=\"am-modal-bd\">\r\n");
      out.write("            你，确定申请退款吗？\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"am-modal-footer\">\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-cancel>算了</span>\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-confirm>确定</span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
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
      out.write("<script src=\"");
      out.print(ctx );
      out.write("/assets/js/amazeui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    function refundOrder(){\r\n");
      out.write("        var reason = $(\"#reason\").val();\r\n");
      out.write("        var uri=encodeURI(\"");
      out.print(ctx);
      out.write("/apphybrid/refundOrder.do?orderId=");
      out.print(order.getId());
      out.write("&reason=\"+reason);\r\n");
      out.write("        $('#refund').modal({\r\n");
      out.write("            relatedTarget: this,\r\n");
      out.write("            onConfirm: function(options) {\r\n");
      out.write("                $.ajax({\r\n");
      out.write("                    url: uri,\r\n");
      out.write("                    type: \"post\",\r\n");
      out.write("                    dataType: \"JSON\",\r\n");
      out.write("                    async: false,\r\n");
      out.write("                    success: function(ret){\r\n");
      out.write("                        if(ret.result == \"ok\"){\r\n");
      out.write("                            window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(user.getId());
      out.write("&state=4\";\r\n");
      out.write("                        }else{\r\n");
      out.write("                            alert(\"评论失败！\");\r\n");
      out.write("                        }\r\n");
      out.write("                    },\r\n");
      out.write("                    error: function(XMLRequest, textInfo){\r\n");
      out.write("                        if(textInfo != null){\r\n");
      out.write("                            alert(textInfo);\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            },\r\n");
      out.write("            // closeOnConfirm: false,\r\n");
      out.write("            onCancel: function() {\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
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
