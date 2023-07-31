
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng -N8Rubik</title>
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
		<main style="margin-top: 140px">
			<div class="container">
				<form action="cart" method="post" id="cartformpage">
					<div class="row bg-white">
						<div class="col-xs-12 col-md-8 border ">
							<div class="mainCart-detail  p-2 ">
								<div class="heading-cart">
									<h1>Giỏ hàng của bạn</h1>
								</div>
								<div class="list-pageform-cart">
									<div class="cart-row">
										<p class="title-number-cart">
											Bạn đang có <strong class="count-cart">${sizeInCart}
												sản phẩm</strong> trong giỏ hàng
										</p>
										<div class="table-cart">
											<c:forEach var="cart" items="${carts}">
												<div class="row mb-2 border">
													<div class="col-2 ps-0">
														<a href="/nguyentcpc04750_ASM/products/${p.product_id }">
															<img
															src="${pageContext.request.contextPath}/assets/img/product/${cart.product.image}"
															class="img-thumbnail rounded float-start" alt="Gan 3x3"
															width="100px">
														</a>
													</div>
													<div class="col-9 ps-0">
														<a href="/nguyentcpc04750_ASM/products/${p.product_id }"
															class="text-dark text-decoration-none fw-bold text-wrap">${cart.product.product_name}</a>
														<div class="row mt-4">
															<div class="col-6">
																<input type="number"
																	class="form-control form-control-sm float-start"
																	value="${cart.quantity}" min="1" style="width: 50%">
															</div>
															<div class="col-lg-6 float-end">
																<c:choose>
																	<c:when
																		test="${cart.product.promotionalDetailsList[0] != null}">
																		<!-- Hiển thị giá flash sale nếu sản phẩm thuộc flash sale -->

																		<span
																			class="text-muted text-decoration-line-through me-2"><fmt:formatNumber
																				type="number" pattern="###,###,###"
																				value="${cart.product.original_price}" />₫</span>
																		<span class="fw-bold float-end text-danger"> <fmt:formatNumber
																				type="number" pattern="###,###,###"
																				value="${cart.product.promotionalDetailsList[0].discounted_price}" />
																			₫
																		</span>
																	</c:when>
																	<c:otherwise>
																		<!-- Hiển thị giá thường nếu sản phẩm không thuộc flash sale -->
																		<span class="fw-bold float-end text-danger"><fmt:formatNumber
																				type="number" pattern="###,###,###"
																				value="${cart.product.original_price}" />₫</span>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>
													<div class="col-1">
														<button class="btn btn-default border-0 fw-bold"
															onclick="removeCartItem(${cart.cart_id})">
															<i class="bi bi-x-lg"></i>
														</button>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-md-4">
							<div class="mainCart-sidebar wrap-order-summary p-2">
								<c:set var="disableButton"
									value="${totalPrice==0 ? 'disabled' : ''}" />
								<div class="order-summary-block">
									<h2 class="summary-title fw-bold">Thông tin đơn hàng</h2>
									<div class="summary-total">
										<p>
											Tổng tiền: <span class="text-danger fw-bold fs-3"><fmt:formatNumber
													type="number" pattern="###,###,###"
													value="${totalPriceInCart}" /> ₫</span>
										</p>
									</div>
									<div class="cart-row">
										<div class="order-noted-block ">
											<div class="container-pd15">
												<div class="checkout-buttons clearfix">
													<label for="note" class="note-label mb-3">Địa chỉ
														giao hàng: </label>
													<textarea class="form-control" id="note"
														name="delivery_address" rows="5" ${disableButton}></textarea>
												</div>
												<div class="checkout-buttons clearfix">
													<label for="note" class="note-label mb-3">Ghi chú
														đơn hàng</label>
													<textarea class="form-control" id="note" name="description"
														${disableButton} rows="5"></textarea>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="summary-action mb-3">
										<c:if test="${totalPrice==0}">
											<div class="summary-alert alert alert-danger ">Giỏ hàng
												của bạn hiện chưa đạt mức tối thiểu để thanh toán.</div>
										</c:if>
										<div class="summary-button d-grid">

											<button id="btnCart-checkout" class="btn btn-outline-danger"
												${disableButton}>ĐẶT HÀNG</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</main>

		<footer>
			<%@ include file="/components/footer.jsp"%>
		</footer>

	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>