document.addEventListener("DOMContentLoaded", function() {
	let cardTitles = document.querySelectorAll(".card-title");
	cardTitles.forEach(function(cardTitle) {
		cardTitle.classList.add("clamp-two-lines");
	});
	console.log(1)
	// let endDay = $('#your-countdown').data('end-day');
	let endDay = '2023-07-19'
	let countdownElement = $('#your-countdown');

	// Chuyển đổi dữ liệu từ thuộc tính 'data-end-day' thành đối tượng Date
	let endDate = new Date(endDay);
	let currentDate = new Date();

	// Kiểm tra nếu ngày hiện tại lớn hơn ngày kết thúc khuyến mãi
	if (currentDate > endDate) {
		// Hiển thị dòng text "Khuyến mãi đã kết thúc" thay vì countdown
		countdownElement.html('Khuyến mãi đã kết thúc');
	} else {
		// Thực hiện countdown
		countdownElement.countdown(endDate, function(event) {
			$(this).html(event.strftime('%D ngày %H giờ %M phút %S giây'));
		});
	}
});
