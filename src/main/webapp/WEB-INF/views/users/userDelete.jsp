<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#delete {
	width: 290px;
	display: block;
	padding: 12px;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #F49999;
}
.pwd {
    position: relative;
    top: 180px;
    font-size: 15px;
    font-weight: bold;
    left: 90px;
}
.log {
top: 350px;
	position: relative;
    left: 105px;
    font-family: 'S-CoreDream-3Light';
    font-size: 15px;
}
#userPwd {
	font-family: 'S-CoreDream-3Light';
	width: 300px;
	display: block;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 20px 0 20px 0;
}
.pwd2 {
    position: relative;
    font-size: 20px;
    font-weight: bold;
    left: 125px;
}

</style>
</head>
<body>
<%@include file="../layout/header2.jsp"%>

<form action="/delete" method = "POST">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
 	<div>
 		<input type="hidden" id="userId" name="userId" value="<sec:authentication property='principal.username'/>" readonly/>
 	</div>
 	
 	<div class = "pwd">
 		<p class = "pwd2">비밀번호</p>
 		<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호 입력" style="border: none;" />
 	</div>
 	
 	<div class = "log">
 		
 		<input type="submit" id="delete" value="회원탈퇴" style="border: none;" data-toggle="modal" data-target="#exampleModal">
 	</div>

</form>


	<!-- footer 끝 -->

	<div class="footer">
		<div class="bottom_bar">
			<ul>
				<li><a href="/category"><img
						src="/resources/images/category.png"></a></li>
				<li><a href="/hotel/list"><img src="/resources/images/hotel.png"></a></li>
				<li><a href="/main"><img src="/resources/images/logo2.png"></a></li>
				<li><a href="/board/list"><img
						src="/resources/images/community.png"></a></li>
				<li><a href="/${path}users/login"><img src="/resources/images/login.png"></a></li>
			</ul>


		</div>
	</div>


	</div>
</body>
<!-- <script>
	function clickDel(formName) {
		formName.action = "/delete";
		formName.method = "post";
		formName.submit();
	}
	
</script> -->
</html>