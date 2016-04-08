<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, java.text.*, java.lang.*"%>
<%@ page import="com.smart4c.dao.*"%>
<%@ page import="com.smart4c.bean.*"%>
<%@ page import="com.smart4c.util.SpringUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String ctx = (String)request.getContextPath();
	NewsInfo info = (NewsInfo)request.getAttribute("info_detail");
	DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	info.setIsread(1);
	NewsInfoDao newInfoDao = (NewsInfoDao)SpringUtils.getBean(NewsInfoDao.class);
	newInfoDao.saveNewsInfo(info);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=ctx%>/css/grid.min.css">
<link rel="stylesheet" href="<%=ctx%>/css/global.min.css">
<link rel="stylesheet" href="<%=ctx%>/css/index.min.css">
<link rel="stylesheet" href="<%=ctx%>/css/hongxicss.min.css">
 <link href="images/favicon.ico" rel="shortcut icon"/>
<script src="<%=ctx%>/js/jquery.min.js"></script>
<title><%=info.getTitle()%></title>
<style type="text/css">
</style>
</head>
<body>
	<div style="width: 100%">
		<div style="width: 80%; margin: 0 auto">
			<div style="text-align: center;color:red; font-size: larger;font-weight: bold"> 
				<%=info.getTitle()%>
			</div>
			<br>
			<hr style="border:gray dashed 1px">
			<br>
			<div>
				<table style="text-align: center;font-size: small;margin: 0 auto;">
					<tbody>
						<tr>
							<td>
								发布日期：
								<label style="color:red"><%=df.format(info.getUpdatetime())%></label>
							</td>
							<td> 来源：帮您养车网 </td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div>
				<%=info.getContent()%>
			</div>
			<br>
			<hr style="border:gray dashed 1px">
		</div>
	</div>
	
</body>
<script type="text/javascript">
</script>
</html>