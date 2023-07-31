$(document).ready(function() {
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
						icon: 'error',
						title: 'Thêm vào giỏ hàng thất bại',
						text: "Có lỗi xảy ra, vui lòng thử lại !",
						showConfirmButton: false,
						timer: 1500
					});
				}
			});

		}
	});

	function updateCartInfo(productId) {
		$.ajax({
			type: "GET",
			url: "/nguyentcpc04750_ASM/get-cart-info", // Đặt đường dẫn tới servlet để lấy thông tin giỏ hàng ở đây
			data: {
				product_id: productId,
			},
			dataType: "json",
			success: function(response) {
				var cartId = response.cartId;
				var cartCount = response.cartCount;
				var productName = response.productName;
				var originalPrice = response.originalPrice;
				var discountedPrice = response.discountedPrice;
				var productId = response.productId;
				var quantity = response.quantity;
				var image = response.image;
				var totalCart = response.totalPrice;
				var quantityInStock;
				$('#sizeCart').html(cartCount);
				$('#totalCart').html(formatCurrency(totalCart));

				var listItem = $("<li>", { class: "list-group-item my-2 p-0" });
				var productInfo = $("<div>", { class: "row mb-2 border", id: cartId });
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
				var inputElement = $("<input>", {
					type: "number",
					class: "form-control form-control-sm float-start input-quantity",
					value: quantity,
					min: "1",
					max: quantityInStock,
					style: "width: 50%"
				});

				// Thêm sự kiện onchange và truyền thêm giá trị của thẻ input
				inputElement.on("change", function() {
					var newQuantity = $(this).val(); // Lấy giá trị mới của thẻ input
					changeQuantityProduct(cartId, productId, newQuantity); // Gọi hàm với tham số mới
				});

				quantityDiv.append($("<div>", { class: "col-4" }).append(inputElement));

				var priceDiv = $("<div>", { class: "col-8 float-end" });
				if (discountedPrice < originalPrice) {
					priceDiv.append($("<span>", {
						class: "text-muted text-decoration-line-through me-2",
						text: formatCurrency(originalPrice) + " ₫"
					}));
				}
				priceDiv.append($("<span>", { class: "fw-bold float-end text-danger", text: formatCurrency(discountedPrice) + " ₫" }));
				quantityDiv.append(priceDiv);
				productDetails.append(quantityDiv);
				productInfo.append(productDetails);
				productInfo.append($("<div>", { class: "col-1 p-0" }).append($("<button>", {
					class: "btn btn-default border-0 fw-bold ps-0",
					onclick: "removeCartItem(" + cartId + ")",
					html: "<i class='bi bi-x-lg'></i>"
				})));
				listItem.append(productInfo);

				// Thêm phần tử li chứa thông tin sản phẩm vào ul
				$("#listProductCart").append(productInfo);
			},
			error: function(error) {
				console.log("Đã xảy ra lỗi khi thêm vào giỏ hàng: " + error);
			}
		});
	}



});
function formatCurrency(number) {
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

function changeQuantityProduct(cartId, productId, quantity, quantityInStock) {
	if (quantity <= 0) {
		Swal.fire({
			icon: 'error',
			title: 'Opps....',
			text: "Vui lòng nhập số lượng lớn hơn 0 !",
			showConfirmButton: true,
		});
		// Đặt lại giá trị của input về 1
		$(".input-quantity").val(1);
		return;
	} else if (quantity > quantityInStock) {
		Swal.fire({
			icon: 'error',
			title: 'Opps....',
			text: "Số lượng vượt quá số lượng tồn kho !",
			showConfirmButton: true,
		});
		// Đặt lại giá trị của input về 1
		$(".input-quantity").val(1);
		return;
	} else {
		$.ajax({
			url: "/nguyentcpc04750_ASM/update-product-cart",
			type: "POST",
			data: {
				cart_id: cartId,
				product_id: productId,
				quantity: quantity
			},
			success: function(resp) {
				if (resp == 'fail') {
					Swal.fire({
						icon: 'error',
						title: 'Opps....',
						text: "Có lỗi xảy ra khi thay đổi số lượng !",
						showConfirmButton: true,
					});
				}
			},
			error: function(error) {
				alert("Something error ! " + error);
			}
		})
	}
}

function removeCartItem(cartId, buttonElement) {
	// Gọi đến Servlet sử dụng Ajax để xóa sản phẩm khỏi giỏ hàng
	$.ajax({
		url: "/nguyentcpc04750_ASM/delete-product-cart",
		type: "POST",
		data: {
			cart_id: cartId
		},
		success: function(response) {
			console.log(response.cartCount);
			console.log(response.totalPrice);
			let cartCount = response.cartCount;
			let totalPrice = response.totalPrice;
			$('#sizeCart').html(cartCount);
			$('#totalCart').html(formatCurrency(totalPrice));
			let cartItem = document.getElementById(cartId);
			cartItem.remove();
		},
		error: function(error) {
			console.log("Đã xảy ra lỗi khi xóa sản phẩm khỏi giỏ hàng: " + error);
		}
	});
}