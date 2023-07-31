package com.poly.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/admin-page/Invoice/list-invoice", "/admin-page/Invoice/details-invoice/*"})
public class InvoiceController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("list-invoice")) {
			req.setAttribute("view", "/components/listInvoice.jsp");
		} else if (uri.contains("details-invoice")) {
			req.setAttribute("view", "/components/detailsInvoice.jsp");
		}
		req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
	}
}
