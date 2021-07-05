<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.log {
	position: relative;
	bottom: 380px;
	margin: 20px;
	left: 85px;
	font-family: 'S-CoreDream-3Light';
	font-size: 15px;
}

#logout {
	width: 290px;
	display: block;
	padding: 12px;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #F49999;
}

#withdrawal {
	width: 290px;
	display: block;
	padding: 12px;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #DDDDDD;
}

.reserve {
	position: relative;
	bottom: 520px;
	left: 89px;
	width: 320px;
	display: block;
	height: 60px;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #FFFFFF;
	border: 3.5px solid #77A26B;
	border-radius: 3px;
}

.reserve_text {
	position: relative;
	top: 18.5px;
	left: 27px;
	font-size: 16px;
	font-weight: bold;
	color: #808080;
}

.reserve_arrow {
	position: relative;
	bottom: 529px;
	left: 272px;
	width: 22px;
	height: 28px;
}

.name {
	font-size: 26px;
	font-weight: bold;
	position: relative;
	top: 50px;
	left: 170px;
}

.profile {
	position: relative;
	bottom: 460px;
	left: 50px;
}
.modify{
	position: relative;
	top: 120px;
	left: 170px;
	font-size: 26px;
	z-index : 100;
}

.modify input[value="회원정보수정  >"] {
  font-family: 'S-CoreDream-3Light';
  font-weight: bold;
  color: #808080;
}
</style>
</head>

<%@include file="../layout/header2.jsp"%>
<c:url var="modifyPath" value="userModify" />
		<f:form modelAttribute="vo" action="${ modifyPath }" method="get">
	<div class="modify">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="submit" value="회원정보수정  >" style="border: none; cursor:pointer; background-color: #FFFFFF;">
	</div>
</f:form>

<p class="name">
	<sec:authentication property="principal.username" />
</p>

<div class="profile">
	<img src="../resources/images/prodog.png" style="width: 100px; height: 100px;">
</div>

<form action="/users/reserve" method="POST">
	<div class="reserve">
		<p class="reserve_text">예약 현황</p>
		<img src="../resources/images/click.png" class="reserve_arrow">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="submit" value="" style="border: none; cursor:pointer; z-index: 200;">
	</div>
</form>

<form action="/users/logout" method="POST">
	<div class="log">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="submit" id="logout" value="LOGOUT" style="border: none; cursor:pointer;">
	</div>
</form>

<form action="/users/withdrawal" method="POST">
	<div class="log">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="submit" id="withdrawal" value="회원탈퇴" style="border: none; cursor:pointer;">
	</div>
</form>

<%@include file="../layout/footer.jsp"%>

</html>