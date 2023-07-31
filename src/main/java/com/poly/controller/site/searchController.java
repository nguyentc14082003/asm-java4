package com.poly.controller.site;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.FlashSaleDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.PromotionalDetailsDAO;
import com.poly.models.FlashSale;

@WebServlet("/search")
public class searchController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FlashSaleDAO lsDAO;
	private ProductDAO pdDAO;
	private PromotionalDetailsDAO pmtDAO;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		pmtDAO = new PromotionalDetailsDAO();
		pdDAO = new ProductDAO();
		lsDAO = new FlashSaleDAO();
		String search = req.getParameter("search");
		req.setAttribute("search", search);
		req.setAttribute("now", new Date());
		req.setAttribute("flashsale", lsDAO.getActiveFlashSale());
		req.setAttribute("listPdFlashsale", pmtDAO.getAll());
		req.setAttribute("listProduct", pdDAO.findByNameWithChar(search));
		req.setAttribute("sizeListPd", pdDAO.findByNameWithChar(search).size());
		FlashSale endDay = lsDAO.getActiveFlashSale();
		if (endDay != null) {
			Date endDay1 = lsDAO.getActiveFlashSale().getEnd_day();
			Date now = new Date();
			Boolean checkDayTime = endDay1.before(now) || endDay1.equals(now);
			req.setAttribute("checkDayTime", checkDayTime);
		} else {
			req.setAttribute("checkDayTime", true);
		}
		req.getRequestDispatcher("/views/search.jsp").forward(req, resp);

	}
}
