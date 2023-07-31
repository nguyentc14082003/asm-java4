<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Thống kê & doanh thu</h2>
	</div>
	<div class="site-button mt-3">
		<div>
			<a class="btn btn-success" href="total-sold" role="button">Tổng số lượng sản phẩm đã bán</a>
			<a class="btn btn-success" href="total-like" role="button">Danh sách lượt thích sản phẩm </a>
			<a class="btn btn-success" href="total-revenue" role="button">Doanh thu cửa hàng</a>
			<a class="btn btn-success" href="total-Invoice" role="button">Tổng số đơn hàng của khách hàng</a>
		</div>
	</div>
	<div class="main-content mt-3 ">
		<jsp:include page="${view2}"></jsp:include>
	</div>
</div>