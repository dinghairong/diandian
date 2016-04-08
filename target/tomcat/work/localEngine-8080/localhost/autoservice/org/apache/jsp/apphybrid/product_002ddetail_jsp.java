package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.dao.ServiceProductDao;
import com.smart4c.util.SpringUtils;
import java.util.List;

public final class product_002ddetail_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String ctx = request.getContextPath();
    ServiceProductDao serviceProductDao = (ServiceProductDao) SpringUtils.getBean(ServiceProductDao.class);
    String spId = request.getParameter("spId");
    ServiceProduct sp = serviceProductDao.findServiceProductById(Integer.valueOf(spId));
    List<Comment> commentList = sp.getComments();
    Comment comment = null;int score = 0; float resuScore = 0;
    if(commentList != null && commentList.size()>0){
        comment = commentList.get(0);
        for(Comment cm:commentList){
            score += cm.getStar();
        }
        resuScore = (float)score/commentList.size();
    }

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
      out.write("  <title>服务详情</title>\r\n");
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
      out.write("  body{ background:#eee; margin-top:-15px;}\r\n");
      out.write("    #typeone {\r\n");
      out.write(" width:\r\n");
      out.write("}\r\n");
      out.write(".formItemDiff {\r\n");
      out.write("\twidth: 20px;\r\n");
      out.write("\theight: 20px;\r\n");
      out.write("\tbackground-image: url(../assets/images/diff.png);\r\n");
      out.write("\tbackground-position: 0px -575px;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("\tmargin-top: 0px;\r\n");
      out.write("}\r\n");
      out.write(".formItemDiffFirst {\r\n");
      out.write("\tmargin-left: 0px;\r\n");
      out.write("}\r\n");
      out.write("  </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<header class=\"am-topbar am-topbar-fixed-bottom\">\r\n");
      out.write("    <div class=\"am-container\">\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/order-confirm.jsp?spId=");
      out.print(sp.getId());
      out.write("\" class=\"am-topbar-btn am-btn am-btn-sm theme-bg am-btn-block\" id=\"btn-submit\">立即购买</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("<ul class=\"am-list\">\r\n");
      out.write("  <li style=\" text-align:center\"><img src=\"");
      out.print(ctx );
      out.write("/zp/1.jpg\" width=\"250\" height=\"216\"></li>\r\n");
      out.write("  <li style=\"font-size:16px; padding:5px 8px;;\">");
      out.print(sp.getTitle());
      out.write("</li>\r\n");
      out.write("  <li style=\"font-size:10px; color:#AAAAAA; line-height:20px; padding:5px 8px;\">摘要：");
      out.print(sp.getAbstract_());
      out.write("\r\n");
      out.write("<br>所需配件：");
      out.print(sp.getAccessory());
      out.write("\r\n");
      out.write("<br>描述：");
      out.print(sp.getDescription());
      out.write("</li>\r\n");
      out.write("  <li style=\"line-height:28px; font-size:14px; padding:5px 8px; color:#656565;\">市场价：<strong>¥");
      out.print(sp.getOldprice());
      out.write("</strong><br>\r\n");
      out.write("体验价：<strong style=\" font-size:16px; color:#FF0000\">¥");
      out.print(sp.getNewprice());
      out.write("</strong>\r\n");
      out.write("<br>服务时间：大约");
      out.print(sp.getDuration());
      out.write("分钟\r\n");
      out.write("<br>服务支持：<button type=\"button\" class=\"am-btn am-btn-success am-btn-xs\" style=\"font-size:12px; color:#fff;\">免费安装</button> <button type=\"button\" class=\"am-btn am-btn-secondary am-btn-xs\" style=\"font-size:12px; color:#fff\">装完付款</button> <button type=\"button\" class=\"am-btn am-btn-secondary am-btn-xs\" style=\"font-size:12px; color:#fff; padding-left:10px\">正规发票</button></li>\r\n");
      out.write("</ul>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul class=\"am-list\">\r\n");
      out.write("  <li style=\"font-size:16px; padding:5px 8px;\">商品介绍\t\t\t<button type=\"button\" class=\"am-fr am-close\" style=\"margin-top:-1px; margin-right:-5px; ; font-size:23px;\">＞</button>\r\n");
      out.write("</li>\r\n");
      out.write("  <li style=\"font-size:14px; color:#000; line-height:20px; padding:5px 8px;\"><a href=\"");
      out.print(ctx);
      out.write("/apphybrid/product-evaluate.jsp?spId=");
      out.print(spId);
      out.write("\"> 用户评价（<span style=\"color:#FF780F\">");
      out.print((commentList==null?0:commentList.size()));
      out.write("</span>）</a></li>\r\n");
      out.write("\r\n");
      out.write("    ");
 if(comment != null){ 
      out.write("\r\n");
      out.write("  <li style=\"line-height:28px; font-size:14px; padding:5px 8px; color:#656565;\">商品综合满意度：<span style=\"color:#FF780F\">");
      out.print(resuScore);
      out.write("分</span>，共<span style=\"color:#FF780F\">");
      out.print(commentList.size());
      out.write("</span>条\r\n");
      out.write("<br><span style=\"color:#9A9A9A\">");
      out.print(comment.getUser().getName());
      out.write("评分：<span id=\"contentMain\" class=\"am-fr\" style=\"margin-top:5px; margin-right:50px;\">\r\n");
      out.write("  <span id=\"contextBg\">\r\n");
      out.write("    \r\n");
      out.write("    <span class=\"contextBgItem contextBgItemRight\">\r\n");
      out.write("      <span id=\"Demo\" style=\"text-align:center;\">\r\n");
      out.write("        <span class=\"item\" style=\"margin-top:0px; margin-left:0px;\">\r\n");
      out.write("          <span class=\"formItemDiff formItemDiffFirst\"></span>\r\n");
      out.write("          <span class=\"formItemDiff\"></span>\r\n");
      out.write("          <span class=\"formItemDiff\"></span>\r\n");
      out.write("          <span class=\"formItemDiff\"></span>\r\n");
      out.write("           <span class=\"formItemDiff\"></span>\r\n");
      out.write("          <span id=\"pointP\" style=\"float:left; margin-left:20px;\"></span>\r\n");
      out.write("        </span>\r\n");
      out.write("      </span>\r\n");
      out.write("      \r\n");
      out.write("    </span>\r\n");
      out.write("  </span>\r\n");
      out.write("</span>\r\n");
      out.write("<br>");
      out.print(comment.getTitle());
      out.write("\r\n");
      out.write("<br>");
      out.print(comment.getContent());
      out.write("</span></li>\r\n");
      out.write("    ");
}
      out.write("\r\n");
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
      out.write("<script type=\"text/javascript\" src=\"http://www.pengyaou.com/jquery-1.4.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(document).ready(function(e) {\r\n");
      out.write("   $(\".formItemDiff\").hover(function() {\r\n");
      out.write("\t\t\t\t$(this).css(\"background-position\", \"0px -555px\");\r\n");
      out.write("\t\t\t\t$(this).prevAll().css(\"background-position\", \"0px -555px\");\r\n");
      out.write("\t\t\t\t$(this).nextAll().css(\"background-position\", \"0px -575px\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
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
