<%@page import="java.util.HashMap" errorPage="errorpage.jsp"%>
<%
	if (session != null) {
		Object user = session.getAttribute("user");

		if (user != null) {
			session.invalidate();
			request.getSession();
			response.sendRedirect("index.jsp");
			return;
		}else{
			Object company = session.getAttribute("company");
			if(company != null){
				session.invalidate();
				request.getSession();
				response.sendRedirect("index.jsp");
				return;
			}else{
				Object shopuser = session.getAttribute("shopuser");
				if(shopuser != null){
					session.invalidate();
					request.getSession();
					response.sendRedirect("index.jsp");
					return;
				}else{
					response.sendRedirect("index.jsp");
					return;
				}
			}
		}
	}else{
		response.sendRedirect("index.jsp");
		return;
	}
	
%>