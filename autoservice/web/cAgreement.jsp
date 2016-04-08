<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.bean.Company"%>
<%@ page import="com.smart4c.dao.DbHelper, com.smart4c.pojo.RegProtocol, java.util.Calendar"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    DbHelper helper = DbHelper.getInstance();
    String ctx = (String)request.getContextPath();
    Company company = (Company)session.getAttribute("company");
    if(company == null){
        response.sendRedirect(ctx + "/logout.jsp");
        return;
    }

    RegProtocol rp = helper.getStoreProtocol(company.getId());
    // Calendar start = Calendar.getInstance();
    // start.setTime(rp.getStart());
    // start.get(Calendar.YEAR);
    // Calendar end = Calendar.getInstance();
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮你养车网－－企业用户－－欢迎页</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <!-- <link rel="stylesheet" href="<%=ctx%>/css/global.min.css"> -->
    <link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
    <link rel="stylesheet" href="<%=ctx%>/css/cwelcome.css">
    <link rel="stylesheet" href="<%=ctx%>/css/enterprise_agreement.css">
    <link href="images/favicon.ico" rel="shortcut icon"/>

    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/jquery.tabso_yeso.js"></script>
    <script src="<%=ctx%>/js/jquery.flexslider-min.js"></script>
    <script src="<%=ctx%>/js/common.js"></script>
    <script type="text/javascript">
        $(function() {
            $(".wrap").flexslider({
                animation: "slide",
                controlNav: true,
                animationLoop: true
            });
        });
        var ctx = "<%=ctx%>";
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
    <script src="<%=ctx%>/js/hongxi.alert.js"></script>
</head>
<body>
<div class="all" id="all">
    <jsp:include page="headSection.jsp" flush="true" />
    <div class="top_line"></div>
    <div id="bodySection" style="overflow: hidden;min-height:0;">
        <div class="qyyh_lsddAll">
            <div class="qyyh_lsdd">
                <div class="nav">
                    <a href="<%=ctx%>/cwelcome.jsp" class="on">欢迎页</a>
                    <a href="<%=ctx%>/cselect.jsp">服务选购</a>
                    <a href="<%=ctx%>/corder.jsp">消费订单管理</a>
                    <a href="<%=ctx%>/caccount.jsp">账号管理</a>
                    <a href="<%=ctx%>/count.jsp" style="border-right: 0!important;">统计</a>
                </div>

                <div id="second" style="display: block">
                    <h1>线上商家合作协议</h1>
                    <p>协议编号：<input type="text" readonly="readonly" value="<%=rp.getCode()%>" name="reg_sec" id="agreement_no"></p>
                    <p>甲方：上海邦车电子商务有限公司&emsp;&emsp;乙方：<input type="text" value="<%=rp.getCompany()%>" name="reg_sec" id="sec_name" readonly="readonly"></p>
                    <p>&nbsp;</p>   
                    <p>乙方信息</p>
                    <p>公司名：<input type="text" value="<%=rp.getCompany()%>" name="reg_sec" id="sec_name_01" readonly="readonly"></p>
                    <p>营业执照编号：<input type="text" value="<%=rp.getLicence()%>" name="reg_sec" id="license" readonly="readonly"></p>
                    <p>乙方联系人：<input type="text" value="<%=rp.getLinkman()%>" name="reg_sec" id="sec_contact" readonly="readonly"></p>
                    <p>联系方式：<input type="text" value="<%=rp.getTel()%>" name="reg_sec" id="sec_phone" readonly="readonly"></p>
                    <p id="addr">链接地址：<input type="text" value="<%=rp.getUrl()%>" name="reg_sec" id="sec_href" readonly="readonly"></p>
                    <p>店铺所属平台：<input type="text" value="<%=rp.getPlatform()%>" name="reg_sec" id="for_platform" readonly="readonly"></p>
                    <p>&nbsp;</p>   
                    <p>一、为更好的为帮您养车网线上商户提供服务，同时保障合作双方的权力和义务，基于平等互利、公平自愿、诚实守信原则，经协商一致同意签订如下协议共同遵守。</p>
                    <p>二、通过网络页面点击确认或勾选以及书面签署等方式选择接受本协议，包括购买使用了帮您养车网的服务商品，均表示双方就本协议达成一致并接受本协议的全部内容。</p>
                    <p>三、合作内容</p>
                    <p>甲方作为服务雇佣平台，为乙方有偿提供线下各项服务；乙方作为服务雇佣方，在购买行为发生后，享有服务的各项权益。</p>
                    <p>四、权力和义务</p>
                    <p>1、甲乙双方必须保证提供的各项资料准确无误。</p>
                    <p>2、任何情况下，乙方不得泄露甲方合作服务点的信息和服务内容及相关信息；</p>
                    <p>3、合作期间内，甲方有义务为乙方在服务过程中遇到的服务相关问题进行沟通解决；</p>
                    <p>4、合作期间内，若乙方违反本合同的约定，甲方有权立即终止与乙方的合作关系，发生利益冲突，甲方不负任何责任，由乙方自行承担；</p>
                    <p>5、合作期间内，若乙方要求终止合作，经甲方同意后可将未使用完的充值金额，在除去相关费用后无息退还给乙方。</p>
                    <p>五、免责条约</p>
                    <p>1、因乙方产品问题，需要调换，造成的二次服务费用由乙方承担；</p>
                    <p>2、因乙方产品问题，导致服务未成功，则甲方将服务费用退还给乙方；</p>
                    <p>3、因乙方产品问题，导致的其他问题及产生费用，由乙方承担所产生的费用及责任；</p>
                    <p>4、如非产品本身问题，因甲方提供不合格服务致使第三方损失的，由甲方承担全部责任包括但不限于赔偿、退款等；</p>
                    <p>5、甲方完成服务后，由消费者驾车检测，7个工作日之内第三方消费者若对服务有投诉，甲方有义务免费为第三方消费者协调满意或者重新服务；</p>
                    <p>六、协议期限、变更、终止及争议解决</p>
                    <p id="date">1、协议有效期自<em style="margin: 0 5px; font-weight: bold；"><%=rp.getStart()%></em>日至<em style="margin: 0 5px; font-weight: bold；"><%=rp.getEnd()%></em>日，双方签署盖章起生效；</p>
                    <p>2、协议期满，如双方未有解除协议，此协议自动顺延一年；</p>
                    <p>3、在协议执行期内，任何一方需要终止合同，需提前15天书面通知对方。</p>
                    <p>4、本协议一式两份，甲乙双方各执一份，具有同等的法律效力。</p>
                    <p>5、双方合作过程中产生的一切争议均应按照中华人民共和国法律处理，并以上海市嘉定区人民法院为第一审管辖法院。</p>
                    <p>&nbsp;</p>

                    <div id="end">
                        <p>甲方：（加盖公章）</p>
                        <p class="right">乙方：（加盖公章）</p>
                        <img src="./images/seal.png">
                        <p class="empty">&nbsp;</p>
                        <p>日期：<span><%=rp.getStart()%></span></p>
                        <p class="right">日期：<span><%=rp.getStart()%></span></p>
                        <p class="empty">&nbsp;</p>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <jsp:include page="footSection.jsp" flush="true" />
</div>
</body>
<script type="text/javascript">


    $(function(){
        $('.daohang').hide();
        $('.lunbo').hide();
    });

    function chongzhi(){
        $("#gotochozhi").hide();
        $("#chozhi").show();
    }
    function closechozhi(){
        $("#chozhi").hide();
        $("#gotochozhi").show();
    }
    function gochozhi(){
        var money = $('#prepaid').val();
        if(money.length == 0){
            sAlert("");
            return false;
        }
        $("#paidmoney").val(money);
        $("form[name='alipayment']").submit();
    }
</script>
</html>