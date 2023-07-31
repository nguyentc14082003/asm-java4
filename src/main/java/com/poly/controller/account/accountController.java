package com.poly.controller.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.SSLContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserCustomDAO;
import com.poly.models.Cart;
import com.poly.models.UserCustom;
import com.poly.utils.CookieUtils;
import com.poly.utils.SessionUtils;
import com.poly.utils.SweetAlertUtils;

@WebServlet({ "/account/sign-up", "/account/sign-in", "/account/sign-out", "/account/forgot-password",
		"/account/change-password", "/account/edit-profile" })
public class accountController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserCustomDAO ucDAO;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();

		boolean isLogin = SessionUtils.isLoggedIn(req);

		if (uri.contains("sign-in")) {
			this.doSignIn(req, resp);

		} else if (uri.contains("sign-up")) {
			this.doSignUp(req, resp);

		} else if (uri.contains("sign-out")) {
			this.signOut(req, resp);

		} else if (uri.contains("forgot-password")) {
			this.forgotPass(req, resp);
		} else if (uri.contains("change-password")) {
			this.changePass(req, resp);

		} else if (uri.contains("edit-profile")) {
			this.doEditProfile(req, resp);
		}
	}

	private void changePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/views/changePassword.jsp").forward(req, resp);
	}

	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				String id = req.getParameter("lGusername");
				String pw = req.getParameter("lGpassword");
				String check = req.getParameter("cboRemember");
				ucDAO = new UserCustomDAO();
				UserCustom user = ucDAO.findByUsername(id);
				if (!user.getPassword().equals(pw)) {
					req.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
				} else {
					req.setAttribute("message", "Đăng nhập thành công!");
					SessionUtils.setLoggedInUser(req, user); // Lưu thông tin người dùng đã đăng nhập vào session


					if (check != null) {
						int hours = (check == null) ? 0 : 30 * 24; // 0 = xóa
						CookieUtils.add("CKusername", id, hours, resp);
						CookieUtils.add("CKpassword", pw, hours, resp);
					}
					if (user.isAdmin()) {
						resp.sendRedirect("/nguyentcpc04750_ASM/admin-page/dashboard");
					} else {
						resp.sendRedirect("/nguyentcpc04750_ASM/home-page");
					}
					return;
				}
			} catch (Exception e) {
				System.out.println(e);
				req.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
			}
		}
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				UserCustom user = new UserCustom();
				BeanUtils.populate(user, req.getParameterMap());

				ucDAO = new UserCustomDAO();
				ucDAO.create(user);
				sendMail(req, req.getParameter("email"));
				resp.sendRedirect("/nguyentcpc04750_ASM/account/sign-in");
				return;
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		req.getRequestDispatcher("/views/signUp.jsp").forward(req, resp);
	}

	private void doEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		System.out.println(method);
		if (method.equalsIgnoreCase("POST")) {
			try {
				UserCustom user = new UserCustom();
				user.setPassword(SessionUtils.getLoggedInUser(req).getPassword());
				BeanUtils.populate(user, req.getParameterMap());
				ucDAO = new UserCustomDAO();
				ucDAO.update(user);
				UserCustom userUpdate = ucDAO.findById(Integer.parseInt(req.getParameter("user_id")));
				SessionUtils.setLoggedInUser(req, userUpdate);

				System.out.println("success");
				resp.setContentType("text/plain");
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().write("success");
			} catch (Exception e) {
				resp.setContentType("text/plain");
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().write("error");
				System.out.println("error");
			}
		} else {
			req.getRequestDispatcher("/views/inforUser.jsp").forward(req, resp);
		}
	}

	private void forgotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgotPassword.jsp").forward(req, resp);
	}

	private void signOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SessionUtils.clearLoggedInUser(req);
		HttpSession s = req.getSession();
		s.removeAttribute("carts");
		resp.sendRedirect("/nguyentcpc04750_ASM/home-page");

	}

	private void sendMail(HttpServletRequest req, String email) {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		try {
			SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
			sslContext.init(null, null, new SecureRandom());
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		} catch (KeyManagementException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Session session = Session.getInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				String usernameAdmin = "nguyentcpc04750@fpt.edu.vn";
				String passwordAdmin = "arfzusfvmokiiqmf";

				return new PasswordAuthentication(usernameAdmin, passwordAdmin);
			}
		});

		MimeMessage mess = new MimeMessage(session);
		try {
			String content = "<html>" + "<head>" + "<style>" + "    body { font-family: Arial, sans-serif; }"
					+ "    strong { color: #ff0000; font-size: 24px; }" + "    p { font-size: 16px; }"
					+ "    .link { color: #0000ff; text-decoration: none; }" + "</style>" + "</head>" + "<body>"
					+ "<h2>Chào mừng bạn <strong>" + req.getParameter("fullname")
					+ "</strong> đến với N8Rubik Shop !</h2>"
					+ "<p>Cảm ơn bạn đã tham gia vào cửa hàng của chúng tôi.</p>"
					+ "<p>Truy cập vào <a class='link' href='http://localhost:8080/nguyentcpc04750_ASM/home-page'>Đây</a> để mua sắm.</p>"
					+ "</body>" + "</html>";
			mess.setFrom(new InternetAddress("nguyentcpc04750@fpt.edu.vn"));
			mess.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			mess.setSubject("Thư chào mừng", "utf-8");
			mess.setText(content, "utf-8", "html");
			mess.setReplyTo(mess.getFrom());
			Transport.send(mess);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

}
