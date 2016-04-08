package org.apache.jsp.tyre;

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
import net.sf.json.JSONObject;

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
      out.write("\r\n");

    String ctx = request.getContextPath();
    AreaDao areaDao = (AreaDao) SpringUtils.getBean(AreaDao.class);
    List<Area> areaList = areaDao.findAllProvince();
    JSONObject json =(JSONObject)request.getAttribute("jsonObj");
    int storeNum = (Integer)json.get("storeNum");
    int storeNumRemain = 500-storeNum;
    if( storeNumRemain <= 0){
        storeNumRemain = 0;
    }
    String num = String.format("%04d",storeNum);
    char numStr[] = num.toCharArray();
    List<String> isRepeat = new ArrayList<String>();
    List<Area> citys = new ArrayList<Area>();
    if(areaList !=null && areaList.size() > 0){
        citys = areaDao.findCityByProvince(areaList.get(0).getId());
    }

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html class=\"no-js\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\" />\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("    <title>欢迎入驻轮胎点点</title>\r\n");
      out.write("    <link href=\"");
      out.print(ctx );
      out.write("/assets/css/index.css\" rel=\"stylesheet\"/>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"mainbody\">\r\n");
      out.write("    <div class=\"content-box\">\r\n");
      out.write("        <img src=\"../assets/images/md_01.jpg\" width=\"100%\"/>\r\n");
      out.write("        <div class=\"syme\">");
      out.print(storeNumRemain);
      out.write("</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"content-box2\">\r\n");
      out.write("        <div class=\"nowhaver-zi\" style=\"margin-left:4%;\">已有</div>\r\n");
      out.write("        <div class=\"nowhaver-shu\">\r\n");
      out.write("            <ul>\r\n");
      out.write("                ");
for(char i:numStr){
      out.write("\r\n");
      out.write("                <li><div>");
      out.print(i);
      out.write("</div><span><em></em></span></li>\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"nowhaver-zi\">家门店成功入驻！</div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"content-box\"><img src=\"../assets/images/md_03.jpg\" width=\"100%\"/></div>\r\n");
      out.write("    <div class=\"content-box3\">\r\n");
      out.write("        <form id=\"store\" action=\"");
      out.print(ctx);
      out.write("/tyre/saveStore.do\" method=\"POST\" enctype=\"multipart/form-data\">\r\n");
      out.write("            <ul>\r\n");
      out.write("                <li>门店名称 <input class=\"boxt_input\" id=\"storename\" name=\"store.storename\" type=\"text\"  onblur=\"if(this.value == ''){$('.name_error').show();}else{$('.name_error').hide();}\"/> <br><span class=\"name_error\">*请输入门店名称</span></li>\r\n");
      out.write("                <li>联&nbsp;系&nbsp;人&nbsp;&nbsp; <input class=\"boxt_input\" id=\"linkman\" name=\"store.linkman\" type=\"text\" onblur=\"if(this.value == ''){$('.linkman_error').show();}else{$('.linkman_error').hide();}\"/><br><span class=\"linkman_error\">*请输入联系人</span></li>\r\n");
      out.write("                <li>联系电话 <input class=\"boxt_input\" id=\"mobile\" name=\"store.mobile\" type=\"text\"  onblur=\"if(this.value == ''){$('.mobile_error').show();}else{$('.mobile_error').hide();}\"/><br><span class=\"mobile_error\">*请输入联系电话</span></li>\r\n");
      out.write("                <li>省份  <select class=\"boxt_input2\" id=\"provinceSelect\" style=\"width:100px\">\r\n");
      out.write("                    ");

                        for(int i = 0;i < areaList.size();i++){
                    
      out.write("\r\n");
      out.write("                    <option value=\"");
      out.print(areaList.get(i).getId());
      out.write('"');
      out.write('>');
      out.print(areaList.get(i).getAreaname());
      out.write("</option>\r\n");
      out.write("                    ");

                     }
                    
      out.write("\r\n");
      out.write("                </select>\r\n");
      out.write("                    城市\r\n");
      out.write("                    <select class=\"boxt_input2\" id=\"citySelect\" style=\"width:100px\">\r\n");
      out.write("                        ");

                            for(int i = 0;i < citys.size();i++){
                        
      out.write("\r\n");
      out.write("                        <option value=\"");
      out.print(citys.get(i).getId());
      out.write('"');
      out.write('>');
      out.print(citys.get(i).getAreaname());
      out.write("</option>\r\n");
      out.write("                        ");

                            }
                        
      out.write("\r\n");
      out.write("                    </select>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </li>\r\n");
      out.write("                <input type=\"hidden\" id=\"areaid\" name=\"store.areaid\" value=\"\">\r\n");
      out.write("                <li>详细地址 <input class=\"boxt_input\" id=\"address\" name=\"store.address\" type=\"text\" onblur=\"if(this.value == ''){$('.address_error').show();}else{$('.address_error').hide();}\"/><br><span class=\"address_error\">*请输入详细地址</span></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("            <div class=\"boxt_ch\"><img src=\"../assets/images/md_02.jpg\"/></div>\r\n");
      out.write("            <div class=\"boxt_jia\">\r\n");
      out.write("                <div class=\"boxt_jia2\">\r\n");
      out.write("                    <div id=\"localImag1\">\r\n");
      out.write("                        <img id=\"preview1\" width=\"-1\" height=\"-1\" style=\"display: none\" />\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"boxt_jia2\"><input class=\"boxt_jia1\" type=\"button\"  name=\"\" value=\"+\" onclick=\"addLicense()\"/><span class=\"license_error\" style=\"font-size: small\">*请上传营业执照</span></div>\r\n");
      out.write("                <div>\r\n");
      out.write("                    <input type=\"file\" name=\"filelicense\" id=\"filelicense\" hidden/>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"boxt_jia\">\r\n");
      out.write("                <div class=\"boxt_jia2\">\r\n");
      out.write("                    <div id=\"localImag2\">\r\n");
      out.write("                        <img id=\"preview2\" width=\"-1\" height=\"-1\" style=\"display: none\" />\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"boxt_jia2\"><input class=\"boxt_jia1\" type=\"button\" name=\"\" value=\"+\" onclick=\"addLogo()\"/><span class=\"logo_error\" style=\"font-size: small\">*请上传门头照片</span></div>\r\n");
      out.write("                <div>\r\n");
      out.write("                    <input type=\"file\" name=\"filelogo\" id=\"filelogo\" hidden/>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"boxbt\">\r\n");
      out.write("                <input type=\"submit\" id=\"submit\" hidden=\"\"/>\r\n");
      out.write("                <div class=\"shenqinico\"><a onclick=\"saveInfo()\" ><img src=\"../assets/images/shenqing.png\" /></a></div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    $(function(){\r\n");
      out.write("        $('.name_error').hide();\r\n");
      out.write("        $('.linkman_error').hide();\r\n");
      out.write("        $('.mobile_error').hide();\r\n");
      out.write("        $('.address_error').hide();\r\n");
      out.write("        $('.license_error').hide();\r\n");
      out.write("        $('.logo_error').hide();\r\n");
      out.write("    });\r\n");
      out.write("    $('#provinceSelect').change(function(){\r\n");
      out.write("        var pid = this.options[this.selectedIndex].value;\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            url: \"");
      out.print(ctx);
      out.write("/tyre/getCityByProvince.do?pid=\" + pid,\r\n");
      out.write("            type: \"post\",\r\n");
      out.write("            dataType: \"JSON\",\r\n");
      out.write("            async: false,\r\n");
      out.write("            timeout: 3000,\r\n");
      out.write("            success: function(ret){\r\n");
      out.write("                $('#citySelect').html(ret.html);\r\n");
      out.write("            },\r\n");
      out.write("            error: function(XMLRequest, textInfo){\r\n");
      out.write("                if(textInfo != null){\r\n");
      out.write("                    alert(textInfo);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    function saveInfo(){\r\n");
      out.write("        var storename = $('#storename').val();\r\n");
      out.write("        var linkman = $('#linkman').val();\r\n");
      out.write("        var mobile = $('#mobile').val();\r\n");
      out.write("        var address = $('#address').val();\r\n");
      out.write("        var areaid = $(\"#citySelect\").val();\r\n");
      out.write("        var fileLicense = $(\"#filelicense\").val();\r\n");
      out.write("        var fileLogo = $(\"#filelogo\").val();\r\n");
      out.write("        $('#areaid').val(areaid);\r\n");
      out.write("\r\n");
      out.write("        if(storename.length == 0){\r\n");
      out.write("            $('.name_error').show();\r\n");
      out.write("            return false;\r\n");
      out.write("        }else{\r\n");
      out.write("            if(storename == \"请输入公司名称\"){\r\n");
      out.write("                $('.name_error').show();\r\n");
      out.write("                return false;\r\n");
      out.write("            }else{\r\n");
      out.write("                $('.name_error').hide();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        if(linkman.length == 0){\r\n");
      out.write("            $('.linkman_error').show();\r\n");
      out.write("            return false;\r\n");
      out.write("        }else{\r\n");
      out.write("            if(linkman == \"请输入联系人\"){\r\n");
      out.write("                $('.linkman_error').show();\r\n");
      out.write("                return false;\r\n");
      out.write("            }else{\r\n");
      out.write("                $('.linkman_error').hide();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        if(mobile.length == 0){\r\n");
      out.write("            $('.mobile_error').show();\r\n");
      out.write("            return false;\r\n");
      out.write("        }else{\r\n");
      out.write("            if(mobile == \"请输入联系电话\"){\r\n");
      out.write("                $('.mobile_error').show();\r\n");
      out.write("                return false;\r\n");
      out.write("            }else{\r\n");
      out.write("                $('.mobile_error').hide();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        if(address.length == 0){\r\n");
      out.write("            $('.address_error').show();\r\n");
      out.write("            return false;\r\n");
      out.write("        }else{\r\n");
      out.write("            if(address == \"请输入详细地址\"){\r\n");
      out.write("                $('.address_error').show();\r\n");
      out.write("                return false;\r\n");
      out.write("            }else{\r\n");
      out.write("                $('.address_error').hide();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        if(fileLicense.length == 0){\r\n");
      out.write("            $('.license_error').show();\r\n");
      out.write("            return false;\r\n");
      out.write("        }else{\r\n");
      out.write("            $('.license_error').hide();\r\n");
      out.write("        }\r\n");
      out.write("        if(fileLogo.length == 0){\r\n");
      out.write("            $('.logo_error').show();\r\n");
      out.write("            return false;\r\n");
      out.write("        }else{\r\n");
      out.write("            $('.logo_error').hide();\r\n");
      out.write("        }\r\n");
      out.write("        $('#submit').trigger(\"click\");\r\n");
      out.write("        setTimeout(\"alertSuc()\",2000);\r\n");
      out.write("    }\r\n");
      out.write("    function alertSuc(){\r\n");
      out.write("        alert(\"恭喜你已经成功入驻点点！\");\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function addLicense(){\r\n");
      out.write("        $('#filelicense').trigger(\"click\");\r\n");
      out.write("    }\r\n");
      out.write("    $(\"#filelicense\").change(function() {\r\n");
      out.write("        setLicenseImage();\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    function addLogo(){\r\n");
      out.write("        $('#filelogo').trigger(\"click\");\r\n");
      out.write("    }\r\n");
      out.write("    $(\"#filelogo\").change(function() {\r\n");
      out.write("        setLogoImage();\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    function setLicenseImage() {\r\n");
      out.write("        var preview, img_txt, localImag, file_head = document.getElementById(\"filelicense\"),\r\n");
      out.write("                picture = file_head.value;\r\n");
      out.write("        if(!(0 < picture.indexOf('.jpg') || 0 < picture.indexOf('.gif') || 0 < picture.indexOf('.png') || 0 < picture.indexOf('.bmp') || 0 < picture.indexOf('.jpeg'))){\r\n");
      out.write("            alert(\"您上传的图片格式不正确，请重新选择！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        if (preview = document.getElementById(\"preview1\"), file_head.files && file_head.files[0])\r\n");
      out.write("        {\r\n");
      out.write("                    preview.style.display = \"block\",\r\n");
      out.write("                    preview.style.width = \"100px\",\r\n");
      out.write("                    preview.style.height = \"100px\",\r\n");
      out.write("                    preview.src = window.navigator.userAgent.indexOf(\"Chrome\") >= 1 || window.navigator.userAgent.indexOf(\"Safari\") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);\r\n");
      out.write("        } else {\r\n");
      out.write("                    file_head.select(),\r\n");
      out.write("                    file_head.blur(),\r\n");
      out.write("                    img_txt = document.selection.createRange().text,\r\n");
      out.write("                    localImag = document.getElementById(\"localImag1\"),\r\n");
      out.write("                    localImag.style.width = \"100px\",\r\n");
      out.write("                    localImag.style.height = \"100px\";\r\n");
      out.write("            try {\r\n");
      out.write("                localImag.style.filter = \"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)\",\r\n");
      out.write("                        localImag.filters.item(\"DXImageTransform.Microsoft.AlphaImageLoader\").src = img_txt\r\n");
      out.write("            } catch(f) {\r\n");
      out.write("                alert(\"您上传的图片格式不正确，请重新选择！\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            preview.style.display = \"none\",\r\n");
      out.write("                    document.selection.empty()\r\n");
      out.write("        }\r\n");
      out.write("        return ;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    function setLogoImage() {\r\n");
      out.write("        var preview, img_txt, localImag, file_head = document.getElementById(\"filelogo\"),\r\n");
      out.write("                picture = file_head.value;\r\n");
      out.write("        if(!(0 < picture.indexOf('.jpg') || 0 < picture.indexOf('.gif') || 0 < picture.indexOf('.png') || 0 < picture.indexOf('.bmp') || 0 < picture.indexOf('.jpeg'))){\r\n");
      out.write("             alert(\"您上传的图片格式不正确，请重新选择！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        if (preview = document.getElementById(\"preview2\"), file_head.files && file_head.files[0])\r\n");
      out.write("        {\r\n");
      out.write("            preview.style.display = \"block\",\r\n");
      out.write("            preview.style.width = \"100px\",\r\n");
      out.write("            preview.style.height = \"100px\",\r\n");
      out.write("            preview.src = window.navigator.userAgent.indexOf(\"Chrome\") >= 1 || window.navigator.userAgent.indexOf(\"Safari\") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);\r\n");
      out.write("            $(\"#licenseadd\").val(\"—\");\r\n");
      out.write("        } else {\r\n");
      out.write("            file_head.select(),\r\n");
      out.write("            file_head.blur(),\r\n");
      out.write("            img_txt = document.selection.createRange().text,\r\n");
      out.write("            localImag = document.getElementById(\"localImag2\"),\r\n");
      out.write("            localImag.style.width = \"100px\",\r\n");
      out.write("            localImag.style.height = \"100px\";\r\n");
      out.write("            try {\r\n");
      out.write("                localImag.style.filter = \"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)\",\r\n");
      out.write("                localImag.filters.item(\"DXImageTransform.Microsoft.AlphaImageLoader\").src = img_txt\r\n");
      out.write("            } catch(f) {\r\n");
      out.write("              alert(\"您上传的图片格式不正确，请重新选择！\");\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("            preview.style.display = \"none\",\r\n");
      out.write("            document.selection.empty()\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
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
