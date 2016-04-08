package org.apache.jsp.apphybrid;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.smart4c.bean.*;
import com.smart4c.dao.UsersDao;
import com.smart4c.util.SpringUtils;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import com.smart4c.common.SmartProperties;

public final class my_002dorder_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String ctx = request.getContextPath();
    User user = (User)session.getAttribute("user");
    String userIdChubao = user.getUserExternal().getUserId();
    JSONObject json =(JSONObject)request.getAttribute("jsonObj");
    int curPage =  (Integer)json.get("curPage");
    int totalPages = (Integer) json.get("totalPages");
    JSONArray jarray = json.getJSONArray("dataRows");
    SmartProperties smartProp = SmartProperties.getInstance();
    String imgPath = smartProp.getImgPath();

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
      out.write("  <title>我的订单</title>\r\n");
      out.write("\r\n");
      out.write("  <!-- Set render engine for 360 browser -->\r\n");
      out.write("  <meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("\r\n");
      out.write("  <!-- No Baidu Siteapp-->\r\n");
      out.write("  <meta http-equiv=\"Cache-Control\" content=\"no-siteapp\"/>\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" href=");
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
      out.write("<style type=\"text/css\">\r\n");
      out.write("body{ background:#eee;}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div data-am-widget=\"titlebar\" class=\"am-titlebar am-titlebar-cols\"  style=\"margin-top:-1px;\">\r\n");
      out.write("    ");
if("100".equals(json.get("state").toString())){
      out.write("　\r\n");
      out.write("        <h2 class=\"am-titlebar-title \">\r\n");
      out.write("    ");
}else{
      out.write("\r\n");
      out.write("        <h2 class=\"\">\r\n");
      out.write("    ");
}
      out.write("\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=100\" class=\"\" style=\"margin-right:10px; margin-left:10px;\">全部</a>\r\n");
      out.write("    </h2>\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"am-titlebar-nav\">\r\n");
      out.write("        ");
if("0".equals(json.get("state").toString())){
      out.write("　\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=0\" class=\"am-titlebar-title\" style=\"margin-right:10px; margin-left:10px;\">待付款</a>\r\n");
      out.write("        ");
}else{
      out.write("\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=0\" class=\"\" style=\"margin-right:10px; margin-left:10px;\">待付款</a>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        ");
if("2".equals(json.get("state").toString())){
      out.write("　\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=2\" class=\"am-titlebar-title\" style=\"margin-right:10px; margin-left:10px;\">待评价</a>\r\n");
      out.write("        ");
}else{
      out.write("\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=2\" class=\"\" style=\"margin-right:10px; margin-left:10px;\">待评价</a>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        ");
if("4".equals(json.get("state").toString())){
      out.write("　\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=4\" class=\"am-titlebar-title\" style=\"margin-right:10px; margin-left:10px;\">退款单</a>\r\n");
      out.write("        ");
}else{
      out.write("\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=4\" class=\"\" style=\"margin-right:10px; margin-left:10px;\">退款单</a>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("    </nav>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
 if(jarray !=null && jarray.size()>0) {
    for(int i=0;i<jarray.size();i++){

      out.write("\r\n");
      out.write("<div class=\"am-panel am-panel-default\">\r\n");
      out.write("    <div class=\"am-panel-hd\">\r\n");
      out.write("        <a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order-detail.jsp?orderId=");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write("\">\r\n");
      out.write("            <div class=\"am-cf\" style=\" margin-left:-15px;\">\r\n");
      out.write("                <div class=\"am-fl\"><img src=\"");
      out.print(ctx);
      out.write("/common/displayPic?imagePath=");
      out.print(imgPath + jarray.getJSONObject(i).get("path"));
      out.write("&imageName=");
      out.print(jarray.getJSONObject(i).get("icon"));
      out.write("\" width=\"80\" height=\"69\"></div>\r\n");
      out.write("                <div class=\"am-fr\" style=\"margin-top:4px;\"><li style=\"list-style-type:none; font-size:14px;\">");
      out.print(jarray.getJSONObject(i).get("spTitle"));
      out.write("<br><span style=\"font-size:12px;\">");
      out.print(jarray.getJSONObject(i).get("name") );
      out.write("</span><br>\r\n");
      out.write("\r\n");
      out.write("                    <span style=\"font-size:12px;\">服务门店：");
      out.print(jarray.getJSONObject(i).get("shopTitle"));
      out.write("</span><strong style=\"color:#FF7419\" class=\"am-fr\">¥");
      out.print(jarray.getJSONObject(i).get("paid"));
      out.write("</strong>\r\n");
      out.write("                </li>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"am-panel-bd\">\r\n");
      out.write("        <div class=\"am-cf\">\r\n");
      out.write("            <span class=\"am-fr\" style=\"font-size:10px; color:#666666; margin-right:-5px; margin-top:-10px; margin-bottom:-10px;\">\r\n");
      out.write("               ");
if("0".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("            <button type=\"button\" onclick=\"select(");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write(',');
      out.print(jarray.getJSONObject(i).get("paid"));
      out.write(")\" class=\"am-btn am-btn-warning am-btn-xs\">去支付</button>\r\n");
      out.write("            <button type=\"button\" onclick=\"cancerOrder(");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write(")\" class=\"am-btn am-btn-warning am-btn-xs\">取消</button>　\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("       ");
if("1".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("        <button type=\"button\" onclick=\"sureOrder(");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write(")\" class=\"am-btn am-btn-warning am-btn-xs\">确认使用</button>　\r\n");
      out.write("         <button type=\"button\" onclick=\"refundOrder(");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write(")\" class=\"am-btn am-btn-warning am-btn-xs\">退款</button>　\r\n");
      out.write("         ");
}
      out.write("\r\n");
      out.write("        ");
if("2".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("            <button type=\"button\" onclick=\"commentOrder(");
      out.print(jarray.getJSONObject(i).get("id"));
      out.write(")\" class=\"am-btn am-btn-warning am-btn-xs\">去评价</button>　\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        ");
if("3".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("             <span style=\"color:green\">已评价</span>\r\n");
      out.write("         ");
}
      out.write("\r\n");
      out.write("        ");
if("4".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("             <span style=\"color:#ff7f50\">退款中</span>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        ");
if("5".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("             <span style=\"color:green\">退款成功</span>\r\n");
      out.write("         ");
}
      out.write("\r\n");
      out.write("        ");
if("6".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("            <span style=\"color:red\">退款失败</span>　\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("        ");
if("7".equals(jarray.getJSONObject(i).get("orderState").toString())){
      out.write("　\r\n");
      out.write("            <span style=\"color:gray\">已取消</span>　\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("            </span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
 } }else{
      out.write("\r\n");
      out.write("<div align=\"center\">未查询到相关订单哦...</div>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
 if(1 < totalPages){if(curPage < totalPages){ 
      out.write("\r\n");
      out.write("<div align=\"center\"><a href=\"");
      out.print(ctx);
      out.write("/apphybrid/my-order.do?userId=");
      out.print(json.get("userId"));
      out.write("&state=");
      out.print(json.get("state"));
      out.write("&page.curPageNo=");
      out.print(curPage+1);
      out.write("\">点击下一页……</a></div>\r\n");
      out.write("\r\n");
 }else{ 
      out.write("\r\n");
      out.write("<div align=\"center\">已经是最后一页</div>\r\n");
 }} 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-modal am-modal-confirm\" tabindex=\"-1\" id=\"cancer\">\r\n");
      out.write("    <div class=\"am-modal-dialog\">\r\n");
      out.write("        <div class=\"am-modal-hd\">警告</div>\r\n");
      out.write("        <div class=\"am-modal-bd\">\r\n");
      out.write("            你，确定要取消该订单吗？\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"am-modal-footer\">\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-cancel>算了</span>\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-confirm>确定</span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-modal am-modal-confirm\" tabindex=\"-1\" id=\"cancer\">\r\n");
      out.write("    <div class=\"am-modal-dialog\">\r\n");
      out.write("        <div class=\"am-modal-hd\">警告</div>\r\n");
      out.write("        <div class=\"am-modal-bd\">\r\n");
      out.write("            你，确定要取消该订单吗？\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"am-modal-footer\">\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-cancel>算了</span>\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-confirm>确定</span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"am-modal am-modal-confirm\" tabindex=\"-1\" id=\"sure\">\r\n");
      out.write("    <div class=\"am-modal-dialog\">\r\n");
      out.write("        <div class=\"am-modal-hd\">警告</div>\r\n");
      out.write("        <div class=\"am-modal-bd\">\r\n");
      out.write("            你，确定已经使用了该订单吗？\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"am-modal-footer\">\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-cancel>算了</span>\r\n");
      out.write("            <span class=\"am-modal-btn\" data-am-modal-confirm>确定</span>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
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
      out.write("<script src=\"assets/js/amazeui.ie8polyfill.min.js\"></script>\r\n");
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
      out.write("\r\n");
      out.write("    //支付\r\n");
      out.write("    function select(orderId,paid){\r\n");
      out.write("            ctk.logged({\r\n");
      out.write("                yes: function(res) {\r\n");
      out.write("                    ctk.select({\r\n");
      out.write("                        tradeService: 'com.80ycw.autoservice',\r\n");
      out.write("                        totalFee: paid*100,\r\n");
      out.write("                        success: function(res) {\r\n");
      out.write("                            console.log(JSON.stringify(res));\r\n");
      out.write("                            var tradeStr = res.tradeStr;\r\n");
      out.write("                            requestPay(tradeStr,paid*100,orderId);\r\n");
      out.write("                            ctk.show();\r\n");
      out.write("                        },\r\n");
      out.write("                        fail: function(res) {\r\n");
      out.write("                            console.log('取消');\r\n");
      out.write("                        }\r\n");
      out.write("                    });\r\n");
      out.write("                },\r\n");
      out.write("                no: function(res) {\r\n");
      out.write("                    alert('请先登录！');\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function requestPay(tradeStr,paid,orderId) {\r\n");
      out.write("        var chubaoId='");
      out.print(userIdChubao);
      out.write("';\r\n");
      out.write("        var url = '");
      out.print(ctx);
      out.write("/apphybrid/trade.do?chuBaoUserId='+chubaoId+'&totalFee='+paid+'&tradeStr=' + tradeStr+'&orderId='+orderId;\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            url: url,\r\n");
      out.write("            type: 'get',\r\n");
      out.write("            dataType: 'json',\r\n");
      out.write("            success: function (ret) {\r\n");
      out.write("                ctk.pay({\r\n");
      out.write("                    payStr: ret.payStr,\r\n");
      out.write("                    finish: function(resCode) {\r\n");
      out.write("                        ctk.dismiss();\r\n");
      out.write("                        window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/pay-result.jsp?orderId=\"+orderId+\"&resCode=\"+resCode;\r\n");
      out.write("                        console.log('resCode: ' + resCode);\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            },\r\n");
      out.write("            error: function () {\r\n");
      out.write("                ctk.dismiss();\r\n");
      out.write("                alert('请求支付失败');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function cancerOrder(orderId){\r\n");
      out.write("        var uri=\"");
      out.print(ctx);
      out.write("/apphybrid/cancerOrder.do?orderId=\"+orderId;\r\n");
      out.write("        $('#cancer').modal({\r\n");
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
      out.print(json.get("userId"));
      out.write("&state=\"+");
      out.print(json.get("state") );
      out.write(";\r\n");
      out.write("                        }else{\r\n");
      out.write("                            alert(\"该订单不存在！\");\r\n");
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
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("    function sureOrder(orderId){\r\n");
      out.write("        var uri=\"");
      out.print(ctx);
      out.write("/apphybrid/sureOrder.do?orderId=\"+orderId;\r\n");
      out.write("        $('#sure').modal({\r\n");
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
      out.print(json.get("userId"));
      out.write("&state=\"+");
      out.print(json.get("state") );
      out.write(";\r\n");
      out.write("                        }else{\r\n");
      out.write("                            alert(\"该订单不存在！\");\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("    function refundOrder(orderId){\r\n");
      out.write("        window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/order-refund.jsp?orderId=\"+orderId;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function commentOrder(orderId){\r\n");
      out.write("        window.location.href=\"");
      out.print(ctx);
      out.write("/apphybrid/order-evaluate.jsp?orderId=\"+orderId;\r\n");
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
