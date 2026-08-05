package com.sms.filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthenticationFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request,
	                     ServletResponse response,
	                     FilterChain chain)
	        throws IOException, ServletException {

	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
//cache control
	    res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    res.setHeader("Pragma", "no-cache");
	    res.setDateHeader("Expires", 0);
//cookies control
	    res.setHeader(
	    	    "X-Frame-Options",
	    	    "DENY"
	    	);

	    	res.setHeader(
	    	    "X-Content-Type-Options",
	    	    "nosniff"
	    	);

	    	res.setHeader(
	    	    "Referrer-Policy",
	    	    "strict-origin"
	    	);
	    String uri = req.getRequestURI();
	    HttpSession session = req.getSession(false);

	    boolean publicResource =
	            uri.endsWith("index.jsp") ||
	            uri.endsWith("login.jsp") ||
	            uri.endsWith("login") ||
	            
	            uri.endsWith(".css") ||
	            uri.endsWith(".js") ||
	            uri.endsWith(".png") ||
	            uri.endsWith(".jpg") ||
	            uri.endsWith(".jpeg") ||
	            uri.endsWith(".gif") ||
	            uri.endsWith(".ico");

	    boolean loggedIn =
	            session != null &&
	            session.getAttribute("user") != null;

	    if (publicResource || loggedIn) {
	        chain.doFilter(request, response);
	    } else {
//	        res.sendRedirect(req.getContextPath() + "/index.jsp");
	    	// Check whether the browser sent an expired session id
	        if (req.getRequestedSessionId() != null 
	                && !req.isRequestedSessionIdValid()) {

	            res.sendRedirect(req.getContextPath() + "/index.jsp?expired=true");

	        } else {

	            // First time visitor or user who never logged in
	            res.sendRedirect(req.getContextPath() + "/index.jsp");
	        }
	    	
	    }
	}
}
