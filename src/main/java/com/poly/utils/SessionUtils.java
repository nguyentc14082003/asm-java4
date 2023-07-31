package com.poly.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.poly.dao.CartDAO;
import com.poly.models.Cart;
import com.poly.models.UserCustom;

public class SessionUtils {

	private static final String USER_SESSION_ATTRIBUTE = "user";

	public static void setLoggedInUser(HttpServletRequest request, UserCustom user) {
		HttpSession session = request.getSession();
		session.setAttribute(USER_SESSION_ATTRIBUTE, user);
	}

	public static UserCustom getLoggedInUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (UserCustom) session.getAttribute(USER_SESSION_ATTRIBUTE);
	}

	public static void clearLoggedInUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(USER_SESSION_ATTRIBUTE);
		session.removeAttribute("carts");
		session.removeAttribute("totalPriceInCart");
	}

	public static boolean isLoggedIn(HttpServletRequest request) {
		return getLoggedInUser(request) != null;
	}

	public static void setCart(HttpServletRequest request, List<Cart> cart) {
		HttpSession session = request.getSession();
		session.setAttribute("carts", cart);
		CartDAO cartDAO = new CartDAO();
		Double totalPrice = cartDAO.totalPriceCartByUserId(getLoggedInUser(request).getUser_id());
		session.setAttribute("totalPriceInCart", totalPrice);
		session.setAttribute("sizeInCart", getCart(request).size());
	}

	@SuppressWarnings("unchecked")
	public static List<Cart> getCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (List<Cart>) session.getAttribute("carts");
	}

}
