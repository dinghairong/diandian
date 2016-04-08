<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
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
%>
<head>
    <meta charset="UTF-8">
    <title>车服务</title>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="images/favicon.ico" rel="shortcut icon"/>

    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.tabso_yeso.js"></script>
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/common.js"></script>

    <script type="text/javascript">
        $(function() {
            $(".wrap").flexslider({
                animation: "slide",
                controlNav: true,
                animationLoop: true
            });
        });
    </script>
    <script src="js/js3.js"></script>
</head>
<body>
    <div class="all" id="all">
       <jsp:include page="headSection3.jsp" flush="true" />

        <div class="liucheng" style="padding-top: 16px">
            <img src="images/liucheng.jpg"/>
        </div>

        <div class="guanggao">
            <%
            List<Advertising> ad_list2 = advertisingDao.findAdvByLocation(2);
            List<Advertising> ad_list3 = advertisingDao.findAdvByLocation(3);
            if(ad_list2.size() > 0){
                for(int i = 0;i < ad_list2.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list2.get(i).getHref() && ad_list2.get(i).getHref().length() > 0){
                        str_href = ad_list2.get(i).getHref();
                    }
            %>
            <a href="<%=str_href%>"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + ad_list2.get(i).getPath()%>&imageName=<%=ad_list2.get(i).getImage()%>" class="guanggao2"></a>
            <%
                }
            }
            if(ad_list3.size() > 0){
                for(int i = 0;i < ad_list3.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list3.get(i).getHref() && ad_list3.get(i).getHref().length() > 0){
                        str_href = ad_list3.get(i).getHref();
                    }
            %>
            <a href="<%=str_href%>"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + ad_list3.get(i).getPath()%>&imageName=<%=ad_list3.get(i).getImage()%>" class="guanggao1"></a>
            <%
                }
            }  
            %>
           <!--  <img src="images/guanggao1.jpg" class="guanggao2"/>
            <img src="images/guangao2.jpg" class="guanggao1"/> -->
        </div>

<style type="text/css">
div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {
    position: relative;
        padding: 10px 0 0 50px;
        bottom: 5px;
}

div.hc_biaoti span.fix_title {
    background: url(/images/1F.png) no-repeat 0 2px;
}

div.hc_biaoti span.maintain_title {
    background: url(/images/2F.png) no-repeat 0 2px; 
}

div.hc_biaoti span.beauty_title {
    background: url(/images/3F.png) no-repeat 0 2px; 
}

div.hc_biaoti span.checking_title {
    background: url(/images/4F.png) no-repeat 0 2px; 
}

a.morefw span {
    color: #FF8500;
}

a.morefw span.enter01 {
    margin-left: 4px;
    font-size: 1.5em;
    position: relative;
}

div.kp_biaotis span.kp_biaotisspan {
    font-weight: bold;
    padding-bottom: 9px;
}

div.hccjt_biaoti span {
    padding-top: 4px;
}

div.hcc_cont {
    margin-top: 7px;
}


div.meir_cont {
    margin-top: 7px;
}

div.jc {
    margin-top: 7px;
}

@media screen and (min-width:0\0) { /* IE9+ IE11未知*/
    div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {
        padding: 10px 0 5px 50px;
        bottom: 3px;
    }

    div.hcc_cont {
        margin-top: 0px;
    }

    div.meir_cont {
        margin-top: 0px;
    }

    div.jc {
        margin-top: 0px;
    }

    a.morefw {
        position: relative;
        bottom: 7px;
    }

    a.morefw span.enter01 {
        /*background: url(/images/chengyou.png) no-repeat 100% 1px; */
        bottom: 7px;
    }

    div.hc_biaoti {
        /*border: 1px solid;*/
    }
}

@media screen and (-webkit-min-device-pixel-ratio:0) { /* Safari and Chrome */
    div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {
        padding: 10px 0 0 48px;
        top: 2px;
    }   

    a.morefw span.enter01 {
        /*background: url(/images/chengyou.png) no-repeat 100% 1px; */
        bottom: 5px;
    }

    div.kp_biaotis span.kp_biaotisspan {
        padding-bottom: 6px;
    }

    div.kp_biaoti span.evaluate_title {
        position: relative;
        top: 3px;
    }
}

@-moz-document url-prefix() { /*FireFox*/
    div.hc_biaoti span.fix_title, div.hc_biaoti span.maintain_title, div.hc_biaoti span.beauty_title, div.hc_biaoti span.checking_title {
        padding: 10px 0 0 50px;
        bottom: 5px;
    }

    a.morefw span.enter01 {
        /*background: url(/images/chengyou.png) no-repeat 100% 4px;*/
        bottom: 1px;
    }

    div.kp_biaotis span.kp_biaotisspan {
        padding-bottom: 3px;
    }
}

</style>

        <div class="home_cont">
            <div class="hc_biaoti">
                <span class="fix_title">安装改装</span>
                <a href="<%=ctx%>/install.jsp" class="morefw">
                    <span>专属您的服务</span><span class="enter01">»</span>
                </a>
            </div>
    
            <div class="hcc_cont">
                <div class="hccc_left">
                    <div class="hccc_lefthover">
                        <img src="images/xiuche.jpg" class="hccc_leftimg"/>
                        <img src="images/yizhan.png" class="yizhan"/>
                    </div>
                    <div class="az_lianjie">
                        <div class="azw_left">
                            <a href="<%=ctx%>/former/getproduct?sp_id=1&number=10&start=0" class="az_wenzi">非防爆胎轮胎安装</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=3&number=10&start=0" class="az_wenzi">防爆胎轮胎安装</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=15&number=10&start=0" class="az_wenzi">安装氙气大灯</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=17&number=10&start=0" class="az_wenzi">安装胎压报警器</a>
                        </div>

                        <div class="azw_right">
                            <a href="<%=ctx%>/former/getproduct?sp_id=19&number=10&start=0" class="az_wenzi"><span>安装倒车影像</span></a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=23&number=10&start=0" class="az_wenzi">安装防眩镜</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=25&number=10&start=0" class="az_wenzi">安装车载导航</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=29&number=10&start=0" class="az_wenzi">安装倒车雷达</a>
                        </div>
                    </div>
                </div>

                <div class="hccc_right">
                    <div class="hcccr_cont" style="border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=1&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    轮胎安装<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/luntai.png"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=5&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    轮毂安装<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/lunzha.png"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-bottom: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=17&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    安装胎压报警器<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/dongph.png"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=9&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换气门嘴<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/qimen.jpg"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=11&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    轮胎换位<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/huanwei.jpg"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-top: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=13&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    充氮气<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/chongqi.png"/>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="home_cont">
            <div class="hc_biaoti">
                <span class="maintain_title">快修保养</span>
                <a href="<%=ctx%>/conserve.jsp" class="morefw">
                    <!-- <span class="enter01" >专属您的服务</span> -->
                    <span>专属您的服务</span><span class="enter01">»</span>
                </a>
            </div>

            <div class="hcc_cont">
                <div class="hccc_left">
                    <div class="hccc_lefthover">
                        <img src="images/baoyang.jpg" class="hccc_leftimg"/>
                        <img src="images/yanghu.png" class="yizhan"/>
                    </div>
                    <div class="az_lianjie">
                        <div class="azw_left">
                            <a href="<%=ctx%>/former/getproduct?sp_id=39&number=10&start=0" class="az_wenzi">更换空调滤清器</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=43&number=10&start=0" class="az_wenzi">更换刹车片</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=45&number=10&start=0" class="az_wenzi">更换刹车盘</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=51&number=10&start=0" class="az_wenzi">更换防冻液</a>
                        </div>

                        <div class="azw_right">
                            <a href="<%=ctx%>/former/getproduct?sp_id=49&number=10&start=0" class="az_wenzi"><span>更换刹车感应线</span></a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=47&number=10&start=0" class="az_wenzi">更换刹车油/制动液</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=55&number=10&start=0" class="az_wenzi">更换火花塞</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=57&number=10&start=0" class="az_wenzi">更换变速箱油</a>
                        </div>
                    </div>
                </div>

                <div class="hccc_right">
                    <div class="hcccr_cont" style="border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=85&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换减震器/避震<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/lunzha.png" style="height: 112px;" />
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-bottom: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=59&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换转向油<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/maintain_02.png"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-bottom: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=33&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换机油、机滤<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/maintain_03.png"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=35&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换空气滤清器<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/maintain_04.png" style="height: 112px"/>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-top: 1px solid #e1e1e1;border-right: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=37&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换燃油滤清器<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/maintain_05.png" style="height: 200px" />
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="hcccr_cont" style="border-top: 1px solid #e1e1e1">
                        <div class="hcccr_juti">
                            <a href="<%=ctx%>/former/getproduct?sp_id=41&number=10&start=0">
                                <div class="hccjt_biaoti">
                                    更换汽/燃油泵总成<span>PROFESSIONAL</span>
                                </div>
                                <div class="hccjt_img">
                                    <img src="images/maintain_06.png"/>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="height:32px;"></div>

        <div class="home_cont" style="position: relative;">
            <div class="hc_biaoti" style="position:absolute; top:0;left:0;">
                <span class="beauty_title">美容装潢</span>
                <a href="<%=ctx%>/upholster.jsp" class="morefw">
                    <span>专属您的服务</span><span class="enter01">»</span>
                </a>
            </div>
            <div class="meir_cont">
            <%if(product_list_first.size() > 0){
                int num = 4;
                if(product_list_first.size() < 4){
                   num = product_list_first.size();
                }
                for(int i = 0;i < num;i ++){
            %>
                <div class="meic_cont" style="border: 1px solid #dcdcdc;">
                    <div class="meic_contimg">
                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=product_list_first.get(i).getId()%>">
                        <%
                        if(null != product_list_first.get(i).getIcon() && product_list_first.get(i).getIcon().length() > 0){
                        %>                       
                        <img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + product_list_first.get(i).getPath()%>&imageName=<%=product_list_first.get(i).getIcon()%>" class="product_icon" style="width:275px;height:290px;">                       
                        <%
                        }else{
                        %>
                        <img src="<%=ctx%>/images/meirong.jpg">
                        <%
                        }
                        %> 
                        </a> 
                    </div>
                    <div class="meirc_wenzi">
                        <p style="color:#000000"><%=product_list_first.get(i).getTitle()%></p>
                        <p style="color:#a6a4a4"><%=product_list_first.get(i).getAbstract_()%></p>
                    </div>
                    <div class="qianggou">
                    ¥ <%=df.format(product_list_first.get(i).getNewprice())%><span><del>¥ <%=df.format(product_list_first.get(i).getOldprice())%><div class=""></div></del></span>
                        <a href="<%=ctx%>/former/getproductinfo?pid=<%=product_list_first.get(i).getId()%>"><div class="qg_botton">抢购</div></a>
                    </div>
                </div>
            <%
                }
            %>
            <%}%>
            
               <!--  <div class="meic_cont" id="meic_cont" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc">
                    <div class="meic_contimg">
                        <img src="images/meirong.jpg"/>
                    </div>
                    <div class="meirc_wenzi">
                        <p style="color:#000000">爱车基础保护方案</p>
                        <p style="color:#a6a4a4">洗车+打蜡+免工时费</p>
                    </div>
                    <div class="qianggou">
                        ¥50<span>¥120<div class="dzxian"></div></span>
                        <a href=""><div class="qg_botton">抢购</div></a>
                    </div>
                </div> -->

                <!-- <div class="meic_cont" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc">
                    <div class="meic_contimg">
                        <img src="images/meirong.jpg"/>
                    </div>
                    <div class="meirc_wenzi">
                        <p style="color:#000000">爱车基础保护方案</p>
                        <p style="color:#a6a4a4">洗车+打蜡+免工时费</p>
                    </div>
                    <div class="qianggou">
                        ¥50<span>¥120<div class="dzxian"></div></span>
                        <div class="qg_botton">抢购</div>
                    </div>
                </div>

                <div class="meic_cont" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc">
                    <div class="meic_contimg">
                        <img src="images/meirong.jpg"/>
                    </div>
                    <div class="meirc_wenzi">
                        <p style="color:#000000">爱车基础保护方案</p>
                        <p style="color:#a6a4a4">洗车+打蜡+免工时费</p>
                    </div>
                    <div class="qianggou">
                        ¥50<span>¥120<div class="dzxian"></div></span>
                        <div class="qg_botton">抢购</div>
                    </div>
                </div>

                <div class="meic_cont" style="border-right: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc;border-left: 1px solid #dcdcdc">
                    <div class="meic_contimg">
                        <img src="images/meirong.jpg"/>
                    </div>
                    <div class="meirc_wenzi">
                        <p style="color:#000000">爱车基础保护方案</p>
                        <p style="color:#a6a4a4">洗车+打蜡+免工时费</p>
                    </div>
                    <div class="qianggou">
                        ¥50<span>¥120<div class="dzxian"></div></span>
                        <div class="qg_botton">抢购</div>
                    </div>
                </div> -->
            </div>
        </div>

        <div style="height:32px;"></div>

        <div class="home_cont" style="position: relative;">
            <div class="hc_biaoti" style="position:absolute; top:0;left:0;">
                <span class="checking_title">检测修正</span>
                <a href="<%=ctx%>/check.jsp" class="morefw">
                    <!-- <span class="enter01" >专属您的服务</span> -->
                   <span>专属您的服务</span><span class="enter01">»</span> 
                </a>
            </div>

            <div class="jc">
                <div class="jc_left">
                    <a href="<%=ctx%>/former/getproduct?sp_id=119&number=10&start=0">
                        <div class="jcl_cont" id="jcl_cont" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc">
                            
                            <div class="jclcc">
                                <img src="images/guzhangd.png" id="jclccimg"/>
                                <p>常用故障灯检测</p>
                            </div>
                            
                        </div>
                    </a>
                    <a href="<%=ctx%>/former/getproduct?sp_id=121&number=10&start=0">
                        <div class="jcl_cont" id="jcl_conts" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc">
                            <div class="jclcc">
                                <img src="images/dongphhui.png" id="jclccimgs"/>
                                <p>动平衡</p>
                            </div>
                        </div>
                    </a>
                    <a href="<%=ctx%>/former/getproduct?sp_id=117&number=10&start=0">
                        <div class="jcl_cont" id="jcl_contss" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc">
                            <div class="jclcc">
                                <img src="images/4f_01.png" id="jclccimgss"/>
                                <p>四轮定位检测</p>
                            </div>
                        </div>
                    </a>
                    <a href="<%=ctx%>/former/getproduct?sp_id=113&number=10&start=0">
                        <div class="jcl_cont" id="jcl_contsss" style="border-left: 1px solid #dcdcdc;border-bottom: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc">
                            <div class="jclcc">
                                <img src="images/4f_02.png" id="jclccimgsss"/>
                                <p>四轮定位调整</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="weixiukeng">
                    <!-- <a href="<%=ctx%>/check.jsp">
                       <img src="images/weixiukeng.jpg"/>
                    </a> -->
                        <%
                         List<Advertising> ad_list6 = advertisingDao.findAdvByLocation(4);
                        if(ad_list6.size() > 0){
                            for(int i = 0;i < ad_list6.size();i ++){
                                String str_href = "javascript:void(0)";
                                if(null != ad_list6.get(i).getHref() && ad_list6.get(i).getHref().length() > 0){
                                    str_href = ad_list6.get(i).getHref();
                                }
                        %>
                        <a href="<%=str_href%>"><img style="height:100%" src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + ad_list6.get(i).getPath()%>&imageName=<%=ad_list6.get(i).getImage()%>"></a>
                        <%
                            }
                        }
                        %>                   
                </div>
            </div>
        </div>

        <div class="guanggaos">
            <%
            List<Advertising> ad_list4 = advertisingDao.findAdvByLocation(5);
            List<Advertising> ad_list5 = advertisingDao.findAdvByLocation(6);
            if(ad_list4.size() > 0){
                for(int i = 0;i < ad_list4.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list4.get(i).getHref() && ad_list4.get(i).getHref().length() > 0){
                        str_href = ad_list4.get(i).getHref();
                    }
            %>
            <a href="<%=str_href%>"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + ad_list4.get(i).getPath()%>&imageName=<%=ad_list4.get(i).getImage()%>" class="guanggao3"></a>
            <%
                }
            }
            if(ad_list5.size() > 0){
                for(int i = 0;i < ad_list5.size();i ++){
                    String str_href = "javascript:void(0)";
                    if(null != ad_list5.get(i).getHref() && ad_list5.get(i).getHref().length() > 0){
                        str_href = ad_list5.get(i).getHref();
                    }
            %>
            <a href="<%=str_href%>"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + ad_list5.get(i).getPath()%>&imageName=<%=ad_list5.get(i).getImage()%>" class="guanggao4"></a>
            <%
                }
            }  
            %>
            <!-- <a href=""><img src="images/guanggao3.jpg" class="guanggao3"/></a>
            <img src="images/guanggao4.jpg" class="guanggao4"/> -->
        </div>

        <%
        int comm_num = 0;
        if(comment_list.size() > 0){
            if(comment_list.size() < 3){
                comm_num = comment_list.size();
            }else{
                comm_num = 3;
            }
        }
        %>
        <div class="home_contkh">
            <div class="kp_biaoti">
                <span class="evaluate_title" style="color: #007fcc">客户评价</span>
    <!--             <a href="<%=ctx%>/advistory.jsp" class="morefw"><span>更多</span><img src="images/chengyou.png"/></a> -->
            </div>
            <div style="height:2px"></div>
            <div class="kp_biaotis">
                <span class="evaluate_title" style="color: #007fcc; font-size: 1.6em;">咨询</span>
 <!--                <a href="<%=ctx%>/advistory.jsp" class="morefw"><span>更多</span><img src="images/chengyou.png"/></a> -->
            </div>
            <div style="height:2px"></div>
            <div class="kp_cont">
                <div class="kpc_left">
                    <%for(int i = 0;i < comm_num;i ++){
                        int star = comment_list.get(i).getStar();
                    %>
                        <div class="kpcl_cont" style="border-bottom: 1px solid #dcdcdc;">
                            <div class="pjdengji">
                                评价
                                <%for(int j = 0;j < star;j ++){%>
                                <img src="<%=ctx%>/img/star_1.png"/>
                                <%
                                }
                                for(int k = 0;k < 5 - star;k ++){
                                %>
                                <img src="<%=ctx%>/img/star_2.png"/>
                                <%
                                }
                                %>
                                <span>
                                    <%if(comment_list.get(i).getUser() != null){%>
                                    <%=comment_list.get(i).getUser().getPhone().substring(0,3) + "xxxx" + comment_list.get(i).getUser().getPhone().substring(8,11)%>
                                    <%}%>
                                    @
                                    <%if(comment_list.get(i).getServiceShop() != null){%>
                                    <%=comment_list.get(i).getServiceShop().getTitle()%>
                                    <%}%>
                                    &nbsp;&nbsp;&nbsp;
                                    评价于：<%=formatter2.format(comment_list.get(i).getCreatedTime())%>
                                </span>
                            </div>
                            <div class="pj_neirong">
                                <%=comment_list.get(i).getContent()%>
                            </div>
                        </div>
                    <%}%>
                    <!-- <div class="kpcl_cont" style="border-bottom: 1px solid #dcdcdc;">
                        <div class="pjdengji">
                            评价                           
                            <img src="img/star_1.png"/>
                            <img src="img/star_1.png"/>
                            <img src="img/star_1.png"/>
                            <img src="img/star_1.png"/>
                            <img src="img/star_1.png"/>
                            <span>132XXXX5689@昌平南环乐天店&nbsp;&nbsp;&nbsp;评价于：2015-02-01 20:09:32</span>
                        </div>
                        <div class="pj_neirong">
                            专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服专注汽车服务专注汽车服务
                        </div>
                    </div>

                    <div class="kpcl_cont" style="border-bottom: 1px solid #dcdcdc;">
                        <div class="pjdengji">
                            评价<img src="images/xingji.png"/><span>132XXXX5689@昌平南环乐天店&nbsp;&nbsp;&nbsp;评价于：2015-02-01 20:09:32</span>
                        </div>
                        <div class="pj_neirong">
                            专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服专注汽车服务专注汽车服务
                        </div>
                    </div>

                    <div class="kpcl_cont">
                        <div class="pjdengji">
                            评价<img src="images/xingji.png"/><span>132XXXX5689@昌平南环乐天店&nbsp;&nbsp;&nbsp;评价于：2015-02-01 20:09:32</span>
                        </div>
                        <div class="pj_neirong">
                            专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服务专注汽车服专注汽车服务专注汽车服务
                        </div>
                    </div> -->
                </div>

                <div class="kpc_right">
                    <%
                    if(advisory_list.size() > 0){
                        int ad_num = 4;
                        if(advisory_list.size() < 4){
                            ad_num = advisory_list.size();
                        }
                        for(int i = 0;i < ad_num;i ++){
                            if(i == ad_num - 1){
                    %>
                    <div class="kpcr_cont">
                        <%=advisory_list.get(i).getUsecontent()%>
                    </div>
                    <%            
                            }else{
                    %>
                    <div class="kpcr_cont" style="border-bottom: 1px solid #dcdcdc;">
                        <%=advisory_list.get(i).getUsecontent()%>
                    </div>
                    <%      }
                        }
                    }%>
                    <!-- <div class="kpcr_cont" style="border-bottom: 1px solid #dcdcdc;">
                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网
                    </div>

                    <div class="kpcr_cont" style="border-bottom: 1px solid #dcdcdc;">
                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网
                    </div>

                    <div class="kpcr_cont" style="border-bottom: 1px solid #dcdcdc;">
                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网
                    </div>

                    <div class="kpcr_cont">
                        帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网帮您养车网
                    </div> -->
                </div>
            </div>
        </div>

        <!-- znn 影藏优惠 2015-11-20-->
        <!-- <div class="home_contkh" style="padding-left: 10px;padding-right: 10px;padding-bottom:79px;">
            <div class="kp_biaoti" style="padding-bottom:10px;">
                <span style="color: #007fcc">优惠活动</span>
            </div>

            <div class="youhui_cont">
                <%
                    if(coupon_list.size() > 0){
                        int coupon_num = 6;
                        if(coupon_list.size() < 6){
                            coupon_num = coupon_list.size();
                        }
                        for(int i = 0;i < coupon_num;i ++){
                %>
                <div class="yhc_cont">
                    <div class="yhc_contimg">
                        <%
                            if(null != coupon_list.get(i).getImage() && coupon_list.get(i).getImage().length() > 0){
                        %>
                         <a href="couponDetail.jsp?ids=<%=coupon_list.get(i).getId()%>" method="post">
                        	<img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + coupon_list.get(i).getPath()%>&imageName=<%=coupon_list.get(i).getImage()%>"/>
                        </a>
                        <%
                            }else{
                        %>
                        <a href="couponDetail.jsp?ids=<%=coupon_list.get(i).getId()%>" method="post">
                            <img src="<%=ctx%>/images/youhui.jpg">
                        </a>
                        <%
                            }
                        %>  
                    </div>
                    <div class="yhcc_wenzi">
                        <span style="width: 213px;">
                            <%=coupon_list.get(i).getTitle()%>
                        </span>
                        <span style="width: 80px;">
                            金额:<%=String.valueOf(coupon_list.get(i).getMoney())%>
                        </span>
                        <span style="width: 100%;margin-top: 10px">
                            活动时间:<%=d_f.format(coupon_list.get(i).getCreatedTime())%>
                        </span>
                    </div>

                </div>
                <%
                    }
                %>
                <%}%>
            </div>
        </div> -->

        <jsp:include page="footSection.jsp" flush="true" />
        <div id="scroll_Top" class="scroll_Top" onClick="$.$w.windowScroll(0);">
            <img src="images/fanhuil.png" width="30px"/>
        </div>
    </div>
</body>
<script type="text/javascript">
$(function(){
    $('.lbc_left').show();
})
</script>
</html>