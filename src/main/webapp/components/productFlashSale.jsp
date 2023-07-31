
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container">
	<div class="list-product-content ">
		<div
			class="heading-listProduct bg-white p-3 d-flex align-items-center justify-content-between">
			<h1 class="">${title}</h1>
			<c:if test="${!checkDayTime}">
				<div class="styleCountdown d-flex align-items-center ms-3 mt-0">
					<span
						class="lof-clock-detail text-bg-warning rounded-3 p-1 fw-bold"
						id="your-countdown"
						data-end-day="<c:out value="${flashsale.end_day}" />"> </span>

				</div>
			</c:if>
			<c:if test="${checkDayTime}">
				<div class="styleCountdown d-flex align-items-center ms-3 mt-0">
					<span
						class="lof-clock-detail text-bg-warning rounded-3 p-1 fw-bold"
						id="not-now">Hết thời gian khuyến mãi </span>

				</div>
			</c:if>
		</div>
		<div class="filter-listProduct p-3 mt-3">
			<div class="row">
				<div class="col-xs-12 col-md-12 col-lg-3">
					<span class="fw-bold fs-5"><i class="bi bi-funnel"></i>Bộ
						lọc |</span>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-3">
					<div class="dropdown">
						<button class="btn btn-default border fw-bold dropdown-toggle "
							type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
							aria-expanded="false">Thương hiệu</button>
						<ul class="dropdown-menu p-2" aria-labelledby="dropdownMenuButton">
							<li class=""><input class="form-check-input" type="checkbox"
								value="" id="checkbox1"> <label class="form-check-label"
								for="checkbox1">GAN</label></li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox2"> <label
								class="form-check-label" for="checkbox2">QIYI</label></li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox3"> <label
								class="form-check-label" for="checkbox3">DAYAN</label></li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox3"> <label
								class="form-check-label" for="checkbox3">MOYU</label></li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox3"> <label
								class="form-check-label" for="checkbox3">YONGJUN</label></li>
						</ul>
					</div>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-3">
					<div class="dropdown">
						<button class="btn btn-default border fw-bold dropdown-toggle "
							type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown"
							aria-expanded="false">Lọc giá</button>
						<ul class="dropdown-menu p-2"
							aria-labelledby="dropdownMenuButton2">
							<li class=""><input class="form-check-input" type="checkbox"
								value="" id="checkbox1"> <label class="form-check-label"
								for="checkbox1">Dưới 200.000 đ</label></li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox2"> <label
								class="form-check-label" for="checkbox2">Dưới 400.000 đ</label>
							</li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox3"> <label
								class="form-check-label" for="checkbox3">Dưới 600.000 đ</label>
							</li>
							<li class="mt-2"><input class="form-check-input"
								type="checkbox" value="" id="checkbox3"> <label
								class="form-check-label" for="checkbox3">Dưới 800.000 đ</label>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-xs-4 col-md-4 col-lg-3">
					<select class="form-select fw-bold "
						aria-label="Default select example">
						<option selected>Giá: tăng dần</option>
						<option value="1">Giá: giảm dần</option>
						<option value="2">Tên: A - Z</option>
						<option value="3">Tên: Z - A</option>
					</select>
				</div>
			</div>
		</div>
		<div class="content-listProduct ">
			<div class="row">
				<c:if test="${!checkDayTime}">
					<c:forEach var="p" items="${listProduct}" varStatus="i">
						<c:forEach var="f" items="${listPdFlashsale}">
							<c:if test="${f.product.product_id == p.product_id}">
								<c:if test="${!p.is_del}">
									<div class="col-xs-6 col-lg-3 mb-3 " id="cardProduct-flashsale">
										<div class="card h-100">
											<a href="/nguyentcpc04750_ASM/products/${p.product_id}"><img
												src="${pageContext.request.contextPath}/assets/img/product/${p.image }"
												class="card-img-top" alt="${p.product_name }"
												style="object-fit: cover; height: 318px;"></a>
											<div class="card-body d-flex flex-column">
												<span class="text-muted">${p.manufacturer.manufacturer_name }</span>
												<a
													class="card-title fs-6 fw-bold text-black text-decoration-none"
													href="/nguyentcpc04750_ASM/products/${p.product_id }">${p.product_name }</a>
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
																class="btn btn-outline-primary  float-xl-start addToCart"
																data-product-id="${p.product_id}"
																data-user-id="${user.user_id}">Thêm vào giỏ</button>
															<a class="btn btn-outline-primary  float-xl-end" href="#"
																role="button">Mua ngay</a>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:if>
			</div>
			<div class="d-flex justify-content-center">
				<c:if test="${checkDayTime}">
					<span class="text-danger" style="margin-bottom: 500px">Vui
						lòng chờ đến sự kiện tiếp theo !</span>
				</c:if>

				<c:if test="${!checkDayTime}">
					<a class="btn btn-outline-dark btnXemThem align-middle" href="#"
						role="button">XEM THÊM SẢN PHẨM</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		const showMoreButton = document.querySelector('.btnXemThem');
		const products = document.querySelectorAll('#cardProduct');

		for (let i = 8; i < products.length; i++) {
			products[i].style.display = 'none';
		}

		showMoreButton.addEventListener('click', function(event) {
			event.preventDefault();

			let countShown = 0;
			for (let i = 8; i < products.length; i++) {
				if (products[i].style.display === 'none') {
					products[i].style.display = 'block';
					countShown++;
				}

				if (countShown === 8) {
					break;
				}
			}

			if (countShown < 8) {
				showMoreButton.style.display = 'none';
			}
		});
	});
</script>

