<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<c:url var="url" value="/admin-page/userManagement" />
<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Quản lí khuyến mãi</h2>
	</div>
	<div class="site-breadcrump mt-3">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/dashboard"
					class="text-decoration-none">Dashboard</a></li>
				<li class="breadcrumb-item active" aria-current="page">Quản lý
					khuyến mãi</li>
			</ol>
		</nav>
	</div>
	<div class="main-content mt-3 ">
		<div class="row">
			<div class="col-xs-12 col-md-4 ">
				<div class="p-4 bg-primary-subtle rounded">
					<h2
						class="text-dark fw-bold text-center mb-4 animate__animated animate__fadeInDown">Thông
						tin</h2>
					<form action="admin-page/userManagement" method="post">
						<div class="form-group mb-3">
							<label for="id"
								class="form-label animate__animated animate__fadeInRightBig">Mã
								khuyến mãi:</label> <input type="text"
								class="form-control animate__animated animate__fadeInRight"
								id="id" name="id" placeholder="" autocapitalize="off" readonly>
						</div>

						<div class="form-group mb-3">
							<label for="address"
								class="form-label animate__animated animate__fadeInRightBig">Ngày
								bắt đầu:</label> <input type="datetime-local"
								class="form-control animate__animated animate__fadeInRight"
								id="address" name="address" placeholder="" autocapitalize="off">
						</div>
						<div class="form-group mb-3">
							<label for="address"
								class="form-label animate__animated animate__fadeInRightBig">Ngày
								kết thúc:</label> <input type="datetime-local"
								class="form-control animate__animated animate__fadeInRight"
								id="address" name="address" placeholder="" autocapitalize="off">
						</div>
						<div class="d-flex justify-content-evenly">
							<button class="btn btn-success"
								formaction="/nguyentcpc04750_ASM/admin-page/flash-sale/create-flashsale"
								type="submit">Thêm</button>
							<button class="btn btn-primary"
								formaction="/nguyentcpc04750_ASM/admin-page/flash-sale/update-flashsale"">Cập
								nhật</button>
							<button class="btn btn-secondary"
								formaction="/nguyentcpc04750_ASM/admin-page/flash-sale">Làm
								mới</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-xs-12 col-md-8">
				<div class="card ">
					<div class="card-header text-center text-dark">
						<h2 class=" fw-bold">Danh sách khuyến mãi</h2>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-bordered table-striped">
							<thead class="table-info">
								<tr>
									<th scope="col">Stt</th>
									<th scope="col">Mã khuyến mãi</th>
									<th scope="col">Ngày bắt đầu</th>
									<th scope="col">Ngày kết thúc</th>
									<th scope="col">Số sản phẩm</th>
									<th scope="col">Trạng thái</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<tr>
									<th scope="row">1</th>
									<td>990000</td>
									<td>2023-07-21 15:40:26</td>
									<td>2023-08-14 00:00:00</td>
									<td>5 <a href="/nguyentcpc04750_ASM/admin-page/flash-sale/details-flashsale">Xem chi tiết</a></td>
									<td>Trong thời gian khuyến mãi</td>
									<td class="align-middle"><a class="btn btn-secondary"
										href="" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="" role="button">Xóa</a></td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>