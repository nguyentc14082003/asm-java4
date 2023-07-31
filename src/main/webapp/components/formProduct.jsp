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
				<li class="breadcrumb-item active" aria-current="page">${breadcrump } sản
					phẩm</li>
			</ol>
		</nav>
	</div>
	<div class="main-content mt-3 p-3 bg-info-subtle">
		<form action="nguyentcpc04750_ASM/admin-page/product/form-product"
			method="post">
			<div class="row">
				<div class="col-xs-12 col-md-3">
					<div class="site-img ">
						<label class="form-label" for="image">Hình ảnh: </label> <br>
						<img id="blah" alt="your image" width="300px" class="mb-3 align-center" /> <input
							type="file" class="form-control" id="image"
							onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
					</div>
				</div>
				<div class="col-xs-12 col-md-9">
					<div class="row">
						<div class="col-12">
							<div class="form-group mb-3">
								<label for="product_name"
									class="form-label animate__animated animate__fadeInRightBig">Tên
									sản phẩm:</label> <input type="text"
									class="form-control animate__animated animate__fadeInRight"
									id="product_name" name="product_name" placeholder=""
									autocapitalize="off">
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="original_price"
									class="form-label animate__animated animate__fadeInRightBig">Giá
									gốc:</label>
								<div class="input-group">

									<input type="number" class="form-control" name="original_price"
										id="original_price" placeholder=""
										aria-describedby="basic-addon2"> <span
										class="input-group-text">VNĐ</span>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="size"
									class="form-label animate__animated animate__fadeInRightBig">Kích
									thước:</label>
								<div class="input-group">
									<input type="number" class="form-control" name="size" id="size"
										placeholder="" aria-describedby="basic-addon2"> <span
										class="input-group-text">Milimet</span>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="weight"
									class="form-label animate__animated animate__fadeInRightBig">Cân
									nặng:</label>
								<div class="input-group">
									<input type="number" class="form-control" name="weight"
										id="weight" placeholder="" aria-describedby="basic-addon2">
									<span class="input-group-text">Gam</span>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="material"
									class="form-label animate__animated animate__fadeInRightBig">Chất
									liệu:</label> <input type="text"
									class="form-control animate__animated animate__fadeInRight"
									id="material" name="material" placeholder=""
									autocapitalize="off">
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="color"
									class="form-label animate__animated animate__fadeInRightBig">Màu
									sắc:</label> <input type="text"
									class="form-control animate__animated animate__fadeInRight"
									id="color" name="color" placeholder="" autocapitalize="off">
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="quantity_in_stock"
									class="form-label animate__animated animate__fadeInRightBig">Số
									lượng trong kho:</label> <input type="number"
									class="form-control animate__animated animate__fadeInRight"
									id="quantity_in_stock" name="quantity_in_stock" placeholder=""
									autocapitalize="off">
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="manufacturer_id"
									class="form-label animate__animated animate__fadeInRightBig">Thương
									hiệu:</label> <select class="form-select"
									aria-label="Default select example" id="manufacturer_id">
									<option selected>GAN</option>
									<option value="1">QIYI</option>
									<option value="2">DAYAN</option>
									<option value="3">YONGJUN</option>
									<option value="3">MOYU</option>
								</select>
							</div>
						</div>

						<div class="col-xs-12 col-md-6">
							<div class="form-group mb-3">
								<label for="category_id"
									class="form-label animate__animated animate__fadeInRightBig">Loại
									sản phẩm:</label> <select class="form-select"
									aria-label="Default select example" id="category_id">
									<option selected>2x2x2</option>
									<option value="1">3x3x3</option>
									<option value="2">4x4x4</option>
									<option value="3">5x5x5</option>
								</select>
							</div>
						</div>

						<div class="col-12">
							<div class="form-group mb-3">
								<label for="description" class="form-label">Miêu tả: </label>
								<textarea class="form-control" id="description" rows="5"></textarea>
							</div>
						</div>
					</div>
					<div class="site-action">
						<button class="btn btn-success" formaction="create-product" type="submit">Thêm</button>
						<button class="btn btn-primary" formaction="update-product">Cập
							nhật</button>
						<button class="btn btn-secondary" formaction="form-product">Làm
							mới</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>