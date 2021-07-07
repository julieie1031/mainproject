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

<img src="../resources/images/banner2.png" alt="..." width="520px" height="150px">

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