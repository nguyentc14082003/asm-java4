package com.poly.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/admin-page/statistical/total-sold", "/admin-page/statistical/total-revenue",
		"/admin-page/statistical/total-like", "/admin-page/statistical/total-Invoice" })
public class statisticalController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("total-sold")) {
			req.setAttribute("view2", "/components/totalSold.jsp");
			req.setAttribute("view", "/components/formStatistical.jsp");
		} else if (uri.contains("total-revenue")) {
			req.setAttribute("view2", "/components/totalRevenue.jsp");
			req.setAttribute("view", "/components/formStatistical.jsp");
		} else if (uri.contains("total-like")) {
			req.setAttribute("view2", "/components/totalLike.jsp");
			req.setAttribute("view", "/components/formStatistical.jsp");
		} else if (uri.contains("total-Invoice")) {
			req.setAttribute("view2", "/components/totalInvoice.jsp");
			req.setAttribute("view", "/components/formStatistical.jsp");
		}
		req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
	}
}
