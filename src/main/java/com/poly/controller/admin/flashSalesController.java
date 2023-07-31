package com.poly.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/admin-page/flash-sale", "/admin-page/flash-sale/create-flashsale",
		"/admin-page/flash-sale/edit-flashsale/*", "/admin-page/flash-sale/update-flashsale",
		"/admin-page/flash-sale/delete-flashsale", "/admin-page/flash-sale/details-flashsale" })
public class flashSalesController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("details-flashsale")) {
			req.setAttribute("view", "/components/formDetailsFlashSale.jsp");
		} else if (uri.contains("flash-sale")) {
			req.setAttribute("view", "/components/formFlashSale.jsp");
		} else if (uri.contains("create-flashsale")) {
			req.setAttribute("view", "/components/formFlashSale.jsp");
		} else if (uri.contains("edit-flashsale")) {
			req.setAttribute("view", "/components/formFlashSale.jsp");
		} else if (uri.contains("update-flashsale")) {
			req.setAttribute("view", "/components/formFlashSale.jsp");
		} else if (uri.contains("delete-flashsale")) {
			req.setAttribute("view", "/components/formFlashSale.jsp");
		}
		req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
	}
}
