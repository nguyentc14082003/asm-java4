document.addEventListener("DOMContentLoaded", function() {
	let cardTitles = document.querySelectorAll(".card-title");
	cardTitles.forEach(function(cardTitle) {
		cardTitle.classList.add("clamp-two-lines");
	});
});

let endDay = $('#your-countdown').data('end-day');


$(document).ready(function() {
	// Cấu hình và khởi tạo Countdown
	$('#your-countdown').countdown(endDay, function(event) {
		$(this).html(event.strftime('%D ngày %H giờ %M phút %S giây'));
	});
});
 