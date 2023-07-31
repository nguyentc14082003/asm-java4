<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:url var="url" value="nguyentcpc04750_ASM/admin-page/product/" />
<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Danh sách sản phẩm khuyến mãi</h2>
	</div>
	<div class="site-breadcrump mt-3">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/dashboard"
					class="text-decoration-none">Dashboard</a></li>
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/flash-sale"
					class="text-decoration-none">Quản lí khuyến mãi</a></li>
				<li class="breadcrumb-item active" aria-current="page">Danh
					sách sản phẩm khuyến mãi</li>
			</ol>
		</nav>
	</div>
	<div class="main-content mt-3 ">
		<div class="row">
			<div class="col-xs-12 col-lg-4">
				<h2
					class="text-dark fw-bold text-center mb-4 animate__animated animate__fadeInDown">Thông
					tin</h2>
				<form action="admin-page/userManagement" method="post">
					<div class="form-group mb-3">
						<label for="exampleDataList" class="form-label">Sản Phẩm</label> <input
							class="form-control" list="datalistOptions" id="exampleDataList"
							placeholder="Type to search...">
						<datalist id="datalistOptions">
							<option value="San Francisco">
							<option value="New York">
							<option value="Seattle">
							<option value="Los Angeles">
							<option value="Chicago">
						</datalist>
					</div>

					<div class="form-group mb-3">
						<label for="address"
							class="form-label animate__animated animate__fadeInRightBig">Giá
							gốc:</label> <input type="number"
							class="form-control animate__animated animate__fadeInRight"
							id="address" name="address" placeholder="" autocapitalize="off"
							readonly>
					</div>
					<div class="form-group mb-3">
						<label for="address"
							class="form-label animate__animated animate__fadeInRightBig">Giá
							khuyến mãi:</label> <input type="number"
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


			<div class="col-xs-12 col-lg-8">
				<div class="card ">
					<div class="card-header text-center text-dark">
						<h2 class=" fw-bold">Danh sách sản phẩm</h2>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-bordered table-striped">
							<thead class="table-info">
								<tr class="text-center align-middle">
									<th scope="col">Stt</th>
									<th scope="col" width="350px">Tên sản phẩm</th>
									<th scope="col">SL tồn kho</th>
									<th scope="col">Giá gốc</th>
									<th scope="col">Giá khuyến mãi</th>
									<th scope="col"></th>
								</tr>

							</thead>
							<tbody class="table-group-divider">
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>100</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle"><a class="btn btn-secondary"
										href="edit-product/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/edit/${user.id}"
										role="button">Xóa</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>100</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle"><a class="btn btn-secondary"
										href="edit-product/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/edit/${user.id}"
										role="button">Xóa</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>100</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle"><a class="btn btn-secondary"
										href="edit-product/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/edit/${user.id}"
										role="button">Xóa</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>100</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle"><a class="btn btn-secondary"
										href="edit-product/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href="${url}/edit/${user.id}"
										role="button">Xóa</a></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div class="d-flex algin-items-center justify-content-center">
					<div class="btn-group mt-3" role="group"
						aria-label="Basic outlined example">
						<button type="button" class="btn btn-outline-primary mx-3">|<</button>
						<button type="button" class="btn btn-outline-primary mx-3"><<</button>
						<button type="button" class="btn btn-outline-primary mx-3">>></button>
						<button type="button" class="btn btn-outline-primary mx-3">>|</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>