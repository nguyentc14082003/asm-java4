package com.poly.controller.site;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.dao.CartDAO;
import com.poly.dao.FlashSaleDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.PromotionalDetailsDAO;
import com.poly.models.Cart;
import com.poly.models.FlashSale;
import com.poly.utils.CookieUtils;
import com.poly.utils.SessionUtils;

@WebServlet({ "/home-page", "/admin-page/dashboard" })
public class indexController extends HttpServlet {

	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private FlashSaleDAO lsDAO;
	private ProductDAO pdDAO;
	private PromotionalDetailsDAO pmtDAO;
	private CartDAO cartDAO;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		pmtDAO = new PromotionalDetailsDAO();
		pdDAO = new ProductDAO();
		lsDAO = new FlashSaleDAO();
		req.setAttribute("now", new Date());
		req.setAttribute("flashsale", lsDAO.getActiveFlashSale());
		req.setAttribute("listPdFlashsale", pmtDAO.getAll());
		req.setAttribute("listProduct", pdDAO.getAllProductNames());
		FlashSale endDay = lsDAO.getActiveFlashSale();
		if (endDay != null) {
			Date endDay1 = lsDAO.getActiveFlashSale().getEnd_day();
			Date now = new Date();
			Boolean checkDayTime = endDay1.before(now) || endDay1.equals(now);
			req.setAttribute("checkDayTime", checkDayTime);
		} else {
			req.setAttribute("checkDayTime", true);
		}

		if (SessionUtils.getLoggedInUser(req) != null) {
			System.out.println(SessionUtils.getLoggedInUser(req).getFullname());
			cartDAO = new CartDAO();
			List<Cart> listC = cartDAO.getAllCartsByUserId(SessionUtils.getLoggedInUser(req).getUser_id());
			SessionUtils.setCart(req, listC);
			for (Cart cart : listC) {
				System.out.println(cart.getProduct().getProduct_name());
			}
		} else {
			System.out.println("null");
		}

		if (uri.contains("home-page")) {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		} else if (uri.contains("dashboard")) {
			req.setAttribute("view", "/components/dashboard.jsp");
			req.getRequestDispatcher("/views/admin/admin.jsp").forward(req, resp);
		}
	}
}
