<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>My Page</h1>
<form action="/users/logout" method = "POST">
<input type = "hidden" name = "${_csrf.parameterName }" value= "${_csrf.token }">
<button>로그아웃</button>
</form>
<!-- <a href = "/users/logout">LOG OUT</a> -->
</body>
</html>