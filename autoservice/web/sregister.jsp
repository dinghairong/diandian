<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.smart4c.dao.DbHelper" %>
<%@ page import="com.smart4c.pojo.ServiceCatalog" %>
<%@ page import="com.smart4c.system.Strings" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smart4c.pojo.ServiceProduct" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<%
    String ctx = (String) request.getContextPath();
    DbHelper helper = DbHelper.getInstance();
    List<ServiceCatalog> serviceCatalogs = helper.getAllServices();

    Calendar c = Calendar.getInstance();
    int y = c.get(Calendar.YEAR);
    int m = c.get(Calendar.MONTH) + 1;
    int d = c.get(Calendar.DAY_OF_MONTH);
    String start = y + "年" + m + "月" + d + "日";

    c.add(Calendar.YEAR, 1);
    c.add(Calendar.DAY_OF_YEAR, -1);
    y = c.get(Calendar.YEAR);
    m = c.get(Calendar.MONTH) + 1;
    d = c.get(Calendar.DAY_OF_MONTH);
    String end = y + "年" + m + "月" + d + "日";
%>
<head>
    <link rel="stylesheet" href="<%=ctx%>/css/css.css">
    <link rel="stylesheet" href="<%=ctx%>/css/main.css">
    <link rel="stylesheet" href="<%=ctx%>/css/regist_store.css">
    <link rel="stylesheet" href="<%=ctx%>/css/regist_store_table.css">
    <link rel="stylesheet" href="<%=ctx%>/css/regist_store_protocol.css">

    <script src="<%=ctx%>/js/main.js"></script>
    <script src="<%=ctx%>/js/regist_store.js"></script>
    <script src="<%=ctx%>/js/regist_store_table.js"></script>
    <script src="<%=ctx%>/js/regist_store_protocol.js"></script>
    <script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
    <script src="<%=ctx%>/js/ajaxfileupload.js"></script>

    <title>门店注册</title>
</head>
<body>
<%-- <%@ include file="top.jsp" %> --%>
<jsp:include page="headSection.jsp" flush="true" />

<div id="regist">
    <div id="header">
        <span><%= Strings.get("regist_title") %></span>
        <span id="desc"><%= Strings.get("regist_tip") %></span>
    </div>

    <ul id="base_info">
        <li>
        	<span><span class="required">*</span>公司名称：</span>
        	<input id="txt_name" type="text" name="not_info_empty" placeholder="汉字、字母或下划线">
		</li>
        <li>
        	<span><span class="required">*</span>密码：</span>
        	<input type="password" id="txt_password" name="not_info_empty" placeholder="6-20个数字、字母或下划线">
        </li>
        <li>
        	<span><span class="required">*</span>确认密码：</span>
        	<input type="password" id="txt_repassword" name="not_info_empty" placeholder="请再次输入密码">
        </li>
        <li>
        	<span><span class="required">*</span>手机号码：</span>
        	<input id="txt_phone" type="text" name="not_info_empty" placeholder="请输入11位手机号">
        </li>
        <li>
            <span><span class="required">*</span>验证码：</span>
            <input id="txt_vcode" type="text" name="" placeholder="" class="vcode">
            <img src="<%=ctx%>/former/imagecode" alt="" id="vcode">
            <span id="change_pic">看不清?</span><a id="btn_vcode" href="javascript:void(0)">换一张</a>
        </li>
        <!-- <li>
            <span><span class="required">*</span>短信验证码：</span><input type="text" name="not_info_empty" placeholder="">
            <a href="javascript:void(0)" title="">
                <div id="btn_phone_vcode" class="button">发送验证码</div>
            </a>
        </li> -->
        <li>
        	<span>邮箱：</span>
        	<input id="txt_email" type="text" name="" placeholder="abcdxyz@126.com"></li>
        <li>
        	<span>介绍人号码：</span>
        	<input id="txt_introducer" type="text" name="" placeholder="请输入11位手机号">
        </li>
        <li>
        	<span><span class="required">*</span>门店名称：</span>
        	<input id="txt_store_name" type="text" name="not_info_empty" placeholder="汉字、字母、数字或下划线">
        </li>
        <li>
        	<span>业务联系电话：</span>
        	<input id="txt_tel" type="text" name="" placeholder="88888888">
        </li>
        <li>
            <span><span class="required">*</span>门店地址：</span>
            <select id="province"></select>
            <select id="city"></select>
            <select id="county"></select>
            <input type="text" id="txt_address" name="not_info_empty" placeholder="请输入详细地址">
        </li>
        <li class="upload">
            <span><span class="required"></span>上传一张门头图片：</span>

            <div>
                <img src="/images/pics.png" alt="" name="upload_img" id="img1">
                <!-- <a href="" title="">
                    <div class="button" id="btn_upload_face">上传图片</div>
                </a> -->
                <div style="position: relative; left: 300px; top: -40px;">
                    <form method="post" enctype="multipart/form-data" name="doupload" id="doupload">
                        <a id="biz_logo" class="link_button"
                           style="position: relative; overflow: hidden; direction: ltr;">
                            上传图片
                            <input type="file" name="file" id="file1"
                                   style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;"
                                   onchange="uploadUserInfo1('file1',this)">
                        </a>
                        <br>
                        <input id="filePath" name="filePath" type="hidden" value="stores">
                        <input id="fileName" name="fileName" type="hidden">

                    </form>
                </div>
                <span class="tip"><%= Strings.get("upload_img_tip") %></span>
            </div>
        </li>
        <li class="upload">
            <span><span class="required"></span>上传一张车间图片：</span>

            <div>
                <img src="/images/pics.png" alt="" name="upload_img" id="img2">
                <!-- <a href="" title="">
                    <div class="button" id="btn_uplaod_workshop">上传图片</div>
					
					有时间改掉
                </a> -->
                <div style="position: relative; left: 300px; top: -40px;">
                    <form method="post" enctype="multipart/form-data" name="doupload" id="doupload">
                        <a id="biz_logo" class="link_button"
                           style="position: relative; overflow: hidden; direction: ltr;">
                            上传图片
                            <input type="file" name="file" id="file2"
                                   style="position: absolute; right: 0px; top: 0px; font-family: Arial; font-size: 118px; margin: 0px; padding: 0px; cursor: pointer; opacity: 0;"
                                   onchange="uploadUserInfo2('file2',this)">
                        </a>
                        <br>
                        <input id="filePath" name="filePath" type="hidden" value="stores">
                        <input id="fileName" name="fileName" type="hidden">

                    </form>
                </div>
                <span class="tip"><%= Strings.get("upload_img_tip") %></span>
            </div>
        </li>
        <li><span></span><a href="javascript:void(0)" title="" id="btn_info">
            <div class="submit center">下一步</div>
        </a></li>
    </ul>
    <iframe style="display:none" id="rfFrame" name="rfFrame" src="about:blank">
    </iframe>
    <input id="J_img" type="hidden" value="" name="logo">
    <input id="J_path" type="hidden" value="shop\icon\" name="path">
    <input id="J_identity" type="hidden" value="" name="identity_img">

    <div id="service_select">
        <div>
            <span class="title">可做服务项目勾选</span>
            <span class="desc">请在本页面勾选您门店有对应的工位，技师以及设备，并且愿意按照以下对应价格提供服务</span>
        </div>

        <table>
            <thead>
            <tr>
                <th>类别</th>
                <th>服务项目</th>
                <th>车主自带配件</th>
                <th>备注</th>
                <th>价格（元）</th>
                <th>选择</th>
            </tr>
            </thead>
            <tbody>
            <%
                int index = 1;
                for (ServiceCatalog serviceCatalog : serviceCatalogs) {
                    List<ServiceProduct> serviceProducts = serviceCatalog.getServiceProducts();

                    for (int i = 0; i < serviceProducts.size(); i++) {
                        ServiceProduct product = serviceProducts.get(i);
            %>
            <tr>
                <% if (i == 0) { %>
                <td class='center auto_width <%= (index++ % 2 == 0) ? "color_odd" : "color_even" %>'
                    rowspan="<%= serviceProducts.size() %>"><%= serviceCatalog.getName() %>
                </td>
                <% } %>
                <td><%= product.getTitle() %>
                </td>
                <td><%= product.getAccessory() %>
                </td>
                <td><%= product.getDescription() %>
                </td>
                <td class="price"><%= product.getWeb_price() %>
                </td>
                <td class="center cb"><input type="checkbox" name="sel_projects" value="<%= product.getId() %>"/></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td class="nbsp"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <div class="operation">
            <a href="javascript:void(0)" id="btn_sel_next" title="">
                <div class="submit">下一步</div>
            </a>
            <a href="#regist" id="btn_sel_back" title="">
                <div class="back">返回</div>
            </a>
        </div>
    </div>

    <div id="protocol">
        <h1>合&nbsp;作&nbsp;协&nbsp;议</h1>

        <p>甲方：上海邦车电子商务有限公司</p>

        <p>&nbsp;</p>

        <p class="yi">乙方：<input id="txt_second" type="text" value="" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p>甲、乙双方本着自愿、平等、公平、诚实、信用的原则，经友好协商，根据中华人民共和国有关法律、法规的规定签订本协议，由双方共同遵守。</p>

        <p>&nbsp;</p>

        <p>第一条</p>

         <p>协议范围内，双方的关系确定为合作关系。为拓展市场更好地、更规范地服务消费者，根据公司的规划，甲方根据乙方的申请和对乙方的经营能力的审核，同意乙方加入 帮您养车网 为甲方客户提供安装服务网络。同意乙方在<input id="txt_province" class="province" type="text" value="" name="not_protocol_empty">省<input id="txt_city" class="city" type="text" value="" name="not_protocol_empty">市<input id="txt_place" type="text" value="" name="not_protocol_empty">处为第三方提供安装服务/安装单(见附件)。</p>
        <p>&nbsp;</p>

        <p>第二条</p>

        <p>
            订立本协议的目的在于确保甲、乙双方忠实履行本协议规定的双方的职责和权利。乙方作为单独的企业法人或者经营者进行经济活动。因此，乙方必须遵守对所有企业法人或者经营者共同的法律要求，特别是有关资格的规则以及社会的，财务的商业要求。作为一个企业法人或经营者，乙方应就其活动自负一切风险和从合法经营中获利。乙方向消费者提供的任何产品，必须确保产品质量，并对消费者提供的产品承担全部责任风险。乙方不是甲方的代理人，也不是甲方的雇员和合伙人。乙方不是作为甲方委托代表，乙方无权以甲方的名义签订协议使甲方在任何方面对第三方承担责任，或由甲方负担费用，承担任何义务。订立本协议并未授予乙方任何约束甲方和甲方有关企业之权利，甲方对本协议任何条款有最终的解释权。</p>

        <p>&nbsp;</p>

        <p>第三条</p>

        <p>本协议有效期从<i><%= start %>
        </i>至<i><%= end %></i>，由签约日计。除非本协议提前终止，合同期满后若甲、乙双方均未提出解除合同的要求，可视为双方同意续签，并延续本合作协议的相互约束力。</p>

        <p>&nbsp;</p>

        <p>第四条</p>

        <p>
            甲方为使乙方所辖区域更好运营，提升客流量，保证服务质量符合标准，将会合理定价，最大限度保证乙方的供应。在本协议期间，甲方承诺，积极协助承担市场物流、组织功能，乙方按甲方要求确保产品的适时安装和服务质量，并承担提供安装服务时、安装结果的一切风险和责任。</p>

        <p>&nbsp;</p>

        <p>第五条</p>

        <p>
            1、乙方只能使用甲方提供、指定的产品或者第三方消费者提供的产品为第三方提供安装服务。乙方在合作期间不得替换甲方提供的任何产品或者客户提供的其它任何产品。在双方合作关系确定期间若乙方违反该协议规定，造成任何损失将由乙方承担全部责任。</p>

        <p>2、乙方不得在第三方消费者不知情的情况下，提供其他任何有偿产品和服务。如提供，必须提前明示产品和服务的内容、目的及收费信息。</p>

        <p>3、如乙方提供其他产品，应征得甲方或第三方的确认，必须保证提供合格产品和服务质量，并且对所提供的产品和服务质量承担全部责任，甲方不承担因安装非甲方指定的产品所导致的任何风险和责任。</p>

        <p>&nbsp;</p>

        <p>第六条</p>

        <p>
            甲方需承担货物调配、安装服务等产生的相关费用的义务。乙方需要积极配合接收甲方提供到店的安装服务信息并对安装服务尽到妥善管理，积极联系消费者尽早安装的义务。乙方有权拒收或者要求甲方更换不适合第三方消费者安装的服务产品。乙方有义务检查第三方消费者所带的产品是否有损伤，并协调第三方消费者提出退货要求的义务。</p>

        <p>&nbsp;</p>

        <p>&nbsp;</p>

        <p>流程详情：</p>

        <p>1．预约；</p>

        <p>a、与客户确定安装时间和地点；</p>

        <p>b、甲方将“购物清单”及所需服务项目提前配送至门店；</p>

        <p>c、门店根据上述单据，在车主预约到店的时间前准备服务人员和必要的安装工具。</p>

        <p>&nbsp;</p>

        <p>2．安装与代收款：</p>

        <p>a．车主在所预约的安装服务时间内到达所预约的店面；</p>

        <p>b．店家安装(店家必须提供合格的安装服务，安装完毕后店家必须让车主进行驾车测试)。店家让车主签字确认“检测及安装单”，并填写好店家应确认内容；</p>

        <p>c、特殊情况下如甲方需要乙方在完成安装代收货款，店面负责向客户收取货款，按照约定时间后续汇款给甲方。</p>

        <p>d、完成安装服务后的7个工作日之内第三方消费者若对本次服务有投诉，乙方有义务免费为第三方消费者协调满意或者重新服务。</p>

        <p>&nbsp;</p>

        <p>结算标准：</p>

        <p>乙方根据网购客户的专有购物清单为客户提供安装服务,甲方通过网购客户的安装服务评价、及乙方提供的客户安装凭证底单核销客户购物清单的确认，同意对乙方支付安装费用，具体结算金额按照本协议附件执行；</p>

        <p>&nbsp;</p>

        <p>付款方式</p>

        <p>乙方完成指定安装服务项目之后，甲方将在10个工作日之内，将费用回款至乙方提供指定的银行帐号或者支付宝账号；</p>

        <p>乙方结算指定帐户帐号为： </p>

        <p>开户行：<input id="txt_bank" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p>账号：<input id="txt_account" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p>账户名：<input id="txt_account_name" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p>支付宝账号：<input id="txt_alipay" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p></p>第七条、双方责任：</p>
        <p>甲方责任：</p>

        <p>甲方负责向乙方提供当地区域的网购客户或（会员），并保证客户资料信息的真实有效！ </p>

        <p>甲方负责网购客户姓名、电话，安装产品、服务类型的确认；</p>

        <p>甲方负责网购客户所参加的促销活动、和促销物品（赠品）、以及促销时间的确认；</p>

        <p>甲方有义务在第三方消费者确认安装服务之后，在约定时间内，将服务费用打款给乙方。</p>

        <p>乙方责任：</p>

        <p>乙方负责对甲方提供（介绍）客户进行信息核实、登记；</p>

        <p>乙方负责对甲方提供（介绍）的安装客户进行服务安装；</p>

        <p>乙方需接受甲方的监督服务的评价、乙方有责任将收集、反馈有关市场、消费、安装服务以及投诉建议信息给甲方。乙方服务区域对客户增值部份的销售、服务、以及馈赠等促销活动，将由乙方自行负责；</p>

        <p>
            乙方在指定区域内将设专业人员负责，服务之前有义务当面先检查第三方消费者所带的产品是否完好及适合第三方消费者车辆安装，按专业内容进行操作，如果由乙方安装造成第三方消费者所购买的产品破损、因安装造成其他方面的破损，而带来的损失由乙方自己承担；；</p>

        <p>因乙方提供不合格产品或服务致使第三方损失的，由乙方自行承担全部责任包括但不限于赔偿、退款等；</p>

        <p>乙方完成服务后，由消费者驾车检测，7个工作日之内第三方消费者若对服务有投诉，乙方有义务免费为第三方消费者协调满意或者重新服务。</p>

        <p>乙方任何新增/更换网点，需事先以书面形式通知甲方，经甲方书面许可后方可实施。</p>

        <p>乙方严格执行甲方的价格管理政策，当网购客户所带商品指定安装，乙方不得以任何方式、理由销售、报价、打折、等有损合作意向的举动；。</p>

        <p>乙方之名称、地址、主要股东或负责人变更时，应于变更之日起七天内以书面形式通知甲方，并提供具有法律效应的相关证明文件，以便双方变更本合约。</p>

        <p>未经双方协商同意，乙方不得将本托管协议部分或全部转给第三方，由此造成的任何经济损失，由乙方负责，甲方不负责其造成的任何相关连带责任。</p>

        <p>本合约一式二份，甲、乙方各一份。如有未尽事宜，双方协商，可另行签订补充协议，补充协议一经签署与本合约具有同等效力；</p>

        <p>&nbsp;</p>

        <p>&nbsp;</p>

        <p><span>甲方：上海邦车电子商务有限公司</span>乙方：<input id="txt_second2" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p><span>代表：</span>代表：<input id="txt_linkman" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p><span>联系地址：</span>联系地址：<input id="txt_p_address" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p><span>联系电话：</span>联系电话：<input id="txt_p_tel" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p><span>专职负责人员：</span>业务负责人：<input id="txt_person_in_charge" type="text" name="not_protocol_empty"></p>

        <p>&nbsp;</p>

        <p><span>签章：</span>签章：</p>

        <p>&nbsp;</p>

        <img id="seal" src="/images/seal.png" alt="">

        <div class="operation">
            <a href="javascript:void(0)" id="btn_protocal_next" title="">
                <div class="submit">下一步</div>
            </a>
            <a href="#regist" id="btn_protocal_back" title="">
                <div class="back">返回</div>
            </a>
        </div>
    </div>

</div>

<%-- <%@ include file="bottom.jsp" %> --%>
<jsp:include page="footSection.jsp" flush="true" />

<script>
function init() {
	var $base_info = document.getElementById("base_info");
	var $service_select = document.getElementById("service_select");
	var $protocol = document.getElementById("protocol");

	var $btn_info = document.getElementById("btn_info");
	var $province = document.getElementById("province");
	var $city = document.getElementById("city");
	var $county = document.getElementById("county");
	var $btn_vcode = document.getElementById("btn_vcode");
	var $vcode = document.getElementById("vcode");
	// var $btn_phone_vcode = document.getElementById("btn_phone_vcode");
	var $file1 = document.getElementById("file1");
	var $file2 = document.getElementById("file2");

	if ($btn_info) {
		$btn_info.addEventListener("click", function() {
			var $eles = document.getElementsByName("not_info_empty");
			if (validateEmpty($eles) && validate_info()
				&& validateVcode('<%= com.smart4c.system.Ajaxs.VALIDATE_CODE %>')) {

				var $txt_name = document.getElementById("txt_name"); // *
				var $txt_address = document.getElementById("txt_address"); // *
				var $txt_tel = document.getElementById("txt_tel");
				var $province = document.getElementById("province");
				var $city = document.getElementById("city");

				var $txt_second = document.getElementById("txt_second");
				var $txt_second2 = document.getElementById("txt_second2");
				var $txt_p_address = document.getElementById("txt_p_address");
				var $txt_p_tel = document.getElementById("txt_p_tel");
				var $txt_province = document.getElementById("txt_province");
				var $txt_city = document.getElementById("txt_city");

				$txt_second.value = $txt_second2.value = $txt_name.value;
				$txt_province.value = $province.value;
				$txt_city.value = $city.value;
				$txt_p_address.value = $txt_address.value;
				$txt_p_tel.value = $txt_tel.value;

				$base_info.style.display = "none";
				$service_select.style.display = "block";
				window.location.href = "#regist";
			}
		});
	}

	getProvince('<%= com.smart4c.system.Ajaxs.GET_PROVINCE %>');

	$province.addEventListener("change", function() {
		getCity('<%= com.smart4c.system.Ajaxs.GET_CITY %>');
	}); 

	$city.addEventListener("change", function() {
		getCounty('<%= com.smart4c.system.Ajaxs.GET_COUNTY %>');
	}); 

	$btn_vcode.addEventListener("click", function() {
		if ($vcode) {
			$vcode.src = '<%=ctx%>/former/imagecode?' + new Date();
		}
	});

	/******************************** info end *************************************************/

	var $btn_sel_next = document.getElementById("btn_sel_next");
	var $btn_sel_back = document.getElementById("btn_sel_back");

	if ($btn_sel_next) {
		$btn_sel_next.addEventListener("click", function() {

			if (getSelects()) {
				$service_select.style.display = "none";
				$protocol.style.display = "block";
				window.location.href = "#regist";
			}
		});
	}

	if ($btn_sel_back) {
		$btn_sel_back.addEventListener("click", function() {

			$service_select.style.display = "none";
			$base_info.style.display = "block";

		});
	}

	/******************************** select table end *************************************************/

	var $btn_protocal_next = document.getElementById("btn_protocal_next");
	var $btn_protocal_back = document.getElementById("btn_protocal_back");

	if ($btn_protocal_next) {
		$btn_protocal_next.addEventListener("click", function() {
			var $protocol_eles = document.getElementsByName("not_protocol_empty");
			if (validateEmpty($protocol_eles) && getProtocolInfo()) {
				doSubmit('<%= com.smart4c.system.Ajaxs.REGIST_STORE %>');
			}
		});
	}

	if ($btn_protocal_back) {
		$btn_protocal_back.addEventListener("click", function() {

			$protocol.style.display = "none";
			$service_select.style.display = "block";

		});
	}

	// $btn_phone_vcode.addEventListener("click", function(e) {
	// 	var $phone = document.getElementById("txt_phone");

	// 	if ($phone && $phone.value) {
	// 		e.target.disabled = true;
	// 		var formData = "mobile=" + encodeURIComponent($phone.value);
	// 		var req = new XMLHttpRequest();
	// 		req.open("POST", "<%=ctx%>/former/sendcode.do", true);
	// 		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	// 		// req.setRequestHeader("Content-Type", "application/json");
	// 		req.onload = function() {
	// 			if (req.status == 200) {
	// 				e.target.innerHTML = "验证码已发送(<i>5</i>)";
	// 				var vcodeInterval = setInterval(function() {
	// 					var $i = e.target.getElementsByTagName("i")[0];
 //                        var currTime = $i.innerHTML;
	//         			var newTime = parseInt(currTime) - 1;
	// 			        if (newTime) {
	// 			            $i.innerHTML = newTime;
	// 			        } else {
	// 			            clearInterval(vcodeInterval);
	// 			            e.target.disabled = false;
	// 			            e.target.innerHTML = "重新发送";
	// 			        }
 //                    }, 1000);
	// 			} else {
	// 				$phone.value = "短信验证码发送失败"
	// 			}
	// 		};
	// 		log(formData);
	// 		req.send(formData);
	// 	} else {

	// 	}
	// });
}


</script>
</body>
</html>
