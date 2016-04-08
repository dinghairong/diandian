<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smart4c.alipay.config.*"%>
<%@ page import="com.smart4c.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>帮您养车支付平台</title>
	</head>
	<%
		DecimalFormat df=new DecimalFormat("######0.00");
		String ctx = (String)request.getContextPath();
		String title = "";
		double total = 0;
		//String back_url = "";

		String isprepaid = (String)request.getParameter("isPrepaid");

		////////////////////////////////////请求参数//////////////////////////////////////
		//CommodityDao commodityDao = (CommodityDao)SpringUtils.getBean(CommodityDao.class);
		if(null != isprepaid && isprepaid.equals("true")){
			total = Double.parseDouble((String)request.getParameter("paidmoney"));
			session.setAttribute("paidmoney",total);
			title = "充  值";
			//back_url = (String)request.getParameter("WIDshow_url");
		}else{
			OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
			String one_spid = (String)request.getParameter("WIDsp_id");
			if(null != one_spid && one_spid.length() > 0){
				User user = (User)session.getAttribute("user");
				Company company = (Company)session.getAttribute("company");
				Order noworder = null;
				if(null != user){
					noworder = orderDao.findOrderBySerialnumberAndProductAndUser(request.getParameter("WIDout_trade_no"),Integer.parseInt(one_spid),user.getId());
				}
				if(null != company){
					noworder = orderDao.findOrderBySerialnumberAndProductAndCompany(request.getParameter("WIDout_trade_no"),Integer.parseInt(one_spid),company.getId());
				}
				total = noworder.getPaid();
				title = noworder.getServiceProduct().getTitle() + "    " + noworder.getNumber() + "次服务";
				session.setAttribute("is_one_paid",one_spid);
				//back_url = (String)request.getParameter("WIDshow_url");
			}else{
				List<Order> noworder = orderDao.findOrderBySerialnumber(request.getParameter("WIDout_trade_no"));
				
				for(int i = 0;i < noworder.size();i ++){
					total = total+ noworder.get(i).getPaid();
					if(i == 0){
						title =title + noworder.get(i).getServiceProduct().getTitle() + "    " + noworder.get(i).getNumber() + "次服务";
					}else{
						title =title + "," + noworder.get(i).getServiceProduct().getTitle() + "    "  + noworder.get(i).getNumber() + "次服务";
					}
				}
				//back_url = (String)request.getParameter("WIDshow_url");
			}
		}
		
		//String get_title = paid_commodity.getTitle() + "[" + paid_commodity.getCategory() + "]" + paid_commodity.getFormat().getName() + " " + paid_commodity.getLoadnum() + str2;

		//支付类型
		String payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		String notify_url = "http://www.80ycw.com" + ctx + "/notify_url.jsp";
		//需http://格式的完整路径，不能加?id=123这类自定义参数
		
		//页面跳转同步通知页面路径
		String return_url = "http://www.80ycw.com" + ctx + "/return_url.jsp";
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
		
		//商户订单号
		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//商户网站订单系统中唯一订单号，必填
		
		//订单名称
		//String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
		String subject = title;
		//必填
		
		//付款金额
		// String total_fee = new String(request.getParameter("WIDtotal_fee").getBytes("ISO-8859-1"),"UTF-8");
		String total_fee = df.format(total);
		//必填
		
		//订单描述
		
		// String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
		String body = title;
		//商品展示地址
		String show_url = new String(request.getParameter("WIDshow_url").getBytes("ISO-8859-1"),"UTF-8");
		//需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html
		
		//防钓鱼时间戳
		String anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数
		
		//客户端的IP地址
		String exter_invoke_ip = "115.29.229.240";
		//非局域网的外网IP地址，如：221.0.0.1
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_direct_pay_by_user");
		sParaTemp.put("partner", AlipayConfig.partner);
		sParaTemp.put("seller_email", AlipayConfig.seller_email);
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", payment_type);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("total_fee", total_fee);
		sParaTemp.put("body", body);
		sParaTemp.put("show_url", show_url);
		sParaTemp.put("anti_phishing_key", anti_phishing_key);
		sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>