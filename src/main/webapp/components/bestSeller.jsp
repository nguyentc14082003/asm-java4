<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<section class="site-bestSeller">
	<div class="container">
		<div class="title-site mb-3 d-flex">
			<h2 class="fw-bold">Tất cả sản phẩm</h2>
			<a href="collections/all" class="view-all-collection ms-auto">Xem
				tất cả</a>
		</div>
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
															<span class="p-1 text-bg-dark ms-3">Tạm hết hàng</span>
														</c:if>
													</div>
												</div>
												<c:set var="foundFlashSale" value="true" />
											</c:when>
										</c:choose>
									</c:forEach>

									<c:if test="${!foundFlashSale}">
										<span class="text-danger fw-bold"> <fmt:formatNumber
												type="number" pattern="###,###" value="${p.original_price}" />
											đ
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
			</c:forEach>
		</div>
		<div class="d-flex justify-content-center">
			<a class="btn btn-outline-dark btnXemThem align-middle" href="#"
				role="button">XEM THÊM SẢN PHẨM</a>
		</div>
	</div>
</section>
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