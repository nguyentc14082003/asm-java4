<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giới thiệu - N8Rubik</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/logo/rubik.ico" />

<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap/5.3.0/css/bootstrap.min.css" />">

<link rel="stylesheet"
	href="<c:url value="/webjars/bootstrap-icons/1.10.5/font/bootstrap-icons.css" />">

<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.css"/>">
<link rel="stylesheet"
	href="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick-theme.css"/>">

<script src=" <c:url value="/webjars/jquery/3.6.0/jquery.min.js"/> "></script>
<script
	src="<c:url value="/webjars/slick-carousel/1.8.1/slick/slick.js"/>"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script
	src=" <c:url value="/webjars/jquery.countdown/2.2.0/dist/jquery.countdown.js"/> "></script>
	<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>

	<div class="container-fluid p-0">
		<header>
			<%@include file="/components/nav.jsp"%>
		</header>
		<main style="margin-top: 150px">
			<div class="container">
				<div class="pageDetail-content">
					<div class="heading-pageDetail">
						<h1>Giới thiệu</h1>
					</div>
					<div class="content-pageDetail typeList-style">
						<p>
							<span style="font-size: 16px;"><em>Dù mới gia nhập
									sân chơi Rubik chưa lâu nhưng N8Rubik đã phát triển nhanh
									chóng&nbsp;và chạm đến lòng tin của khách hàng bằng
									những&nbsp;sản phẩm chất lượng, trải nghiệm mua sắm tối ưu
									và&nbsp;những giải đấu chuyên nghiệp với quy mô hàng đầu tại
									Việt Nam. N8Rubik không chỉ&nbsp;hướng đến chất lượng sản phẩm
									tốt nhất, nâng cao chất lượng dịch vụ chăm sóc khách
									hàng&nbsp;mà còn mong muốn phát triển cộng đồng Rubik tại Việt
									Nam ngày càng lớn mạnh.</em></span>
						</p>
						<p>&nbsp;</p>
						<h3>
							<strong>N8Rubik LÀ AI?</strong>
						</h3>
						<p>
							<span style="font-size: 16px;">N8Rubik là nhà phân phối đồ
								chơi trí tuệ Rubik hàng đầu Việt Nam. Chúng tôi cam kết mang lại
								những sản phẩm chính hãng với giá thành phải chăng cùng trải
								nghiệm mua sắm tuyệt vời.</span>
						</p>
						<p>
							<span style="font-size: 16px;">N8Rubik là đối tác trực
								tiếp với các thương hiệu Speedcube hàng đầu thế giới như Gan,
								Moyu, Qiyi,...</span>
						</p>
						<p>
							<span style="font-size: 16px;">N8Rubik hân hạnh là nhà tài
								trợ chính, đồng hành cùng các thí sinh cuber trong các giải đấu
								quy mô hàng đầu tại Việt Nam.</span>
						</p>
						<p>&nbsp;</p>
						<h3>
							<strong>GIÁ TRỊ CỐT LÕI</strong>
						</h3>
						<p>
							<span style="font-size: 16px;"><strong>SẢN PHẨM
									CHẤT LƯỢNG</strong> - Chúng tôi luôn cố gắng mang đến những sản phẩm
								chính hãng, chất lượng với nguồn gốc xuất sứ rõ ràng cùng mức
								giá&nbsp;phải chăng nhất</span>
						</p>
						<p>
							<span style="font-size: 16px;"><strong>HƯỚNG ĐẾN
									NGƯỜI DÙNG</strong> - N8Rubik luôn đặt khách hàng làm trung tâm của dịch
								vụ bán hàng, đặt mình vào vị thế của người dùng để mang lại
								những dịch vụ và trải nghiệm tốt nhất</span>
						</p>
						<p>
							<span style="font-size: 16px;"><strong>PHÁT TRIỂN
									CỘNG ĐỒNG </strong>- Chúng tôi hướng đến mục đích xây dựng và phát triển
								cộng đồng Speedcubing Việt Nam ngày càng lớn mạnh.</span>
						</p>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<%@ include file="/components/footer.jsp"%>
		</footer>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>