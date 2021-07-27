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

.line {
	border-bottom: 1px solid black;
}

.table1 {
	margin-left:15px;
	margin-right: 15px;

}

input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 470px;
	height: 30px;
	font-size: 15px;
}

textarea {
	 height: 300px;
  box-sizing: border-box;
  border: 2px solid white;
  border-radius: 4px;
  background-color: white;
  font-size: 16px;
  resize: none;
  width:470px;
  }

.btn_submit {
	background-image: url('../resources/images/community/submit.png');
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 35px;
	cursor: pointer;
	outline: 0;
	float: right;
	margin-top: 16px;
	margin-bottom: 10px;
	margin-right: 10px;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

.attach {
	width: 42px;
	height: 42px;
	margin-left: 10px;
	
}

input[type=text] {
	width: 470px;
	
	margin: 8px 0;
	box-sizing: border-box;
}


textarea {
	padding: 12px 0px;
	box-sizing: border-box;
	border: 2px solid white;
	border-radius: 4px;
	background-color: white;
	font-size: 16px;
	resize: none;
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
	width: 110px;
	height : 100px;
} 
.button{
background-color : white;
border : 0;
outline : 0;
cursor : pointer;
}
</style>
<%@include file="../layout/header2.jsp"%>
<div class="carousel-item active"></div>

<form role="form" action="/notice/register" method="post">
	

	<input type="submit" value="" class="btn_submit">
	
		     
	<table class="table1">

		<tr>
			<td style="font-weight: bold;"><input type="text" name="noticeTitle" style = "font-size: 20px; margin-top:33px"
				placeholder = "제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #dddbdb; width :470px;">
			<input type="hidden" name="userId" value='<sec:authentication
				property = "principal.username"/>' ></td>
		</tr>
		<tr>
			<td><textarea name="noticeContent" placeholder = "내용을 입력해주세요" style = "border-bottom: 1px solid #dddbdb;"><c:out
						value="${notice.noticeContent }" /></textarea></td>
		</tr>


	</table>
		<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
	
	</form>
</body>
</html>