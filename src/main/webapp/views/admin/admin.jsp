<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị viên</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/logo/rubik.ico" />

<script src=" <c:url value="/webjars/chart.js/2.9.4/dist/Chart.js"/> "></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap/5.3.0/css/bootstrap.min.css" />">

<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap-icons/1.10.5/font/bootstrap-icons.css" />">

<script src=" <c:url value="/webjars/jquery/3.6.0/jquery.min.js"/> "></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/adminPage.css">

</head>

<body>
	<div class="container-fluid ">
		<div class="row">
			<div class="col-xs-12 col-md-2 p-0 site-left">
				<div
					class="Logo bg-white d-flex algin-items-center justify-content-center mb-3 border-end">
					<img alt="logo"
						src="${pageContext.request.contextPath}/assets/img/logo/logo.png">
				</div>
				<div class="d-flex align-items-center justify-content-center">
					<div class="flex-column fs-6 d-flex justify-content-center">

						<a href="/nguyentcpc04750_ASM/admin-page/dashboard" type="button"
							role="button" class="btn  btn-primary text-white mb-3 ">
							<i class="bi bi-house-door"></i> Dashboard
						</a> 
						<a href="/nguyentcpc04750_ASM/admin-page/userManagement"
							type="button" role="button"
							class="btn  btn-primary text-white mb-3 "> <i
							class="bi bi-people-fill"></i> Quản lí người dùng
						</a> 
						<a href="/nguyentcpc04750_ASM/admin-page/product/list-product"
							type="button"  role="button" class="btn  btn-primary text-white mb-3 ">
							<i class="bi bi-box"></i> Quản lí sản phẩm
						</a>
						<a href="/nguyentcpc04750_ASM/admin-page/flash-sale"
							type="button"  role="button" class="btn  btn-primary text-white mb-3 ">
							<i class="bi bi-percent"></i> Quản lí khuyến mãi
						</a>
						<a href="/nguyentcpc04750_ASM/admin-page/Invoice/list-invoice"
							type="button"  role="button" class="btn  btn-primary text-white mb-3 ">
							<i class="bi bi-receipt"></i> Quản lí hóa đơn
						</a>
						<a href="/nguyentcpc04750_ASM/admin-page/statistical/total-sold"
							type="button"  role="button" class="btn  btn-primary text-white mb-3 ">
							<i class="bi bi-cash-stack"></i> Thống kê & doanh thu
						</a>
											
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-10 site-right p-0">
				<div class="navTop bg-white  d-flex align-items-center">
					<div class="ms-5">
						<button class="btn btn-default btnTab fs-2">
							<i class="bi bi-list"></i>
						</button>
					</div>
					<div class="container d-flex align-items-center">
						<div class="ms-auto">
							<div class="dropdown">
								<%-- <span class="fs-6 ">Hi, Trần Chí Nguyễn</span> --%>
								<button type="button" class="btn btn-default fs-3  btnAccount"
									data-bs-toggle="dropdown" aria-expanded="false"
									data-bs-auto-close="outside">
									<i class="bi bi-person-circle"></i>
								</button>
								<div
									class="dropdown-menu dropdown-menu-xs-start dropdown-menu-lg-end"
									id="dropdown-account">
									<div class="site-user">
										<div class="list-group list-group-flush">
											<a href="/nguyentcpc04750_ASM/account/edit-profile"
												class="list-group-item list-group-item-action">Chỉnh sửa
												thông tin</a> <a href="/nguyentcpc04750_ASM/account/change-password"
												class="list-group-item list-group-item-action">Thay đổi
												mật khẩu</a> <a href="/nguyentcpc04750_ASM/account/sign-out"
												class="list-group-item list-group-item-action">Đăng xuất</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-content p-3" id="v-pills-tabContent">

					<jsp:include page="${view}"></jsp:include>

				</div>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			let btnTab = document.querySelector('.btnTab');
			let siteLeft = document.querySelector('.site-left');
			let siteRight = document.querySelector('.site-right');
			btnTab.addEventListener('click', function() {
				siteLeft.classList.toggle('open');
				siteRight.classList.toggle('col-md-10')
			});
		});
	</script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>