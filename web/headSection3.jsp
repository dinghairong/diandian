<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.common.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>

<%
String ctx = (String)request.getContextPath();
User user = (User)session.getAttribute("user");
Company company = (Company)session.getAttribute("company");
String setcity = (String)session.getAttribute("setcity");
if((setcity == null) || (setcity.length() == 0)){
    setcity = "";
}else{
    if(setcity.length() > 0){
        setcity = setcity.substring(0, setcity.length() - 1);
    }
}

SmartProperties smartProp = SmartProperties.getInstance();
AdvertisingDao advertisingDao = (AdvertisingDao)SpringUtils.getBean(AdvertisingDao.class);
String imgPath = smartProp.getImgPath();
%>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js" type="text/ecmascript"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<div class="top">
            <div class="tops" id="tops">

                <div class="denglu" id="denglu">
                    <div class="denglu_left">
                        <p style="display:inline;font-size:14px;margin-right:10px"><%=setcity%></p><a href="<%=ctx%>/city.jsp" class="chose_city"  style="font-size:14px">[选择城市]</a>
                        <span>您好 欢迎光临帮您养车网</span>
                        <span>全国覆盖城市近<font color="#4c8de5">8000</font>家，<a href="<%=ctx%>/slogin.jsp" style="color:#4c8de5">线下合作门店加盟</a></span>
                        <input type="hidden" id="setcity" value="<%=setcity%>">
                    </div>
                    <div class="denglu_right" style="display: inline-block; width: auto">
                        <%if(null != user){%>
                        <div class="enter" style="width: 120px"><a href="<%=ctx%>/profile.jsp" style="color:#4c8de5;"><%=user.getPhone()%></a></div>
                        <div class="login"><a href="<%=ctx%>/logout.jsp" style="color:#4c8de5;">退出</a></div>
                        <%}else{
                            if(null != company){
                        %>
                        <div class="enter" style="width: 120px"><a href="<%=ctx%>/cwelcome.jsp" style="color:#4c8de5;"><%=company.getPhone()%></a></div>
                        <div class="login"><a href="<%=ctx%>/logout.jsp" style="color:#4c8de5;">退出</a></div>
                        <%
                            }else{
                        %>
                        <div class="enter" style="width: 70px"><a href="<%=ctx%>/login.jsp" style="color:#4c8de5;">个人登录</a></div>
                        <div class="login" style="width: 70px"><a href="<%=ctx%>/register.jsp" style="color:#4c8de5;">个人注册</a></div>
                        <%}}%>
                        <!-- <div class="tixing"><span>提醒</span><img src="<%=ctx%>/images/xiangxia.png"/></div>
                        <div class="shoucang">收藏</div> -->
                        <!-- <div class="guanzhu"><span>关注</span><img src="images/xiangxia.png"/></div> -->
                        <div class="enter" style="width:124px;"><a href="<%=ctx%>/company.jsp" style="color:#4c8de5;">线上合作商家加盟</a></div>
                    </div>
                </div>

                <div class="banner">

                    <div class="logo">
                        <div class="logo_cont">
                         <!--  <a href="<%=ctx%>/index.jsp" style="color:#007fcc">  帮您养车网<br/><span>专注汽车服务</span></a> -->
                         <img alt="logo" src="images/logo.gif">
                        </div>
                    </div>

                    <div class="sousuo">
                        <div class="sousuo_cont">
                            <input type="text" value="请输入关键词" class="sousuok" id="sousuo" onfocus="if(value=='请输入关键词') {value=''}" onblur="if (value=='') {value='请输入关键词'}"/>
                            <div class="sousuo_botton">
                                <a href="javascript:void(0)" id="searchbutton" style="color:#fff;" onclick="searchbyfuzzy(this)">搜索</a>
                            </div>
                            <div style="height:45px;"></div>
                            <span>热门搜索：&nbsp;
                        <a href="<%=ctx%>/upholster.jsp" style="color:#666666">汽车美容</a>&nbsp;
                                <a href="<%=ctx%>/install.jsp" style="color:#666666">安装服务</a>&nbsp;
                                <a href="<%=ctx%>/former/getproduct?sp_id=89&number=10&start=0" style="color:#666666">打蜡</a>&nbsp;
                                <a href="<%=ctx%>/former/getproduct?sp_id=55&number=10&start=0" style="color:#666666">更换火花塞</a>&nbsp;
                                <a href="<%=ctx%>/former/getproduct?sp_id=101&number=10&start=0" style="color:#666666">车内消毒</a>&nbsp;
                                <a href="<%=ctx%>/conserve.jsp" style="color:#666666">快修保养</a>
                              </span>
                        </div>
                    </div>

                    <div class="dianhua">
                        <img src="<%=ctx%>/images/dianhua.png"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="daohang">
            <div class="daohang_left">
                <div class="fast_serv" >快速服务</div>
                <a href="<%=ctx%>/index.jsp" class="daohang_wenzis">首页</a>
                <a href="<%=ctx%>/install.jsp" class="daohang_wenzi">安装服务</a>
                <a href="<%=ctx%>/conserve.jsp" class="daohang_wenzi">快修保养</a>
                <a href="<%=ctx%>/upholster.jsp" class="daohang_wenzi">美容装潢</a>
                <a href="<%=ctx%>/check.jsp" class="daohang_wenzi">检测修正</a>
                <a href="<%=ctx%>/shoplist.jsp" class="daohang_wenzi">服务门店</a>
            </div>

            <div class="daohang_right">
                <!-- <span>我的爱车</span>
                <img src="<%=ctx%>/images/xiala_cheng.jpg"/> -->
                <!-- <a href="<%=ctx%>/mycart.jsp" class="dr_jiameng">我的服务车</a> -->
                <a href="<%=ctx%>/mycart.jsp" class="dr_jiameng"><img src="/images/mycart.png" style="height: 15px"></a>
            </div>
        </div>

        <div class="lunbo">
            <div class="lunbo_cont">
                <div class="lbc_left" >
                    <div class="anzhuang" id="anzhuang"  onmouseenter="kjsee()"  onmouseleave="kjnone()">
                        <div id="abs_kjsee" style="position:absolute; height: 100%; top:0; right: 3px; background-color:#fff;z-index: 99999; padding: 10px 10px 0 24px;">
                        <div class="loc_biaoti">
                            <span>安装服务</span>
                            <img src="<%=ctx%>/images/xiangyou.png"/>
                        </div>
                        <div class="anzhuang_cont" id="anzhuang_cont" style="padding-right: 10px;">
                            <a href="<%=ctx%>/former/getproduct?sp_id=1&number=10&start=0" class="azc_wenzi">轮胎安装</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=5&number=10&start=0" class="azc_wenzi">轮毂安装</a>
                            <!-- <a href="" class="azc_wenzi">动平衡</a> -->
                            <a href="<%=ctx%>/former/getproduct?sp_id=9&number=10&start=0" class="azc_wenzi">更换气门嘴</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=11&number=10&start=0" class="azc_wenzi">轮胎换位</a>
                        </div>
                        </div>
                        <div class="kuaijie_cont" id="kuaijie_cont">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                           <a href="<%=ctx%>/former/getproduct?sp_id=1&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                           <div id="div11" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div1(this, '/images/fix_01_on.png')" onmouseleave="div1out(this, '/images/fix_01.png')">
                                                <img src="<%=ctx%>/images/fix_01.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">轮胎安装</div>
                                            </div>
                                            </a> 
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=5&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                        	<div id="div12" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div1(this, '/images/fix_02_on.png')" onmouseleave="div1out(this, '/images/fix_02.png')">
                                            	<img src="<%=ctx%>/images/fix_02.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">轮毂安装</div>
                                        	</div>
                                            </a> 
                                        </td>
                                         <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=13&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div13" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div1(this, '/images/fix_03_on.png')" onmouseleave="div1out(this, '/images/fix_03.png')">
                                                <img src="<%=ctx%>/images/fix_03.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">换氮气</div>
                                            </div>
                                            </a> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=17&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div14" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div1(this, '/images/fix_04_on.png')" onmouseleave="div1out(this, '/images/fix_04.png')">
                                                <img src="<%=ctx%>/images/fix_04.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">安装胎压报警器</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=9&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div15" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div1(this, '/images/fix_05_on.png')" onmouseleave="div1out(this, '/images/fix_05.png')">
                                                <img src="<%=ctx%>/images/fix_05.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换气门嘴</div>
                                            </div>
                                            </a>
                                        </td>
                                         <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=11&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div16" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div1(this, '/images/fix_06_on.png')" onmouseleave="div1out(this, '/images/fix_06.png')">
                                                <img src="<%=ctx%>/images/fix_06.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">轮胎换位</div>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td colspan="3" style="position: relative;">
                                            <a href="<%=ctx%>/install.jsp"  >
                                            <div style="display:inline-block; position:absolute; bottom: -20px; right:25px;color:#FF9F7A; font-size: 0.8em;">
                                                查看更多安装服务 <strong>❯</strong>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="anzhuang" id="anzhuangs"  onmouseenter="kjsees()" onmouseleave="kjnones()" style="height: 110px;">
                        <div id="abs_kjsees" style="position:absolute; height: 100%; top:0; right: 3px; background-color:#fff;z-index: 99999; padding: 10px 10px 0 24px;">
                        <div class="loc_biaoti">
                            <span>快修保养</span>
                            <img src="<%=ctx%>/images/xiangyou.png"/>
                        </div>
                        <div class="anzhuang_cont" style="padding-right: 10px;">
                            <a href="<%=ctx%>/former/getproduct?sp_id=33&number=10&start=0" class="azc_wenzi">更换机油、机油滤清器</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=35&number=10&start=0" class="azc_wenzi">更换空气滤清器</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=37&number=10&start=0" class="azc_wenzi">更换燃油滤清器</a>
                         
                        </div>
                        </div>
                        <div class="kuaijie_conts" id="kuaijie_conts">
                            <div>
                                <table>
                                    <tbody>
                                    	<tr>
                           					<td>
                                                <a href="<%=ctx%>/former/getproduct?sp_id=31&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                                <div id="div21" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div2(this, '/images/maintaintop_01_on.png')" onmouseleave="div2out(this, '/images/maintaintop_01.png')">
                                                <img src="<%=ctx%>/images/maintaintop_01.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换机油、机油滤清器</div>
                                                </div>
                                                </a>
                            				</td>
		                                    <td>
                                                <a href="<%=ctx%>/former/getproduct?sp_id=33&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                                <div id="div22" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div2(this, '/images/maintaintop_02_on.png')" onmouseleave="div2out(this, '/images/maintaintop_02.png')">
                                                <img src="<%=ctx%>/images/maintaintop_02.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换空气滤清器</div>
                                                </div>
                                                </a>
		                                    </td>
		                                    <td>
                                                <a href="<%=ctx%>/former/getproduct?sp_id=37&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                                <div id="div23" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div2(this, '/images/maintaintop_03_on.png')" onmouseleave="div2out(this, '/images/maintaintop_03.png')">
                                                <img src="<%=ctx%>/images/maintaintop_03.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换燃油滤清器</div>
                                                </div>
                                                </a>
		                                    </td>
		                                </tr>
		                                <tr>
                           					<td>
                                                <a href="<%=ctx%>/former/getproduct?sp_id=39&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                                <div id="div24" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div2(this, '/images/maintaintop_04_on.png')" onmouseleave="div2out(this, '/images/maintaintop_04.png')">
                                                <img src="<%=ctx%>/images/maintaintop_04.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换空调滤清器</div>
                                                </div>
                                                </a>
                            				</td>
		                                    <td>
                                                <a href="<%=ctx%>/former/getproduct?sp_id=41&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                                <div id="div25" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div2(this, '/images/maintaintop_05_on.png')" onmouseleave="div2out(this, '/images/maintaintop_05.png')">
                                                <img src="<%=ctx%>/images/maintaintop_05.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换燃油泵总成</div>
                                                </div>
                                                </a>
		                                    </td>
		                                    <td>
                                                <a href="<%=ctx%>/former/getproduct?sp_id=43&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                                <div id="div26" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div2(this, '/images/maintaintop_06_on.png')" onmouseleave="div2out(this, '/images/maintaintop_06.png')">
                                                <img src="<%=ctx%>/images/maintaintop_06.png" style="width:60px;height:60px;">
                                                <div style="margin-top: 10px;">更换刹车片</div>
                                                </div>
                                                </a>
		                                    </td>
		                                </tr>
                                        <tr>
                                            <td colspan="3" style="position: relative;">
                                                <a href="<%=ctx%>/conserve.jsp"  >
                                                <div style="display:inline-block; position:absolute; bottom: -20px; right:25px;color:#FF9F7A; font-size: 0.8em;">
                                                    查看更多快修保养 <strong>❯</strong>
                                                </div>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="anzhuang" id="anzhuangss"  onmouseenter="kjseess()" onmouseleave="kjnoness()">
                        <div id="abs_kjseess" style="position:absolute; height: 100%; top:0; right: 3px; background-color:#fff;z-index: 99999; padding: 10px 10px 0 24px;">
                        <div class="loc_biaoti">
                            <span>美容装潢</span>
                            <img src="<%=ctx%>/images/xiangyou.png"/>
                        </div>
                        <div class="anzhuang_cont" style="padding-right: 10px;">
                            <a href="<%=ctx%>/former/getproduct?sp_id=87&number=10&start=0" class="azc_wenzi">洗车泥车身清洁</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=89&number=10&start=0" class="azc_wenzi">打蜡</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=91&number=10&start=0" class="azc_wenzi">洗车</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=93&number=10&start=0" class="azc_wenzi">整车抛光封釉</a>
                        </div>
                        </div>

                        <div class="kuaijie_contss" id="kuaijie_contss">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=87&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div31" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div3(this, '/images/beautytop_01_on.png')" onmouseleave="div3out(this, '/images/beautytop_01.png')">
                                            <img src="<%=ctx%>/images/beautytop_01.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">洗车泥车身清洁</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=89&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div32" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div3(this, '/images/beautytop_02_on.png')" onmouseleave="div3out(this, '/images/beautytop_02.png')">
                                            <img src="<%=ctx%>/images/beautytop_02.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">打蜡</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=97&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div33" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div3(this, '/images/beautytop_03_on.png')" onmouseleave="div3out(this, '/images/beautytop_03.png')">
                                            <img src="<%=ctx%>/images/beautytop_03.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">整车抛光镀晶</div>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=91&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div34" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div3(this, '/images/beautytop_04_on.png')" onmouseleave="div3out(this, '/images/bueatytop_04.png')">
                                            <img src="<%=ctx%>/images/bueatytop_04.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">洗车</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=93&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div35" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div3(this, '/images/bueatytop_05_on.png')" onmouseleave="div3out(this, '/images/bueatytop_05.png')">
                                            <img src="<%=ctx%>/images/bueatytop_05.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">整车抛光封釉</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=95&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div36" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div3(this, '/images/bueatytop_06_on.png')" onmouseleave="div3out(this, '/images/bueatytop_06.png')">
                                            <img src="<%=ctx%>/images/bueatytop_06.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">整车抛光镀膜</div>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="position:relative;">
                                            <a href="<%=ctx%>/upholster.jsp"  >
                                            <div style="display:inline-block; position:absolute; bottom: -20px; right:25px;color:#FF9F7A; font-size: 0.8em;">
                                                查看更多美容装潢 <strong>❯</strong>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="anzhuang" id="anzhuangsss" onmouseenter="kjseesss()"  onmouseleave="kjnonesss()">
                        <div id="abs_kjseesss" style="position:absolute; height: 100%; top:0; right: 3px; background-color:#fff;z-index: 99999; padding: 10px 10px 0 24px;">
                        <div class="loc_biaoti">
                            <span>检测修正</span>
                            <img src="<%=ctx%>/images/xiangyou.png"/>
                        </div>
                        <div class="anzhuang_cont" style="padding-right: 10px;">
                            <a href="<%=ctx%>/former/getproduct?sp_id=113&number=10&start=0" class="azc_wenzi">四轮定位调整</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=117&number=10&start=0" class="azc_wenzi">四轮定位检测</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=119&number=10&start=0" class="azc_wenzi">常用故障灯诊断</a>
                            <a href="<%=ctx%>/former/getproduct?sp_id=121&number=10&start=0" class="azc_wenzi">动平衡</a>
                        </div>
                        </div>

                        <div class="kuaijie_contsss" id="kuaijie_contsss" style="position:absolute; top: -207.5px">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=113&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div41" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div4(this, '/images/4ftop_01_on.png')" onmouseleave="div4out(this, '/images/4ftop_01.png')">
                                            <img src="<%=ctx%>/images/4ftop_01.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">四轮定位调整</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=117&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div42" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div4(this, '/images/4ftop_02_on.png')" onmouseleave="div4out(this, '/images/4ftop_02.png')">
                                            <img src="<%=ctx%>/images/4ftop_02.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">四轮定位检测</div>
                                            </div>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=119&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div43" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div4(this, '/images/4ftop_03_on.png')" onmouseleave="div4out(this, '/images/4ftop_03.png')">
                                            <img src="<%=ctx%>/images/4ftop_03.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">常用故障灯诊断</div>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="<%=ctx%>/former/getproduct?sp_id=121&number=10&start=0" style="color: #979797; font-size: 0.8em;">
                                            <div id="div44" style="text-align: center; width: 200px; padding: 20px 0;" onmouseenter="div4(this, '/images/4ftop_04_on.png')" onmouseleave="div4out(this, '/images/4ftop_04.png')">
                                            <img src="<%=ctx%>/images/4ftop_04.png" style="width:60px;height:60px;">
                                            <div style="margin-top: 10px;">动平衡</div>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="position:relative;">
                                            <a href="<%=ctx%>/check.jsp"  >
                                            <div style="display:inline-block; position:absolute; bottom: -20px; right:25px;color:#FF9F7A; font-size: 0.8em;">
                                                查看更多检测修正 <strong>❯</strong>
                                            </div>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
                <div class="lbc_right" id="lbc_right">
                    <div class="wrap">
                        <ul class="slides">
                            <%
                            List<Advertising>  ad_list = advertisingDao.findAdvByLocation(1);
                            if(ad_list.size() > 0){
                                for(int i = 0;i < ad_list.size();i ++){
                                    String str_href = "javascript:void(0)";
                                    if(null != ad_list.get(i).getHref() && ad_list.get(i).getHref().length() > 0){
                                        str_href = ad_list.get(i).getHref();
                                    }
                            %>
                            <li><a href="<%=str_href%>" target="_blank"><img src="<%=ctx%>/common/displayPic?imagePath=<%=imgPath + ad_list.get(i).getPath()%>&imageName=<%=ad_list.get(i).getImage()%>"></a></li>
                            <%
                                }
                            }
                            %>
                            <%-- <li><a href="#"><img src="<%=ctx%>/images/banner_new1.jpg"></a></li>
                            <li><a href="#"><img src="<%=ctx%>/images/banner_new2.jpg"></a></li>
                            <li><a href="#"><img src="<%=ctx%>/images/banner_new3.jpg"></a></li>
                            <li><a href="#"><img src="<%=ctx%>/images/banner_new1.jpg"></a></li>
                            <li><a href="#"><img src="<%=ctx%>/images/banner_new2.jpg"></a></li> --%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

<script type="text/javascript">
function getIpPlace(){
    return remote_ip_info["city"];
}
var city = getIpPlace();
var province = "";
if(city.length == 0){
    city = returnCitySN["cname"];
    if(city.length > 0){
        if(city.indexOf("省") > -1){
            city = returnCitySN['cname'].substring(returnCitySN['cname'].indexOf("省") + 1,returnCitySN['cname'].length - 1);
        }else{
            if(city.indexOf("自治区") == -1){
                city = returnCitySN['cname'].substring(0,returnCitySN['cname'].indexOf("市") + 1);
            }
        }
    }
}
if(city.length > 0){
    if($('#setcity').val().length == 0){
        $('.denglu_left h').html(city);
    }
}else{
    province = remote_ip_info["province"];
    if(province.length == 0){
        province = returnCitySN["cname"];
        if(province.length > 0){
            if(city.indexOf("省") > -1){
                city = returnCitySN['cname'].substring(0,returnCitySN['cname'].indexOf("省") + 1);
            }else{
                if(city.indexOf("自治区") == -1){
                    city = returnCitySN['cname'].substring(0,returnCitySN['cname'].indexOf("市") + 1);
                }
            }
        }
    }
}
function setNowCityName(){
    var uri = "<%=ctx%>/former/setnowcity.do?";
    var cityname = "";
    if(city.length > 0){
        cityname = city;
        cityname = encodeURI(encodeURI(cityname)); 
        uri = uri + "city=" + cityname;
    }else{
        nowprovince = encodeURI(encodeURI(nowprovince)); 
        uri = uri + "province=" + nowprovince;
    }

    $.ajax({
        url: uri,
        type: "post",
        dataType: "JSON",
        async: false,
        timeout: 3000,
        success: function(ret){
            if(ret.nowcity.length > 0){
                var showcity = ret.nowcity.substring(0,ret.nowcity.length - 1);
                $('.denglu_left h').html(showcity);
            }else{
                $('.denglu_left h').html("上海");
            }
        },
        error: function(XMLRequest, textInfo){
            if(textInfo != null){
                alert(textInfo);
            }
        }
    });
}

$('#sousuo').keyup(function(event){
    var keycode = event.keyCode;
    if (keycode == 13) {
        var fuzzy = $("#sousuo").val();
        if(fuzzy.length == 0){
            return false;
        }
        fuzzy = encodeURI(encodeURI(fuzzy)); 
        var uri = "<%=ctx%>/former/searchbyfuzzy.do?fuzzy=" + fuzzy;

        $('#searchbutton')[0].href = uri;
        $('#searchbutton')[0].click();
    }
});


function searchbyfuzzy(obj){
    var fuzzy = $("#sousuo").val();
    if(fuzzy.length == 0){
        return false;
    }
    fuzzy = encodeURI(encodeURI(fuzzy)); 
    var uri = "<%=ctx%>/former/searchbyfuzzy.do?fuzzy=" + fuzzy;

    $(obj)[0].href = uri;
}
$(function(){
    if($('#setcity').val().length == 0){
        setNowCityName();
    }
})
</script>