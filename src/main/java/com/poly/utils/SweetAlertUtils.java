package com.poly.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class SweetAlertUtils {

	public static void showSuccessAlert(HttpServletRequest request, HttpServletResponse response, String title,
			String message) throws IOException {
		showAlert(request, response, "success", title, message);
	}

	public static void showErrorAlert(HttpServletRequest request, HttpServletResponse response, String title,
			String message) throws IOException {
		showAlert(request, response, "error", title, message);
	}

	public static void showWarningAlert(HttpServletRequest request, HttpServletResponse response, String title,
			String message) throws IOException {
		showAlert(request, response, "warning", title, message);
	}

	private static void showAlert(HttpServletRequest request, HttpServletResponse response, String type, String title,
			String message) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<script src=\"<c:url value=\"/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js\"/>\"></script>");
		out.println("<link rel=\"stylesheet\" href=\"<c:url value=\"/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css\"/>\">");
		out.println("<script type=\"text/javascript\">");
		out.println("Swal.fire({");
		out.println("    icon: '" + type + "',");
		out.println("    title: '" + title + "',");
		out.println("    text: '" + message + "',");
		out.println("    confirmButtonColor: '#3085d6',");
		out.println("    confirmButtonText: 'OK'");
		out.println("}).then((result) => {");
		out.println("    if (result.isConfirmed) {");
		out.println("        window.location.href = '" + request.getContextPath() + "/';");
		out.println("    }");
		out.println("});");
		out.println("</script>");
		System.out.println(123);
	}
}
