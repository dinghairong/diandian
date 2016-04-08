package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.SpringUtils;
import com.smart4c.dao.ServiceProductDao;
import org.apache.commons.lang3.StringUtils;
import com.smart4c.dao.ServiceShopDao;
import com.smart4c.common.SmartProperties;

public final class order_002dconfirm_jsp extends org.apache.jasper.runtime.HttpJspBase
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

  String ctx = request.getContextPath();
  UsersDao usersDao = (UsersDao) SpringUtils.getBean(UsersDao.class);
  User user = (User)session.getAttribute("user");
  ServiceProductDao serviceProductDao = (ServiceProductDao) SpringUtils.getBean(ServiceProductDao.class);
  ServiceShopDao serviceShopDao = (ServiceShopDao)SpringUtils.getBean(ServiceShopDao.class);
  SmartProperties smartProp = SmartProperties.getInstance();
  String imgPath = smartProp.getImgPath();
  String spId = request.getParameter("spId");
  if(StringUtils.isNotEmpty(spId)){
    session.setAttribute("spId",spId);
  }else{
    Integer spIdInt = (Integer)session.getAttribute("spId");
    spId = Integer.toString(spIdInt);
  }
  ServiceProduct sp = serviceProductDao.findServiceProductById(Integer.valueOf(spId));
  String name = (String)session.getAttribute("name");
  String phone = (String)session.getAttribute("phone");
  int number=0;
  if(session.getAttribute("number") != null){
     number = (Integer)session.getAttribute("number");
  }
  String serviceShopId = (String)request.getParameter("serviceShopId");
  ServiceShop serviceShop = null;
  if(StringUtils.isNotEmpty(serviceShopId) && !"null".equals(serviceShopId)){
    serviceShop = serviceShopDao.findServiceShopById(Integer.valueOf(serviceShopId));
  }else{
    serviceShopId="0";
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
      out.write("  <title>立即购买</title>\r\n");
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
      out.write("        <a href=\"javaScript:orderConfirm()\"  class=\"am-topbar-btn am-btn am-btn-sm theme-bg am-btn-block\" id=\"btn-submit\">确认订单</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<ul class=\"am-list\">\r\n");
      out.write("  <li>\r\n");
      out.write("  <div class=\"am-cf\">\r\n");
      out.write("  <span class=\"am-fl\"><img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + sp.getPath());
      out.write("&imageName=");
      out.print(sp.getIcon());
      out.write("\" width=\"100\" height=\"86\"></span>\r\n");
      out.write("  <span class=\"am-fr\"><p style=\"margin-top:5px; font-size:14px;\">");
      out.print(sp.getTitle());
      out.write("</p><p style=\"font-size:10px; color:#999; margin-top:-20px; margin-bottom:1px;\">描述：");
      out.print(sp.getAbstract_());
      out.write("\r\n");
      out.write("</p><button type=\"button\" class=\"am-btn am-btn-success\" style=\"width:65px; height:25px; font-size:12px; color:#fff; margin-bottom:5px;\">免费安装</button> <button type=\"button\" class=\"am-btn am-btn-secondary\" style=\"width:65px; height:25px;  font-size:12px; color:#fff;margin-bottom:5px\">装完付款</button> <button type=\"button\" class=\"am-btn am-btn-secondary\" style=\"width:65px; height:25px;  font-size:12px; color:#fff; padding-left:10px;margin-bottom:5px\">正规发票</button></span>\r\n");
      out.write("</div>\r\n");
      out.write("</li>\r\n");
      out.write("  <li style=\"padding:5px 8px;\">服务单价\t<p  class=\"am-fr\" style=\"margin-top:-1px; margin-right:15px; color:#FF7419;font-size:16px;\">");
      out.print(sp.getNewprice());
      out.write("元</p></li>\r\n");
      out.write("  <li>\r\n");
      out.write("  \r\n");
      out.write("    <div class=\"am-cf\">\r\n");
      out.write("  <div class=\"am-fl\" style=\"padding:5px 8px;\">购买数量</div>\r\n");
      out.write("  <div class=\"am-fr\" style=\"padding:5px 0px; margin-right:-40px;\">　<div class=\"am-btn-group am-btn-group-xs\"　　>\r\n");
      out.write(" <button type=\"button\" onclick=\"subNum()\" class=\"am-btn am-btn-default\">-</button>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"am-btn-group am-btn-group-xs\">\r\n");
      out.write(" <input type=\"button\" class=\"am-btn am-btn-default\" name=\"number\" id=\"number\" value=\"");
      out.print(number==0?1:number);
      out.write("\"/>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"am-btn-group am-btn-group-xs\">\r\n");
      out.write(" <button type=\"button\" onclick=\"addNum()\" class=\"am-btn am-btn-default\">+</button>\r\n");
      out.write("</div>\r\n");
      out.write("  </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </li>\r\n");
      out.write("  <li style=\"padding:5px 8px;\">服务门店 <input type=\"hidden\" id=\"serviceShopId\" name=\"serviceShopId\" value=\"");
      out.print(serviceShopId==null?"":serviceShopId);
      out.write("\"><p  class=\"am-fr\" style=\"margin-top:5px; margin-right:5px; color:#999;font-size:12px;\"><a href=\"javaScript:selectShop();\">请选择您需要的服务点</a></p></li>\r\n");
      out.write("  <li>\r\n");
      out.write("\r\n");
      out.write("  <li>\r\n");
      out.write("    <div class=\"am-cf\">\r\n");
      out.write("      <div class=\"am-fl\" style=\"padding:5px 8px;\">门店名称</div>\r\n");
      out.write("      <div class=\"am-fr\" style=\" margin-right:5px; padding-top:2px;\">\r\n");
      out.write("       ");
      out.print(serviceShop==null?"暂未选择门店":serviceShop.getTitle());
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  <li>\r\n");
      out.write("    <div class=\"am-cf\">\r\n");
      out.write("  <div class=\"am-fl\" style=\"padding:5px 8px;\">车主姓名</div>\r\n");
      out.write("  <div class=\"am-fr\" style=\" margin-right:-2px; padding-top:2px;\"><input type=\"text\" name=\"customername\" id=\"customername\" placeholder=\"输入您的姓名\" value=\"");
      out.print(name==null?"":name);
      out.write("\">　\r\n");
      out.write("</div>\r\n");
      out.write("  </div>\r\n");
      out.write("  </li>\r\n");
      out.write("    <li>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"am-cf\">\r\n");
      out.write("  <div class=\"am-fl\" style=\"padding:5px 8px;\">车主手机</div>\r\n");
      out.write("  <div class=\"am-fr\" style=\" margin-right:-2px; padding-top:2px;\"><input type=\"text\" id=\"customerphone\" name=\"customerphone\" placeholder=\"输入您的手机\" value=\"");
      out.print(phone==null?"":phone);
      out.write("\">　\r\n");
      out.write("</div>\r\n");
      out.write("  </div>\r\n");
      out.write("  </li>\r\n");
      out.write("    <li>\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  ");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("  ");
      out.write("\r\n");
      out.write("  </li>\r\n");
      out.write("</ul>\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-modal am-modal-alert\" tabindex=\"-1\" id=\"alert1\">\r\n");
      out.write("  <div class=\"am-modal-dialog\">\r\n");
      out.write("    <div class=\"am-modal-hd\">警告</div>\r\n");
      out.write("    <div class=\"am-modal-bd\">\r\n");
      out.write("      请输入车主姓名\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"am-modal-footer\">\r\n");
      out.write("      <span class=\"am-modal-btn\">确定</span>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-modal am-modal-alert\" tabindex=\"-1\" id=\"alert2\">\r\n");
      out.write("  <div class=\"am-modal-dialog\">\r\n");
      out.write("    <div class=\"am-modal-hd\">警告</div>\r\n");
      out.write("    <div class=\"am-modal-bd\">\r\n");
      out.write("      请输入车主手机\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"am-modal-footer\">\r\n");
      out.write("      <span class=\"am-modal-btn\">确定</span>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
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
      out.write("<script src=\"");
      out.print(ctx );
      out.write("/assets/js/amazeui.js\"></script>\r\n");
      out.write("<script src=\"http://open.cootekservice.com/res/js/lib/ctk-1.0.0.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(ctx);
      out.write("/js/config.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("  function subNum(){\r\n");
      out.write("    var number =parseInt($(\"#number\").val());\r\n");
      out.write("    if(0 < number){\r\n");
      out.write("      $(\"#number\").val(number-1);\r\n");
      out.write("    }\r\n");
      out.write("  };\r\n");
      out.write("\r\n");
      out.write("  function addNum(){\r\n");
      out.write("      var number =parseInt($(\"#number\").val());\r\n");
      out.write("      $(\"#number\").val(number+1);\r\n");
      out.write("  };\r\n");
      out.write("\r\n");
      out.write("  function orderConfirm(){\r\n");
      out.write("\r\n");
      out.write("      var number = $(\"#number\").val();\r\n");
      out.write("      var name = $(\"#customername\").val();\r\n");
      out.write("      var phone = $(\"#customerphone\").val();\r\n");
      out.write("      if(name==\"\"||name.length==0){\r\n");
      out.write("        $(\"#alert1\").modal('open');\r\n");
      out.write("        return;\r\n");
      out.write("      }\r\n");
      out.write("      if(phone==\"\"||phone.length==0){\r\n");
      out.write("        $(\"#alert2\").modal('open');\r\n");
      out.write("        return;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("    ctk.logged({\r\n");
      out.write("      yes:function(res){\r\n");
      out.write("        doLoginByAccessToken(res.accessToken);\r\n");
      out.write("      },\r\n");
      out.write("      no:function(){\r\n");
      out.write("        ctk.login({\r\n");
      out.write("          success: function(res){\r\n");
      out.write("            doLoginByAccessToken(res.accessToken);\r\n");
      out.write("          },\r\n");
      out.write("          fail: function(){\r\n");
      out.write("            alert('无法打开登录框');\r\n");
      out.write("          }\r\n");
      out.write("        })\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write("  };\r\n");
      out.write("\r\n");
      out.write("  function doLoginByAccessToken(accessToken){\r\n");
      out.write("    var number = $(\"#number\").val();\r\n");
      out.write("    var name = $(\"#customername\").val();\r\n");
      out.write("    var phone = $(\"#customerphone\").val();\r\n");
      out.write("    $.post('loginByAccessToken.do',{\r\n");
      out.write("      accessToken: accessToken,\r\n");
      out.write("      type: 'touchlife'\r\n");
      out.write("    }, function(data){\r\n");
      out.write("      if(data.result == 0){\r\n");
      out.write("        window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/orderComfirm.do?spId=");
      out.print(spId);
      out.write("&number=\"+number+\"&name=\"+encodeURI(name)+\"&phone=\"+phone+\"&serviceShopId=\"+");
      out.print(serviceShopId);
      out.write(";\r\n");
      out.write("      }\r\n");
      out.write("      else{\r\n");
      out.write("        alert('登录错误:'+JSON.stringify(data));\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write("  };\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  function selectShop(){\r\n");
      out.write("\r\n");
      out.write("    var number = $(\"#number\").val();\r\n");
      out.write("    var name = $(\"#customername\").val();\r\n");
      out.write("    var phone = $(\"#customerphone\").val();\r\n");
      out.write("\r\n");
      out.write("    var time = $(\"#createTime\").val();\r\n");
      out.write("    window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/storeChoose.do?spId=");
      out.print(spId);
      out.write("&number=\"+number+\"&name=\"+encodeURI(name)+\"&phone=\"+phone;\r\n");
      out.write("  };\r\n");
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
