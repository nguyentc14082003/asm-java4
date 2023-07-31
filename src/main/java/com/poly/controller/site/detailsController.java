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

@WebServlet("/products/*")
public class detailsController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductDAO pdDAO;
	private FlashSaleDAO lsDAO;
	PromotionalDetailsDAO pmtDAO;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getPathInfo();
		int idPD = Integer.parseInt(path.substring(path.lastIndexOf("/") + 1));

		pdDAO = new ProductDAO();
		Product pd = pdDAO.getProductById(idPD);
		List<Product> pdRelated = pdDAO.getProductsByCategoryId(pd.getCategory().getCategory_id());

		lsDAO = new FlashSaleDAO();
		pmtDAO = new PromotionalDetailsDAO();
		req.setAttribute("listProduct", pdRelated);
		req.setAttribute("listPdFlashsale", pmtDAO.getAll());
		FlashSale endDay = lsDAO.getActiveFlashSale();
		if (endDay != null) {
			Date endDay1 = lsDAO.getActiveFlashSale().getEnd_day();
			Date now = new Date();
			Boolean checkDayTime = endDay1.before(now) || endDay1.equals(now);
			req.setAttribute("checkDayTime", checkDayTime);
		} else {
			req.setAttribute("checkDayTime", true);
			System.out.println(true);
		}

		if (pd.getPromotionalDetailsList().isEmpty()) {
			req.setAttribute("isFlashSale", true);
			System.out.println(pd.getOriginal_price());
		} else {
			req.setAttribute("isFlashSale", false);
		}
		req.setAttribute("pd", pd);

		req.getRequestDispatcher("/views/detailProduct.jsp").forward(req, resp);
	}
}
