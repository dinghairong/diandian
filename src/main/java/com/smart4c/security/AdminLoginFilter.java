package com.smart4c.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.smart4c.util.MiscUtils;

public class AdminLoginFilter implements Filter {
	private static final Logger logger = MiscUtils.getLogger();
	private static final String[] EXEMPT_URLS = {
		"/admin/login"
	};
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		logger.info("Starting Admin Filter : "+getClass().getSimpleName());
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		logger.debug("Entering AdminLoginFilter.doFilter()");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		if ((httpRequest.getSession().getAttribute("adminUser") == null)) {
			String requestURI = httpRequest.getRequestURI();
			String contextPath = httpRequest.getContextPath();
			/*
			 * If the requested resource is npt exempt then redirect to the logout page.
			 * 
			 * bug fix: removed root directory auto-exemption. If you want to have a resource
			 * be an exemption, you must explicitely add to EXEMPT_URLS array.
			 */
			if (!inListOfExemptions(requestURI, contextPath)) {
				httpResponse.sendRedirect(contextPath + "/admin/login.jsp");
				return;
			}
		}
		chain.doFilter(request, response);
	}

	boolean inListOfExemptions(String requestURI, String contextPath) {
		for (String exemptUrl : EXEMPT_URLS) {
	        if (requestURI.startsWith(contextPath + exemptUrl)) {
	        	return true;
	        }
      }
		return false;
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
