<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ctx = (String)request.getContextPath();
%>
 <div class="home_fuwu">
    <div class="hf_cont">
        <div class="hfcc" style="border-right: 1px solid #e9e9e9;">
            <img src="<%=ctx%>/images/bottom_01.jpg"/><br/>
            平台保障<span>甄选优质产品全正品</span>
        </div>

        <div class="hfcc" style="border-right: 1px solid #e9e9e9;">
            <img src="<%=ctx%>/images/bottom_02.jpg"/><br/>
            安心付<span>安全可靠</span>
        </div>

        <div class="hfcc" style="border-right: 1px solid #e9e9e9;">
            <img src="<%=ctx%>/images/bottom_03.jpg"/><br/>
            品质高<span>挑选最低价格合作</span>
        </div>

        <div class="hfcc" style="border-right: 1px solid #e9e9e9;">
            <img src="<%=ctx%>/images/bottom_04.jpg"/><br/>
            售后维权<span>质量问题一站式服务网协助解决</span>
        </div>

        <div class="hfcc">
            <img src="<%=ctx%>/images/bottom_05.png"/><br/>
            好服务<span>全套式服务</span>
        </div>
    </div>
</div>
<div class="foot">
    <div class="foot_dh">
        <div class="footh_wenzi">
            <span>服务介绍</span>
            <a href="<%=ctx%>/a_s.jsp" class="footh_lianjie">配送安装</a>
            <a href="<%=ctx%>/a_c.jsp" class="footh_lianjie">产品保修</a>
            <a href="<%=ctx%>/a_a.jsp" class="footh_lianjie">用户协议</a>
        </div>

        <div class="footh_wenzi">
            <span>支付方式</span>
            <a href="<%=ctx%>/a_p.jsp" class="footh_lianjie">货到付款</a>
            <a href="<%=ctx%>/a_y.jsp" class="footh_lianjie">支付宝</a>
            <a href="<%=ctx%>/a_t.jsp" class="footh_lianjie">银行转账/汇款</a>
        </div>

        <div class="footh_wenzi">
            <span>热线电话</span>
            <a href="javascript:voicd(0)" class="footh_lianjies">400-665-8027</a>
            <a href="javascript:voicd(0)" class="footh_lianjiess">周一至周日8:00-24:00</a>
            <a href="<%=ctx%>/a_e.jsp" class="footh_lianjie">我要投诉</a>
        </div>

        <div class="footh_wenzi">
            <span>联系我们</span>
            <a href="<%=ctx%>/a_b.jsp" class="footh_lianjie">帮您养车网简介</a>
            <a href="<%=ctx%>/a_d.jsp" class="footh_lianjie">广告与市场合作</a>
            <a href="javascript:voicd(0)" class="footh_lianjie">招贤纳士</a>
        </div>

        <div class="footh_wenzi">
            <img src="<%=ctx%>/images/erwei.jpg"/>
        </div>
    </div>
	
    <div class="guanyu" >
        <a href="<%=ctx%>/about.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">关于我们</a>
        <a href="<%=ctx%>/a_s.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">服务简介</a>
        <a href="<%=ctx%>/a_d.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">加盟合作</a>
        <a href="<%=ctx%>/a_y.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">支付方式</a>
        <a href="<%=ctx%>/a_t.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">银联支付</a>
        <a href="<%=ctx%>/a_s.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">服务说明</a>
        <a href="<%=ctx%>/a_y.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">支付宝</a>
        <a href="<%=ctx%>/a_d.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">市场合作</a>
        <a href="<%=ctx%>/a_d.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">服务保障</a>
        <a href="<%=ctx%>/a_s.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">客户服务</a>
        <a href="<%=ctx%>/a_s.jsp" class="guanyu_cont" style="border-right: 1px solid #ffffff;">用户协议</a>
        <a href="javascript:voicd(0)" class="guanyu_cont" style="border-right: 1px solid #ffffff;">招贤纳士</a>
        <a href="<%=ctx%>/about.jsp" class="guanyu_cont">联系我们</a>
    </div>
    <div class="banquan">
        上海邦车电子商务有限公司   版权所有   <font style="font-weight: bolder;">沪ICP备11004912号-2</font>
    </div>

    <div class="gslogo">
        <img src="<%=ctx%>/images/gslogo.jpg"/>
    </div>
</div>