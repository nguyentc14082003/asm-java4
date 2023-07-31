<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="my-3">
		<form action="total-revenue" method="post" class="filter-time d-flex">
			<div class="form-year fs-4 me-3">
				<label for="form" class="fw-bold">Từ</label> <input type="month"
					id="year">
			</div>
			<div class="to-year fs-4 me-3">
				<label for="form" class="fw-bold">Đến</label> <input type="month"
					id="year">
			</div>
			<button type="submit" class="btn btn-warning fs-5"><i class="bi bi-funnel"></i>Lọc</button>
		</form>
		
</div>


<div class="card ">
	<div class="card-header text-center text-dark">
		<h2 class=" fw-bold ">Danh sách thống kê doanh thu cửa hàng theo tháng</h2>
	</div>
	<div class="table-responsive">
		<table class="table table-hover table-bordered table-striped">
			<thead class="table-info">
				<tr class="text-center align-middle">
					<th scope="col" width="50px">Stt</th>
					<th scope="col">Thời gian</th>
					<th scope="col" width="500px">SL đã bán</th>
				</tr>

			</thead>
			<tbody class="table-group-divider">
				<tr class="algin-middle text-center">
					<th scope="row">1</th>
					<td>14-07-2023</td>
					<td>400,000 đ</td>
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