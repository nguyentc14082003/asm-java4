<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N8Rubik</title>
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
	src="<c:url value="/webjars/jquery.countdown/2.2.0/dist/jquery.countdown.js"/> "></script>

<script
	src="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/webjars/sweetalert2/11.7.12/dist/sweetalert2.min.css"/>">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
</head>

<body>
	<div class="container-fluid p-0">

		<header>
			<jsp:include page="/components/nav.jsp"></jsp:include>
			<jsp:include page="/components/slideShow.jsp"></jsp:include>
		</header>
		<main>
			<jsp:include page="/components/flashSale.jsp"></jsp:include>
			<jsp:include page="/components/bestSeller.jsp"></jsp:include>
		</main>
		<footer>
			<jsp:include page="/components/footer.jsp"></jsp:include>
		</footer>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/new.js"></script>
		
	

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/slick-carousel.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>



</body>
</html>