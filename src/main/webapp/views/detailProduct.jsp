
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pd.product_name}-N8Rubik</title>
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
	href="${pageContext.request.contextPath}/assets/css/new.css">

</head>
<body>
	<div class="container-fluid p-0">
		<header>
			<%@include file="/components/nav.jsp"%>
		</header>
		<main style="margin-top: 140px">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<img
							src="${pageContext.request.contextPath}/assets/img/product/${pd.image}"
							class="card-img-top" alt="...">
					</div>
					<div class="col-xs-12 col-md-6">
						<div class="product-top clearfix">
							<h2 class="title-head">${pd.product_name}</h2>
							<div class="sku-product fs-custom">
								Mã SP: <span class="variant-sku " itemprop="sku"
									content="${pd.product_id }">${pd.product_id }</span>
							</div>

							<div class="inventory_quantity fs-custom">
								<span class="stock-brand-title  "><strong>Số
										lượng tồn kho:</strong></span>
								<c:choose>
									<c:when test="${pd.quantity_in_stock>0 }">
										<span class="a-stock a2  ">${pd.quantity_in_stock}</span>
									</c:when>
									<c:otherwise>
										<span class="a-stock a2 ">Tạm hết hàng</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<hr>
						<div class="product-summary product_description">
							<h3>Thông tin sản phẩm</h3>
							<div class="rte description">
								<div class="table-responsive">
									<table class="table border">
										<tbody class="fs-custom">
											<tr>
												<th>Hãng</th>
												<td>${pd.manufacturer.manufacturer_name }</td>
											</tr>
											<tr>
												<th>Loại</th>
												<td>Rubik ${pd.category.category_name }</td>
											</tr>
											<tr>
												<th>Trọng lượng</th>
												<td>${pd.weight }g</td>
											</tr>
											<tr>
												<th>Kích thước</th>
												<td>${pd.size }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="price-box clearfix">
							<div class="special-price d-flex">

								<c:if test="${isFlashSale }">
									<span class="price product-price text-danger fs-2 fw-bold me-2"><fmt:formatNumber
											type="number" pattern="###,###,###"
											value="${pd.original_price}" /> ₫</span>
								</c:if>
								<c:if test="${!isFlashSale}">
									<span class="fs-6 text-muted text-decoration-line-through me-2"
										style="align-self: center;"> <fmt:formatNumber
											type="number" pattern="###,###,###"
											value="${pd.original_price}" /> ₫
									</span>
									<span class="price product-price text-danger fs-2 fw-bold me-2">
										<fmt:formatNumber type="number" pattern="###,###,###"
											value="${pd.promotionalDetailsList[0].discounted_price }" />

										₫ <span class="badge text-bg-danger fs-6">giảm <fmt:formatNumber
												type="number" pattern="###,###"
												value="${(pd.original_price - pd.promotionalDetailsList[0].discounted_price)/pd.original_price *100}" />
											%
									</span>
									</span>
								</c:if>
								<span class="ms-auto siteLike"> <i
									class="bi bi-heart fs-3" style="cursor: pointer;"></i> <%-- 
									<i class="bi bi-heart-fill fs-3 text-danger" style="cursor: pointer;"></i> --%>
								</span>
							</div>
							<!-- Giá -->
						</div>

						<div class="form-product mb-3">
							<c:choose>
								<c:when test="${pd.quantity_in_stock == 0}">
									<form id="add-to-cart-form" action="/cart/add" method="post"
										class="clearfix form-inline">
										<div class="clearfix form-group">
											<div class="qty-input clearfix custom-btn-number d-flex mb-3">
												<label class="fw-bold me-3 fs-custom">Số lượng:</label>
												<div class="custom custom-btn-numbers">
													<button
														onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;"
														class="btn-minus btn-cts" type="button">–</button>
													<input type="number" class="qty input-text" id="qty"
														disabled name="quantity" size="4" value="1" maxlength="3"
														max="${pd.quantity_in_stock}">
													<button
														onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;"
														class="btn-plus btn-cts" type="button">+</button>
												</div>
											</div>
											<div class="btn-mua">
												<button type="submit" class="btn btn-lg btn-primary"
													disabled>
													<span class="txt-main">Thêm vào giỏ hàng</span>
												</button>
												<button class="btn btn-lg btn-danger" disabled>
													<span class="txt-main">Mua ngay</span>
												</button>

											</div>
										</div>
									</form>
								</c:when>
								<c:otherwise>
									<form id="add-to-cart-form" action="/cart/add" method="post"
										class="clearfix form-inline">
										<div class="clearfix form-group">
											<div class="qty-input clearfix custom-btn-number d-flex mb-3">
												<label class="fw-bold me-3">Số lượng:</label>
												<div class="custom custom-btn-numbers">
													<button
														onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN(qty) &amp; qty > 1 ) result.value--;return false;"
														class="btn-minus btn-cts" type="button">–</button>
													<input type="number" class="qty input-text" id="qty"
														name="quantity" size="4" value="1" maxlength="3"
														max="${pd.quantity_in_stock}">
													<button
														onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN(qty)) result.value++;return false;"
														class="btn-plus btn-cts" type="button">+</button>
												</div>
											</div>

											<div class="btn-mua">
												<button type="submit" class="btn btn-lg btn-primary">
													<span class="txt-main">Thêm vào giỏ hàng</span>
												</button>
												<button class="btn btn-lg btn-danger">
													<span class="txt-main">Mua ngay</span>
												</button>

											</div>
										</div>
									</form>
								</c:otherwise>
							</c:choose>

						</div>
						<div class="hotline_product mb-3 fs-custom">
							<img
								src="//bizweb.dktcdn.net/100/316/286/themes/757383/assets/telephone.svg?1687422422836"
								alt="icon-phone" width="40px"> Gọi: <span class="fw-bold">0911726601</span>
							<span>để được tư vấn và mua hàng.</span>
						</div>
						<div class="description_product">
							<div class="accordion" id="accordionPanelsStayOpenExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-bold fs-4" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseOne"
											aria-expanded="true"
											aria-controls="panelsStayOpen-collapseOne">Mô tả sản
											phẩm</button>
									</h2>
									<div id="panelsStayOpen-collapseOne"
										class="accordion-collapse collapse fs-custom show">
										<div class="accordion-body">Phiên bản nâng cấp tiếp theo
											của gan i với tính năng kết nối với điện thoại thông qua app
											Cube Station với tính năng 280h không cần sạc</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed fw-bold fs-4"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseTwo"
											aria-expanded="false"
											aria-controls="panelsStayOpen-collapseTwo">Dịch vụ
											giao hàng</button>
									</h2>
									<div id="panelsStayOpen-collapseTwo"
										class="accordion-collapse collapse">
										<div class="accordion-body fs-custom">
											<div class="product-deliverly">
												<ul class="infoList-deliverly list-unstyled">
													<li class="mb-3"><span> <img
															class=" ls-is-cached lazyloaded"
															data-src="https://file.hstatic.net/1000397797/file/delivery-ico1_f26631929e1b41dab022d9960006297c.svg"
															src="https://file.hstatic.net/1000397797/file/delivery-ico1_f26631929e1b41dab022d9960006297c.svg"
															alt="Cam kết 100% chính hãng">
													</span> Cam kết 100% chính hãng</li>
													<li class="mb-3"><span> <img
															class=" ls-is-cached lazyloaded"
															data-src="https://file.hstatic.net/1000397797/file/delivery-ico2_5ea2de2f279b4dbfa10fcb9b9c448b4d.svg"
															src="https://file.hstatic.net/1000397797/file/delivery-ico2_5ea2de2f279b4dbfa10fcb9b9c448b4d.svg"
															alt="Giao hàng dự kiến: Thứ 2 - Thứ 6 từ 9h00 - 17h30">
													</span> Giao hàng dự kiến: <br> <strong>Thứ 2 - Thứ
															6 từ 9h00 - 17h30</strong></li>
													<li class="mb-3"><span> <img
															class=" ls-is-cached lazyloaded"
															data-src="https://file.hstatic.net/1000397797/file/delivery-ico3_dd589d9c49584441a9ef0c2f9300649f.svg"
															src="https://file.hstatic.net/1000397797/file/delivery-ico3_dd589d9c49584441a9ef0c2f9300649f.svg"
															alt="Hỗ trợ 24/7 Với các kênh chat, email &amp; phone">
													</span> Hỗ trợ 24/7<br> Với các kênh chat, email &amp; phone
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="site-related mt-5">
					<div class="title">
						<div class=" d-flex align-items-center justify-content-center">
							<h2 class="text-dark-emphasis">Sản phẩm liên quan</h2>
						</div>
						<div class="d-flex align-items-center justify-content-center">
							<div class="line-black bg-dark "
								style="width: 200px; height: 3px"></div>
						</div>
					</div>
					<div class="section-flashsale listCarousel ">
						<c:forEach var="p" items="${listProduct}" varStatus="i">
							<c:if test="${!p.is_del && p.product_id != pd.product_id}">
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
																		<span class="p-1 text-bg-dark">Tạm hết hàng</span>
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
												<button type="button"
													class="btn btn-outline-primary  float-xl-start">Thêm
													vào giỏ</button>
												<a class="btn btn-outline-primary  float-xl-end" href="#"
													role="button">Mua ngay</a>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<%@ include file="/components/footer.jsp"%>
		</footer>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/slick-carousel.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/cart.js"></script>
	<script
		src="<c:url value="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.js" />"></script>
</body>
</html>