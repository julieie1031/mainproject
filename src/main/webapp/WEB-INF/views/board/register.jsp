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

.line {
	border-bottom: 1px solid black;
}

.table1 {
	border-top: 1px solid #444444;
	border-bottom: 1px solid #444444;
}

input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 500px;
	height: 30px;
	font-size: 15px;
}

textarea {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	width: 500px;
	height: 50px;
	resize: none;
	font-size: 15px;
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
	margin-top: 30px;
	margin-bottom: 10px;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}
</style>


<%@include file="../layout/header.jsp"%>
<div class="carousel-item active"></div>

<form role="form" action="/board/register" method="post">
	<!-- <img src="../resources/images/community/submit.png" alt="..."
		width="40px" height="40px" align="right" class = "img1" type = "submit"> -->

	<input type="submit" value="" class="btn_submit">

	<table class="table1">
		<tr>
			<td height=50><input type="text" name="title"
				placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td><textarea style="height: 300px" name="content"
					placeholder="내용을 입력해주세요"></textarea></td>
		</tr>

		<tr>
			<td><input type="text" name="userId" placeholder="작성자를 입력해주세요"></td>
		</tr>

	</table>

	<input type=file name='file1' style='display: none;'> <input
		type='text' name='file2' id='file2'> <img
		src='../resources/images/community/attach.png' width="60px"
		height="60px" style="margin-left: 10px" border='0'
		onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>


</form>
</body>
</html>