<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	//Integer total = (Integer)request.getAttribute("commodity_total");
	int pagenum = 0;
	// pagenum = total / 15;
	// if(total % 15 != 0){
	// 	pagenum = pagenum + 1;
	// }
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帮您养车网－－服务介绍</title>

    <link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=ctx%>/css/global.min.css">	
	<link rel="stylesheet" href="<%=ctx%>/css/about.css">
	<link rel="stylesheet" href="<%=ctx%>/css/Goods.min.css">
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
    </script>
    <script src="<%=ctx%>/js/js.js"></script>
</head>
<body>
	<div class="all" id="all">
		<jsp:include page="headSection.jsp" flush="true" />
		<div class="top_line"></div>

		<div id="bodySection" style="overflow: hidden;">
			<div class="siteNavi">
				<a href="">首页</a>
				<span class="s1"> ></span>
				<span>服务介绍</span>
			</div>
			<div id="ListLeft">
				<div class="leftNavi">
					<div class="leftNavi_div">
						<div class="title_list">
							服务介绍
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_s.jsp" style="line-height: 45px;">配送安装</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_c.jsp" style="line-height: 45px;">产品保修</a>
						</div>			
						<div class="title_list_div2">
							<a href="<%=ctx%>/a_a.jsp" style="line-height: 45px;" class="title_select">用户协议</a>
						</div>
						<div class="title_list">
							支付方式
						</div>
						<div class="title_list_div3">
							<a href="<%=ctx%>/a_p.jsp" style="line-height: 45px;">货到付款</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_y.jsp" style="line-height: 45px;">支付宝</a>
						</div>
						<div class="title_list_div2">
							<a href="<%=ctx%>/a_t.jsp" style="line-height: 45px;">银行转账/汇款</a>
						</div>
						<div class="title_list">
							联系我们
						</div>
						<div class="title_list_div3">
							<a href="<%=ctx%>/a_b.jsp" style="line-height: 45px;">帮您养车网简介</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_d.jsp" style="line-height: 45px;">广告与市场合作</a>
						</div>
						<div class="title_list_div1">
							<a href="#javascript:void(0)" style="line-height: 45px;">招贤纳士</a>
						</div>
						<div class="title_list_div1">
							<a href="<%=ctx%>/a_e.jsp" style="line-height: 45px;">我要投诉</a>
						</div>
					</div>	
				</div>
			</div>
			<div id="context" style="overflow: hidden;">
				<div class="grid_19">
					<table>
						<tbody>
							<tr style="border-bottom:none;">
								<th style="background-color:white;width:18%; height:38px;border-top:2px solid #007fcc;">
								<a style="color:#007fcc;">帮您养车网注册用户条款</a>
								</th>
								<th style="border-left:1px solid #E3E3E3;background-color:#F8F8F8;width:25%;border-top:1px solid #E3E3E3;border-bottom:1px solid #E3E3E3;height:38px;" colspan="2"></th>
							</tr>
						</tbody>
					</table>
						<table>
							<tbody>
								<tr>
									<td style="border-top:none;padding-bottom:30px;">
										<div style="margin-left: 20px; margin-top: 20px;margin-right: 20px;">
											<p>
												<span style="font-weight:bolder;">第一章 总则</span>
												<br>
												第1条 本网站命名为"帮您养车网"。
												<br>
												第2条 本网站的管理维护由帮您养车网网站支持部门负责。
											</p>
											<p>
												<span style="font-weight:bolder;">第二章 言论规则</span>
												<br>
												第3条 注册用户享有言论自由权利；并适度拥有修改、删除自己发表的文章的权利。
												<br>
												第4条 本注册用户不得在本网站发表包含以下内容的言论：
												<br>
												（一）煽动抗拒、破坏宪法和法律、行政法规实施的；
												<br>
												（二）煽动颠覆国家政权，推翻社会主义制度的；
												<br>
												（三）煽动分裂国家、破坏国家统一的；
												<br>
												（四）煽动民族仇恨、民族歧视，破坏民族团结的；
												<br>
												（五）任何包含对种族、性别、宗教、地域内容等歧视的；
												<br>
												（六）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；
												<br>
												（七）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；
												<br>
												（八）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；
												<br>
												（九）损害国家机关信誉的；
												<br>
												（十）其他违反宪法和法律行政法规的。
												<br>
												第5条 未经帮您养车网同意，禁止在本网站内发布任何形式的广告。
											</p>
											<p>
												<span style="font-weight:bolder;">第三章 注册用户</span>
												<br>
												第6条 在帮您养车网注册的用户（以下简称"注册用户"），拥有注册用户基本权限。注册用户在本网站发表文章及回帖时必须遵守《帮您养车网注册用户条款》。
												<br>
												第7条 本注册用户的个人资料受到保护，不接受任何个人或单位的查询请求，公安机关和司法部门或根据国家相关法律规定提供除外。
												<br>
												第8条 本注册用户享有在本网站各公开栏目发表言论的权利，若栏目中有特殊规定，或受到帮您养车网处罚而关闭发言权限则例 外。
												<br>
												第9条 一旦注册成功，注册用户默认自愿接受来自帮您养车的联络和信息发布。
												<br>
												第10条 注册用户如需拒绝接受来自帮您养车网的联络和信息发布，可致电帮您养车网热线
												<span style="font-family:SimSun; font-size: 12px; font-weight:bolder; color: #D12A3E;">400-665-8027</span>
												以取消接受联络和信息发布的资格。
												<br>
												第11条 本注册用户有义务遵守国家法律法规及本网站各项规章制度。
												<br>
												第12条 本注册用户有义务遵守网络礼仪。
											</p>
											<p>
												<span style="font-weight:bolder;">第四章 版权声明</span>
												<br>
												第13条 本注册用户发表的文章仅代表作者本人观点，与帮您养车网立场无关。作者文责自负。
												<br>
												第14条 帮您养车网有权将在本网站发表的文章或图片自行使用或者与其他人合作使用于其他用途，包括但不限于网站、电子杂志、杂志、刊物等，使用时需为作者署名，以发表文章时注明的署名为准。文章有附带版权声明者除外。
												<br>
												第15条 本网站的文章及图片（包括转贴的文章及图片）版权仅归原作者所有，若作者有版权声明或原作从其它网站转载而附带有原版权声明者，其版权归属以附带声明为准。如果转载用户在转载或引用原作者文字、图片或其他作品时，侵犯原作者的版权，帮您养车网不承担任何责任。
												<br>
												第16条 任何转载、引用发表于本网站的版权文章须符合以下规范：
												<br>
												（1）用于非商业、非盈利、非广告性目的时需注明作者及文章及图片的出处为"帮您养车网"或“www.80ycw.com”。
												<br>
												（2）用于商业、盈利、广告性目的时需征得文章或图片原作者的同意，并注明作者姓名、授权范围及原作出处"帮您养车网"或“www.80ycw.com”。
											</p>
											<p>
												<span style="font-weight:bolder;">第五章 处罚原则</span>
												<br>
												第17条 本注册用户不得在本网站进行任何违反国家法律法规及社区各项规章制度的活动，不得在本网站进行任何破坏公共安全的活动，不得在本网站进行任何非法商业活动，不得在本网站进行任何破坏公共秩序的活动，如有违反，网站管理人员将依据有关规定进行处罚。
												<br>
												第18条 本注册用户不得利用网站BUG进行任何活动，如有违反，网站有权作出关闭其部分权限、暂停帐号使用直至删除帐号处理，同时网站保留追究责任人法律及经济责任的权利。
											</p>
											<p>
												<span style="font-weight:bolder;">第六章 责任声明</span>
												<br>
												第19条 本注册用户之间通过网站相识、交往中所发生或可能发生的任何心理、生理上的伤害和经济上的纠纷与损失，帮您养车网v不承担任何责任。用户可以及时与本网站的管理人员联系。
												<br>
												第20条 本注册用户因为违反本网站规定而触犯中华人民共和国法律的，责任自负，帮您养车网不承担任何责任。
												<br>
												第21条 本网站如因系统维护或升级而需暂停服务时，将事先公告。若因硬件故障或其它不可抗力而导致暂停服务，于暂停服务期间造成的一切不便与损失，帮您养车网不承担任何责任。
											</p>
										</div>
									</td>
								</tr>
							</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
		
		<jsp:include page="footSection.jsp" flush="true" />
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.daohang_wenzis').attr("style","color:#6c6c6c");
	$('.lunbo').hide();
});

</script>
</html>