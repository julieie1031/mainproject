<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<style>
.carousel {
	position: relative;
}

.carousel.pointer-event {
	touch-action: pan-y;
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
}

.carousel-inner::after {
	display: block;
	clear: both;
	content: "";
}

.carousel-item {
	position: relative;
	display: none;
	float: left;
	width: 100%;
	margin-right: -100%;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	transition: transform 0.6s ease-in-out;
	/*   height:100px; */
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-item {
		transition: none;
	}
}

.carousel-item.active, .carousel-item-next, .carousel-item-prev {
	display: block;
}

/* rtl:begin:ignore */
.carousel-item-next:not(.carousel-item-start), .active.carousel-item-end
	{
	transform: translateX(100%);
}

.carousel-item-prev:not(.carousel-item-end), .active.carousel-item-start
	{
	transform: translateX(-100%);
}

/* rtl:end:ignore */
.carousel-fade .carousel-item {
	opacity: 0;
	transition-property: opacity;
	transform: none;
}

.carousel-fade .carousel-item.active, .carousel-fade .carousel-item-next.carousel-item-start,
	.carousel-fade .carousel-item-prev.carousel-item-end {
	z-index: 1;
	opacity: 1;
}

.carousel-fade .active.carousel-item-start, .carousel-fade .active.carousel-item-end
	{
	z-index: 0;
	opacity: 0;
	transition: opacity 0s 0.6s;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-fade .active.carousel-item-start, .carousel-fade .active.carousel-item-end
		{
		transition: none;
	}
}

.carousel-control-prev, .carousel-control-next {
	position: absolute;
	top: 0;
	bottom: 0;
	z-index: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 15%;
	padding: 0;
	color: #fff;
	text-align: center;
	background: none;
	border: 0;
	opacity: 0.5;
	transition: opacity 0.15s ease;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-control-prev, .carousel-control-next {
		transition: none;
	}
}

.carousel-control-prev:hover, .carousel-control-prev:focus,
	.carousel-control-next:hover, .carousel-control-next:focus {
	color: #fff;
	text-decoration: none;
	outline: 0;
	opacity: 0.9;
}

.carousel-control-prev {
	left: 0;
}

.carousel-control-next {
	right: 0;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	display: inline-block;
	width: 2rem;
	height: 2rem;
	background-repeat: no-repeat;
	background-position: 50%;
	background-size: 100% 100%;
}

/* rtl:options: {
  "autoRename": true,
  "stringMap":[ {
    "name"    : "prev-next",
    "search"  : "prev",
    "replace" : "next"
  } ]
} */
.carousel-control-prev-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3e%3c/svg%3e");
}

.carousel-control-next-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.carousel-indicators {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 2;
	display: flex;
	justify-content: center;
	padding: 0;
	margin-right: 15%;
	margin-bottom: 1rem;
	margin-left: 15%;
	list-style: none;
}

.carousel-indicators [data-bs-target] {
	box-sizing: content-box;
	flex: 0 1 auto;
	width: 30px;
	height: 3px;
	padding: 0;
	margin-right: 3px;
	margin-left: 3px;
	text-indent: -999px;
	cursor: pointer;
	background-color: #fff;
	background-clip: padding-box;
	border: 0;
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
	opacity: 0.5;
	transition: opacity 0.6s ease;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-indicators [data-bs-target] {
		transition: none;
	}
}

.carousel-indicators .active {
	opacity: 1;
}

.carousel-caption {
	position: absolute;
	right: 15%;
	bottom: 1.25rem;
	left: 15%;
	padding-top: 1.25rem;
	padding-bottom: 1.25rem;
	color: #fff;
	text-align: center;
}

.carousel-dark .carousel-control-prev-icon, .carousel-dark .carousel-control-next-icon
	{
	filter: invert(1) grayscale(100);
}

.carousel-dark .carousel-indicators [data-bs-target] {
	background-color: #000;
}

.carousel-dark .carousel-caption {
	color: #000;
}

.carousel-item img {
	width: 100%;
	height: 150px;
	display: block;
	margin-top: 30px;
}

.visually-hidden, .visually-hidden-focusable:not(:focus):not(:focus-within)
	{
	position: absolute !important;
	width: 1px !important;
	height: 1px !important;
	padding: 0 !important;
	margin: -1px !important;
	overflow: hidden !important;
	clip: rect(0, 0, 0, 0) !important;
	white-space: nowrap !important;
	border: 0 !important;
}

.carousel-control-prev:hover, .carousel-control-prev:focus,
	.carousel-control-next:hover, .carousel-control-next:focus {
	color: #000;
	text-decoration: none;
	outline: 0;
	opacity: 0.9;
}

.top {
	overflow: hidden;
	width: 100%;
	height: 270px;
}

div.category {
	margin: 10px;
	padding-left: 5px;
	padding-bottom: 10px;
	float: left;
	width: 100px;
	height: 100px;
	font-family: 'BMJUA';
	cursor: pointer;
}

div.category img {
	display: block;
	width: 80px;
	height: auto;
	margin-left: 8px
}

div.desc {
	padding: 10px;
	text-align: center;
	font-size: 14px;
}

div.test {
	width: 100%;
	font-size: 300px;
}

.noticeTable {
	font-size: 15px;
	float: left;
	width: 450px;
	height: 30px;
	border-top: 1px solid #d0cfcf;
	border-bottom: 1px solid #d0cfcf;
	margin-left: 26px;
	text-align: center;
}

.title {
	font-size: 10px;
	margin-bottom: 10px;
	margin-left: 25px;
	color: #6b6a6a;
}

.rankTable {
	font-size: 15px;
	float: left;
	width: 450px;
	height: 30px;
	margin-left: 26px;
	text-align: center;
	margin-bottom: 15px;
}

.rankTable td, a {
	border-bottom: 1px solid #d0cfcf;
	text-align: left;
	text-decoration:none;
	color : black;
}

.tip {
	width: 100%;
	height: 430px;
	margin: 10px;
}

div.tipContent {
	margin: 10px;
	padding-left: 5px;
	padding-bottom: 40px;
	float: left;
	width: 130px;
	height: 130px;
}

.tipContent img {
	display: block;
	width: 130px;
	height: 130px;
	margin-left: 4px
}

.tip_desc {
	padding: 10px;
	font-size: 13px;
}
</style>
<script>
	function notice_go() {
		location.href = "notice/list"
	}
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous">
	
</script>
<%@include file="layout/header.jsp"%>

<!-- 배너 -->
<div id="carouselExampleControls" class="carousel slide"
	data-bs-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="resources/images/banner2.png" class="d-block w-100"
				alt="...">
		</div>
		<div class="carousel-item">
			<img src="resources/images/banner3.png" class="d-block w-100"
				alt="...">
		</div>
		<div class="carousel-item">
			<img src="resources/images/banner1.png" class="d-block w-100"
				alt="...">
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleControls" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>


<!-- 배너 끝 -->

<!-- 카테고리 -->
<div class="top">

	<div class="category" onclick="category(2)">
		<img src="resources/images/category/cafe.png">
		<div class="desc">카페</div>
	</div>
	<div class="category" onclick="category(1)">
		<img src="resources/images/category/hospital.png">
		<div class="desc">동물병원</div>
	</div>
	<div class="category" onclick="category(5)">
		<img src="resources/images/category/park.png">
		<div class="desc">놀이터</div>
	</div>
	<div class="category" onclick="category(7)">
		<img src="resources/images/category/pet hotel.png">
		<div class="desc">호텔</div>
	</div>
	<div class="category" onclick="category(3)">
		<img src="resources/images/category/restaurant.png">
		<div class="desc">맛집</div>
	</div>
	<div class="category" onclick="category(4)">
		<img src="resources/images/category/school.png">
		<div class="desc">유치원</div>
	</div>
	<div class="category" onclick="category(6)">
		<img src="resources/images/category/salon.png">
		<div class="desc">미용</div>
	</div>
</div>
<!-- 카테고리 끝 -->

<!-- 공지 -->

<div>
	<table class="noticeTable">
		<colgroup>
			<col style="width: 92px">
			<col style="width: auto">


		</colgroup>

		<tr>
			<td onclick="notice_go()" style="border-right: 1px solid #d0cfcf">공지</td>
			<td>공지사항입니다.</td>

		</tr>
	</table>
</div>
<!-- 공지 끝 -->

<form id='actionForm' action="/board/list" method="get">
	<!-- 인기 게시글 -->
	<div style="clear: both; margin-top: 50px">
		<div class="title">
			<h3>인기 게시글</h3>
		</div>
		<c:forEach var="view" items="${hit}">
		<table class="rankTable">
			<colgroup>
				<col style="width: 80px">
				<col style="width: auto">
			</colgroup>

			<tr>
				<td style="font-size: 40px"><a class='move'
					href='<c:out value = "${view.bno }"/>'> ${view.bno }</td>
			</tr>
			<tr>

				<td><img src="../resources/images/community/reply.png"
					alt="..." width="15px" height="14px">&nbsp;&nbsp;${view.replyCnt}</td>
				<td><img src="../resources/images/community/hit.png" alt="..."
					width="16px" height="13px">&nbsp;&nbsp;${view.hit}</td>
			</tr>
			<tr>
				<td><a class='move' href='<c:out value = "${view.bno }"/>'>
						${view.userId} </td>

				<td><a class='move' href='<c:out value = "${view.bno }"/>'>
						<fmt:formatDate pattern="yyyy-MM-dd HH:MM:ss"
							value="${view.boardUpdateDate}" /></td>
			</tr>
</c:forEach>
		</table>
	</div>
	
</form>
<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
	<!-- 인기 게시글 끝 -->


	<!-- 상식팁 -->
	<div style="clear: both; margin-top: 50px">
		<div class="title">
			<h3>오늘의 상식 TIP!</h3>
		</div>
		<div class="tip">
			<div class="tipContent">
				<img src="resources/images/tip/apple.jpg">
				<div class="tip_desc">강아지 사과 먹어도 될까?</div>
			</div>
			<div class="tipContent">
				<img src="resources/images/tip/burdock.jpg">
				<div class="tip_desc">강아지 우엉 먹어도 될까?</div>
			</div>
			<div class="tipContent">
				<img src="resources/images/tip/dog.jpg">
				<div class="tip_desc">혓바닥 색으로 알아보는 강아지의 건강 상태</div>
			</div>
			<div class="tipContent">
				<img src="resources/images/tip/dog1.PNG">
				<div class="tip_desc">강아지와 여행 가기</div>
			</div>
			<div class="tipContent">
				<img src="resources/images/tip/dog2.jpg">
				<div class="tip_desc">강아지가 아플 때 보내는 신호</div>
			</div>




		</div>
	</div>

	<!-- 상식팁 끝  -->





	<script>
		function category(number) {
			document.location.href = "location?category=" + number;
		};
		var actionForm = $("#actionForm");
		$(document).ready(
				function() {
					$(".move")
					.on(
							"click",
							function(e) {
								e.preventDefault();
								//console.log('click');
								actionForm
										.append("<input type = 'hidden' name = 'bno' value = '"
												+ $(this).attr(
														"href")
												+ "'>");
								actionForm.attr("action",
										"/board/get");
								actionForm.submit();
							});

		});//end javascript
				
	</script>

	<%@include file="layout/footer.jsp"%>