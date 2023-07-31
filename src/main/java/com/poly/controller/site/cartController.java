package com.poly.controller.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.poly.dao.CartDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.PromotionalDetailsDAO;
import com.poly.dao.UserCustomDAO;
import com.poly.models.Cart;
import com.poly.models.Product;
import com.poly.models.PromotionalDetails;
import com.poly.utils.SessionUtils;

@WebServlet({ "/cart", "/add-to-cart", "/get-cart-info", "/delete-product-cart", "/update-product-cart" })
public class cartController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CartDAO caDAO;
	private ProductDAO pdDAO;
	private UserCustomDAO usDAO;
	private PromotionalDetailsDAO pmtDAO;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String method = req.getMethod();
		int userID = SessionUtils.getLoggedInUser(req).getUser_id();
		if (uri.contains("get-cart-info") && method.equalsIgnoreCase("get")) {
			caDAO = new CartDAO();
			usDAO = new UserCustomDAO();
			pdDAO = new ProductDAO();
			pmtDAO = new PromotionalDetailsDAO();
			int cartCount = caDAO.getAllCartsByUserId(userID).size();
			int productID = Integer.parseInt(req.getParameter("product_id"));
			Double totalPrice = caDAO.totalPriceCartByUserId(SessionUtils.getLoggedInUser(req).getUser_id());
			Product pd = pdDAO.findById(productID);
			int cartID = caDAO.getCartByUseridAndProductId(userID, productID).getCart_id();
			System.out.println(cartID);
			double price = 0;

			List<PromotionalDetails> pds = pmtDAO.getAll();
			boolean check = false;
			for (PromotionalDetails p : pds) {
				if (p.getProduct().getProduct_id() == productID) {
					price = p.getDiscounted_price();
					check = true;
				}
			}
			if (!check) {
				price = pdDAO.findById(productID).getOriginal_price();
			}

			String jsonResponse = "{\"cartCount\":" + cartCount + ", \"cartId\":" + cartID + ", \"productName\":\""
					+ pd.getProduct_name() + "\", \"originalPrice\":" + pd.getOriginal_price()
					+ ", \"discountedPrice\":" + price + ", \"productId\":" + productID + ", \"quantity\":" + 1
					+ ", \"image\":\"" + pd.getImage() + "\", \"totalPrice\":" + totalPrice + ", \"quantityInStock\":"
					+ pd.getQuantity_in_stock() + "}";

			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(jsonResponse);
			return;
		}

		if (uri.contains("delete-product-cart") && method.equalsIgnoreCase("post")) {
			int cartId = Integer.parseInt(req.getParameter("cart_id"));
			caDAO = new CartDAO();
			try {
				caDAO.delete(cartId);
				List<Cart> listC = caDAO.getAllCartsByUserId(userID);
				SessionUtils.setCart(req, listC);

				int cartCount = listC.size();
				Double totalPrice = caDAO.totalPriceCartByUserId(SessionUtils.getLoggedInUser(req).getUser_id());

				String jsonResponse = "{\"cartCount\":" + cartCount + ", \"totalPrice\":" + totalPrice + "}";
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().write(jsonResponse);
			} catch (Exception e) {
				// TODO: handle exception
				resp.getWriter().write("fail");
			}

			return;
		}

		if (uri.contains("update-product-cart") && method.equalsIgnoreCase("post")) {
			int cartId = Integer.parseInt(req.getParameter("cart_id"));
			int productId = Integer.parseInt(req.getParameter("product_id"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			
			caDAO = new CartDAO();
			pdDAO = new ProductDAO();
			System.out.println(cartId + " : " + productId);
			System.out.println(quantity);
			try {
				Cart cart = caDAO.findById(cartId);
				cart.setQuantity(quantity);
				caDAO.update(cart);
				resp.getWriter().write("success");
			} catch (Exception e) {
				// TODO: handle exception
				resp.getWriter().write("fail");
			}
			
			return;
		}

		if (uri.contains("add-to-cart") && method.equalsIgnoreCase("post")) {
			int productID = Integer.parseInt(req.getParameter("product_id"));
			double price = 0;
			caDAO = new CartDAO();
			usDAO = new UserCustomDAO();
			pdDAO = new ProductDAO();
			pmtDAO = new PromotionalDetailsDAO();
			List<PromotionalDetails> pds = pmtDAO.getAll();
			boolean check = false;
			for (PromotionalDetails p : pds) {
				if (p.getProduct().getProduct_id() == productID) {
					price = p.getDiscounted_price();
					check = true;
				}
			}
			if (!check) {
				price = pdDAO.findById(productID).getOriginal_price();
			}
			List<Cart> pdInCart = caDAO.getAllCartsByUserId(userID);
			boolean checkPD = false;
			for (Cart cart : pdInCart) {
				if (cart.getProduct().getProduct_id() == productID) {
					checkPD = true;
					break;
				}
			}
			if (checkPD) {
				resp.getWriter().write("fail");
			} else {
				try {
					Cart cart = new Cart();
					cart.setUser(usDAO.findById(userID));
					cart.setProduct(pdDAO.findById(productID));
					cart.setQuantity(1);
					cart.setPrice(price);
					caDAO.create(cart);
					List<Cart> listC = caDAO.getAllCartsByUserId(userID);
					SessionUtils.setCart(req, listC);
					resp.getWriter().write("success");
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
			}
		} else {
			System.out.println("get cart.jsp");
			caDAO = new CartDAO();
			Double totalPrice = caDAO.totalPriceCartByUserId(SessionUtils.getLoggedInUser(req).getUser_id());
			req.setAttribute("totalPrice", totalPrice);
			req.getRequestDispatcher("/views/cart.jsp").forward(req, resp);
		}

	}
}
