document.addEventListener("DOMContentLoaded", function() {
	let cardTitles = document.querySelectorAll(".card-title");
	cardTitles.forEach(function(cardTitle) {
		cardTitle.classList.add("clamp-two-lines");
	});

	let endDay = $('#your-countdown').data('end-day');
	let countdownElement = $('#your-countdown');

	//let endDate = new Date(endDay);
	// let currentDate = new Date();

	// if (currentDate > endDate) {
	//   countdownElement.html('Khuyến mãi đã kết thúc');
	//    let sectionFlashSale = document.querySelector(".section-flashsale");
	//       sectionFlashSale.style.display = "none";
	//} else {

	countdownElement.countdown(endDay, function(event) {
		$(this).html(event.strftime('%D ngày %H giờ %M phút %S giây'));
	});
	// }
});
