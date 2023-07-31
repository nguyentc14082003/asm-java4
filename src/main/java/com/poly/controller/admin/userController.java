package com.poly.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/admin-page/userManagement", "/admin-page/userManagement/create-user",
		"/admin-page/userManagement/edit-user/*", "/admin-page/userManagement/update-user",
		"/admin-page/userManagement/delete-user" })
public class userController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("userManagement")) {
			req.setAttribute("view", "/components/userManagenment.jsp");
		} else if (uri.contains("create-user")) {
			req.setAttribute("view", "/components/userManagenment.jsp");
		} else if (uri.contains("edit-user")) {
			req.setAttribute("view", "/components/userManagenment.jsp");
		} else if (uri.contains("update-user")) {
			req.setAttribute("view", "/components/userManagenment.jsp");
		} else if (uri.contains("delete-user")) {
			req.setAttribute("view", "/components/userManagenment.jsp");

		}
		req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
	}
}
