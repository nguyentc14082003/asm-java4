<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.carousel-item a img {
	height: 600px;
	width: 1100px;
}
</style>
<div class="container" style="margin-top: 100px">
	<div class="fadeCarousel">
		<div class="carousel-item">
			<a href="https://www.youtube.com/watch?v=3mbI1s6Rnp0" target="_blank">
				<img src="./assets/img/banner/banner1.jpg" class="d-block w-100"
				alt="banner 1">
			</a>
		</div>
		<div class="carousel-item">
			<a href="#" target="_blank"> <img
				src="./assets/img/banner/banner2.png" class="d-block w-100"
				alt="banner 1">
			</a>
		</div>
		<div class="carousel-item">
			<a href="https://www.facebook.com/vncubeassociation" target="_blank">
				<img src="./assets/img/banner/banner3.jpg" class="d-block w-100"
				alt="banner 1">
			</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('.fadeCarousel').slick({
		dots : true,
		autoplay : true,
		autoplaySpeed : 1500,
		infinite : true,
		adaptiveHeight : true,
		arrows : false
	});
</script>


