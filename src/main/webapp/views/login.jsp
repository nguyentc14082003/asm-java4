<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập - N8Rubik</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/logo/rubik.ico" />

<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap/5.3.0/css/bootstrap.min.css" />">

<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap-icons/1.10.5/font/bootstrap-icons.css" />">

<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.css"/>">
<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick-theme.css"/>">

<script src=" <c:url value="/webjars/jquery/3.6.0/jquery.min.js"/> "></script>
<script
	src="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.js"/>"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script
	src=" <c:url value="/webjars/jquery.countdown/2.2.0/dist/jquery.countdown.js"/> "></script>

<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/index.css">

</head>
<body>
	<div class="container-fluid p-0">
		<header>
			<%@include file="/components/nav.jsp"%>
		</header>
		<main style="margin-top: 180px; margin-bottom: 140px">
			<div class="container">
				<div class=" d-flex align-items-center justify-content-center">
					<div class="card shadow border-0">
						<div class="card-body p-0">
							<div class="row">
								<div
									class="d-none d-lg-block col-lg-6 d-flex align-items-center justify-content-center">
									<img
										src="https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg"
										class="img-fluid mx-auto animate__animated animate__fadeInLeft"
										id="img">
								</div>
								<div class="col-md-12 col-lg-6">
									<div class="px-4">
										<h2
											class="text-muted fw-bold text-center my-4 animate__animated animate__fadeInDown">Đăng
											nhập</h2>
										<form action="/nguyentcpc04750_ASM/account/sign-in"
											method="post">
											<div class="form-group mb-3">
												<label for="username"
													class="form-label animate__animated animate__fadeInRightBig">Tài
													khoản:</label> <input type="text"
													class="form-control animate__animated animate__fadeInRight"
													id="username" name="lGusername" value="${lGusername}">
											</div>

											<div class="form-group mb-3">
												<label for="password"
													class="form-label animate__animated animate__fadeInRightBig">Mật
													khẩu:</label> <input type="password"
													class="form-control animate__animated animate__fadeInRight"
													id="password" name="lGpassword" placeholder="Enter Password"
													value="${lGpassword}">
											</div>
											<div class="valid">
												<span class="text-danger">${message}</span>
											</div>
											<div class="form-check mb-3">
												<input
													class="form-check-input animate__animated animate__fadeInRightBig"
													type="checkbox" value="true" id="cboRemember"
													name="cboRemember"> <label
													class="form-check-label animate__animated animate__fadeInRightBig"
													for="cboRemember"> Remember me </label>
											</div>

											<div class="d-grid gap-2 mx-auto mb-3">
												<button
													class="btn btn-outline-primary animate__animated animate__fadeInUp"
													type="submit">Đăng nhập</button>
											</div>
											<div class="form-check mb-3">
												<label>Don't have an acount?</label><a href="sign-up">Sign
													up</a>
											</div>
										</form>
									</div>
								</div>
								<div class="siteReturn  d-flex justify-content-center m-3">
									<a type="button" class="btn btn-outline-secondary"
										href="/nguyentcpc04750_ASM/home-page"><i
										class="bi bi-arrow-left"></i>Quay trở về trang chủ</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<%@ include file="/components/footer.jsp"%>
		</footer>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>