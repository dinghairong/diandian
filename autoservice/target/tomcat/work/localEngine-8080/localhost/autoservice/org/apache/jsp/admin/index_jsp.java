package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;

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

String ctx = request.getContextPath(); 
Administrator user = (Administrator)session.getAttribute("adminUser");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("<title>汽车服务后台管理</title>\r\n");
      out.write("<meta name=\"description\" content=\"overview &amp; stats\" />\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("\r\n");
      out.write("<!-- basic styles -->\r\n");
      out.write("\r\n");
      out.write("<link href=\"");
      out.print(ctx );
      out.write("/assets/css/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/font-awesome.min.css\" />\r\n");
      out.write("\r\n");
      out.write("<!--[if IE 7]>\r\n");
      out.write("\t\t  <link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/font-awesome-ie7.min.css\" />\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\r\n");
      out.write("<!-- page specific plugin styles -->\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("\thref=\"");
      out.print(ctx );
      out.write("/assets/css/jquery-ui-1.10.3.full.min.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/datepicker.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/ui.jqgrid.css\" />\r\n");
      out.write("\r\n");
      out.write("<!-- fonts -->\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/ace-fonts.css\" />\r\n");
      out.write("\r\n");
      out.write("<!-- ace styles -->\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/ace.min.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/ace-rtl.min.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(ctx );
      out.write("/assets/css/ace-skins.min.css\" />\r\n");
      out.write("\r\n");
      out.write("<!--[if lte IE 8]>\r\n");
      out.write("\t\t  <link rel=\"stylesheet\" href=\"assets/css/ace-ie.min.css\" />\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\r\n");
      out.write("<!-- inline styles related to this page -->\r\n");
      out.write("\r\n");
      out.write("<!-- ace settings handler -->\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.print(ctx );
      out.write("/assets/js/ace-extra.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("\r\n");
      out.write("<!--[if lt IE 9]>\r\n");
      out.write("\t\t<script src=\"assets/js/html5shiv.js\"></script>\r\n");
      out.write("\t\t<script src=\"assets/js/respond.min.js\"></script>\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("<!--\r\n");
      out.write("\t\t<style type=\"text/css\">\r\n");
      out.write("\t\t.divLabel{display:table-cell; text-align:right}\r\n");
      out.write("\t\t.divInput{display:table-cell; text-align:left; padding-right: 10px; width: 29px;}\r\n");
      out.write("\t\t.widget-content {\r\n");
      out.write("\t\t\tborder-bottom: 1px solid #cdcdcd;\r\n");
      out.write("\t\t\tpadding: 12px 15px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.divInput select{\r\n");
      out.write("\t\t\twidth: 182px;\r\n");
      out.write("\t\t\tpadding: 5px 4px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t</style>\r\n");
      out.write("\t\t-->\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"skin-4\">\r\n");
      out.write("\t<div class=\"navbar navbar-default\" id=\"navbar\">\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\ttry{ace.settings.check('navbar' , 'fixed')}catch(e){}\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"navbar-container\" id=\"navbar-container\">\r\n");
      out.write("\t\t\t<div class=\"navbar-header pull-left\">\r\n");
      out.write("\t\t\t\t<a href=\"#\" class=\"navbar-brand\"> <small> <i\r\n");
      out.write("\t\t\t\t\t\tclass=\"icon-leaf\"></i> 汽车服务后台管理 </small> </a>\r\n");
      out.write("\t\t\t\t<!-- /.brand -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- /.navbar-header -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"navbar-header pull-right\" role=\"navigation\">\r\n");
      out.write("\t\t\t\t<ul class=\"nav ace-nav\">\r\n");
      out.write("\t\t\t\t\t<li class=\"light-blue\"><a data-toggle=\"dropdown\" href=\"#\"\r\n");
      out.write("\t\t\t\t\t\tclass=\"dropdown-toggle\"> <span class=\"user-info\"> <small>欢迎,</small>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(user.getName());
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print(user.getRole().getDisplayName() );
      out.write(" </span> <i\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"icon-caret-down\"></i> </a>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<ul\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close\">\r\n");
      out.write("\t\t\t\t\t\t\t<li class=\"divider\"></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"");
      out.print(ctx);
      out.write("/admin/login.jsp\"> <i\r\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"icon-off\"></i> 退出 </a></li>\r\n");
      out.write("\t\t\t\t\t\t</ul></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t<!-- /.ace-nav -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- /.navbar-header -->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- /.container -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"main-container\" id=\"main-container\">\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\ttry{ace.settings.check('main-container' , 'fixed')}catch(e){}\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"main-container-inner\">\r\n");
      out.write("\t\t\t<a class=\"menu-toggler\" id=\"menu-toggler\" href=\"#\"> <span\r\n");
      out.write("\t\t\t\tclass=\"menu-text\"></span> </a>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"sidebar\" id=\"sidebar\" style=\"margin-top: 50px;\">\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\ttry{ace.settings.check('sidebar' , 'fixed')}catch(e){}\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t\t\t<div class=\"sidebar-shortcuts\" id=\"sidebar-shortcuts\" style=\"display: none\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sidebar-shortcuts-large\" id=\"sidebar-shortcuts-large\">\r\n");
      out.write("\t\t\t\t\t\t\t<button class=\"btn btn-success\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-signal\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t</button>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<button class=\"btn btn-info\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-pencil\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t</button>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<button class=\"btn btn-warning\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-group\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div class=\"sidebar-shortcuts-mini\" id=\"sidebar-shortcuts-mini\">\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"btn btn-success\"></span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"btn btn-info\"></span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<span class=\"btn btn-warning\"></span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div><!-- #sidebar-shortcuts -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/orderMgmt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-edit\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 订单管理 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-list\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 门店管理 </span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<b class=\"arrow icon-angle-down\"></b>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/jxsgl.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t门店列表\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/jxssh.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t门店审核\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-list\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 用户管理 </span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<b class=\"arrow icon-angle-down\"></b>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/companyMgmt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t企业账号管理\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/userMgt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t消费者用户管理\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/adminMgmt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t系统用户管理\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/questions.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-edit\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 咨询管理 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\"> \r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-list\"></i> \r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 财务管理 </span> \r\n");
      out.write("\t\t\t\t\t\t\t\t<b class=\"arrow icon-angle-down\"></b> \r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/overallStatistics.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 整体销售统计 </span> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/categoryStatistics.jsp\"> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 分类销售统计 </span> \r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-list\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 用户统计</span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t<b class=\"arrow icon-angle-down\"></b>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"submenu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/CompanyuserStatistics.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t企业用户统计\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/userStatistics.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<i class=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t普通用户统计\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/serviceMgt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-edit\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 服务产品管理 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/adsMgmt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-edit\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 广告管理 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/couponMgmt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-edit\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 优惠券规则管理 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/chargeHistory.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-edit\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 充值记录查询 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t<a  class=\"xlink\" href=\"#\" rel=\"");
      out.print(ctx);
      out.write("/admin/notifyMgmt.jsp\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<i class=\"icon-list\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"menu-text\"> 通知管理 </span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t</ul><!-- /.nav-list -->\r\n");
      out.write("\t\t\t\t<!-- /.nav-list -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<div class=\"sidebar-collapse\" id=\"sidebar-collapse\">\r\n");
      out.write("\t\t\t\t\t<i class=\"icon-double-angle-left\"\r\n");
      out.write("\t\t\t\t\t\tdata-icon1=\"icon-double-angle-left\"\r\n");
      out.write("\t\t\t\t\t\tdata-icon2=\"icon-double-angle-right\"></i>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\t\t\ttry{ace.settings.check('sidebar' , 'collapsed')}catch(e){}\r\n");
      out.write("\t\t\t\t\t</script>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"main-content\" id=\"dynamic-content\">\r\n");
      out.write("\t\t\t\t<iframe id=\"myFrame\" name=\"myFrame\" frameborder=\"0\" width=\"100%\"\r\n");
      out.write("\t\t\t\t\theight=\"650\" style=\"padding-top: 10px;\" src=\"\"></iframe>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- /.main-content -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- /.main-container-inner -->\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- /.main-container -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- basic scripts -->\r\n");
      out.write("\r\n");
      out.write("\t<!--[if !IE]> -->\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\twindow.jQuery || document.write(\"<script src='");
      out.print(ctx);
      out.write("/assets/js/jquery-2.0.3.min.js'>\"+\"<\"+\"/script>\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\r\n");
      out.write("\t<!-- <![endif]-->\r\n");
      out.write("\r\n");
      out.write("\t<!--[if IE]>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write(" window.jQuery || document.write(\"<script src='");
      out.print(ctx);
      out.write("/assets/js/jquery-1.10.2.min.js'>\"+\"<\"+\"/script>\");\r\n");
      out.write("</script>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\tif(\"ontouchend\" in document) document.write(\"<script src='");
      out.print(ctx);
      out.write("/assets/js/jquery.mobile.custom.min.js'>\"+\"<\"+\"/script>\");\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t<script src=\"");
      out.print(ctx);
      out.write("/assets/js/bootstrap.min.js\"></script>\r\n");
      out.write("\t<script src=\"");
      out.print(ctx);
      out.write("/assets/js/typeahead-bs2.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\t<!-- page specific plugin scripts -->\r\n");
      out.write("\r\n");
      out.write("\t<!--[if lte IE 8]>\r\n");
      out.write("\t\t  <script src=\"");
      out.print(ctx);
      out.write("/assets/js/excanvas.min.js\"></script>\r\n");
      out.write("\t\t<![endif]-->\r\n");
      out.write("\r\n");
      out.write("\t<!-- ace scripts -->\r\n");
      out.write("\r\n");
      out.write("\t<script src=\"");
      out.print(ctx);
      out.write("/assets/js/ace-elements.min.js\"></script>\r\n");
      out.write("\t<script src=\"");
      out.print(ctx);
      out.write("/assets/js/ace.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\t<!-- inline scripts related to this page -->\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\tjQuery(document).ready(function(){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tjQuery(\".xlink\").click(function(e) {\r\n");
      out.write("\t\t\t\t\tjQuery(\"li.active\").removeClass(\"active\");\r\n");
      out.write("\t\t\t\t\tjQuery(this).parent().addClass(\"active\");\r\n");
      out.write("            \t\tvar source = jQuery(this).attr('rel');\r\n");
      out.write("            \t\tif (navigator.userAgent.indexOf(\"MSIE\") != -1) {\r\n");
      out.write("            \t\t\t\r\n");
      out.write("            \t\t} else {\r\n");
      out.write("            \t\t\t\r\n");
      out.write("            \t\t}\r\n");
      out.write("            \t\tjQuery(\"#dynamic-content\").html('<iframe id=\"myFrame\" name=\"myFrame\" frameborder=\"0\" width=\"100%\" height=\"650\" style=\"padding-top: 10px;\" src=\"'+source+'\">');\r\n");
      out.write("            \t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tjQuery(\".xlink:eq(0)\").trigger(\"click\");\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t</script>\r\n");
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
