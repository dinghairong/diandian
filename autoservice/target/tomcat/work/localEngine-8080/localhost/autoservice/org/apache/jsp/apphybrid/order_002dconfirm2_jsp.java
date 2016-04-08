package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.dao.UsersDao;
import com.smart4c.dao.ServiceProductDao;
import com.smart4c.util.SpringUtils;
import com.smart4c.alipay.util.UtilDate;
import com.smart4c.dao.ServiceShopDao;
import org.apache.commons.lang3.StringUtils;
import net.sf.json.JSONObject;
import com.smart4c.dao.OrderDao;

public final class order_002dconfirm2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
  UsersDao usersDao = (UsersDao) SpringUtils.getBean(UsersDao.class);
  User user = (User)session.getAttribute("user");
  String userIdChubao = user.getUserExternal().getUserId();
  JSONObject json =(JSONObject)request.getAttribute("jsonObj");
  OrderDao orderDao = (OrderDao) SpringUtils.getBean(OrderDao.class);
  Order order = orderDao.findOrderById((Integer)json.get("orderId"));



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
      out.write("  <title>去付款</title>\r\n");
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
      out.write("body{ background:#eee; margin-top:-10px;}\r\n");
      out.write("  </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<header class=\"am-topbar am-topbar-fixed-bottom\">\r\n");
      out.write("    <div class=\"am-container\">\r\n");
      out.write("\r\n");
      out.write("实付款：<span style=\"color:#ff0000; font-weight:bold;\">¥");
      out.print(order.getPaid());
      out.write("</span>\r\n");
      out.write("　　　　<a href=\"javaScript:payOrder()\" class=\"am-btn am-btn-warning\" style=\"margin-top:4px;\">去付款</a>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul class=\"am-list\">\r\n");
      out.write("  <li style=\"padding:5px 8px; line-height:30px;\">订单编号：");
      out.print(order.getSerialnumber());
      out.write("\r\n");
      out.write("<br>订单内容：");
      out.print(order.getServiceProduct().getTitle());
      out.write("\r\n");
      out.write("<br>服务单价：¥");
      out.print(order.getServiceProduct().getNewprice());
      out.write("\r\n");
      out.write("<br>数　　量：");
      out.print(order.getNumber());
      out.write("份\r\n");
      out.write("<br>服务门店：");
      out.print(order.getServiceShop()==null?"暂未选择":order.getServiceShop().getTitle());
      out.write("\r\n");
      out.write("<br>车主姓名：");
      out.print(order.getCustomername());
      out.write("\r\n");
      out.write("<br>车主手机：");
      out.print(order.getCustomerphone());
      out.write("</li>\r\n");
      out.write("</ul>\r\n");
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
      out.write("<script src=\"http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(ctx);
      out.write("/js/config.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("//支付\r\n");
      out.write("function payOrder(){\r\n");
      out.write("  var paid = ");
      out.print(order.getPaid()*100 );
      out.write(";\r\n");
      out.write("  var orderId= '");
      out.print(order.getId());
      out.write("';\r\n");
      out.write("  ctk.logged({\r\n");
      out.write("    yes: function(res) {\r\n");
      out.write("      ctk.select({\r\n");
      out.write("        tradeService: 'com.80ycw.autoservice',\r\n");
      out.write("        totalFee: paid,\r\n");
      out.write("        success: function(res) {\r\n");
      out.write("          console.log(JSON.stringify(res));\r\n");
      out.write("          var tradeStr = res.tradeStr;\r\n");
      out.write("          requestPay(tradeStr,paid,orderId);\r\n");
      out.write("          ctk.show();\r\n");
      out.write("        },\r\n");
      out.write("        fail: function(res) {\r\n");
      out.write("          console.log('取消');\r\n");
      out.write("        }\r\n");
      out.write("      });\r\n");
      out.write("    },\r\n");
      out.write("    no: function(res) {\r\n");
      out.write("      alert('请先登录！');\r\n");
      out.write("    }\r\n");
      out.write("  });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function requestPay(tradeStr,paid,orderId) {\r\n");
      out.write("  var chubaoId='");
      out.print(userIdChubao);
      out.write("';\r\n");
      out.write("  var url = '");
      out.print(ctx);
      out.write("/apphybrid/trade.do?chuBaoUserId='+chubaoId+'&totalFee='+paid+'&tradeStr=' + tradeStr+'&orderId='+orderId;\r\n");
      out.write("  $.ajax({\r\n");
      out.write("    url: url,\r\n");
      out.write("    type: 'get',\r\n");
      out.write("    dataType: 'json',\r\n");
      out.write("    success: function (ret) {\r\n");
      out.write("      console.log('-----request success');\r\n");
      out.write("      console.log(ret.payStr)\r\n");
      out.write("      ctk.pay({\r\n");
      out.write("        payStr: ret.payStr,\r\n");
      out.write("        finish: function(resCode) {\r\n");
      out.write("          ctk.dismiss();\r\n");
      out.write("          if(\"4102\" == resCode){\r\n");
      out.write("            window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/pay-result.jsp?orderId=\"+orderId;\r\n");
      out.write("          }\r\n");
      out.write("          console.log('resCode: ' + resCode);\r\n");
      out.write("        }\r\n");
      out.write("      });\r\n");
      out.write("    },\r\n");
      out.write("    error: function () {\r\n");
      out.write("      ctk.dismiss();\r\n");
      out.write("      alert('请求支付失败');\r\n");
      out.write("    }\r\n");
      out.write("  });\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
