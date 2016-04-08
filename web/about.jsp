<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String ctx = request.getContextPath();
 %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>汽车服务网--关于我们</title>
<link href="<%=ctx%>/css/css.css" rel="stylesheet" type="text/css"/>


<script src="<%=ctx%>/js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.tabso_yeso.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/common.js"></script>



</head>

</style>
<body>
	<div id = "all">
		<div id= "rhead">
			<img alt="导航" src="<%=ctx%>/img/Rhead.jpg" width="100%">
			<img alt="帮车服务" src="<%=ctx%>/img/Rbcfw.jpg" width="100%" usemap="#bcfw">
			<img alt="帮车优势" src="<%=ctx%>/img/Rbcys.jpg" width="100%">
			<img alt="特色服务" src="<%=ctx%>/img/Rtsfw.jpg" width="100%">
			
			<map name="bcfw">
				<area shape="circle" coords="400,280,69" href="<%=ctx %>/upholster.jsp" />
			 	<area shape="circle" coords="355,450,70" href="<%=ctx %>/conserve.jsp" />
			 	<area shape="circle" coords="1100,280,71" href="<%=ctx %>/install.jsp" />
 			 	<area shape="circle" coords="1140,450,75" href="<%=ctx %>/check.jsp" />
			</map>
			
		</div>
		<jsp:include page="footSection.jsp"></jsp:include>
	</div>
</body>
</html>