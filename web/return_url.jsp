<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.smart4c.alipay.util.*"%>
<%@ page import="com.smart4c.alipay.config.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.alipay.util.UtilDate"%>
<%@ page import="com.smart4c.action.hongxi.HelpAction"%>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝页面跳转同步通知页面</title>
  </head>
  <body>
<%
//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map requestParams = request.getParameterMap();
	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
		//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
	//商户订单号

	String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

	//支付宝交易号

	String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

	//交易状态
	String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
	
	//计算得出通知验证结果
	boolean verify_result = AlipayNotify.verify(params);
	
	if(verify_result){//验证成功
		//////////////////////////////////////////////////////////////////////////////////////////
		//请在这里加上商户的业务逻辑程序代码
		PrepaidDao prepaidDao = (PrepaidDao)SpringUtils.getBean(PrepaidDao.class);
		UsersDao userDao = (UsersDao)SpringUtils.getBean(UsersDao.class);
		CompanyDao companyDao = (CompanyDao)SpringUtils.getBean(CompanyDao.class);
		OrderDao orderDao = (OrderDao)SpringUtils.getBean(OrderDao.class);
		MyCartDao myCartDao = (MyCartDao)SpringUtils.getBean(MyCartDao.class);
		CouponDao couponDao = (CouponDao)SpringUtils.getBean(CouponDao.class);
		UserCouponDao userCouponDao = (UserCouponDao)SpringUtils.getBean(UserCouponDao.class);

		Company company = (Company)session.getAttribute("company");
		User user = (User)session.getAttribute("user");
		String is_one = (String)session.getAttribute("is_one_paid");
		if(null != is_one && is_one.length() > 0){
			Order paidorder = null;
			if(null != user){
				paidorder = orderDao.findOrderBySerialnumberAndProductAndUser(out_trade_no,Integer.parseInt(is_one),user.getId());

				myCartDao.deleteMyCartByUser(user.getId(),paidorder.getServiceProduct().getId());
			}
			if(null != company){
				paidorder = orderDao.findOrderBySerialnumberAndProductAndCompany(out_trade_no,Integer.parseInt(is_one),company.getId());
				
				myCartDao.deleteMyCartByUser(company.getId(),paidorder.getServiceProduct().getId());
			}
			if(paidorder.getState() == 0){
				paidorder.setState(1);
				orderDao.saveOrder(paidorder);
			}
			if(null != paidorder.getUser()){
				session.setAttribute("user",paidorder.getUser());
				HelpAction.sendPaidOrderSms(paidorder.getUser().getPhone(),out_trade_no + "部分");
			}else{
				session.setAttribute("company",paidorder.getCompany());
				HelpAction.sendPaidOrderSms(paidorder.getCompany().getPhone(),out_trade_no + "部分");
			}

		}else{
			List<Order> paidorder = orderDao.findOrderBySerialnumber(out_trade_no);
			if(null != paidorder && paidorder.size() > 0){
				for(int i = 0;i < paidorder.size();i ++){
					if(paidorder.get(i).getState() == 0){
						paidorder.get(i).setState(1);
						orderDao.saveOrder(paidorder.get(i));

						if(null != paidorder.get(i).getUser()){
							myCartDao.deleteMyCartByUser(paidorder.get(i).getUser().getId(),paidorder.get(i).getServiceProduct().getId());
						}else{
							myCartDao.deleteMyCartByUser(paidorder.get(i).getCompany().getId(),paidorder.get(i).getServiceProduct().getId());
						}
					}
				}
				if(null != paidorder.get(0).getUser()){
					session.setAttribute("user",paidorder.get(0).getUser());
					HelpAction.sendPaidOrderSms(paidorder.get(0).getUser().getPhone(),out_trade_no);
				}else{
					session.setAttribute("company",paidorder.get(0).getCompany());
					HelpAction.sendPaidOrderSms(paidorder.get(0).getCompany().getPhone(),out_trade_no);
				}
			}else{
				Prepaid paid = new Prepaid();
				Double money = (Double)session.getAttribute("paidmoney");
				paid.setCompany(company);
				paid.setSerialnumber(out_trade_no);
				paid.setMoney(String.valueOf(money));
				paid.setState(0);
				paid.setCreatedTime(new Date());
				prepaidDao.saveNewPrepaid(paid);

				String balance = "0";
				if(null != company.getBalance() && company.getBalance().length() > 0){
					balance = company.getBalance();
				}
				company.setBalance(String.valueOf(Double.parseDouble(balance) + money));
				companyDao.saveCompany(company);
				session.setAttribute("company",company);
				
				SimpleDateFormat time_formatter = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
				HelpAction.sendPrepaidSms(company.getPhone(),time_formatter.format(new Date()),money.toString());

				Prepaid ispaid = prepaidDao.findPrepaidBySerialnumber(out_trade_no);
				UserCoupon ucp = new UserCoupon();
				List<Coupon> cp_list = couponDao.findCouponByStatus();
				Coupon c = cp_list.get(0);
				for(Coupon cp : cp_list){
					if(cp.getChargeAmount()<money){
						if(c.getMoney()<cp.getMoney()){
							c = cp;
						}
					}
				}
				if(c.getChargeAmount()<money){
					ucp.setCompany(company);
					ucp.setCoupon(c);
					ucp.setCreatedTime(new Date());
					ucp.setStatus(0);
					ucp.setUpdateTime(new Date());
					
					Calendar calender = Calendar.getInstance();
					calender.setTime(c.getCreatedTime());
					calender.add(Calendar.DAY_OF_MONTH, c.getExprieDays());
					ucp.setExprieDate(calender.getTime());
					
					ucp.setPaid(ispaid);
					ucp.setSerialnumber("HX"+UtilDate.getOrderNum());
					userCouponDao.persist(ucp);
				}

			}
		}

		if(null != user){
			out.println("<script src=\"http://www.80ycw.com/js/jquery-1.8.3.min.js\"></script><span color='#e54631'>付费成功</span>，将自动在<span id=\"changetime\">5</span>秒内跳转到用户中心界面<script src=\"http://www.80ycw.com/js/go_to_user.js\"></script><br />如果没有跳转，请点击<a id='gotouser' href='http://www.80ycw.com/profile.jsp'>跳转</a>");
		}
		if(null != company){
			out.println("<script src=\"http://www.80ycw.com/js/jquery-1.8.3.min.js\"></script><span color='#e54631'>付费成功</span>，将自动在<span id=\"changetime\">5</span>秒内跳转到用户中心界面<script src=\"http://www.80ycw.com/js/go_to_user.js\"></script><br />如果没有跳转，请点击<a id='gotouser' href='http://www.80ycw.com/cwelcome.jsp'>跳转</a>");
		}

		//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
		if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
			//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
		}
		
		//该页面可做页面美工编辑
		out.println("验证成功<br />");
		//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

		//////////////////////////////////////////////////////////////////////////////////////////
	}else{
		//该页面可做页面美工编辑
		out.println("验证失败");
	}
%>
  </body>
</html>