<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<style>
* {
	margin: 0;
	padding: 0;
}

.table-x {
	margin-left: 30px;
}

.jb-x-small {
	font-size: x-small;
}

.text-x {
	text-align: right;
	vertical-align: bottom;
}

a {
	text-decoration-line: none;
	color: black;
}

.img1 {
	position: relative;
	float: right;
	margin-left: 15px;
}

.img2 {
	align: right;
}

.line {
	border-bottom: 1px solid gray;
	padding-bottom: 10px;
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

.btn_search {
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 15px;
	height: 10px;
	cursor: pointer;
	outline: 0;
	float: right;
	outline: 0;
	border: 0;
}

.button {
	border: 0;
	outline: 0;
	background-color: white;
}

.paginate_button.active a {
	background-color: #B0B0B0;
}

.uploadResult {
	width: 100%;
}

.uploadResult ul {
	display: flex;
	flex-folw: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 190px;
	height: 179px;
}
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
	margin-bottom : 5px;
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

</style>


<%@include file="../layout/header2.jsp"%>

<form id='searchForm' action="/board/list" method='get'>
	<table>
		<tr class="img1">
			<td><select name='type' style="width: 110px; height: 23px">
					<option value=""
						<c:out value = "${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
					<option value="T"
						<c:out value = "${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C"
						<c:out value = "${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="W"
						<c:out value = "${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					<option value="TC"
						<c:out value = "${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
						or 내용</option>
					<option value="TW"
						<c:out value = "${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
						or 작성자</option>
					
			</select></td>

			<td><input type="text" name='keyword'
				style="width: 170px; height: 23px"
				value='<c:out value = "${pageMaker.cri.keyword }"/>' /> <input
				type='hidden' name='pageNum'
				value='<c:out value = "${pageMaker.cri.pageNum }"/>' /> <input
				type='hidden' name='amount'
				value='<c:out value = "${pageMaker.cri.amount }"/>' /></td>

			<td>
				<button class="button">
					<img src="../resources/images/community/search.png" width=40px
						height=40px style="cursor: pointer" />
				</button>
			</td>
			</form>


			<td style="padding-left: 110px;"><a href="/board/register"><img
					src="../resources/images/community/register.png" alt="..."
					width="40px" height="39px"
					style="margin-right: 10px; margin-top: 1px;"></a></td>

		</tr>

		<!-- <tr class="img2">
			<td><img src="../resources/images/banner2.png" alt="..."
				width="500px" height="150px"></td>
		</tr> -->
	</table>

<!-- 배너 -->
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="../resources/images/banner2.png" class="d-block w-100"
				alt="...">
		</div>
		<div class="carousel-item">
			<img src="../resources/images/banner3.png" class="d-block w-100"
				alt="...">
		</div>
		<div class="carousel-item">
      <img src="../resources/images/banner1.png" class="d-block w-100" alt="...">
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

	<div class="carousel-item active"></div>
	<div>
		<c:forEach var="listView" items="${list}">
			<table
				style="text-align: right; width: 500px; font-size: 13px; padding-left: 15px; padding-right: 15px;">
				<tr class="line">
					<td rowspan="5" width="100"
						style="text-align: left; font-size: 50px;"><a class='move'
						href='<c:out value = "${listView.bno }"/>'> ${listView.bno } </td>

				</tr>
				<tr>
					<td colspan="5" style="padding-bottom: 25px;"><a class='move'
						href='<c:out value = "${listView.bno }"/>'> <c:out
								value="${listView.title }" /></a></td>
				</tr>
				<tr>
					<td colspan="5" style="padding-bottom: 25px;"><a class='move'
						href='<c:out value = "${listView.bno }"/>'> ${listView.userId}</td>
				</tr>
				<tr>
					<td colspan="5" style="padding-bottom: 25px;"><a class='move'
						href='<c:out value = "${listView.bno }"/>'>
							${listView.boardUpdateDate}</td>
				</tr>
				<tr>
					<td width="15%"><img
						src="../resources/images/community/heart.png" alt="..."
						width="14px" height="13px">&nbsp;&nbsp;${listView.good}</td>
					<td width="15%"><img
						src="../resources/images/community/reply.png" alt="..."
						width="14px" height="13px">&nbsp;&nbsp;${listView.replyCnt}</td>
					<td width="15%"><img
						src="../resources/images/community/hit.png" alt="..." width="14px"
						height="13px">&nbsp;&nbsp;${listView.hit}</td>
				</tr>

				<tr>
					<td class="line" colspan="5"></td>
				</tr>

				</c:forEach>


			</table>
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


	<%@include file="../layout/footer.jsp"%>
	<form id='actionForm' action="/board/list" method="get">
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<!-- 키워드와 타입 추가 -->
		<input type='hidden' name='keyword'
			value='<c:out value = "${pageMaker.cri.keyword }"/>'> <input
			type='hidden' name='type'
			value='<c:out value = "${pageMaker.cri.type }"/>'>
	</form>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var result = '<c:out value = "${result}"/>';

							var actionForm = $("#actionForm");
							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							var searchForm = $("#searchForm");

							$(
									"#searchForm table tbody tr.img1 td:nth-child(3) button img")
									.on(
											"click",
											function(e) {
												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요");
													return false;
												}

												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요");
													return false;
												}

												searchForm
														.find(
																"input[name='pageNum']")
														.val("1");
												e.preventDefault();
												searchForm.submit();
											});

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
						var token = $("meta[name='_csrf']").attr("content");
						var header = $("meta[name='_csrf_header']").attr("content");
						$(document).ajaxSend(function(e, xhr, options) 
						{ 
						   xhr.setRequestHeader(header, token); 
						});
	</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
	</body>
	</html>