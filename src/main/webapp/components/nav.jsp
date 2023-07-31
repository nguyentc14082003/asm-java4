<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container">
	<nav
		class="navbar navbar-expand-lg bg-white fixed-top p-0 shadow  nav-underline">
		<div class="container-fluid ">
			<a class="navbar-brand  ms-5" href="/nguyentcpc04750_ASM/home-page"><img
				alt="N8Rubik"
				src="${pageContext.request.contextPath}/assets/img/logo/logo.png"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="true"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div
				class="collapse navbar-collapse d-lg-flex align-items-center justify-content-center"
				id="navbarNavDropdown">
				<ul class="navbar-nav ms-2">
					<li class="nav-item"><a class="nav-link"
						href="/nguyentcpc04750_ASM/about-us">Về chúng tôi</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/nguyentcpc04750_ASM/collections/flashsale">Khuyến mãi</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="/" role="button"
						data-bs-toggle="dropdown" aria-expanded="false" id="navProduct">
							Sản phẩm </a>
						<div class="dropdown-menu p-0 animate__animated animate__fadeIn"
							style="width: 270px" id="navProduct-Dropdown">
							<div class="p-1">
								<ul
									class="menu-main-lv2 d-flex p-0 align-items-top justify-content-center">
									<li class="m-3"><a
										href="/nguyentcpc04750_ASM/collections/all"
										class="fw-bold text-dark text-decoration-none">Hãng</a>
										<div class="sub-menu-lv3">
											<ul class="menu-main-lv3">
												<li><a href="/nguyentcpc04750_ASM/collections/gan"
													class="hang-item">GAN</a></li>
												<li><a href="/nguyentcpc04750_ASM/collections/moyu"
													class="hang-item ">MOYU</a></li>
												<li><a href="/nguyentcpc04750_ASM/collections/qiyi"
													class="hang-item">QIYI</a></li>
												<li><a href="/nguyentcpc04750_ASM/collections/yongjun"
													class="hang-item ">YONGJUN</a></li>
												<li><a href="/nguyentcpc04750_ASM/collections/dayan"
													class="hang-item ">DAYAN</a></li>
											</ul>
										</div></li>
									<li class="m-3"><a
										href="/nguyentcpc04750_ASM/collections/all"
										class="fw-bold text-dark text-decoration-none">Rubik Cơ
											Bản</a>
										<div class="sub-menu-lv3">
											<ul class="menu-main-lv3">
												<li><a
													href="/nguyentcpc04750_ASM/collections/rubik-co-ban-2x2"
													class="hang-item">2x2</a></li>
												<li><a
													href="/nguyentcpc04750_ASM/collections/rubik-co-ban-3x3"
													class="hang-item">3x3</a></li>
												<li><a
													href="/nguyentcpc04750_ASM/collections/rubik-co-ban-4x4"
													class="hang-item">4x4</a></li>
												<li><a
													href="/nguyentcpc04750_ASM/collections/rubik-co-ban-5x5"
													class="hang-item">5x5</a></li>
											</ul>
										</div></li>
								</ul>
							</div>
						</div></li>

					<li class="nav-item"><a class="nav-link"
						href="/nguyentcpc04750_ASM/contact">Liên hệ</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/nguyentcpc04750_ASM/tutorial">Hướng dẫn chơi</a></li>
				</ul>
				<form action="/nguyentcpc04750_ASM/search" method="get"
					class="d-flex mx-3">
					<input class="form-control me-2" type="text"
						placeholder="Nhập tên sản phẩm" name="search" required
						autocomplete="off">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div class="site-action ms-5 d-flex  mt-xs-5 align-middle">
					<div class="site-action-account mx-3 ">
						<div class="dropdown">
							<c:if test="${user !=null }">
								<span class="fs-6 align-middle ">${user.username }</span>
							</c:if>
							<button type="button" class="btn btn-default fs-3  btnAccount"
								data-bs-toggle="dropdown" aria-expanded="false"
								data-bs-auto-close="outside">
								<i class="bi bi-person-circle"></i>
							</button>
							<div
								class="dropdown-menu dropdown-menu-xs-start dropdown-menu-lg-end"
								id="dropdown-account">
								<c:choose>
									<c:when test="${user == null }">
										<div class="site-login">
											<form class="px-4 py-3"
												action="/nguyentcpc04750_ASM/account/sign-in" method="post">
												<div class="form-floating mb-3">
													<input type="text" class="form-control" name="lGusername"
														id="floatingInputGroup1" placeholder="Username"
														value="${lGusername}" required> <label
														for="floatingInputGroup1">Username</label>
												</div>
												<div class="form-floating">
													<input type="password" class="form-control"
														id="floatingPassword" placeholder="Password"
														name="lGpassword" value="${lGpassword}" required>
													<label for="floatingPassword">Password</label>
												</div>
												<div class="mb-3">
													<div class="form-check">
														<input type="checkbox" class="form-check-input"
															id="dropdownCheck" name="cboRemember"> <label
															class="form-check-label" for="dropdownCheck"> Ghi
															nhớ đăng nhập </label>
													</div>
												</div>
												<button type="submit" class="btn btn-primary">Đăng
													nhập</button>
											</form>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item  m-0"
												href="/nguyentcpc04750_ASM/account/sign-up">Khách hàng
												mới ? Tạo tài khoản</a> <a class="dropdown-item m-0"
												href="/nguyentcpc04750_ASM/account/forgot-password">Quên
												mật khẩu</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="site-user">
											<div class="list-group list-group-flush">
												<a href="/nguyentcpc04750_ASM/account/edit-profile"
													class="list-group-item list-group-item-action">Thông
													tin cá nhân</a> <a href="#"
													class="list-group-item list-group-item-action">Đơn mua</a>
												<a href="/nguyentcpc04750_ASM/account/change-password"
													class="list-group-item list-group-item-action">Thay đổi
													mật khẩu</a> <a href="/nguyentcpc04750_ASM/account/sign-out"
													class="list-group-item list-group-item-action">Đăng
													xuất</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="site-action-cart mx-3">
						<div class="dropdown">
							<c:choose>
								<c:when
									test="${fn:contains(pageContext.request.requestURI, 'cart')}">
									<a type="button"
										class="btn btn-default fs-2 btnAccount position-relative p-0"
										href="/nguyentcpc04750_ASM/cart" role="button"> <i
										class="bi bi-cart"></i> <c:if test="${user!=null }">
											<span
												class="position-absolute top-0 fs-6 start-100 translate-middle badge rounded-pill bg-danger sizeCart">
												${sizeInCart} </span>
										</c:if>
									</a>
								</c:when>
								<c:otherwise>
									<div class="d-sm-none d-block">
										<a type="button"
											class="btn btn-default fs-2 btnAccount position-relative p-0"
											href="/nguyentcpc04750_ASM/cart" role="button"> <i
											class="bi bi-cart"></i> <c:if test="${user!=null }">
												<span
													class="position-absolute top-0 fs-6 start-100 translate-middle badge rounded-pill bg-danger sizeCart">
													${sizeInCart} </span>
											</c:if>
										</a>
									</div>
									<div class="d-none d-sm-block">
										<button type="button"
											class="btn btn-default fs-2 btnAccount position-relative p-0"
											data-bs-toggle="dropdown" aria-expanded="false"
											data-bs-auto-close="outside">
											<i class="bi bi-cart"></i>
											<c:if test="${user!=null }">
												<span
													class="position-absolute top-0 fs-6 start-100 translate-middle badge rounded-pill bg-danger"
													id="sizeCart"> ${sizeInCart} </span>
											</c:if>
										</button>
										<div
											class="dropdown-menu dropdown-menu-xs-start dropdown-menu-lg-end px-3 animate__animated animate__zoomIn"
											id="dropdown-cart">
											<div class="card border-0">
												<div class="card-header text-center">
													<h3>Giỏ hàng</h3>
												</div>
												<c:choose>
													<c:when test="${user == null }">
														<div class="none-login d-flex">
															<span class="text-danger text-center">Vui lòng
																đăng nhập</span>
														</div>
													</c:when>
													<c:otherwise>
														<div class="have-login"
															style="max-height: 300px; overflow-y: auto; overflow-x: hidden;">
															<ul class="list-group list-group-flush">
																<li class="list-group-item my-2 p-0"
																	id="listProductCart"><c:forEach var="cart"
																		items="${carts}">
																		<div class="row mb-2 border productInCart"
																			id="${cart.cart_id}">
																			<div class="col-2 d-flex align-items-center">
																				<a
																					href="/nguyentcpc04750_ASM/products/${cart.product.product_id }"
																					class=""> <img
																					src="${pageContext.request.contextPath}/assets/img/product/${cart.product.image}"
																					class="img-thumbnail rounded float-start"
																					alt="${cart.product.image}" width="80px">
																				</a>
																			</div>
																			<div class="col-9 ps-0">
																				<a
																					href="/nguyentcpc04750_ASM/products/${cart.product.product_id }"
																					class="text-dark text-decoration-none fw-bold text-wrap card-title">${cart.product.product_name}</a>
																				<div class="row mt-4">
																					<div class="col-4">
																						<input type="number"
																							class="form-control form-control-sm float-start input-quantity"
																							value="${cart.quantity}" min="1"
																							max="${cart.product.quantity_in_stock}"
																							style="width: 50%"
																							onchange="changeQuantityProduct(${cart.cart_id}, ${cart.product.product_id}, this.value,${cart.product.quantity_in_stock} )">
																					</div>
																					<div class="col-8 float-end">
																						<c:choose>
																							<c:when
																								test="${cart.product.promotionalDetailsList[0] != null}">
																								<span
																									class="text-muted text-decoration-line-through me-2"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${cart.product.original_price}" /> ₫</span>
																								<span class="fw-bold float-end text-danger">
																									<fmt:formatNumber type="number"
																										pattern="###,###"
																										value="${cart.product.promotionalDetailsList[0].discounted_price}" />
																									₫
																								</span>
																							</c:when>
																							<c:otherwise>
																								<!-- Hiển thị giá thường nếu sản phẩm không thuộc flash sale -->
																								<span class="fw-bold float-end text-danger"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${cart.product.original_price}" /> ₫</span>
																							</c:otherwise>
																						</c:choose>
																					</div>
																				</div>
																			</div>
																			<div class="col-1 p-0">
																				<button
																					class="btn btn-default border-0 fw-bold ps-0 delete-button"
																					onclick="removeCartItem(${cart.cart_id}, this)">
																					<i class='bi bi-x-lg'></i>
																				</button>
																			</div>
																		</div>
																	</c:forEach></li>
															</ul>
														</div>
														<div class="card-footer border-top">
															<div class="d-flex justify-content-between my-3">
																<span class="text-black fw-bold fs-5">Tổng tiền:
																</span> <span class="text-danger fw-bold fs-5 " id="totalCart"><fmt:formatNumber
																		type="number" pattern="###,###"
																		value="${totalPriceInCart}" /> đ</span>
															</div>
															<div class="row">
																<a class="btn btn-danger col-12"
																	href="/nguyentcpc04750_ASM/cart" role="button">Xem
																	giỏ hàng</a>
															</div>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>

