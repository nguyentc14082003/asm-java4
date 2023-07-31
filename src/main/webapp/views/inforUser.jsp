<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân - N8Rubik</title>
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
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">

<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>

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
								<div class="col-12">
									<div class="px-4">
										<h2
											class="text-muted fw-bold text-center my-4 animate__animated animate__fadeInDown">Thông
											tin cá nhân</h2>
										<form action="/nguyentcpc04750_ASM/account/edit-profile"
											method="post" id="editProfileForm">
											<input type="hidden" name="user_id" value="${user.user_id }">
											<div class="form-group mb-3">
												<label for="id"
													class="form-label animate__animated animate__fadeInRightBig">Tên
													tài khoản:</label> <input type="text"
													class="form-control animate__animated animate__fadeInRight"
													id="id" name="username" placeholder="" readonly="readonly"
													value="${user.username }">
											</div>

											<div class="form-group mb-3">
												<label for="email"
													class="form-label animate__animated animate__fadeInRightBig">Email:</label>
												<input type="email"
													class="form-control animate__animated animate__fadeInRight"
													id="email" name="email" placeholder="abc123@gmail.com"
													readonly="readonly" value="${user.email}">
											</div>

											<div class="form-group mb-3">
												<label for="fullname"
													class="form-label animate__animated animate__fadeInRightBig">Họ
													tên:</label> <input type="text"
													class="form-control animate__animated animate__fadeInRight"
													id="fullname" name="fullname" placeholder=""
													value="${user.fullname }" minlength="3" maxlength="60"
													required autocomplete="off">
											</div>

											<div class="form-group mb-3">
												<label for="phone"
													class="form-label animate__animated animate__fadeInRightBig">Số
													điện thoại:</label> <input type="text"
													class="form-control animate__animated animate__fadeInRight"
													id="phone" name="phone_number" placeholder="gồm 10 số"
													value="${user.phone_number }" pattern="(\+84|0)\d{9,10}">
											</div>
											<div class="form-group mb-3">
												<label for="address"
													class="form-label animate__animated animate__fadeInRightBig">Địa
													chỉ:</label> <input type="text"
													class="form-control animate__animated animate__fadeInRight"
													id="address" name="address" placeholder=""
													value="${user.address }" required minlength="6">
											</div>


											<div class="d-grid gap-2 mx-auto mb-3">
												<button
													class="btn btn-outline-primary animate__animated animate__fadeInUp"
													type="submit">Lưu</button>
											</div>
										</form>
									</div>
								</div>
								<div class="siteReturn  m-3">
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
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#editProfileForm")
									.submit(
											function(e) {
												e.preventDefault();
												var form = $(this);
												$
														.ajax({
															type : "POST",
															url : form
																	.attr("action"),
															data : form
																	.serialize(),
															success : function(
																	response) {
																console
																		.log(response)
																if (response == 'success') {
																	Swal
																			.fire({
																				icon : 'success',
																				title : 'Cập nhật thành công',
																				text : "Thông tin tài khoản đã được cập nhật !",
																				showConfirmButton : false,
																				timer : 1500
																			});
																} else {
																	Swal
																			.fire({
																				icon : 'success',
																				title : 'Cập nhật thất bại',
																				text : "Có lỗi xảy ra, vui lòng thử lại !",
																				showConfirmButton : false,
																				timer : 1500
																			});
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																Swal
																		.fire({
																			icon : 'success',
																			title : 'Cập nhật thất bại',
																			text : "Có lỗi xảy ra, vui lòng thử lại !",
																			showConfirmButton : false,
																			timer : 1500
																		});
															}
														});
											});
						});
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>