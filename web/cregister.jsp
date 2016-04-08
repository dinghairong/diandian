<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.Date" %>
<%@ page import="com.smart4c.system.IDGenerator" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.smart4c.system.Ajaxs" %>


<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/css/css.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/register_enterprise.css">
    <link rel="stylesheet" href="/css/enterprise_agreement.css">
    <script src="/js/main.js"></script>
    <script src="/js/register_enterprise.js"></script>

</head>
<body>
	<%-- <%@ include file="top.jsp"%> --%>
	<jsp:include page="headSection.jsp" flush="true" />

	<div id="body"> 
		<div id="header">
			<span>线上商家注册</span>
			<span id="desc">欢迎您加入帮您养车网！希望从现在开始，我们能为您的生活提供更多便捷与快乐</span>
		</div>

		<div id="first">
			<ul class="regist">
				<li>
					<div>
						<em>*</em>
						<span>公司:</span>
					</div>
					<input type="text" value="" name="reg_fir" placeholder="中文、英文（含大小写）" id="fir_name"> 
				</li>
				<li>
					<div>
						<em>*</em>
						<span>联系人:</span>
					</div>
					<input type="text" value="" name="reg_fir" placeholder="中文、英文（含大小写）" id="fir_contact"> 
				</li>
				<li>
					<div>
						<em>*</em>
						<span>联系电话:</span>
					</div>
					<input type="text" value="" name="reg_fir" placeholder="至少8位数字" id="fir_phone"> 
				</li>
				<li>
					<div>
					
						<span>联系邮箱:</span>
					</div>
					<input type="text" value="" name="" placeholder="请输入联系人邮箱" id="reg_email"> 
				</li>
				<li>
					<div>
						<!-- <em>*</em> -->
						<span>所属店铺:</span>
					</div>
					<input type="text" value="" name="" placeholder="例如：天猫、京东等" id="fir_platform"> 
				</li>
				<li>
					<div>
						<!-- <em>*</em> -->
						<span>店铺链接地址:</span>
					</div>
					<input type="text" value="" name="" placeholder="请输入链接地址" id="href_addr"> 
				</li>
				<li>
					<div>
						<span>所属地区:</span>
					</div>
					<select id="province"></select>
					<select id="city"></select>
					<select id="county"></select>
				</li>
				<li>
					<div>
						<span>详细地址:</span>
					</div>
					<input type="text" value="" name="" placeholder="请输入详细地址" id="desc_addr"> 
				</li>
				<li>
					<div>
						<em>*</em>
						<span>初始密码:</span>
					</div>
					<input type="password" value="" name="reg_fir" id="pwd_fir" placeholder="数字,字母或下划线,至少6位"> 
				</li>
				<li>
					<div>
						<em>*</em>
						<span>确认密码:</span>
					</div>
					<input type="password" value="" name="reg_fir" id="reg_pwd" placeholder="请再次输入密码"> 
				</li>			
			</ul>

			<div class="next">
				<input type="checkbox" value="" name="" id="reg_chk"><span>同意帮您养车网 合作协议</span>
				<a href="javascript:void(0)" title=""><div id="btn_next">下一步</div></a>
			</div>
		</div>

<%
	SimpleDateFormat y_format = new SimpleDateFormat("yyyy");
	SimpleDateFormat m_format = new SimpleDateFormat("MM");
	SimpleDateFormat d_format = new SimpleDateFormat("dd");
	Date from = new Date();
	Calendar c = Calendar.getInstance();
	c.setTime(from);
	c.add(Calendar.YEAR, 1);
	c.add(Calendar.DAY_OF_YEAR, -1);
	Date to = c.getTime();
%>
		<div id="second" >
			<h1>线上商家合作协议</h1>
			<p>协议编号：<input type="text" readonly="readonly" value="<%=IDGenerator.getUUID()%>" name="reg_sec" id="agreement_no"></p>
			<p>甲方：上海邦车电子商务有限公司&emsp;&emsp;乙方：<input type="text" value="" name="reg_sec" id="sec_name"></p>
			<p>&nbsp;</p>	
			<p>乙方信息</p>
			<p>公司名：<input type="text" value="" name="reg_sec" id="sec_name_01"></p>
			<p>营业执照编号：<input type="text" value="" name="reg_sec" id="license"></p>
			<p>乙方联系人：<input type="text" value="" name="reg_sec" id="sec_contact"></p>
			<p>联系方式：<input type="text" value="" name="reg_sec" id="sec_phone"></p>
			<p id="addr">链接地址：<input type="text" value="" name="reg_sec" id="sec_href"></p>
			<p>店铺所属平台：<input type="text" value="" name="reg_sec" id="for_platform"></p>
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
			<p id="date">1、协议有效期自<input type="text" readonly="readonly" value="<%=y_format.format(from)%>" name="reg_sec" class="year" id="curr_year">年<input type="text" readonly="readonly" value="<%=m_format.format(from)%>" name="reg_sec" id="curr_month">月<input type="text" readonly="readonly" value="<%=d_format.format(from)%>" name="reg_sec" id="curr_day">日至<input type="text" readonly="readonly" value="<%=y_format.format(to)%>" name="reg_sec" class="year" id="to_year">年<input type="text" readonly="readonly" value="<%=m_format.format(to)%>" name="reg_sec" id="to_month">月<input type="text" readonly="readonly" value="<%=d_format.format(to)%>" name="reg_sec" id="to_day">日，双方签署盖章起生效；</p>
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
				<p>日期：</p>
				<p class="right">日期：</p>
				<p class="empty">&nbsp;</p>
			</div>

			<div id="btn_agreement">
				<a href="javascript:void(0)"><div id="btn_agree">同意</div></a>
				<a href="#header"><div id="btn_disagree">上一步</div></a>
			</div>
		</div>
	</div>
	<input type="hidden" id="from_time" value="<%=from.getTime()%>">
	<input type="hidden" id="to_time" value="<%=to.getTime()%>">

	<%-- <%@ include file="bottom.jsp" %> --%>
	<jsp:include page="footSection.jsp" flush="true" />

	<script>

	function init() {
		var $province = document.getElementById("province");
		var $city = document.getElementById("city");
		var $county = document.getElementById("county");

		getProvince('<%= com.smart4c.system.Ajaxs.GET_PROVINCE %>');

		$province.addEventListener("change", function() {
			getCity('<%= com.smart4c.system.Ajaxs.GET_CITY %>');
		}); 

		$city.addEventListener("change", function() {
			getCounty('<%= com.smart4c.system.Ajaxs.GET_COUNTY %>');
		}); 

		reg_event();


	}

	function getReq_code4Agree() {
		return '<%=Ajaxs.REGIST_ENTERPRISE%>';
	}

	</script>
</body>
</html>
