$(document).ready(function() {
	console.log(112312132)
	$('.addToCart').click(function() {
		let productId = $(this).data('product-id');
		let price = $(this).data('product-price');
		let isLoggedIn = $(this).data('user-id') !== '';
		if (!isLoggedIn) {
			console.log(12)
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: 'Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng!',
				confirmButtonColor: '#dc3545',
				confirmButtonText: 'Đăng nhập'
			}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = '/nguyentcpc04750_ASM/account/sign-in';
				}
			});
		} else {
			$.ajax({
				type: 'POST',
				url: '/nguyentcpc04750_ASM/add-to-cart',
				data: {
					product_id: productId,
					price: price
				},
				success: function(response) {
					if (response == 'fail') {
						Swal.fire({
							icon: 'warning',
							title: 'Sản phẩm đã có trong giỏ hàng !',
							showConfirmButton: true
						});
					} else if (response == 'success') {
						Swal.fire({
							icon: 'success',
							title: 'Thêm vào giỏ hàng thành công !',
							showConfirmButton: false,
							timer: 1500
						});
						updateCartInfo(productId);
					}
				},
				error: function(xhr, status, error) {
					Swal.fire({
						icon: 'success',
						title: 'Thêm vào giỏ hàng thất bại',
						text: "Có lỗi xảy ra, vui lòng thử lại !",
						showConfirmButton: false,
						timer: 1500
					});

					console.log('Đã xảy ra lỗi khi thêm vào giỏ hàng!');
				}
			});

		}
	});
	function formatCurrency(number) {
		// Định dạng số thành dạng ###,###,###
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	}
	function updateCartInfo(productId) {
		$.ajax({
			type: "GET",
			url: "/nguyentcpc04750_ASM/get-cart-info", // Đặt đường dẫn tới servlet để lấy thông tin giỏ hàng ở đây
			data: {
				product_id: productId,
			},
			dataType: "json",
			success: function(response) {
				var cartCount = response.cartCount;
				var productName = response.productName;
				var originalPrice = response.originalPrice;
				var discountedPrice = response.discountedPrice;
				var productId = response.productId;
				var quantity = response.quantity;
				var image = response.image;
				$('#sizeCart').html(cartCount);
				
				var listItem = $("<li>", { class: "list-group-item my-2 p-0" });
				var productInfo = $("<div>", { class: "row mb-2 border" });
				productInfo.append($("<div>", { class: "col-2 d-flex align-items-center" }).append($("<a>", {
					href: "/nguyentcpc04750_ASM/products/" + productId,
					class: ""
				}).append($("<img>", {
					src: "/nguyentcpc04750_ASM//assets/img/product/" + image,
					class: "img-thumbnail rounded float-start",
					alt: "image-alt",
					width: "80px"
				}))));
				var productDetails = $("<div>", { class: "col-9 ps-0" });
				productDetails.append($("<a>", {
					href: "/nguyentcpc04750_ASM/products/" + productId,
					class: "text-dark text-decoration-none fw-bold text-wrap",
					text: productName
				}));
				var quantityDiv = $("<div>", { class: "row mt-4" });
				quantityDiv.append($("<div>", { class: "col-4" }).append($("<input>", {
					type: "number",
					class: "form-control form-control-sm float-start",
					value: quantity,
					min: "1",
					style: "width: 50%"
				})));
				var priceDiv = $("<div>", { class: "col-8 float-end" });
				if (discountedPrice < originalPrice) {
					priceDiv.append($("<span>", {
						class: "text-muted text-decoration-line-through me-2",
						text: formatCurrency(discountedPrice) + " ₫"
					}));
				}
				priceDiv.append($("<span>", { class: "fw-bold float-end text-danger", text: formatCurrency(originalPrice) + " ₫" }));
				quantityDiv.append(priceDiv);
				productDetails.append(quantityDiv);
				productInfo.append(productDetails);
				productInfo.append($("<div>", { class: "col-1 p-0" }).append($("<button>", {
					class: "btn btn-default border-0 fw-bold ps-0",
					onclick: "removeCartItem(" + "${cart.cart_id}" + ")",
					html: "<i class='bi bi-x-lg'></i>"
				})));
				listItem.append(productInfo);

				// Thêm phần tử li chứa thông tin sản phẩm vào ul
				$("#listProductCart").append(listItem);
			},
			error: function(error) {
				console.log("Đã xảy ra lỗi khi thêm vào giỏ hàng: " + error);
			}
		});
	}

	$('.delete-button').click(function() {
		var cartId = $(this).data("cart-id");
		deleteCartItem(cartId);
	});
	function deleteCartItem(cartId) {
		console.log(cartId)
	}
});


