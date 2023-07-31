package com.poly.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/admin-page/product/list-product", "/admin-page/product/form-product",
		"/admin-page/product/create-product", "/admin-page/product/edit-product/*",
		"/admin-page/product/delete-product", "/admin-page/product/update-product" })
public class productController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("list-product")) {
			req.setAttribute("view", "/components/listProduct.jsp");
		} else if (uri.contains("form-product")) {
			req.setAttribute("breadcrump", "Thêm");
			req.setAttribute("view", "/components/formProduct.jsp");
		} else if (uri.contains("form-product")) {
			req.setAttribute("breadcrump", "Thêm");
			req.setAttribute("view", "/components/formProduct.jsp");
		} else if (uri.contains("create-product")) {
			req.setAttribute("breadcrump", "Thêm");
			req.setAttribute("view", "/components/formProduct.jsp");
		} else if (uri.contains("edit-product")) {
			req.setAttribute("breadcrump", "Cập nhật");
			req.setAttribute("view", "/components/formProduct.jsp");
		} else if (uri.contains("update-product")) {
			req.setAttribute("breadcrump", "Cập nhật");
			req.setAttribute("view", "/components/formProduct.jsp");
		} else if (uri.contains("delete-product")) {
			req.setAttribute("breadcrump", "Cập nhật");
			req.setAttribute("view", "/components/formProduct.jsp");

		}
		req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
	}
}
