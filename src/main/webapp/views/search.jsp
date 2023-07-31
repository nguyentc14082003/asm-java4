<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm - N8Rubik</title>

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
				<div
					class="title d-flex flex-column algin-items-center justify-content-center mb-3">
					<h2 class="fw-bold mx-auto">Tìm kiếm</h2>
					<div class="line-black bg-dark mx-auto my-3"
						style="width: 70px; height: 3px"></div>
					<c:choose>
						<c:when test="${sizeListPd == 0}">
							<div
								class="fint-not d-flex flex-column algin-items-center justify-content-center "
								style="margin-bottom: 400px">
								<span class="mx-auto fw-bold mb-3">Không tìm thấy nội
									dung bạn yêu cầu</span> <span class="mx-auto">Không tìm thấy
									"${search}". Vui lòng kiểm tra chính tả, sử dụng các từ tổng
									quát hơn và thử lại!</span>
							</div>

						</c:when>
						<c:otherwise>
							<span class="mx-auto fw-semibold">Có <strong>${sizeListPd}
									sản phẩm</strong> cho tìm kiếm
							</span>
						</c:otherwise>
					</c:choose>

				</div>
				<c:if test="${sizeListPd > 0}">
					<div class="text mb-3">
						<span>Kết quả tìm kiếm cho <strong>"${search}"</strong></span>
					</div>
				</c:if>

				<section class="list-product">
					<div class="row">
						<c:forEach var="p" items="${listProduct}" varStatus="i">
							<c:if test="${!p.is_del }">
								<div class="col-xs-6 col-lg-3 mb-3 " id="cardProduct">
									<div class="card h-100">
										<a href="products/${p.product_id }"><img
											src="${pageContext.request.contextPath}/assets/img/product/${p.image }"
											class="card-img-top" alt="${p.product_name }"
											style="object-fit: cover; height: 318px;"></a>

										<div class="card-body d-flex flex-column">
											<span class="text-muted">${p.manufacturer.manufacturer_name }</span>
											<a
												class="card-title fs-6 fw-bold text-black text-decoration-none"
												href="products/${p.product_id }">${p.product_name }</a>
											<div class="price-product mb-3">

												<c:set var="foundFlashSale" value="false" />

												<c:forEach var="f" items="${listPdFlashsale}">
													<c:choose>
														<c:when test="${f.product.product_id == p.product_id}">
															<span class="text-decoration-line-through"> <fmt:formatNumber
																	type="number" pattern="###,###"
																	value="${p.original_price}" /> đ
															</span>
															<span class="text-danger fw-bold"> <fmt:formatNumber
																	type="number" pattern="###,###"
																	value="${f.discounted_price}" /> đ
															</span>
															<div class="position-absolute top-0 start-0">
																<div>
																	<span class="p-1 text-bg-danger"> -<fmt:formatNumber
																			type="number" pattern="###,###"
																			value="${(p.original_price - f.discounted_price)/p.original_price *100}" />%
																	</span>
																	<c:if test="${p.quantity_in_stock==0 }">
																		<span class="p-1 text-bg-dark ms-3">Tạm hết
																			hàng</span>
																	</c:if>
																</div>
															</div>
															<c:set var="foundFlashSale" value="true" />
														</c:when>
													</c:choose>
												</c:forEach>

												<c:if test="${!foundFlashSale}">
													<span class="text-danger fw-bold"> <fmt:formatNumber
															type="number" pattern="###,###"
															value="${p.original_price}" /> đ
													</span>
												</c:if>
											</div>
											<div class="siteAction mt-auto">
												<c:choose>
													<c:when test="${p.quantity_in_stock==0  }">
														<button type="button" disabled
															class="btn btn-outline-primary  float-xl-start">Thêm
															vào giỏ</button>
														<button class="btn btn-outline-primary  float-xl-end"
															role="button" disabled>Mua ngay</button>
													</c:when>
													<c:otherwise>
														<button type="button"
															class="btn btn-outline-primary  float-xl-start">Thêm
															vào giỏ</button>
														<a class="btn btn-outline-primary  float-xl-end" href="#"
															role="button">Mua ngay</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</section>
			</div>
		</main>
		<footer>
			<%@ include file="/components/footer.jsp"%>
		</footer>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/new.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>