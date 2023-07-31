package com.poly.controller.site;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.FlashSaleDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.PromotionalDetailsDAO;
import com.poly.models.FlashSale;
import com.poly.models.Product;

@WebServlet({ "/collections/all", "/collections/flashsale", "/collections/rubik-co-ban-2x2",
		"/collections/rubik-co-ban-3x3", "/collections/rubik-co-ban-4x4", "/collections/rubik-co-ban-5x5",
		"/collections/gan", "/collections/qiyi", "/collections/moyu", "/collections/yongjun", "/collections/dayan" })
public class collectionsController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		PromotionalDetailsDAO pmtDAO = new PromotionalDetailsDAO();
		ProductDAO pdDAO = new ProductDAO();
		FlashSaleDAO lsDAO = new FlashSaleDAO();
		req.setAttribute("flashsale", lsDAO.getActiveFlashSale());
		req.setAttribute("listPdFlashsale", pmtDAO.getAll());

		FlashSale endDay = lsDAO.getActiveFlashSale();
		if (endDay != null) {
			Date endDay1 = lsDAO.getActiveFlashSale().getEnd_day();
			Date now = new Date();
			Boolean checkDayTime = endDay1.before(now) || endDay1.equals(now);
			req.setAttribute("checkDayTime", checkDayTime);
		} else {
			req.setAttribute("checkDayTime", true);
		}
		req.setAttribute("listPdFlashsale", pmtDAO.getAll());
		req.setAttribute("listProduct", pdDAO.getAllProductNames());
		if (uri.contains("all")) {

			req.setAttribute("title", "Tất cả sản phẩm");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("flashsale")) {
			req.setAttribute("title", "Khuyến mãi");
			req.getRequestDispatcher("/views/listFlashSale.jsp").forward(req, resp);
		} else if (uri.contains("rubik-co-ban-2x2")) {
			req.setAttribute("listProduct", pdDAO.getProductsByCategoryId(200003));
			req.setAttribute("title", "Rubik cơ bản 2x2");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("rubik-co-ban-3x3")) {
			req.setAttribute("listProduct", pdDAO.getProductsByCategoryId(200000));
			req.setAttribute("title", "Rubik cơ bản 3x3");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("rubik-co-ban-4x4")) {
			req.setAttribute("listProduct", pdDAO.getProductsByCategoryId(200001));
			req.setAttribute("title", "Rubik cơ bản 4x4");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("rubik-co-ban-5x5")) {
			req.setAttribute("listProduct", pdDAO.getProductsByCategoryId(200002));
			req.setAttribute("title", "Rubik cơ bản 5x5");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("gan")) {
			req.setAttribute("listProduct", pdDAO.getProductsByManufacturerId(400000));
			req.setAttribute("title", "Gan");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("qiyi")) {
			req.setAttribute("listProduct", pdDAO.getProductsByManufacturerId(400002));
			req.setAttribute("title", "Qiyi");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("dayan")) {
			req.setAttribute("listProduct", pdDAO.getProductsByManufacturerId(400003));
			req.setAttribute("title", "Dayan");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("moyu")) {
			req.setAttribute("listProduct", pdDAO.getProductsByManufacturerId(400001));
			req.setAttribute("title", "Moyu");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		} else if (uri.contains("yongjun")) {
			req.setAttribute("listProduct", pdDAO.getProductsByManufacturerId(400004));
			req.setAttribute("title", "Yongjun");
			req.getRequestDispatcher("/views/allProduct.jsp").forward(req, resp);
		}
	}
}
