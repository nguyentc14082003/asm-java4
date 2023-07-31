<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/admin-page/userManagement" />
<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Quản lí tài khoản</h2>
	</div>
	<div class="site-breadcrump mt-3">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/dashboard"
					class="text-decoration-none">Dashboard</a></li>
				<li class="breadcrumb-item active" aria-current="page">Quản lý
					tài khoản</li>
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
								class="form-label animate__animated animate__fadeInRightBig">Tên
								tài khoản:</label> <input type="text"
								class="form-control animate__animated animate__fadeInRight"
								id="id" name="id" placeholder="" autocapitalize="off">
						</div>

						<div class="form-group mb-3">
							<label for="password"
								class="form-label animate__animated animate__fadeInRightBig">Mật
								khẩu:</label> <input type="password"
								class="form-control animate__animated animate__fadeInRight"
								id="password" name="password" placeholder="">
						</div>

						<div class="form-group mb-3">
							<label for="fullname"
								class="form-label animate__animated animate__fadeInRightBig">Họ
								tên:</label> <input type="text"
								class="form-control animate__animated animate__fadeInRight"
								id="fullname" name="fullname" placeholder=""
								autocapitalize="off">
						</div>

						<div class="form-group mb-3">
							<label for="email"
								class="form-label animate__animated animate__fadeInRightBig">Email:</label>
							<input type="text"
								class="form-control animate__animated animate__fadeInRight"
								id="email" name="email" placeholder="abc123@gmail.com"
								autocapitalize="off">
						</div>
						<div class="form-group mb-3">
							<label for="phone"
								class="form-label animate__animated animate__fadeInRightBig">Số
								điện thoại:</label> <input type="text"
								class="form-control animate__animated animate__fadeInRight"
								id="phone" name="phone" placeholder="" autocapitalize="off">
						</div>
						<div class="form-group mb-3">
							<label for="address"
								class="form-label animate__animated animate__fadeInRightBig">Địa
								chỉ:</label> <input type="text"
								class="form-control animate__animated animate__fadeInRight"
								id="address" name="address" placeholder="" autocapitalize="off">
						</div>

						<div class="d-flex justify-content-evenly">
							<button class="btn btn-success"
								formaction="/nguyentcpc04750_ASM/admin-page/userManagement/create-user"
								type="submit">Thêm</button>
							<button class="btn btn-primary"
								formaction="/nguyentcpc04750_ASM/admin-page/userManagement/update-user">Cập
								nhật</button>
							<button class="btn btn-secondary"
								formaction="/nguyentcpc04750_ASM/admin-page/userManagement">Làm
								mới</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-xs-12 col-md-8">
				<div class="card ">
					<div class="card-header text-center text-dark">
						<h2 class=" fw-bold">Danh sách người dùng</h2>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-bordered table-striped">
							<thead class="table-info">
								<tr>
									<th scope="col">Stt</th>
									<th scope="col">Tên tài khoản</th>
									<th scope="col">Mật khẩu</th>
									<th scope="col">Họ tên</th>
									<th scope="col">Email</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Role</th>
									<th scope="col"></th>
								</tr>

							</thead>
							<tbody class="table-group-divider">
								<tr>
									<th scope="row">1</th>
									<td>nguyentcpc04750</td>
									<td>123456aA@</td>
									<td>Trần Chí Nguyễn</td>
									<td>nguyentcpc04750@gmail.com</td>
									<td>Sóc trăng</td>
									<td>Admin</td>

									<td class="align-middle"><a class="btn btn-secondary"
										href="${url}/edit-user/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/delete-user" role="button">Xóa</a></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>nguyentcpc04750</td>
									<td>123456aA@</td>
									<td>Trần Chí Nguyễn</td>
									<td>nguyentcpc04750@gmail.com</td>
									<td>Sóc trăng</td>
									<td>Admin</td>

									<td class="align-middle"><a class="btn btn-secondary"
										href="${url}/edit-user/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/delete-user" role="button">Xóa</a></td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>nguyentcpc04750</td>
									<td>123456aA@</td>
									<td>Trần Chí Nguyễn</td>
									<td>nguyentcpc04750@gmail.com</td>
									<td>Sóc trăng</td>
									<td>Admin</td>

									<td class="align-middle"><a class="btn btn-secondary"
										href="${url}/edit-user/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/delete-user" role="button">Xóa</a></td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>nguyentcpc04750</td>
									<td>123456aA@</td>
									<td>Trần Chí Nguyễn</td>
									<td>nguyentcpc04750@gmail.com</td>
									<td>Sóc trăng</td>
									<td>Admin</td>

									<td class="align-middle"><a class="btn btn-secondary"
										href="${url}/edit-user/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/delete-user" role="button">Xóa</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>