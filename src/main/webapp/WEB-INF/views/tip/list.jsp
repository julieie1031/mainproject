<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous">
	</script>
<%@include file="../layout/header2.jsp"%>
<style>
.carousel {
	position: relative;
	height:150px;
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
/* 	margin-top: 30px; */
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
/* ?????? */

.notice-board {
	width: 100%;
}

.notice-body {
	width: 100%;
	height: 40px;
	font-size: 15px;
	padding-left: 30px;
	padding-top: 7px;
	border-bottom: 1px solid #d0cfcf;
	cursor: pointer;
}

.notice-body p {
	font-size: 10px;
	color: gray;
}

.adminregister {
	width: 100%;
	height: 35px;
	
}

.adminregister img {
	width: 35px;
	height: 35px;
	margin-left: 445px;
	display: flex;
	z-index:3;
}
.ul {
	list-style: none;
	float: right;
	display: inline;
	margin-top: 25px;
}

#li {
	float: left;
	margin-left: 4px;
}

.a {
	float: left;
	padding: 8px;
	margin-right: 5px;
	margin-bottom: 20px;
	width: 25px;
	height: 20px;
	color: #000;
	font: bold 15px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
}

.a:hover, .a:focus {
	color: #fff;
	border: 1px solid #B0B0B0;
	background-color: #B0B0B0;
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

/* .tipContent img {
	display: block;
	width: 130px;
	height: 130px;
	margin-left: 4px
} */

.tip_desc {
	padding: 10px;
	font-size: 13px;
}
.tipContent {
	width: 100%;
}

.tipContent ul {
	display: flex;
	flex-flow: column;
	justify-content: center;
	
}

.tipContent ul li {
	list-style: none;
	padding: 10px;
}

.tipContent ul li img {
	width: 150px;
	height: 150px;
	margin:-20px;
}

</style>


<body>
<script>
$(document).ready(function(){
	$('.adminregister img').on("click",function(){
		location.href="register"
	});
	var result = '<c:out value = "${result}"/>';

	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click",function(e) {
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
			});
	
	$(".tipContent").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type = 'hidden' name = 'tno' value = '"+ $(this).attr("id")+ "'>");
		actionForm.attr("action","/tip/get");
		actionForm.submit();
		});

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
var tnoValue = '<c:out value="${tip.tno}"/>';


})
</script>

	<!-- ?????? -->
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/images/banner2.png" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/resources/images/banner3.png" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/resources/images/banner1.png" class="d-block w-100"
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
		<!-- ?????? ??? -->
		<sec:authorize access="hasRole('ROLE_ADMIN')"><div class="adminregister">
			<img src="/resources/images/community/register.png" />
		</div></sec:authorize>
		
		
		
		<div style="clear: both; margin-top: 50px">
		<div class="title"
		onclick="tip_go()">
			
		</div>
		<div class="tip">
		<c:forEach var="list" items="${list}">
			<div class="tipContent" id=${list.tno }>
			<c:url value="/display" var="url"> <c:param name="fileName" value="${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}" /></c:url>
				<img src="${url }"/> 
				<div class="tip_desc">${list.tipTitle }</div>
			</div>
		<!-- 	<div class="tipContent">
				<img src="/resources/images/tip/burdock.jpg">
				<div class="tip_desc">????????? ?????? ????????? ???????</div>
			</div>
			<div class="tipContent">
				<img src="/resources/images/tip/dog.jpg">
				<div class="tip_desc">????????? ????????? ???????????? ???????????? ?????? ??????</div>
			</div>
			<div class="tipContent">
				<img src="/resources/images/tip/dog1.PNG">
				<div class="tip_desc">???????????? ?????? ??????</div>
			</div>
			<div class="tipContent">
				<img src="/resources/images/tip/dog2.jpg">
				<div class="tip_desc">???????????? ?????? ??? ????????? ??????</div>
			</div> -->




		</c:forEach>
		</div>
		<table style="float: center; width: 500px;">
	<tr>
		<td>
			<ul class="ul">
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button" id="li"><a class="a"
						href="${pageMaker.startPage-1 }">&laquo;&laquo;</a></li>
				</c:if>


				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class="paginate_button ${pageMaker.cri.pageNum==num?"
						active":""}" id="li"><a class="a" href="${num }">${num }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li class="paginate_button" id="li"><a class="a"
						href="${pageMaker.endPage+1 }">&raquo;&raquo;</a></li>
				</c:if>
			</ul>
		</td>
	</tr>
</table>
	</div>
	
	<form id='actionForm' action="/tip/list" method="get">
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='keyword'
			value='<c:out value = "${pageMaker.cri.keyword }"/>'> <input
			type='hidden' name='type'
			value='<c:out value = "${pageMaker.cri.type }"/>'>
	</form>
		<%@include file="../layout/footer.jsp"%>
</body>
</html>