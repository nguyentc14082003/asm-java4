package com.poly.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.utils.CookieUtils;
import com.poly.utils.SessionUtils;

@WebFilter("/*")
public class authFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		// đọc giá trị của cookie
		String username = CookieUtils.get("CKusername", req);
		String password = CookieUtils.get("CKpassword", req);
		req.setAttribute("lGusername", username);
		req.setAttribute("lGpassword", password);

		boolean isLoggedIn = SessionUtils.isLoggedIn(req);

		String uri = req.getRequestURI();

		if (uri.contains("edit-profile") && !isLoggedIn) {
			resp.sendRedirect("/nguyentcpc04750_ASM/account/sign-in");
			return;
		} else if (uri.contains("change-password") && !isLoggedIn) {
			resp.sendRedirect("/nguyentcpc04750_ASM/account/sign-in");
			return;
		} else if ((uri.contains("sign-up") || uri.contains("sign-in")) && isLoggedIn) {
			resp.sendRedirect("/nguyentcpc04750_ASM/home-page");
			return;
		} else if (uri.contains("cart") && !isLoggedIn) {
			resp.sendRedirect("/nguyentcpc04750_ASM/account/sign-in");
			return;
		} else if (uri.contains("admin") && !isLoggedIn) {
			resp.sendRedirect("/nguyentcpc04750_ASM/account/sign-in");
			return;
		} else if (uri.contains("admin") && isLoggedIn && !SessionUtils.getLoggedInUser(req).isAdmin()) {
			resp.sendRedirect("/nguyentcpc04750_ASM/account/sign-in");
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void destroy() {
	}

}
