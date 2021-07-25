<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.nTitle {
	margin-left: 23px;
	margin-bottom: 100px;
	font-size: 20px;
}

.nContent {
	margin-left: 23px;
}
</style>
<script>
	$(document).ready(function() {

	})
</script>
<body>
	<%@include file="../layout/header2.jsp"%>

	<!-- --------------------------헤더-------------------------------- -->

	<form role="form" action="/notice/register" method="post">
		<table>
		<tr>
			<td><textarea rows="1" cols="40" placeholder="제목을 입력하세요" class="nTitle"
				name="noticeTitle"></textarea></td></tr>
			<tr><td><textarea cols="60" rows="10" placeholder="내용을 입력하세요"
				class="nContent" name="noticeContent"></textarea></td></tr>
		</table>
			<input type="hidden" class="NuserId" name="userId"
				value='<sec:authentication
				property = "principal.username"/>'
				readonly="readonly">
		<button type='submit' class='btn btn-default'>Submit</button>
		<button type='reset' class='btn btn-default'>Reset</button>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

	</form>

	<%@include file="../layout/footer.jsp"%>
</body>
</html>