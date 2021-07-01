<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
* {
	margin: 0;
	padding: 0;
}

.table-x {
margin-left: 15px;
	height: 300px;
	width: 460px;
}

.jb-x-small {
	font-size: x-small;
}

.jb-medium {
	font-size: medium;
}

.text-a {
	text-align: left;
}

.text-b {
	text-align: right;
}

a {
	text-decoration-line: none;
	color: black;
}
</style>

<%@include file="layout/header2.jsp"%>

<div>
	<c:forEach var="vo" items="${room}">
		<table>

			<tr>
				<td><img src="../resources/images/hotel/${vo.roomImage}"
					width="495" height="300"></td>
		</table>


		<table class="table-x">
			<!-- style="height: 300px; width: 460px;" -->
			<tr align="center">
				<td colspan="5" class="text-a"><br> <b>${vo.roomName}</b><br>
					<br> <br>
					<hr> <br> <small class="jb-medium"><b>객실정보</b></small></td>
			</tr>

			<tr align="center">
				<td rowspan="3"><img src="../resources/images/hotel/${vo.roomImage}"
					width="120" height="110"></td>
			</tr>
			<tr align="center">
				<td>${vo.roomDescription}</td>
			</tr>
			<tr>
				<td class="text-b">${vo.roomPeople}<br>${vo.roomPrice}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<form name="form1" method="get" action="">
						<%--    	<input type="hidden" name="id" value="${id}">
                                <input type="hidden" name="restId" value="${vo.restId}"> --%>
						<input type="submit" value="예약하기">
					</form> <a href="javascript:history.back();">이전으로</a>
				</td>
			</tr>

		</table>
	</c:forEach>

</div>


<%@include file="layout/footer.jsp"%>
</body>
</html>