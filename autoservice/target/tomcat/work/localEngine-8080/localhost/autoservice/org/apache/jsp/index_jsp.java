package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.text.*;
import java.lang.*;
import com.smart4c.dao.*;
import com.smart4c.bean.*;
import com.smart4c.common.*;
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
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");

    String ctx = (String)request.getContextPath();
    ServiceProductDao serviceProductDao = (ServiceProductDao)SpringUtils.getBean(ServiceProductDao.class);
    CommentDao commentDao = (CommentDao)SpringUtils.getBean(CommentDao.class);
    AdvisoryDao advisoryDao = (AdvisoryDao)SpringUtils.getBean(AdvisoryDao.class);
    AdvertisingDao advertisingDao = (AdvertisingDao)SpringUtils.getBean(AdvertisingDao.class);
    CouponDao couponDao = (CouponDao)SpringUtils.getBean(CouponDao.class);

    SmartProperties smartProp = SmartProperties.getInstance();
    DecimalFormat df=new DecimalFormat("######0.00");
    DateFormat d_f=new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String imgPath = smartProp.getImgPath();

    List<ServiceProduct> product_list_first = serviceProductDao.findServiceProductByFirst(5);
    List<Comment> comment_list = commentDao.findComment();
    List<Advisory> advisory_list = advisoryDao.findAdvisory();
    List<Coupon> coupon_list = couponDao.findCouponByStatus();

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>车服务</title>\r\n");
      out.write("    <link href=\"css/css.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("    <link href=\"images/favicon.ico\" rel=\"shortcut icon\"/>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"js/jquery-1.8.3.min.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.tabso_yeso.js\"></script>\r\n");
      out.write("    <script src=\"js/jquery.flexslider-min.js\"></script>\r\n");
      out.write("    <script src=\"js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("        $(function() {\r\n");
      out.write("            $(\".wrap\").flexslider({\r\n");
      out.write("                animation: \"slide\",\r\n");
      out.write("                controlNav: true,\r\n");
      out.write("                animationLoop: true\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("    </script>\r\n");
      out.write("    <script src=\"js/js3.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"all\" id=\"all\">\r\n");
      out.write("       ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "headSection3.jsp", out, true);
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"liucheng\" style=\"padding-top: 16px\">\r\n");
      out.write("            <img src=\"images/liucheng.jpg\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"guanggao\">\r\n");
      out.write("            ");

            List<Advertising> ad_list2 = advertisingDao.findAdvByLocation(2);
            List<Advertising> ad_list3 = advertisingDao.findAdvByLocation(3);
            if(ad_list2.size() > 0){
                for(int i = 0;i < ad_list2.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list2.get(i).getHref() && ad_list2.get(i).getHref().length() > 0){
                        str_href = ad_list2.get(i).getHref();
                    }
            
      out.write("\r\n");
      out.write("            <a href=\"");
      out.print(str_href);
      out.write("\"><img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + ad_list2.get(i).getPath());
      out.write("&imageName=");
      out.print(ad_list2.get(i).getImage());
      out.write("\" class=\"guanggao2\"></a>\r\n");
      out.write("            ");

                }
            }
            if(ad_list3.size() > 0){
                for(int i = 0;i < ad_list3.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list3.get(i).getHref() && ad_list3.get(i).getHref().length() > 0){
                        str_href = ad_list3.get(i).getHref();
                    }
            
      out.write("\r\n");
      out.write("            <a href=\"");
      out.print(str_href);
      out.write("\"><img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + ad_list3.get(i).getPath());
      out.write("&imageName=");
      out.print(ad_list3.get(i).getImage());
      out.write("\" class=\"guanggao1\"></a>\r\n");
      out.write("            ");

                }
            }  
            
      out.write("\r\n");
      out.write("           <!--  <img src=\"images/guanggao1.jpg\" class=\"guanggao2\"/>\r\n");
      out.write("            <img src=\"images/guangao2.jpg\" class=\"guanggao1\"/> -->\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {\r\n");
      out.write("    position: relative;\r\n");
      out.write("        padding: 10px 0 0 50px;\r\n");
      out.write("        bottom: 5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.hc_biaoti span.fix_title {\r\n");
      out.write("    background: url(/images/1F.png) no-repeat 0 2px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.hc_biaoti span.maintain_title {\r\n");
      out.write("    background: url(/images/2F.png) no-repeat 0 2px; \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.hc_biaoti span.beauty_title {\r\n");
      out.write("    background: url(/images/3F.png) no-repeat 0 2px; \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.hc_biaoti span.checking_title {\r\n");
      out.write("    background: url(/images/4F.png) no-repeat 0 2px; \r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a.morefw span {\r\n");
      out.write("    color: #FF8500;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("a.morefw span.enter01 {\r\n");
      out.write("    margin-left: 4px;\r\n");
      out.write("    font-size: 1.5em;\r\n");
      out.write("    position: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.kp_biaotis span.kp_biaotisspan {\r\n");
      out.write("    font-weight: bold;\r\n");
      out.write("    padding-bottom: 9px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.hccjt_biaoti span {\r\n");
      out.write("    padding-top: 4px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.hcc_cont {\r\n");
      out.write("    margin-top: 7px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("div.meir_cont {\r\n");
      out.write("    margin-top: 7px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("div.jc {\r\n");
      out.write("    margin-top: 7px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media screen and (min-width:0\\0) { /* IE9+ IE11未知*/\r\n");
      out.write("    div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {\r\n");
      out.write("        padding: 10px 0 5px 50px;\r\n");
      out.write("        bottom: 3px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.hcc_cont {\r\n");
      out.write("        margin-top: 0px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.meir_cont {\r\n");
      out.write("        margin-top: 0px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.jc {\r\n");
      out.write("        margin-top: 0px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    a.morefw {\r\n");
      out.write("        position: relative;\r\n");
      out.write("        bottom: 7px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    a.morefw span.enter01 {\r\n");
      out.write("        /*background: url(/images/chengyou.png) no-repeat 100% 1px; */\r\n");
      out.write("        bottom: 7px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.hc_biaoti {\r\n");
      out.write("        /*border: 1px solid;*/\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media screen and (-webkit-min-device-pixel-ratio:0) { /* Safari and Chrome */\r\n");
      out.write("    div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {\r\n");
      out.write("        padding: 10px 0 0 48px;\r\n");
      out.write("        top: 2px;\r\n");
      out.write("    }   \r\n");
      out.write("\r\n");
      out.write("    a.morefw span.enter01 {\r\n");
      out.write("        /*background: url(/images/chengyou.png) no-repeat 100% 1px; */\r\n");
      out.write("        bottom: 5px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.kp_biaotis span.kp_biaotisspan {\r\n");
      out.write("        padding-bottom: 6px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.kp_biaoti span.evaluate_title {\r\n");
      out.write("        position: relative;\r\n");
      out.write("        top: 3px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@-moz-document url-prefix() { /*FireFox*/\r\n");
      out.write("    div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {\r\n");
      out.write("        padding: 10px 0 0 50px;\r\n");
      out.write("        bottom: 5px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    a.morefw span.enter01 {\r\n");
      out.write("        /*background: url(/images/chengyou.png) no-repeat 100% 4px;*/\r\n");
      out.write("        bottom: 1px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    div.kp_biaotis span.kp_biaotisspan {\r\n");
      out.write("        padding-bottom: 3px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"home_cont\">\r\n");
      out.write("            <div class=\"hc_biaoti\">\r\n");
      out.write("                <span class=\"fix_title\">安装改装</span>\r\n");
      out.write("                <a href=\"");
      out.print(ctx);
      out.write("/install.jsp\" class=\"morefw\">\r\n");
      out.write("                    <span>专属您的服务</span><span class=\"enter01\">»</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("    \r\n");
      out.write("            <div class=\"hcc_cont\">\r\n");
      out.write("                <div class=\"hccc_left\">\r\n");
      out.write("                    <div class=\"hccc_lefthover\">\r\n");
      out.write("                        <img src=\"images/xiuche.jpg\" class=\"hccc_leftimg\"/>\r\n");
      out.write("                        <img src=\"images/yizhan.png\" class=\"yizhan\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"az_lianjie\">\r\n");
      out.write("                        <div class=\"azw_left\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=1&number=10&start=0\" class=\"az_wenzi\">非防爆胎轮胎安装</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=3&number=10&start=0\" class=\"az_wenzi\">防爆胎轮胎安装</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=15&number=10&start=0\" class=\"az_wenzi\">安装氙气大灯</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=17&number=10&start=0\" class=\"az_wenzi\">安装胎压报警器</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"azw_right\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=19&number=10&start=0\" class=\"az_wenzi\"><span>安装倒车影像</span></a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=23&number=10&start=0\" class=\"az_wenzi\">安装防眩镜</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=25&number=10&start=0\" class=\"az_wenzi\">安装车载导航</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=29&number=10&start=0\" class=\"az_wenzi\">安装倒车雷达</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"hccc_right\">\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=1&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    轮胎安装<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/luntai.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=5&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    轮毂安装<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/lunzha.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-bottom: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=17&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    安装胎压报警器<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/dongph.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=9&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换气门嘴<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/qimen.jpg\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=11&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    轮胎换位<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/huanwei.jpg\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-top: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=13&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    充氮气<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/chongqi.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"home_cont\">\r\n");
      out.write("            <div class=\"hc_biaoti\">\r\n");
      out.write("                <span class=\"maintain_title\">快修保养</span>\r\n");
      out.write("                <a href=\"");
      out.print(ctx);
      out.write("/conserve.jsp\" class=\"morefw\">\r\n");
      out.write("                    <!-- <span class=\"enter01\" >专属您的服务</span> -->\r\n");
      out.write("                    <span>专属您的服务</span><span class=\"enter01\">»</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"hcc_cont\">\r\n");
      out.write("                <div class=\"hccc_left\">\r\n");
      out.write("                    <div class=\"hccc_lefthover\">\r\n");
      out.write("                        <img src=\"images/baoyang.jpg\" class=\"hccc_leftimg\"/>\r\n");
      out.write("                        <img src=\"images/yanghu.png\" class=\"yizhan\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"az_lianjie\">\r\n");
      out.write("                        <div class=\"azw_left\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=39&number=10&start=0\" class=\"az_wenzi\">更换空调滤清器</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=43&number=10&start=0\" class=\"az_wenzi\">更换刹车片</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=45&number=10&start=0\" class=\"az_wenzi\">更换刹车盘</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=51&number=10&start=0\" class=\"az_wenzi\">更换防冻液</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"azw_right\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=49&number=10&start=0\" class=\"az_wenzi\"><span>更换刹车感应线</span></a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=47&number=10&start=0\" class=\"az_wenzi\">更换刹车油/制动液</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=55&number=10&start=0\" class=\"az_wenzi\">更换火花塞</a>\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=57&number=10&start=0\" class=\"az_wenzi\">更换变速箱油</a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"hccc_right\">\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=85&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换减震器/避震<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/lunzha.png\" style=\"height: 112px;\" />\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=59&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换转向油<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/maintain_02.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-bottom: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=33&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换机油、机滤<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/maintain_03.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=35&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换空气滤清器<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/maintain_04.png\" style=\"height: 112px\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=37&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换燃油滤清器<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/maintain_05.png\" style=\"height: 200px\" />\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"hcccr_cont\" style=\"border-top: 1px solid #e1e1e1\">\r\n");
      out.write("                        <div class=\"hcccr_juti\">\r\n");
      out.write("                            <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=41&number=10&start=0\">\r\n");
      out.write("                                <div class=\"hccjt_biaoti\">\r\n");
      out.write("                                    更换汽/燃油泵总成<span>PROFESSIONAL</span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"hccjt_img\">\r\n");
      out.write("                                    <img src=\"images/maintain_06.png\"/>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div style=\"height:32px;\"></div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"home_cont\" style=\"position: relative;\">\r\n");
      out.write("            <div class=\"hc_biaoti\" style=\"position:absolute; top:0;left:0;\">\r\n");
      out.write("                <span class=\"beauty_title\">美容装潢</span>\r\n");
      out.write("                <a href=\"");
      out.print(ctx);
      out.write("/upholster.jsp\" class=\"morefw\">\r\n");
      out.write("                    <span>专属您的服务</span><span class=\"enter01\">»</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"meir_cont\">\r\n");
      out.write("            ");
if(product_list_first.size() > 0){
                int num = 4;
                if(product_list_first.size() < 4){
                   num = product_list_first.size();
                }
                for(int i = 0;i < num;i ++){
            
      out.write("\r\n");
      out.write("                <div class=\"meic_cont\" style=\"border: 1px solid #dcdcdc;\">\r\n");
      out.write("                    <div class=\"meic_contimg\">\r\n");
      out.write("                        <a href=\"");
      out.print(ctx);
      out.write("/former/getproductinfo?pid=");
      out.print(product_list_first.get(i).getId());
      out.write("\">\r\n");
      out.write("                        ");

                        if(null != product_list_first.get(i).getIcon() && product_list_first.get(i).getIcon().length() > 0){
                        
      out.write("                       \r\n");
      out.write("                        <img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + product_list_first.get(i).getPath());
      out.write("&imageName=");
      out.print(product_list_first.get(i).getIcon());
      out.write("\" class=\"product_icon\" style=\"width:275px;height:290px;\">                       \r\n");
      out.write("                        ");

                        }else{
                        
      out.write("\r\n");
      out.write("                        <img src=\"");
      out.print(ctx);
      out.write("/images/meirong.jpg\">\r\n");
      out.write("                        ");

                        }
                        
      out.write(" \r\n");
      out.write("                        </a> \r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"meirc_wenzi\">\r\n");
      out.write("                        <p style=\"color:#000000\">");
      out.print(product_list_first.get(i).getTitle());
      out.write("</p>\r\n");
      out.write("                        <p style=\"color:#a6a4a4\">");
      out.print(product_list_first.get(i).getAbstract_());
      out.write("</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"qianggou\">\r\n");
      out.write("                    ¥ ");
      out.print(df.format(product_list_first.get(i).getNewprice()));
      out.write("<span><del>¥ ");
      out.print(df.format(product_list_first.get(i).getOldprice()));
      out.write("<div class=\"\"></div></del></span>\r\n");
      out.write("                        <a href=\"");
      out.print(ctx);
      out.write("/former/getproductinfo?pid=");
      out.print(product_list_first.get(i).getId());
      out.write("\"><div class=\"qg_botton\">抢购</div></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            ");

                }
            
      out.write("\r\n");
      out.write("            ");
}
      out.write("\r\n");
      out.write("            \r\n");
      out.write("               <!--  <div class=\"meic_cont\" id=\"meic_cont\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc\">\r\n");
      out.write("                    <div class=\"meic_contimg\">\r\n");
      out.write("                        <img src=\"images/meirong.jpg\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"meirc_wenzi\">\r\n");
      out.write("                        <p style=\"color:#000000\">爱车基础保护方案</p>\r\n");
      out.write("                        <p style=\"color:#a6a4a4\">洗车+打蜡+免工时费</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"qianggou\">\r\n");
      out.write("                        ¥50<span>¥120<div class=\"dzxian\"></div></span>\r\n");
      out.write("                        <a href=\"\"><div class=\"qg_botton\">抢购</div></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div> -->\r\n");
      out.write("\r\n");
      out.write("                <!-- <div class=\"meic_cont\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc\">\r\n");
      out.write("                    <div class=\"meic_contimg\">\r\n");
      out.write("                        <img src=\"images/meirong.jpg\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"meirc_wenzi\">\r\n");
      out.write("                        <p style=\"color:#000000\">爱车基础保护方案</p>\r\n");
      out.write("                        <p style=\"color:#a6a4a4\">洗车+打蜡+免工时费</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"qianggou\">\r\n");
      out.write("                        ¥50<span>¥120<div class=\"dzxian\"></div></span>\r\n");
      out.write("                        <div class=\"qg_botton\">抢购</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"meic_cont\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc\">\r\n");
      out.write("                    <div class=\"meic_contimg\">\r\n");
      out.write("                        <img src=\"images/meirong.jpg\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"meirc_wenzi\">\r\n");
      out.write("                        <p style=\"color:#000000\">爱车基础保护方案</p>\r\n");
      out.write("                        <p style=\"color:#a6a4a4\">洗车+打蜡+免工时费</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"qianggou\">\r\n");
      out.write("                        ¥50<span>¥120<div class=\"dzxian\"></div></span>\r\n");
      out.write("                        <div class=\"qg_botton\">抢购</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"meic_cont\" style=\"border-right: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc;border-left: 1px solid #dcdcdc\">\r\n");
      out.write("                    <div class=\"meic_contimg\">\r\n");
      out.write("                        <img src=\"images/meirong.jpg\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"meirc_wenzi\">\r\n");
      out.write("                        <p style=\"color:#000000\">爱车基础保护方案</p>\r\n");
      out.write("                        <p style=\"color:#a6a4a4\">洗车+打蜡+免工时费</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"qianggou\">\r\n");
      out.write("                        ¥50<span>¥120<div class=\"dzxian\"></div></span>\r\n");
      out.write("                        <div class=\"qg_botton\">抢购</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div> -->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div style=\"height:32px;\"></div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"home_cont\" style=\"position: relative;\">\r\n");
      out.write("            <div class=\"hc_biaoti\" style=\"position:absolute; top:0;left:0;\">\r\n");
      out.write("                <span class=\"checking_title\">检测修正</span>\r\n");
      out.write("                <a href=\"");
      out.print(ctx);
      out.write("/check.jsp\" class=\"morefw\">\r\n");
      out.write("                    <!-- <span class=\"enter01\" >专属您的服务</span> -->\r\n");
      out.write("                   <span>专属您的服务</span><span class=\"enter01\">»</span> \r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"jc\">\r\n");
      out.write("                <div class=\"jc_left\">\r\n");
      out.write("                    <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=119&number=10&start=0\">\r\n");
      out.write("                        <div class=\"jcl_cont\" id=\"jcl_cont\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc\">\r\n");
      out.write("                            \r\n");
      out.write("                            <div class=\"jclcc\">\r\n");
      out.write("                                <img src=\"images/guzhangd.png\" id=\"jclccimg\"/>\r\n");
      out.write("                                <p>常用故障灯检测</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            \r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=121&number=10&start=0\">\r\n");
      out.write("                        <div class=\"jcl_cont\" id=\"jcl_conts\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc\">\r\n");
      out.write("                            <div class=\"jclcc\">\r\n");
      out.write("                                <img src=\"images/dongphhui.png\" id=\"jclccimgs\"/>\r\n");
      out.write("                                <p>动平衡</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=117&number=10&start=0\">\r\n");
      out.write("                        <div class=\"jcl_cont\" id=\"jcl_contss\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc\">\r\n");
      out.write("                            <div class=\"jclcc\">\r\n");
      out.write("                                <img src=\"images/4f_01.png\" id=\"jclccimgss\"/>\r\n");
      out.write("                                <p>四轮定位检测</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <a href=\"");
      out.print(ctx);
      out.write("/former/getproduct?sp_id=113&number=10&start=0\">\r\n");
      out.write("                        <div class=\"jcl_cont\" id=\"jcl_contsss\" style=\"border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc\">\r\n");
      out.write("                            <div class=\"jclcc\">\r\n");
      out.write("                                <img src=\"images/4f_02.png\" id=\"jclccimgsss\"/>\r\n");
      out.write("                                <p>四轮定位调整</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"weixiukeng\">\r\n");
      out.write("                    <!-- <a href=\"");
      out.print(ctx);
      out.write("/check.jsp\">\r\n");
      out.write("                       <img src=\"images/weixiukeng.jpg\"/>\r\n");
      out.write("                    </a> -->\r\n");
      out.write("                        ");

                         List<Advertising> ad_list6 = advertisingDao.findAdvByLocation(4);
                        if(ad_list6.size() > 0){
                            for(int i = 0;i < ad_list6.size();i ++){
                                String str_href = "javascript:void(0)";
                                if(null != ad_list6.get(i).getHref() && ad_list6.get(i).getHref().length() > 0){
                                    str_href = ad_list6.get(i).getHref();
                                }
                        
      out.write("\r\n");
      out.write("                        <a href=\"");
      out.print(str_href);
      out.write("\"><img style=\"height:100%\" src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + ad_list6.get(i).getPath());
      out.write("&imageName=");
      out.print(ad_list6.get(i).getImage());
      out.write("\"></a>\r\n");
      out.write("                        ");

                            }
                        }
                        
      out.write("                   \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"guanggaos\">\r\n");
      out.write("            ");

            List<Advertising> ad_list4 = advertisingDao.findAdvByLocation(5);
            List<Advertising> ad_list5 = advertisingDao.findAdvByLocation(6);
            if(ad_list4.size() > 0){
                for(int i = 0;i < ad_list4.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list4.get(i).getHref() && ad_list4.get(i).getHref().length() > 0){
                        str_href = ad_list4.get(i).getHref();
                    }
            
      out.write("\r\n");
      out.write("            <a href=\"");
      out.print(str_href);
      out.write("\"><img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + ad_list4.get(i).getPath());
      out.write("&imageName=");
      out.print(ad_list4.get(i).getImage());
      out.write("\" class=\"guanggao3\"></a>\r\n");
      out.write("            ");

                }
            }
            if(ad_list5.size() > 0){
                for(int i = 0;i < ad_list5.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list5.get(i).getHref() && ad_list5.get(i).getHref().length() > 0){
                        str_href = ad_list5.get(i).getHref();
                    }
            
      out.write("\r\n");
      out.write("            <a href=\"");
      out.print(str_href);
      out.write("\"><img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + ad_list5.get(i).getPath());
      out.write("&imageName=");
      out.print(ad_list5.get(i).getImage());
      out.write("\" class=\"guanggao4\"></a>\r\n");
      out.write("            ");

                }
            }  
            
      out.write("\r\n");
      out.write("            <!-- <a href=\"\"><img src=\"images/guanggao3.jpg\" class=\"guanggao3\"/></a>\r\n");
      out.write("            <img src=\"images/guanggao4.jpg\" class=\"guanggao4\"/> -->\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        ");

        int comm_num = 0;
        if(comment_list.size() > 0){
            if(comment_list.size() < 3){
                comm_num = comment_list.size();
            }else{
                comm_num = 3;
            }
        }
        
      out.write("\r\n");
      out.write("        <div class=\"home_contkh\">\r\n");
      out.write("            <div class=\"kp_biaoti\">\r\n");
      out.write("                <span class=\"evaluate_title\" style=\"color: #007fcc\">客户评价</span>\r\n");
      out.write("    <!--             <a href=\"");
      out.print(ctx);
      out.write("/advistory.jsp\" class=\"morefw\"><span>更多</span><img src=\"images/chengyou.png\"/></a> -->\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"height:2px\"></div>\r\n");
      out.write("            <div class=\"kp_biaotis\">\r\n");
      out.write("                <span class=\"evaluate_title\" style=\"color: #007fcc; font-size: 1.6em;\">咨询</span>\r\n");
      out.write(" <!--                <a href=\"");
      out.print(ctx);
      out.write("/advistory.jsp\" class=\"morefw\"><span>更多</span><img src=\"images/chengyou.png\"/></a> -->\r\n");
      out.write("            </div>\r\n");
      out.write("            <div style=\"height:2px\"></div>\r\n");
      out.write("            <div class=\"kp_cont\">\r\n");
      out.write("                <div class=\"kpc_left\">\r\n");
      out.write("                    ");
for(int i = 0;i < comm_num;i ++){
                        int star = comment_list.get(i).getStar();
                    
      out.write("\r\n");
      out.write("                        <div class=\"kpcl_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                            <div class=\"pjdengji\">\r\n");
      out.write("                                评价\r\n");
      out.write("                                ");
for(int j = 0;j < star;j ++){
      out.write("\r\n");
      out.write("                                <img src=\"");
      out.print(ctx);
      out.write("/img/star_1.png\"/>\r\n");
      out.write("                                ");

                                }
                                for(int k = 0;k < 5 - star;k ++){
                                
      out.write("\r\n");
      out.write("                                <img src=\"");
      out.print(ctx);
      out.write("/img/star_2.png\"/>\r\n");
      out.write("                                ");

                                }
                                
      out.write("\r\n");
      out.write("                                <span>\r\n");
      out.write("                                    ");
if(comment_list.get(i).getUser() != null){
      out.write("\r\n");
      out.write("                                    ");
      out.print(comment_list.get(i).getUser().getPhone().substring(0,3) + "xxxx" + comment_list.get(i).getUser().getPhone().substring(8,11));
      out.write("\r\n");
      out.write("                                    ");
}
      out.write("\r\n");
      out.write("                                    @\r\n");
      out.write("                                    ");
if(comment_list.get(i).getServiceShop() != null){
      out.write("\r\n");
      out.write("                                    ");
      out.print(comment_list.get(i).getServiceShop().getTitle());
      out.write("\r\n");
      out.write("                                    ");
}
      out.write("\r\n");
      out.write("                                    &nbsp;&nbsp;&nbsp;\r\n");
      out.write("                                    评价于：");
      out.print(formatter2.format(comment_list.get(i).getCreatedTime()));
      out.write("\r\n");
      out.write("                                </span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"pj_neirong\">\r\n");
      out.write("                                ");
      out.print(comment_list.get(i).getContent());
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                    <!-- <div class=\"kpcl_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                        <div class=\"pjdengji\">\r\n");
      out.write("                            评价                           \r\n");
      out.write("                            <img src=\"img/star_1.png\"/>\r\n");
      out.write("                            <img src=\"img/star_1.png\"/>\r\n");
      out.write("                            <img src=\"img/star_1.png\"/>\r\n");
      out.write("                            <img src=\"img/star_1.png\"/>\r\n");
      out.write("                            <img src=\"img/star_1.png\"/>\r\n");
      out.write("                            <span>132XXXX5689@昌平南环乐天店&nbsp;&nbsp;&nbsp;评价于：2015-02-01 20:09:32</span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"pj_neirong\">\r\n");
      out.write("                            专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服专注汽车服务专注汽车服务\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"kpcl_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                        <div class=\"pjdengji\">\r\n");
      out.write("                            评价<img src=\"images/xingji.png\"/><span>132XXXX5689@昌平南环乐天店&nbsp;&nbsp;&nbsp;评价于：2015-02-01 20:09:32</span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"pj_neirong\">\r\n");
      out.write("                            专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服专注汽车服务专注汽车服务\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"kpcl_cont\">\r\n");
      out.write("                        <div class=\"pjdengji\">\r\n");
      out.write("                            评价<img src=\"images/xingji.png\"/><span>132XXXX5689@昌平南环乐天店&nbsp;&nbsp;&nbsp;评价于：2015-02-01 20:09:32</span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"pj_neirong\">\r\n");
      out.write("                            专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服专注汽车服务专注汽车服务\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div> -->\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"kpc_right\">\r\n");
      out.write("                    ");

                    if(advisory_list.size() > 0){
                        int ad_num = 4;
                        if(advisory_list.size() < 4){
                            ad_num = advisory_list.size();
                        }
                        for(int i = 0;i < ad_num;i ++){
                            if(i == ad_num - 1){
                    
      out.write("\r\n");
      out.write("                    <div class=\"kpcr_cont\">\r\n");
      out.write("                        ");
      out.print(advisory_list.get(i).getUsecontent());
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    ");
            
                            }else{
                    
      out.write("\r\n");
      out.write("                    <div class=\"kpcr_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                        ");
      out.print(advisory_list.get(i).getUsecontent());
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    ");
      }
                        }
                    }
      out.write("\r\n");
      out.write("                    <!-- <div class=\"kpcr_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"kpcr_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"kpcr_cont\" style=\"border-bottom: 1px solid #dcdcdc;\">\r\n");
      out.write("                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"kpcr_cont\">\r\n");
      out.write("                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网\r\n");
      out.write("                    </div> -->\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <!-- znn 影藏优惠 2015-11-20-->\r\n");
      out.write("        <!-- <div class=\"home_contkh\" style=\"padding-left: 10px;padding-right: 10px;padding-bottom:79px;\">\r\n");
      out.write("            <div class=\"kp_biaoti\" style=\"padding-bottom:10px;\">\r\n");
      out.write("                <span style=\"color: #007fcc\">优惠活动</span>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"youhui_cont\">\r\n");
      out.write("                ");

                    if(coupon_list.size() > 0){
                        int coupon_num = 6;
                        if(coupon_list.size() < 6){
                            coupon_num = coupon_list.size();
                        }
                        for(int i = 0;i < coupon_num;i ++){
                
      out.write("\r\n");
      out.write("                <div class=\"yhc_cont\">\r\n");
      out.write("                    <div class=\"yhc_contimg\">\r\n");
      out.write("                        ");

                            if(null != coupon_list.get(i).getImage() && coupon_list.get(i).getImage().length() > 0){
                        
      out.write("\r\n");
      out.write("                         <a href=\"couponDetail.jsp?ids=");
      out.print(coupon_list.get(i).getId());
      out.write("\" method=\"post\">\r\n");
      out.write("                        \t<img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + coupon_list.get(i).getPath());
      out.write("&imageName=");
      out.print(coupon_list.get(i).getImage());
      out.write("\"/>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        ");

                            }else{
                        
      out.write("\r\n");
      out.write("                        <a href=\"couponDetail.jsp?ids=");
      out.print(coupon_list.get(i).getId());
      out.write("\" method=\"post\">\r\n");
      out.write("                            <img src=\"");
      out.print(ctx);
      out.write("/images/youhui.jpg\">\r\n");
      out.write("                        </a>\r\n");
      out.write("                        ");

                            }
                        
      out.write("  \r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"yhcc_wenzi\">\r\n");
      out.write("                        <span style=\"width: 213px;\">\r\n");
      out.write("                            ");
      out.print(coupon_list.get(i).getTitle());
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span style=\"width: 80px;\">\r\n");
      out.write("                            金额:");
      out.print(String.valueOf(coupon_list.get(i).getMoney()));
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span style=\"width: 100%;margin-top: 10px\">\r\n");
      out.write("                            活动时间:");
      out.print(d_f.format(coupon_list.get(i).getCreatedTime()));
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                    }
                
      out.write("\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div> -->\r\n");
      out.write("\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footSection.jsp", out, true);
      out.write("\r\n");
      out.write("        <div id=\"scroll_Top\" class=\"scroll_Top\" onClick=\"$.$w.windowScroll(0);\">\r\n");
      out.write("            <img src=\"images/fanhuil.png\" width=\"30px\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("    $('.lbc_left').show();\r\n");
      out.write("})\r\n");
      out.write("</script>\r\n");
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
