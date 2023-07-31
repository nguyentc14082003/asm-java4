<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:url var="url" value="nguyentcpc04750_ASM/admin-page/product/" />
<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Quản lí sản phẩm</h2>
	</div>
	<div class="site-breadcrump mt-3">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/dashboard"
					class="text-decoration-none">Dashboard</a></li>
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/product/list-product"
					class="text-decoration-none">Quản lí sản phẩm</a></li>
				<li class="breadcrumb-item active" aria-current="page">Danh
					sách sản phẩm</li>
			</ol>
		</nav>
	</div>
	<div class="main-content mt-3 ">
		<div class="row">
			<div class="col-6">
				<a class="btn btn-primary btn-lg"
					href="/nguyentcpc04750_ASM/admin-page/product/form-product"
					role="button">Thêm sản phẩm mới</a>
			</div>

			<div class="col-6">
				<div class="input-group mb-3  input-group-lg">
					<span class="input-group-text" id="basic-addon1"><i
						class="bi bi-search"></i></span> <input type="text" class="form-control "
						placeholder="Tìm kiếm" aria-label="Username"
						aria-describedby="basic-addon1">
				</div>
			</div>
			<div class="col-12">
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
									<th scope="col">Loại SP</th>
									<th scope="col">Thương hiệu</th>
									<th scope="col">SL tồn kho</th>
									<th scope="col">Giá gốc</th>
									<th scope="col">Kích thước</th>
									<th scope="col">Chất liệu</th>
									<th scope="col">Cân nặng</th>
									<th scope="col">Màu sắc</th>
									<th scope="col">Miêu tả</th>
									<th scope="col">Hình ảnh</th>
									<th scope="col"></th>
								</tr>

							</thead>
							<tbody class="table-group-divider">
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>3x3x3</td>
									<td>Gan</td>
									<td>100</td>
									<td>530,000</td>
									<td>56mm x 56mm x 56mm</td>
									<td>Nhựa ABS cao cấp</td>
									<td>77.5</td>
									<td>Stickerless không viền</td>
									<td>Phiên bản nâng cấp tiếp theo của gan i với tính năng
										kết nối với điện thoại thông qua app Cube Station với tính
										năng 280h không cần sạc</td>
									<td><img
										src="${pageContext.request.contextPath}/assets/img/product/Gan/3x3/gan3x3-anh1.png"
										alt="Hình ảnh sản phẩm" width="170px"></td>
									<td class="align-middle"><a class="btn btn-secondary mb-2"
										href="edit-product/1" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href=""
										role="button">Xóa</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>3x3x3</td>
									<td>Gan</td>
									<td>100</td>
									<td>530,000</td>
									<td>56mm x 56mm x 56mm</td>
									<td>Nhựa ABS cao cấp</td>
									<td>77.5</td>
									<td>Stickerless không viền</td>
									<td>Phiên bản nâng cấp tiếp theo của gan i với tính năng
										kết nối với điện thoại thông qua app Cube Station với tính
										năng 280h không cần sạc</td>
									<td><img
										src="${pageContext.request.contextPath}/assets/img/product/Gan/3x3/gan3x3-anh1.png"
										alt="Hình ảnh sản phẩm" width="170px"></td>
									<td class="align-middle"><a class="btn btn-secondary mb-2"
										href="" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href=""
										role="button">Xóa</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>3x3x3</td>
									<td>Gan</td>
									<td>100</td>
									<td>530,000</td>
									<td>56mm x 56mm x 56mm</td>
									<td>Nhựa ABS cao cấp</td>
									<td>77.5</td>
									<td>Stickerless không viền</td>
									<td>Phiên bản nâng cấp tiếp theo của gan i với tính năng
										kết nối với điện thoại thông qua app Cube Station với tính
										năng 280h không cần sạc</td>
									<td><img
										src="${pageContext.request.contextPath}/assets/img/product/Gan/3x3/gan3x3-anh1.png"
										alt="Hình ảnh sản phẩm" width="170px"></td>
									<td class="align-middle"><a class="btn btn-secondary mb-2"
										href="" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href=""
										role="button">Xóa</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>[Rubik 3x3x3x3][Rubik Thông Minh] Rubik Gan i Carry
										kết nối với điện thoại Stickerless (Có Nam Châm)</td>
									<td>3x3x3</td>
									<td>Gan</td>
									<td>100</td>
									<td>530,000</td>
									<td>56mm x 56mm x 56mm</td>
									<td>Nhựa ABS cao cấp</td>
									<td>77.5</td>
									<td>Stickerless không viền</td>
									<td>Phiên bản nâng cấp tiếp theo của gan i với tính năng
										kết nối với điện thoại thông qua app Cube Station với tính
										năng 280h không cần sạc</td>
									<td><img
										src="${pageContext.request.contextPath}/assets/img/product/Gan/3x3/gan3x3-anh1.png"
										alt="Hình ảnh sản phẩm" width="170px"></td>
									<td class="align-middle"><a class="btn btn-secondary mb-2"
										href="" role="button">Chỉnh sửa</a> <a
										class="btn btn-danger" href=""
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