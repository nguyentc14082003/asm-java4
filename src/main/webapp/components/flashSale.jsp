<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<section class="site-flashSale mb-3">
	<div class="container">
		<div class="section-heading text-center d-flex ">
			<div class="title-flashsale">
				<h2 class="hTitle">
					<a href="#"> <img
						src="${pageContext.request.contextPath}/assets/img/logo/flash-sale.png"
						alt="Sale Off 70%">
					</a>
				</h2>
			</div>
			<c:if test="${!checkDayTime}">
				<div class="styleCountdown d-flex align-items-center ms-3 mt-0">
					<span
						class="lof-clock-detail text-bg-warning rounded-3 p-1 fw-bold"
						id="your-countdown"
						data-end-day="<c:out value="${flashsale.end_day}" />"> </span>

				</div>
				<a href="collections/flashsale" class="view-all-collection ms-auto">Xem
					tất cả</a>
			</c:if>
			<c:if test="${checkDayTime}">
				<div class="styleCountdown d-flex align-items-center ms-3 mt-0">
					<span
						class="lof-clock-detail text-bg-warning rounded-3 p-1 fw-bold"
						id="not-now">Hết thời gian khuyến mãi </span>

				</div>
			</c:if>
		</div>
		<div class="section-flashsale listCarousel ">
			<c:if test="${!checkDayTime}">
				<c:forEach var="p" items="${listProduct}" varStatus="i">
					<c:forEach var="f" items="${listPdFlashsale}">
						<c:if test="${f.product.product_id == p.product_id}">
							<c:if test="${!p.is_del}">
								<div class="col-xs-6 col-lg-3 mb-3 " id="cardProduct-flashsale">
									<div class="card h-100">
										<input type="hidden" name="product_id" value="${p.product_id}">
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
	</div>
</section>

