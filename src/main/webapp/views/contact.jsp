<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liên hệ - N8Rubik</title>
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
	href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>
	<div class="container-fluid p-0">
		<header>
			<%@include file="/components/nav.jsp"%>
		</header>
		<main style="margin-top: 110px">
			<div class="container">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14001.43176815544!2d105.77010879401129!3d10.015322498566235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a088302481654d%3A0x449b9ca18c9d223b!2zVHUgdmnhu4duIFRow6FuaCBHaWE!5e0!3m2!1svi!2s!4v1689499912045!5m2!1svi!2s"
					width="600" height="450" style="border: 0;" allowfullscreen=""
					loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				<div class="row mt-3">
					<div class="widthContent">
						<div class="row">
							<div class="col-lg-5 col-md-5 col-xs-12">
								<div class="box-info-contact">
									<h2>Thông tin liên hệ</h2>
									<ul class="infoList-contact row list-unstyled">
										<li class="col-md-12 col-xs-12 d-flex align-items-center mb-3"><span><i
												class="bi bi-geo-alt-fill p-3 bg-white rounded-circle  me-3"></i></span>
											<p>
												<strong>Địa chỉ</strong><br>356 Tầm Vu, Hưng Lợi, Ninh
												Kiều, Cần Thơ, Việt Nam
											</p></li>
										<li class="col-md-12 col-xs-12 d-flex align-items-center mb-3"><span><i
												class="bi bi-envelope p-3 bg-white rounded-circle  me-3"></i></span>
											<p>
												<strong>Email</strong><br>nguyentcpc04750@fpt.edu.vn
											</p></li>
										<li class="col-md-12 col-xs-12 d-flex align-items-center mb-3"><span><i
												class="bi bi-telephone p-3 bg-white rounded-circle  me-3"></i></span>
											<p>
												<strong>Điện thoại</strong><br>0911726601
											</p></li>
										<li class="col-md-12 col-xs-12 d-flex align-items-center mb-3"><span><i
												class="bi bi-clock p-3 bg-white rounded-circle  me-3"></i></span>
											<p>
												<strong>Thời gian làm việc</strong><br>Thứ 2 đến Thứ 6
												từ 8h30 đến 17h30;<br> Thứ 7 từ 8h30 đến 12h00
											</p></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-xs-12">
								<div class="box-send-contact">
									<h2>Gửi thắc mắc cho chúng tôi</h2>
									<p>Nếu bạn có thắc mắc gì, có thể gửi yêu cầu cho chúng
										tôi, và chúng tôi sẽ liên lạc lại với bạn sớm nhất có thể .</p>
									<div id="col-left contactFormWrapper">
										<form action="/contact" method="post">
											<div class="contact-form">
												<div class="row">
													<div class="col-sm-12 col-xs-12 mb-3">
														<input required type="text" name="contact[name]"
															class="form-control" placeholder="Tên của bạn">
													</div>
													<div class="col-sm-6 col-xs-12 mb-3">
														<div class="input-group">
															<input required type="text" name="contact[email]"
																class="form-control" placeholder="Email của bạn">
														</div>
													</div>
													<div class="col-sm-6 col-xs-12 mb-3">
														<div class="input-group">
															<input pattern="[0-9]{10,12}" required="" type="text"
																name="contact[phone]" class="form-control"
																placeholder="Số điện thoại của bạn">
														</div>
													</div>
													<div class="col-sm-12 col-xs-12 mb-3">
														<textarea required name="contact[body]"
															class="form-control" placeholder="Nội dung"></textarea>
													</div>
													<div class="col-xs-12 mb-3">
														<button class="btn btn-outline-success" type="submit">Gửi
															cho chúng tôi</button>
													</div>
												</div>
											</div>
										</form>
									</div>
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

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>