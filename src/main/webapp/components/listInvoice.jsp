<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<c:url var="url" value="nguyentcpc04750_ASM/admin-page/product/" />
<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Quản lí hóa đơn</h2>
	</div>
	<div class="site-breadcrump mt-3">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/nguyentcpc04750_ASM/admin-page/dashboard"
					class="text-decoration-none">Dashboard</a></li>
				<li class="breadcrumb-item active" aria-current="page">Quản lí
					hóa đơn</li>
			</ol>
		</nav>
	</div>
	<div class="main-content mt-3 ">
		<div class="row">
			<div class="col-6"></div>

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
						<h2 class=" fw-bold">Danh sách hóa đơn</h2>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-bordered table-striped">
							<thead class="table-info">
								<tr class="text-center align-middle">
									<th scope="col">Stt</th>
									<th scope="col">Mã hóa đơn</th>
									<th scope="col">Ngày lập</th>
									<th scope="col">Tổng tiền</th>
									<th scope="col">Ghi chú</th>
									<th scope="col"></th>
								</tr>

							</thead>
							<tbody class="table-group-divider">
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="details-invoice/1" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
								</tr>
								<tr class="algin-middle ">
									<th scope="row">1</th>
									<td>500000</td>
									<td>14 - 7 - 2023</td>
									<td>530,000</td>
									<td>500,000</td>
									<td class="align-middle d-flex justify-content-center"><a class="btn btn-info"
										href="" role="button">Xem chi tiết</a></td>
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