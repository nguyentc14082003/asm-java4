<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="my-3">
	<form action="total-Invoice" method="post">
		<div class="input-group mb-3  input-group-lg">
			<span class="input-group-text" id="basic-addon1"><i
				class="bi bi-search"></i></span> <input type="text" class="form-control "
				placeholder="Tìm kiếm theo tên khách hàng" aria-label="Username"
				aria-describedby="basic-addon1">
				<button type="submit" class="btn btn-primary">Tìm kiếm</button>
		</div>
	</form>
</div>


<div class="card ">
	<div class="card-header text-center text-dark">
		<h2 class=" fw-bold ">Danh sách tổng số đơn hàng của khách hàng</h2>
	</div>
	<div class="table-responsive">
		<table class="table table-hover table-bordered table-striped">
			<thead class="table-info">
				<tr class="text-center align-middle">
					<th scope="col" width="50px">Stt</th>
					<th scope="col">Mã Khách hàng</th>
					<th scope="col">Họ Tên</th>
					<th scope="col" width="300px">Tổng số đơn hàng</th>
					<th scope="col" width="300px">Tổng tiền</th>
				</tr>

			</thead>
			<tbody class="table-group-divider">
				<tr class="algin-middle text-center">
					<th scope="row">1</th>
					<td>100001</td>
					<td>Trần Chí Nguyễn</td>
					<td>4</td>
					<td>5,000,000 đ</td>
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