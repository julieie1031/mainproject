<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	margin-top: 30px;
}

.img2 {
	align: right;
}

.line {
	border-bottom: 1px solid black;
}
</style>


<%@include file="../layout/header.jsp"%>


<table>
	<tr class="img1">
		<td><a href="/board/register"> <img
				src="../resources/images/community/register.png" alt="..."
				width="40px" height="39px"></a></td>
		<td><img src="../resources/images/community/search.png" alt="..."
			width="40px" height="35px"
			style="margin-left: 10px; margin-right: 7px"></td>
	</tr>

	<tr class="img2">
		<td><img src="../resources/images/banner2.png" alt="..."
			width="500px" height="150px"></td>
	</tr>
</table>




<div class="carousel-item active"></div>
<div>

	<table style="text-align: right; width: 500px; font-size: 13px">


		<c:forEach var="listView" items="${list}">
			<tr class="line">
				<td rowspan="5" width="100"><img
					src="../resources/images/community/dog.png" width="170px"
					height="170px" align="left"></td>

			</tr>
			<tr>
				<td colspan="4"><a style="font-color: blue;"
					href="/board/get?bno=${listView.bno}">${listView.title}</a></td>
			</tr>
			<tr>
				<td colspan="4">${listView.content}</td>
			</tr>
			<tr>
				<td colspan="4">${listView.board_updateDate}</td>
			</tr>
			<tr>
				<td width="15%"><img
					src="../resources/images/community/heart.png" alt="..."
					width="14px" height="13px">&nbsp;&nbsp;${listView.good}</td>
				<td width="15%"><img
					src="../resources/images/community/reply.png" alt="..."
					width="14px" height="13px">&nbsp;&nbsp;1</td>
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


<%@include file="../layout/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value = "${result}"/>';
	});
</script>
</body>
</html>