<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="site-dashboard">
	<div class="title-dashboard bg-white p-2">
		<h2 class="fw-bold m-0">Dashboard</h2>
	</div>
	
	<div class="main-content container mt-3 ">
		<div class="row mb-4">
			<div class="col-xs-12 col-md-6 col-lg-3 mb-3">
				<div class="card  rounded-4 shadow">
					<div
						class="card-body d-flex flex-column align-items-center justify-content-center text-info">
						<div class="row">
							<div
								class="col-7 d-flex flex-column  align-items-center justify-content-center">
								<h4>${totalUser}14</h4>
								<h5 class="text-center">Khách hàng thành viên</h5>
							</div>
							<div
								class="col-5  d-flex align-items-center justify-content-center">
								<i class="bi bi-people fs-2"></i>
							</div>
						</div>
					</div>
					<div
						class="card-footer rounded-4 rounded-top-0 bg-info d-flex align-items-center justify-content-center">
						<a href="#" class="text-dark">Xem chi tiết</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3 mb-3">
				<div class="card  rounded-4 shadow">
					<div
						class="card-body d-flex flex-column align-items-center justify-content-center text-danger">
						<div class="row">
							<div
								class="col-7 d-flex flex-column  align-items-center justify-content-center">
								<h4>${totalUser}14</h4>
								<h5 class="text-center">Sản phẩm bán được hôm nay</h5>
							</div>
							<div
								class="col-5  d-flex align-items-center justify-content-center">
								<i class="bi bi-bag-plus fs-2"></i>
							</div>
						</div>
					</div>
					<div
						class="card-footer rounded-4 rounded-top-0 bg-danger-subtle d-flex align-items-center justify-content-center">
						<a href="#" class="text-dark">Xem chi tiết</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3 mb-3">
				<div class="card  rounded-4 shadow">
					<div
						class="card-body d-flex flex-column align-items-center justify-content-center text-success">
						<div class="row">
							<div
								class="col-7 d-flex flex-column  align-items-center justify-content-center">
								<h4>${totalUser}14</h4>
								<h5>Khách hàng thành viên</h5>
							</div>
							<div
								class="col-5  d-flex align-items-center justify-content-center">
								<i class="bi bi-people fs-2"></i>
							</div>
						</div>
					</div>
					<div
						class="card-footer rounded-4 rounded-top-0 bg-success-subtle d-flex align-items-center justify-content-center">
						<a href="#" class="text-dark">Xem chi tiết</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3 mb-3">
				<div class="card  rounded-4 shadow">
					<div
						class="card-body d-flex flex-column align-items-center justify-content-center text-warning">
						<div class="row">
							<div
								class="col-7 d-flex flex-column  align-items-center justify-content-center">
								<h4>${totalUser}14</h4>
								<h5>Khách hàng thành viên</h5>
							</div>
							<div
								class="col-5  d-flex align-items-center justify-content-center">
								<i class="bi bi-people fs-2"></i>
							</div>
						</div>
					</div>
					<div
						class="card-footer rounded-4 rounded-top-0 bg-warning-subtle d-flex align-items-center justify-content-center">
						<a href="#" class="text-dark">Xem chi tiết</a>
					</div>
				</div>
			</div>
		</div>
		<div class="site-chart">
			<div>
				<canvas id="myChart"></canvas>
			</div>
		</div>
	</div>
</div>

<script>
	var xValues = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
			"12" ];
	var yValues = [ 55, 49, 44, 24, 15 ];
	var barColors = [ "red", "green", "blue", "orange", "brown" ];

	new Chart("myChart", {
		type : "bar",
		data : {
			labels : xValues,
			datasets : [ {
				backgroundColor : barColors,
				data : yValues
			} ]
		},
		options : {
			legend : {
				display : false
			},
			title : {
				display : true,
				text : "Danh thu năm 2023",
				fontSize : 25
			}
		}
	});
</script>