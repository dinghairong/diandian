package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footSection_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');

String ctx = (String)request.getContextPath();

      out.write("\r\n");
      out.write(" <div class=\"home_fuwu\">\r\n");
      out.write("    <div class=\"hf_cont\">\r\n");
      out.write("        <div class=\"hfcc\" style=\"border-right: 1px solid #e9e9e9;\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/images/bottom_01.jpg\"/><br/>\r\n");
      out.write("            平台保障<span>甄选优质产品全正品</span>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"hfcc\" style=\"border-right: 1px solid #e9e9e9;\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/images/bottom_02.jpg\"/><br/>\r\n");
      out.write("            安心付<span>安全可靠</span>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"hfcc\" style=\"border-right: 1px solid #e9e9e9;\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/images/bottom_03.jpg\"/><br/>\r\n");
      out.write("            品质高<span>挑选最低价格合作</span>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"hfcc\" style=\"border-right: 1px solid #e9e9e9;\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/images/bottom_04.jpg\"/><br/>\r\n");
      out.write("            售后维权<span>质量问题一站式服务网协助解决</span>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"hfcc\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/images/bottom_05.png\"/><br/>\r\n");
      out.write("            好服务<span>全套式服务</span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"foot\">\r\n");
      out.write("    <div class=\"foot_dh\">\r\n");
      out.write("        <div class=\"footh_wenzi\">\r\n");
      out.write("            <span>服务介绍</span>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_s.jsp\" class=\"footh_lianjie\">配送安装</a>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_c.jsp\" class=\"footh_lianjie\">产品保修</a>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_a.jsp\" class=\"footh_lianjie\">用户协议</a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"footh_wenzi\">\r\n");
      out.write("            <span>支付方式</span>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_p.jsp\" class=\"footh_lianjie\">货到付款</a>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_y.jsp\" class=\"footh_lianjie\">支付宝</a>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_t.jsp\" class=\"footh_lianjie\">银行转账/汇款</a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"footh_wenzi\">\r\n");
      out.write("            <span>热线电话</span>\r\n");
      out.write("            <a href=\"javascript:voicd(0)\" class=\"footh_lianjies\">400-665-8027</a>\r\n");
      out.write("            <a href=\"javascript:voicd(0)\" class=\"footh_lianjiess\">周一至周日8:00-24:00</a>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_e.jsp\" class=\"footh_lianjie\">我要投诉</a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"footh_wenzi\">\r\n");
      out.write("            <span>联系我们</span>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_b.jsp\" class=\"footh_lianjie\">帮您养车网简介</a>\r\n");
      out.write("            <a href=\"");
      out.print(ctx);
      out.write("/a_d.jsp\" class=\"footh_lianjie\">广告与市场合作</a>\r\n");
      out.write("            <a href=\"javascript:voicd(0)\" class=\"footh_lianjie\">招贤纳士</a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"footh_wenzi\">\r\n");
      out.write("            <img src=\"");
      out.print(ctx);
      out.write("/images/erwei.jpg\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\t\r\n");
      out.write("    <div class=\"guanyu\" >\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/about.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">关于我们</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_s.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">服务简介</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_d.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">加盟合作</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_y.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">支付方式</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_t.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">银联支付</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_s.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">服务说明</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_y.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">支付宝</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_d.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">市场合作</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_d.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">服务保障</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_s.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">客户服务</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/a_s.jsp\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">用户协议</a>\r\n");
      out.write("        <a href=\"javascript:voicd(0)\" class=\"guanyu_cont\" style=\"border-right: 1px solid #ffffff;\">招贤纳士</a>\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/about.jsp\" class=\"guanyu_cont\">联系我们</a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"banquan\">\r\n");
      out.write("        上海邦车电子商务有限公司   版权所有   <font style=\"font-weight: bolder;\">沪ICP备11004912号-2</font>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"gslogo\">\r\n");
      out.write("        <img src=\"");
      out.print(ctx);
      out.write("/images/gslogo.jpg\"/>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>");
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
