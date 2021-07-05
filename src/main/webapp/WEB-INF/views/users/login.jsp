<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>



<script>
	
	function back() {
	     history.back(); //방법 2


	}
</script>


<style>
/* .homie {
	position: relative;
	bottom: 400px;
	left: 185px;
}

.back {
	position: relative;
	bottom: 1070px;
	left: 15px;
} */

.centerlogo {
	display: block;
    position: relative;
    bottom: 320px;
    left: 130px;
}

#userId {
	font-family: 'S-CoreDream-3Light';
	width: 300px;
	display: block;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 20px 0 20px 0;
}

#userPwd {
	font-family: 'S-CoreDream-3Light';
	width: 300px;
	display: block;
	padding: 17px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 25px 0 25px 0;
}

.idpw {
    display: block;
    position: relative;
    bottom: 450px;
    font-size: 15px;
    font-weight: bold;
    left: 85px;
}

input::placeholder {
	color: #EEEEEE;
}

.log {
	position: relative;
    bottom: 380px;
    left: 105px;
    font-family: 'S-CoreDream-3Light';
    font-size: 15px;
}

#login {
	width: 290px;
	display: block;
	padding: 12px;
	margin: 25px 0 25px 0;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #77A26B;
}

#join {
	width: 290px;
	display: block;
	padding: 12px;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #DDDDDD;
}

a {
	text-decoration: none;
}
.header2 img{
	display:block;
	float:left;
}
</style>
</head>
<%@include file="../layout/header2.jsp"%>

<!-- 
		<div class="homie">
			<img src="/resources/images/logo.png" width="150" height="150">
		</div>
		<div class="back">
			<a href="/main"><img src="/resources/images/back.png" width="60"
				height="60"></a>
		</div> -->
		<%-- <form action="<c:url value='/mypage' />" method="post"> --%>
		<form action="/login" method="post">
			<div class="centerlogo">
				<img src="/resources/images/logo4.png" width="250" height="250">
			</div>
			<div class="idpw">
				<p>아이디</p>
				<input type="text" id="userId" name="username" placeholder="ID"
					style="border: none">
				<p>비밀번호</p>
				<input type="password" id="userPwd" name="password"
					placeholder="PASSWORD" style="border: none">
			</div>

			<div class="log">
				<input type="submit" id="login" value="LOGIN" style="border: none;">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</div>

		</form>
		<div class="log">

			<a href="/join"><input type="submit" id="join" value="JOIN"
				style="border: none;"></a>
		</div>

<%@include file="../layout/footer.jsp"%>

</body>
</html>