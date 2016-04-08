package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

if (session != null) {
	Object user = session.getAttribute("adminUser");
	if (user != null) {
		session.invalidate();
	}
}

String msg = (String) request.getParameter("reason");
String prompt = "";
String promptDisplay = "display:none";
if ("clientUser".equalsIgnoreCase(msg) || "NotFound".equalsIgnoreCase(msg)) {
	prompt = "用户名不正确！";
	promptDisplay = "";
} else if ("ErrorPass".equalsIgnoreCase(msg)) {
	prompt = "密码不正确！";
	promptDisplay = "";
} else if ("Expired".equalsIgnoreCase(msg)) {
	prompt = "非法用户！";
	promptDisplay = "";
}

String ctx = request.getContextPath();

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"");
      out.print(ctx );
      out.write("/js/jquery-1.8.3.min.js\" ></script>\r\n");
      out.write("\t\t<link href=\"");
      out.print(ctx );
      out.write("/css/global.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\t\t<style type=\"text/css\">\r\n");
      out.write("\t\tbody {\r\n");
      out.write("\t\t\tfont-family: \"微软雅黑\";\r\n");
      out.write("\t\t\tfont-size: 15px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.bodyGround{\r\n");
      out.write("\t\t\tbackground-color: #e4e4e4;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t#loginBox {\r\n");
      out.write("\t\t\tmargin-left:auto;\r\n");
      out.write("\t\t\tmargin-right:auto;\r\n");
      out.write("\t\t\twidth: 700px;\r\n");
      out.write("\t\t\tpadding: 135px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\trow {\r\n");
      out.write("\t\t\tdisplay: table-row;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\t.label{\r\n");
      out.write("\t\t\twidth: 45%;\r\n");
      out.write("\t\t\ttext-align: right;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.input{width: 45%;}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tul {\r\n");
      out.write("\t\t\tdisplay: table;\r\n");
      out.write("\t\t\tlist-style: outside none none;\r\n");
      out.write("\t\t\tmargin: 0 auto;\r\n");
      out.write("\t\t\tpadding: 0;\r\n");
      out.write("\t\t\toverflow: hidden;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tul li {\r\n");
      out.write("\t\t\tmargin-bottom: 12px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tli div {\r\n");
      out.write("\t\t\tdisplay: table-cell;\r\n");
      out.write("\t\t\tborder: medium none;\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\tdiv.button {display:table-cell; text-align: center; width: 100%;}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t#loginInputDiv{\r\n");
      out.write("\t\t\tbackground-color: #F2F2F2;\r\n");
      out.write("\t\t\ttext-align: center;\r\n");
      out.write("\t\t\tmargin-top:30px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\t.btn {\r\n");
      out.write("\t\t\tbackground-color: #e4e4e4;\r\n");
      out.write("\t\t\tborder-color: rgba(0, 0, 0, 0.15);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tinput{line-height: 25px; font-size: 17px;}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t#loginBtn {width: 200px; font-size: 15px; font-family: \"微软雅黑\"}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t.hongxilogo {\r\n");
      out.write("\t\t\tbackground: url(\"../img/hongxi_logo_small_up.png\") repeat scroll 0 0 rgba(0, 0, 0, 0);\r\n");
      out.write("\t\t\tdisplay: inline-block;\r\n");
      out.write("\t\t\theight: 60px;\r\n");
      out.write("\t\t\tmargin-top: 15px;\r\n");
      out.write("\t\t\twidth: 186px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t.logoDiv {\r\n");
      out.write("\t\t\tdisplay: table-row;\r\n");
      out.write("\t\t\ttext-align: center;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t</style>\r\n");
      out.write("\t\t<title>帮你养车网管理后台-登陆</title>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body class=\"bodyGround\">\r\n");
      out.write("\t\t<form name=\"loginFrm\" action=\"");
      out.print(ctx );
      out.write("/admin/login.do\" method=\"post\">\r\n");
      out.write("\t\t\t<div id=\"loginBox\">\r\n");
      out.write("\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t<div id=\"logoDiv\">\r\n");
      out.write("\t\t\t\t\t<div class=\"logo\" style=\"float:left\">\r\n");
      out.write("                          <img alt=\"logo\" src=\"");
      out.print(ctx );
      out.write("/images/logo.gif\">\r\n");
      out.write("                    </div>\r\n");
      out.write("\t\t\t\t\t<div style=\"width: 65%; display: table-cell; vertical-align: middle; text-align: left;margin-top:\">\r\n");
      out.write("\t\t\t\t\t\t<span style=\"font-size:55px;text-align: center;line-height:100px;\">&nbsp;汽车服务管理后台</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<div id=\"loginInputDiv\">\r\n");
      out.write("\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t<div id=\"prompt\" style=\"");
      out.print(promptDisplay);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t\t<span id=\"prompt\" style=\"color: red\">");
      out.print(prompt );
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t\t<br><br>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"row weak\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"label\">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"space\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"input\"><input type=\"text\" name=\"adminUser.name\" id=\"username\" placeholder=\"请输入登陆账号\"></div>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"row weak\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"label\">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"space\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"input\"><input type=\"password\" name=\"adminUser.password\" id=\"password\" placeholder=\"请输入密码\"></div>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"row weak\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"button\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"submit\" class=\"btn\" name=\"loginBtn\" id=\"loginBtn\" value=\"登            陆\">\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\tfunction check() {\r\n");
      out.write("\t\t\t\tvar username = document.getElementById(\"username\").value;\r\n");
      out.write("\t\t\t\tif (username == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"登陆名不能为空！\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tvar password = document.getElementById(\"password\").value;\r\n");
      out.write("\t\t\t\tif (password == \"\") {\r\n");
      out.write("\t\t\t\t\talert(\"密码不能为空！\");\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tfunction login() {\r\n");
      out.write("\t\t\t\tif (!check()) {\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tjQuery(\"#loginFrm\").submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tjQuery(document).ready(function() {\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"username\").value = \"\";\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"password\").value = \"\";\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t</body>\r\n");
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
