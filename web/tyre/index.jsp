<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="net.sf.json.JSONObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
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
%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>欢迎入驻轮胎点点</title>
    <link href="<%=ctx %>/assets/css/index.css" rel="stylesheet"/>
</head>
<body>
<body>
<div class="mainbody">
    <div class="content-box">
        <img src="../assets/images/md_01.jpg" width="100%"/>
        <div class="syme"><%=storeNumRemain%></div>
    </div>
    <div class="content-box2">
        <div class="nowhaver-zi" style="margin-left:4%;">已有</div>
        <div class="nowhaver-shu">
            <ul>
                <%for(char i:numStr){%>
                <li><div><%=i%></div><span><em></em></span></li>
                <%}%>
            </ul>
        </div>
        <div class="nowhaver-zi">家门店成功入驻！</div>
    </div>
    <div class="content-box"><img src="../assets/images/md_03.jpg" width="100%"/></div>
    <div class="content-box3">
        <form id="store" action="<%=ctx%>/tyre/saveStore.do" method="POST" enctype="multipart/form-data">
            <ul>
                <li>门店名称 <input class="boxt_input" id="storename" name="store.storename" type="text"  onblur="validateStoreName()"/> <br><span class="name_error" style="display: none">*请输入门店名称</span><span class="name_exist" style="display: none">*该门店已经入驻</span></li>
                <li>联&nbsp;系&nbsp;人&nbsp;&nbsp; <input class="boxt_input" id="linkman" name="store.linkman" type="text" onblur="if(this.value == ''){$('.linkman_error').show();}else{$('.linkman_error').hide();}"/><br><span class="linkman_error" style="display: none">*请输入联系人</span></li>
                <li>联系电话 <input class="boxt_input" id="mobile" name="store.mobile" type="text"  onblur="if(this.value == ''){$('.mobile_error').show();}else{$('.mobile_error').hide();}"/><br><span class="mobile_error" style="display: none">*请输入联系电话</span></li>
                <li>省份  <select class="boxt_input2" id="provinceSelect" style="width:100px">
                    <%
                        for(int i = 0;i < areaList.size();i++){
                    %>
                    <option value="<%=areaList.get(i).getId()%>"><%=areaList.get(i).getAreaname()%></option>
                    <%
                     }
                    %>
                </select>
                    城市
                    <select class="boxt_input2" id="citySelect" style="width:100px">
                        <%
                            for(int i = 0;i < citys.size();i++){
                        %>
                        <option value="<%=citys.get(i).getId()%>"><%=citys.get(i).getAreaname()%></option>
                        <%
                            }
                        %>
                    </select>



                </li>
                <input type="hidden" id="areaid" name="store.areaid" value="">
                <li>详细地址 <input class="boxt_input" id="address" name="store.address" type="text" onblur="if(this.value == ''){$('.address_error').show();}else{$('.address_error').hide();}"/><br><span class="address_error" style="display: none">*请输入详细地址</span></li>
            </ul>
            <div class="boxt_ch"><img src="../assets/images/md_02.jpg"/></div>
            <div class="boxt_jia">
                <div class="boxt_jia2">
                    <div id="localImag1">
                        <img id="preview1" width="-1" height="-1" style="display: none" />
                    </div>
                </div>
                <div class="boxt_jia2"><input class="boxt_jia1" type="button"  name="" value="+" onclick="addLicense()"/><span class="license_error" style="font-size: small;display: none">*请上传营业执照</span></div>
                <div>
                    <input type="file" name="filelicense" id="filelicense" hidden/>
                </div>
            </div>
            <div class="boxt_jia">
                <div class="boxt_jia2">
                    <div id="localImag2">
                        <img id="preview2" width="-1" height="-1" style="display: none" />
                    </div>
                </div>
                <div class="boxt_jia2"><input class="boxt_jia1" type="button" name="" value="+" onclick="addLogo()"/><span class="logo_error" style="font-size: small;display: none">*请上传门头照片</span></div>
                <div>
                    <input type="file" name="filelogo" id="filelogo" hidden/>
                </div>
            </div>
            <div class="boxbt">
                <input type="submit" id="submit" hidden=""/>
                <div class="shenqinico"><a onclick="saveInfo()" ><img src="../assets/images/shenqing.png" /></a></div>
            </div>
        </form>
    </div>
</div>
</body>



<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=ctx%>/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<![endif]-->
</body>
<script type="text/javascript">
    $(function(){
    });
    $('#provinceSelect').change(function(){
        var pid = this.options[this.selectedIndex].value;
        $.ajax({
            url: "<%=ctx%>/tyre/getCityByProvince.do?pid=" + pid,
            type: "post",
            dataType: "JSON",
            async: false,
            timeout: 3000,
            success: function(ret){
                $('#citySelect').html(ret.html);
            },
            error: function(XMLRequest, textInfo){
                if(textInfo != null){
                    alert(textInfo);
                }
            }
        });
    });

    function validateStoreName(){
        var storename = $('#storename').val();
        if(storename == ''){
            $('.name_error').show();
        }else{
            $('.name_error').hide();
            var uri=encodeURI("<%=ctx%>/tyre/getStoreByName.do?storename="+storename);
            $.ajax({
                url: uri,
                type: "get",
                dataType: "JSON",
                async: false,
                success: function(ret){
                    if(ret.exist == "true"){
                        $('.name_exist').show();
                    }else{
                        $('.name_exist').hide();
                    }
                },
                error: function(XMLRequest, textInfo){
                    if(textInfo != null){
                        alert(textInfo);
                    }
                }
            });

        }
    }

    function saveInfo(){
        var storename = $('#storename').val();
        var linkman = $('#linkman').val();
        var mobile = $('#mobile').val();
        var address = $('#address').val();
        var areaid = $("#citySelect").val();
        var fileLicense = $("#filelicense").val();
        var fileLogo = $("#filelogo").val();
        $('#areaid').val(areaid);
        var exist;
        if(storename.length == 0){
            $('.name_error').show();
            return false;
        }else{
            if(storename == "请输入公司名称"){
                $('.name_error').show();
                return false;
            }else{
                $('.name_error').hide();
                var uri=encodeURI("<%=ctx%>/tyre/getStoreByName.do?storename="+storename);

                $.ajax({
                    url: uri,
                    type: "get",
                    dataType: "JSON",
                    async: false,
                    success: function(ret){
                        if(ret.exist == "true"){
                            $('.name_exist').show();
                            exist= false;
                        }else{
                            $('.name_exist').hide();
                            exist= true;
                        }
                    },
                    error: function(XMLRequest, textInfo){
                        if(textInfo != null){
                            alert(textInfo);
                        }
                    }
                });
            }
        }
        if(linkman.length == 0){
            $('.linkman_error').show();
            return false;
        }else{
            if(linkman == "请输入联系人"){
                $('.linkman_error').show();
                return false;
            }else{
                $('.linkman_error').hide();
            }
        }
        if(mobile.length == 0){
            $('.mobile_error').show();
            return false;
        }else{
            if(mobile == "请输入联系电话"){
                $('.mobile_error').show();
                return false;
            }else{
                $('.mobile_error').hide();
            }
        }
        if(address.length == 0){
            $('.address_error').show();
            return false;
        }else{
            if(address == "请输入详细地址"){
                $('.address_error').show();
                return false;
            }else{
                $('.address_error').hide();
            }
        }
        if(fileLicense.length == 0){
            $('.license_error').show();
            return false;
        }else{
            $('.license_error').hide();
        }
        if(fileLogo.length == 0){
            $('.logo_error').show();
            return false;
        }else{
            $('.logo_error').hide();
        }
        if(exist){
            $('#submit').trigger("click");
        }
    }


    function addLicense(){
        $('#filelicense').trigger("click");
    }
    $("#filelicense").change(function() {
        setLicenseImage();
    });

    function addLogo(){
        $('#filelogo').trigger("click");
    }
    $("#filelogo").change(function() {
        setLogoImage();
    });

    function setLicenseImage() {
        var preview, img_txt, localImag, file_head = document.getElementById("filelicense"),
                picture = file_head.value;
        if(!(0 < picture.indexOf('.jpg') || 0 < picture.indexOf('.gif') || 0 < picture.indexOf('.png') || 0 < picture.indexOf('.bmp') || 0 < picture.indexOf('.jpeg'))){
            alert("您上传的图片格式不正确，请重新选择！");
            return;
        }
        if (preview = document.getElementById("preview1"), file_head.files && file_head.files[0])
        {
                    preview.style.display = "block",
                    preview.style.width = "100px",
                    preview.style.height = "100px",
                    preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
        } else {
                    file_head.select(),
                    file_head.blur(),
                    img_txt = document.selection.createRange().text,
                    localImag = document.getElementById("localImag1"),
                    localImag.style.width = "100px",
                    localImag.style.height = "100px";
            try {
                localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",
                        localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt
            } catch(f) {
                alert("您上传的图片格式不正确，请重新选择！");
                return;
            }
            preview.style.display = "none",
                    document.selection.empty()
        }
        return ;
    }



    function setLogoImage() {
        var preview, img_txt, localImag, file_head = document.getElementById("filelogo"),
                picture = file_head.value;
        if(!(0 < picture.indexOf('.jpg') || 0 < picture.indexOf('.gif') || 0 < picture.indexOf('.png') || 0 < picture.indexOf('.bmp') || 0 < picture.indexOf('.jpeg'))){
             alert("您上传的图片格式不正确，请重新选择！");
            return;
        }
        if (preview = document.getElementById("preview2"), file_head.files && file_head.files[0])
        {
            preview.style.display = "block",
            preview.style.width = "100px",
            preview.style.height = "100px",
            preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
            $("#licenseadd").val("—");
        } else {
            file_head.select(),
            file_head.blur(),
            img_txt = document.selection.createRange().text,
            localImag = document.getElementById("localImag2"),
            localImag.style.width = "100px",
            localImag.style.height = "100px";
            try {
                localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",
                localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt
            } catch(f) {
              alert("您上传的图片格式不正确，请重新选择！");
                return;
            }
            preview.style.display = "none",
            document.selection.empty()
        }

    }

</script>
</html>